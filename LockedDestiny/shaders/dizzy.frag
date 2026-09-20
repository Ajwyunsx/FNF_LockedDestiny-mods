#pragma header

uniform float intensity;
uniform float iTime;

void main()
{
    vec2 uv = openfl_TextureCoordv;

    float t = iTime * 1.5;
    float r = 0.018 * intensity;

    vec2 dir = vec2(cos(t), sin(t));

    vec4 col = flixel_texture2D(bitmap, uv) * 0.6;
    col += flixel_texture2D(bitmap, uv + dir * r) * 0.4;

    gl_FragColor = col;
}