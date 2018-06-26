#include <iostream>
using namespace std;


bool isValidInput(int n)

{
    if(n < 0) {

        cerr<<"Invalid Input: Must be a whole number"<<endl;
        return false;
    }


    return true;
}
int factorial(int n)
{
    if(n > 1)
    {
        return n * factorial(n-1);

    }
    return 1;
}


int main() {

    bool valid = false;
    int n = 0;
    do {
        cout << "Please enter a natural number \n" << endl;
        cin >> n;
        valid = isValidInput(n);
    }while(!valid);


    int result = factorial(n);

    cout<<"The factorial("<<n<<") is:   "<<result<<endl;



    return 0;
}