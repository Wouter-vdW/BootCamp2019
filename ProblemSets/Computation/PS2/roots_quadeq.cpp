#include <iostream>
#include <cmath>
using namespace std; 

int main() {

    double a;
    double b;
    double c;
    cout << "Please enter a value for the quadratic coefficient a: " << endl;
    cin >> a;
    cout << "Pleaes enter a value for the coefficient b: " << endl;
    cin >> b;
    cout << "Pleaes enter a value for the constant c: " << endl;
    cin >> c;

    double discriminant;
    discriminant = pow(b,2) - 4 * a * c;

    if (discriminant > 0) { 
       
        double root1;
        root1 = (-b + sqrt(pow(b,2) - 4 * a *c)) / (2*a);
        double root2;
        root2 = (-b - sqrt(pow(b,2) - 4 * a *c)) / (2*a);

        cout << "Root 1 is : " << root1 << endl;
        cout << "Roo2 2 is : " << root2 << endl;

    }
	else if (discriminant < 0) {

        double realPart = -b/(2*a);
        double imagPart = sqrt(-discriminant)/(2*a);
        cout << "Root 1 is: " << realPart << " + " << imagPart << "i" << endl;
        cout << "Root 2 is: " << realPart << " - " << imagPart << "i" << endl;

    }
    else {

        double root;
        root = (-b + sqrt(pow(b,2) - 4 * a *c)) / (2*a);
        cout << "The sole root is : " << root << endl;
    }
    
    return 0;
}
