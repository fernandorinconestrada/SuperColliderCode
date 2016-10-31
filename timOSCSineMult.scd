(
(
SynthDef(\testEnvA, { |freq1 = 440, freq2 = 440, freq3 = 440, amp1 = 0.1, amp2 =0.1, amp3 = 0.1, bw, res = #[0,0,0,0], ring = #[0,0,0,0], ampring = #[0,0,0,0], decDyn = 0.1, density = 1, ampD = 0.8|
	var in, env, freqForm, globAmp, limit, decay, send, out;
	globAmp = MouseX.kr(0.01, 0.3, lag: 0.2);
	freqForm = MouseY.kr(1200, 1800, lag:0.2);
	env =  EnvGen.kr(Env.perc, Dust.kr(density, ampD));
	in = (FSinOsc.ar(freq1, 0, amp1.lag(0.5)) * FSinOsc.ar(freq3, 0, amp3.lag(0.5)) * Formant.ar(freq2,freqForm, bw, amp2.lag(0.5)));
	decay =  Decay2.ar(in, 0.01, 4.0, 0.4);
	limit = Limiter.ar(DynKlank.ar(`[res, ampring, ring], in, decayscale: decDyn ) * env, 0.4, 0.02);
	send = SendPeakRMS.kr(limit, 20, 3, '/reply') * 2.0;
	out = LPF.ar(limit, 18000);
	Out.ar(0, out * globAmp);
}).load(s);
);
g = Synth(\testEnvA, [\res, [500,1400, 4000, 5400], \ampring, [ 0.2, 0.3, 0.3, 0.2], \ring, [ 0.4, 0.8, 1.0, 1.2]]);

(
OSCdef(\freq1, {|msg, time, addr, recvPort| g.set(\freq1,(msg[1].abs * 200 + 20).postln)}, "/1/joint/l_hand", nil, 8008);
//OSCdef(\freq2, {|msg, time, addr, recvPort| g.set(\freq2, (msg[2]*100+50).postln)}, "/1/joint/l_hand", nil, 8008);
OSCdef(\freq3, {|msg, time, addr, recvPort| g.set(\freq3,((msg[3]*0.3) * 500 + 100).postln)}, "/1/joint/l_hand", nil, 8008);

OSCdef(\freq2, {|msg, time, addr, recvPort| g.set(\freq2,(msg[1].abs * 200 + 20).postln)}, "/1/joint/head", nil, 8008);
OSCdef(\bw, {|msg, time, addr, recvPort| g.set(\bw, (msg[2]*300).postln)}, "/1/joint/head", nil, 8008);


OSCdef(\amp1, {|msg, time, addr, recvPort| g.set(\amp1,(msg[1].abs * 0.4).postln)}, "/1/joint/r_hand", nil, 8008);
OSCdef(\amp2, {|msg, time, addr, recvPort| g.set(\amp2, (msg[2].abs * 0.3).postln)}, "/1/joint/r_hand", nil, 8008);
OSCdef(\amp3, {|msg, time, addr, recvPort| g.set(\amp3, (msg[3].abs*0.2).postln)}, "/1/joint/r_hand", nil, 8008);

OSCdef(\density, {|msg, time, addr, recvPort| g.set(\density, (msg[1].abs * 1.2).postln)}, "/1/joint/r_foot", nil, 8008);
OSCdef(\ampD, {|msg, time, addr, recvPort| g.set(\ampD.abs, (msg[2].abs *0.7).postln)}, "/1/joint/r_foot", nil, 8008);
OSCdef(\decDyn, {|msg, time, addr, recvPort| g.set(\decDyn, (msg[3]*0.4).postln)}, "/1/joint/r_foot", nil, 8008);
);

(
n = NetAddr("192.168.1.1", 9000);
o = OSCFunc({ |msg| n.sendMsg("/rms", 0, msg[4]);"peak: %, rms: %".format(msg[3], msg[4]).postln}, '/reply');
n.sendMsg("/connect", 0, "l_elbow", 0.9, 0.9, 0.0);// color
);
)
g.setn( \res, Array.rand(4, 400, 2000), \ampring, Array.rand(4, 0.2, 0.4), \ring, Array.rand(4, 0.3, 1.3) );

o = OSCFunc({ |msg| n.sendMsg("/rms", 0, msg[4]=0).postln}, '/reply');