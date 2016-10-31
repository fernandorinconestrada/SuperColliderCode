Server.local.makeGui;
Server.internal.makeGui;
s.boot;
(
SynthDef(\fm_OSC_A, { |dens, ampTr = 0.2, dur, carfreq, modfreq, index, pan, envbuf = -1, amp, maxDel = 0.4, delT = 0.4, decay = 0.5, mul = 0.3, cutoff = 19000, attEnv = 0.01, decEnv = 0.02|
	var trig, in, filter, env, locut;
	trig = Dust.kr(dens, ampTr.lag(1));
	in = GrainFM.ar(2, trig, dur.lag(1.5), carfreq.lag(1.5), modfreq.lag(1.5), index.lag(1), pan, envbuf, mul: amp.lag(2));
	filter = AllpassC.ar(in, maxDel, delT.lag(1), decay, mul.lag(2));
	env = Decay2.ar(filter, attEnv, decEnv, 0.4);
	locut = HPF.ar(env, 100);
	OffsetOut.ar(0, LPF.ar(locut, cutoff))
}).send(s);
)
a = Synth(\fm_OSC_A);
(
OSCdef(\dens, {|msg, time, addr, recvPort| a.set(\dens, (msg[1]*20).postln)},"/dens_ind/1", nil, 57121);
OSCdef(\ampTr, {|msg, time, addr, recvPort| a.set(\ampTr, (msg[1]*0.6).postln)},"/ampT_GlobAmp/1", nil, 57121);
OSCdef(\dur, {|msg, time, addr, recvPort| a.set(\dur, ((msg[1]*0.12) + 0.01).postln)},"/dur", nil, 57121);
OSCdef(\carfreq, {|msg, time, addr, recvPort| a.set(\carfreq, (msg[1]*1950 + 50).postln)},"/car_mul/1", nil, 57121);
OSCdef(\modfreq, {|msg, time, addr, recvPort| a.set(\modfreq, (msg[2]*1150).postln)},"/car_mul/1", nil, 57121);
OSCdef(\index, {|msg, time, addr, recvPort| a.set(\index, (msg[2]*30).postln)},"/dens_ind/1", nil, 57121);
OSCdef(\pan, {|msg, time, addr, recvPort| a.set(\pan, ((msg[1]* 2) - 1).postln)},"/pan_amp/1", nil, 57121);
OSCdef(\amp, {|msg, time, addr, recvPort| a.set(\mul, (msg[2]*0.6).postln)},"/pan_amp/1", nil, 57121);
OSCdef(\delT, {|msg, time, addr, recvPort| a.set(\delT, (msg[1]*0.2).postln)},"/del_decay/1", nil, 57121);
OSCdef(\decay, {|msg, time, addr, recvPort| a.set(\decay, (msg[2]*0.4).postln)},"/del_decay/1", nil, 57121);
OSCdef(\mul, {|msg, time, addr, recvPort| a.set(\amp, (msg[2]*0.6).postln)},"/ampT_GlobAmp/1", nil, 57121);
)
(
~envBuffer = Buffer.alloc(s, 1024);
(
OSCdef(\env0, {|msg, time, addr, recvPort| d = msg[1].postln; ~updateFunc.value;},"/env_buf/1", nil, 57121);
OSCdef(\env1, {|msg, time, addr, recvPort| e = msg[1].postln; ~updateFunc.value;},"/env_buf/2", nil, 57121);
OSCdef(\env2, {|msg, time, addr, recvPort| f = msg[1].postln; ~updateFunc.value;},"/env_buf/3", nil, 57121);
OSCdef(\env3, {|msg, time, addr, recvPort| g = msg[1].postln; ~updateFunc.value;},"/env_buf/4", nil, 57121);
OSCdef(\env4, {|msg, time, addr, recvPort| h = msg[1].postln; ~updateFunc.value;},"/env_buf/5", nil, 57121);
OSCdef(\env5, {|msg, time, addr, recvPort| i = msg[1].postln; ~updateFunc.value;},"/env_buf/6", nil, 57121);
OSCdef(\env6, {|msg, time, addr, recvPort| j = msg[1].postln; ~updateFunc.value;},"/env_buf/7", nil, 57121);
OSCdef(\env7, {|msg, time, addr, recvPort| k = msg[1].postln; ~updateFunc.value;},"/env_buf/8", nil, 57121);
OSCdef(\env8, {|msg, time, addr, recvPort| l = msg[1].postln; ~updateFunc.value;},"/env_buf/9", nil, 57121);
OSCdef(\env9, {|msg, time, addr, recvPort| m = msg[1].postln; ~updateFunc.value;},"/env_buf/10", nil, 57121);
~updateFunc = {
~values = FloatArray.with(d , e, f, g, h, i, j, k, l, m);
	~values.postln;
~env = Env.new(~values, Array.fill(9, {1024/(9.0*44100)}), \lin);
~envBuffer.sendCollection(~env.discretize);
};
);
a.set(\envbuf, ~envBuffer);
)

~env.plot;
x = FreqScope.new;
s.prepareForRecord("/Users/fernandorincon/Music/SuperCollider Recordings/ImprovGrainInst/march11.aiff");
s.record;
s.stop;