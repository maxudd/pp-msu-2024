program QuadraticSolver;

uses Math;

function solve_quadratic_equation(a, b, c: Real; var root1, root2, real_part, im_part: Real): Integer;
var
    disc: Real;
begin
    if a = 0 then
        solve_quadratic_equation := -1
    else
    begin
        disc := b * b - 4 * a * c;
        if disc < 0 then
        begin
            if b = 0 then
                real_part := 0
            else
                real_part := -b / (2 * a);
            im_part := Sqrt(-disc) / (2 * a);
            solve_quadratic_equation := 0;
        end;
        if disc = 0 then
        begin
            if b = 0 then 
                root1 := 0
            else 
                root1 := -b / (2 * a);
            solve_quadratic_equation := 1;
        end
        else if disc > 0 then
        begin
            root1 := (-b + Sqrt(disc)) / (2 * a);
            root2 := (-b - Sqrt(disc)) / (2 * a);
            solve_quadratic_equation := 2;
        end;
    end;
end;

var
    a, b, c, root1, root2, real_part, im_part: Real;
    ans: Integer;
begin
    ReadLn(a, b, c);

    ans := solve_quadratic_equation(a, b, c, root1, root2, real_part, im_part);

    case ans of
        -1: WriteLn('Not quadratic equation.');
        0: 
        begin
            WriteLn('Amount of roots: 2');
            WriteLn('Roots: ', real_part:0:2, '+', im_part:0:2, 'i, ', real_part:0:2, '-', im_part:0:2, 'i');
        end;
        2: 
        begin
            WriteLn('Amount of roots: 2');
            WriteLn('Roots: ', root1:0:2, ', ', root2:0:2);
        end; 
        1: 
        begin
            WriteLn('Amount of roots: 1');
            WriteLn('Roots ', root1:0:2);
        end;
    end;
end.
