#pragma header

uniform float iTime;
uniform float glitchAlpha;

#define GLITCH_THR 0.27
#define GLITCH_RECT_DIVISION 9.0
#define GLITCH_RECT_ITR 6

float hash(float v)
{
    return fract(sin(v) * 43768.5453);
}

float hash2(vec2 v)
{
    return fract(sin(dot(v, vec2(12.9898, 78.233))) * 43768.5453);
}

vec2 hash22(float v)
{
    return vec2(
        hash(v + 77.77),
        hash(v + 999.999)
    );
}

vec3 glitch(vec2 p, float seed)
{
    float g = -1.0;

    for(int i = 0; i < GLITCH_RECT_ITR; i++)
    {
        float fi = float(i) + 1.0;
        vec2 h2 = hash22(fi + seed);

        vec2 q = p * GLITCH_RECT_DIVISION * fi + h2;
        q *= h2 * 2.0 - 1.0;

        vec2 iq = floor(q);
        float hq = hash2(iq);

        if(hq < GLITCH_THR)
        {
            p += (hash22(fi + seed) * 2.0 - 1.0) * 4.0;
            g = hash(fi + seed);
        }
    }

    return vec3(fract(p), g);
}

void main()
{
    vec2 uv = openfl_TextureCoordv;

    vec4 original = flixel_texture2D(bitmap, uv);

    if(glitchAlpha <= 0.0)
    {
        gl_FragColor = original;
        return;
    }

    float seed = floor(iTime * 45.0) / 45.0;

    vec3 g = glitch(uv, seed);

    if(g.z < 0.0)
    {
        gl_FragColor = original;
        return;
    }

    float shift = g.z * 0.035;

    vec2 glitchUV = uv;

    glitchUV.x += (g.z - 0.5) * 0.12;

    float r = flixel_texture2D(
        bitmap,
        glitchUV + vec2(shift, 0.0)
    ).r;

    float gg = flixel_texture2D(
        bitmap,
        glitchUV
    ).g;

    float b = flixel_texture2D(
        bitmap,
        glitchUV - vec2(shift, 0.0)
    ).b;

    vec3 glitchColor = vec3(r, gg, b);

    vec3 finalColor = mix(
        original.rgb,
        glitchColor,
        glitchAlpha
    );

    gl_FragColor = vec4(
        finalColor,
        original.a
    );
}