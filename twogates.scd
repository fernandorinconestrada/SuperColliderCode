{ ToggleFF.kr(Impulse.kr([10])).poll }.play

b = Buffer.read(s, "/Users/fernandorincon/Documents/Adobe/Audition/6.0/JuneEightElec/WorkSpaceJuneEight/Cuts/DrumSolo.wav");
(
SynthDef(\polling, {
    var trig, oneGate, gates, start, prev, phase, eg, sig, bufrd;
	trig = TDuty.kr(Drand([0.2, 0.3, 0.5, 0.7, 1.1, 1.3, 1.7])).poll;
    oneGate = ToggleFF.kr(trig).poll;
    gates = [oneGate, 1 - oneGate];
	prev = trig * b.numFrames;
	start = prev + (trig * b.numFrames);
	phase = Duty.kr(start, gates, Dseries(start, 1, b.numFrames).dup).poll;
	bufrd = Dbufrd(b, phase);
    eg = EnvGen.kr(Env.asr(0.01, 1, 0.01), gates);
    sig = Duty.ar(SampleDur.ir, gates, bufrd);
    OffsetOut.ar(0, (sig * eg) * 0.5);
}).play;
)
b.numFrames;
{ Duty.kr(SampleDur.ir, 0, Dseries(SampleDur.ir, 1, inf)).poll }.play; 