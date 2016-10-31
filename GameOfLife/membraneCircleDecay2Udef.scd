(
Udef( \membraneCircle, { |dur = 0.5, gate = 5, decT = 1, mulGray = 0.05, fund = 440, constBw = 0.01, constAmp = 0.1, tension = 0.1, loss = 0.99999|
    var trig, env;
	trig = Impulse.ar(gate);
	env = EnvGen.kr(Env.perc(0.01, dur), trig*LFNoise0.ar(5).range(2, 12));
	UMixOut.ar(0, Decay2.ar(trig, 0.01, decT, MembraneCircle.ar(Mix.new(BBandPass.ar(GrayNoise.ar(mulGray), fund*[1,2,3,4,5,6,7,8,9,10,11,12], constBw*[1,1,1,1,1,1,1,1,1,1,1,1], constAmp*[1,1,1,1,1,1,1,1,1,1,1,1]))*env, tension, loss)), 0, true);
} ).setSpec(\dur, [0.2, 1, \lin, 0.1, 0.5])
.setSpec(\gate, [0.2, 20, \lin, 0.1, 1])
.setSpec(\trig, [0.2, 20, \lin, 0.1, 1])
.setSpec(\decT, [0.2, 1, \lin, 0.1, 1])
.setSpec(\mulGray, [0.05, 0.2, \lin, 0.01, 0.05])
.setSpec(\fund, [55, 2000, \lin, 0.1, 110])
.setSpec(\constBw, [0.001, 0.2, \lin, 0.001, 0.01])
.setSpec(\constAmp, [0.01, 0.4, \lin, 0.01, 0.1])
.setSpec(\tension, [0.01, 0.5, \lin, 0.01, 0.1])
.setSpec(\loss, [0.9999, 0.99999, \lin, 0.00001, 0.99999]);
)

a = UChain(\membraneCircle);
a.gui;

Pwhite()
(
{
	var trig, env;
	trig = Impulse.ar(1);
	env = EnvGen.ar(Env.perc, Demand.ar(trig, 0, Diwhite(2, 8, inf)).poll, LFNoise0.ar(10, 0.6, 0.1));
	OffsetOut.ar(0, Decay2.ar(trig, 0.01, 1, SinOscFB.ar(440, 0.4, env)))
}.play;
)

(
{
	arg value = 1;
	var trig, env;
	trig = Impulse.ar(value);
	env = EnvGen.ar(Env.perc(0.01, 0.2), Impulse.kr(value*LFNoise0.kr(2, 8, 1).abs.poll), LFNoise0.ar(10, 0.6, 0.1));
	OffsetOut.ar(0, Decay2.ar(trig, 0.01, 1, Mix.new(SinOscFB.ar(440*[1,2,3,4,5,6,7,8,9], 0.1*[1,2,3,4,5,6,7,8,9].scramble, env*[1,1,1,1,1,1,1,1,1]))))
}.play;
)

{Pwhite( [0,0], [1,1], inf).trace}.play;

(
{
	arg rateTrig = 0.5, fund = 220;
	var envTrig, env, trig, dur;
	dur = (1/rateTrig);//cycle duration
	trig = Impulse.kr(rateTrig);//cycle duration
	envTrig = EnvGen.ar(Env.perc(0.01, LFNoise0.ar(trig, 0.05, 0.1)), Impulse.ar(LFTri.ar(rateTrig).range(1, 7).poll), 0.5);//inner attacks
	env = EnvGen.kr(Env([0,1,0], [dur/2, dur/2], \sine), trig);//envelope for cycle
	OffsetOut.ar(0, MembraneCircle.ar(Mix.new(BBandPass.ar(GrayNoise.ar(0.1), fund*[1,2,3,4,5,6,7,8,9], 0.1*[1,2,3,2,1,2,3,2,1].scramble, envTrig*[1,1,1,1,1,1,1,1,1])), 0.2, 0.99999)*env)
}.play;
)
(Env([0,1,0], [1,1], \sine)).plot;
{LFNoise0.kr(3, 0.1, 0.1).poll }.play;

{ Impulse.kr(SinOsc.kr(0.5, 0, 7, 1).abs) }.plot(2);
{ Impulse.kr(LFTri.kr(0.5, 0, 7, 1).abs) }.plot(2);
{ SinOsc.kr(0.5)}.plot(1);