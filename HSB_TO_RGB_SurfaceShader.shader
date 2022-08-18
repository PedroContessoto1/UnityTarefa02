Shader "Custom/NewSurfaceShader"
{
    Properties
    {
        _ColorH ("Hue", Range(0.0,360.0)) = 0.0
        _ColorS ("Saturation", Range(0.0,100.0)) = 0.0
        _ColorV ("Value", Range(0.0,100.0)) = 0.0


    }
    SubShader
    {
        Pass {
            CGPROGRAM

            #pragma vertex vert
            #pragma fragment frag

            float _ColorH;
            float _ColorS;
            float _ColorV;


            float3 hsv_to_rgb(float h, float s, float v) {
                if (s == 0) {
                    return float3(v, v, v);
                }

                float i = (h / 60.0) % 6.0;
                float f = (h / 60.0) - i;
                float p = v * (1.0 - s);
                float q = v * (1.0 - f * s);
                float t = v * (1 - (1 - f) * s);

                switch (i) {
                    case 0:
                        return float3(v, t, p);
                    case 1:
                        return float3(q, v, p);
                    case 2:
                        return float3(p, v, t);
                    case 3:
                        return float3(p, q, v);
                    case 4:
                        return float3(t, p, v);
                    case 5:
                        return float3(v, p, q);
                    default:
                        return float3(0.0, 0.0, 0.0);
                }
            }

            float4 vert(float4 vertexPos:POSITION) :SV_POSITION
            {
                return UnityObjectToClipPos(vertexPos);
            }

            float3 frag() :Color 
            {
                return hsv_to_rgb(_ColorH,_ColorS,_ColorV);
            }

            ENDCG
        }
    }
    FallBack "Diffuse"
}
