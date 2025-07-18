                       //here i goooooooooooooooooo
#include<bits/stdc++.h>
#define ll long long
#define nn '\n'
using namespace std;
bool myComparison(const pair<int,int> &a,const pair<int,int> &b)
{
       return a.second<b.second;
       //sort(v.begin(),v.end(),myComparison);
        //cout << setprecision(10) << fixed << ans  << endl;
}
ll fact(ll x){
    if(x==0)return 1;
    return x*fact(x-1);
}
void junain_noob(){
   int n; cin>>n;
   int ans=n/2;
   //int x=(1<<(ans));
   //cout<<x<<nn;
   if((n&n-1)==0)
    cout<<"1"<<nn;
    else{
        cout<<__builtin_popcount(n)<<nn;
    }

}
    

int main(){
    ios_base::sync_with_stdio(0);
    cin.tie(0);
    cout.tie(0);
    //freopen("max-pair.in","r",stdin);
    int t;
    //cin>>t;
    //cin.ignore();
    //while(t--){
        junain_noob();    
    //}
           
}
//ac or not ac doesn't matter,me always d e p r e s s e d :((
//01100111 01100101 01110100 00100000 01100001 00100000 01101100 01101001 01100110 01100101
