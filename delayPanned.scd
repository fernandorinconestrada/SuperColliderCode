play{ Pan2.ar(AllpassC.ar(Impulse.ar(1), 2, 1, 0.5), SinOsc.kr(0.2) ) };

play{ Pan2.ar(AllpassC.ar(Impulse.ar(0.2), 0.4, 0.2, 0.5), SinOsc.kr(5).poll) };

(
SynthDef(\imp, { |busOut, freqs = #[1, 1, 1, 1], freqImp, durDel, freqPan, delT, decT|
	OffsetOut.ar(busOut, AllpassC.ar(Pan2.ar(Klank.ar(`[[freqs], [0.4, 0.3, 0.2, 0.1], [0.5, 0.6, 0.7, 0.5]], Impulse.ar(freqImp, 0, XLine.kr(1, 0.0001, durDel, doneAction: 2))), SinOsc.kr(freqPan)), 2.0, delT, decT)) ;
}).add;
)

a = Synth(\imp, [\bus, 0, \freq, 3, \dur, 1]);
(
w =  Pbind(
	\instrument, \imp,
	\busOut, 0,
	\freqs, Pfunc( {rrand(400.0, 600.0)}),
	\freqImp, 5,
	\durDel, 1,
	\freqPan, 20.2,
	\delT, 0.2,
	\decT, 0.5
).play;
)
w.stop;
w.play;

	