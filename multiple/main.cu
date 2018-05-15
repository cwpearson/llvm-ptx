#include "kernel.h"

int main(void) {

    float *a;
    cudaMalloc(&a, 4);

    kernel<<<1,1>>>(a);
    cudaError_t err = cudaDeviceSynchronize();
    if (cudaSuccess != err) {
        return 1;
    }
    return 0;
}