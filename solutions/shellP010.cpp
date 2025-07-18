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
        int c=0;
        for(int i=n-1; i>0; i--)
        {
            if(ara[i]>ara[0])
                c++;
            else
                break;
        }
        cout<<c<<endl;
    }
}
