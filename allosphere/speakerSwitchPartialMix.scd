(
SynthDef(\switchPartSpeak, {
	var in1, in2, in3, in4, amCycle1, amCycle2, amCycle3, amCycle3;
	in1 = BBandPass.ar(WhiteNoise.ar(multWhite), [part1, part2, part3, part4, part5],      [bw1, bw2, bw3, bw4, bw5],      [amp1, amp2, amp3, amp4, amp5]);
	in2 = BBandPass.ar(WhiteNoise.ar(multWhite), [part6, part7, part8, part9, part10],     [bw6, bw7, bw8, bw9, bw10],     [amp6, amp7, amp8, amp9, amp10]);
	in3 = BBandPass.ar(WhiteNoise.ar(multWhite), [part11, part12, part13, part14, part15], [bw11, bw12, bw13, bw14, bw15], [amp11, amp12, amp13, amp14, amp15]);
	in4 = BBandPass.ar(WhiteNoise.ar(multWhite), [part16, part17, part18, part19, part20], [bw16, bw17, bw18, bw19, bw20], [amp16, amp17, amp19, amp19, amp20]);
	OffsetOut.ar(bus, Mix.new())
})
)

(
SynthDef(\switchPartSpeakVer2, { | durLine = 20, gate = 1, freqAM = 0.2, multAm = 1, multWhite = 1, part1, part2, part3, part4, part5, bw1, bw2, bw3, bw4, bw5, amp1, amp2, amp3, amp4, amp5, posPan |
	var env, amCycle, in;
	env = EnvGen.ar(Env([0,1,0.8,0], [durLine*0.2, durLine, durLine*0.3], [5, 0, -5]), gate, doneAction:2);
	amCycle = SinOsc.kr(freqAM, 0, multAm);
	in = Mix.new(BBandPass.ar(PinkNoise.ar(multWhite), [part1, part2, part3, part4, part5], [bw1, bw2, bw3, bw4, bw5], [amp1, amp2, amp3, amp4, amp5]))*env;
	OffsetOut.ar(0, FreeVerb.ar(Pan2.ar(in, posPan, amCycle)));
}).add;
)
Env([0, 1.0, 0.6, 0], [0.2, 0.5, 0.3], [5, 0, -5]).plot;
Env.new([0, 1, 0.9, 0], [0.1, 0.5, 1],[-5, 0, -5]).plot;
(
SynthDef(\switchPartSpeakVer3, { | durLine = 20, gate = 1, freqAM = 0.2, multAm = 1, multWhite = 1, part1, part2, part3, part4, part5, bw1, bw2, bw3, bw4, bw5, amp1, amp2, amp3, amp4, amp5, posPan |
	var env, amCycle, in, delay;
	//env = EnvGen.ar(Env([0,1,0.8,0], [durLine*0.2, durLine, durLine*0.3], [5, 0, -5]), gate, doneAction:2);
	env = EnvGen.ar(Env([0,1,0.6,0], [durLine*0.2, durLine*0.5, durLine*0.3], [5, 0, -5]), gate, doneAction:2);
	amCycle = SinOsc.kr(freqAM, 0, multAm);
	in = Mix.new(BBandPass.ar(PinkNoise.ar(multWhite), [part1, part2, part3, part4, part5], [bw1, bw2, bw3, bw4, bw5], [amp1, amp2, amp3, amp4, amp5]))*env;
	delay = DelayC.ar(in, 0.1, 0.06, 0.75);
	OffsetOut.ar(0, FreeVerb.ar(Pan2.ar(delay, posPan, amCycle)));
}).add;
)

(
SynthDef(\switchPartSpeakVer3Resonz, { | durLine = 20, gate = 1, freqAM = 0.2, multAm = 1, multWhite = 1, part1, part2, part3, part4, part5, bw1, bw2, bw3, bw4, bw5, amp1, amp2, amp3, amp4, amp5, posPan |
	var env, amCycle, in, delay;
	//env = EnvGen.ar(Env([0,1,0.8,0], [durLine*0.2, durLine, durLine*0.3], [5, 0, -5]), gate, doneAction:2);
	env = EnvGen.ar(Env([0,1,0.6,0], [durLine*0.2, durLine*0.5, durLine*0.3], [5, 0, -5]), gate, doneAction:2);
	amCycle = SinOsc.kr(freqAM, 0, multAm);
	//in = Mix.new(BBandPass.ar(PinkNoise.ar(multWhite), [part1, part2, part3, part4, part5], [bw1, bw2, bw3, bw4, bw5], [amp1, amp2, amp3, amp4, amp5]))*env;
	in = Mix.new(Resonz.ar(PinkNoise.ar(multWhite), [part1, part2, part3, part4, part5], [bw1, bw2, bw3, bw4, bw5], [amp1, amp2, amp3, amp4, amp5]))*env;
	delay = DelayC.ar(in, 0.1, 0.06, 0.75);
	OffsetOut.ar(0, FreeVerb.ar(Pan2.ar(delay, posPan, amCycle)));
}).add;
)

(
SynthDef(\switchPartSpeakVer3ResonzFormant, { | durLine = 20, gate = 20, freqAM = 0.2, multAm = 1, multWhite = 15, part1, part2, part3, part4, part5, bw1, bw2, bw3, bw4, bw5, amp1, amp2, amp3, amp4, amp5, posPan, ampF1 = 0.001, ampF2 = 0.0004, ampF3 = 0.00025, fund = 55, revTime = 10, mix, tail = 0.5|
	var env, amCycle, in, delay, rev, envRev, envClip;
	//env = EnvGen.ar(Env([0,1,0.8,0], [durLine*0.2, durLine, durLine*0.3], [5, 0, -5]), gate, doneAction:2);
	env = EnvGen.ar(Env([0,1,0.6,0], [durLine*0.2, durLine*0.5, durLine*0.3], [4, 0, -5]), gate, doneAction:2);
	envRev = EnvGen.ar(Env([0,1,0.6,0], [durLine*0.2, durLine*0.5, durLine*tail], [5, 0, -5]), gate, doneAction:2);
	envClip = EnvGen.ar(Env([0,1,0.6,0], [durLine*0.2, durLine*0.5, (durLine*tail)*0.97], [5, 0, -5]), gate, doneAction:2);
	amCycle = SinOsc.kr(freqAM, 0, multAm);
	//in = Mix.new(BBandPass.ar(PinkNoise.ar(multWhite), [part1, part2, part3, part4, part5], [bw1, bw2, bw3, bw4, bw5], [amp1, amp2, amp3, amp4, amp5]))*env;
	//in = Mix.new(Resonz.ar(PinkNoise.ar(multWhite), [part1, part2, part3, part4, part5], [bw1, bw2, bw3, bw4, bw5], [amp1, amp2, amp3, amp4, amp5]), Formant.ar(fund, 325, 250, ampF1),  Formant.ar(fund, 900, 600, ampF2), Formant.ar(fund, 2300, 1400, ampF3))*env;
	in = Mix.new(Resonz.ar(PinkNoise.ar(multWhite), [part1, part2, part3, part4, part5]*LFNoise0.kr([12, 10, 11, 13]).range(0.999, 1.001), [bw1, bw2, bw3, bw4, bw5], [amp1, amp2, amp3, amp4, amp5]))*env;
		//in = Mix.new(BBandPass.ar(PinkNoise.ar(multWhite), [part1, part2, part3, part4, part5], [bw1, bw2, bw3, bw4, bw5], [amp1, amp2, amp3, amp4, amp5]))*env;
	//in = Mix.new([Mix.new(BBandPass.ar(PinkNoise.ar(multWhite), [part1, part2, part3, part4, part5], [bw1, bw2, bw3, bw4, bw5], [amp1, amp2, amp3, amp4, amp5])), Formant.ar(fund, 325, 250, ampF1),  Formant.ar(fund, 900, 600, ampF2), Formant.ar(fund, 2300, 1400, ampF3)])*env;
	delay = DelayC.ar(in, 0.1, 0.06, 0.75)*env;
	rev = FreeVerb.ar(Pan2.ar(delay, posPan, amCycle))*env;
	mix = Mix.new(in*0.5, delay*0.75, rev)*env;
	OffsetOut.ar(0, (GVerb.ar(mix, 14, revTime, taillevel: 0.4)*envRev)*envClip);
}).add;
)

(
~fund = 55;
~parts1 = [4, 8, 12, 16, 20]*~fund;
~parts2 = [3, 7, 11, 15, 19]*~fund;
~parts3 = [2, 6, 10, 14, 18]*~fund;
~parts4 = [1, 5,  9, 13, 17]*~fund;
~amps = [ -8.5775862068966, -3.6637931034483, 0, -9.1910112359551, -10, -10.539325842697, -18.23275862069, -12.629310344828, -19.438202247191, -20.606741573034, -20.991379310345, -21.465201465201, -26.300366300366, -27.765567765568, -28.278388278388, -28.644688644689, -28.577586206897, -27.887931034483, -28.318965517241, -29.612068965517 ];
~bw = Array.rand(5, 0.0001, 0.00015);
//~freqAM = [11, 13, 17, 19].normalizeSum * 140;
~freqAM = [2, 3, 5, 7].normalizeSum * 0.1;
//~freqAM = [11, 13, 17, 19].normalize * 20;
)
55.cpsname;
(
a = Synth(\switchPartSpeakVer2, [\part1, ~parts1.at([0]), \part2, ~parts1.at([1]), \part3, ~parts1.at([2]), \part4, ~parts1.at([3]), \part5, ~parts1.at([4]), \bw1, ~bw.at([0]), \bw2, ~bw.at([1]), \bw3, ~bw.at([2]), \bw4, ~bw.at([3]), \bw5, ~bw.at([4]), \amp1, ~amps.dbamp.at([3]), \amp2, ~amps.dbamp.at([7]), \amp3, ~amps.dbamp.at([11]), \amp4, ~amps.dbamp.at([15]), \amp5, ~amps.dbamp.at([19]), \posPan, -1.0]);
b = Synth(\switchPartSpeakVer2, [\part1, ~parts2.at([0]), \part2, ~parts2.at([1]), \part3, ~parts2.at([2]), \part4, ~parts2.at([3]), \part5, ~parts2.at([4]), \bw1, ~bw.at([0]), \bw2, ~bw.at([1]), \bw3, ~bw.at([2]), \bw4, ~bw.at([3]), \bw5, ~bw.at([4]), \amp1, ~amps.dbamp.at([2]), \amp2, ~amps.dbamp.at([6]), \amp3, ~amps.dbamp.at([10]), \amp4, ~amps.dbamp.at([14]), \amp5, ~amps.dbamp.at([18]), \freqAM, 0.3, \posPan, 1.0]);
c = Synth(\switchPartSpeakVer2, [\part1, ~parts3.at([0]), \part2, ~parts3.at([1]), \part3, ~parts3.at([2]), \part4, ~parts3.at([3]), \part5, ~parts3.at([4]), \bw1, ~bw.at([0]), \bw2, ~bw.at([1]), \bw3, ~bw.at([2]), \bw4, ~bw.at([3]), \bw5, ~bw.at([4]), \amp1, ~amps.dbamp.at([1]), \amp2, ~amps.dbamp.at([5]), \amp3, ~amps.dbamp.at([9]), \amp4, ~amps.dbamp.at([13]), \amp5, ~amps.dbamp.at([17]), \freqAM, 0.5, \posPan, -0.5]);
d = Synth(\switchPartSpeakVer2, [\part1, ~parts4.at([0]), \part2, ~parts4.at([1]), \part3, ~parts4.at([2]), \part4, ~parts4.at([3]), \part5, ~parts4.at([4]), \bw1, ~bw.at([0]), \bw2, ~bw.at([1]), \bw3, ~bw.at([2]), \bw4, ~bw.at([3]), \bw5, ~bw.at([4]), \amp1, ~amps.dbamp.at([0]), \amp2, ~amps.dbamp.at([4]), \amp3, ~amps.dbamp.at([8]), \amp4, ~amps.dbamp.at([12]), \amp5, ~amps.dbamp.at([16]), \freqAM, 0.7, \posPan, -0.5]);
)

(
e = Synth(\switchPartSpeakVer3, [\part1, ~parts1.at([0]), \part2, ~parts1.at([1]), \part3, ~parts1.at([2]), \part4, ~parts1.at([3]), \part5, ~parts1.at([4]), \bw1, ~bw.at([0]), \bw2, ~bw.at([1]), \bw3, ~bw.at([2]), \bw4, ~bw.at([3]), \bw5, ~bw.at([4]), \amp1, ~amps.dbamp.at([3]), \amp2, ~amps.dbamp.at([7]), \amp3, ~amps.dbamp.at([11]), \amp4, ~amps.dbamp.at([15]), \amp5, ~amps.dbamp.at([19]), \freqAM, ~freqAM.at([0]),\posPan, -1.0]);
f = Synth(\switchPartSpeakVer3, [\part1, ~parts2.at([0]), \part2, ~parts2.at([1]), \part3, ~parts2.at([2]), \part4, ~parts2.at([3]), \part5, ~parts2.at([4]), \bw1, ~bw.at([0]), \bw2, ~bw.at([1]), \bw3, ~bw.at([2]), \bw4, ~bw.at([3]), \bw5, ~bw.at([4]), \amp1, ~amps.dbamp.at([2]), \amp2, ~amps.dbamp.at([6]), \amp3, ~amps.dbamp.at([10]), \amp4, ~amps.dbamp.at([14]), \amp5, ~amps.dbamp.at([18]), \freqAM, ~freqAM.at([1]), \posPan, 1.0]);
g = Synth(\switchPartSpeakVer3, [\part1, ~parts3.at([0]), \part2, ~parts3.at([1]), \part3, ~parts3.at([2]), \part4, ~parts3.at([3]), \part5, ~parts3.at([4]), \bw1, ~bw.at([0]), \bw2, ~bw.at([1]), \bw3, ~bw.at([2]), \bw4, ~bw.at([3]), \bw5, ~bw.at([4]), \amp1, ~amps.dbamp.at([1]), \amp2, ~amps.dbamp.at([5]), \amp3, ~amps.dbamp.at([9]), \amp4, ~amps.dbamp.at([13]), \amp5, ~amps.dbamp.at([17]), \freqAM, ~freqAM.at([2]), \posPan, -0.5]);
h = Synth(\switchPartSpeakVer3, [\part1, ~parts4.at([0]), \part2, ~parts4.at([1]), \part3, ~parts4.at([2]), \part4, ~parts4.at([3]), \part5, ~parts4.at([4]), \bw1, ~bw.at([0]), \bw2, ~bw.at([1]), \bw3, ~bw.at([2]), \bw4, ~bw.at([3]), \bw5, ~bw.at([4]), \amp1, ~amps.dbamp.at([0]), \amp2, ~amps.dbamp.at([4]), \amp3, ~amps.dbamp.at([8]), \amp4, ~amps.dbamp.at([12]), \amp5, ~amps.dbamp.at([16]), \freqAM, ~freqAM.at([3]), \posPan, -0.5]);
)

(
~routSwitchPartSpeak = Routine({
	var delta, durLine, posPan;
	10.do({
		delta = rrand(2, 5);
		durLine = (7..20);
		posPan = (2/11)*(0..11)-1.0;
		Synth(\switchPartSpeakVer3, [\part1, ~parts1.at([0]), \part2, ~parts1.at([1]), \part3, ~parts1.at([2]), \part4, ~parts1.at([3]), \part5, ~parts1.at([4]), \bw1, ~bw.at([0]), \bw2, ~bw.at([1]), \bw3, ~bw.at([2]), \bw4, ~bw.at([3]), \bw5, ~bw.at([4]), \amp1, ~amps.dbamp.at([3]), \amp2, ~amps.dbamp.at([7]), \amp3, ~amps.dbamp.at([11]), \amp4, ~amps.dbamp.at([15]), \amp5, ~amps.dbamp.at([19]), \freqAM, ~freqAM.at([0]),\posPan, posPan.choose, \durLine, durLine]);
		Synth(\switchPartSpeakVer3, [\part1, ~parts2.at([0]), \part2, ~parts2.at([1]), \part3, ~parts2.at([2]), \part4, ~parts2.at([3]), \part5, ~parts2.at([4]), \bw1, ~bw.at([0]), \bw2, ~bw.at([1]), \bw3, ~bw.at([2]), \bw4, ~bw.at([3]), \bw5, ~bw.at([4]), \amp1, ~amps.dbamp.at([2]), \amp2, ~amps.dbamp.at([6]), \amp3, ~amps.dbamp.at([10]), \amp4, ~amps.dbamp.at([14]), \amp5, ~amps.dbamp.at([18]), \freqAM, ~freqAM.at([1]), \posPan, posPan.choose, \durLine, durLine]);
		Synth(\switchPartSpeakVer3, [\part1, ~parts3.at([0]), \part2, ~parts3.at([1]), \part3, ~parts3.at([2]), \part4, ~parts3.at([3]), \part5, ~parts3.at([4]), \bw1, ~bw.at([0]), \bw2, ~bw.at([1]), \bw3, ~bw.at([2]), \bw4, ~bw.at([3]), \bw5, ~bw.at([4]), \amp1, ~amps.dbamp.at([1]), \amp2, ~amps.dbamp.at([5]), \amp3, ~amps.dbamp.at([9]), \amp4, ~amps.dbamp.at([13]), \amp5, ~amps.dbamp.at([17]), \freqAM, ~freqAM.at([2]), \posPan, posPan.choose, \durLine, durLine]);
		Synth(\switchPartSpeakVer3, [\part1, ~parts4.at([0]), \part2, ~parts4.at([1]), \part3, ~parts4.at([2]), \part4, ~parts4.at([3]), \part5, ~parts4.at([4]), \bw1, ~bw.at([0]), \bw2, ~bw.at([1]), \bw3, ~bw.at([2]), \bw4, ~bw.at([3]), \bw5, ~bw.at([4]), \amp1, ~amps.dbamp.at([0]), \amp2, ~amps.dbamp.at([4]), \amp3, ~amps.dbamp.at([8]), \amp4, ~amps.dbamp.at([12]), \amp5, ~amps.dbamp.at([16]), \freqAM, ~freqAM.at([3]), \posPan, posPan.choose, \durLine, durLine]);
		delta.yield;
	})
})
)
~routSwitchPartSpeak.play;
~routSwitchPartSpeak.stop;

(
~routSwitchPartSpeakRes = Routine({
	var delta, durLine, posPan;
	10.do({
		delta = rrand(2, 5);
		durLine = (7..20);
		posPan = (2/11)*(0..11)-1.0;
		Synth(\switchPartSpeakVer3Resonz, [\part1, ~parts1.at([0]), \part2, ~parts1.at([1]), \part3, ~parts1.at([2]), \part4, ~parts1.at([3]), \part5, ~parts1.at([4]), \bw1, ~bw.at([0]), \bw2, ~bw.at([1]), \bw3, ~bw.at([2]), \bw4, ~bw.at([3]), \bw5, ~bw.at([4]), \amp1, ~amps.dbamp.at([3]), \amp2, ~amps.dbamp.at([7]), \amp3, ~amps.dbamp.at([11]), \amp4, ~amps.dbamp.at([15]), \amp5, ~amps.dbamp.at([19]), \freqAM, ~freqAM.at([0]),\posPan, posPan.choose, \durLine, durLine]);
		Synth(\switchPartSpeakVer3Resonz, [\part1, ~parts2.at([0]), \part2, ~parts2.at([1]), \part3, ~parts2.at([2]), \part4, ~parts2.at([3]), \part5, ~parts2.at([4]), \bw1, ~bw.at([0]), \bw2, ~bw.at([1]), \bw3, ~bw.at([2]), \bw4, ~bw.at([3]), \bw5, ~bw.at([4]), \amp1, ~amps.dbamp.at([2]), \amp2, ~amps.dbamp.at([6]), \amp3, ~amps.dbamp.at([10]), \amp4, ~amps.dbamp.at([14]), \amp5, ~amps.dbamp.at([18]), \freqAM, ~freqAM.at([1]), \posPan, posPan.choose, \durLine, durLine]);
		Synth(\switchPartSpeakVer3Resonz, [\part1, ~parts3.at([0]), \part2, ~parts3.at([1]), \part3, ~parts3.at([2]), \part4, ~parts3.at([3]), \part5, ~parts3.at([4]), \bw1, ~bw.at([0]), \bw2, ~bw.at([1]), \bw3, ~bw.at([2]), \bw4, ~bw.at([3]), \bw5, ~bw.at([4]), \amp1, ~amps.dbamp.at([1]), \amp2, ~amps.dbamp.at([5]), \amp3, ~amps.dbamp.at([9]), \amp4, ~amps.dbamp.at([13]), \amp5, ~amps.dbamp.at([17]), \freqAM, ~freqAM.at([2]), \posPan, posPan.choose, \durLine, durLine]);
		Synth(\switchPartSpeakVer3Resonz, [\part1, ~parts4.at([0]), \part2, ~parts4.at([1]), \part3, ~parts4.at([2]), \part4, ~parts4.at([3]), \part5, ~parts4.at([4]), \bw1, ~bw.at([0]), \bw2, ~bw.at([1]), \bw3, ~bw.at([2]), \bw4, ~bw.at([3]), \bw5, ~bw.at([4]), \amp1, ~amps.dbamp.at([0]), \amp2, ~amps.dbamp.at([4]), \amp3, ~amps.dbamp.at([8]), \amp4, ~amps.dbamp.at([12]), \amp5, ~amps.dbamp.at([16]), \freqAM, ~freqAM.at([3]), \posPan, posPan.choose, \durLine, durLine]);
		delta.yield;
	})
})
)

~routSwitchPartSpeakRes.play;
~routSwitchPartSpeakRes.stop;

(
~routSwitchPartSpeakResForm = Routine({
	var delta, durLine, posPan, revTime, tail;
	10.do{
		delta = rrand(2, 5);
		durLine = rrand(7, 20);
		posPan = (2/11)*(0..11)-1.0;
		revTime = rrand(10, 15);
		Synth(\switchPartSpeakVer3ResonzFormant, [\part1, ~parts1.at([0]), \part2, ~parts1.at([1]), \part3, ~parts1.at([2]), \part4, ~parts1.at([3]), \part5, ~parts1.at([4]), \bw1, ~bw.at([0]), \bw2, ~bw.at([1]), \bw3, ~bw.at([2]), \bw4, ~bw.at([3]), \bw5, ~bw.at([4]), \amp1, ~amps.dbamp.at([3]), \amp2, ~amps.dbamp.at([7]), \amp3, ~amps.dbamp.at([11]), \amp4, ~amps.dbamp.at([15]), \amp5, ~amps.dbamp.at([19]), \freqAM, ~freqAM.at([0]),\posPan, posPan.choose, \durLine, durLine, \revTime, revTime]);
		Synth(\switchPartSpeakVer3ResonzFormant, [\part1, ~parts2.at([0]), \part2, ~parts2.at([1]), \part3, ~parts2.at([2]), \part4, ~parts2.at([3]), \part5, ~parts2.at([4]), \bw1, ~bw.at([0]), \bw2, ~bw.at([1]), \bw3, ~bw.at([2]), \bw4, ~bw.at([3]), \bw5, ~bw.at([4]), \amp1, ~amps.dbamp.at([2]), \amp2, ~amps.dbamp.at([6]), \amp3, ~amps.dbamp.at([10]), \amp4, ~amps.dbamp.at([14]), \amp5, ~amps.dbamp.at([18]), \freqAM, ~freqAM.at([1]), \posPan, posPan.choose, \durLine, durLine, \revTime, revTime]);
		Synth(\switchPartSpeakVer3ResonzFormant, [\part1, ~parts3.at([0]), \part2, ~parts3.at([1]), \part3, ~parts3.at([2]), \part4, ~parts3.at([3]), \part5, ~parts3.at([4]), \bw1, ~bw.at([0]), \bw2, ~bw.at([1]), \bw3, ~bw.at([2]), \bw4, ~bw.at([3]), \bw5, ~bw.at([4]), \amp1, ~amps.dbamp.at([1]), \amp2, ~amps.dbamp.at([5]), \amp3, ~amps.dbamp.at([9]), \amp4, ~amps.dbamp.at([13]), \amp5, ~amps.dbamp.at([17]), \freqAM, ~freqAM.at([2]), \posPan, posPan.choose, \durLine, durLine, \revTime, revTime]);
		Synth(\switchPartSpeakVer3ResonzFormant, [\part1, ~parts4.at([0]), \part2, ~parts4.at([1]), \part3, ~parts4.at([2]), \part4, ~parts4.at([3]), \part5, ~parts4.at([4]), \bw1, ~bw.at([0]), \bw2, ~bw.at([1]), \bw3, ~bw.at([2]), \bw4, ~bw.at([3]), \bw5, ~bw.at([4]), \amp1, ~amps.dbamp.at([0]), \amp2, ~amps.dbamp.at([4]), \amp3, ~amps.dbamp.at([8]), \amp4, ~amps.dbamp.at([12]), \amp5, ~amps.dbamp.at([16]), \freqAM, ~freqAM.at([3]), \posPan, posPan.choose, \durLine, durLine, \revTime, revTime]);
		delta.yield;
	};
	15.do{
		delta = rrand(1, 4);
		durLine = rrand(7, 13);
		posPan = (2/11)*(0..11)-1.0;
		revTime = rrand(15, 20);
		tail = rrand(0.5, 0.7);
		Synth(\switchPartSpeakVer3ResonzFormant, [\part1, ~parts1.at([0]), \part2, ~parts1.at([1]), \part3, ~parts1.at([2]), \part4, ~parts1.at([3]), \part5, ~parts1.at([4]), \bw1, ~bw.at([0]), \bw2, ~bw.at([1]), \bw3, ~bw.at([2]), \bw4, ~bw.at([3]), \bw5, ~bw.at([4]), \amp1, ~amps.dbamp.at([3]), \amp2, ~amps.dbamp.at([7]), \amp3, ~amps.dbamp.at([11]), \amp4, ~amps.dbamp.at([15]), \amp5, ~amps.dbamp.at([19]), \freqAM, ~freqAM.at([0]),\posPan, posPan.choose, \durLine, durLine, \revTime, revTime, \tail, tail]);
		Synth(\switchPartSpeakVer3ResonzFormant, [\part1, ~parts2.at([0]), \part2, ~parts2.at([1]), \part3, ~parts2.at([2]), \part4, ~parts2.at([3]), \part5, ~parts2.at([4]), \bw1, ~bw.at([0]), \bw2, ~bw.at([1]), \bw3, ~bw.at([2]), \bw4, ~bw.at([3]), \bw5, ~bw.at([4]), \amp1, ~amps.dbamp.at([2]), \amp2, ~amps.dbamp.at([6]), \amp3, ~amps.dbamp.at([10]), \amp4, ~amps.dbamp.at([14]), \amp5, ~amps.dbamp.at([18]), \freqAM, ~freqAM.at([1]), \posPan, posPan.choose, \durLine, durLine, \revTime, revTime, \tail, tail]);
		Synth(\switchPartSpeakVer3ResonzFormant, [\part1, ~parts3.at([0]), \part2, ~parts3.at([1]), \part3, ~parts3.at([2]), \part4, ~parts3.at([3]), \part5, ~parts3.at([4]), \bw1, ~bw.at([0]), \bw2, ~bw.at([1]), \bw3, ~bw.at([2]), \bw4, ~bw.at([3]), \bw5, ~bw.at([4]), \amp1, ~amps.dbamp.at([1]), \amp2, ~amps.dbamp.at([5]), \amp3, ~amps.dbamp.at([9]), \amp4, ~amps.dbamp.at([13]), \amp5, ~amps.dbamp.at([17]), \freqAM, ~freqAM.at([2]), \posPan, posPan.choose, \durLine, durLine, \revTime, revTime, \tail, tail]);
		Synth(\switchPartSpeakVer3ResonzFormant, [\part1, ~parts4.at([0]), \part2, ~parts4.at([1]), \part3, ~parts4.at([2]), \part4, ~parts4.at([3]), \part5, ~parts4.at([4]), \bw1, ~bw.at([0]), \bw2, ~bw.at([1]), \bw3, ~bw.at([2]), \bw4, ~bw.at([3]), \bw5, ~bw.at([4]), \amp1, ~amps.dbamp.at([0]), \amp2, ~amps.dbamp.at([4]), \amp3, ~amps.dbamp.at([8]), \amp4, ~amps.dbamp.at([12]), \amp5, ~amps.dbamp.at([16]), \freqAM, ~freqAM.at([3]), \posPan, posPan.choose, \durLine, durLine, \revTime, revTime, \tail, tail]);
		delta.yield;
	};
	20.do{
		delta = rrand(0.5, 3);
		durLine = rrand(5,11);
		posPan = (2/11)*(0..11)-1.0;
		revTime = rrand(20, 25);
		tail = rrand(0.7,0.9);
		Synth(\switchPartSpeakVer3ResonzFormant, [\part1, ~parts1.at([0]), \part2, ~parts1.at([1]), \part3, ~parts1.at([2]), \part4, ~parts1.at([3]), \part5, ~parts1.at([4]), \bw1, ~bw.at([0]), \bw2, ~bw.at([1]), \bw3, ~bw.at([2]), \bw4, ~bw.at([3]), \bw5, ~bw.at([4]), \amp1, ~amps.dbamp.at([3]), \amp2, ~amps.dbamp.at([7]), \amp3, ~amps.dbamp.at([11]), \amp4, ~amps.dbamp.at([15]), \amp5, ~amps.dbamp.at([19]), \freqAM, ~freqAM.at([0]),\posPan, posPan.choose, \durLine, durLine, \revTime, revTime, \tail, tail, \taillevel, 0.1]);
		Synth(\switchPartSpeakVer3ResonzFormant, [\part1, ~parts2.at([0]), \part2, ~parts2.at([1]), \part3, ~parts2.at([2]), \part4, ~parts2.at([3]), \part5, ~parts2.at([4]), \bw1, ~bw.at([0]), \bw2, ~bw.at([1]), \bw3, ~bw.at([2]), \bw4, ~bw.at([3]), \bw5, ~bw.at([4]), \amp1, ~amps.dbamp.at([2]), \amp2, ~amps.dbamp.at([6]), \amp3, ~amps.dbamp.at([10]), \amp4, ~amps.dbamp.at([14]), \amp5, ~amps.dbamp.at([18]), \freqAM, ~freqAM.at([1]), \posPan, posPan.choose, \durLine, durLine, \revTime, revTime, \tail, tail, \taillevel, 0.1]);
		Synth(\switchPartSpeakVer3ResonzFormant, [\part1, ~parts3.at([0]), \part2, ~parts3.at([1]), \part3, ~parts3.at([2]), \part4, ~parts3.at([3]), \part5, ~parts3.at([4]), \bw1, ~bw.at([0]), \bw2, ~bw.at([1]), \bw3, ~bw.at([2]), \bw4, ~bw.at([3]), \bw5, ~bw.at([4]), \amp1, ~amps.dbamp.at([1]), \amp2, ~amps.dbamp.at([5]), \amp3, ~amps.dbamp.at([9]), \amp4, ~amps.dbamp.at([13]), \amp5, ~amps.dbamp.at([17]), \freqAM, ~freqAM.at([2]), \posPan, posPan.choose, \durLine, durLine, \revTime, revTime, \tail, tail, \taillevel, 0.1]);
		Synth(\switchPartSpeakVer3ResonzFormant, [\part1, ~parts4.at([0]), \part2, ~parts4.at([1]), \part3, ~parts4.at([2]), \part4, ~parts4.at([3]), \part5, ~parts4.at([4]), \bw1, ~bw.at([0]), \bw2, ~bw.at([1]), \bw3, ~bw.at([2]), \bw4, ~bw.at([3]), \bw5, ~bw.at([4]), \amp1, ~amps.dbamp.at([0]), \amp2, ~amps.dbamp.at([4]), \amp3, ~amps.dbamp.at([8]), \amp4, ~amps.dbamp.at([12]), \amp5, ~amps.dbamp.at([16]), \freqAM, ~freqAM.at([3]), \posPan, posPan.choose, \durLine, durLine, \revTime, revTime, \tail, tail, \taillevel, 0.1]);
		delta.yield;
	};
})
)

~routSwitchPartSpeakResForm.play;
~routSwitchPartSpeakResFrom.stop;