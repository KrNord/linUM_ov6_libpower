all: test_libpower
test_libpower: main.c libpower.so
	gcc -o test_libpower main.c -lm -L. -lpower -Wl,-rpath,.
calc_power_i.o: calc_power_i.c libpower.h
	gcc -c -fPIC calc_power_i.c
calc_power_r.o: calc_power_r.c libpower.h
	gcc -c -fPIC calc_power_r.c -lm
libpower.so: calc_power_i.o calc_power_r.o
	gcc -shared -fPIC -o libpower.so calc_power_r.o calc_power_i.o
clean:
	rm *.o
	rm *.so
	rm test_libpower

