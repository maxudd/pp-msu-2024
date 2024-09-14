/*
Написать функцию, которая получает три параметра a, b и c (любой коэффициент может быть нулевым) и решает квадратное уравнение 
ax2+bx=c. Возвращаемое значение функции должно содержать как сами корни, так и информацию об их количестве.
Программа должна обрабатывать все возможные варианты ответов (в частности, любые из коэффициентов могут быть нулевыми) 
*/

#include "stdio.h"
#include <string.h>
#include <math.h>

typedef enum {NOT_QUADR, ONE_ROOT, TWO_ROOTS, COMPLEX} answer_code;

struct Answer {
    answer_code code;
    int roots_amount;
    double root1;
    double root2;
    double real_part;
    double im_part;
};

struct Answer solve_quadratic_equation(double a, double b, double c){
    struct Answer ans;
    if (a == 0) 
        ans.code = NOT_QUADR;
    else{
        double disc = b*b - 4*a*c;
        if (disc < 0){
            ans.code = COMPLEX;
            ans.real_part = b == 0 ? 0 : -b / (2*a);
            ans.im_part = sqrt(-disc) / (2*a);
        }
        else if (disc == 0){
            ans.code = ONE_ROOT;
            ans.root1 = b == 0 ? 0 : -b / (2*a);
        }
        else{
            ans.code = TWO_ROOTS;
            ans.root1 = (-b + sqrt(disc)) / (2*a);
            ans.root2 = (-b - sqrt(disc)) / (2*a);
        }
        return ans;
    }
}

int main(){
    double a, b, c;

    scanf("%lf %lf %lf", &a, &b, &c);
    
    struct Answer ans = solve_quadratic_equation(a, b, c);

    switch (ans.code){
        case NOT_QUADR: 
            printf("Not quadratic equation.\n");
            break;
        case ONE_ROOT:
            printf("Amount of roots: 1\nRoot: %.2f\n", ans.root1);
            break;
        case TWO_ROOTS:
            printf("Amount of roots: 2\nRoots: %.2f, %.2f\n", ans.root1, ans.root2);
            break;
        case COMPLEX:
            printf("Amount of roots: 2\nRoots: %.2f+%.2fi, %.2f-%.2fi\n", ans.real_part, ans.im_part, ans.real_part, ans.im_part);
            break;
    }
    return 0;
}