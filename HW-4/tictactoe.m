% Omar Salah-Eddine
% ITP168 Fall 2022
% Homework 4
% salahedd@usc.edu


clear;
clc;

player1 = true;
gameOver = 'N';
playing = "y";
board = initboard();

while playing == "y"

    disp("Let's play tic-tac-toe!");
    while gameOver == 'N'
        symb ='';
        if player1
            disp("Player X's turn")
            symb = 'X';
        else
            disp("Player O's turn")
            symb = 'O';
        end
        row = input("Select a row ");
        while row <= 0 || row > 3
            row = input("Invalid row selection!\n Select a row: ");
        end
    
        col = input("Select a column ");
        while col <= 0 || col > 3
            col = input("Invalid column selection!\n Select a column: ");
        end
    
        position = [row col];
        if checkmove(board, position)
            board = updateboard(board, position, symb);
            player1 = ~player1;
            printboard(board);
        end
        gameOver = winnercheck(board);
        if gameOver ~= 'N'
            if gameOver == 'S'
                disp("Stalemate reached!");
            else
                fprintf("Player %s Wins!\n", gameOver);
            end
        end
        
    end


    playing = input("Would you like to play again? ", "s");
end



