import UIKit
import Foundation
import PlaygroundSupport
PlaygroundPage.current.needsIndefiniteExecution = true

// MARK:- Other
let n = 6;
let m = 8;

var COUNT = 0

var visited = Array(repeating: Array(repeating: 0, count: m), count: n)

var result = Array(repeating: Array(repeating: 0, count: m), count: n)


func reset_visited() {
    visited = Array(repeating: Array(repeating: 0, count: m), count: n)
}

func reset_result(key: Int, input: [[Int]]) {
    for  i in 0..<n {
        for j in 0..<m {
            if (visited[i][j] != 0 && input[i][j] == key){
                result[i][j] = visited[i][j]
            }
            else {
                result[i][j] = 0
            }
        }
    }
}

func is_valid(x: Int, y: Int, key: Int, input: [[Int]]) -> Bool {
    if (x < n && y < m && x >= 0 && y >= 0) {
        if (visited[x][y] == 0 && input[x][y] == key){
            return true
        }
        else {
            return false
        }
    }
    else {
        return false
    }
}

func BFS(x: Int, y: Int, i: Int, j: Int, input: [[Int]]) {
    // terminating case for BFS
    if x != y {
        return
    }
    
    visited[i][j] = 1;
    COUNT+=1;
  
    // x_move and y_move arrays
    // are the possible movements
    // in x or y direction
    let x_move = [0, 0, 1, -1]
    let y_move = [1, -1, 0, 0]
  
    // checks all four points connected with input[i][j]
    for u in 0..<4 {
        if is_valid(x: i + y_move[u],y: j + x_move[u],key: x, input: input){
            BFS(x: x, y: y,i: i + y_move[u],j: j + x_move[u], input: input)
        }
    }
}

func computeLargestConnectedGrid(input: [[Int]]) {
    var current_max = Int.min;

    for i in 0..<n {
        for j in 0..<m {
            reset_visited();
            COUNT = 0;

            // checking cell to the right
            if j + 1 < m {
                BFS(x: input[i][j],y: input[i][j + 1],i: i,j: j, input: input)
            }

            // updating result
            if COUNT >= current_max {
                current_max = COUNT;
                reset_result(key: input[i][j],input: input);
            }
            reset_visited();
            COUNT = 0;

            // checking cell downwards
            if i + 1 < n {
                BFS(x: input[i][j],y: input[i + 1][j],i: i,j: j, input: input);
            }
            // updating result
            if COUNT >= current_max {
                current_max = COUNT;
                reset_result(key: input[i][j],input: input);
            }
        }
    }
//    print_result(current_max);
}

//// function to print the result
//void print_result(int res)
//{
//    cout << "The largest connected "
//         << "component of the grid is :" << res << "\n";
//
//    // prints the largest component
//    for (int i = 0; i < n; i++) {
//        for (int j = 0; j < m; j++) {
//            if (result[i][j])
//                cout << result[i][j] << " ";
//            else
//                cout << ". ";
//        }
//        cout << "\n";
//    }
//}
//


let grid = [ [ 1, 4, 4, 4, 4, 3, 3, 1 ],
    [ 2, 1, 1, 4, 3, 3, 1, 1 ],
    [ 3, 2, 1, 1, 2, 3, 2, 1 ],
    [ 3, 3, 2, 1, 2, 2, 2, 2 ],
    [ 3, 1, 3, 1, 1, 4, 4, 4 ],
    [ 1, 1, 3, 1, 1, 4, 4, 4 ] ]


computeLargestConnectedGrid(input: grid)
