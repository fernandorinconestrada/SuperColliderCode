o = Server.local.options;
o.memSize = 16384;
(
~fftsize = 1024;
{
	var irbuffer, bufsize;
	irbuffer = Buffer.read(s, "/Users/fernandorincon/Music/Field Recordings/chunk_mono.wav", numFrames:1024);
	s.sync;
	bufsize = PartConv.calcBufSize(~fftsize, irbuffer);
	~irspectrum = Buffer.alloc(s, bufsize, 1);
	~irspectrum.preparePartConv(irbuffer, ~fftsize);
	s.sync;
	irbuffer.free;
}.fork;
)
(
{
	var  in;
	in = Impulse.ar(2.5, 0, 1);
	Out.ar(0, PartConv.ar(in, ~fftsize, ~irspectrum.bufnum))
}.play;
)

(
{
	var  in;
	in = SoundIn.ar(0);
	Out.ar(0, PartConv.ar(in, ~fftsize, ~irspectrum.bufnum))
}.play;
)