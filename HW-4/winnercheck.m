% Omar Salah-Eddine
% ITP168 Fall 2022
% Homework 4
% salahedd@usc.edu

function [wld] = winnercheck(board)
% Checks to see if any of the winning conditions are met, if so it returns
% the winner, or stalemate is reach. If the game is still active it returns
% N which will keep the game running until gameover

% input: the current board
% Output: a character that represents the result of the board
    if nargin ~=1
          error("ITP168:nargin", "Not enough inputs were given")
    end
    if ~isnumeric(board) || all([3 3] ~= size(board), "all") || ~all(ismember(board(:),0:2))
          error("ITP168:input", "Incorrect input given")
    end

    flag = 0;

    for pointer = 1:3
        if all(board(pointer, :) == board(pointer, 1))
            flag =  board(pointer, 1);
        end
        if all(board(:, pointer)' == board(:, pointer))
            flag = board(1, pointer);
        end
    end
    
    if all([board(1,1) board(2,2) board(3,3)] == board(1,1)) || all([board(3,1) board(2,2) board(3,1)] == board(1,3))
        flag = board(2,2);
    end

    if flag == 1
        wld = 'X';
    elseif flag == 2
        wld = 'O';
    else
        if all(board, "all")
            wld = 'S';
        else
            wld = 'N';
        end
    end


 end
