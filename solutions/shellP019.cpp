#include <bits/stdc++.h>
#include <cmath>
#define ll long long
#define fastread() ios_base::sync_with_stdio(false); cin.tie(0); cout.tie(0)
#define pb push_back
#define sz size()

using namespace std;



const ll MOD =  1000000007;

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
    //pow(x,n)!!
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
vector<pair<ll,int>> factorize(ll n)
{
    vector<pair<ll,int>> ans;
    for(ll i = 2 ; i*i <= n; i++)
    {
        if(n%i==0)
        {
            int pow = 0;
            while(n%i==0)
            {
                n/=i;
                pow++;
            }
            ans.pb(make_pair(i,pow));
        }
    }
    if(n>1) ans.pb(make_pair(n,1));

    return ans;

}
ll lcm(vector<ll> v)
{
    ll x = v[0];
    for(int i = 1; i < v.sz ; i++)
    {
        x = x*v[i] / __gcd(x,v[i]);
    }
    return x;

}
ll applyInclusionExclusion(ll n, vector<ll> &v)
{
// k = num of properties
// to be applied within 1 to n range
// QUE example - How many numbers from 1 to n are div by k1,k2,k3..
    ll k = v.size();
    ll ans = 0;

    for(int mask = 1; mask < (1 << k); mask++)
    {
        vector<ll> elements;
        for(int i = 0; i < k; i++)
        {
            if((mask & (1 << i)) > 0) elements.push_back(v[i]);
        }

        ll x = lcm(elements);
        if(elements.size() % 2 == 1) ans += n / x;
        else ans -= n / x;
    }

    return ans;
}
bool isCorrectBracketSequence(const string& sequence)
{
    stack<char> bracketStack;

    for (char ch : sequence)
    {
        if (ch == '(')
        {

            bracketStack.push(ch);
        }
        else if (ch == ')')
        {

            if (bracketStack.empty())
            {
                return false;
            }
            bracketStack.pop();
        }
    }


    return bracketStack.empty();
}

ll digisum( ll  n)
{

    ll sum = 0;
    while(n>0)
    {
        sum+=n%10;
        n/=10;
    }
    return sum;
}
void pre(vector<long long>&  v, int maxN)
{
    v[0] = 0;
    for (int i = 1; i <= maxN; ++i)
    {
        v[i] = v[i - 1] + digisum(i);
    }
}

int main()
{
    fastread();
    int t;
    cin>>t;

    while(t--)
    {
        int n;
        cin>>n;
        char a[n][4];
        vector<int> v;
        for(int i = 0; i<n; i++)
        {
            for(int j = 0; j<4; j++)
            {
                cin>>a[i][j];
            }
        }
        for(int i = 0; i<n; i++)
        {
            for(int j = 0; j<4; j++)
            {
                if(a[i][j]=='#') v.pb(j);
            }
        }
        for(int i = v.sz-1; i>=0; i--) cout<<v[i]+1<<" ";
        cout<<endl;
    }

    return 0;
}
