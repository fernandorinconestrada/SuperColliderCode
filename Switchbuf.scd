b = Buffer.read(s, "/Users/fernandorincon/Documents/Adobe/Audition/6.0/JuneEightElec/WorkSpaceJuneEight/Cuts/DrumSolo.wav");
a = {
    var trig = TDuty.kr(Dwhite(0.15, 3)).poll, //time duration of triggers
    // on each trigger, choose a random starting point
    start = Dseries(0, trig*b.numFrames, b.numFrames).loop,
	dur = Dwhite(0.15, 3),
    phase = Duty.ar(SampleDur.ir, trig, Dseries(start, 1, ceil(dur *
SampleRate.ir))),
    bufrd = Dbufrd(b, phase),
    sig = Duty.ar(SampleDur.ir, trig, bufrd);
    (sig * 0.1) ! 2
}.play;
