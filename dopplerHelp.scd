(
{
var a, b;
a = FSinOsc.ar(100).poll;
[a, a**10];
}.play

)

(
{
var x, y, distance, velocity, pitchRatio, amplitude;
// object travels 200 meters in 6 secs (=120kph) passing 10 meters
// from the listener
x = 10;
y = LFSaw.kr(1/6, 0, 100);
distance = hypot(x, y);
velocity = Slope.kr(distance);
pitchRatio = (344 - velocity) / 344; // speed of sound is 344 meters/sec
amplitude = 10 / distance.squared;
FSinOsc.ar(1000 * pitchRatio, 0, amplitude)
}.play)

(
{
var x, y, distance, velocity, pitchRatio, amplitude, motorSound;
// object travels 200 meters in 6 secs (=120kph) passing 10 meters
// from the listener
x = 10;
y = LFSaw.kr(1/6, 0, 100);
y = LFSaw.kr(1/6, 0, 100);
distance = hypot(x, y);
amplitude = 40 / distance.squared;
motorSound = RLPF.ar(FSinOsc.ar(200, 0, LFPulse.ar(31.3, 0, 0.4)), 400, 0.3);
DelayL.ar(motorSound, 110/344, distance/344, amplitude)
}.play)
(
{
var x, y, distance, velocity, pitchRatio, amplitude, azimuth, panValue;
// object travels 200 meters in 6 secs (=120kph) passing 10 meters
// from the listener
x = 10;
y = LFSaw.kr(1/6, 0, 100);
distance = hypot(x, y);
velocity = Slope.kr(distance);
pitchRatio = (344 - velocity) / 344; // speed of sound is 344 meters/sec
amplitude = 10 / distance.squared;
azimuth = atan2(y, x); // azimuth in radians
panValue = (azimuth / 0.5pi).clip2(1);
Pan2.ar(FSinOsc.ar(1000 * pitchRatio), panValue, amplitude)
}.play)

(
{
var x, y, distance, velocity, pitchRatio, amplitude, motorSound,
azimuth, panValue;
// object travels 200 meters in 6 secs (=120kph) passing 10 meters
x = 10;
y = LFSaw.kr(1/6, 0, 100);
distance = hypot(x, y);
amplitude = 40 / distance.squared;
motorSound = RLPF.ar(FSinOsc.ar(200, LFPulse.ar(31.3, 0, 0.4)), 400, 0.3);
azimuth = atan2(y, x); // azimuth in radians
panValue = (azimuth / 0.5pi).clip2(1); // make a value for Pan2 from azimuth
Pan2.ar(DelayL.ar(motorSound, 110/344, distance/344), panValue, amplitude)
}.play)

(SinOsc.ar(200) * ClipNoise.ar).dump;
(SinOsc.ar(200).thresh(0.5)).dump;