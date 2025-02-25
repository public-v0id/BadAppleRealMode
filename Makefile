.PHONY: all

all: clean BadApple.img run


run: 
	qemu-system-i386 -fda BadApple.img

run1:
	qemu-system-x86_64 -blockdev driver=file,node-name=f0,filename=BadApple.img -device floppy,drive=f0

BadApple.bin:
	nasm -fbin src/badApple.asm -o BadApple.bin

BadApple.img: BadApple.bin
	dd if=/dev/zero of=BadApple.img bs=512 count=2880
	dd if=BadApple.bin of=BadApple.img conv=notrunc
	dd if=/dev/zero of=rofl.iso bs=512 count=2880
	dd if=BadApple.bin of=rofl.iso conv=notrunc

clean:
	rm -f *.bin
	rm -f *.img
