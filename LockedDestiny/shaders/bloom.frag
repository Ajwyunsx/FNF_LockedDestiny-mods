#pragma header

uniform float iTime;

#define iChannel0 bitmap
#define texture flixel_texture2D
#define fragColor gl_FragColor
#define mainImage main

uniform float Threshold;
uniform float Intensity;

vec4 blend(in vec2 Coord, in sampler2D Tex, in float MipBias)
{
    vec2 TexelSize = MipBias / openfl_TextureSize;

    vec4 Color = texture(Tex, Coord);

    for (float i = 1.0; i <= 3.0; i += 1.0)
    {
        vec2 Offset = TexelSize / i;

        Color += texture(Tex, Coord + vec2( Offset.x,  Offset.y));
        Color += texture(Tex, Coord + vec2(-Offset.x,  Offset.y));
        Color += texture(Tex, Coord + vec2( Offset.x, -Offset.y));
        Color += texture(Tex, Coord + vec2(-Offset.x, -Offset.y));
    }

    return Color / 12.0;
}

void mainImage()
{
    vec2 uv = openfl_TextureCoordv.xy;
    vec2 fragCoord = openfl_TextureCoordv * openfl_TextureSize;
    vec2 iResolution = openfl_TextureSize;
    vec4 Color = texture(iChannel0, openfl_TextureCoordv);

    vec4 Highlight = blend(
        openfl_TextureCoordv,
        iChannel0,
        4.0
    );

    Highlight = clamp(
        Highlight - Threshold,
        0.0,
        1.0
    ) / (1.0 - Threshold);

    fragColor = 1.0 - (1.0 - Color) *
        (1.0 - Highlight * Intensity);
}