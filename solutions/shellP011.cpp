#include<bits/stdc++.h>
using namespace std;

int main()
{
    int t;
    cin >> t;
    string s;
    cin >> s;
    string a = "";

    for(int i = 0; i < t; i++) {
        if (t % 2 == 0) {
            if (i % 2 == 0)
                a = s[i] + a;
            else
                a = a + s[i];
        } else {
            if (i % 2 == 0)
                a = a + s[i];
            else
                a = s[i] + a;
        }
    }

    cout << a << endl;
    return 0;
}
