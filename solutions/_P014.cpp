#include<iostream>
using namespace std;
int main()
{
    long long n, m, a;
    cin>>n>>m>>a;
    long long x, y;
    x=(n+a-1)/a;
    y=(m+a-1)/a;
    long long result=x*y;
    cout<<result;
}
