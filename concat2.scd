b = Buffer.read(s,"/Users/fernandorincon/Music/Recordings FRE/liso_frag.aif");


//match only on amplitude from audio in
(
SynthDef(\concat1, {arg bufnum, matchlength=0.01, freeze=0, dens= 2, zeroX = 1,lmsAmp = 1 ,specCentr = 1,tilt = 0;
	var concat, control, input;
	control= Dust.ar(dens);
	input=PlayBuf.ar(1,bufnum,BufRateScale.kr(bufnum), loop:1);
	concat= Concat2.ar(control,input,MouseX.kr(0.01, 1, lag:0.2) , MouseY.kr(0.01, 1.0, lag:0.2),1.0,matchlength,freeze,zeroX,lmsAmp,specCentr,tilt,);
OffsetOut.ar(0,Pan2.ar(concat,0.0))
}).add;
)

a=Synth(\concat1,[\bufnum, b.bufnum]);
a.set(\dens, 10);
a.set(\freeze, 0);
a.set(\matchlength, 0.01);

