#include <bits/stdc++.h>
#include <cmath>
#define ll long long
#define fastread() ios_base::sync_with_stdio(false); cin.tie(0); cout.tie(0)
#define pb push_back
#define sz size()

using namespace std;



const ll MOD =  998244353;

//CUSTOM SORT <

bool comp(int x,int y)
{

    if(x%2==0 && y%2==0)return x<y;
    if(x%2==1 && y%2==1) return x>y;
    return (x%2)<(y%2);
}

ll fact(ll n)
{
    ll res = 1;

    for (ll i = 2; i <= n; i++)
    {
        res = (res * i) % MOD;
    }

    return res;
}
ll bigmod(ll x, ll n)
{
    if (n == 0) return 1;

    if (n % 2 == 0)
    {
        ll res = bigmod(x, n / 2);
        return (res * res) % MOD;
    }
    else
    {
        return (x * bigmod(x, n - 1)) % MOD;
    }
}

ll invmod( ll x )
{
    return bigmod(x, MOD - 2);
}

ll ncr (ll n, ll r)
{
    // n! / (n-r)! . r! =  n! . inv(n-r)!.inv(r)!
    ll fact_n = fact(n) ;
    ll fact_r = fact(r);
    ll fact_nr = fact(n-r);
    ll res = ( fact_n % MOD * invmod(fact_r) % MOD * invmod(fact_nr) % MOD ) % MOD;
    return res;

}
int main()
{
    int t;
    cin>>t;
    while(t--)
    {
        int n;
        cin>>n;
        vector<int> v(n);
        for(int i = 0; i < n; i++) cin>>v[i];
        auto iter = min_element(v.begin(), v.end());
        int mini = *iter;
        int idx = distance(v.begin(),iter);
        int minfreq = 0;

        for(int i = 0 ; i < n ; i++)
        {
            if(v[i]==mini) minfreq++;
        }
        if(minfreq==0) cout<<idx<<endl;
        else
        {
            map<int,int> mp;

            int num = -1,ans = 0;
            for(int i = 0; i < n ; i++) mp[v[i]]++;
            //element -- freq
            for (auto it = mp.begin(); it != mp.end(); ++it)
            {
                if (it->second == 1 )
                {

                    num = it->first;
                    break;
                }
            }
            if(num==-1) cout<<"-1\n";
            else
            {
                for(int i = 0; i < n ; i++)
                {
                    if(v[i]==num)
                    {
                        ans = i;
                        break;
                    }
                }
                cout<<ans+1<<endl;
            }
        }

    }
    return 0;
}
