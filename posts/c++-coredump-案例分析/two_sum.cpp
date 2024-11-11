#include <iostream>
#include <unordered_map>
#include <unordered_set>
#include <vector>
#include <algorithm>

bool two_sum(std::vector<int> arr, int target) {
    std::unordered_set<int> arr_set(arr.begin(), arr.end());
    return std::any_of(arr.begin(), arr.end(), [&arr_set, &target](int ele) { 
        return arr_set.count(target - ele); 
    });
}

int main() {
    std::vector<int> arr{1,2,3,4,5,6,7,8,9,100,101,102,103};
    std::cout << two_sum(arr, 105);
}
