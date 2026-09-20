#pragma header

uniform float strength;
uniform float centerX;
uniform float centerY;

const int num_samples = 18;
const float attenuation = 0.95;

void main()
{
    vec2 uv = openfl_TextureCoordv;
    vec2 origin = vec2(centerX, centerY);

    vec2 delta = (origin - uv) / float(num_samples);
    vec2 p = uv;

    vec3 blur = vec3(0.0);
    float totalWeight = 0.0;

    for(int i = 0; i < num_samples; i++)
    {
        float fi = float(i);
        float weight = pow(attenuation, fi);

        vec3 sampleColor = flixel_texture2D(bitmap, p).rgb;

        float brightness =
            (sampleColor.r +
             sampleColor.g +
             sampleColor.b) * 0.333333;

        float sideMask =
            smoothstep(0.0, 0.40, p.x) *
            (1.0 - smoothstep(0.10, 1.0, p.x));

        float mask = max(brightness - 0.3, 0.0) * sideMask;

        blur += vec3(mask * weight);
        totalWeight += weight;

        p += delta;
    }

    blur /= totalWeight;

    vec4 original = flixel_texture2D(bitmap, uv);

    vec3 color = original.rgb +
                 (blur * strength) /
                 (1.6 + blur);

    gl_FragColor = vec4(color, original.a);
}