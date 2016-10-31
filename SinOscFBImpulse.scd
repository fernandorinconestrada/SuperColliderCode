{ OffsetOut.ar(0,   Impulse.ar(0.38333*4, 0, 0.11));
	OffsetOut.ar(1, Impulse.ar(0.31667*4, 0, 0.07));
	OffsetOut.ar(2, Impulse.ar(0.28333*4, 0, 0.11));
	OffsetOut.ar(3, Impulse.ar(0.21667*4, 0, 0.07));
	OffsetOut.ar(4, Impulse.ar(0.18333*4, 0, 0.11));
	OffsetOut.ar(5, Impulse.ar(0.11667*4, 0, 0.07));
	OffsetOut.ar(6, Impulse.ar(0.08333*4, 0, 0.11));
	OffsetOut.ar(7, Impulse.ar(0.05*4,    0, 0.07));
}.play;

{   OffsetOut.ar(0, SinOscFB.ar(2100, 0.5, EnvGen.kr(Env.perc, Impulse.kr(2.3), 0.03)));
	OffsetOut.ar(6, SinOscFB.ar(935, 0.3, EnvGen.kr(Env.perc, Impulse.kr(1.9), 0.05)));
	OffsetOut.ar(4, SinOscFB.ar(825, 0.5, EnvGen.kr(Env.perc, Impulse.kr(1.7), 0.07)));
	OffsetOut.ar(2, SinOscFB.ar(660, 0.7, EnvGen.kr(Env.perc, Impulse.kr(1.3), 0.11)));
	OffsetOut.ar(1, SinOscFB.ar(495, 0.7, EnvGen.kr(Env.perc, Impulse.kr(1.1), 0.13)));
	OffsetOut.ar(3, SinOscFB.ar(330, 0.3, EnvGen.kr(Env.perc, Impulse.kr(0.7), 0.11)));
	OffsetOut.ar(5, SinOscFB.ar(165, 0.5, EnvGen.kr(Env.perc, Impulse.kr(0.5), 0.13)));
	OffsetOut.ar(7, SinOscFB.ar(50 , 0.3, EnvGen.kr(Env.perc, Impulse.kr(0.2), 0.17)));
}.play;