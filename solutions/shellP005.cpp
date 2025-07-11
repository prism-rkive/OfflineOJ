 #include <bits/stdc++.h>
using namespace std;

int main() {
    int t;
    cin >> t;
    for (int iii = 0; iii < t; iii++) {
        int n;
        cin >> n;
        vector<int> a(n);
        vector<pair<bool, bool>> res(n);
        for (int i = 0; i < n; i++) {
            cin >> a[i];
        }
        int mx = a[n - 1];
        int mn = a[0];
        for (int i = n - 2; i > 0; i--) {
            if (a[i] > mx) {
                mx = a[i];
                res[i].first = true;
            }
        }
        for (int i = 1; i < n - 1; i++) {
            if (a[i] < mn) {
                mn = a[i];
                res[i].second = true;
            }
        }
        cout << 1;
        for (int i = 1; i < n - 1; i++) {
            if (res[i].first || res[i].second) {
                cout << 1;
            } else {
                cout << 0;
            }
        }
        cout << 1 << endl;
    }
    return 0;
}
