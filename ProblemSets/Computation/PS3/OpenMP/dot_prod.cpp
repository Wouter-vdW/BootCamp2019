#include <iostream>
#include <stdio.h>
#include <vector>
#include <omp.h>

using namespace std;


void dot_prod(int N, int num_threads){
    vector<double> a(N);
    vector<double> b(N);

    printf("dot of two %d-dimensional vectors computed with %d threads\n", N, num_threads);

    // initialize the vectors
    for(int i=0; i<N; i++) {
        a[i] = 1./2.;
        b[i] = double(i+1);
    }

    double dot=0.;
    double time = -omp_get_wtime();
    omp_set_num_threads(num_threads);
    #pragma omp parallel for reduction(+:dot)
    for(int i=0; i<N; i++) {
        dot += a[i] * b[i];
    }
    time += omp_get_wtime();

    // use formula for sum of arithmetic sequence: sum(1:n) = (n+1)*n/2
    double expected = double(N+1)*double(N)/4.;
    printf("the resulting dot product of %.0f", dot);
    if (dot == expected) {
        printf(" matches the expected value\n");
    } else {
        printf(" does not matches the expected value\n");
    }
    printf("computation took %1.6f seconds\n", time);
    printf("--------------------------------\n");
    printf("\n");
}

int main(){
    
    const int N0 = 1e5, N1 = 1e6, N2 = 1e7, N3 = 1e8;
    int num_threads = omp_get_max_threads();

    for (int i=2; i<num_threads+1; i++){
        dot_prod(N3, i);
        i++;
    }
    
    printf("Amdahl's law: if code is not entirely parallelized,\n");
    printf("marginal speedup decreases as number of processors increases.\n");
    printf("--------------------------------\n");
    printf("--------------------------------\n");
    printf("--------------------------------\n");
    printf("--------------------------------\n");
    printf("\n");

    dot_prod(N0, num_threads);
    dot_prod(N1, num_threads);
    dot_prod(N2, num_threads);
    dot_prod(N3, num_threads);

    printf("speedup increases linearly with the dimensionality of the problem.");
    return 0;
}
