( var name, func, specs, componentType, componentSubtype, builder;

name = "sineTestB";
func =  {
 	| dens = 0.2, ampImp = 0.1, freq = 440, pha = 0, amp = 0.2, scale = 1, pos = 0|

	var gate, env, in;

	gate = Impulse.ar(dens, ampImp);
	env = EnvGen.kr(Env.perc, gate, timeScale: scale);
	in = FSinOsc.ar(freq, pha, amp);

	Out.ar(0, Pan2.ar(in, pos) * env);
};

specs =  #[
	[0, 20 , \Linear, 10,\Rate ] ,
	[0, 0.5 , \Linear, 0.2,\LinearGain ] ,
	[0, 2000 , \Linear, 440,\Hertz ] ,
	[0, 2 , \Linear, 0.0,\Phase ] ,
	[0, 0.8 , \Linear, 0.6,\LinearGain ] ,
	[0, 5 , \Linear, 0.1,\Ratio ] ,
	[-1.0, 1.0 , \Linear, 0.1,\Pan ]
];


componentType = \aumu;

componentSubtype = "SIT2";

builder = AudioUnitBuilder.new(name, componentSubtype,func, specs, componentType);

builder.makeInstall;
)
