#pragma header

uniform float iTime;

#define iChannel0 bitmap
#define texture flixel_texture2D
#define fragColor gl_FragColor
#define mainImage main

void mainImage(void)
{
    vec2 fragCoord = openfl_TextureCoordv * openfl_TextureSize;
    vec2 iResolution = openfl_TextureSize;
    vec2 uv = fragCoord / iResolution.xy;

    float dx = abs(uv.x - 0.45);
    float dy = abs(uv.y - 0.5);

    float offset = dx * 0.2 * dy;
    float dir = uv.y <= 0.5 ? 1.0 : -1.0;

    vec2 coords = vec2(
        uv.x,
        uv.y + dx * offset * 3.2 * dir
    );

    fragColor = texture(iChannel0, coords);
}
