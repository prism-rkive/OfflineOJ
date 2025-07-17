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
        int mindif=INT_MAX;
        for(int i=1; i<n; i++)
        {
            int dif=ara[i]-ara[i-1];
            if(dif<mindif)
                mindif=dif;
        }
        cout<<mindif<<endl;
    }
}
