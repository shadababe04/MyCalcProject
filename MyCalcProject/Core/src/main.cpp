#include <iostream>
#include "main.h"
#include "add.h"
#include "sub.h"
#include "mul.h"
#include "div.h"

int main() {
    int a = 10, b = 5;

    std::cout << "Addition: " << add(a, b) << std::endl;
    std::cout << "Subtraction: " << sub(a, b) << std::endl;
    std::cout << "Multiplication: " << mul(a, b) << std::endl;
    std::cout << "Division: " << s_div(a, b) << std::endl;

    return 0;
}
