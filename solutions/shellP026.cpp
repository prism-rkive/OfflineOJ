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
//int arr[10e5+10];
void junain_noob(){
  // ll arr[1000000000];
    int n; cin>>n;
    vector<double>v(n);
    map<double,ll>mp;
    double x=0;
    for(int i=0;i<n;i++){cin>>v[i];x+=v[i];mp[v[i]]++;}
    double an=x/n;
    an*=2;
    ll ans=0;
    //cout<<an<<nn;;
    //sort(v.begin(),v.end());
    for(auto x:mp){
        if(mp[an/2]>=2){
            ans+=(mp[an/2]*(mp[an/2]-1))/2;
            //cout<<1<<nn;
            mp[an/2]=0;
        }
        else if(mp[an/2]==1)mp[an/2]=0;
        else if(mp[an-x.first]>=1){
            ll k=x.second;
            ll l=mp[an-x.first];
            ans+=(l*k);
            mp[x.first]=0;
        }
    }
    cout<<ans<<nn;
     

}
    

int main(){
    ios_base::sync_with_stdio(0);
    cin.tie(0);
    cout.tie(0);
    //freopen("max-pair.in","r",stdin);
    int t;
    cin>>t;
    //cin.ignore();
    while(t--){
        junain_noob();    
    }
           
}
//ac or not ac doesn't matter,me always d e p r e s s e d :((
//01100111 01100101 01110100 00100000 01100001 00100000 01101100 01101001 01100110 01100101
