Server.local.makeGui;
Server.internal.makeGui;
s.boot;

(
SynthDef(\fm_osc, { arg dur = 0.001, carfreq = 440, modfreq = 220, index = 1, pan = 0,
	freq_trig = 10, amp_env =1, gate = 1, amp = 0.0001, envbuf = -1,
	max_delay = 1, del_time = 0.4, decay = 1.5, mul = 1,
	spread = 1, level = 0.5, center = 0;
	var trigger, env, in, out;
	trigger = Dust.kr(freq_trig);
	env = EnvGen.kr(
        Env([0, 1, 0], [1, 1], \sin, 1),
        gate,
        levelScale: amp_env,
        doneAction: 2);
	in = GrainFM.ar(2, trigger, dur, carfreq, modfreq, index, pan, envbuf, mul: amp) * env;
	Out.ar(0,
		Splay.arFill(10,
			{ |i| CombC.ar(in, max_delay, del_time, decay, mul)},
			spread, level, center));
}).send(s);
)

x= Synth(\fm_osc);

(
OSCdef(\dur, {|msg, time, addr, recvPort| x.set(\dur, (msg[1]*0.3).postln)},"/dur", nil, 57121);//size in seconds range 0 to 0.3 secs
OSCdef(\carfreq, {|msg, time, addr, recvPort| x.set(\carfreq, (msg[1]*8000 + 20).postln)}, "/car_mul/1", nil, 57121);//range in hertz 20 -4000Hz
OSCdef(\modfreq, {|msg, time, addr, recvPort| x.set(\modfreq, (msg[2]*300 + 20).postln)}, "/car_mul/1", nil, 57121);//range in hertz 20 -4000hz
OSCdef(\index, {|msg, time, addr, recvPort| x.set(\index, (msg[2]*70).postln)}, "/dens_ind/1", nil, 57121); //integer, range 0-10
OSCdef(\freq_trig, {|msg, time, addr, recvPort| x.set(\freq_trig, (msg[1]*30 ).postln)}, "/dens_ind/1", nil, 57121); //range 0 to 50
OSCdef(\pan, {|msg, time, addr, recvPort| x.set(\pan, ((msg[2]*2) -1).postln)}, "/pan_amp/1", nil, 57121); //range -1 to 1
OSCdef(\amp, {|msg, time, addr, recvPort| x.set(\amp, msg[1].postln)}, "/pan_amp/1", nil, 57121); //button
OSCdef(\delay, {|msg, time, addr, recvPort| x.set(\del_time, msg[1].postln)}, "/time_decay/1", nil, 57121); //range 0 -1
OSCdef(\decay, {|msg, time, addr, recvPort| x.set(\decay, (msg[2]*4).postln)}, "/time_decay/1", nil, 57121); //range 0 -1
OSCdef(\mul, {|msg, time, addr, recvPort| x.set(\mul, msg[1].postln)}, "/mul", nil, 57121); //range 0 -1
OSCdef(\spread, {|msg, time, addr, recvPort| x.set(\decay, (msg[1]).postln)}, "/spread_center/1", nil, 57121); //range 0 -1
OSCdef(\center, {|msg, time, addr, recvPort| x.set(\mul, msg[2].postln)}, "/spread_center/1", nil, 57121); //range 0 -1
OSCdef(\center, {|msg, time, addr, recvPort| x.set(\level, msg[1].postln)}, "/level", nil, 57121); //range 0 -1
)

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
)

~envBuffer = Buffer.alloc(s, 1024);
x.set(\envbuf, ~envBuffer);


x.stop;