(
SynthDef(\dynKlankNoise, { |freq = 0.3, attack = 2, pos = 0, freqCue = 0.5, freqOsc = 0.001, cue = 0.001|
    var freq1, freq2, freq3, ring1, ring2, ring3, amp1, amp2, amp3, scale, pan, osc, peak, signal;
	freq1 = LFNoise0.kr(attack).range(1, 3) * 200;
	freq2 = LFNoise0.kr(attack).range(1, 3) * 600;
	freq3 = LFNoise0.kr(attack).range(1, 3) * 1800;
    ring1 = LFNoise0.kr(attack).range(0.1, 0.4);
	ring2 = LFNoise0.kr(attack).range(0.2, 0.6);
	ring3 = LFNoise0.kr(attack).range(0.3, 0.8);
	amp1 = LFNoise0.kr(attack).range(0.1, 0.3);
	amp2 = LFNoise0.kr(attack).range(0.1, 0.3);
	amp3 = LFNoise0.kr(attack).range(0.1, 0.3);
	scale = SinOsc.kr(freq).range(0.2, 0.6);
	//cue = SinOsc.kr(freqCue).range(0.001, 0.002);
	peak = Control.names(\peak).kr(440);
	osc = SinOsc.kr(freqOsc)*peak;
	signal = DynKlank.ar(`[[freq1, freq2, freq3], [amp1, amp2, amp3], [ring1, ring2, ring3]], Impulse.ar(attack, 0, 0.1), decayscale: scale);
	pan = Pan2.ar(signal, pos);
	OffsetOut.ar(0, BBandPass.ar(pan, osc.abs, cue, 1));
}).add;
)

a = Synth(\dynKlankNoise, [\attack, 440, \freqOsc, 0.01, \peak, 440]);
a.set(\attack, 440);
a.set(\freqCue, 0.02);
a.set(\freqOsc, 0.01);

b = Synth(\dynKlankNoise, [\attack, 660, \freqOsc, 0.011, \peak, 660]);
b.set(\attack, 660);
b.set(\freqCue, 0.023);
b.set(\freqOsc, 0.011);
b.setn(\peak, 660);

c = Synth(\dynKlankNoise, [\attack, 1320, \freqOsc, 0.013, \peak, 1320]);
c.set(\attack, 1320);
c.set(\freqCue, 0.019);
c.set(\freqOsc, 0.011);
c.setn(\peak, 1320);
x = FreqScope.new;