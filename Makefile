all: main.c libcomponent.so libpower.so libresistance.so
	gcc -o electrotest main.c -lm -L./lib -lcomponent -lpower -lresistance -Wl,-rpath,./lib
lib: libpower.so
libcomponent.so: libcomponent.c
	mkdir -p lib
	gcc -c -fPIC libcomponent.c
	gcc -shared -fPIC -o ./lib/libcomponent.so libcomponent.o
libpower.so: calc_power_i.c calc_power_r.c
	mkdir -p lib
	gcc -c -fPIC calc_power_i.c
	gcc -c -fPIC calc_power_r.c -lm
	gcc -shared -fPIC -o ./lib/libpower.so calc_power_r.o calc_power_i.o
libresistance.so: calc_resistance.c
	mkdir -p lib
	gcc -c -fPIC calc_resistance.c
	gcc -shared -fPIC -o ./lib/libresistance.so calc_resistance.o
install: main.c libcomponent.so libpower.so libresistance.so
	cp -f lib/libcomponent.so lib/libpower.so lib/libresistance.so /usr/lib
	gcc -o /usr/bin/electrotest main.c -lm -L/usr/lib -lcomponent -lpower -lresistance -Wl,-rpath,/urs/lib
uninstall: 
	rm -f /usr/bin/electrotest
	rm -f /usr/lib/libcomponent.so /usr/lib/libpower.so /usr/lib/libresistance.so
clean:
	rm -f *.o
	rm -rf lib
	rm electrotest
