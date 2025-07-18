#include <bits/stdc++.h>
using namespace std;
#define pb push_back
typedef long long ll;
#define sz size()
int main() {
  ios::sync_with_stdio(false);
  cin.tie(NULL);

  int t;
  cin >> t;

  while (t--) {
    string s;
    cin>>s;
    int open = 0;
    int cnt = 0;
    for(int i = 0 ; i < s.size() ; i++){
      if(s[i] == '(') open++;
      else {
        open--;
        if(open == 0) cnt++;
      }
    }
  //  cout<<cnt<<endl;
    if(cnt>1) cout<<"YES\n";
    else cout<<"NO\n";
    
  }

  return 0;
}
