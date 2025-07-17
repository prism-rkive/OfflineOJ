#include<bits/stdc++.h>
using namespace std;
int main()
{
    int t;
    cin>>t;
    while(t--)
    {
        string s;
        cin>>s;
        string hour=s.substr(0, 2);
        string minute=s.substr(3, 2);
        int num1=stoi(hour);
        int num2=stoi(minute);
        if(num1==0)
        {
            num1=12;
            cout<<num1<<":"<<minute<<" AM"<<endl;
        }
        else if(num1<12)
        {
            if(num1<10)
                cout<<"0"<<num1<<":"<<minute<<" AM"<<endl;
            else
                cout<<num1<<":"<<minute<<" AM"<<endl;
        }
        else if(num1==12)
            cout<<num1<<":"<<minute<<" PM"<<endl;
        else
        {
            num1-=12;
            if(num1<10)
                cout<<"0"<<num1<<":"<<minute<<" PM"<<endl;
            else
                cout<<num1<<":"<<minute<<" PM"<<endl;
        }
    }
}
