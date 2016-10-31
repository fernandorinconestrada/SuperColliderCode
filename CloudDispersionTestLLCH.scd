(
SynthDef(\clouddispersion, { | rateTrig = 0.1, ratePan = 100, gate = 1, attT = 0.01, decT = 5, densCloud = 500, freq = 440, fbImp = 0.4, ampImp = 0.2, dur = 0.04, levelWhite = 0.5, envbufnum = -1 |

	var trig, panPos, impulse, tail;
	trig = Impulse.ar(rateTrig);
	panPos = LFNoise0.kr(ratePan).range(-1.0, 1.0);
	//envTail = EnvGen.ar(Env([0.001,1,0.001], [0.001, 0.998], \exp), gate, doneAction:2);
	impulse = SinOscFB.ar(freq, fbImp, trig);
	tail = Decay2.ar(trig, attT, decT, GrainIn.ar(2, TDelay.ar(Dust.ar(densCloud), 0.1), dur, SinOscFB.ar(freq, LFNoise0.kr(100).range(0.2, 0.6), LFNoise0.kr(50).range(0.01, 0.2)), panPos, envbufnum));
	OffsetOut.ar(0, tail);
}).add;
)

(
SynthDef(\clouddispersionA, { | rateTrig = 0.1, ratePan = 100, gate = 1, attT = 0.01, decT = 5, densCloud = 500, freq = 440, fbImp = 0.4, ampImp = 0.2, dur = 40, levelWhite = 0.5, envbufnum = -1 |

	var trig, panPos, envImp, impulse, tail, mix;
	trig = Impulse.ar(rateTrig);
	panPos = LFNoise0.kr(ratePan).range(-1.0, 1.0);
	envImp = EnvGen.ar(Env.perc, trig);
	impulse = SinOscFB.ar(freq, fbImp, envImp);
	tail = Decay2.ar(TDelay.ar(trig, 0.5), attT, decT, GrainIn.ar(2, Dust.ar(densCloud), LFNoise0.kr(dur).range(0.04, 0.08), SinOscFB.ar(freq * LFNoise0.kr(50).range(0.97, 1.03), LFNoise0.kr(100).range(0.02, 0.3), LFNoise0.kr(50).range(0.01, 0.1)), panPos, envbufnum));
	mix = Mix.new([impulse, tail]);
	OffsetOut.ar(0, mix);
}).add;
)

(
SynthDef(\clouddispersionB, { | rateTrig = 0.1, ratePan = 100, gate = 1, attT = 0.01, decT = 5, densCloud = 500, freq = 440, fbImp = 0.4, ampImp = 0.2, dur = 40, levelWhite = 0.5, envbufnum = -1 |

	var trig, panPos, envImp, impulse, tail, mix;
	trig = Impulse.ar(rateTrig);
	panPos = LFNoise0.kr(ratePan).range(-1.0, 1.0);
	envImp = EnvGen.ar(Env.perc, trig);
	impulse = SinOscFB.ar(freq, fbImp, envImp);
	tail = Decay2.ar(TDelay.ar(trig, 0.5), attT, decT, GrainIn.ar(2, Dust.ar(densCloud), LFNoise0.kr(dur).range(0.04, 0.08), SinOscFB.ar(freq * LFNoise0.kr(50).range(0.97, 1.03), Phasor.ar(TDelay.ar(trig, 0.5), 3, 0.5, 0.01, 0.7).poll, LFNoise0.kr(50).range(0.01, 0.1)), panPos, envbufnum));
	mix = Mix.new([impulse, tail]);
	OffsetOut.ar(0, mix);
}).add;
)
a = Synth(\clouddispersionB);

{ GrainIn.ar(2, Dust.ar(500), 0.04, WhiteNoise.ar(0.2), LFNoise0.kr(100).range(-1.0, 1.0) , -1) }.play;

1/0.3

{ SinOsc.ar(Sweep.kr(Impulse.kr(1, 3).linlin(0, 1, 0.3, 0.7, \minmax)).poll * 200, 0, 0.1) }.play;