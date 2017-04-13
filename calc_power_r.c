#include <stdio.h>
#include <math.h>
#include "libpower.h"

float calc_power_r(float volt, float resistance)
{
	if (volt <= 0)
	{
		printf("volt is zero or negative");
		return -1;
	} else if (resistance <= 0)
	{
		printf("resistance is zero or negative");
		return -1;
	} else
	{
		return pow(volt,2)/resistance;
	}
}