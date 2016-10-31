{
	var rand;
	rand = LFNoise0.kr(40);
	OffsetOut.ar(0, BPF.ar(WhiteNoise.ar(rand.range(1, 1.5)), rand.range(440, 480), rand.range(0.001, 0.005), EnvGen.kr(Env.perc(0.001, rand.range(0.005, 0.03)), rand)))
}.play;

{
	var rand;
	rand = LFNoise0.kr(40);
	OffsetOut.ar(1, Resonz.ar(BPF.ar(WhiteNoise.ar(rand.range(1, 1.5)), rand.range(440, 480), rand.range(0.001, 0.005), EnvGen.kr(Env.perc(0.001, rand.range(0.005, 0.03)), rand)), 460*6, 0.8, 2))
}.play;

{
	var rand;
	rand = LFNoise0.kr(10);
	OffsetOut.ar(0, Ringz.ar(BPF.ar(WhiteNoise.ar(rand.range(1, 1.5)), rand.range(440, 480), rand.range(0.001, 0.005), EnvGen.kr(Env.perc(0.001, rand.range(0.005, 0.03)), rand)), rand.range(440*6, 480*6), rand.range(0.1, 0.3), rand.range(1.0,2.0)))
}.play;

{
	var rand;
	rand = LFNoise0.kr(10);
	OffsetOut.ar(1, RHPF.ar(BPF.ar(WhiteNoise.ar(rand.range(1, 1.5)), rand.range(440, 480), rand.range(0.001, 0.005), EnvGen.kr(Env.perc(0.001, rand.range(0.005, 0.03)), rand)), rand.range(440*6, 480*6), rand.range(0.5, 1.0), rand.range(1.0,2.0)))
}.play;

{
	var rand, attack, decay;
	rand = LFNoise0.kr(5);
	attack = rand.range(0.001, 0.003);
	decay = rand.range(0.005, 0.03);
	OffsetOut.ar(1, Formlet.ar(BPF.ar(WhiteNoise.ar(rand.range(1, 1.5)), rand.range(440, 480), rand.range(0.001, 0.005), EnvGen.kr(Env.perc(attack, decay), rand)), rand.range(440*6, 480*6), attack, decay, rand.range(1.0,2.0)))
}.play;

{
	var rand, attack, decay, sig;
	rand = LFNoise0.kr(7);
	attack = rand.range(0.001, 0.003);
	decay = rand.range(0.005, 0.03);
	sig = Formlet.ar(BPF.ar(WhiteNoise.ar(rand.range(1, 1.5)), rand.range(440, 480), rand.range(0.001, 0.005), EnvGen.kr(Env.perc(attack, decay), rand)), rand.range(440*6, 480*6), attack, decay, rand.range(1.0,2.0));
	OffsetOut.ar(0, [sig, DelayC.ar(sig, 0.12, rand.range(0.02, 0.06), rand.range(0.6,0.75))]);
}.play;

{
	var rand, attack, decay, sig;
	rand = LFNoise0.kr(3);
	attack = rand.range(0.001, 0.003);
	decay = rand.range(0.005, 0.03);
	sig = Formlet.ar(BPF.ar(WhiteNoise.ar(rand.range(1, 1.5)), rand.range(480, 560), rand.range(0.001, 0.005), EnvGen.kr(Env.perc(attack, decay), rand)), rand.range(480*6, 560*6), attack, decay, rand.range(1.0,2.0));
	OffsetOut.ar(0, [sig, DelayC.ar(sig, 0.12, rand.range(0.02, 0.06), rand.range(0.6,0.75))]);
}.play;


{
	var rand, attack, decay, sig;
	rand = LFNoise0.kr(11);
	attack = rand.range(0.001, 0.003);
	decay = rand.range(0.005, 0.03);
	sig = Formlet.ar(BPF.ar(WhiteNoise.ar(rand.range(1, 1.5)), rand.range(560, 720), rand.range(0.001, 0.005), EnvGen.kr(Env.perc(attack, decay), rand)), rand.range(560*6, 720*6), attack, decay, rand.range(1.0,2.0));
	OffsetOut.ar(0, [sig, DelayC.ar(sig, 0.12, rand.range(0.02, 0.06), rand.range(0.6,0.75))]);
}.play;


{
	var rand, attack, decay, sig;
	rand = LFNoise0.kr(5);
	attack = rand.range(0.001, 0.003);
	decay = rand.range(0.005, 0.03);
	sig = Formlet.ar(BPF.ar(WhiteNoise.ar(rand.range(1, 1.5)), rand.range(720, 1040), rand.range(0.001, 0.005), EnvGen.kr(Env.perc(attack, decay), rand)), rand.range(720*6, 1040*6), attack, decay, rand.range(1.0,2.0));
	OffsetOut.ar(0, [sig, DelayC.ar(sig, 0.12, rand.range(0.02, 0.06), rand.range(0.6,0.75))]);
}.play;


(
SynthDef(\rainStickGrain, { |rateDens = 5, loAtt = 0.001, hiAtt = 0.003, loDecay = 0.005, hiDecay = 0.03, loAmpWhite = 1.0, hiAmpWhite = 1.5, loFreqBP = 440, hiFreqBP = 480, loBw = 0.001, hiBw = 0.005, loFreqForm = 2640, hiFreqForm = 2880, loAmpForm = 1.0, hiAmpForm = 2.0, panSig = 0.5, loLevPanSig = 0.8, hiLevPanSig = 1, loDelT = 0.02, hiDelT = 0.06, loAmpDel = 0.6, hiAmpDel = 0.75, panDel = -0.5, loLevPanDel = 0.6, hiLevPanDel = 0.8|
	var rand, attack, decay, sig;
	rand = LFNoise0.kr(rateDens);
	attack = rand.range(loAtt, hiAtt);
	decay = rand.range(loDecay, hiDecay);
	sig = Formlet.ar(BPF.ar(WhiteNoise.ar(rand.range(loAmpWhite, hiAmpWhite)), rand.range(loFreqBP, hiFreqBP), rand.range(loBw, hiBw), EnvGen.kr(Env.perc(attack, decay), rand)), rand.range(loFreqForm, hiFreqForm), attack, decay, rand.range(loAmpForm, hiAmpForm));
	OffsetOut.ar(0, Pan2.ar(sig, panSig, rand.(loLevPanSig, hiLevPanSig)));
	OffsetOut.ar(0, Pan2.ar(DelayC.ar(sig, 0.12, rand.range(loDelT, hiDelT), rand.range(loAmpDel, hiAmpDel)), panDel, rand.range(loLevPanDel, hiLevPanDel)));
}).add;
)

(
SynthDef(\rainStickGrainVer2, { |rateDens = 5, loAtt = 0.001, hiAtt = 0.003, loDecay = 0.005, hiDecay = 0.03, loAmpWhite = 1.0, hiAmpWhite = 1.5, loFreqBP = 440, hiFreqBP = 480, loBw = 0.001, hiBw = 0.005, loFreqForm = 2640, hiFreqForm = 2880, loAmpForm = 1.0, hiAmpForm = 2.0, loLevPanSig = 0.8, hiLevPanSig = 1, loDelT = 0.02, hiDelT = 0.06, loAmpDel = 0.6, hiAmpDel = 0.75, loLevPanDel = 0.6, hiLevPanDel = 0.8, ratePanSig = 0.5, leftPanSig, rightPanSig, ratePanDel = 0.51, leftPanDel, rightPanDel |
	var rand, attack, decay, sig, panSig, panDel;
	rand = LFNoise0.kr(rateDens);
	attack = rand.range(loAtt, hiAtt);
	decay = rand.range(loDecay, hiDecay);
	panSig =SinOsc.kr(ratePanSig).range(leftPanSig, rightPanSig);
	panDel = SinOsc.kr(ratePanDel).range(leftPanDel, rightPanDel);
	sig = Formlet.ar(BPF.ar(WhiteNoise.ar(rand.range(loAmpWhite, hiAmpWhite)), rand.range(loFreqBP, hiFreqBP), rand.range(loBw, hiBw), EnvGen.kr(Env.perc(attack, decay), rand)), rand.range(loFreqForm, hiFreqForm), attack, decay, rand.range(loAmpForm, hiAmpForm));
	OffsetOut.ar(0, Pan2.ar(sig, panSig, rand.(loLevPanSig, hiLevPanSig)));
	OffsetOut.ar(0, Pan2.ar(DelayC.ar(sig, 0.12, rand.range(loDelT, hiDelT), rand.range(loAmpDel, hiAmpDel)), panDel, rand.range(loLevPanDel, hiLevPanDel)));
}).add;
)

(
SynthDef(\rainStickGrainVer2a, { |rateDens = 5, loAtt = 0.001, hiAtt = 0.003, loDecay = 0.005, hiDecay = 0.03, loAmpWhite = 1.0, hiAmpWhite = 1.5, loFreqBP = 440, hiFreqBP = 480, loBw = 0.001, hiBw = 0.005, loFreqForm = 2640, hiFreqForm = 2880, loAmpForm = 1.0, hiAmpForm = 2.0, loLevPanSig = 0.8, hiLevPanSig = 1, loDelT = 0.02, hiDelT = 0.06, loAmpDel = 0.6, hiAmpDel = 0.75, loLevPanDel = 0.6, hiLevPanDel = 0.8, ratePanSig = 0.5, leftPanSig, rightPanSig, ratePanDel = 0.51, leftPanDel, rightPanDel |
	var rand, attack, decay, sig, panSig, panDel;
	rand = LFNoise0.kr(rateDens);
	attack = rand.range(loAtt, hiAtt);
	decay = rand.range(loDecay, hiDecay);
	panSig =SinOsc.kr(ratePanSig).range(leftPanSig, rightPanSig);
	panDel = SinOsc.kr(ratePanDel).range(leftPanDel, rightPanDel);
	sig = Formlet.ar(BPF.ar(WhiteNoise.ar(rand.range(loAmpWhite, hiAmpWhite)), rand.range(loFreqBP, hiFreqBP), rand.range(loBw, hiBw), EnvGen.kr(Env.perc(attack, decay), rand)), rand.range(loFreqForm, hiFreqForm), attack, decay, rand.range(loAmpForm, hiAmpForm));
	OffsetOut.ar(0, Pan2.ar(sig, panSig, rand.(loLevPanSig, hiLevPanSig)));
	OffsetOut.ar(0, Pan2.ar(DelayC.ar(sig, 0.12, rand.range(loDelT, hiDelT), rand.range(loAmpDel, hiAmpDel)), panDel, rand.range(loLevPanDel, hiLevPanDel)));
}).add;
)

(
SynthDef(\rainStickGrainVer2b, { |rateDens = 5, loAtt = 0.001, hiAtt = 0.003, loDecay = 0.005, hiDecay = 0.03, loAmpWhite = 1.0, hiAmpWhite = 1.5, loFreqBP = 440, hiFreqBP = 480, loBw = 0.001, hiBw = 0.005, loFreqForm = 2640, hiFreqForm = 2880, loAmpForm = 1.0, hiAmpForm = 2.0, loLevPanSig = 0.8, hiLevPanSig = 1, loDelT = 0.02, hiDelT = 0.06, loAmpDel = 0.6, hiAmpDel = 0.75, loLevPanDel = 0.6, hiLevPanDel = 0.8, ratePanSig = 0.5, leftPanSig, rightPanSig, ratePanDel = 0.51, leftPanDel, rightPanDel |
	var rand, attack, decay, release, env, sig, panSig, panDel;
	rand = LFNoise0.kr(rateDens);
	attack = rand.range(loAtt, hiAtt);
	decay = rand.range(loDecay, hiDecay);
	release = rand.range(0.005, 0.03);
	env = EnvGen.kr(Env([0,1.0,0.75,0],[attack, decay, release]), rand);
	panSig =SinOsc.kr(ratePanSig).range(leftPanSig, rightPanSig);
	panDel = SinOsc.kr(ratePanDel).range(leftPanDel, rightPanDel);
	sig = Formlet.ar(BPF.ar(WhiteNoise.ar(rand.range(loAmpWhite, hiAmpWhite)), rand.range(loFreqBP, hiFreqBP), rand.range(loBw, hiBw), env), rand.range(loFreqForm, hiFreqForm), attack, decay, rand.range(loAmpForm, hiAmpForm));
	OffsetOut.ar(0, sig);
	OffsetOut.ar(1, DelayC.ar(sig, 0.12, rand.range(loDelT, hiDelT), env*rand.range(loAmpDel, hiAmpDel)));
	//OffsetOut.ar(1, DelayC.ar(sig, 0.12, 0.04, env*rand.range(loAmpDel, hiAmpDel)));
}).add;
)

(
SynthDef(\rainStickGrainVer3, { |rateDens = 5, loAtt = 0.001, hiAtt = 0.003, loDecay = 0.005, hiDecay = 0.03, loAmpWhite = 1.0, hiAmpWhite = 1.5, loFreqBP = 440, hiFreqBP = 480, loBw = 0.001, hiBw = 0.005, loFreqForm = 2640, hiFreqForm = 2880, loAmpForm = 1.0, hiAmpForm = 2.0, loLevPanSig = 0.8, hiLevPanSig = 1, loDelT = 0.02, hiDelT = 0.06, loAmpDel = 0.6, hiAmpDel = 0.75, loLevPanDel = 0.6, hiLevPanDel = 0.8, ratePanSig = 0.5, leftPanSig, rightPanSig, ratePanDel = 0.51, leftPanDel, rightPanDel |
	var rand, attack, decay, sig, panSig, panDel;
	rand = LFNoise0.kr(rateDens);
	attack = rand.range(loAtt, hiAtt);
	decay = rand.range(loDecay, hiDecay);
	panSig =SinOsc.kr(ratePanSig).range(leftPanSig, rightPanSig);
	panDel = SinOsc.kr(ratePanDel).range(leftPanDel, rightPanDel);
	sig = Formlet.ar(BPF.ar(WhiteNoise.ar(rand.range(loAmpWhite, hiAmpWhite)), rand.range(loFreqBP, hiFreqBP), rand.range(loBw, hiBw), EnvGen.kr(Env.perc(attack, decay), rand)), rand.range(loFreqForm, hiFreqForm), attack, decay, rand.range(loAmpForm, hiAmpForm));
	OffsetOut.ar(0, FreeVerb.ar(Pan2.ar(sig, panSig, rand.(loLevPanSig, hiLevPanSig)), rand.range(0.2, 0.3), rand.range(0.7, 0.8)));
	OffsetOut.ar(0, FreeVerb.ar(Pan2.ar(DelayC.ar(sig, 0.12, rand.range(loDelT, hiDelT), rand.range(loAmpDel, hiAmpDel)), panDel, rand.range(loLevPanDel, hiLevPanDel)), rand.range(0.2, 0.3), rand.range(0.7, 0.8), 0.5, rand.range(0.75, 0.9)));
}).add;
)

(
SynthDef(\revFX, { |delT = 0.048|
	var input, delay, sig, mix;
	input = In.ar(0, 2);
	delay = DelayN.ar(input, 0.1, delT);
	sig = Mix.arFill(2, {CombL.ar(delay, 0.1, rrand(0.01, 0.1), 2)});
	mix.do({sig = AllpassN.ar(sig, 0.051, [rrand(0.01, 0.05), rrand(0.01, 0.05)],1)});
	OffsetOut.ar(0, sig*0.2);
}).add;
)

(
SynthDef(\revFX2, { |delT = 0.048|
	var input, sig;
	input = In.ar(0, 1);
	sig = GVerb.ar(input);
	OffsetOut.ar(0, sig);
}).add;
)

(
SynthDef(\panner, { |panPos = 1, levelPan = 1|
	var input, sig;
	input = In.ar(0,1);
	sig = Pan2.ar(input, panPos, levelPan);
	OffsetOut.ar(0, sig);
}).add;
)



a = Synth(\rainStickGrain, [\rateDens, 5.3, \panSig, 0.5, \panDel, -0.5]);
b = Synth(\rainStickGrain, [\rateDens, 4.7, \panSig, 0.25, \panDel, -0.25]);
c = Synth(\rainStickGrain, [\rateDens, 4.3, \panSig, -0.75, \panDel, 0.75]);
d = Synth(\rainStickGrain, [\rateDens, 5.7, \panSig, -1, \panDel, 1]);

a = Synth(\rainStickGrainVer2b, [\rateDens, 5.3]);
b = Synth(\rainStickGrainVer2b, [\rateDens, 4.7]);
c = Synth(\rainStickGrainVer2b, [\rateDens, 4.3]);
d = Synth(\rainStickGrainVer2b, [\rateDens, 5.7]);

a.set(\loAtt, 0.001, \hiAtt, 0.003, \loDecay, 0.003, \hiDecay, 0.03);
b.set(\loAtt, 0.001, \hiAtt, 0.003, \loDecay, 0.003, \hiDecay, 0.03);
c.set(\loAtt, 0.001, \hiAtt, 0.003, \loDecay, 0.003, \hiDecay, 0.03);
d.set(\loAtt, 0.001, \hiAtt, 0.003, \loDecay, 0.003, \hiDecay, 0.03);

(
a.set(\rateDens, 13);
b.set(\rateDens, 11);
c.set(\rateDens, 17);
d.set(\rateDens, 19);
e.set(\rateDens, 19);
f.set(\rateDens, 17);
g.set(\rateDens, 11);
h.set(\rateDens, 13);
)

(
a.set(\loFreqForm, 2640, \hiFreqForm, 2880);
b.set(\loFreqForm, 2640*3, \hiFreqForm, 2880*3);
c.set(\loFreqForm, 2640*2, \hiFreqForm, 2880*2);
d.set(\loFreqForm, 2640, \hiFreqForm, 2880)
)

(
a.set(\loFreqBP, 220, \hiFreqBP, 240);
b.set(\loFreqBP, 110, \hiFreqBP, 120);
c.set(\loFreqBP, 2640, \hiFreqBP, 2880);
d.set(\loFreqBP, 330, \hiFreqBP, 360);
e.set(\loFreqBP, 110, \hiFreqBP, 120);
f.set(\loFreqBP, 2640, \hiFreqBP, 2880);
g.set(\loFreqBP, 220, \hiFreqBP, 240);
h.set(\loFreqBP, 330, \hiFreqBP, 360)
)
(
a = Synth(\rainStickGrainVer2, [\rateDens, 5.3, \leftPanSig, 0.5, \rightPanSig, -0.5, \leftPanDel, -0.5, \rightPanDel, 0.5]);
b = Synth(\rainStickGrainVer2, [\rateDens, 4.7, \leftPanSig, 0.25, \rightPanSig, -0.25,\leftPanDel, -0.25, \rightPanDel, 0.25]);
c = Synth(\rainStickGrainVer2, [\rateDens, 4.3, \leftPanSig, -0.75, \rightPanSig, 0.75,\leftPanDel, 0.75, \rightPanDel, -0.75]);
d = Synth(\rainStickGrainVer2, [\rateDens, 5.7, \leftPanSig, -1, \rightPanSig, 1.0, \leftPanDel, 1, \rightPanDel -1.0]);
)

(
a.set(\leftPanSig, 0.5,  \rightPanSig, -0.5, \leftPanDel, -0.5,  \rightPanDel, 0.5);
b.set(\leftPanSig, 0.25, \rightPanSig, -0.25,\leftPanDel, -0.25, \rightPanDel, 0.25);
c.set(\leftPanSig, -0.75, \rightPanSig, 0.75,\leftPanDel, 0.75,  \rightPanDel, -0.75);
d.set(\leftPanSig, -1.0,  \rightPanSig, 1.0, \leftPanDel, 1.0,   \rightPanDel -1.0)
)

(
b.set(\leftPanSig, 0.5,  \rightPanSig, -0.5, \leftPanDel, -0.5,  \rightPanDel, 0.5);
c.set(\leftPanSig, 0.25, \rightPanSig, -0.25,\leftPanDel, -0.25, \rightPanDel, 0.25);
d.set(\leftPanSig, -0.75, \rightPanSig, 0.75,\leftPanDel, 0.75,  \rightPanDel, -0.75);
a.set(\leftPanSig, -1.0,  \rightPanSig, 1.0, \leftPanDel, 1.0,   \rightPanDel -1.0)
)

(
c.set(\leftPanSig, 0.5,  \rightPanSig, -0.5, \leftPanDel, -0.5,  \rightPanDel, 0.5);
d.set(\leftPanSig, 0.25, \rightPanSig, -0.25,\leftPanDel, -0.25, \rightPanDel, 0.25);
a.set(\leftPanSig, -0.75, \rightPanSig, 0.75,\leftPanDel, 0.75,  \rightPanDel, -0.75);
b.set(\leftPanSig, -1.0,  \rightPanSig, 1.0, \leftPanDel, 1.0,   \rightPanDel -1.0)
)

(
d.set(\leftPanSig, 0.5,  \rightPanSig, -0.5, \leftPanDel, -0.5,  \rightPanDel, 0.5);
a.set(\leftPanSig, 0.25, \rightPanSig, -0.25,\leftPanDel, -0.25, \rightPanDel, 0.25);
b.set(\leftPanSig, -0.75, \rightPanSig, 0.75,\leftPanDel, 0.75,  \rightPanDel, -0.75);
c.set(\leftPanSig, -1.0,  \rightPanSig, 1.0, \leftPanDel, 1.0,   \rightPanDel -1.0)
)

(
a.set(\rateDens, 23);
b.set(\rateDens, 31);
c.set(\rateDens, 47);
d.set(\rateDens, 29)
)

(
a = Synth(\rainStickGrainVer3, [\rateDens, 5.3, \leftPanSig,-1.0, \rightPanSig, -0.875, \leftPanDel, -0.875, \rightPanDel, -0.75]);
b = Synth(\rainStickGrainVer3, [\rateDens, 4.7, \leftPanSig, -0.75, \rightPanSig, -0.625,\leftPanDel, -0.625, \rightPanDel, -0.5]);
c = Synth(\rainStickGrainVer3, [\rateDens, 4.3, \leftPanSig, -0.5, \rightPanSig, -0.375,\leftPanDel, -0.375, \rightPanDel, -0.25]);
d = Synth(\rainStickGrainVer3, [\rateDens, 5.9, \leftPanSig, -0.25, \rightPanSig, -0.125, \leftPanDel, -0.125, \rightPanDel, 0]);
e = Synth(\rainStickGrainVer3, [\rateDens, 6.1, \leftPanSig, 0, \rightPanSig, 0.125, \leftPanDel, 0.1255, \rightPanDel, 0.25]);
f = Synth(\rainStickGrainVer3, [\rateDens, 3.7, \leftPanSig, 0.25, \rightPanSig, 0.375,\leftPanDel, 0.375, \rightPanDel, 0.5]);
g = Synth(\rainStickGrainVer3, [\rateDens, 4.1, \leftPanSig, 0.5, \rightPanSig, 0.625,\leftPanDel, 0.625, \rightPanDel, 0.75]);
h = Synth(\rainStickGrainVer3, [\rateDens, 6.7, \leftPanSig, 0.75, \rightPanSig, 0.875, \leftPanDel, 0.875, \rightPanDel, 1.0]);
)

~spread = 2/16*(0..16) - 1.0
(
a.set(\leftPanSig, ~spread.at([0]), \rightPanSig, ~spread.at([1]), \leftPanDel, ~spread.at([15]), \rightPanDel, ~spread.at([16]));
b.set(\leftPanSig, ~spread.at([1]), \rightPanSig, ~spread.at([2]), \leftPanDel, ~spread.at([14]), \rightPanDel, ~spread.at([15]));
c.set(\leftPanSig, ~spread.at([2]), \rightPanSig, ~spread.at([3]), \leftPanDel, ~spread.at([13]), \rightPanDel, ~spread.at([14]));
d.set(\leftPanSig, ~spread.at([3]), \rightPanSig, ~spread.at([4]), \leftPanDel, ~spread.at([12]), \rightPanDel, ~spread.at([13]));
e.set(\leftPanSig, ~spread.at([4]), \rightPanSig, ~spread.at([5]), \leftPanDel, ~spread.at([11]), \rightPanDel, ~spread.at([12]));
f.set(\leftPanSig, ~spread.at([5]), \rightPanSig, ~spread.at([6]), \leftPanDel, ~spread.at([10]), \rightPanDel, ~spread.at([11]));
g.set(\leftPanSig, ~spread.at([6]), \rightPanSig, ~spread.at([7]), \leftPanDel, ~spread.at([9]), \rightPanDel, ~spread.at([10]));
h.set(\leftPanSig, ~spread.at([7]), \rightPanSig, ~spread.at([8]), \leftPanDel, ~spread.at([8]), \rightPanDel, ~spread.at([9]));
)

(
~testFx = Routine({
	1.do({
		var fxsynth;
		fxsynth = Synth(\revFX);
		a = Synth.before(fxsynth, \rainStickGrainVer3, [\rateDens, 5.3, \leftPanSig,-1.0, \rightPanSig, -0.875, \leftPanDel, -0.875, \rightPanDel, -0.75]);
		b = Synth.before(fxsynth, \rainStickGrainVer3, [\rateDens, 4.7, \leftPanSig, -0.75, \rightPanSig, -0.625,\leftPanDel, -0.625, \rightPanDel, -0.5]);
		c = Synth.before(fxsynth, \rainStickGrainVer3, [\rateDens, 4.3, \leftPanSig, -0.5, \rightPanSig, -0.375,\leftPanDel, -0.375, \rightPanDel, -0.25]);
		d = Synth.before(fxsynth, \rainStickGrainVer3, [\rateDens, 5.9, \leftPanSig, -0.25, \rightPanSig, -0.125, \leftPanDel, -0.125, \rightPanDel, 0]);
		e = Synth.before(fxsynth, \rainStickGrainVer3, [\rateDens, 6.1, \leftPanSig, 0, \rightPanSig, 0.125, \leftPanDel, 0.1255, \rightPanDel, 0.25]);
		f = Synth.before(fxsynth, \rainStickGrainVer3, [\rateDens, 3.7, \leftPanSig, 0.25, \rightPanSig, 0.375,\leftPanDel, 0.375, \rightPanDel, 0.5]);
		g = Synth.before(fxsynth, \rainStickGrainVer3, [\rateDens, 4.1, \leftPanSig, 0.5, \rightPanSig, 0.625,\leftPanDel, 0.625, \rightPanDel, 0.75]);
		h = Synth.before(fxsynth, \rainStickGrainVer3, [\rateDens, 6.7, \leftPanSig, 0.75, \rightPanSig, 0.875, \leftPanDel, 0.875, \rightPanDel, 1.0]);
		30.yield;
		a.set(\rateDens, 13);
		b.set(\rateDens, 11);
		c.set(\rateDens, 17);
		d.set(\rateDens, 19);
		e.set(\rateDens, 19);
		f.set(\rateDens, 17);
		g.set(\rateDens, 11);
		h.set(\rateDens, 13);
		a.set(\leftPanSig, ~spread.at([0]), \rightPanSig, ~spread.at([1]), \leftPanDel, ~spread.at([15]), \rightPanDel, ~spread.at([16]));
		b.set(\leftPanSig, ~spread.at([1]), \rightPanSig, ~spread.at([2]), \leftPanDel, ~spread.at([14]), \rightPanDel, ~spread.at([15]));
		c.set(\leftPanSig, ~spread.at([2]), \rightPanSig, ~spread.at([3]), \leftPanDel, ~spread.at([13]), \rightPanDel, ~spread.at([14]));
		d.set(\leftPanSig, ~spread.at([3]), \rightPanSig, ~spread.at([4]), \leftPanDel, ~spread.at([12]), \rightPanDel, ~spread.at([13]));
		e.set(\leftPanSig, ~spread.at([4]), \rightPanSig, ~spread.at([5]), \leftPanDel, ~spread.at([11]), \rightPanDel, ~spread.at([12]));
		f.set(\leftPanSig, ~spread.at([5]), \rightPanSig, ~spread.at([6]), \leftPanDel, ~spread.at([10]), \rightPanDel, ~spread.at([11]));
		g.set(\leftPanSig, ~spread.at([6]), \rightPanSig, ~spread.at([7]), \leftPanDel, ~spread.at([9]), \rightPanDel, ~spread.at([10]));
		h.set(\leftPanSig, ~spread.at([7]), \rightPanSig, ~spread.at([8]), \leftPanDel, ~spread.at([8]), \rightPanDel, ~spread.at([9]));
	})
})
)

~testFx.play;

(
~testFx2 = Routine({
	1.do({
		var fxsynth;
		fxsynth = Synth(\revFX2);
		a = Synth.before(fxsynth, \rainStickGrainVer3, [\rateDens, 5.3, \leftPanSig,-1.0, \rightPanSig, -0.875, \leftPanDel, -0.875, \rightPanDel, -0.75]);
		30.yield;
		a.set(\rateDens, 13);
		a.set(\leftPanSig, ~spread.at([0]), \rightPanSig, ~spread.at([1]), \leftPanDel, ~spread.at([15]), \rightPanDel, ~spread.at([16]));
	})
})
)

(
~testFx2a = Routine({
	1.do({
		var src, fx, pan;
		src = Group.new;
		fx = Group.after(src);
		pan = Group.after(fx);
		a = Synth(\panner, [\panPos, 1.0]);
		b = Synth(\revFX2, target: src);
		c = Synth(\rainStickGrainVer2b);
		30.yield;
		c.set(\rateDens, 13);
		a.set(\panPos, -1.0);
	})
})
)

~testFx2a.play;

(
~testFx3 = Routine({
	1.do({
		var fxsynth;
		//fxsynth = Synth(\revFX);
		fxsynth = Synth(\revFX2);
		a = Synth.before(fxsynth, \rainStickGrainVer3, [\rateDens, 5.3, \leftPanSig,-1.0, \rightPanSig, -0.875, \leftPanDel, -0.875, \rightPanDel, -0.75]);
		19.yield;
		b = Synth.before(fxsynth, \rainStickGrainVer3, [\rateDens, 4.7, \leftPanSig, -0.75, \rightPanSig, -0.625,\leftPanDel, -0.625, \rightPanDel, -0.5]);
		17.yield;
		c = Synth.before(fxsynth, \rainStickGrainVer3, [\rateDens, 4.3, \leftPanSig, -0.5, \rightPanSig, -0.375,\leftPanDel, -0.375, \rightPanDel, -0.25]);
		13.yield;
		d = Synth.before(fxsynth, \rainStickGrainVer3, [\rateDens, 5.9, \leftPanSig, -0.25, \rightPanSig, -0.125, \leftPanDel, -0.125, \rightPanDel, 0]);
		11.yield;
		e = Synth.before(fxsynth, \rainStickGrainVer3, [\rateDens, 6.1, \leftPanSig, 0, \rightPanSig, 0.125, \leftPanDel, 0.1255, \rightPanDel, 0.25]);
		7.yield;
		f = Synth.before(fxsynth, \rainStickGrainVer3, [\rateDens, 3.7, \leftPanSig, 0.25, \rightPanSig, 0.375,\leftPanDel, 0.375, \rightPanDel, 0.5]);
		5.yield;
		g = Synth.before(fxsynth, \rainStickGrainVer3, [\rateDens, 4.1, \leftPanSig, 0.5, \rightPanSig, 0.625,\leftPanDel, 0.625, \rightPanDel, 0.75]);
		3.yield;
		h = Synth.before(fxsynth, \rainStickGrainVer3, [\rateDens, 6.7, \leftPanSig, 0.75, \rightPanSig, 0.875, \leftPanDel, 0.875, \rightPanDel, 1.0]);
	})
})
)

~testFx3.play;

(
~testFx4 = Routine({
	1.do({
		var fxsynth;
		//fxsynth = Synth(\revFX);
		fxsynth = Synth(\revFX2);
		a = Synth.before(fxsynth, \rainStickGrainVer2a, [\rateDens, 5.3, \leftPanSig,-1.0, \rightPanSig, -0.875, \leftPanDel, -0.875, \rightPanDel, -0.75]);
		19.yield;
		b = Synth.before(fxsynth, \rainStickGrainVer2a, [\rateDens, 4.7, \leftPanSig, -0.75, \rightPanSig, -0.625,\leftPanDel, -0.625, \rightPanDel, -0.5]);
		17.yield;
		c = Synth.before(fxsynth, \rainStickGrainVer2a, [\rateDens, 4.3, \leftPanSig, -0.5, \rightPanSig, -0.375,\leftPanDel, -0.375, \rightPanDel, -0.25]);
		13.yield;
		d = Synth.before(fxsynth, \rainStickGrainVer2a, [\rateDens, 5.9, \leftPanSig, -0.25, \rightPanSig, -0.125, \leftPanDel, -0.125, \rightPanDel, 0]);
		11.yield;
		e = Synth.before(fxsynth, \rainStickGrainVer2a, [\rateDens, 6.1, \leftPanSig, 0, \rightPanSig, 0.125, \leftPanDel, 0.1255, \rightPanDel, 0.25]);
		7.yield;
		f = Synth.before(fxsynth, \rainStickGrainVer2a, [\rateDens, 3.7, \leftPanSig, 0.25, \rightPanSig, 0.375,\leftPanDel, 0.375, \rightPanDel, 0.5]);
		5.yield;
		g = Synth.before(fxsynth, \rainStickGrainVer2a, [\rateDens, 4.1, \leftPanSig, 0.5, \rightPanSig, 0.625,\leftPanDel, 0.625, \rightPanDel, 0.75]);
		3.yield;
		h = Synth.before(fxsynth, \rainStickGrainVer2a, [\rateDens, 6.7, \leftPanSig, 0.75, \rightPanSig, 0.875, \leftPanDel, 0.875, \rightPanDel, 1.0]);
	})
})
)

~testFx4.play;