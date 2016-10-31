(
(
SynthDef(\grainDelFeedback, { | freqBw1 = 200, bw1 = 1.0, ampBw1 = 1.0, freqBw2 = 700, bw2 = 1.0, ampBw2 = 1.0, freqBw3 = 1200, bw3 = 1.0, ampBw3 = 1.0, freqBw4 = 2000, bw4 = 1.0, ampBw4 = 1.0, freqBw5 = 3800, bw5 = 1.0, ampBw5 = 1.0, freqBw6 = 7400, bw6 = 1.0, ampBw6 = 1.0, dens = 40, dur = 0.02, pan = 0, envbuf = -1, ampGrain = 1.0, del_inDelay = 2.0, dec_inDelay = 3.0, amp_inDelay = 1.0, del_feedDel = 1.0, dec_feedDel = 0.5, amp_feedDel = 1.0, delAllGr = 0.4, decAllGr = 1.0 , amp_inGrain = 1.0, delCombGr = 0.5, decCombGr = 1.5, amp_feedGr = 1.0, mulAmp = 0.1, delMixFBDel = 1, decMixFBDel = 2, ampMixFBDel = 0.5, delMixFBGr = 1, decMixFBGr = 2, ampMixFBGr = 0.5|
	var liveInput, liveInput1, band1, band2, band3, band4, band5, band6, mixBand, mixBand1, inDelay, inGrain, feedDel, feedbackDel, feedGrain, feedbackGr, mixAll;
	liveInput = SoundIn.ar(0);
	band1 = BBandPass.ar(liveInput, freqBw1, bw1, ampBw1);
	band2 = BBandPass.ar(liveInput, freqBw2, bw2, ampBw2);
	band3 = BBandPass.ar(liveInput, freqBw3, bw3, ampBw3);
	band4 = BBandPass.ar(liveInput, freqBw4, bw4, ampBw4);
	band5 = BBandPass.ar(liveInput, freqBw5, bw5, ampBw5);
	band6 = BBandPass.ar(liveInput, freqBw6, bw6, ampBw6);
	mixBand = Mix.new([band1, band2, band3, band4, band5, band6]);
	inDelay = Limiter.ar(LPF.ar(mixBand, 19000, 1.0), 0.9);
	inGrain = Limiter.ar(LPF.ar(GrainIn.ar(1, Dust.kr(dens), dur, mixBand, pan, envbuf, 512, ampGrain), 19000), 0.9);
	feedDel = AllpassC.ar(inDelay, 5, del_inDelay, dec_inDelay, amp_inDelay);
	feedbackDel = CombC.ar(feedDel, 3.0, del_feedDel, dec_feedDel, amp_feedDel);
	feedGrain = AllpassC.ar(inGrain, 1.0, LFNoise0.kr(delAllGr).range(0.05, 0.8), LFNoise0.kr(decAllGr).range(0.1, 1.0), amp_inGrain);
	feedbackGr = CombC.ar(feedGrain, 1.0, LFNoise0.kr(delCombGr).range(0.05, 0.5), LFNoise0.kr(decCombGr).range(0.1, 2.0), amp_feedGr);
	mixAll = Mix.new([AllpassC.ar(feedbackDel, 4, delMixFBDel, decMixFBDel, ampMixFBDel), AllpassC.ar(feedbackGr, 4, delMixFBGr, decMixFBGr, ampMixFBGr)]);
	OffsetOut.ar(0, mixAll);
}).add;
);
)
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
	feedOne = Ringz.ar(one, Demand.kr(gate, 0, trigFeed1 * 100 + 100) , 0.2);
	two = Ringz.ar(LPF.ar(Trig.ar(env,SampleDur.ir),1200),Demand.kr(gate, 0, trigNum2 * 20 + 80),0.5, 0.05).sin;
	feedTwo = Ringz.ar(two, Demand.kr(gate, 0, trigFeed2 * 200 + 200), 0.2);
	three = Ringz.ar(LPF.ar(Trig.ar(env,SampleDur.ir),1300),Demand.kr(gate, 0, trigNum3 * 98 + 100),0.5, 0.04).sin;
	feedThree = Ringz.ar(three, Demand.kr(gate, 0, trigFeed3 * 400 + 400), 0.2);
	four = Ringz.ar(LPF.ar(Trig.ar(env,SampleDur.ir),1700),Demand.kr(gate, 0, trigNum4 * 200 + 200),0.5, 0.03).sin;
	feedFour = Ringz.ar(four, Demand.kr(gate, 0, trigFeed4 * 800 + 800), 0.2);
	mixNum = Mix.new([one, two, three, four]);
	delFeed1 = AllpassC.ar(mixNum, 0.3, Demand.kr(gate, 0, trigFeed4 * 0.15 + 0.05), Demand.kr(gate, 0, trigFeed2 * 0.2 + 0.5), 0.7);
	mixFeed = Mix.new([feedOne, feedTwo, feedThree, feedFour]);
	delFeed2 = AllpassC.ar(mixFeed, 0.3, Demand.kr(gate, 0, trigNum3 * 0.15 + 0.1), Demand.kr(gate, 0, trigNum1 * 0.8 + 0.5), 0.7);
	mix = Mix.new([mixNum, delFeed1, mixFeed, delFeed2]);
	in = LPF.ar(Limiter.ar(mix, 0.9, 0.01), 12000);
	OffsetOut.ar([0,1], FreeVerb.ar(in, Demand.kr(gate, 0, trigNum2 * 0.1 + 0.1), Demand.kr(gate, 0, trigNum4 * 0.15 + 0.15), Demand.kr(gate, 0, trigFeed1 * 0.5 + 0.15) ,globalAmp) );
}).add;
);
(
x = Synth(\grainDelFeedback);
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

OSCdef(\delAllDel,  {|msg, time, addr, recvPort| x.set(\del_inDelay,  ((msg[1] * 3) + 0.1).postln)}, "/del_dec_inDel",  nil, 57121);
OSCdef(\decAllDel,  {|msg, time, addr, recvPort| x.set(\dec_inDelay,  ((msg[2] * 6) + 0.1).postln)}, "/del_dec_inDel",  nil, 57121);
OSCdef(\delCombDel, {|msg, time, addr, recvPort| x.set(\del_feedDel, ((msg[1] * 2) + 0.1).postln)},  "/del_dec_feedDel",nil, 57121);
OSCdef(\decCombDel, {|msg, time, addr, recvPort| x.set(\dec_feedDel, ((msg[2] * 4) + 0.1).postln)},  "/dec_del_feedDel",nil, 57121);

OSCdef(\delAllGr,  {|msg, time, addr, recvPort| x.set(\delAllGr,  ((msg[1] * 12) + 5).postln)},    "/noisedel_decAllGr",  nil, 57121);
OSCdef(\decAllGr,  {|msg, time, addr, recvPort| x.set(\decAllGr,  ((msg[2] * 9) + 3).postln)},     "/noisedel_decAllGr",  nil, 57121);
OSCdef(\delCombGr, {|msg, time, addr, recvPort| x.set(\delCombGr, ((msg[1] * 17) + 10).postln)},  "/noisedec_delCombGr",  nil, 57121);
OSCdef(\decCombGr, {|msg, time, addr, recvPort| x.set(\decCombGr, ((msg[2] * 22) + 17).postln)},   "/noisedec_delComGr",  nil, 57121);

OSCdef(\del_allMixDel,  {|msg, time, addr, recvPort| x.set(\delMixFBDel,  ((msg[1] * 3) + 0.01).postln)}, "/del_dec_mixFBDel",  nil, 57121);
OSCdef(\dec_allMixDel,  {|msg, time, addr, recvPort| x.set(\decMixFBDel,  ((msg[2] * 6) + 0.01).postln)}, "/del_dec_mixFBDel",  nil, 57121);
OSCdef(\del_allMixGr,   {|msg, time, addr, recvPort| x.set(\delMixFBGr,   ((msg[1] * 2) + 0.01).postln)},"/del_dec_mixFBGr",    nil, 57121);
OSCdef(\dec_allMixGr,   {|msg, time, addr, recvPort| x.set(\decMixFBGr,   ((msg[2] * 4) + 0.01).postln)},"/del_dec_mixFBGr",    nil, 57121);

//Mix Amps//

OSCdef(\ampMixFBDel,   {|msg, time, addr, recvPort| x.set(\ampMixFBDel,    msg[1].postln)}, "/ampMixFBDel", nil, 57121);
OSCdef(\ampMixFBGr,    {|msg, time, addr, recvPort| x.set(\ampMixFBGr,     msg[1].postln)}, "/ampMixFBGr",  nil, 57121);

OSCdef(\gate1,         {|msg, time, addr, recvPort| c.set(\gate, msg[1].postln)},              "/event/1/1", nil, 57121);
OSCdef(\gate2,         {|msg, time, addr, recvPort| d.set(\gate, msg[1].postln)},              "/event/1/2", nil, 57121);
OSCdef(\gate3,         {|msg, time, addr, recvPort| e.set(\gate, msg[1].postln)},              "/event/1/3",  nil, 57121);
OSCdef(\globalAmpEv1,  {|msg, time, addr, recvPort| c.set(\globalAmp,(msg[1] * 1.0).postln)},  "/globalAmp",  nil, 57121);
OSCdef(\globalAmpEv2,  {|msg, time, addr, recvPort| d.set(\globalAmp,(msg[1] * 1.0).postln)},  "/globalAmp",  nil, 57121);
OSCdef(\globalAmpEv3,  {|msg, time, addr, recvPort| e.set(\globalAmp,(msg[1] * 1.0).postln)},  "/globalAmp",  nil, 57121);
);
//y = FreqScope.new(350, 200);
)

(
c.free;
d.free;
e.free;
x.free;
y.free;
);