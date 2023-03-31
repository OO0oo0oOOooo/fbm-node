#ifndef FBMCUSTOM_HLSL
#define FBMCUSTOM_HLSL

#include "ClassicNoise2D.hlsl"

float FractalBrownianMotion(float2 uv, float2 offset, float octaves, float freq, float amp, float lacunarity, float gain)
{
    float sum = 0;
    for(int i = 0; i < octaves; i++)
    {
        float n = ClassicNoise(uv * freq + offset);
        sum += n*amp;
        freq *= lacunarity;
        amp *= gain;
    }

    return sum;
}
#endif