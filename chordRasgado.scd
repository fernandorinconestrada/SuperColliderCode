(
SynthDef(\chord, { |partialA = # [0,0,0,0,0], ampA = # [0,0,0,0,0], phaA = #[0,0,0,0,0], partialB = # [0,0,0,0,0], ampB = # [0,0,0,0,0], phaB = #[0,0,0,0,0], partialC = # [0,0,0,0,0], ampC = # [0,0,0,0,0], phaC = #[0,0,0,0,0], att = 1, max = 0.3, del = 0.3, dec = 1.2, ampMix = 0.8, freq_attT = 0.011, freq_relT =0.017, freq_dec = 0.23|
var fundA, fundB, fundC, freq1, freq2, freq3, env, mix, init, normA, normB, normC, in, attT, relT;
	//attT = Poll.kr(Impulse.kr(10), MouseX.kr(0,001, 0,2, lag: 0.2));
	attT = SinOsc.kr(freq_attT).exprange(0.003, 0.017).poll(label: \att);
	//relT = Poll.kr(Impulse.kr(10), MouseY.kr(0.01, 0.2, lag:0.2));
	relT = SinOsc.kr(freq_relT).range(0.03,0.09).poll(label: \rel);
	env = EnvGen.kr(Env.perc(attT, relT), Impulse.kr(att));
	fundA = Control.names([\fundA]).kr(440);
	fundB = Control.names([\fundB]).kr(441);
	fundC = Control.names([\fundC]).kr(441);
	init = Control.names([\init]).kr(0.25);
	normA = Control.names([\normA]).kr(0.66);
	normB = Control.names([\normB]).kr(0.66);
	normC = Control.names([\normC]).kr(0.66);
	freq1 = Mix.new(FSinOsc.ar(fundA*partialA, phaA*init, ampA*normA));
	freq2 = Mix.new(FSinOsc.ar(fundB*partialB, phaB*init, ampB*normB));
	freq3 = Mix.new(FSinOsc.ar(fundC*partialC, phaC*init, ampC*normC));
	mix = Mix.new(freq1, freq2, freq3);
	in = mix*env;
	//max = MouseX.kr(0.001, 0.4, lag: 0.2).poll;
	//del = MouseX.kr(0.001, 0.4, lag: 0.2).poll;
	//del = SinOsc.kr(0.19).range(0.02, 0.1).poll(label: \del);
	//dec = MouseY.kr(0.1, 0.8, lag: 0.2).poll;
	dec = SinOsc.kr(freq_dec).exprange(0.4, 0.8).poll(label: \dec);
	OffsetOut.ar([0,1], AllpassC.ar(in, max, del, dec, ampMix))
}).load(s);
)

(
~w = (3/2**[2,4,6,9]++ 1).sort;
~x = (3/2**[3,5,7,9]++ 1).sort;
~y = (3/2**[2,5,7,9]++ 1).sort;
~z = (3/2**[2,4,7,9]++ 1).sort;

~a = (1.0/[1,2,4,9,25]).normalizeSum;
~b = (1.0/[1,2,4,9,25]).normalizeSum;
~c = (1.0/[1,2,4,9,25]).normalizeSum;

~ph = [0,1,2,3,4];
~ph1 = [1,2,3,4,0];
~ph2 = [2,3,4,0,1];
)

196*(3/2**[2,4,6,9]);
441*(3/2**[2,4,6,9]);
992.25*(3/2**[2,4,6,9]);
(
a = Synth(\chord, [\fundA, 82.41, \fundB, 185.42, \fundC, 417.2, \partialA, ~x, \partialB, ~y, \partialC, ~z, \ampA, ~a, \ampB, ~b, \ampC, ~c, \phaA, ~ph, \phaB, ~ph1, \phaB, ~ph2, \att, 1.2, \normA, 0.49, \normB, 0.21, \normC, 0.14,\freq_attT ,0.011, \freq_relT, 0.017, \freq_dec, 0.23 ]);

b = Synth(\chord, [\fundA, 110, \fundB, 247.5, \fundC, 556.88, \partialA, ~w, \partialB, ~x, \partialC, ~y, \ampA, ~a, \ampB, ~b, \ampC, ~c, \phaA, ~ph1, \phaB, ~ph2, \phaB, ~ph, \att, 1.202, \normA, 0.35, \normB, 0.15, \normC, 0.12, \freq_attT, 0.013, \freq_relT, 0.019, \freq_dec, 0.11 ]);

c = Synth(\chord, [\fundA, 146.92, \fundB, 330.36, \fundC, 743.3268, \partialA, ~y, \partialB, ~z, \partialC, ~w, \ampA, ~a, \ampB, ~b, \ampC, ~c, \phaA, ~ph, \phaB, ~ph1, \phaB, ~ph2, \att, 1.203, \normA, 0.21, \normB, 0.09, \normC, 0.06, \freq_attT, 0.019, \freq_relT, 0.017, \freq_dec, 0.19 ]);

d = Synth(\chord, [\fundA, 196, \fundB, 441, \fundC, 0, \partialA, ~z, \partialB, ~w, \partialC, ~y, \ampA, ~a, \ampB, ~b, \ampC, ~c, \phaA, ~ph1, \phaB, ~ph2, \phaB, ~ph, \att, 1.205, \normA, 0.14, \normB, 0.1, \normC, 0.04, \freq_attT, 0.007, \freq_relT, 0.013, \freq_dec, 0.13 ]);
)
