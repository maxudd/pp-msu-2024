divert(-1)
define(`rnd a', 7141)
define(`rnd c', 54773)
define(`rnd m', 259200)
define(seed, `define(`rnd x', `$1')dnl')
define(random, `eval(indir(`rnd x')%0xa5a5%`$1')'`define(`rnd x', eval((indir(`rnd a')*indir(`rnd x')+indir(`rnd c'))%indir(`rnd m')))'))
ifdef(`SEED', `seed(SEED)', `seed(1337)')
define(alternate, `ifelse(random(2), 0, `$1', `$2')')
define(choose, `ifelse($#, 1, `$1',
                       ifelse(random($#), 0, `$1', `choose(shift($@))'))')
divert(0)dnl
Задание №indir(`rnd x')
divert(-1)
define(lang, choose(c, pas))
define(input, choose(stdin, argv))
choose(`define(X, x)define(Y, y)define(b0, 0)',
       `ifelse(lang, c, `define(X, do(0))define(Y, do(1))define(b0, 1)',
              `define(X, hi(0))define(Y, hi(1))define(b0, 1)')')
define(type, choose( `целые', `вещественные'))
define(fmt, choose(1, 2, 3))
define(function, `ifelse(lang`'fmt`'type, c3целые, `int',
                         lang`'fmt`'type, c3вещественные, `float',
                         lang`'fmt`'type, pas3целые, `integer',
                         lang`'fmt`'type, pas3вещественные, `real',
                         `calculate')')
define(statement, `ifelse(fmt, 1,
	`Формула в списке одна, она содержит только одно выражение',
	`Формул в списке несколько, каждая формула представлена в виде "function`'(выражение)"')')
define(b1, `ifelse(fmt, 3, 1, 0)')
define(const, `ifelse(type, целые, 42, 2.718)')
define(fun, `ifelse(type, целые, abs, sqrt)')
define(res1, `ifelse(type, целые, 75, 4.062073)')
define(res2, `ifelse(type, целые, 9, 9.735835)')
divert(0)
Написать макросценарий на GNU m4, который порождает программу, способную вычислять и выводить формулы. На вход этому сценарию подаётся список формул, на выходе — программа, которую можно скомпилировать, запустить, ввести два операнда, вычислить и вывести результаты.
Порождаемая программа должна быть написана на языке ifelse(lang, c, Си, Паскаль).
statement.
Выражение содержит type операнды с именами X и Y.
ifelse(input, stdin, Операнды вводятся со стандартного ввода, Операнды передаются в виде параметров командной строки).

Пример входного файла:
ifelse(fmt, 1,
3+X*fun`'(Y-const),
`function`'(3+X*fun`'(Y-const))
function`'(X/const+Y*Y)')

Пример генерации программы:
m4 генератор.m4 входной_файл > программа.lang

Пример запуска программы ifelse(input, stdin,
(ввод отмечен стрелочками «→»):`
./program
→2
→3
'res1`ifelse(fmt, 1,,`
'res2)',`
./program 2 3
'res1`ifelse(fmt, 1,,`
'res2)')

Максимальный балл: eval(4+b0+b1) из 6.
