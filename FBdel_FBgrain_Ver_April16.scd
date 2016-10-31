(
(
//g = Buffer.read(s, "/Users/fernandorincon/Documents/UCSB/240A/Assignment_7/FRE_AudioFile.wav");
//h = Buffer.read(s, "/Users/fernandorincon/Music/Field Recordings/chunk_mono.wav");
);
(
 SynthDef(\delFeedbackVer2, { | freqBw1 = 200, bw1 = 1.0, ampBw1 = 1.0, freqBw2 = 700, bw2 = 1.0, ampBw2 = 1.0, freqBw3 = 1200, bw3 = 1.0, ampBw3 = 1.0, freqBw4 = 2000, bw4 = 1.0, ampBw4 = 1.0, freqBw5 = 3800, bw5 = 1.0, ampBw5 = 1.0, freqBw6 = 7400, bw6 = 1.0, ampBw6 = 1.0, del_inDelay = 0.01, dec_inDelay = 0.5, amp_inDelay = 0.9, del_feedDel = 0.01, dec_feedDel = 0.5, amp_feedDel = 0.9, delMixFBDel = 0.01, decMixFBDel = 0.5, ampInDel = 0.01, ampFeedDel = 0.01, ampFBDel = 0.01, ampMixAll = 0.01, ampWhiteA, bufnum = 0|
 	var liveInputA, band1, band2, band3, band4, band5, band6, mixBandA, inDelay,feedDel, feedbackDel, mixAllA, mixOut;
 	liveInputA = SoundIn.ar(0);
 	//liveInputA = WhiteNoise.ar(ampWhiteA);
	//liveInputA = PlayBuf.ar(1, bufnum, 1, 1, 0, 1);
	//liveInputA = Impulse.ar(0.3, 0, 0.9);
 	band1 = BPF.ar(liveInputA, freqBw1, bw1, ampBw1);
 	band2 = BPF.ar(liveInputA, freqBw2, bw2, ampBw2);
 	band3 = BPF.ar(liveInputA, freqBw3, bw3, ampBw3);
 	band4 = BPF.ar(liveInputA, freqBw4, bw4, ampBw4);
 	band5 = BPF.ar(liveInputA, freqBw5, bw5, ampBw5);
 	band6 = BPF.ar(liveInputA, freqBw6, bw6, ampBw6);
 	mixBandA = Mix.new([band1, band2, band3, band4, band5, band6]);
 	inDelay = Limiter.ar(LPF.ar(mixBandA, 19000, ampInDel), 0.99);
 	feedDel = Limiter.ar(AllpassC.ar(inDelay, 3.0, del_inDelay, dec_inDelay, ampFeedDel), 0.9);
 	feedbackDel = Limiter.ar(AllpassC.ar(feedDel, 3.0, del_feedDel, dec_feedDel, ampFBDel), 0.8);
 	mixAllA = AllpassC.ar(feedbackDel, 3.0, delMixFBDel, decMixFBDel, ampMixAll);
	mixOut = Mix.new([inDelay, feedDel, feedbackDel, mixAllA]);
	OffsetOut.ar(0, mixOut);
  }).add;
);
(
SynthDef(\grainFeedbackVer2, { | freqBw7 = 200, bw7 = 0.01, ampBw7 = 1.0, freqBw8 = 700, bw8 = 0.01, ampBw8 = 1.0, freqBw9 = 1200, bw9 = 0.01, ampBw9 = 1.0, freqBw10 = 2000, bw10 = 0.01, ampBw10 = 1.0, freqBw11 = 3800, bw11 = 0.01, ampBw11 = 1.0, freqBw12 = 7400, bw12 = 0.01, ampBw12 = 1.0, dens = 2, dur = 0.1, pan = 0, envbuf = -1, ampGrain = 0.8, delAllGr = 0.01, decAllGr = 0.2 , amp_inGrain = 0.9, delCombGr = 0.02, decCombGr = 0.3, amp_feedGr = 0.9, delMixFBGr = 0.05, decMixFBGr = 0.5, ampInGrain = 0.01, ampFeedGr = 0.01, ampFBGr = 0.01, ampMixAllGr = 0.01, ampWhiteB, bufnumA = 1|
	var trig, liveInputB, band7, band8, band9, band10, band11, band12, mixBandB, inGrain, feedGrain, feedbackGr, mixAllB, mixOut;
	liveInputB = SoundIn.ar(0);
	//liveInputB = WhiteNoise.ar(ampWhiteB);
	//liveInputB = PlayBuf.ar(1, bufnumA, 1, 1, 0, 1);
	//liveInputB = Impulse.ar(0.3, 0, 0.9);
	trig = Dust.kr(dens);
	band7 =  BPF.ar(liveInputB, freqBw7, bw7, ampBw7);
	band8 =  BPF.ar(liveInputB, freqBw8, bw8, ampBw8);
	band9 =  BPF.ar(liveInputB, freqBw9, bw9, ampBw9);
	band10 = BPF.ar(liveInputB, freqBw10, bw10, ampBw10);
	band11 = BPF.ar(liveInputB, freqBw11, bw11, ampBw11);
	band12 = BPF.ar(liveInputB, freqBw12, bw12, ampBw12);
	mixBandB = Mix.new([band7, band8, band9, band10, band11, band12]);
	inGrain = Limiter.ar(LPF.ar(GrainIn.ar(1, trig, dur, mixBandB, pan, envbuf, 512, ampInGrain), 19000), 0.99);
	feedGrain = Limiter.ar(AllpassC.ar(inGrain, 2.0, Demand.kr(trig, 0, Dwhite(0.01, delAllGr, inf)),  Demand.kr(trig, 0, Dwhite(0.02, decAllGr, inf)), ampFeedGr), 0.9);
	feedbackGr = Limiter.ar(CombC.ar(feedGrain, 4.0, Demand.kr(trig, 0, Dwhite(0.01, delCombGr, inf)),  Demand.kr(trig, 0, Dwhite(0.3, decCombGr, inf)), ampFBGr), 0.8);
	mixAllB =  AllpassC.ar(feedbackGr, 4, delMixFBGr, decMixFBGr, ampMixAllGr);
	mixOut = Mix.new([inGrain, feedGrain, feedbackGr, mixAllB]);
	OffsetOut.ar(0, mixOut);
}).add;
);
(
SynthDef(\oneShotResA, { |gate, globalAmp = 1.0, del_OneShot 0.2 , dec_OneShot = 0.5 |
	var env, trigNum1, trigNum2, trigNum3, trigNum4, trigFeed1, trigFeed2, trigFeed3, trigFeed4, one, feedOne, two, feedTwo, three, feedThree, four, feedFour, mixNum, delFeed1, mix, mixFeed, delFeed2, del, in;
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
	feedOne = Ringz.ar(one, Demand.kr(gate, 0, trigFeed1 * 100 + 100) , 0.15);
	two = Ringz.ar(LPF.ar(Trig.ar(env,SampleDur.ir),1200),Demand.kr(gate, 0, trigNum2 * 20 + 80),0.5, 0.05).sin;
	feedTwo = Ringz.ar(two, Demand.kr(gate, 0, trigFeed2 * 200 + 200), 0.2);
	three = Ringz.ar(LPF.ar(Trig.ar(env,SampleDur.ir),1300),Demand.kr(gate, 0, trigNum3 * 98 + 100),0.5, 0.04).sin;
	feedThree = Ringz.ar(three, Demand.kr(gate, 0, trigFeed3 * 400 + 400), 0.15);
	four = Ringz.ar(LPF.ar(Trig.ar(env,SampleDur.ir),1700),Demand.kr(gate, 0, trigNum4 * 200 + 200),0.5, 0.03).sin;
	feedFour = Ringz.ar(four, Demand.kr(gate, 0, trigFeed4 * 800 + 800), 0.2);
	mixNum = Mix.new([one, two, three, four]);
	delFeed1 = AllpassC.ar(mixNum, 0.3, Demand.kr(gate, 0, trigFeed4 * 0.15 + 0.05), Demand.kr(gate, 0, trigFeed2 * 0.2 + 0.5), 0.7);
	mixFeed = Mix.new([feedOne, feedTwo, feedThree, feedFour]);
	delFeed2 = AllpassC.ar(mixFeed, 0.3, Demand.kr(gate, 0, trigNum3 * 0.15 + 0.1), Demand.kr(gate, 0, trigNum1 * 0.8 + 0.5), 0.5);
	mix = HPF.ar(Mix.new([mixNum, delFeed1, mixFeed, delFeed2]), 50);
	in = LPF.ar(Limiter.ar(mix, 0.9, 0.01), 12000);
	del = AllpassC.ar(in, 1, del_OneShot, dec_OneShot);
	OffsetOut.ar(0, FreeVerb.ar(del, Demand.kr(gate, 0, trigNum2 * 0.1 + 0.1), Demand.kr(gate, 0, trigNum4 * 0.15 + 0.15), Demand.kr(gate, 0, trigFeed1 * 0.5 + 0.15) ,globalAmp) );
}).add;
);
(
a = Synth(\delFeedbackVer2);
b = Synth(\grainFeedbackVer2);
);
(
c = Synth(\oneShotResA);
d = Synth(\oneShotResA);
e = Synth(\oneShotResA);
);
(
//Band filter params
OSCdef(\freq1,    {|msg, time, addr, recvPort| a.set(\freqBw1,  ((msg[1] * 150) + 50).postln)}, "/freqBand/1", nil, 57121);
OSCdef(\freq7,    {|msg, time, addr, recvPort| b.set(\freqBw7,  ((msg[1] * 200) + 50).postln)}, "/freqBand/1", nil, 57121);

OSCdef(\bw1,      {|msg, time, addr, recvPort| a.set(\bw1,       (msg[1] + 0.0001).postln)},             "/bwQBand/1",  nil, 57121);
OSCdef(\bw7,      {|msg, time, addr, recvPort| b.set(\bw7,       (msg[1] + 0.0001).postln)},             "/bwQBand/1",  nil, 57121);

OSCdef(\ampBand1, {|msg, time, addr, recvPort| a.set(\ampBw1,    msg[1].postln)},             "/ampBand/1",  nil, 57121);
OSCdef(\ampBand7, {|msg, time, addr, recvPort|  b.set(\ampBw7,    msg[1].postln)},             "/ampBand/1",  nil, 57121);

OSCdef(\freq2,    {|msg, time, addr, recvPort| a.set(\freqBw2,  ((msg[1] * 500) + 200).postln)},"/freqBand/2", nil, 57121);
OSCdef(\freq8,    {|msg, time, addr, recvPort| b.set(\freqBw8,  ((msg[1] * 500) + 250).postln)},"/freqBand/2", nil, 57121);

OSCdef(\bw2,      {|msg, time, addr, recvPort| a.set(\bw2,       (msg[1] + 0.0001).postln)},             "/bwQBand/2",  nil, 57121);
OSCdef(\bw8,      {|msg, time, addr, recvPort| b.set(\bw8,       (msg[1] + 0.0001).postln)},             "/bwQBand/2",  nil, 57121);

OSCdef(\ampBand2, {|msg, time, addr, recvPort| a.set(\ampBw2,    msg[1].postln)},             "/ampBand/2",  nil, 57121);
OSCdef(\ampBand8, {|msg, time, addr, recvPort| b.set(\ampBw8,    msg[1].postln)},             "/ampBand/2",  nil, 57121);

OSCdef(\freq3,    {|msg, time, addr, recvPort| a.set(\freqBw3,  ((msg[1] * 500) + 700).postln)},"/freqBand/3", nil, 57121);
OSCdef(\freq9,    {|msg, time, addr, recvPort| b.set(\freqBw9,  ((msg[1] * 750) + 750).postln)},"/freqBand/3", nil, 57121);

OSCdef(\bw3,      {|msg, time, addr, recvPort| a.set(\bw3,       (msg[1] + 0.0001).postln)},             "/bwQBand/3",  nil, 57121);
OSCdef(\bw9,      {|msg, time, addr, recvPort| b.set(\bw9,       (msg[1] + 0.0001).postln)},             "/bwQBand/3",  nil, 57121);

OSCdef(\ampBand3, {|msg, time, addr, recvPort| a.set(\ampBw3,    msg[1].postln)},             "/ampBand/3",  nil, 57121);
OSCdef(\ampBand9, {|msg, time, addr, recvPort| b.set(\ampBw9,    msg[1].postln)},             "/ampBand/3",  nil, 57121);

OSCdef(\freq4,    {|msg, time, addr, recvPort| a.set(\freqBw4,  ((msg[1] * 800) + 1200).postln)},"/freqBand/4", nil, 57121);
OSCdef(\freq10,    {|msg, time, addr, recvPort| b.set(\freqBw10,  ((msg[1] * 1500) + 1500).postln)},"/freqBand/4", nil, 57121);

OSCdef(\bw4,      {|msg, time, addr, recvPort| a.set(\bw4,       (msg[1] + 0.0001).postln)},              "/bwQBand/4", nil, 57121);
OSCdef(\bw10,      {|msg, time, addr, recvPort| b.set(\bw10,       (msg[1] + 0.0001).postln)},              "/bwQBand/4", nil, 57121);

OSCdef(\ampBand4, {|msg, time, addr, recvPort|  a.set(\ampBw4,    msg[1].postln)},              "/ampBand/4",  nil, 57121);
OSCdef(\ampBand10, {|msg, time, addr, recvPort| b.set(\ampBw10,    msg[1].postln)},              "/ampBand/4",  nil, 57121);

OSCdef(\freq5,    {|msg, time, addr, recvPort|  a.set(\freqBw5,  ((msg[1] * 1800) + 2000).postln)},"/freqBand/5",nil, 57121);
OSCdef(\freq11,    {|msg, time, addr, recvPort| b.set(\freqBw11,  ((msg[1] * 1500) + 3000).postln)},"/freqBand/5",nil, 57121);

OSCdef(\bw5,      {|msg, time, addr, recvPort|  a.set(\bw5,       (msg[1] + 0.0001).postln)},               "/bwQBand/5", nil, 57121);
OSCdef(\bw11,      {|msg, time, addr, recvPort| b.set(\bw11,       (msg[1] + 0.0001).postln)},               "/bwQBand/5", nil, 57121);

OSCdef(\ampBand5, {|msg, time, addr, recvPort| a.set(\ampBw5,    msg[1].postln)},               "/ampBand/5",  nil, 57121);
OSCdef(\ampBand11, {|msg, time, addr, recvPort| b.set(\ampBw11,    msg[1].postln)},               "/ampBand/5",  nil, 57121);

OSCdef(\freq6,    {|msg, time, addr, recvPort| a.set(\freqBw6,  ((msg[1] * 3600) + 3800).postln)},"/freqBand/6", nil, 57121);
OSCdef(\freq12,    {|msg, time, addr, recvPort| b.set(\freqBw12,  ((msg[1] * 1500) + 4500).postln)},"/freqBand/6", nil, 57121);

OSCdef(\bw6,      {|msg, time, addr, recvPort| a.set(\bw6,       (msg[1] + 0.0001).postln)},               "/bwQBand/6", nil, 57121);
OSCdef(\bw12,      {|msg, time, addr, recvPort| b.set(\bw12,       (msg[1] + 0.0001).postln)},               "/bwQBand/6", nil, 57121);

OSCdef(\ampBand6, {|msg, time, addr, recvPort| a.set(\ampBw6,    msg[1].postln)},               "/ampBand/6",  nil, 57121);
OSCdef(\ampBand6, {|msg, time, addr, recvPort| b.set(\ampBw12,    msg[1].postln)},               "/ampBand/6",  nil, 57121);

OSCdef(\dens,    {|msg, time, addr, recvPort| b.set(\dens,    ((msg[1] * 100)  + 2).postln)},    "/dens", nil, 57121);
OSCdef(\dur,     {|msg, time, addr, recvPort| b.set(\dur,     ((msg[1] * 0.5) + 0.01).postln)}, "/dur",  nil, 57121);
//OSCdef(\amp,     {|msg, time, addr, recvPort| b.set(\ampGrain, msg[1].postln)},                  "/amp",  nil, 57121);

OSCdef(\delAllDel,  {|msg, time, addr, recvPort| a.set(\del_inDelay,  ((msg[1] * 0.98) + 0.01).postln)}, "/del_dec_inDel",  nil, 57121);
OSCdef(\decAllDel,  {|msg, time, addr, recvPort| a.set(\dec_inDelay,  ((msg[2] * 0.7) + 0.3).postln)},    "/del_dec_inDel",  nil, 57121);
OSCdef(\delCombDel, {|msg, time, addr, recvPort| a.set(\del_feedDel, ((msg[1] * 0.98) + 0.01).postln)},  "/del_dec_feedDel",nil, 57121);
OSCdef(\decCombDel, {|msg, time, addr, recvPort| a.set(\dec_feedDel, ((msg[2] * 0.5) + 0.5).postln)},     "/dec_del_feedDel",nil, 57121);

OSCdef(\delAllGr,  {|msg, time, addr, recvPort| b.set(\delAllGr,  ((msg[1] * 0.9) + 0.01).postln)},    "/noisedel_decAllGr",  nil, 57121);
OSCdef(\decAllGr,  {|msg, time, addr, recvPort| b.set(\decAllGr,  ((msg[2] * 1) + 0.1).postln)},     "/noisedel_decAllGr",  nil, 57121);
OSCdef(\delCombGr, {|msg, time, addr, recvPort| b.set(\delCombGr, ((msg[1] * 0.9) + 0.1).postln)},  "/noisedec_delCombGr",  nil, 57121);
OSCdef(\decCombGr, {|msg, time, addr, recvPort| b.set(\decCombGr, ((msg[2] * 1) + 1).postln)},   "/noisedec_delComGr",  nil, 57121);

OSCdef(\del_allMixDel,  {|msg, time, addr, recvPort| a.set(\delMixFBDel,  ((msg[1] * 1) + 0.01).postln)}, "/del_dec_mixFBDel",  nil, 57121);
OSCdef(\dec_allMixDel,  {|msg, time, addr, recvPort| a.set(\decMixFBDel,  ((msg[2] * 2) + 0.2).postln)}, "/del_dec_mixFBDel",  nil, 57121);
OSCdef(\del_allMixGr,   {|msg, time, addr, recvPort| b.set(\delMixFBGr,   ((msg[1] * 2) + 0.01).postln)},"/del_dec_MixFBGr",    nil, 57121);
OSCdef(\dec_allMixGr,   {|msg, time, addr, recvPort| b.set(\decMixFBGr,   ((msg[2] * 3) + 0.01).postln)},"/del_dec_MixFBGr",    nil, 57121);

//Mix Amps//

OSCdef(\ampInDel,      {|msg, time, addr, recvPort| a.set(\ampInDel,       msg[1].postln)}, "/levelMixDel/1",  nil, 57121);
OSCdef(\ampFeedDel,    {|msg, time, addr, recvPort| a.set(\ampFeedDel,     msg[1].postln)}, "/levelMixDel/2",  nil, 57121);
OSCdef(\ampFBDel,      {|msg, time, addr, recvPort| a.set(\ampFBDel,       msg[1].postln)}, "/levelMixDel/3",  nil, 57121);
OSCdef(\ampMixAll,    {|msg, time, addr, recvPort| a.set(\ampMixAll,       msg[1].postln)}, "/levelMixDel/4",  nil, 57121);

OSCdef(\ampInGrain,   {|msg, time, addr, recvPort| b.set(\ampInGrain,       msg[1].postln)}, "/levelMixGrain/1",  nil, 57121);
OSCdef(\ampFeedGr,    {|msg, time, addr, recvPort| b.set(\ampFeedGr,        msg[1].postln)}, "/levelMixGrain/2",  nil, 57121);
OSCdef(\ampFBGr,      {|msg, time, addr, recvPort| b.set(\ampFBGr,          msg[1].postln)}, "/levelMixGrain/3",  nil, 57121);
OSCdef(\ampMixAllGr,  {|msg, time, addr, recvPort| b.set(\ampMixAllGr,      msg[1].postln)}, "/levelMixGrain/4",  nil, 57121);
);
(
OSCdef(\del_OneShot,  {|msg, time, addr, recvPort| c.set(\del_OneShot,  ((msg[1] * 3) + 0.01).postln)}, "/del_dec_oneShot",  nil, 57121);
OSCdef(\dec_OneShot,  {|msg, time, addr, recvPort| c.set(\dec_OneShot,  ((msg[2] * 6) + 0.2).postln)}, "/dec_del_oneShot",  nil, 57121);

OSCdef(\gate1,         {|msg, time, addr, recvPort| c.set(\gate, msg[1].postln)},              "/event/1/1", nil, 57121);
OSCdef(\gate2,         {|msg, time, addr, recvPort| d.set(\gate, msg[1].postln)},              "/event/1/2", nil, 57121);
OSCdef(\gate3,         {|msg, time, addr, recvPort| e.set(\gate, msg[1].postln)},              "/event/1/3",  nil, 57121);
OSCdef(\globalAmpEv1,  {|msg, time, addr, recvPort| c.set(\globalAmp,(msg[1]*0.4).postln)},  "/1/fader5",  nil, 57121);
OSCdef(\globalAmpEv2,  {|msg, time, addr, recvPort| d.set(\globalAmp,(msg[1]*0.3).postln)},  "/1/fader5",  nil, 57121);
OSCdef(\globalAmpEv3,  {|msg, time, addr, recvPort| e.set(\globalAmp,(msg[1]*0.2).postln)},  "/1/fader5",  nil, 57121);
);
y = FreqScope.new(350, 200);
)

a.set(\ampWhiteA, 0.1);
b.set(\ampWhiteB, 0.1);

a.set(\bufnum, g);
b.set(\bufnumA, h);
b.free;

s.prepareForRecord;
s.record;
s.stopRecording;