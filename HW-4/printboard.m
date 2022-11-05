% Omar Salah-Eddine
% ITP168 Fall 2022
% Homework 4
% salahedd@usc.edu

function [] = printboard(board)
% Prints the game board nicely after verifying that the imensions and
% elements within are valid

% Input: a 3x3 numeric array that only contains 0’s, 1’s, or 2’s
% Output: none
    if nargin ~=1
          error("ITP168:nargin", "Not enough inputs were given")
    end
    if ~isnumeric(board) || all([3 3] ~= size(board), "all") || ~all(ismember(board(:),0:2))
          error("ITP168:input", "Incorrect input given")
    end

    dispBoard = cell(5);
    dispBoard{2, 1} = '---';
    dispBoard{2, 2} = '---';
    dispBoard{2, 3} = '---';
    dispBoard{2, 4} = '---';
    dispBoard{2, 5} = '---';
    dispBoard{4, 1} = '---';
    dispBoard{4, 2} = '---';
    dispBoard{4, 3} = '---';
    dispBoard{4, 4} = '---';
    dispBoard{4, 5} = '---';
    dispBoard{1, 2} = '|';
    dispBoard{1, 4} = '|';
    dispBoard{2, 2} = '-';
    dispBoard{2, 4} = '-';
    dispBoard{3, 2} = '|';
    dispBoard{3, 4} = '|';
    dispBoard{4, 2} = '-';
    dispBoard{4, 4} = '-';
    dispBoard{5, 2} = '|';
    dispBoard{5, 4} = '|';

    for row = 1:3
        for col = 1:3
            rbuffer = 0;
            cbuffer = 0;

            if row>1
                rbuffer = 1;
            end

            if row == 3
                rbuffer = 2;
            end

            if col > 1
                cbuffer = cbuffer+1;
            end

            if col == 3
                cbuffer = cbuffer+1;
            end

            switch board(row, col)
                case 1
                    dispBoard{row+rbuffer,col+cbuffer} = ' X ';
                case 2
                    dispBoard{row+rbuffer,col+cbuffer} = ' O ';
                otherwise
                    dispBoard{row+rbuffer,col+cbuffer} = ' _ ';
            end
        end
    end

   disp(cell2mat(dispBoard));
end