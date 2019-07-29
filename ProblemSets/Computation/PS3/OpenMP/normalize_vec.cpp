#include <cstdlib>
#include <cmath>
#include <stdio.h>
#include <omp.h>

using namespace std;

// function to compute the 2-norm of a vector v of length n
double norm(double *v, int n){
    double norm = 0.;

    for(int i=0; i<n; i++)
        norm += v[i]*v[i];

    return sqrt(norm);
}

// initialise v to values between -10 and 10
void initialize(double *v, int n){
    for(int i=0; i<n; i++)
        v[i] = cos(double(i)) * 10.;
}


void normalize_vector(double *v, int n){
    double norm = 0.;

    // compute the norm of v
    for(int i=0; i<n; i++)
        norm += v[i]*v[i];
    norm = sqrt(norm);

    // normalize v
    for(int i=0; i<n; i++)
        v[i] /= norm;
}

void normalize_vector_omp(double *v, int n)
{
    double norm = 0.0;

    // compute the norm of v
    #pragma omp parallel for reduction(+:norm)
    for(int i=0; i<n; i++)
        norm += v[i]*v[i];
    norm = sqrt(norm);

    // normalize v
    #pragma omp parallel for
    for(int i=0; i<n; i++)
        v[i] /= norm;
}

int main( void ){
    const int N = 4e7;
    double *v = (double*)malloc(N*sizeof(double));

    initialize(v, N);
    double time_serial = -omp_get_wtime();
    normalize_vector(v, N);
    time_serial += omp_get_wtime();

    // chck the answer
    printf( "serial error : %E\n", fabs(norm(v,N) - 1) );

    int max_threads = omp_get_max_threads();
    initialize(v, N);
    double time_parallel = -omp_get_wtime();
    normalize_vector_omp(v, N);
    time_parallel += omp_get_wtime();

    // chck the answer
    printf( "parallel error : %E\n", fabs(norm(v,N) - 1) );

    printf("%d threads\n", max_threads);
    printf("serial : %1.6f seconds\nparallel : %1.6f seconds\n", time_serial, time_parallel);
    printf("speedup : %1.6f\n", time_serial/time_parallel);
    printf( "efficiency : %1.6f\n", (time_serial/time_parallel)/double(max_threads) );

    free(v);
    return 0;
}


