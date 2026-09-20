#pragma header

uniform float uTime;
uniform float uSpeed;
uniform float uFrequency;
uniform float uWaveAmplitude;

void main()
{
    vec2 uv = openfl_TextureCoordv;

    float wave = sin(
        uv.x * uFrequency -
        uTime * uSpeed
    ) * uWaveAmplitude;

    uv.y += wave;

    gl_FragColor = flixel_texture2D(bitmap, uv);
}