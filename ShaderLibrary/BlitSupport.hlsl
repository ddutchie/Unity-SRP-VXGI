#ifndef VXGI_BLIT_SUPPORT_HLSL
#define VXGI_BLIT_SUPPORT_HLSL

#if defined(UNITY_REVERSED_Z)
  #define DEPTH_TO_CLIP_Z(depth) depth
#else
  #define DEPTH_TO_CLIP_Z(depth) mad(2.0, depth, -1.0)
#endif

struct BlitInput
{
  float4 vertex : SV_POSITION;
  float2 uv : TEXCOORD;
  float2 uv1 : TEXCOORD1;
  UNITY_VERTEX_OUTPUT_STEREO
 
};


BlitInput BlitVertex(appdata_base v)
{
  BlitInput o;
  o.vertex = UnityObjectToClipPos(v.vertex);
  o.uv = UnityStereoTransformScreenSpaceTex (v.texcoord);
  o.uv1 = (v.texcoord);
  return o;
}

// struct BlitInput2
// {
//   float4 vertex : SV_POSITION;
//   float2 uv : TEXCOORD;
//   UNITY_VERTEX_OUTPUT_STEREO
 
// };


// BlitInput2 BlitVertex2(appdata_base v)
// {
//   BlitInput2 o;
//   o.vertex = UnityObjectToClipPos(v.vertex);
//   o.uv = (v.texcoord);
//   return o;
// }


#endif
