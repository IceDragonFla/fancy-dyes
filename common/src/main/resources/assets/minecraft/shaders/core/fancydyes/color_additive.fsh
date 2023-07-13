#version 150

#moj_import <fog.glsl>

uniform sampler2D Sampler0;
uniform sampler2D Sampler2;
uniform sampler2D Sampler3;

uniform vec4 ColorModulator;
uniform float FogStart;
uniform float FogEnd;
uniform vec4 FogColor;

in float vertexDistance;
in vec4 vertexColor;
in vec4 dyeColor;
in vec2 texCoord0;
in vec2 texCoord1;
in vec2 texCoord3;
in vec4 normal;

out vec4 fragColor;

void main() {
    vec4 color = texture(Sampler0, texCoord0) * ColorModulator;

    if (color.a < 0.1) {
        discard;
    }

    color = color + vertexColor;

    fragColor = linear_fog(color, vertexDistance, FogStart, FogEnd, FogColor);
}