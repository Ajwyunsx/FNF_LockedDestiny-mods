#pragma header

uniform float iTime;

#define tex flixel_texture2D(bitmap, uv)

float rand(vec2 p)
{
    return fract(sin(dot(p, vec2(12.9898, 78.233))) * 43758.5453);
}

void main()
{
    vec2 uv = openfl_TextureCoordv.xy;

    float y = floor(uv.y * 250.0) / 250.0;
    float noise = rand(vec2(iTime * 0.00001, y)) * 0.005;
    float glitch = rand(vec2(floor(uv.y * 18.0), floor(iTime))) * 0.001;

    vec2 shift = vec2((noise + glitch) * 0.18, 0.0);

    vec4 base = tex;
    float r = flixel_texture2D(bitmap, uv + shift).r;
    float g = flixel_texture2D(bitmap, uv - shift).g;

    gl_FragColor = vec4(r, g, base.b, base.a);
}