                       //here i goooooooooooooooooo
#include<bits/stdc++.h>
#include<iostream>
#include<vector>
#define ll long long
#define nn '\n'
using namespace std;
struct tre{
    int data;
    struct tre* l;
    struct tre* r;
};
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
   int n,k; cin>>n>>k;
   vector<ll>v(n),v2(n);
   for(int i=0;i<n;i++)cin>>v[i];
    for(int i=0;i<n;i++)cin>>v2[i];
    ll ans=0,ma=0,f=ans;//k-=1;
    /*for(int i=1;i<n;i++){
        //cout<<ans<<nn;
        if(k>0){
            if(ma>v[i]){ans+=ma;i--;}
            else{
                ans+=v[i];
                ma=max(ma,v2[i]);
            }
            k--;
        }
        else break;
    }

    while(k>0){
        //cout<<1<<nn;
        ans+=ma;
        k--;
    }*/
    if(n<k){
    for(int i=0;i<n;i++){
        f+=v[i];
        ma=max(ma,v2[i]);
        ans=max(f+((k-i-1)*ma),ans);
        
    }}
    else{
        int j=k;
        for(int i=0;i<k;i++){
        f+=v[i];
        ma=max(ma,v2[i]);
        ans=max(f+((k-i-1)*ma),ans);
        
    }
    }
    cout<<ans<<nn;

}

   

int main(){
    
    ios_base::sync_with_stdio(0);
    cin.tie(0);
    cout.tie(0);
    int t; cin>>t;
  
    while(t--){
     junain_noob();
    //cout<<floorSqrt(6);
    }
    
           
}
//&&(k>(v[i]+1))
//ac or not ac doesn't matter,me always d e p r e s s e d :((
//01100111 01100101 01110100 00100000 01100001 00100000 01101100 01101001 01100110 01100101
