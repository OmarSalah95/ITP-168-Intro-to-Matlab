% Omar Salah-Eddine
% ITP168 Fall 2022
% Homework 4
% salahedd@usc.edu

function [newBoard] = updateboard(board, position, char)
% Updates the board given by adding a the move made to the board

% Inputs: the current board, the selected position to place the character, the character to place
% Output: the new board
    
    if nargin < 3
          error("ITP168:nargin", "Not enough inputs were given")
    end
    if ~isnumeric(board) || all([3 3] ~= size(board), "all") || ~all(ismember(board(:),0:2)) || ~isnumeric(position) ||  ~all([1 2] == size(position), "all" ) || ~all(ismember(position(:),1:3)) || (char ~= 'X' && char ~='O') 
          error("ITP168:input", "Incorrect input given")
    end

    flag = 0;

    if char == 'X'
        flag = 1;
    else 
        flag = 2;
    end

    board(position(1), position(2)) = flag;

    newBoard = board;

 end
