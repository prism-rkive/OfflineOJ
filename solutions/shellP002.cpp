
// Save as oddeven.cpp in your project folder
#include <iostream>
using namespace std;
int main() {
    int n, sum = 0, x;
    cin >> n;
    while (n--) {
        cin >> x;
        sum += x;
    }
    cout << (sum % 2 == 0 ? "EVEN" : "ODD") << endl;
    return 0;
}
