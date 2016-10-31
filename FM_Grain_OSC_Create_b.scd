Server.local.makeGui;
Server.internal.makeGui;
s.boot;
~thirt = Array.fill( 8, { |deg| 110*(3**(deg/13)) } );
(
SynthDef(\fm_osc, { arg dur = 0.001, carfreq = 440, modfreq = 220, index = 1, pan = 0,
	freq_trig = 10, amp_env =1, gate = 1, amp = 0.0001, envbuf = -1,
	max_delay = 1, del_time = 0.4, decay = 1.5, mul = 1,
	spread = 1, level = 0.5, center = 0, fr_saw = 20, ipha = 2, amp_saw = 0.5, amp_conv = 0.5, mix_a = 1, mix_b= 0;
	var trigger, env, in, out, kernel, filter, cutoff;
	cutoff = MouseX.kr(4000, 6000, lag:0.2);
	trigger = Dust.kr(freq_trig);
	env = EnvGen.kr(
        Env([0, 1, 0], [1, 1], \sin, 1),
        gate,
        levelScale: amp_env,
        doneAction: 2);
	kernel = Impulse.ar(fr_saw, ipha, amp_saw);
	kernel = DynKlank.ar(`[[~thirt], nil, nil], kernel);
	in = GrainFM.ar(2, trigger, dur, carfreq, modfreq, index, pan, envbuf, mul: amp) * env;
	in = CombC.ar(in, max_delay, del_time, decay, mul);
	filter = LPF.ar(in, cutoff);
	a = Out.ar(0,
		Splay.arFill(10,
			Convolution.ar(filter, kernel, 1024, amp_conv),
			spread, level, center));
	Mix.new([a * mix_a , filter * mix_b]);
}).send(s);
)
//FrequencyLFSaw = /2/fader1/
x= Synth(\fm_osc);
x.trace;
x.free;


(
OSCdef(\dur, {|msg, time, addr, recvPort| x.set(\dur, msg[1].postln)},"/dur", nil, 57121);//size in seconds range 0 to 0.3 secs
OSCdef(\carfreq, {|msg, time, addr, recvPort| x.set(\carfreq, msg[1].postln)}, "/car_mul/1", nil, 57121);//range in hertz 20 -4000Hz
OSCdef(\modfreq, {|msg, time, addr, recvPort| x.set(\modfreq, (msg[2]/2).postln)}, "/car_mul/1", nil, 57121);//range in hertz 20 -4000hz
OSCdef(\index, {|msg, time, addr, recvPort| x.set(\index, (msg[2]*50).postln)}, "/dens_ind/1", nil, 57121); //integer, range 0-10
OSCdef(\freq_trig, {|msg, time, addr, recvPort| x.set(\freq_trig, (msg[1]*10 ).postln)}, "/dens_ind/1", nil, 57121); //range 0 to 50
OSCdef(\pan, {|msg, time, addr, recvPort| x.set(\pan, ((msg[2]*2) -1).postln)}, "/pan_amp/1", nil, 57121); //range -1 to 1
OSCdef(\amp, {|msg, time, addr, recvPort| x.set(\amp, msg[1].postln)}, "/pan_amp/1", nil, 57121); //button
OSCdef(\delay, {|msg, time, addr, recvPort| x.set(\del_time, msg[1].postln)}, "/time_decay/2", nil, 57121); //range 0 -1
OSCdef(\decay, {|msg, time, addr, recvPort| x.set(\decay, (msg[2]*3).postln)}, "/time_decay/2", nil, 57121); //range 0 -1
OSCdef(\mul, {|msg, time, addr, recvPort| x.set(\mul, msg[1].postln)}, "/mul", nil, 57121); //range 0 -1
OSCdef(\spread, {|msg, time, addr, recvPort| x.set(\spread, (msg[1]).postln)}, "/spread_center/1", nil, 57121); //range 0 -1
OSCdef(\center, {|msg, time, addr, recvPort| x.set(\center, msg[2].postln)}, "/spread_center/1", nil, 57121); //range 0 -1
OSCdef(\level, {|msg, time, addr, recvPort| x.set(\level, msg[1].postln)}, "/level", nil, 57121); //range 0 -1
OSCdef(\fr_saw, {|msg, time, addr, recvPort| x.set(\fr_saw, (msg[1]*20 + 0.2).postln)}, "/2/fader1", nil, 57121); //range 20-2000
OSCdef(\iphase, {|msg, time, addr, recvPort| x.set(\ipha, (msg[1]*2).postln)}, "/2/fader2", nil, 57121); //range 0.1
OSCdef(\amp_kernel, {|msg, time, addr, recvPort| x.set(\amp_saw, msg[1].postln)}, "/2/fader3", nil, 57121); //range 0.1
OSCdef(\amp_conv, {|msg, time, addr, recvPort| x.set(\amp_conv, msg[1].postln)}, "/2/fader4", nil, 57121); //range 0.1
OSCdef(\mix_a, {|msg, time, addr, recvPort| x.set(\mix_a, msg[1].postln)}, "/2/fader5", nil, 57121); //range 0.1
OSCdef(\mix_b, {|msg, time, addr, recvPort| x.set(\mix_b, msg[1].postln)}, "/2/fader6", nil, 57121); //range 0.1
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


