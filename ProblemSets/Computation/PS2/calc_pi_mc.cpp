#include <cstdlib>
#include <iostream>
#include <math.h>

using namespace std;

double compute_pi(int Num)
{
    int count = 0;
    for (int i=0; i<Num; ++i)
    {
        double x = (double) rand() / RAND_MAX;
        double y = (double) rand() / RAND_MAX;
        if (x * x + y * y < 1)
        {
            count += 1;
        }   
    }
    
    double pi = 4.0 * count / Num;
    cout << "Number of MC draws: " << Num << endl;
    cout << "Pi is approximately: " << pi << endl;                                             
    return pi;

}

int main ()
{
    compute_pi(100);
    compute_pi(1000);
    compute_pi(10000);
    compute_pi(100000);   
}
