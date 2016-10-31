(
SynthDef(\algoAdditTest, { |bus = 0, dens = 0.5, freqs = #[0,0,0,0,0], bw = 0.001, amps = #[0,0,0,0,0], rev = -1.0|
	var trig, trigGrain, env, pan, levPan, delT, in;
	trig = Impulse.ar(dens);
	trigGrain = Impulse.ar(TRand.ar(4, 16, trig).poll(label: \trig));
	env = EnvGen.kr(Env.perc, trigGrain);
	pan = TRand.ar(-1.0, 1.0, trig).poll(label: \pan);
	levPan = TRand.ar(0.5, 1.0, trig);
	delT = TRand.ar(0.02, 0.08, trig).poll(label: \delay);
	in = Decay2.ar(trig, 0.01, 2,  Mix.new(BBandPass.ar(GrayNoise.ar(1), freqs, bw, amps))*env);
	//in = Decay2.ar(trig, 0.01, 2,  Mix.new(SinOscFB.ar(freqs, bw, amps))*env);
	OffsetOut.ar(bus, Pan2.ar(in, pan, levPan));
	OffsetOut.ar(bus, Pan2.ar(DelayC.ar(LPF.ar(in, 40), 0.2, delT), pan*rev, levPan * TRand.ar(0.5, 1.0, trig)));
}).send(s);
)

(
SynthDef(\algoAdditTestVer2, { |bus = 0, dens = 0.5, att = 0.01, curveAtt = 8, curveDec = -4, freqs = #[0,0,0,0,0], bw = 0.001, amps = #[0,0,0,0,0], rev = -1.0|
	var trig, trigGrain, env, pan, levPan, delT, in, decay;
	trig = Impulse.ar(dens);
	decay = TRand.ar(2, 2.5, trig);
	//trigGrain = Impulse.ar(TRand.ar(4, 16, trig).poll(label: \trig));
	trigGrain = Impulse.ar(Line.ar(TRand.ar(4, 16, trig).poll(label: \trig1), TRand.ar(4, 16, trig).poll(label: \trig2), decay * 0.75));
	env = EnvGen.kr(Env([0,1,0], [att, decay], [curveAtt, curveDec]), trig, doneAction:2);
	pan = TRand.ar(-1.0, 1.0, trig).poll(label: \pan);
	levPan = TRand.ar(0.5, 1.0, trig);
	delT = TRand.ar(0.02, 0.08, trig).poll(label: \delay);
	in = Decay2.ar(trigGrain, 0.01, 0.5,  Mix.new(BBandPass.ar(GrayNoise.ar(1), freqs, bw, amps))*env);
	//in = Decay2.ar(trig, 0.01, 2,  Mix.new(SinOscFB.ar(freqs, bw, amps))*env);
	OffsetOut.ar(bus, Pan2.ar(in, pan, levPan));
	OffsetOut.ar(bus, Pan2.ar(DelayC.ar(LPF.ar(in, 40), 0.2, delT), pan*rev, levPan * TRand.ar(0.5, 1.0, trig)));
}).send(s);
)

(
~fund = 55;
~ratio = 3/2;
~fifths1 = [1,3,5,8];//[2,2,3] perm1
~fifths2 = [1,3,6,8];//[2,3,2] perm2
~fifths3 = [1,4,6,8];//[3,2,2] perm3
~perm1 = [~fund, ~fund*(~ratio*~ratio.pow(~fifths1.at(0))), ~fund*(~ratio*~ratio.pow(~fifths1.at(1))), ~fund*(~ratio*~ratio.pow(~fifths1.at(2))), ~fund*(~ratio*~ratio.pow(~fifths1.at(3)))];
~perm2 = [~fund, ~fund*(~ratio*~ratio.pow(~fifths2.at(0))), ~fund*(~ratio*~ratio.pow(~fifths2.at(1))), ~fund*(~ratio*~ratio.pow(~fifths2.at(2))), ~fund*(~ratio*~ratio.pow(~fifths2.at(3)))];
~perm3 = [~fund, ~fund*(~ratio*~ratio.pow(~fifths3.at(0))), ~fund*(~ratio*~ratio.pow(~fifths3.at(1))), ~fund*(~ratio*~ratio.pow(~fifths3.at(2))), ~fund*(~ratio*~ratio.pow(~fifths3.at(3)))];
~amps = Array.rand(5, 1, 2);
)
a = Synth(\algoAdditTest, [\freqs, ~perm1, \amps, ~amps]);
a.set(\dens, 10);
a.set(\freqs, ~perm1);

(
{
inf.do{
	    a.release;
	a = Synth(\algoAdditTest, [\freqs, ~perm1, \amps, ~amps.scramble]);
		rrand(0.1, 2.0).wait;
		b.release;
	b = Synth(\algoAdditTest, [\freqs, ~perm2, \amps, ~amps]);
		rrand(0.3, 4.0).wait;
		c.release;
	c = Synth(\algoAdditTest, [\freqs, ~perm3, \amps, ~amps.reverse]);
		rrand(0.5, 6.0).wait;
	};
}.fork;
)
(
{
inf.do{
	a = Synth(\algoAdditTestVer2, [\freqs, ~perm1, \amps, ~amps.scramble, \curveDec, -6]);
		rrand(0.1, 2.0).wait;
	b = Synth(\algoAdditTestVer2, [\freqs, ~perm2, \amps, ~amps, \bus, 2]);
		rrand(0.3, 4.0).wait;
	c = Synth(\algoAdditTestVer2, [\freqs, ~perm3, \amps, ~amps.reverse, \curveDec, -8, \bus, 4]);
		rrand(0.5, 6.0).wait;
		d = Synth(\algoAdditTestVer2, [\freqs, [~perm1, ~perm2, ~perm3].choose, \amps, ~amps.reverse, \curveDec, -8, \bus, 6]);
		rrand(0.7, 5.0).wait;
	};
}.fork;
)
s.recChannels = 2;
s.prepareForRecord;
s.record;
s.stopRecording;