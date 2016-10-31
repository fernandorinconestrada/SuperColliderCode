{
	var rand, decay, fund, in, partial1, partial2, partial3;
	rand = LFNoise0.kr(20);
	decay = 0.1;
	fund = 55;
	partial1 = Decay2.ar(Impulse.ar(1/decay), 0.01, decay, BBandPass.ar(WhiteNoise.ar(1.5), rand.range(fund*4, (fund*8)+10), rand.range(0.001, 0.005), SinOsc.kr(8).range(0.5, 0.8)));
	partial2 = Decay2.ar(Impulse.ar(1/(decay+1)), 0.01, (decay+1), BBandPass.ar(WhiteNoise.ar(1.5), rand.range(fund*6, (fund*6)+10), rand.range(0.001, 0.005), SinOsc.kr(7).range(0.4, 0.7)));
	partial3 = Decay2.ar(Impulse.ar(1/(decay+2)), 0.01, (decay+2), BBandPass.ar(WhiteNoise.ar(1.5), rand.range(fund*15, (fund*15)+10), rand.range(0.001, 0.005), SinOsc.kr(6).range(0.3, 0.5)));
	in = Mix.new([partial1, partial2, partial3]);
	OffsetOut.ar(0, Pan2.ar(in, rand.range(-1.0, 1.0)));
	OffsetOut.ar(0, Pan2.ar(DelayC.ar(in, 0.2, 0.06, rand.range(0.5, 0.75)), rand.range(1.0, -1.0)))
}.play;

{
	var rand, decay, fund, in, partial1, partial2, partial3;
	rand = LFNoise0.kr(20);
	decay = 0.01;
	fund = 55;
	partial1 = Decay2.ar(Impulse.ar(1/decay), 0.01, decay, BBandPass.ar(WhiteNoise.ar(1.5), rand.range(fund*16, (fund*16)+10), rand.range(0.001, 0.005), SinOsc.kr(8).range(0.5, 0.8)));
	partial2 = Decay2.ar(Impulse.ar(1/(decay+1)), 0.01, (decay+1), BBandPass.ar(WhiteNoise.ar(1.5), rand.range(fund*12, (fund*12)+10), rand.range(0.001, 0.005), SinOsc.kr(7).range(0.3, 0.5)));
	partial3 = Decay2.ar(Impulse.ar(1/(decay+2)), 0.01, (decay+2), BBandPass.ar(WhiteNoise.ar(1.5), rand.range(fund*30, (fund*30)+10), rand.range(0.001, 0.005), SinOsc.kr(6).range(0.1, 0.2)));
	in = Mix.new([partial1, partial2, partial3]);
	OffsetOut.ar(0, Pan2.ar(in, rand.range(-1.0, 1.0)));
	OffsetOut.ar(0, Pan2.ar(DelayC.ar(in, 0.2, 0.06, rand.range(0.5, 0.75)), rand.range(1.0, -1.0)))
}.play;

{
	var rand, decay, fund, in, partial1, partial2, partial3;
	rand = LFNoise0.kr(20);
	decay = 0.001;
	fund = 55;
	partial1 = Decay2.ar(Impulse.ar(1/decay), 0.01, decay, BBandPass.ar(WhiteNoise.ar(1.5), rand.range(fund*8, (fund*8)+10), rand.range(0.001, 0.005), SinOsc.kr(8).range(0.5, 0.8)));
	partial2 = Decay2.ar(Impulse.ar(1/(decay+1)), 0.01, (decay+1), BBandPass.ar(WhiteNoise.ar(1.5), rand.range(fund*24, (fund*24)+10), rand.range(0.001, 0.005), SinOsc.kr(7).range(0.3, 0.5)));
	partial3 = Decay2.ar(Impulse.ar(1/(decay+2)), 0.01, (decay+2), BBandPass.ar(WhiteNoise.ar(1.5), rand.range(fund*60, (fund*60)+10), rand.range(0.001, 0.005), SinOsc.kr(6).range(0.1, 0.2)));
	in = Mix.new([partial1, partial2, partial3]);
	OffsetOut.ar(0, Pan2.ar(in, rand.range(-1.0, 1.0)));
	OffsetOut.ar(0, Pan2.ar(DelayC.ar(in, 0.2, 0.06, rand.range(0.5, 0.75)), rand.range(1.0, -1.0)))
}.play;

{
	var rand, decay, fund, in, partial1, partial2, partial3;
	rand = LFNoise0.kr(20);
	decay = 1;
	fund = 55;
	partial1 = Decay2.ar(Impulse.ar(1/decay), 0.01, decay, BBandPass.ar(WhiteNoise.ar(3), rand.range(fund*2, (fund*2)+10), rand.range(0.001, 0.005), SinOsc.kr(8).range(0.5, 0.8)));
	partial2 = Decay2.ar(Impulse.ar(1/(decay+1)), 0.01, (decay+1), BBandPass.ar(WhiteNoise.ar(1.5), rand.range(fund*5, (fund*5)+10), rand.range(0.001, 0.005), SinOsc.kr(7).range(0.1, 0.3)));
	partial3 = Decay2.ar(Impulse.ar(1/(decay+2)), 0.01, (decay+2), BBandPass.ar(WhiteNoise.ar(1.5), rand.range(fund*120, (fund*120)+10), rand.range(0.001, 0.005), SinOsc.kr(6).range(0.05, 0.1)));
	in = Mix.new([partial1, partial2, partial3]);
	OffsetOut.ar(0, Pan2.ar(in, rand.range(-1.0, 1.0)));
	OffsetOut.ar(0, Pan2.ar(DelayC.ar(in, 0.2, 0.06, rand.range(0.5, 0.75)), rand.range(1.0, -1.0)))
}.play;

