#include <stdio.h>
#include "libpower.h"

float calc_power_i(float volt, float current)
{
	if (volt <= 0)
	{
		printf("volt is zero or negative");
		return -1;
	} else if (current <= 0)
	{
		printf("current is zero or negative");
		return -1;
	} else
	{
		return volt*current;
	}
}