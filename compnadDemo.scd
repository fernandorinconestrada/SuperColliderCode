(
// plot the curve
{ | thresh = -40, knee = 20, slopeAbove = 1 |
        var sig, amp;
        var times = [0.0, 0.1], normal;

        sig = XLine.ar(-60.dbamp,1,0.1);
        knee = knee.max(0.000001); // zero produces nan

        normal = Compander.ar( sig, sig, thresh.dbamp, 0.5, slopeAbove, *times);

        amp = Amplitude.ar( sig, *times )
                .linlin( (thresh-knee).dbamp, (thresh+knee).dbamp, 0,1).clip(0,1).sqrt;

        slopeAbove = 1.blend( slopeAbove, amp );
        thresh = (thresh-knee).blend( thresh, amp );

        [ normal, Compander.ar( sig, sig, thresh.dbamp, 1, slopeAbove, *times) ].ampdb;

}.plot(0.1, minval: -60, maxval: 0).superpose_(true);
)

{XLine.ar(0, 1, 0.1)}.plot(0.1, minval: -60, maxval: 0);

{Compander.ar(WhiteNoise.ar(0.1), WhiteNoise.ar(0.1), -30.dbamp, 1, 0.5)}.plot(0.1);

{
	var in, in2, in3, in4, trig;
	trig = Impulse.ar(1);
	in = Decay2.ar(trig, 0.01, 0.1, SinOscFB.ar(440, 0.5, -30.dbamp)*EnvGen.kr(Env.perc));
	in2 = Decay2.ar(TDelay.ar(trig), 0.01, 0.1, SinOscFB.ar(440, 0.5, -50.dbamp)*EnvGen.kr(Env.perc));
	in3 = Decay2.ar(TDelay.ar(trig, 0.2), 0.01, 0.1, SinOscFB.ar(440, 0.5, -50.dbamp)*EnvGen.kr(Env.perc));
	in4 = Compander.ar(in3, in3, -40.dbamp, 0.5, 2);
	Mix.new([in, in2, in4]);
}.plot(0.3);

{
	var in, in2, in3, in4, trig;
	trig = Impulse.ar(0.25);
	in = Decay2.ar(trig, 0.01, 0.1, SinOscFB.ar(440, 0.5, -10.dbamp)*EnvGen.ar(Env.perc, trig, doneAction:2));
	in2 = Decay2.ar(TDelay.ar(trig), 0.01, 0.1, SinOscFB.ar(440, 0.5, -20.dbamp)*EnvGen.ar(Env.perc, TDelay.ar(trig, 1), doneAction:2));
	in3 = Decay2.ar(TDelay.ar(trig, 0.2), 0.01, 0.1, SinOscFB.ar(440, 0.5, -20.dbamp)*EnvGen.ar(Env.perc, TDelay.ar(trig, 2), doneAction:2));
	//in4 = Compander.ar(in3, in3, -10.dbamp, 0.5, 2);
	OffsetOut.ar(0, Mix.new([in, in2, in3]));
}.play;

{
	var trig, in, in2, in3, in4;
	trig = Impulse.ar(0.25);
	in = Decay2.ar(trig, 0.01, 0.1, SinOscFB.ar(440, 0.5, -10.dbamp)*EnvGen.ar(Env.perc, trig));
	in2 = Decay2.ar(TDelay.ar(trig, 1), 0.01, 0.1, SinOscFB.ar(440, 0.5, -20.dbamp)*EnvGen.ar(Env.perc, TDelay.ar(trig, 1)));
	in3 = Decay2.ar(TDelay.ar(trig, 2), 0.01, 0.1, SinOscFB.ar(440, 0.5, -20.dbamp)*EnvGen.ar(Env.perc, TDelay.ar(trig, 2)));
	in4 = Compander.ar(in3, in3, -10.dbamp, 0.75, 1.5);
	OffsetOut.ar(0, Mix.new([in, in2, in4]));
}.play;