#include <iostream>
using namespace std;


bool isValidInt(int n)
{
	if(n < 0) {
        cout << "Error: please enter a value in the proper range\n" << endl;

        return false;
    }

	if(n > 10) {
        cout << "Error: please enter a value in the proper range\n" << endl;
        return false;
    }

	return true;
}



int func(int n)
{
	int returnVal1;
    if(n > 1){

        returnVal1 = 7 * func(n-2) - 8 * n;
        return returnVal1;
    }
	return 5;
}

int main() {
    int n = -1, result = 0;
    bool valid = false;

    do {
        cout << "Please an integer in the range [0,10]\n" << endl;
        cin >> n;
        valid = isValidInt(n);
    } while (!valid);


    result = func(n);
	cout<<"The result of func(n) is:"<<result<<endl;

    return 0;
}



