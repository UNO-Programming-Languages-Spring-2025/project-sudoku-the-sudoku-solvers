% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)

% Your implementation please...
row(1..4).
column(1..4).
number(1..4).
grid(1..4).
% Put the initial numbers in the grid
sudoku(X, Y, N) :- initial(X ,Y, N).

% There can only be 1 answer to be picked, do this for every column and row
{ sudoku(X, Y, N) : number(N) } = 1 :- row(X), column(Y).

% This may not be the best way to do it, but essentially it takes a range of X and Y for each 2 cells, and then takes those total 4 cell range and assigns a num
subgrid(X, Y, 1) :- row(X), column(Y), X >= 1, X <= 2, Y >= 1, Y <= 2.
subgrid(X, Y, 2) :- row(X), column(Y), X >= 1, X <= 2, Y >= 3, Y <= 4.
subgrid(X, Y, 3) :- row(X), column(Y), X >= 3, X <= 4, Y >= 1, Y <= 2.
subgrid(X, Y, 4) :- row(X), column(Y), X >= 3, X <= 4, Y >= 3, Y <= 4.

% Confirm that no duplicates occur in a Row or Column
:- sudoku(X, Y, N), sudoku(X', Y, N), X != X'.
:- sudoku(X, Y, N), sudoku(X, Y', N), Y != Y'.

% Confirm no duplicates in subgrids, take two sudoku with different X, Y same num, get their subgrids, compare to see if the co-ordinates are equal if not then duplicate
:- sudoku(X, Y, N), sudoku(X', Y', N), subgrid(X, Y, G), subgrid(X', Y', G), (X, Y) != (X', Y').
#show sudoku/3.
