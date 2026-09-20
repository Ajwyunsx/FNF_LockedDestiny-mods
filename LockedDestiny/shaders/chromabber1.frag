#pragma header

uniform float amount;

vec2 PincushionDistortion(in vec2 uv, float strength)
{
    vec2 st = uv - 0.5;
    float uvA = atan(st.x, st.y);
    float uvD = dot(st, st);

    return 0.5 +
        vec2(sin(uvA), cos(uvA)) *
        sqrt(uvD) *
        (1.0 - strength * uvD);
}

vec3 ChromaticAbberation(sampler2D tex, in vec2 uv)
{
    // Rojo: strength siempre era 0
    vec2 redUV = PincushionDistortion(uv, 0.0);

    // Verde y azul usan exactamente la misma coordenada
    vec2 colorUV = PincushionDistortion(uv, 0.01 * amount);

    float rChannel = texture2D(tex, redUV).r;
    float gChannel = texture2D(tex, colorUV).g;
    float bChannel = texture2D(tex, colorUV).b;

    return vec3(rChannel, gChannel, bChannel);
}

void main()
{
    vec2 uv = openfl_TextureCoordv;

    vec3 col = ChromaticAbberation(bitmap, uv);

    float alpha = texture2D(bitmap, uv).a;

    gl_FragColor = vec4(col, alpha);
}