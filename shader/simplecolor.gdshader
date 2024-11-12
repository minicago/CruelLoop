shader_type spatial;

uniform vec3 color ;

void vertex() {
	// Called for every vertex the material is visible on.
}

void fragment() {
  METALLIC = 0.0;
  ROUGHNESS = 0.01;
  ALBEDO = color;
	// Called for every pixel the material is visible on.
}

//void light() {
	// Called for every pixel for every light affecting the material.
	// Uncomment to replace the default light processing function with this one.
//}
