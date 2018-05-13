__global__ void kernel(int *a) {
    int i = gridDim.x;
    a[i] = i;
}