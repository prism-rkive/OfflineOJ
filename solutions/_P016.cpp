#include <bits/stdc++.h>
using namespace std;

int main(){
    ios::sync_with_stdio(false);
    cin.tie(nullptr);

    int T;
    cin >> T;
    while (T--){
        int n, m;
        cin >> n >> m;
        vector<pair<int,int>> mx_pos;  //store i,j of max number
        int mx = 0;

        for (int i = 0; i < n; i++){
            for (int j = 0, x; j < m; j++){
                cin >> x;
                if (x > mx) {
                    mx = x;
                    mx_pos.clear();
                    mx_pos.emplace_back(i, j);
                } 
                else if (x == mx) {
                    mx_pos.emplace_back(i, j);
                }
            }
        }

        if (mx_pos.size() == 1) {
            cout << (mx - 1) << "\n";
            continue;
        }

     
        int i0 = mx_pos[0].first;
        int j0 = mx_pos[0].second;

        unordered_set<int> out;
        for (auto &p : mx_pos) {
            if (p.first != i0)
                out.insert(p.second);
            if (out.size() > 1)  // =1 hole fine as there is chance to reduce by col
                break;
        }
        bool ok;
        if(out.size() <= 1) ok = true;
        else ok = false;
      

        if (!ok) {
            unordered_set<int> outi;
            for (auto &p : mx_pos) {
                if (p.second != j0)
                    outi.insert(p.first);
                if (outi.size() > 1)
                    break;
            }
            ok = (outi.size() <= 1);
        }

        cout << (ok ? mx - 1 : mx) << "\n";
    }
    return 0;
}
