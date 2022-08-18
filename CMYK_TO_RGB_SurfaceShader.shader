Shader "Custom/NewSurfaceShader"
{
    Properties
    {
        _ColorC ("Cyan", Range(0.0,100.0)) = 0.0
        _ColorM ("Magenta", Range(0.0,100.0)) = 0.0
        _ColorY ("Yellow", Range(0.0,100.0)) = 0.0
        _ColorK ("Black", Range(0.0,100.0)) = 0.0


    }
    SubShader
    {
        Pass {
            CGPROGRAM

            #pragma vertex vert
            #pragma fragment frag

            float4 _Color;
            float _ColorC;
            float _ColorM;
            float _ColorY;
            float _ColorK;

            float4 vert(float4 vertexPos:POSITION) :SV_POSITION
            {
                return UnityObjectToClipPos(vertexPos);
            }

            float4 frag() :Color 
            {

                float r = 255.0 * (1.0 - _ColorC / 100.0) * (1.0 - _ColorK / 100.0);
                float g = 255.0 * (1.0 - _ColorM / 100.0) * (1.0 - _ColorK / 100.0);
                float b = 255.0 * (1.0 - _ColorY / 100.0) * (1.0 - _ColorK / 100.0);
                return float4(r,g,b,0);
            }

            ENDCG
        }
    }
    FallBack "Diffuse"
}
