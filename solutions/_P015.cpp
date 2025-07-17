#include<bits/stdc++.h>
using namespace std;
int main()
{
    int t;
    cin>>t;
    while(t--)
    {
        int n;
        cin>>n;
        int ara[n];
        for(int i=0; i<n; i++)
            cin>>ara[i];
        sort(ara, ara+n);
        reverse(ara, ara+n);
        for(int i=0; i<n; i++)
            cout<<ara[i]<<" ";
        cout<<endl;
    }
}
