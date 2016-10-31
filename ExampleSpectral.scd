(
SynthDef(\binScramble, { arg out=0;
    var in, chain;
	in = SoundIn.ar(0);
    chain = FFT(LocalBuf(2048), in);
    chain = PV_BinScramble(chain, MouseX.kr, MouseY.kr, Dust.kr(0.3));
    Out.ar(out, 0.1 * IFFT(chain).dup);
}).play;
)

(
SynthDef(\binShift2, {  arg out=0;
    var in, chain;
	in = SoundIn.ar(0);
    chain = FFT(LocalBuf(2048), in);
    chain = PV_BinShift(chain, 1, MouseX.kr(-128, 128) );
    Out.ar(out, 0.5 * IFFT(chain).dup);
}).play;
)
//density
(
SynthDef(\binShift2Del, {  arg out=0;
    var in, chain, output;
	in = SoundIn.ar(0);
    chain = FFT(LocalBuf(2048), in);
    chain = PV_BinShift(chain, 1, MouseX.kr(-128, 128) );
    output = IFFT(chain).dup * 0.5;
	Out.ar(0, output);
	Out.ar(0, AllpassC.ar(output, 0.2, 0.08));
}).play;
)

(
(
b = Buffer.alloc(s,2048,1);
);
SynthDef(\help_randcomb2, { arg out=0, bufnum=0, soundBufnum=2;
    var in, chain;
    in = SoundIn.ar(0);
    chain = FFT(bufnum, in);
    chain = PV_RandComb(chain, MouseY.kr, Impulse.kr(0.4));
    Out.ar(out, IFFT(chain).dup);
}).play(s,[\out, 0, \bufnum, b.bufnum]);
)

(
(
b = Buffer.alloc(s,2048,1);
);
SynthDef(\help_randcomb2Del, { arg out=0, bufnum=0, soundBufnum=2;
    var in, chain, output;
    in = SoundIn.ar(0);
    chain = FFT(bufnum, in);
    chain = PV_RandComb(chain, MouseY.kr, Impulse.kr(0.4));
    output = IFFT(chain).dup;
	Out.ar(0, output);
	Out.ar(0, AllpassC.ar(output, 0.2, 0.08));
}).play(s,[\out, 0, \bufnum, b.bufnum]);
)