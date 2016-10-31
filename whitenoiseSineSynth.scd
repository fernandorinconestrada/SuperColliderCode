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
}).load(s);
)

a = Synth(\noiseSine, [\freq1a, 495, \freq1b, 496, \freq2a, 494.7, \freq2b, 495.3, \freq3a, 755.2893, \freq3b, 755.7893, \freq4a, 754.5893, \freq4b, 756.0893, \cut1, 510, \cut2, 780, \amp1, 1.2, \amp2, 1.2]);
a.set(\density, 17);
a.set(\att, 0.001, \rel, 0.04);
a.set(\decT, 0.2);
a.set(\delT, 0.1);
a.free;

b = Synth(\noiseSine, [\freq1a, 973.2362, \freq1b, 972.8362, \freq2a, 973.5362, \freq2b, 972.9362, \freq3a, 1485, \freq3b, 1485.731, \freq4a, 1484.7, \freq4b, 1486, \cut1, 1000, \cut2, 1500, \amp1, 1.0, \amp2, 0.8]);
b.set(\density, 19);
b.set(\att, 0.001, \rel, 0.03);
b.set(\decT, 0.3);
b.set(\delT, 0.13);
b.free;

c = Synth(\noiseSine, [\freq1a, 1758.4487, \freq1b, 1758.0487, \freq2a, 1757.7487, \freq2b, 1758.9487, \freq3a, 3177.1752, \freq3b, 3177.7752, \freq4a, 3177.2752, \freq4b, 3176.0752, \cut1, 1780, \cut2, 3200, \amp1, 1.0, \amp2, 0.8]);
c.set(\density, 13);
c.set(\att, 0.001, \rel, 0.03);
c.set(\decT, 0.3);
c.set(\delT, 0.11);
c.free;
s.recChannels = 1;
s.prepareForRecord("/Users/fernandorincon/Documents/UCSB/Quals/TakeHomeComp/noiseSine/noiseSineDeg4_9rend4.aiff");
s.record;
s.stop;
