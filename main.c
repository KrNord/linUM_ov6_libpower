#include <stdlib.h>
#include <stdio.h>
#include "libresistance.h"
#include "libpower.h"
#include "libcomponent.h"

int main ()
{
	char conn;
	int count, i;
	float effect;
	float resistance;
	float result;

	float volt;

	printf("Ange spänningskälla i V: ");
	scanf(" %f", &volt);

	printf("Ange koppling [S | P]: ");		
 	scanf(" %c", &conn);
									
	printf("Antal komponenter: ");
	scanf( "%d", &count);

	float array[count];
	resistance = calc_resistance(count, conn, array);

	printf("Ersättningsresistans:\n%.1f ohm\n", resistance);

	effect = calc_power_r(volt, resistance);
	printf("Effekt:\n%.2f W\n", effect);

	float res_array[3];
	int nr_in_res_array = e_resistance(resistance, res_array);

	printf("Ersättningsresistanser i E12-serien kopplade i serie: \n");
  	for (i = 0 ; i < nr_in_res_array; i++){
    	printf("%.0f ", res_array[i]);
    	printf("\n");
  	}
}
