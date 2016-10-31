(
SynthDef(\grainbufSwitch, { |sndbuf, rate = 1, dur, trig, dens = 10|
	var pos;
	pos = LFNoise0.ar(dens);
	OffsetOut.ar(0, GrainBuf.ar(1, 1, dur, sndbuf,rate, pos))
}).add;
)

/*
(
~sr = 44100;
~b = Buffer.readChannel(s,"/Users/fernandorincon/Documents/Live/Estudio 209 Borr Project/Samples/Imported/Midi69Ciclo1.aiff" , 0, ~sr*8);
~c = Buffer.readChannel(s,"/Users/fernandorincon/Documents/Live/Estudio 209 Borr Project/Samples/Imported/Midi74Ciclo1.aiff", 0, ~sr*8);
~d = Buffer.readChannel(s,"/Users/fernandorincon/Documents/Live/Estudio 209 Borr Project/Samples/Imported/Midi83Ciclo1.aiff", 0, ~sr*8);
b = Array.with(~b, ~c, ~d);
)
*/

(
~sr = 44100;
~b = Buffer.readChannel(s, "/Users/fernandorincon/Documents/Adobe/Audition/6.0/JuneEightElec/WorkSpaceJuneEight/Cuts/DrumSolo.wav", 0, ~sr*8, 1);
~c = Buffer.readChannel(s,"/Users/fernandorincon/Documents/Adobe/Audition/6.0/JuneEightElec/WorkSpaceJuneEight/Cuts/PeriodRythmMod.wav", 0, ~sr*8, 1);
~d = Buffer.readChannel(s,"/Users/fernandorincon/Documents/Adobe/Audition/6.0/JuneEightElec/WorkSpaceJuneEight/Cuts/SineContourSection2.wav", 0, ~sr*8, 1);
b = Array.with(~b, ~c, ~d);
)
(
Pbind(\instrument, \grainbufSwitch,
	\sndbuf, Prand(b, inf),
	\dur, Prand([2,3,5], inf),
	//\trig, Prand([2,3,5], inf)
).play;
)