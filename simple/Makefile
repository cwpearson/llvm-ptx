all: main

main: main.cu
	clang -std=c++11 -O2 --cuda-include-ptx=sm_35 --cuda-path=/usr/local/cuda --cuda-gpu-arch=sm_35 $^ -o $@ -L/usr/local/cuda/lib64 -lcudart

clean:
	rm -f main