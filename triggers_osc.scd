(
y = SynthDef( \instrument_send_triggers, {
	var in_env, in, amp, amp_trig_timer, amp_trig, freq, hasFreq, latch_freq;

	in_env = EnvGen.kr(Env.perc(0.05, 1, 1, -4), MouseButton.kr(0, 1, 0.1));
	in = SinOsc.ar(MouseX.kr(40, 800), 0, in_env * 0.5);


	amp = Amplitude.kr(in, attackTime: 0.01, releaseTime: 0.01, add: -0.15);
	amp_trig_timer = Timer.kr(amp); // time since last triggered
	amp_trig = Trig1.kr(amp_trig_timer > 1, 0.1); //shuts down for 1" to prevent recurring triggers

	# freq, hasFreq = Pitch.kr(in);
	latch_freq = Latch.ar(freq, amp); //Holds freq value when triggered

	SendTrig.kr(amp_trig, 0, latch_freq); //trigger id==0, trigger value is latch_freq

	Out.ar(0, in); //listen

}).play
)

(
x = SynthDef(\instrument_receive_triggers,{
	arg mul_levelScale = 0.2, freq;
	var env_mul, out;

	env_mul = EnvGen.kr(Env.perc(0.05, 0.3, curve: -4), levelScale:
mul_levelScale, doneAction: 2);
	out = Saw.ar(freq * 1.5, env_mul);
	Out.ar(1, out);
}).add;
)



(
~oscr1 = OSCresponderNode(s.addr, '/tr', { |time, resp, msg|
			~freqs = msg[3];
			~freqs.postln;
			~pattern_player.play; };
		).add;

)

(
~pattern_player =
Pbind(\instrument, \instrument_receive_triggers,
			 \dur, Pseq([1, 1, 1.5, 0.5, 3], 1),
	 		 \mul_levelScale, 0.5,
	 		 \freq,Pfunc({ ~freqs })
		);

)