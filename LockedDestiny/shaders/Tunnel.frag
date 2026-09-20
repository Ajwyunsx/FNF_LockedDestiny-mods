#pragma header

uniform float iTime;

void main()
{
    vec2 p = openfl_TextureCoordv * 2.0 - 1.0;

    p.x *= openfl_TextureSize.x / openfl_TextureSize.y;

    float rot = iTime * 0.15;
    float c = cos(rot);
    float s = sin(rot);

    float px = p.x * c - p.y * s;
    float py = p.x * s + p.y * c;

    float r = length(vec2(px, py));
    float a = atan(py, px);

    vec2 tuv;

    tuv.x = 0.25 / max(r, 0.01) + iTime * 0.2;
    tuv.y = a / 6.2831853;

    gl_FragColor = flixel_texture2D(bitmap, fract(tuv));
}