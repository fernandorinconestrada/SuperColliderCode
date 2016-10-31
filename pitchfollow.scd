(
SynthDef(\pitchfollow, { |att_time = 0.05, rel_time = 0.05|
	var in, amp, freq, hasFreq, out, formant, delay;
	in = SoundIn.ar(0);
	amp = Amplitude.kr(in, att_time, rel_time); //convergence time in dB
	# freq, hasFreq = Pitch.kr(in, ampThreshold: 0.02, median: 7);
	formant = MouseY.kr(1000, 2000, 0, 0.2);
	delay = MouseX.kr(0, 3, 0, 0.2);
	out = CombC.ar(LPF.ar(in, 4000), 0.1, delay, -4);
	out = Formant.ar(freq, formant, freq * formant.range(1.5, 3), 0.2);
	Out.ar([0, 1], out);
}).load(s);
)

(
b = Buffer.read(s,"/Users/fernandorincon/Music/Field Recordings/liso_frag_mono.wav");
b.plot;

SynthDef(\pitchfollow2, { |att_time = 0.05, rel_time = 0.05, bufnum, rate = 1|
	var in, amp, freq, hasFreq, out, formant, delay;
	//in = SoundIn.ar(0);
	in = PlayBuf.ar(1, bufnum, rate, 1, 0, 1);
	amp = AmplitudeMod.kr(in, att_time, rel_time); //convergence time in dB
	# freq, hasFreq = Pitch.kr(in, 440, 400, 500, ampThreshold: 0.02, median: 7);
	formant = MouseY.kr(1000, 2000, 0, 0.2);
	delay = MouseX.kr(0, 3, 0, 0.2);
	out = Formant.ar(freq, formant, freq * formant.range(1.5, 3), 0.2);
	out = CombC.ar(LPF.ar(out, 4000), 0.1, delay, -4);
	Out.ar([0, 1], out);
}).load(s);
)
//loud
a = Synth(\pitchfollow2, [\bufnum, b]);
a.set(\median, 3);
a.set(\ampThreshold, 0.02);
a.set(\rel_time, 0.2, \att_time, 0.2);

c = Synth(\pitchfollow);
c.set(\median, 3);
c.set(\ampThreshold, 0.02);
c.set(\rel_time, 0.2, \att_time, 0.2);
