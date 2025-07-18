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
        int ara[n], ar[n];
        for(int i=0; i<n; i++)
        {
            cin>>ara[i];
            ar[i]=ara[i];
        }
        sort(ar, ar+n);
        int first=ar[n-1];
        int second=ar[n-2];
        for(int i=0; i<n; i++)
        {
            if(ara[i]==first)
            {
                cout<<ara[i]-second<<" ";
            }
            else
            {
                cout<<ara[i]-first<<" ";
            }
        }
        cout<<endl;
    }
}
