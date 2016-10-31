(
SynthDef(\testBufComb, {
	var buf;
	buf = LocalBuf(512, 2);
	OffsetOut.ar(0, BufCombC.ar(buf, DynKlank.ar(`[[200, 600, 1000, 2200], nil, nil], Impulse.ar(MouseX.kr(0.5, 20), 0, 0.2), 1, 0, MouseY.kr(0.2, 0.5)), MouseX.kr(0.001, 0.09, lag:0.05), MouseY.kr(0.2, 0.5, lag: 0.05), 0.5));
	OffsetOut.ar(1, BufCombC.ar(buf, DynKlank.ar(`[[300, 900, 1200, 2600], nil, nil], Impulse.ar(MouseX.kr(0.51, 19), 0, 0.2), 1, 0, MouseY.kr(0.2, 0.5)), MouseX.kr(0.001, 0.09, lag:0.05), MouseY.kr(0.2, 0.5, lag: 0.05), 0.5));
}).add;
)

(
SynthDef(\testBufCombAll, {
	var buf, sig;
	buf = LocalBuf(256, 2);
	sig = BufCombC.ar(buf, DynKlank.ar(`[[MouseX.kr(50, 400), MouseY.kr(400, 1600), MouseX.kr(1600, 4800), MouseY.kr(4800, 9600)], nil, nil], Impulse.ar(MouseX.kr(0.5, 40), 0, 0.2), 1, 0, MouseY.kr(0.2, 0.5)), MouseX.kr(0.001, 0.09, lag:0.05), MouseY.kr(0.2, 0.5, lag: 0.05), 0.5);
	OffsetOut.ar(0, PanAz.ar(2, sig, MouseY.kr(1.0, -1.0)));
	OffsetOut.ar(0, PanAz.ar(2, AllpassC.ar(sig, 0.2, MouseX.kr(0.001, 0.09), MouseY.kr(0.2, 0.5)), MouseX.kr(-1.0, 1.0)));
}).add;
)

a = Synth(\testBufComb);
b = Synth(\testBufCombAll);