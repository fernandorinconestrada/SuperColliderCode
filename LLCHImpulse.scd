(
SynthDef(\LLCHImpulse, { |dens = 0.5, delT = 0, decT = 0.5, ampDel = 0.75, busA = 0, busB = 5, busC = 2, dur = 60|
	var impulse, delay1, delay2;
	impulse = Impulse.ar(dens);
	delay1 = AllpassC.ar(impulse, 0.3, Line.kr(0.0, 0.08, dur).poll , decT, ampDel);
	delay2 = AllpassC.ar(delay1, 0.3, Line.kr(0.0, 0.08, dur).poll , decT, ampDel);
	OffsetOut.ar(busA, impulse);
	OffsetOut.ar(busB, delay1);
	OffsetOut.ar(busC, delay2);
}).add;
)

(
SynthDef(\LLCHImpulseMulti, { |dens = 0.5, ampImp = 1.0, rate1 = 0.025, loDel1 = 0.0, hiDel1 = 0.08, rate2 = 0.025, loDel2 = 0.0, hiDel2 = 0.08, rate3 = 0.025, loDel3 = 0.0, hiDel3 = 0.08,  decT = 0.5, ampDel1 = 1, ampDel2 = 1, ampDel3 = 1, bus0 = 0, bus1 = 1, bus2 = 2, bus3 = 3, bus4 = 4, bus5 = 5, bus6 = 6, bus7 = 7|
	var impulse, delay1, delay2, delay3;
	impulse = Impulse.ar(dens, 0, ampImp);
	delay1 = AllpassC.ar(impulse, 0.3, SinOsc.kr(rate1).range(loDel1,hiDel1).poll, decT, ampDel1);
	delay2 = AllpassC.ar(impulse, 0.3, SinOsc.kr(rate2).range(loDel2,hiDel2).poll, decT, ampDel2);
	delay3 = AllpassC.ar(impulse, 0.3, SinOsc.kr(rate3).range(loDel3,hiDel3).poll, decT, ampDel3);
	OffsetOut.ar([bus0, bus1], impulse);
	OffsetOut.ar([bus2, bus3], delay1);
	OffsetOut.ar([bus4, bus5], delay2);
	OffsetOut.ar([bus6, bus7], delay3);
}).add;
)

a = Synth(\LLCHImpulseMulti);
b = Synth(\LLCHImpulse, [\busA, 6, \busB, 1, \busC, 4]);
c = Synth(\LLCHImpulse, [\busA, 3, \busB, 7, \busC, 5]);

a.set(\delT, 0.001);
a.set(\bus0, 0, \bus1, 2, \bus2, 1, \bus3, 5, \bus4, 3, \bus5, 6, \bus6, 7, \bus7, 4);
a.set(\rate1, 0.025, \rate2, 0.026, \rate3, 0.027);