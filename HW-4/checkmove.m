% Omar Salah-Eddine
% ITP168 Fall 2022
% Homework 4
% salahedd@usc.edu

function [validity] = checkmove(board, position)
% checks to see if the players position given is not occupied on the board
% given

% inputs: the current board, the selected position to place the character
% Outputs: a Boolean – true if the move is valid, or false if the move is invalid
    if nargin < 2
          error("ITP168:nargin", "Not enough inputs were given")
    end
    if ~isnumeric(board) || all([3 3] ~= size(board), "all") || ~all(ismember(board(:),0:2)) || ~isnumeric(position) ||  ~all([1 2] == size(position), "all" ) || ~all(ismember(position(:),1:3))
          error("ITP168:input", "Incorrect input given")
    end
    row = position(1);
    col = position(2);
    validity = board(row, col) == 0;  
end