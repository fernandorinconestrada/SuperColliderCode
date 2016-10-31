(
SynthDef(\reverb,{
var a,c,z,y,in;
c = 2; // number of comb delays
a = 2; // number of allpass delays

in=In.ar(0,2);
// reverb predelay time :
z = DelayN.ar(in, 0.048,0.048);

//for delaytime if want modulation-	//LFNoise1.kr(0.1.rand, 0.04, 0.05)
y=Mix.arFill(c,{CombL.ar(z,0.1,rrand(0.01, 0.1),5)});

// chain of 4 allpass delays on each of two channels (8 total) :
a.do({ y = AllpassN.ar(y, 0.051, [rrand(0.01, 0.05),rrand(0.01, 0.05)], 1) });

// add original sound to reverb and play it :
ReplaceOut.ar(0,in+(0.2*y));
}).add;
)

(
SynthDef(\reverb,{

	var in, fx;
in=In.ar(0,2);
// reverb predelay time :
fx = GVerb.ar(in, 3, 1);

// add original sound to reverb and play it :
ReplaceOut.ar(0,in+(0.2*fx));
}).add;
)
(
b = Synth(\reverb);
a = Synth.before(b,\bufGrainVCInstVer3, [\envbufnum, ~y, \sndbuf, ~buf3, \durLine, 2, \hiDurGr, 0.025, \delT, 0.07, \dens, 24]);
)