#pragma header

uniform float u_size;
uniform float u_alpha;

void main()
{
    vec2 uv = openfl_TextureCoordv.xy;

    vec4 blur = vec4(0.0);

    float a_size = u_size * 0.05 * openfl_TextureCoordv.y;

    float blurAmount = 1.0 / (1600.0 * a_size);

    // GLSL ES 100 (Appendix A) requires constant loop bounds:
    // iterate a constant range and break once the original -a_size..a_size span is covered
    for (float i = 0.0; i < 8192.0; i += 1.0)
    {
        float offset = i * 0.001 - a_size;

        if (offset >= a_size)
        {
            break;
        }

        blur.rgb += flixel_texture2D(
            bitmap,
            uv + vec2(0.0, offset)
        ).rgb * blurAmount;
    }

    vec4 color = flixel_texture2D(bitmap, uv);

    gl_FragColor = color +
        u_alpha * (color * (color + blur * 1.2 - 1.3));
}