__global__ void kernel(float *a) {
    int i = gridDim.x;
    a[i] = i;
}