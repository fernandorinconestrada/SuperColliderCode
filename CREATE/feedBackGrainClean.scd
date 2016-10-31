(
var winenv;
winenv = Env([0, 1, 0], [0.5, 0.5], [8, -8]);
z = Buffer.sendCollection(s, winenv.discretize, 1);
(
SynthDef(\grainFeed, { |freq1 = 200, bw1 = 1.0, ampBand1 = 1.0, freq2 = 700, bw2 = 1.0, ampBand2 = 1.0, freq3 = 1200, bw3 = 1.0, ampBand3 = 1.0, freq4 = 2000, bw4 = 1.0, ampBand4 = 1.0, freq5 = 3800, bw5 = 1.0, ampBand5 = 1.0, freq6 = 7400, bw6 = 1.0, ampBand6 = 1.0, dens = 10, dur = 0.1, pan = 0, envbuf, amp = 1.0, delAll = 10, decAll = 7, delComb = 15, decComb = 20, attack = 0.01, release = 0.01, numHarm = 20, mulAmp = 1.0, del = 1.4, dec = 1.0, globalAmp = 1.0|
    var liveInput, band1, band2, band3, band4, band5, band6, mixBand, in, feedback, feedback1, gen, mix;
   	liveInput = SoundIn.ar(0);
	band1 = BBandPass.ar(liveInput, freq1, bw1, ampBand1);
	band2 = BBandPass.ar(liveInput, freq2, bw2, ampBand2);
	band3 = BBandPass.ar(liveInput, freq3, bw3, ampBand3);
	band4 = BBandPass.ar(liveInput, freq4, bw4, ampBand4);
	band5 = BBandPass.ar(liveInput, freq5, bw5, ampBand5);
	band6 = BBandPass.ar(liveInput, freq6, bw6, ampBand6);
	mixBand = Mix.new([band1, band2, band3, band4, band5, band6]);
	in = Limiter.ar(LPF.ar(GrainIn.ar(1, Dust.kr(dens), dur, mixBand, pan, envbuf, 512, amp), 19000), 0.9);
	feedback = AllpassC.ar(in, 1.0, LFNoise0.kr(delAll).range(0.05, 0.8), LFNoise0.kr(decAll).range(0.1, 1.0));
	feedback1 = CombC.ar(feedback, 1.0, LFNoise0.kr(delComb).range(0.05, 0.5), LFNoise0.kr(decComb).range(0.1, 2.0));
	gen = Blip.ar(AmplitudeMod.kr(mixBand, attack, release, 3000, 600), numHarm, mulAmp);//alternate using SoundIn or mixBand
	mix = Mix.new(AllpassC.ar(feedback1, 5, del, dec, globalAmp));
	OffsetOut.ar([0,1], mix);
    }).add;
);
(
SynthDef(\oneShotResA, { |gate, globalAmp|
	var env, trigNum1, trigNum2, trigNum3, trigNum4, trigFeed1, trigFeed2, trigFeed3, trigFeed4, one, feedOne, two, feedTwo, three, feedThree, four, feedFour, mixNum, delFeed1, mix, mixFeed, delFeed2, in;
	env = EnvGen.kr(Env.perc(0.001, 1), gate);
	trigNum1 = Dwhite(0, 1, inf);
	trigNum2 = Dwhite(0, 1, inf);
	trigNum3 = Dwhite(0, 1, inf);
	trigNum4 = Dwhite(0, 1, inf);
	trigFeed1 = Dwhite(0, 1, inf);
	trigFeed2 = Dwhite(0, 1, inf);
	trigFeed3 = Dwhite(0, 1, inf);
	trigFeed4 = Dwhite(0, 1, inf);
	one = Ringz.ar(LPF.ar(Trig.ar(env,SampleDur.ir),1000), Demand.kr(gate, 0, trigNum1 * 40 + 40), 0.5, 0.06).sin;
	feedOne = Ringz.ar(one, Demand.kr(gate, 0, trigFeed1 * 100 + 100) , 0.3);
	two = Ringz.ar(LPF.ar(Trig.ar(env,SampleDur.ir),1200),Demand.kr(gate, 0, trigNum2 * 20 + 80),0.5, 0.05).sin;
	feedTwo = Ringz.ar(two, Demand.kr(gate, 0, trigFeed2 * 200 + 200), 0.3);
	three = Ringz.ar(LPF.ar(Trig.ar(env,SampleDur.ir),1300),Demand.kr(gate, 0, trigNum3 * 98 + 100),0.5, 0.04).sin;
	feedThree = Ringz.ar(three, Demand.kr(gate, 0, trigFeed3 * 400 + 400), 0.3);
	four = Ringz.ar(LPF.ar(Trig.ar(env,SampleDur.ir),1700),Demand.kr(gate, 0, trigNum4 * 200 + 200),0.5, 0.03).sin;
	feedFour = Ringz.ar(four, Demand.kr(gate, 0, trigFeed4 * 800 + 800), 0.3);
	mixNum = Mix.new([one, two, three, four]);
	delFeed1 = AllpassC.ar(mixNum, 0.3, Demand.kr(gate, 0, trigFeed4 * 0.15 + 0.05), Demand.kr(gate, 0, trigFeed2 * 0.2 + 0.5), 0.8);
	mixFeed = Mix.new([feedOne, feedTwo, feedThree, feedFour]);
	delFeed2 = AllpassC.ar(mixFeed, 0.3, Demand.kr(gate, 0, trigNum3 * 0.15 + 0.1), Demand.kr(gate, 0, trigNum1 * 0.8 + 0.5), 0.6);
	mix = Mix.new([mixNum, delFeed1, mixFeed, delFeed2]);
	in = LPF.ar(Limiter.ar(mix, 0.9, 0.01), 12000);
	OffsetOut.ar([0,1], FreeVerb.ar(in, Demand.kr(gate, 0, trigNum2 * 0.1 + 0.1), Demand.kr(gate, 0, trigNum4 * 0.15 + 0.15), Demand.kr(gate, 0, trigFeed1 * 0.5 + 0.15) ,globalAmp) );
}).add
);
(
x = Synth(\grainFeed, [\envbuf, -1]);
c = Synth(\oneShotResA);
d = Synth(\oneShotResA);
e = Synth(\oneShotResA);
);
(
OSCdef(\freq1,    {|msg, time, addr, recvPort| x.set(\freq1,    (msg[1] * 200).postln)}, "/freqBand/1", nil, 57121);
OSCdef(\bw1,      {|msg, time, addr, recvPort| x.set(\bw1,      (msg[1] * 1.0).postln)}, "/bwQBand/1", nil, 57121);
OSCdef(\ampBand1, {|msg, time, addr, recvPort| x.set(\ampBand1, (msg[1] * 1.0).postln)}, "/ampBand/1",  nil, 57121);
OSCdef(\freq2,    {|msg, time, addr, recvPort| x.set(\freq2,    (msg[1] * 700).postln)}, "/freqBand/2", nil, 57121);
OSCdef(\bw2,      {|msg, time, addr, recvPort| x.set(\bw2,      (msg[1] * 1.0).postln)}, "/bwQBand/2", nil, 57121);
OSCdef(\ampBand2, {|msg, time, addr, recvPort| x.set(\ampBand2, (msg[1] * 1.0).postln)}, "/ampBand/2",  nil, 57121);
OSCdef(\freq3,    {|msg, time, addr, recvPort| x.set(\freq3,    (msg[1] * 1200).postln)},"/freqBand/3", nil, 57121);
OSCdef(\bw3,      {|msg, time, addr, recvPort| x.set(\bw3,      (msg[1] * 1.0).postln)}, "/bwQBand/3", nil, 57121);
OSCdef(\ampBand3, {|msg, time, addr, recvPort| x.set(\ampBand3, (msg[1] * 1.0).postln)}, "/ampBand/3",  nil, 57121);
OSCdef(\freq4,    {|msg, time, addr, recvPort| x.set(\freq4,    (msg[1] * 2000).postln)},"/freqBand/4", nil, 57121);
OSCdef(\bw4,      {|msg, time, addr, recvPort| x.set(\bw4,      (msg[1] * 1.0).postln)}, "/bwQBand/4", nil, 57121);
OSCdef(\ampBand4, {|msg, time, addr, recvPort| x.set(\ampBand4, (msg[1] * 1.0).postln)}, "/ampBand/4",  nil, 57121);
OSCdef(\freq5,    {|msg, time, addr, recvPort| x.set(\freq5,    (msg[1] * 3800).postln)},"/freqBand/5", nil, 57121);
OSCdef(\bw5,      {|msg, time, addr, recvPort| x.set(\bw5,      (msg[1] * 1.0).postln)}, "/bwQBand/5", nil, 57121);
OSCdef(\ampBand5, {|msg, time, addr, recvPort| x.set(\ampBand5, (msg[1] * 1.0).postln)}, "/ampBand/5",  nil, 57121);
OSCdef(\freq6,    {|msg, time, addr, recvPort| x.set(\freq6,    (msg[1] * 7400).postln)},"/freqBand/6", nil, 57121);
OSCdef(\bw6,      {|msg, time, addr, recvPort| x.set(\bw6,      (msg[1] * 1.0).postln)}, "/bwQBand/6", nil, 57121);
OSCdef(\ampBand6, {|msg, time, addr, recvPort| x.set(\ampBand6, (msg[1] * 1.0).postln)}, "/ampBand/6",  nil, 57121);

OSCdef(\dens,    {|msg, time, addr, recvPort| x.set(\dens,    ((msg[1] * 40)  + 2).postln)},    "/dens", nil, 57121);
OSCdef(\dur,     {|msg, time, addr, recvPort| x.set(\dur,     ((msg[1] * 0.5) + 0.01).postln)}, "/dur",  nil, 57121);
OSCdef(\amp,     {|msg, time, addr, recvPort| x.set(\amp,     (msg[1] * 1.0).postln)},          "/amp",  nil, 57121);

OSCdef(\delAll,  {|msg, time, addr, recvPort| x.set(\delAll,  ((msg[1] * 12) + 5).postln)}, "/noiseFeedOne",  nil, 57121);
OSCdef(\decAll,  {|msg, time, addr, recvPort| x.set(\decAll,  ((msg[2] * 9) + 3).postln)},  "/noiseFeedOne",  nil, 57121);
OSCdef(\delComb, {|msg, time, addr, recvPort| x.set(\delComb, ((msg[1] * 17) + 10).postln)},"/noiseFeedTwo",  nil, 57121);
OSCdef(\decComb, {|msg, time, addr, recvPort| x.set(\decComb, ((msg[2] * 22) + 17).postln)}, "/noiseFeedTwo",  nil, 57121);

OSCdef(\attack,  {|msg, time, addr, recvPort| x.set(\attack,  (msg[1] * 0.2).postln)},       "/attack",  nil, 57121);
OSCdef(\release, {|msg, time, addr, recvPort| x.set(\release, (msg[1] * 0.5).postln)},       "/release", nil, 57121);
OSCdef(\numHarm, {|msg, time, addr, recvPort| x.set(\numHarm, ((msg[1] * 40) + 3).postln)},  "/numHarm", nil, 57121);
OSCdef(\mulAmp,  {|msg, time, addr, recvPort| x.set(\mulAmp,  (msg[1] * 1.0).postln)},       "/mulAmp",  nil, 57121);

OSCdef(\del,        {|msg, time, addr, recvPort| x.set(\del,      ((msg[1] * 2.0) + 0.05).postln)}, "/del",        nil, 57121);
OSCdef(\dec,        {|msg, time, addr, recvPort| x.set(\dec,      ((msg[1] * 2.5) + 0.005).postln)},"/dec",        nil, 57121);
OSCdef(\globalAmp,  {|msg, time, addr, recvPort| x.set(\globalAmp,(msg[1] * 1.0).postln)},          "/globalAmp",  nil, 57121);

OSCdef(\gate1,         {|msg, time, addr, recvPort| c.set(\gate, msg[1].postln)},              "/event/1/1", nil, 57121);
OSCdef(\gate2,         {|msg, time, addr, recvPort| d.set(\gate, msg[1].postln)},              "/event/1/2", nil, 57121);
OSCdef(\gate3,         {|msg, time, addr, recvPort| e.set(\gate, msg[1].postln)},              "/event/1/3",  nil, 57121);
OSCdef(\globalAmpEv1,  {|msg, time, addr, recvPort| c.set(\globalAmp,(msg[1] * 1.0).postln)},  "/globalAmp",  nil, 57121);
OSCdef(\globalAmpEv2,  {|msg, time, addr, recvPort| d.set(\globalAmp,(msg[1] * 1.0).postln)},  "/globalAmp",  nil, 57121);
OSCdef(\globalAmpEv3,  {|msg, time, addr, recvPort| e.set(\globalAmp,(msg[1] * 1.0).postln)},  "/globalAmp",  nil, 57121);
);
y = FreqScope.new(350, 200);
)

x.set(\envbuf, z);
x.set(\numHarm, 200);

c.free;
d.free;
e.free;
x.free;

{ SinOsc.ar([440,441], 0, 0.01) }.play;