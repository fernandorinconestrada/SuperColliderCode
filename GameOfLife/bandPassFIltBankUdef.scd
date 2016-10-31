ULib.startup

(
Udef(\bandPassFilt, { |multGray = 1.0, fund = 220, f1 = 1, f2 = 2, f3 = 3, f4 = 4, f5 =5, f6 = 6, f7 = 7, f8 = 8, f9 = 9, f10 = 10, f11 = 11, f12 = 12, b1 = 1, b2 = 1, b3 = 1, b4 = 1, b5 =1, b6 = 1, b7 = 1, b8 = 1, b9 = 1, b10 = 1, b11 = 1, b12 = 1, amp = 1.0|
	var env;
	UMixOut.ar(0, Mix.new(BBandPass.ar(GrayNoise.ar(multGray), fund*[f1, f2, f3, f4, f5, f6, f7, f8, f9, f10, f11, f12], [b1, b2, b3, b4, b5, b6, b7, b8, b9, b10, b11, b12], amp)), 0, true);
}).setSpec(\multGray, [0.01, 1.0, \lin, 0.01, 1.0])
.setSpec(\fund, [55, 2000, \lin, 0.1, 220])
.setSpec(\f1, [1, 20, \lin, 1, 1])
.setSpec(\f2, [2, 21, \lin, 1, 2])
.setSpec(\f3, [3, 22, \lin, 1, 3])
.setSpec(\f4, [4, 23, \lin, 1, 4])
.setSpec(\f5, [5, 24, \lin, 1, 5])
.setSpec(\f6, [6, 25, \lin, 1, 6])
.setSpec(\f7, [7, 26, \lin, 1, 7])
.setSpec(\f8, [8, 27, \lin, 1, 8])
.setSpec(\f9, [9, 28, \lin, 1, 9])
.setSpec(\f10, [10, 29, \lin, 1, 10])
.setSpec(\f11, [11, 30, \lin, 1, 11])
.setSpec(\f12, [12, 31, \lin, 1, 12])
.setSpec(\b1, [0.01, 1.0, \lin, 0.001, 0.01])
.setSpec(\b2, [0.01, 1.0, \lin, 0.001, 0.01])
.setSpec(\b3, [0.01, 1.0, \lin, 0.001, 0.015])
.setSpec(\b4, [0.01, 1.0, \lin, 0.001, 0.012])
.setSpec(\b5, [0.01, 1.0, \lin, 0.001, 0.012])
.setSpec(\b6, [0.01, 1.0, \lin, 0.001, 0.15])
.setSpec(\b7, [0.01, 1.0, \lin, 0.001, 0.15])
.setSpec(\b8, [0.01, 1.0, \lin, 0.001, 0.01])
.setSpec(\b9, [0.01, 1.0, \lin, 0.001, 0.015])
.setSpec(\b10, [0.01, 1.0, \lin, 0.001, 0.01])
.setSpec(\b11, [0.01, 1.0, \lin, 0.001, 0.01])
.setSpec(\b12, [0.01, 1.0, \lin, 0.001, 0.15])
.setSpec(\amp, [0.01, 1.0, \lin, 0.01, 1.0])
)

a = UChain(\bandPassFilt, \stereoOutput);
a.gui;

{
	var trig, in;
	trig = LFNoise0.kr(80);
	in = SinOscFB.ar(trig.range(440-((440/ 2) * 0.0001), ((440* 2) * 0.0001)+440).poll, trig.range(0.2, 0.4), EnvGen.ar(Env.perc(0.01, 0.04), trig, trig.range(0.2, 0.3)));
	OffsetOut.ar(0, [in, DelayC.ar(in, 0.2, 0.06, 0.75)])
}.play;

{
	var trig, in;
	trig = LFNoise0.kr(80);
	in = SinOscFB.ar(trig.range(441-((441/ 2) * 0.0001), ((441* 2) * 0.0001)+441).poll, trig.range(0.2, 0.4), EnvGen.ar(Env.perc(0.01, 0.04), trig, trig.range(0.2, 0.3)));
	OffsetOut.ar(0, [in, DelayC.ar(in, 0.2, 0.05, 0.75)])
}.play;



{ BBandPass.ar(WhiteNoise.ar(1), 440, 0.0001, 1)}.play;

((440* 2) * 0.0001)+440
440-((440/ 2) * 0.0001)