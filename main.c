#include <stdio.h>
#include "libpower.h"

int main()
{
	float i;
	float r;
	float v;

	printf("Enter V: ");
	scanf(" %f", &v);
	printf("Enter I: ");
	scanf(" %f", &i);
	printf("Power is: %f\n", calc_power_i(v,i));

	printf("Enter V: ");
	scanf(" %f", &v);
	printf("Enter R: ");
	scanf(" %f", &r);
	printf("Power is: %f", calc_power_r(v,r));
}