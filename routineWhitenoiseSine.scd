s = Server.local.makeGui;

(
SynthDef(\noiseSine, { |freq1a = 440, freq1b = 440, freq2a = 440, freq2b = 440, freq3a = 440, freq3b = 440, freq4a = 440,freq4b = 440, cue1 = 0.001, cue2 = 0.001, cue3 = 0.001, cue4 = 0.001, amp1 = 0.8, amp2 = 0.8, cut1, cut2, att = 0.01, rel = 0.3, density = 1, ampEnv = 1, maxDel = 0.2, delT = 0.1, decT = 0.4, ampF 0.6|
	var sin1, sin2, sin3, sin4, mix, env;
	env = EnvGen.kr(Env.perc(att, rel, curve: \sine), Impulse.kr(density, 0, ampEnv));
	sin1 = LPF.ar(BBandPass.ar(WhiteNoise.ar(1.0), freq1a, cue1, amp1), cut1) + LPF.ar(BBandPass.ar(WhiteNoise.ar(1.0), freq1b, cue1, amp1), cut1);
	sin2 = LPF.ar(BBandPass.ar(WhiteNoise.ar(1.0), freq2a, cue2, amp1), cut1) + LPF.ar(BBandPass.ar(WhiteNoise.ar(1.0), freq2b, cue2, amp1), cut1);
	sin3 = LPF.ar(BBandPass.ar(WhiteNoise.ar(1.0), freq3a, cue3, amp2), cut2) + LPF.ar(BBandPass.ar(WhiteNoise.ar(1.0), freq3b, cue3, amp2), cut2);
	sin4 = LPF.ar(BBandPass.ar(WhiteNoise.ar(1.0), freq4a, cue4, amp2), cut2) + LPF.ar(BBandPass.ar(WhiteNoise.ar(1.0), freq4b, cue4, amp2), cut2);
	mix = Mix.new(sin1 + sin3 + sin2 + sin4) * env;
	Out.ar([0,1], AllpassC.ar(mix, maxDel, delT, decT, ampF));
}).add;
)

(
r = Routine({
	do{
		var delta;
		delta = rrand(1,3) * 10;
		//att = 0.05.rand;
		a = Synth(\noiseSine, [\freq1a, 495, \freq1b, 496, \freq2a, 494.7, \freq2b, 495.3, \freq3a, 755.2893, \freq3b, 755.7893, \freq4a, 754.5893, \freq4b, 756.0893, \cut1, 510, \cut2, 780, \amp1, 1.2, \amp2, 1.2]);
		delta.yield;
		a.set(\density, 3);
		a.set(\att, 0.005, \rel, 0.04, \delT, 0.3 );
		delta.yield;
		a.set(\density, 2);
		a.set(\att, 0.004, \rel, 0.03, \delT, 0.25 );
		delta.yield;
		a.set(\density, 7);
		a.set(\att, 0.003, \rel, 0.02, \delT, 0.2 );
		delta.yield;
		a.set(\att, 0.002, \rel, 0.01, \delT, 0.15 );
	}.fork;
});
)
a.set(\density, 23);
r.play;
r.stop;

d = {loop({ |i=0.9| i + 0.1; 0.3.wait}) }.fork;
d.postln;

f = { |i=0, array| fork { loop { array[i.value].postln; 0.1.wait } } };

a = `0;

f.(a, [0, 1, 2]);

a.value = 2;
d.postln;

rrand(1,3)*2.5