#include <bits/stdc++.h>
using namespace std;

int main() {
    int t;
    cin >> t;
    cin.ignore();

    while (t--) {
        string a;
        getline(cin, a);
        cout<<a[0];
        for(int i=0;i<a.length();i++)
        {
            if(a[i]==' ')
                cout<<a[i+1];
        }
        cout<<endl;
    }

    return 0;
}
