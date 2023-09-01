#ifndef ATMOSPHERE_COMMON_INCLUDED
#define ATMOSPHERE_COMMON_INCLUDED

#include "planet_common.gdshaderinc"

#ifndef ATMOSPHERE_RAYMARCH_STEPS
#define ATMOSPHERE_RAYMARCH_STEPS 16
#endif

uniform float u_density = 0.2;
uniform highp float u_sea_level_density = 1.35; // kg/m^3
uniform highp float u_scale_height = 7.25; // km

float get_atmosphere_density(float height) {
	highp float sd = height - u_planet_radius;
	return u_sea_level_density*exp(-sd/u_scale_height);
	
	// highp float h = clamp(sd / u_atmosphere_height, 0.0, 1.0);
	// highp float y = 1.0 - h;
	// highp float density = y * y * y * u_density;
	
	// Attenuates atmosphere in a radius around the camera
//	float distance_from_ray_origin = 0.0;
//	density *= min(1.0, (1.0 / u_attenuation_distance) * distance_from_ray_origin);
	
	// return density;
}

#endif // ATMOSPHERE_COMMON_INCLUDED

