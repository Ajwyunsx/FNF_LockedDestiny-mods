#pragma header

uniform float strength;
uniform float cx;
uniform float cy;
uniform float radius;

void main()
{
    vec2 uv = openfl_TextureCoordv;
    vec2 dir = uv - vec2(cx, cy);
    float dist = length(dir);
    float falloff = clamp((dist - radius) / (1.0 - radius), 0.0, 1.0);
    float blur = strength * falloff;

    vec4 col = texture2D(bitmap, uv);
    col += texture2D(bitmap, uv - dir * 0.015 * blur);
    col += texture2D(bitmap, uv - dir * 0.03 * blur);
    col += texture2D(bitmap, uv - dir * 0.045 * blur);

    gl_FragColor = col * 0.25;
}