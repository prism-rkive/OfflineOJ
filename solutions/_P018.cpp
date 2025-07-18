#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;
 
int main(){
    ios::sync_with_stdio(false);
    cin.tie(nullptr);
    
    int t;
    cin >> t;
    
    while(t--){
        int n;
        cin >> n;
        
        vector<vector<int>> grid(n, vector<int>(n));
        for(int i = 0; i < n; i++){
            for(int j = 0; j < n; j++){
                cin >> grid[i][j];
            }
        }
       
        int total = 2 * n;
        vector<int> p(total + 1, 0); 
        

        for (int s = 2; s <= n + 1; s++){
            p[s] = grid[0][s - 2]; 
        }
        
        for (int s = n + 2; s <= total; s++){
            int i = s - n; // 1-indexed 
            p[s] = grid[i - 1][n - 1];  
        }
        
   
        vector<bool> used(total + 1, false);
        for (int s = 2; s <= total; s++){
            used[p[s]] = true;
        }
        
        int missing = 0;
        for (int num = 1; num <= total; num++){
            if (!used[num]){
                missing = num;
                break;
            }
        }
        p[1] = missing;
        
     
        for (int i = 1; i <= total; i++){
            cout << p[i] << " ";
        }
        cout << "\n";
    }
    
    return 0;
}
