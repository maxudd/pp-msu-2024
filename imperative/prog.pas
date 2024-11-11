(*
Написать функцию, которая получает три параметра a, b и c (любой коэффициент может быть нулевым) и решает квадратное уравнение 
ax2+bx=c. Возвращаемое значение функции должно содержать как сами корни, так и информацию об их количестве.
Программа должна обрабатывать все возможные варианты ответов (в частности, любые из коэффициентов могут быть нулевыми) 
*)

program QuadraticSolver;

uses Math;

type
    Answer = record
        code: Integer;
        roots_amount: Integer;
        root1: Real;
        root2: Real;
        real_part: Real;
        im_part: Real;
    end;

function solve_quadratic_equation(a, b, c: Real): Answer;
var
    ans: Answer;
    disc: Real;
begin
    if a = 0 then
        ans.code := -1
    else
    begin
        disc := b * b - 4 * a * c;
        if disc < 0 then
        begin
            if b = 0 then
                ans.real_part := 0
            else
                ans.real_part := -b / (2 * a);
            ans.im_part := Sqrt(-disc) / (2 * a);
            ans.code := 0;
        end;
        if disc = 0 then
        begin
            if b = 0 then 
                ans.root1 := 0
            else 
                ans.root1 := -b / (2 * a);
            ans.code := 1;
        end
        else if disc > 0 then
        begin
            ans.root1 := (-b + Sqrt(disc)) / (2 * a);
            ans.root2 := (-b - Sqrt(disc)) / (2 * a);
            ans.code := 2;
        end;
    end;
    solve_quadratic_equation := ans;
end;

var
    a, b, c: Real;
    ans: Answer;
begin
    ReadLn(a, b, c);

    ans := solve_quadratic_equation(a, b, c);

    case ans.code of
        -1: WriteLn('Not quadratic equation.');
        0: 
        begin
            WriteLn('Amount of roots: 2');
            WriteLn('Roots: ', ans.real_part:0:2, '+', ans.im_part:0:2, 'i, ', ans.real_part:0:2, '-', ans.im_part:0:2, 'i');
        end;
        2: 
        begin
            WriteLn('Amount of roots: 2');
            WriteLn('Roots: ', ans.root1:0:2, ', ', ans.root2:0:2);
        end; 
        1: 
        begin
            WriteLn('Amount of roots: 1');
            WriteLn('Roots ', ans.root1:0:2);
        end;
    end;
end.
