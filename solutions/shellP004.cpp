
#include<bits/stdc++.h>
using namespace std;
#define ll long long int
#define Minank ios_base::sync_with_stdio(false);
#define R cin.tie(NULL);
#define Bhutwala cout.tie(NULL);
#define cy cout<<"YES\n";
#define cn cout<<"NO\n";

void minank(){
    int n,k;
    cin>>n>>k;
    string s;
    cin>>s;
    if(k>(n/2)){
        cout<<"Alice\n";
        return;
    }
    int op=0;
    for(int i=0;i<n;i++){
        if(s[i]=='1'){
            op++;
        }
    }
    if(op<=k)
    cout<<"Alice\n";
    else
    cout<<"Bob\n";
}

int main(){
    Minank R Bhutwala
    int t=1;
    cin>>t;
    while(t--){
        minank();
    }
}