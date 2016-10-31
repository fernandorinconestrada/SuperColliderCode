(
{
	var freq, ring, amp, trig, trigDec, trigRateImp, noise, in, trigDemand;
	trigRateImp = 0.3;
	trigDemand = Dwhite(6,12, inf);
	trigDec = Impulse.ar(trigRateImp, 0, 0.4);
	trig = Impulse.ar(Demand.ar(trigDec, 0, trigDemand), 0, 0.4);
	freq = Array.fill(5, {TExpRand.ar(200, 1000, trig)});
	amp = Array.fill(5, {TExpRand.ar(0.3, 0.7, trig)});
	ring = Array.fill(5, {TExpRand.ar(0.5, 1.0, trig)});
	noise = LFNoise0.ar(trigDec);
	in = LPF.ar(Decay2.ar(trigDec, 0.03, noise.range(1, 1.5), DynKlank.ar(`[freq, amp, ring], trig, noise.range(0.95, 1.05), 0, noise.range(0.5, 1.0))), 800);
	OffsetOut.ar(0, FreeVerb.ar(in, 0.5, 0.5, 0.5));
	OffsetOut.ar(1, FreeVerb.ar(DelayC.ar(in, 0.1, noise.range(0.03, 0.06), noise.range(0.5, 0.7)), 0.5, 0.5, 0.5));
}.play;
)

o = Server.local.options;
o.numOutputBusChannels = 2;
o.numOutputBusChannels;

s.prepareForRecord("/Users/fernandorincon/Music/SuperCollider Recordings/allosphere/test/testMono.aif");
s.record;
s.stopRecording;
