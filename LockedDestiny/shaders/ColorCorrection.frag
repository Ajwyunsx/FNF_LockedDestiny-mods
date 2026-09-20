#pragma header

uniform float hue;
uniform float saturation;
uniform float brightness;
uniform float contrast;

vec3 applyHue(vec3 c,float h){
    float a=radians(h),s=sin(a),co=cos(a);
    vec3 k=vec3(0.57735);
    return c*co+cross(k,c)*s+k*dot(k,c)*(1.0-co);
}

vec3 applyHSBCEffect(vec3 c){
    c=clamp(c+brightness/255.0,0.0,1.0);
    c=applyHue(c,hue);
    c=clamp((c-0.5)*(1.0+contrast/255.0)+0.5,0.0,1.0);
    vec3 i=vec3(dot(c,vec3(0.30980392156,0.60784313725,0.08235294117)));
    return clamp(mix(i,c,1.0+saturation/100.0),0.0,1.0);
}

vec4 flixel_texture2DCustom(sampler2D bitmap,vec2 coord){
    vec4 c=texture2D(bitmap,coord);
    c=vec4(c.rgb/c.a,c.a);
    c.rgb=applyHSBCEffect(c.rgb);
    c=vec4(c.rgb*c.a,c.a);

    if(!hasTransform)return c;
    if(c.a==0.0)return vec4(0.0);
    if(!hasColorTransform)return c*openfl_Alphav;

    c=vec4(c.rgb/c.a,c.a);
    c=clamp(openfl_ColorOffsetv+(c*openfl_ColorMultiplierv),0.0,1.0);

    if(c.a>0.0)return vec4(c.rgb*c.a*openfl_Alphav,c.a*openfl_Alphav);
    return vec4(0.0);
}

void main(){
    gl_FragColor=flixel_texture2DCustom(bitmap,openfl_TextureCoordv);
}