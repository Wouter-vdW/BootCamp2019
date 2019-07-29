#include <stdio.h>
#include <stdlib.h>
#include <math.h>
#include <mpi.h>

int main(int argc, char *argv[])
{
    // declare variables
    int i, rank, size, snd[20];
    // initialize MPI
    MPI_Init(&argc, &argv);
    MPI_Comm_rank(MPI_COMM_WORLD, &rank);
    MPI_Comm_size(MPI_COMM_WORLD, &size);
    
    // if size>20, finish program
    if (size > 20) {
        if (rank == 0) printf("nodes must be at most 20");
        MPI_Finalize();
        exit(1); 
    }
    
    // compute remainder 20%size
    int rmd=20%size; 
    
    // declare displs and recvcounts
    int displs[size];
    int recvcounts[size];
    
    // fill displs and recvcounts up to remainder
    // displs starts from 0 and move by 1+20/size each time
    int offset=0;
    for (int i=0; i<rmd; i++) {
        //displs[i] = i*(1+20/size);
        displs[i] = offset;
        recvcounts[i] = 1+20/size;
        offset += recvcounts[i];
    }
    // fill displs and recvcounts from remainder to size
    for (int j=rmd; j<size; j++) {
        //displs[j] = rmd + j*20/size;
        displs[j] = offset;
        recvcounts[j] = 20/size;
        offset += recvcounts[j];
    }
    
    int rcv[recvcounts[rank]];
    
    // if in root node print elements in snd
    if (rank==0) {
        printf("-----BEFORE SCATTER-----\n");
        printf("node 0 has elements: ");
        for (i=0; i<20; i++) {
            snd[i]=i;
            printf("%i ", snd[i]);
        }
        printf("\n\n-----AFTER SCATTER-----\n");
    }
    // set rcvcounts
    //int rcvcount = 20/size;
    // set rcv array
    //int rcv[rcvcount];
    
    /* scatter the value of 'send' of rank 0 to recv of all ranks */
    //MPI_Scatter(&snd, rcvcount, MPI_INT, &rcv, rcvcount, MPI_INT, 0, MPI_COMM_WORLD);
    MPI_Scatterv(&snd, recvcounts, displs, MPI_INT, rcv, 20, MPI_INT, 0, MPI_COMM_WORLD);
    MPI_Barrier(MPI_COMM_WORLD);

    printf("rank %i has values: ", rank);
    for (i=0; i<recvcounts[rank]; i++) {
        printf("%i ", rcv[i]);
    }
    printf("\n");
    MPI_Finalize();
    return 0;
}
