(
SynthDef(\algoTest2, { |bus = 0, freq = 440, fb = 0.5, pan = 0.0, level = 1.0, del = 0.02 |
	var in;
	in = SinOscFB.ar(freq, fb, EnvGen.ar(Env([0, 1.0, 0.3, 0.5, 0], [0.01, Rand(0.01, 0.03), Rand(0.02, 0.03), Rand(0.3, 0.8)], [8, -8, 8, -8]), doneAction:2) * AmpComp.ir(freq));
	OffsetOut.ar(bus, Pan2.ar(HPF.ar(in, 30), pan, LFNoise0.kr(20, 0.3, 0.01)));
	OffsetOut.ar(bus, LPF.ar(Pan2.ar(DelayC.ar(in, 0.2, del, LFNoise0.kr(20, 0.4, 0.05)), LFNoise0.kr(30).range(-1.0, 1.0)), 16000));
}).send(s);

SynthDef(\goeyfx, {
	ReplaceOut.ar(0,FreeVerb.ar(In.ar(0,2),LFNoise0.kr(3, 0.22, 0.11), LFNoise0.kr(2, 1.2, 0.3)))
}).send(s);
)

(
var markovmatrix, markovmatrix2, fxsynth;
var currentstate=3.rand; //start in one of three states
var currentstateFB=3.rand;
var currentstateDel=3.rand;
var currentstatePan=4.rand;

fxsynth = Synth(\goeyfx);

markovmatrix= [
[0.7,0.2,0.1],
[0.0,0.5,0.5],
[0.3,0.4,0.3]
];

markovmatrix2= [
[0.65,0.25, 0.15, 0.05],
[0.0,0.3,0.3,0.4],
[0.25,0.25, 0.25, 0.25],
[0.2, 0.3, 0.4, 0.1]
];


{
	inf.do{
		Synth.before(fxsynth, \algoTest2,[\bus, 6, \freq, [[55, 165, 495].wchoose([0.5, 0.4, 0.1]), [123.75, 371.25, 1113.75 ].wchoose([0.3, 0.6, 0.1]), [165, 495, 1485].wchoose([0.4, 0.3, 0.3])].at(currentstate), \fb, [0.3, 0.6, 0.8].at(currentstateFB), \pan, [ 0.7, -0.25, 0.25, 0.7].at(currentstatePan), \del, [0.02, 0.04, 0.06].at(currentstateDel)]);

			//which probability distribution to use depends on what state we're in right now
			currentstate = [0,1,2].wchoose(markovmatrix[currentstate]);
		    currentstateFB = [0,1,2].wchoose(markovmatrix[currentstateFB]);
		    currentstateDel = [0,1,2].wchoose(markovmatrix[currentstateDel]);
		    currentstatePan = [0,1,2,3].wchoose(markovmatrix2[currentstatePan]);


		rrand(0.1, 2.0).wait;
			};

}.fork;
)

(
var markovmatrix, markovmatrix2, fxsynth;
var currentstate=3.rand; //start in one of three states
var currentstateFB=3.rand;
var currentstateDel=3.rand;
var currentstatePan=4.rand;

fxsynth = Synth(\goeyfx);

markovmatrix= [
[0.7,0.2,0.1],
[0.0,0.5,0.5],
[0.3,0.4,0.3]
];

markovmatrix2= [
[0.65,0.25, 0.15, 0.05],
[0.0,0.3,0.3,0.4],
[0.25,0.25, 0.25, 0.25],
[0.2, 0.3, 0.4, 0.1]
];


{
	inf.do{
		Synth.before(fxsynth, \algoTest2,[\freq, [[165.3, 165, 164.8].wchoose([0.5, 0.4, 0.1]), [166, 165.25, 164.75 ].wchoose([0.3, 0.6, 0.1]), [165, 165.6, 168].wchoose([0.4, 0.3, 0.3])].at(currentstate), \fb, [0.3, 0.6, 0.8].at(currentstateFB), \pan, [ 0.7, -0.25, 0.25, 0.7].at(currentstatePan), \del, [0.02, 0.04, 0.06].at(currentstateDel)]);

			//which probability distribution to use depends on what state we're in right now
			currentstate = [0,1,2].wchoose(markovmatrix[currentstate]);
		    currentstateFB = [0,1,2].wchoose(markovmatrix[currentstateFB]);
		    currentstateDel = [0,1,2].wchoose(markovmatrix[currentstateDel]);
		    currentstatePan = [0,1,2,3].wchoose(markovmatrix2[currentstatePan]);


			rrand(0.05, 0.25).wait;
			};

}.fork;
)
s.prepareForRecord;
200/7

(200/7 * (0..7))-100;