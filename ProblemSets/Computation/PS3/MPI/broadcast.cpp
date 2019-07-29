#include <stdio.h>
#include <mpi.h>

int main(int argc, char *argv[])
{
    int rank=0;
    double data=0.;
    MPI_Init(&argc, &argv);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    
    if (rank==0) {
        data = 1.2;
    }
    
    MPI_Bcast(&data, 1, MPI_DOUBLE, 0, MPI_COMM_WORLD);

    printf("I am rank %i and the value is %.1f\n", rank, data);
    MPI_Finalize();
    return 0;
}
