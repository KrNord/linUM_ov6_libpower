all: electrotest
electrotest: main.c libcomponent.so libpower.so libresistance.so
	gcc -o electrotest main.c -lm -L. -lcomponent -lpower -lresistance -Wl,-rpath,.
calc_power_i.o: calc_power_i.c libpower.h
	gcc -c -fPIC calc_power_i.c
calc_power_r.o: calc_power_r.c libpower.h
	gcc -c -fPIC calc_power_r.c -lm
calc_resistance.o: calc_resistance.c libresistance.h
	gcc -c -fPIC calc_resistance.c
libcomponent.o: libcomponent.c libcomponent.h
	gcc -c -fPIC libcomponent.c
libcomponent.so: libcomponent.o
	gcc -shared -fPIC -o libcomponent.so libcomponent.o
libpower.so: calc_power_i.o calc_power_r.o
	gcc -shared -fPIC -o libpower.so calc_power_r.o calc_power_i.o
libresistance.so: calc_resistance.o
	gcc -shared -fPIC -o libresistance.so calc_resistance.o
clean:
	rm *.o
	rm *.so
	rm electrotest
