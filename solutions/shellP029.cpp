#include<bits/stdc++.h>
using namespace std;
int main()
{
    int t; cin>>t;
    while(t--)
    {
        int x,y,a;
        cin>>x>>y>>a;
        int m,l=x+y;
        m=a%l;
        if(m<x)
            cout<<"NO"<<endl;
        else
            cout<<"YES"<<endl;
    }
}
