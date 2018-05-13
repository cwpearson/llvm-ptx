all: kernel.ptx

%.ptx: %.cu
	clang -O2 --cuda-device-only --cuda-path=/usr/local/cuda --cuda-gpu-arch=sm_35 $^ -o $@

clean:
	rm -f kernel.ptx