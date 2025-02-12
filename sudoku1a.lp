% Sudoku Solver
%
% Hints:
% For subgrid of size n, subgrids can be identified by labels 1..n*n
% A cell (x,y) can be mapped to the subgrid labeled 1+(((x-1)/n)*n+(y-1)/n)

% Your implementation please...
row(1..4).
column(1..4).
number(1..4).

% Put the initial numbers in the grid
sudoku(X, Y, N) :- initial(X ,Y, N).

% There can only be 1 answer to be picked, do this for every column and row
{ sudoku(X, Y, N) : number(N) } = 1 :- row(X), column(Y).

% Confirm that no duplicates occur in a Row or Column
:- sudoku(X, Y, N), sudoku(X', Y, N), X != X'.
:- sudoku(X, Y, N), sudoku(X, Y', N), Y != Y'.
#show sudoku/3.
