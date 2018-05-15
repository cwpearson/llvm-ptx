__global__ void kernel(int *a) {
    int i = gridDim.x;
    a[i] = i;
}

int main(void) {

    int *a;
    cudaMalloc(&a, 4);

    kernel<<<1,1>>>(a);
    cudaError_t err = cudaDeviceSynchronize();
    if (cudaSuccess != err) {
        return 1;
    }
    return 0;
}