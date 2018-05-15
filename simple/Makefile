all: main main.ptx

main: main.cu
	clang -std=c++11 -O2 --cuda-include-ptx=sm_35 --cuda-path=/usr/local/cuda --cuda-gpu-arch=sm_35 $^ -o $@ -L/usr/local/cuda/lib64 -lcudart

%.ptx: %.cu
	clang -S -std=c++11 -O2 --cuda-device-only --cuda-path=/usr/local/cuda --cuda-gpu-arch=sm_35 $^ -o $@

clean:
	rm -f main main.ptx