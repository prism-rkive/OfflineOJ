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
ll findMaxGCD(vector<ll>arr, int n)
{
    // Computing highest element
    ll high = 0;
    for (int i = 0; i < n; i++)
        high = max(high, arr[i]);
 
    // Array to store the count of divisors
    // i.e. Potential GCDs
    int divisors[high + 1] = { 0 };
 
    // Iterating over every element
    for (int i = 0; i < n; i++)
    {
        // Calculating all the divisors
        for (int j = 1; j <= sqrt(arr[i]); j++)
        {
            // Divisor found
            if (arr[i] % j == 0)
            {
                // Incrementing count for divisor
                divisors[j]++;
 
                // Element/divisor is also a divisor
                // Checking if both divisors are
                // not same
                if (j != arr[i] / j)
                    divisors[arr[i] / j]++;
            }
        }
    }
 
    // Checking the highest potential GCD
    for (int i = high; i >= 1; i--)
     
        // If this divisor can divide at least 2
        // numbers, it is a GCD of at least 1 pair
        if (divisors[i] > 1)
            return i;    
}
int bs(int arr[],int hi,int lo,int key){
    int mid=(hi+lo)/2;
    if(hi<lo){
        return -1;
    }
    if(arr[mid]==key)return mid;
    else if(arr[mid]<key) bs(arr,hi,mid+1,10);
    else bs(arr,mid-1,lo,10);
}
bool rev(string &s,int i,int j){
    if(i>j)return true;
    if(s[i]!=s[j])return false;
    return rev(s,i+1,j-1);


}
void junain_noob(){
   
   int n,k;
    cin>>n>>k;
    if(n%2==0){
        if(k%n==0)cout<<n<<nn;
        else
        cout<<k%n<<nn;
    }
    else{
        ll bhag=n/2;

        ll an=((k%n)+(k/(bhag)))%n;
        if(k%bhag==0)
            an=((k%n)+((k-1)/(bhag)))%n;
        if(an==0)an=n;
        cout<<an<<nn;
    }
    
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
