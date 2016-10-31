(
SynthDef(\addEnv, { |freqFund, fbfund, rateAmpFund, rangeAmpFund, freqPart1, fbPart1, rateAmpPart1, rangeAmpPart1, freqPart2, fbPart2, rateAmpPart2, rangeAmpPart2, freqPart3, fbPart3, rateAmpPart3, rangeAmpPart3, freqPart4, fbPart4, rateAmpPart4, rangeAmpPart4, freqPart5, fbPart5, rateAmpPart5, rangeAmpPart5, freqPart6, fbPart6, rateAmpPart6, rangeAmpPart6, freqPart7, fbPart7, rateAmpPart7, rangeAmpPart7, freqPart8, fbPart8, rateAmpPart8, rangeAmpPart8, freqPart9, fbPart9, rateAmpPart9, rangeAmpPart9, freqPart10, fbPart10, rateAmpPart10, rangeAmpPart10, freqPart11, fbPart11, rateAmpPart11, rangeAmpPart11|
	var fund, part1, part2, part3, part4, part5, part6, part7, part8, part9, part10, part11, mix, delay, feedb;
	fund   = SinOscFB.ar(freqFund,   fbfund,   SinOsc.kr(rateAmpFund,   0, rangeAmpFund));
	part1  = SinOscFB.ar(freqPart1,  fbPart1,  SinOsc.kr(rateAmpPart1,  0, rangeAmpPart1));
	part2  = SinOscFB.ar(freqPart2,  fbPart2,  SinOsc.kr(rateAmpPart2,  0, rangeAmpPart2));
	part3  = SinOscFB.ar(freqPart3,  fbPart3,  SinOsc.kr(rateAmpPart3,  0, rangeAmpPart3));
	part4  = SinOscFB.ar(freqPart4,  fbPart4,  SinOsc.kr(rateAmpPart4,  0, rangeAmpPart4));
	part5  = SinOscFB.ar(freqPart5,  fbPart5,  SinOsc.kr(rateAmpPart5,  0, rangeAmpPart5));
	part6  = SinOscFB.ar(freqPart6,  fbPart6,  SinOsc.kr(rateAmpPart6,  0, rangeAmpPart6));
	part7  = SinOscFB.ar(freqPart7,  fbPart7,  SinOsc.kr(rateAmpPart7,  0, rangeAmpPart7));
	part8  = SinOscFB.ar(freqPart8,  fbPart8,  SinOsc.kr(rateAmpPart8,  0, rangeAmpPart8));
	part9  = SinOscFB.ar(freqPart9,  fbPart9,  SinOsc.kr(rateAmpPart9,  0, rangeAmpPart9));
	part10 = SinOscFB.ar(freqPart10, fbPart10, SinOsc.kr(rateAmpPart10, 0, rangeAmpPart10));
	part11 = SinOscFB.ar(freqPart11, fbPart11, SinOsc.kr(rateAmpPart11, 0, rangeAmpPart11));
	mix = Mix.new([fund, part1, part2, part3, part5, part6, part7, part8, part9, part10, part11]);
	delay = Mix.new([mix, AllpassC.ar(mix, 0.2, 0.05, 1, 0.5)]);
	feedb = Mix.new([delay, AllpassC.ar(delay, 0.2, 0.05, 1, 0.5)]);
	OffsetOut.ar(0, Limiter.ar(Pan2.ar(feedb, MouseX.kr(-1.0, 1.0)), 0.95)) ;
}).add;
)

~fund = 220;
~amps = 1.0;
~rate = 0.3;
~partials = Array.fill(36, { |i| ~fund * i + ~fund });
~amps = Array.fill(12, {|i| ~amps * 1/i } );
~fb = Array.fill(12, { |i| (i.rand(3) * 0.05) + 0.3 } );
~rateAmp = Array.fill(12, { |i| ~rate * i + 10 });

a = Synth(\addEnv, [\freqFund, ~fund, \freqPart1, ~partials.at(2), \freqPart2, ~partials.at(4), \freqPart3, ~partials.at(6), \freqPart4, ~partials.at(8), \freqPart5, ~partials.at(10), \freqPart6, ~partials.at(12), \freqPart7, ~partials.at(14), \freqPart8, ~partials.at(16), \freqPart9, ~partials.at(18), \freqPart10, ~partials.at(20), \freqPart11, ~partials.at(22), \rangeAmpFund, ~amps.at(1), \rangeAmpPart1, ~amps.at(2), \rangeAmpPart2, ~amps.at(3), \rangeAmpPart3, ~amps.at(4), \rangeAmpPart4, ~amps.at(5), \rangeAmpPart5, ~amps.at(6), \rangeAmpPart6, ~amps.at(7), \rangeAmpPart7, ~amps.at(8), \rangeAmpPart8, ~amps.at(9), \rangeAmpPart9, ~amps.at(10), \rangeAmpPart10, ~amps.at(11), \rangeAmpPart11, ~amps.at(12), \fbfund, ~fb.at(0), \fbPart1, ~fb.at(1), \fbPart2, ~fb.at(2), \fbPart3, ~fb.at(3), \fbPart4, ~fb.at(4), \fbPart5, ~fb.at(5), \fbPart6, ~fb.at(6), \fbPart7, ~fb.at(7), \fbPart8, ~fb.at(8), \fbPart9, ~fb.at(9), \fbPart10, ~fb.at(10), \fbPart11, ~fb.at(11), \rateAmpFund, ~rateAmp.at(0), \rateAmpPart1, ~rateAmp.at(1), \rateAmpPart2, ~rateAmp.at(2),  \rateAmpPart3, ~rateAmp.at(3),  \rateAmpPart4, ~rateAmp.at(4),  \rateAmpPart5, ~rateAmp.at(5),  \rateAmpPart6, ~rateAmp.at(6), \rateAmpPart7, ~rateAmp.at(7), \rateAmpPart8, ~rateAmp.at(8), \rateAmpPart9, ~rateAmp.at(9), \rateAmpPart10, ~rateAmp.at(10), \rateAmpPart11, ~rateAmp.at(11)]);

a.set(\freqFund, ~fund, \freqPart1, ~partials.at(2), \freqPart2, ~partials.at(4), \freqPart3, ~partials.at(6), \freqPart4, ~partials.at(8), \freqPart5, ~partials.at(10), \freqPart6, ~partials.at(12), \freqPart7, ~partials.at(14), \freqPart8, ~partials.at(16), \freqPart9, ~partials.at(18), \freqPart10, ~partials.at(20), \freqPart11, ~partials.at(22));

a.set(\rateAmpFund, ~rateAmp.at(0), \rateAmpPart1, ~rateAmp.at(1), \rateAmpPart2, ~rateAmp.at(2),  \rateAmpPart3, ~rateAmp.at(3),  \rateAmpPart4, ~rateAmp.at(4),  \rateAmpPart5, ~rateAmp.at(5),  \rateAmpPart6, ~rateAmp.at(6), \rateAmpPart7, ~rateAmp.at(7), \rateAmpPart8, ~rateAmp.at(8), \rateAmpPart9, ~rateAmp.at(9), \rateAmpPart10, ~rateAmp.at(10), \rateAmpPart11, ~rateAmp.at(11));

a.set(\fbfund, ~fb.at(0), \fbPart1, ~fb.at(1), \fbPart2, ~fb.at(2), \fbPart3, ~fb.at(3), \fbPart4, ~fb.at(4), \fbPart5, ~fb.at(5), \fbPart6, ~fb.at(6), \fbPart7, ~fb.at(7), \fbPart8, ~fb.at(8), \fbPart9, ~fb.at(9), \fbPart10, ~fb.at(10), \fbPart11, ~fb.at(11));