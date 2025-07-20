// Write your solution here. Use stdin for input and stdout for output.
#include <iostream>
using namespace std;

int main() {
    int n;
    cin>>n;
    int max_num=-1e9;
    for(int i=0;i<n;i++)
    {
       int x;
       cin>>x;
       if(x>max_num) max_num=x;
    }

    cout<<max_num<<endl;
    return 0;
}
