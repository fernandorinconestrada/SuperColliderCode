(
SynthDef(\testSinOsc, { |freqTrig = 1, fund= 55, bus = #[0,1], amps = #[0,0], freqs = #[1,2], mix = 0.5, room = 0.5, damp = 0.5, dur = 1|
	var  trig, env, envDel, fundDev, ampsDev, harm1, harm2;

	trig = Impulse.archiveAsCompileString(freqTrig);
	env = EnvGen.ar(Env([0,0.25,0.25,0], [dur*0.01, dur*0.975, dur*0.01], [-3, 0, 3]), trig);
	envDel = EnvGen.ar(Env([0,0.25,0.25,0], [dur*0.01, dur*0.975, dur*0.01], [-3, 0, 3]), TDelay.ar(trig, dur/2));
	fundDev = LFNoise0.ar(freqTrig);
	ampsDev = LFNoise0.ar(freqTrig);

	harm1 = Mix.new(SinOscFB.ar(fundDev.range(0.995, 1.005)*fund*freqs.at(0),  0.4, ampsDev.range(0.9, 1.0)* amps, Formant.ar(fund, 175, 250, amps*0.2),  Formant.ar(fund, 900, 660, amps*0.08), Formant.ar(fund, 2300, 1400, amps*0.04)));
	harm2 = Mix.new(SinOscFB.ar(fundDev.range(0.995, 1.005)*fund*freqs.at(1),  0.3, ampsDev.range(0.9, 1.0)* amps, Formant.ar(fund, 175, 250, amps*0.2),  Formant.ar(fund, 900, 660, amps*0.08), Formant.ar(fund, 2300, 1400, amps*0.04)));

	OffsetOut.ar(Stepper.kr(trig, 22, 0, 22, 1, bus.at(0)),   FreeVerb.ar(harm1, mix, room, damp))*env;
	OffsetOut.ar(Stepper.kr(trig, 22, 0, 22, 1, bus.at(1)),   FreeVerb.ar(harm2, mix, room, damp))*env;

	OffsetOut.ar(Stepper.kr(TDelay.kr(trig, dur/2), 22, 0, 22, 1, bus.at(0)),   FreeVerb.ar(harm1, mix, room, damp)*envDel);
	OffsetOut.ar(Stepper.kr(TDelay.kr(trig, dur/2), 22, 0, 22, 1, bus.at(1)),   FreeVerb.ar(harm2, mix, room, damp)*envDel);
}).add;
)

~amps = [0.2, 0.4];
~fb = [0.3, 0.4];
a = Synth(\testSinOsc, [\amps, ~amps, \fb, ~fb]);