// define encoder / decoder matrices
~encoder = FoaEncoderMatrix.newStereo
~encoder = FoaEncoderMatrix.newPanto(10, 'point');
//~directions = pi/180 * [[0, 0], [45, 0], [90, 0], [135, 0], [-180, 0], [-135, 0], [-90, 0], [-45, 0], [45, 35.3], [135, 35.3], [-135, 35.3], [-45, 35.3], [0, 90]];
//~encoder = FoaEncoderMatrix.newDirections(~directions);
//~decoder = FoaDecoderMatrix.newStereo
~decoder = FoaDecoderMatrix.newPanto(8, k: 'dual')
// inspect
~encoder.kind
~encoder.numChannels
~encoder.dirChannels * 90/pi

~decoder.kind
~decoder.numChannels
~decoder.dirChannels * 180/pi

~sndbuf = Buffer.read(s, "/Users/fernandorincon/Music/Field Recordings/chunk2.wav")
(
{
    var sig;// audio signal
    var angle, azim;            // angle and azimuth control
    // display encoder and decoder
    "Ambisonic encoding via % encoder".format(~encoder.kind).postln;
    "Ambisonic decoding via % decoder".format(~decoder.kind).postln;
    // angle ---> top         = push to plane wave
    //            bottom        = omni-directional
   // angle = MouseY.kr(pi/2, 0);
	angle = SinOsc.kr(MouseX.kr(0.2, 8, lag: 0.2));
    // azimuth -> hard left     = back
    //          centre     = centre
    //          hard right     = back
    //azim = MouseX.kr(pi, -pi);
	azim = SinOsc.kr(MouseY.kr(0.2, 8, lag: 0.2)).range(-3.14, 3.14).poll;
    // -----------------------------------------------------------    // test sig
    //sig = PinkNoise.ar;             // mono pink noise
	sig = PlayBuf.ar(~sndbuf.numChannels, ~sndbuf, doneAction:2);
    // ------------------------------------------------------------
    // encode
    sig = FoaEncode.ar(sig, ~encoder);
// ------------------------------------------------------------
    // transform
    sig = FoaTransform.ar(sig, 'push', angle, azim);
    // ------------------------------------------------------------
    // decode (to stereo)
    FoaDecode.ar(sig, ~decoder);
}.scope;
)