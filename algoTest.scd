(
SynthDef(\algoTest, { | ratePan = 0.08, left = -1.0, right = 1.0, rateAmpSrc = 20, loAmpSrc = 0.4, hiAmpSrc = 1.0, dens = 5, attDec = 0.01, decDec = 0.4, ampPink = 1.5, freq = 220, arrFreq = #[1,2,3,4,5,6,7,8,9,10,11,12], bw = 0.001, arrBw = #[1,2,3,4,5,6,6,5,4,3,2,1], amp = 1.0, arrAmp = #[0.6,0.5,0.4,0.5,0.4,0.3,0.4,0.3,0.2,0.3,0.2,0.1], panSrc = 0.0, levSrc = 1.0 |
	var  env, in;
	env = EnvGen.kr(Env([0, 1, 0.3, 0.7, 0], [0.001, Rand(0.025, 0.04), Rand(0.015, 0.01), 0.1], [8, -8, -4, -8]), doneAction:2);
	in = Pan2.ar(Mix.new(BBandPass.ar(PinkNoise.ar(ampPink), freq * arrFreq, bw * arrBw, amp * arrAmp*20)), panSrc, levSrc);
	OffsetOut.ar(0, HPF.ar(in*env, 30));
}).send(s);

≥≥
)

Synth(\algoTest, [\freq, 440]);

(
var n, octaves, basenote, selections, probs;
var ioirow, ioimult, noterow, amprow, bwrow, panrow;
var fxsynth;

n=12; //notes per octave

fxsynth= Synth(\goeyfx);

noterow=(0..(n-1)).scramble; //[4,0,5,14,13,15,21,19,20,11,6,10]%12;
amprow= Pseq((1,3..36).neg.dbamp.scramble,inf).asStream;
bwrow= Pseq((((1..37)/37).exp/exp(4)).scramble,inf).asStream;
panrow= Pseq((((0..31)/31)*2-1).scramble,inf).asStream.trace;

ioimult=0.1;

ioirow= n**(((1..n).scramble)/n); //exponential spacing 1 to n
ioirow= Pseq(ioirow,inf).asStream;

basenote=36;
octaves=4;
selections= Array.fill(n,{0});
probs=Array.fill(n,{1.0});

{

inf.do
{
	var notenow;

	if(ioimult.coin,{ioimult=[0.01,0.025,0.05,0.1,0.2].choose;});

	if(0.03.coin,{selections= Array.fill(n,{0});});
	if(0.02.coin,{octaves= rrand(2,5);});
	if(0.01.coin,{basenote=rrand(35,47);});

	//recovery rate
	probs.do{|val,i| if(val<0.9999,{probs[i]=probs[i]+0.1})};

	s.makeBundle(s.latency, {
		[1,2,3,4,5].wchoose([0.5,0.35,0.1,0.025,0.025]).do{
			notenow= noterow.wchoose(probs.normalizeSum);

			probs[notenow]=0.1;

			selections[notenow]=selections[notenow]+1;

			Synth.before(fxsynth, \algoTest,[\freq, ((((selections[notenow]%octaves)*12)+ basenote) + ((notenow/n)*12)).midicps,\amp,(amprow.next)*0.2, \bw, bwrow.next, \pan, panrow.next]);

		};

	});

	((ioirow.next)*ioimult).wait;
};

}.fork;

)
Array.rand(12, 1.0, 3.0);
(
var markovmatrix, bwarray, amparray;
var currentstate=3.rand; //start in one of three states
var currentstateBW=3.rand; //start in one of three states
var test = [0,1,2];


markovmatrix= [
[0.7,0.1,0.2],
[0.2,0.7,0.1],
[0.1,0.2,0.7]
];

bwarray = [Array.rand(12, 0.3, 0.5), Array.rand(12, 5, 7), Array.rand(12, 70, 100)];

{
	inf.do{
		Synth(\algoTest,[\freq, [48,72, 96].at(currentstate).midicps, \arrBw, bwarray.at(currentstateBW)]);

			//which probability distribution to use depends on what state we're in right now
			currentstate = [0,1,2].wchoose(markovmatrix[currentstate]).postln;
		    currentstateBW = [0,1,2].wchoose(markovmatrix[currentstateBW]).postln;
			1.0.wait;
			};

}.fork;
)