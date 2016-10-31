(
Udef( \membraneCirclePeri, { |rateTrig = 0.5, loDens = 1, hiDens = 7, levEnv = 0.7, mulGray = 0.1, fund = 440, constBw = 0.01, tension = 0.1, loss = 0.99999|
    var dur, trig, envTrig, env;
	dur = (1/rateTrig);
	trig = Impulse.kr(rateTrig);
	envTrig = EnvGen.ar(Env.perc(0.01, LFNoise0.kr(trig, 0.05, 0.1)), Impulse.ar(LFTri.ar(rateTrig).range(loDens, hiDens)), levEnv);
	env = EnvGen.kr(Env([0,1,0], [dur/2, dur/2], \sine), trig);
	UMixOut.ar(0, MembraneCircle.ar(Mix.new(BBandPass.ar(GrayNoise.ar(mulGray), fund*[1,2,3,4,5,6,7,8,9,10,11,12], constBw*[1,1,1,1,1,1,1,1,1,1,1,1], envTrig*[1,1,1,1,1,1,1,1,1,1,1,1]))*env, tension, loss), 0, true);
} ).setSpec(\rateTrig, [0.1, 2, \lin, 0.1, 0.5])
.setSpec(\loDens, [1, 14, \lin, 1, 1])
.setSpec(\hiDens, [6, 20, \lin, 1, 7])
.setSpec(\levEnv, [0.2, 1, \lin, 0.1, 0.5])
.setSpec(\mulGray, [0.05, 0.5, \lin, 0.01, 0.1])
.setSpec(\fund, [55, 2000, \lin, 0.1, 110])
.setSpec(\constBw, [0.001, 0.2, \lin, 0.001, 0.01])
.setSpec(\constAmp, [0.01, 0.4, \lin, 0.01, 0.1])
.setSpec(\tension, [0.01, 0.5, \lin, 0.01, 0.1])
.setSpec(\loss, [0.9999, 0.99999, \lin, 0.00001, 0.99999]);
)