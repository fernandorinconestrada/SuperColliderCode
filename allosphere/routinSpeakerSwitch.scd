(
SynthDef(\switchPartSpeakVer4ResonzFormant, { | durLine = 20, gate = 17, freqAM = 0.2, multAm = 1, multWhite = 20, part1, part2, part3, part4, part5, bw1, bw2, bw3, bw4, bw5, amp1, amp2, amp3, amp4, amp5, posPan, ampF1 = 0.6, ampF2 = 0.4, ampF3 = 0.25, fund = 55, revTime = 10, bus = 0, tail = 0.5|
	var env, amCycle, in, delay, rev, envRev, mix, envClip;
	//env = EnvGen.ar(Env([0,1,0.8,0], [durLine*0.2, durLine, durLine*0.3], [5, 0, -5]), gate, doneAction:2);
	env = EnvGen.ar(Env([0,1,0.6,0], [durLine*0.2, durLine*0.5, durLine*0.5], [4, 0, -5]), gate, doneAction:2);
	envRev = EnvGen.ar(Env([0,1,0.6,0], [durLine*0.2, durLine*0.5, durLine*tail], [5, 0, -5]), gate, doneAction:2);
	envClip = EnvGen.ar(Env([0,1,0.6,0], [durLine*0.2, durLine*0.5, (durLine*tail)*0.97], [5, 0, -5]), gate, doneAction:2);
	amCycle = SinOsc.kr(freqAM, 0, multAm);
	//in = Mix.new(BBandPass.ar(PinkNoise.ar(multWhite), [part1, part2, part3, part4, part5], [bw1, bw2, bw3, bw4, bw5], [amp1, amp2, amp3, amp4, amp5]))*env;
	in = Mix.new(Resonz.ar(PinkNoise.ar(multWhite), [part1, part2, part3, part4, part5]*LFNoise0.kr([8, 10, 11, 13, 16]).range(0.998, 1.002), [bw1, bw2, bw3, bw4, bw5], [amp1, amp2, amp3, amp4, amp5]))*env;
	delay = DelayC.ar(in, 0.1, 0.06, 0.75)*env;
	rev = FreeVerb.ar(delay)*env;
	mix = Mix.new([in*0.5, delay*0.75, rev*amCycle])*env;
	OffsetOut.ar(bus, (GVerb.ar(mix, 14, revTime, taillevel:0.4)*envRev)*envClip);
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

(
~speakSeq1 = Routine({inf.do{|i| i.yield;}});
~speakSeq2 = Routine({inf.do{|i| i.yield;}});
~speakSeq3 = Routine({inf.do{|i| i.yield;}});
~speakSeq4 = Routine({inf.do{|i| i.yield;}});
~routSwitchPartSpeakResForm = Routine({
	var delta, durLine, posPan, revTime, tail;
	12.do{
		delta = rrand(2, 5);
		durLine = rrand(7, 20);
		revTime = rrand(10, 15);
		Synth(\switchPartSpeakVer4ResonzFormant, [\part1, ~parts1.at([0]), \part2, ~parts1.at([1]), \part3, ~parts1.at([2]), \part4, ~parts1.at([3]), \part5, ~parts1.at([4]), \bw1, ~bw.at([0]), \bw2, ~bw.at([1]), \bw3, ~bw.at([2]), \bw4, ~bw.at([3]), \bw5, ~bw.at([4]), \amp1, ~amps.dbamp.at([3]), \amp2, ~amps.dbamp.at([7]), \amp3, ~amps.dbamp.at([11]), \amp4, ~amps.dbamp.at([15]), \amp5, ~amps.dbamp.at([19]), \freqAM, ~freqAM.at([0]), \durLine, durLine, \revTime, revTime, \bus, ~speakSeq1.value.wrap(0,11)]);
		Synth(\switchPartSpeakVer4ResonzFormant, [\part1, ~parts2.at([0]), \part2, ~parts2.at([1]), \part3, ~parts2.at([2]), \part4, ~parts2.at([3]), \part5, ~parts2.at([4]), \bw1, ~bw.at([0]), \bw2, ~bw.at([1]), \bw3, ~bw.at([2]), \bw4, ~bw.at([3]), \bw5, ~bw.at([4]), \amp1, ~amps.dbamp.at([2]), \amp2, ~amps.dbamp.at([6]), \amp3, ~amps.dbamp.at([10]), \amp4, ~amps.dbamp.at([14]), \amp5, ~amps.dbamp.at([18]), \freqAM, ~freqAM.at([1]),  \durLine, durLine, \revTime, revTime, \bus, ~speakSeq2.value.wrap(12,27)]);
		Synth(\switchPartSpeakVer4ResonzFormant, [\part1, ~parts3.at([0]), \part2, ~parts3.at([1]), \part3, ~parts3.at([2]), \part4, ~parts3.at([3]), \part5, ~parts3.at([4]), \bw1, ~bw.at([0]), \bw2, ~bw.at([1]), \bw3, ~bw.at([2]), \bw4, ~bw.at([3]), \bw5, ~bw.at([4]), \amp1, ~amps.dbamp.at([1]), \amp2, ~amps.dbamp.at([5]), \amp3, ~amps.dbamp.at([9]), \amp4, ~amps.dbamp.at([13]), \amp5, ~amps.dbamp.at([17]), \freqAM, ~freqAM.at([2]),  \durLine, durLine, \revTime, revTime, \bus, 67 - ~speakSeq3.value.wrap(27,41)]);
		Synth(\switchPartSpeakVer4ResonzFormant, [\part1, ~parts4.at([0]), \part2, ~parts4.at([1]), \part3, ~parts4.at([2]), \part4, ~parts4.at([3]), \part5, ~parts4.at([4]), \bw1, ~bw.at([0]), \bw2, ~bw.at([1]), \bw3, ~bw.at([2]), \bw4, ~bw.at([3]), \bw5, ~bw.at([4]), \amp1, ~amps.dbamp.at([0]), \amp2, ~amps.dbamp.at([4]), \amp3, ~amps.dbamp.at([8]), \amp4, ~amps.dbamp.at([12]), \amp5, ~amps.dbamp.at([16]), \freqAM, ~freqAM.at([3]),  \durLine, durLine, \revTime, revTime, \bus, ~speakSeq4.value.wrap(42,54)]);
		delta.yield;
	};
	15.do{
		delta = rrand(1, 4);
		durLine = rrand(7, 13);
		revTime = rrand(15, 20);
		tail = rrand(0.5, 0.7);
		Synth(\switchPartSpeakVer4ResonzFormant, [\part1, ~parts1.at([0]), \part2, ~parts1.at([1]), \part3, ~parts1.at([2]), \part4, ~parts1.at([3]), \part5, ~parts1.at([4]), \bw1, ~bw.at([0]), \bw2, ~bw.at([1]), \bw3, ~bw.at([2]), \bw4, ~bw.at([3]), \bw5, ~bw.at([4]), \amp1, ~amps.dbamp.at([3]), \amp2, ~amps.dbamp.at([7]), \amp3, ~amps.dbamp.at([11]), \amp4, ~amps.dbamp.at([15]), \amp5, ~amps.dbamp.at([19]), \freqAM, ~freqAM.at([0]), \durLine, durLine, \revTime, revTime, \bus, ~speakSeq1.value.wrap(0,11), \revTime, revTime, \tail, tail]);
		Synth(\switchPartSpeakVer4ResonzFormant, [\part1, ~parts2.at([0]), \part2, ~parts2.at([1]), \part3, ~parts2.at([2]), \part4, ~parts2.at([3]), \part5, ~parts2.at([4]), \bw1, ~bw.at([0]), \bw2, ~bw.at([1]), \bw3, ~bw.at([2]), \bw4, ~bw.at([3]), \bw5, ~bw.at([4]), \amp1, ~amps.dbamp.at([2]), \amp2, ~amps.dbamp.at([6]), \amp3, ~amps.dbamp.at([10]), \amp4, ~amps.dbamp.at([14]), \amp5, ~amps.dbamp.at([18]), \freqAM, ~freqAM.at([1]),  \durLine, durLine, \revTime, revTime, \bus, ~speakSeq2.value.wrap(12,27), \revTime, revTime, \tail, tail]);
		Synth(\switchPartSpeakVer4ResonzFormant, [\part1, ~parts3.at([0]), \part2, ~parts3.at([1]), \part3, ~parts3.at([2]), \part4, ~parts3.at([3]), \part5, ~parts3.at([4]), \bw1, ~bw.at([0]), \bw2, ~bw.at([1]), \bw3, ~bw.at([2]), \bw4, ~bw.at([3]), \bw5, ~bw.at([4]), \amp1, ~amps.dbamp.at([1]), \amp2, ~amps.dbamp.at([5]), \amp3, ~amps.dbamp.at([9]), \amp4, ~amps.dbamp.at([13]), \amp5, ~amps.dbamp.at([17]), \freqAM, ~freqAM.at([2]),  \durLine, durLine, \revTime, revTime, \bus, 67 - ~speakSeq3.value.wrap(27,41), \revTime, revTime, \tail, tail]);
		Synth(\switchPartSpeakVer4ResonzFormant, [\part1, ~parts4.at([0]), \part2, ~parts4.at([1]), \part3, ~parts4.at([2]), \part4, ~parts4.at([3]), \part5, ~parts4.at([4]), \bw1, ~bw.at([0]), \bw2, ~bw.at([1]), \bw3, ~bw.at([2]), \bw4, ~bw.at([3]), \bw5, ~bw.at([4]), \amp1, ~amps.dbamp.at([0]), \amp2, ~amps.dbamp.at([4]), \amp3, ~amps.dbamp.at([8]), \amp4, ~amps.dbamp.at([12]), \amp5, ~amps.dbamp.at([16]), \freqAM, ~freqAM.at([3]),  \durLine, durLine, \revTime, revTime, \bus, ~speakSeq4.value.wrap(42,54), \revTime, revTime, \tail, tail]);
		delta.yield;
	};
	24.do{
		delta = rrand(0.5, 3);
		durLine = rrand(5,11);
		revTime = rrand(20, 25);
		tail = rrand(0.7, 0.9);
		Synth(\switchPartSpeakVer4ResonzFormant, [\part1, ~parts1.at([0]), \part2, ~parts1.at([1]), \part3, ~parts1.at([2]), \part4, ~parts1.at([3]), \part5, ~parts1.at([4]), \bw1, ~bw.at([0]), \bw2, ~bw.at([1]), \bw3, ~bw.at([2]), \bw4, ~bw.at([3]), \bw5, ~bw.at([4]), \amp1, ~amps.dbamp.at([3]), \amp2, ~amps.dbamp.at([7]), \amp3, ~amps.dbamp.at([11]), \amp4, ~amps.dbamp.at([15]), \amp5, ~amps.dbamp.at([19]), \freqAM, ~freqAM.at([0]), \durLine, durLine, \revTime, revTime, \bus, ~speakSeq1.value.wrap(0,11), \revTime, revTime, \tail, tail, \taillevel, 0.1]);
		Synth(\switchPartSpeakVer4ResonzFormant, [\part1, ~parts2.at([0]), \part2, ~parts2.at([1]), \part3, ~parts2.at([2]), \part4, ~parts2.at([3]), \part5, ~parts2.at([4]), \bw1, ~bw.at([0]), \bw2, ~bw.at([1]), \bw3, ~bw.at([2]), \bw4, ~bw.at([3]), \bw5, ~bw.at([4]), \amp1, ~amps.dbamp.at([2]), \amp2, ~amps.dbamp.at([6]), \amp3, ~amps.dbamp.at([10]), \amp4, ~amps.dbamp.at([14]), \amp5, ~amps.dbamp.at([18]), \freqAM, ~freqAM.at([1]),  \durLine, durLine, \revTime, revTime, \bus, ~speakSeq2.value.wrap(12,27), \revTime, revTime, \tail, tail, \taillevel, 0.1]);
		Synth(\switchPartSpeakVer4ResonzFormant, [\part1, ~parts3.at([0]), \part2, ~parts3.at([1]), \part3, ~parts3.at([2]), \part4, ~parts3.at([3]), \part5, ~parts3.at([4]), \bw1, ~bw.at([0]), \bw2, ~bw.at([1]), \bw3, ~bw.at([2]), \bw4, ~bw.at([3]), \bw5, ~bw.at([4]), \amp1, ~amps.dbamp.at([1]), \amp2, ~amps.dbamp.at([5]), \amp3, ~amps.dbamp.at([9]), \amp4, ~amps.dbamp.at([13]), \amp5, ~amps.dbamp.at([17]), \freqAM, ~freqAM.at([2]),  \durLine, durLine, \revTime, revTime, \bus, 67 - ~speakSeq3.value.wrap(27,41), \revTime, revTime, \tail, tail, \taillevel, 0.1]);
		Synth(\switchPartSpeakVer4ResonzFormant, [\part1, ~parts4.at([0]), \part2, ~parts4.at([1]), \part3, ~parts4.at([2]), \part4, ~parts4.at([3]), \part5, ~parts4.at([4]), \bw1, ~bw.at([0]), \bw2, ~bw.at([1]), \bw3, ~bw.at([2]), \bw4, ~bw.at([3]), \bw5, ~bw.at([4]), \amp1, ~amps.dbamp.at([0]), \amp2, ~amps.dbamp.at([4]), \amp3, ~amps.dbamp.at([8]), \amp4, ~amps.dbamp.at([12]), \amp5, ~amps.dbamp.at([16]), \freqAM, ~freqAM.at([3]),  \durLine, durLine, \revTime, revTime, \bus, ~speakSeq4.value.wrap(42,54), \revTime, revTime, \tail, tail, \taillevel, 0.1]);
		delta.yield;
	};
})
)

~routSwitchPartSpeakResForm.play;
~routSwitchPartSpeakResFrom.stop;
~routSwitchPartSpeakResFrom.reset;

s.prepareForRecord("/Users/fernandorincon/Music/SuperCollider Recordings/allosphere/switchSpeaker/RoutAlloSwitch_Take2.aif");
s.record;
s.stopRecording;


~speakSeq1.reset; ~speakSeq2.reset; ~speakSeq3.reset; ~speakSeq4.reset;