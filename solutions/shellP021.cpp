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
   
   int z; cin>>z;
   vector<int>v(z);
   int p=0,n=0;
   for(int i=0;i<z;i++){
    cin>>v[i];
    if(v[i]<0)n++;
    else p++;
   }
   int ans=0;
   if(n>p){
    
    int a=n-p;
    if(a%2){
        ans+=(a+1)/2;
        if((n-ans)%2)ans++;
    }
    else{
        ans+=a/2;
        if((n-ans)%2)ans++;

    }
   }
   else if(n<=p){
    if(n%2)ans=1;
   }
   else ans=0;
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
