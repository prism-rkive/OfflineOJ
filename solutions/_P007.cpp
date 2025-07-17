#include<bits/stdc++.h>
using namespace std;
int main()
{
    int t;
    cin>>t;
    while(t--)
    {
        int n, c=1;
        cin>>n;
        int ara[n];
        for(int i=0; i<n; i++)
            cin>>ara[i];
        int result=ara[0];
        sort(ara, ara+n);
        bool ans=false;
        for(int i=1; i<n; i++)
        {
            if(ara[i]==ara[i-1])
            {
                c++;
                if(c>=3)
                {
                    result=ara[i];
                    ans=true;
                    break;
                }
            }
            else
            {
                c=1;
                result=ara[i];
            }
        }
        if(ans)
            cout<<result<<endl;
        else
            cout<<"-1"<<endl;
    }
}
