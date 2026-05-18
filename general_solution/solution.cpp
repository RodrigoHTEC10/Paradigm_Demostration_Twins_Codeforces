/*
Twins - Problem - Codeforces
Author: Rodrigo Alejandro Hurtadp Cortes - A01713854
Date: May 18th, 2026.
*/

#include <string>
#include <sstream>
#include <iostream>
#include <algorithm>
#include <queue>

using namespace std;

/*
/////////////////////////////////////////////////////////////////
Main Function
/////////////////////////////////////////////////////////////////
int main()

Function responsible for accepting the inputs of the program and
based on the established conditions returning the proper output.
*/

int main() {
    int  num, total = 0, enough = 0, answer = 0;
    bool approvedNum = false;
    bool approvedEle = true;

    //Input of first and second array size (n,m)
    std::cin >> num;

    //Checking for condition (1 ≤ x ≤ 100)
    if(num >= 1 && num <= 100)
        approvedNum = true;

    //Creation of a heap
    priority_queue<int> queue;

    
    //Collection of the first array elements (n integers)
    cin.ignore();

    string word, number;
    getline(cin, word);
    stringstream X(word);
    while (std::getline(X, number,' ')) {
		//Checking for condition (1 ≤ a_i ≤ 100)
        if(!(stoi(number) >= 1 && stoi(number) <= 100)){
            approvedEle = false;
        }
        //Addition as the heap.
        queue.push(stoi(number));
        //Sum of the totals
        total += stoi(number);
    }

    // cout << total << endl;

    //Asignation of answer
    while(enough <= total/2.0){
        enough += queue.top();
        // cout << enough << endl;

        answer += 1;
        // cout << answer << endl;

        queue.pop();
    }

    /*Only if all the conditions are met, the process of obtaining the
    result array is started.*/
    if(approvedEle && approvedNum){
        cout<<to_string(answer)<<endl;
    }
    else{
        cout<<"0"<<endl;
    }
    return 0;
}