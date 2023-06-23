crc32c: crc32c.h
	gcc -D TEST load.c crc32c.c -o crc32c

crc32c.h: generate_crc32c_h
	./generate_crc32c_h >crc32c.h

generate_crc32c_h:
	gcc generate_crc32c_h.c -o generate_crc32c_h

install: crc32c
	mkdir -p /usr/local/bin
	cp crc32c /usr/local/bin/crc32c
	chmod 0755 /usr/local/bin/crc32c

clean:
	rm -f crc32c crc32c.h generate_crc32c_h
