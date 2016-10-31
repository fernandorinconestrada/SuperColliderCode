// violoncello

// fund = E3 = 330
(
~fundvcE3 = 330;
~partsvcE3 = (1..8) * ~fundvcE3;
~ampsvcE3 = ([30, 25, 15, 10, 12, 6, 8, 5]-30).dbamp;
)
[30, 25, 14, 10, 12.5, 7, 8.5, 5].plot;

// fund = E2 = 165
(
~fundvcE2 = 165;
~partsvcE2 = (1..13) * ~fundvcE2;
~ampsvcE2 = ([30, 28.5, 16, 20, 17, 18, 11, 6, 8, 11, 10, 5.5, 3]-30).dbamp;
)
[30, 28.5, 16, 20, 17, 18, 11, 6, 8, 11, 10, 5.5, 3].plot;

// fund = E1 = 83
(
~fundvcE1 = 83;
//~fundvcE1 = 83*7/8;
//~fundvcE1 = 83*7/4;
~partsvcE1 = (1..21) * ~fundvcE1;
~ampsvcE1 = ([14, 30, 19, 20, 12.5, 8, 13.5, 22, 15, 16, 10.2, 8.7, 8, 10, 5.5, 2, 1, 3, 2, 4.5, 1]-30).dbamp;
)
[14, 30, 19, 20, 12.5, 8, 13.5, 22, 15, 16, 10.2, 8.7, 8, 10, 5.5, 2, 1, 3, 2, 4.5, 1].plot;
~a = 83*7/8;
~a.cpsname;
//formants

{Formant.ar(165, 165*13, MouseX.kr(50, 4000).poll, 0.1)}.play;

//for low register
//low formant low register - ca. 250hz 'u' sound
{Formant.ar(83, 83*3, 83, 0.1)}.play;
//low formant mid register - ca. 300-500hz 'o' sound
{Formant.ar(83, 83*5, 210, 0.05)}.play;
//open-dark 'a' sound 600-900hz
{Formant.ar(83, 83*10, 275, 0.05)}.play;
{Formant.ar(83, 83*11, 245, 0.05)}.play;
//nasal frequency components at 1500 and 2000-3000hz
//1500hz
{Formant.ar(83, 83*18, 740, 0.01)}.play;
//no nasal upper formants, out of range

//for mid register
//low formant mid register - ca. 300-500hz 'o' sound
{Formant.ar(165, 165*3, 200, 0.1)}.play;
//open-dark 'a' sound 600-900hz
{Formant.ar(165, 165*4, 400, 0.1)}.play;
{Formant.ar(165, 165*5, 400, 0.1)}.play;
//nasal frequency components at 1500 and 2000-3000hz
//1500hz
{Formant.ar(165, 165*9, 420, 0.01)}.play;
//no nasal upper formants, out of range
{Formant.ar(165, 165*9, 1000, 0.01)}.play;

{
	var scale;
	scale = MouseX.kr(0,1);
	Mix.new([Formant.ar(83, 83*3, 83, 0.1*scale), Formant.ar(83, 83*5, 210, 0.1*scale), Formant.ar(83, 83*10, 275, 0.1*scale), Formant.ar(83, 83*18, 740, 0.05*scale)])
}.play;

//instrument resonz
//low reg
{
	var scale;
	scale = MouseX.kr(0,1);
	Out.ar(0, LPF.ar(Mix.new([Mix.new(Resonz.ar(WhiteNoise.ar(1), ~partsvcE1, 0.0001, ~ampsvcE1*20)), Formant.ar(~fundvcE1, ~fundvcE1*3, 83, 0.1*scale), Formant.ar(~fundvcE1, ~fundvcE1*5,210, 0.1*scale), Formant.ar(~fundvcE1, ~fundvcE1*10,275, 0.1*scale), Formant.ar(~fundvcE1, ~fundvcE1*18, 740, 0.05*scale)]), 3500))
}.play;
// rev, weird inharmonic content
{
	var scale, in, delay, rev;
	scale = MouseX.kr(0,1);
	in = LPF.ar(Mix.new([Mix.new(Resonz.ar(PinkNoise.ar(1), ~partsvcE1, 0.0001, ~ampsvcE1*20)), Formant.ar(~fundvcE1, ~fundvcE1*3, 83, 0.1*scale), Formant.ar(~fundvcE1, ~fundvcE1*5,210, 0.1*scale), Formant.ar(~fundvcE1, ~fundvcE1*10,275, 0.1*scale), Formant.ar(~fundvcE1, ~fundvcE1*18, 740, 0.05*scale)]), 5000);
	//delay = DelayC.ar(in, 0.1, 0.05, 0.75);
	delay = Mix.new(DelayC.ar(in, 0.1, [0.038, 0.047, 0.059, 0.061], [0.7, 0.5, 0.3, 0.1]));
	rev = FreeVerb.ar(delay, 0.4, 0.3, 0.3);
	Out.ar(0, LeakDC.ar(rev));
	Out.ar(1, LeakDC.ar(in*0.75));
}.play;

//bandpass
// better with very low level in formants
{
	var scale, in, delay, rev;
	scale = MouseX.kr(0,1);
	in = LPF.ar(Mix.new([Mix.new(BBandPass.ar(PinkNoise.ar(1), ~partsvcE1* LFNoise0.ar(12).range(0.999, 1.001), 0.0002, ~ampsvcE1*20)), Formant.ar(~fundvcE1, ~fundvcE1*3, 83, 0.1*scale), Formant.ar(~fundvcE1, ~fundvcE1*5,210, 0.07*scale), Formant.ar(~fundvcE1, ~fundvcE1*10, 275, 0.07*scale), Formant.ar(~fundvcE1, ~fundvcE1*16, 740, 0.03*scale)]), 3500);
	//delay = DelayC.ar(in, 0.1, 0.05, 0.75);
	delay = Mix.new(DelayC.ar(in, 0.1, [0.038, 0.047, 0.059, 0.061], [0.7, 0.5, 0.3, 0.1]));
	rev = FreeVerb.ar(delay, 0.4, 0.3, 0.3);
	Out.ar(0, LeakDC.ar(rev));
	Out.ar(1, LeakDC.ar(in));
}.play;
//big reverb with gliss
{
	var scale, in, delay, parallel;
	scale = MouseX.kr(0,0.5);
	in = LPF.ar(Mix.new([Mix.new(BBandPass.ar(PinkNoise.ar(1), ~partsvcE1* LFNoise0.ar(12).range(0.999, 1.001), 0.0001, ~ampsvcE1*20)), Formant.ar(~fundvcE1, ~fundvcE1*3, 83, 0.1*scale), Formant.ar(~fundvcE1, ~fundvcE1*5,210, 0.07*scale), Formant.ar(~fundvcE1, ~fundvcE1*10, 275, 0.07*scale), Formant.ar(~fundvcE1, ~fundvcE1*16, 740, 0.03*scale)]), 3500);
	delay = DelayN.ar(in, 0.06);
	parallel = Mix.ar(Array.fill(7, {CombL.ar(delay, 0.1, LFNoise1.kr(0.1.rand, 0.04, 0.05), 5)}));
	4.do({parallel = AllpassN.ar(parallel, 0.05, [0.05.rand, 0.05.rand].poll, 1)});
	//rev = FreeVerb.ar(delay, 0.4, 0.3, 0.5);
	Out.ar(0, LeakDC.ar(parallel));
	Out.ar(0, LeakDC.ar(in));
}.play;
//big reverb gliss multichannel

//mid reg
{
	var scale;
	scale = MouseX.kr(0,1);
	Out.ar(0, LPF.ar(Mix.new([Mix.new(Resonz.ar(PinkNoise.ar(1), ~partsvcE2, 0.0001, ~ampsvcE2*20)), Formant.ar(~fundvcE2, ~fundvcE2*3, 200, 0.02*scale), Formant.ar(~fundvcE2, ~fundvcE2*5,400, 0.02*scale), Formant.ar(~fundvcE2, ~fundvcE2*9, 420, 0.002*scale), Formant.ar(~fundvcE2, ~fundvcE2*13, 1000, 0.002*scale)]), 3500))
}.play;
// rev, weird inharmonic content
{
	var scale, in, delay, rev;
	scale = MouseX.kr(0,1);
	in = LPF.ar(Mix.new([Mix.new(Resonz.ar(PinkNoise.ar(1), ~partsvcE2, 0.0001, ~ampsvcE2*20)), Formant.ar(~fundvcE2, ~fundvcE2*3, 200, 0.02*scale), Formant.ar(~fundvcE2, ~fundvcE2*5,400, 0.02*scale), Formant.ar(~fundvcE2, ~fundvcE2*9, 420, 0.002*scale), Formant.ar(~fundvcE2, ~fundvcE2*13, 1000, 0.002*scale)]), 5000);
	//delay = DelayC.ar(in, 0.1, 0.05, 0.75);
	delay = Mix.new(DelayC.ar(in, 0.1, [0.038, 0.047, 0.059, 0.061], [0.7, 0.5, 0.3, 0.1]));
	rev = FreeVerb.ar(delay, 0.4, 0.3, 0.3);
	Out.ar(0, LeakDC.ar(rev));
	Out.ar(1, LeakDC.ar(in));
}.play;

//bandpass
// better with very low level in formants
{
	var scale, in, delay, rev;
	//scale = MouseX.kr(0,1);
	scale = 0.08;
	in = LPF.ar(Mix.new([Mix.new(BBandPass.ar(PinkNoise.ar(1), ~partsvcE1* LFNoise0.ar(12).range(0.999, 1.001), 0.0001, ~ampsvcE1*20)), Formant.ar(~fundvcE2, ~fundvcE2*3, 200, 0.02*scale), Formant.ar(~fundvcE2, ~fundvcE2*5,400, 0.02*scale), Formant.ar(~fundvcE2, ~fundvcE2*9, 420, 0.002*scale), Formant.ar(~fundvcE2, ~fundvcE2*13, 1000, 0.002*scale)]), 3500);
	//delay = DelayC.ar(in, 0.1, 0.05, 0.75);
	delay = Mix.new(DelayC.ar(in, 0.1, [0.038, 0.047, 0.059, 0.061], [0.7, 0.5, 0.3, 0.1]));
	rev = FreeVerb.ar(delay, 0.4, 0.3, 0.3);
	Out.ar(0, LeakDC.ar(rev));
	Out.ar(1, LeakDC.ar(in));
}.play;
//big reverb with gliss
{
	var scale, in, delay, parallel;
	//scale = MouseX.kr(0,1);
	scale = 0.08;
	in = LPF.ar(Mix.new([Mix.new(BBandPass.ar(PinkNoise.ar(1), ~partsvcE1* LFNoise0.ar(12).range(0.999, 1.001), 0.0001, ~ampsvcE1*20)), Formant.ar(~fundvcE2, ~fundvcE2*3, 200, 0.02*scale), Formant.ar(~fundvcE2, ~fundvcE2*5,400, 0.02*scale), Formant.ar(~fundvcE2, ~fundvcE2*9, 420, 0.002*scale), Formant.ar(~fundvcE2, ~fundvcE2*13, 1000, 0.002*scale)]), 3500);
	delay = DelayN.ar(in, 0.06);
	parallel = Mix.ar(Array.fill(7, {CombL.ar(delay, 0.1, LFNoise1.kr(0.1.rand, 0.04, 0.05), 5)}));
	4.do({parallel = AllpassN.ar(parallel, 0.05, [0.05.rand, 0.05.rand].poll, 1)});
	//rev = FreeVerb.ar(delay, 0.4, 0.3, 0.5);
	Out.ar(0, LeakDC.ar(parallel));
	Out.ar(5, LeakDC.ar(in));
}.play;
//big reverb gliss multichannel
{
	var scale, in, delay, parallel1, parallel2, parallel3, parallel4, parallel5, parallel6, parallel7;
	scale = MouseX.kr(0,0.2);
	//scale = 0.08;
	in = LPF.ar(Mix.new([Mix.new(BBandPass.ar(PinkNoise.ar(1), ~partsvcE1* LFNoise0.ar(12).range(0.999, 1.001), 0.0001, ~ampsvcE1*20)), Formant.ar(~fundvcE1, ~fundvcE1*3, 200, 0.02*scale), Formant.ar(~fundvcE1, ~fundvcE1*5,400, 0.02*scale), Formant.ar(~fundvcE1, ~fundvcE1*9, 420, 0.002*scale), Formant.ar(~fundvcE1, ~fundvcE1*13, 1000, 0.002*scale)]), 3500);
	delay = DelayN.ar(in, 0.06);
	parallel1 = CombL.ar(delay, 0.1, LFNoise1.kr(0.1.rand, 0.04, 0.05), 5);
	parallel2 = CombL.ar(delay, 0.1, LFNoise1.kr(0.1.rand, 0.04, 0.05), 5);
	parallel3 = CombL.ar(delay, 0.1, LFNoise1.kr(0.1.rand, 0.04, 0.05), 5);
	parallel4 = CombL.ar(delay, 0.1, LFNoise1.kr(0.1.rand, 0.04, 0.05), 5);
	parallel5 = CombL.ar(delay, 0.1, LFNoise1.kr(0.1.rand, 0.04, 0.05), 5);
	parallel6 = CombL.ar(delay, 0.1, LFNoise1.kr(0.1.rand, 0.04, 0.05), 5);
	parallel7 = CombL.ar(delay, 0.1, LFNoise1.kr(0.1.rand, 0.04, 0.05), 5);
	4.do({parallel1 = AllpassN.ar(parallel1, 0.05, [0.05.rand, 0.05.rand], 1)});
	4.do({parallel2 = AllpassN.ar(parallel2, 0.05, [0.05.rand, 0.05.rand], 1)});
	4.do({parallel3 = AllpassN.ar(parallel3, 0.05, [0.05.rand, 0.05.rand], 1)});
	4.do({parallel4 = AllpassN.ar(parallel4, 0.05, [0.05.rand, 0.05.rand], 1)});
	4.do({parallel5 = AllpassN.ar(parallel5, 0.05, [0.05.rand, 0.05.rand], 1)});
	4.do({parallel6 = AllpassN.ar(parallel6, 0.05, [0.05.rand, 0.05.rand], 1)});
	4.do({parallel7 = AllpassN.ar(parallel7, 0.05, [0.05.rand, 0.05.rand], 1)});
	OffsetOut.ar(0, LeakDC.ar(parallel1));
	OffsetOut.ar(2, LeakDC.ar(in*0.75));
	OffsetOut.ar(4, LeakDC.ar(parallel2));
	OffsetOut.ar(6, LeakDC.ar(in*0.75));
	OffsetOut.ar(8, LeakDC.ar(parallel3));
	OffsetOut.ar(10, LeakDC.ar(in*0.75));
	OffsetOut.ar(12, LeakDC.ar(parallel4));
	OffsetOut.ar(14, LeakDC.ar(in*0.75));
	OffsetOut.ar(16, LeakDC.ar(parallel5));
	OffsetOut.ar(18, LeakDC.ar(in*0.75));
	OffsetOut.ar(20, LeakDC.ar(parallel6));
	OffsetOut.ar(22, LeakDC.ar(in*0.75));
	OffsetOut.ar(24, LeakDC.ar(parallel7));
	OffsetOut.ar(26, LeakDC.ar(in*0.75));
}.play;

