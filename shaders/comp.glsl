#version 450

// Generated by SPIRVCROSS, needs to be made readable :P

layout(local_size_x = 64, local_size_y = 1, local_size_z = 1) in;

#ifndef SPIRV_CROSS_CONSTANT_ID_1
#define SPIRV_CROSS_CONSTANT_ID_1 0u
#endif
const uint len = SPIRV_CROSS_CONSTANT_ID_1;

struct Person
{
    vec2 Pos;
    uint Status;
    uint Infected;
};

struct Vertex
{
    vec2 Pos;
    vec3 Color;
};

layout(binding = 1, std430) buffer people
{
    Person _data[];
} people_1;

layout(binding = 0, std430) buffer vertices
{
    Vertex _data[];
} vertices_1;

vec3 _331;
vec2 _333;

void main()
{
    if (gl_GlobalInvocationID.x < len)
    {
        uint _199 = people_1._data[gl_GlobalInvocationID.x].Status;
        bool _200 = _199 == 4u;
        vec2 _332;
        if (_200)
        {
            _332 = people_1._data[gl_GlobalInvocationID.x].Pos;
        }
        else
        {
            _332 = _333;
        }
        vertices_1._data[gl_GlobalInvocationID.x].Pos = _332;
        vertices_1._data[gl_GlobalInvocationID.x].Color = mix(_331, vec3(64.0), bvec3(_200));
    }
}

