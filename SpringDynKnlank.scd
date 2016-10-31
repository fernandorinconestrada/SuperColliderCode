(
SynthDef(\testSpringModel, { |fr1, fr2, fr3, fr4, fr5, fr6, amp1, amp2, amp3, amp4, amp5, amp6, rg1, rg2, rg3, rg4, rg5, rg6, rateImp, ampImp, loSpr = 0.1, hiSpr = 20, loDamp = 0.00001, hiDamp = 0.1|
	var out,del;
	out = DynKlank.ar(`[[fr1, fr2, fr3, fr4, fr5, fr6] * KeyState.kr(38, LFNoise0.kr(20).range(0.95, 1.05), LFNoise0.kr(20).range(0.95, 4.05)), [amp1, amp2, amp3, amp4, amp5, amp6], [rg1, rg2, rg3, rg4, rg5, rg6]], Spring.ar(ToggleFF.ar(Impulse.ar(rateImp, 0, ampImp)), MouseY.kr(loSpr, hiSpr, 1), MouseX.kr(loDamp, hiDamp, 1)));
	del = AllpassC.ar(out, 0.2, 0.05, 1, 0.6);
	OffsetOut.ar(0, Pan2.ar(Limiter.ar(out, 0.98), MouseX.kr(-1.0, 1.0)));
	OffsetOut.ar(0, Pan2.ar(Limiter.ar(del, 0.8), MouseY.kr(1.0, -1.0)));
}).add;
)

~fund = 55;
~peak = 0.003;
~freq = Array.fill(12, { |i| ~fund * i + ~fund});
~amp = Array.fill(6, { |i| ~peak * i + ~peak});
~rg = Array.fill(7, {|i| 0.9/i + 0.1});

b = Synth(\testSpringModel, [\fr1, ~freq.at(0), \fr2, ~freq.at(2), \fr3, ~freq.at(4), \fr4, ~freq.at(6), \fr5, ~freq.at(8),  \fr6, ~freq.at(10), \amp1, ~amp.at(5), \amp2, ~amp.at(4),  \amp3, ~amp.at(3), \amp4, ~amp.at(2), \amp5, ~amp.at(1), \amp6, ~amp.at(0), \rg1, ~rg.at(1), \rg2, ~rg.at(2), \rg3, ~rg.at(3), \rg4, ~rg.at(4), \rg5, ~rg.at(5), \rg6, ~rg.at(6), \rateImp, 1,  \ampImp, 0.8])

b.set(\rateImp, 0.4);


