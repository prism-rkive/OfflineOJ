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
    ll an=1;
    for(int i=1;i<=x;i++)an*=i;
    return an;
}
void junain_noob(){
   string s1,s2; cin>>s1>>s2;
   int qc=0,pc=0,mc=0,ans=0,an=0;
   for(int i=0;i<s1.size();i++){
    if(s1[i]=='+'){ans+=1;pc++;}
    else {ans-=1;mc++;}
   }
   for(int i=0;i<s2.size();i++){
    if(s2[i]=='+'){an+=1;pc--;}
    else if(s2[i]=='-') {an-=1;mc--;}
    else qc++;
   }
   if(qc==0&&an==ans) cout << setprecision(10) << fixed << 1.00  << endl;

   else if(an-qc<=ans&&ans<=an+qc){
    //if(pc!=0||qc!=0){
    ll pcc=pow(2,qc);
    ll xe=fact(abs(pc))*fact(abs(mc));
    
    ll x1=fact(qc)/xe;
    //cout<<x1<<nn;
    double ans=double(x1)/double(pcc);
    cout << setprecision(10) << fixed << ans  << endl;}
    //else{
    //}
   ///}
   else  cout << setprecision(10) << fixed << 0.0  << endl;
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
