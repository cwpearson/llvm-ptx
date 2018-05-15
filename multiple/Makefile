TARGETS = main

all: $(TARGETS)

%.o: %.cu
	clang -c -std=c++11 -O2 --cuda-include-ptx=sm_35 --cuda-path=/usr/local/cuda --cuda-gpu-arch=sm_35 $^ -o $@ 

%.ptx: %.cu
	clang -S -std=c++11 -O2 --cuda-device-only --cuda-path=/usr/local/cuda --cuda-gpu-arch=sm_35 $^ -o $@

main: kernel.o main.o
	clang -std=c++11 $^ -o $@ -L/usr/local/cuda/lib64 -lcudart

clean:
	rm -f main *.o *.ptx