#include <cmath>
#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <mpi.h>

#define _USE_MATH_DEFINES

int main(int argc, char *argv[])
{
    const int niter = 1e8;
    double x=0., y=0.;
    int rank, size, count_root, count=0;
    double pi=0.;
    double stime = -MPI_Wtime();

    MPI_Init(&argc, &argv);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD, &size);
    
    // set number of iterations for each node
    int nump = niter/size;
    // if niter/size has a remainder
    // add 1 iteration to nodes with rank < remainder
    int rmd = niter % size;
    if (rank<rmd) nump+=1;
    
    // set seed for each node
    srand( (rank+1)*2 );
    
    for (int i=0; i<nump; ++i) {
        //get random points
        x = (double)random()/RAND_MAX;
        y = (double)random()/RAND_MAX;
        //check to see if point is in unit circle
        if (x*x + y*y<=1) ++count;
    }
    
    // reduce count to the root node
    MPI_Reduce(&count, &count_root, 1, MPI_INT, MPI_SUM, 0, MPI_COMM_WORLD);
    
    // root prints pi 
    if (rank==0) {
        stime += MPI_Wtime();
        pi = (double) 4 * count_root/niter;
        printf("Number of iterations: %i\n", niter);
        printf("Approximate pi: %f\n", pi);
        printf("Execution time: %f\n", stime);
        printf("Relative error: %E\n", fabs(M_PI-pi)/M_PI);
    }
    
    MPI_Finalize();
    return 0;
}
