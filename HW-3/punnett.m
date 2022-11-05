% Omar Salah-Eddine
% ITP168 Fall 2022
% Homework 3
% salahedd@usc.edu

clear;clc; % Clear the workspace and screen

% This is all just exception handling so that we can ensure that we get
% valid user inputs that we can further use in our script. We repeat this
% process for both parents and both traits.
parent1A = input("Enter Parent 1's A traits: ","s");
while(length(parent1A)~=2 || ~all(lower(parent1A) == 'a'))
    parent1A = input("INVALID INPUT! Need two A traits: ", "s");
end

parent1B = input("Enter Parent 1's B traits: ", "s");
while(length(parent1B)~=2 || ~all(lower(parent1B) == 'b'))
    parent1B = input("INVALID INPUT! Need two B traits: ", "s");
end

parent2A = input("Enter Parent 2's A traits: ","s");
while(length(parent2A)~=2 || ~all(lower(parent2A) == 'a'))
    parent2A = input("INVALID INPUT! Need two A traits: ", "s");
end

parent2B = input("Enter Parent 2's B traits: ", "s");
while(length(parent2B)~=2 || ~all(lower(parent2B) == 'b'))
    parent2B = input("INVALID INPUT! Need two B traits: ", "s");
end



punnet = cell(5); % Initialize an empty 5x5 cell matrix
counter = 2; % Initialize a counter that can point to the right column and 
% and row for each of the parents possible combinations of traits
% respectively

% Nested for loop so that we can properly combine possible trait
% combinations of the each of the parents and then store those directly in
% the respective cells in the top row and far left column of the punnet
% matrix
for i = 1:2 
    for j = 1:2 
        punnet{1, counter} = [parent1A(i), parent1B(j)]; 
        punnet{counter, 1} = [parent2A(i), parent2B(j)]; 
        counter = counter + 1;
    end
end

% Now that we have the structure of our punnet square populated with our
% parental contribultion possiblities, we can use another nested loop to
% get the combination of each of the parents respective possibilities of
% trait contributions to its relevant cell between row 2 col 2 and row 5
% col 5
for row = 2:5 
    for col = 2:5 
        % We are going to store the data as cells, but first we need to
        % sort and format the combinations of traits that will populate
        % each cell.
        punnet{row, col} = [sort([punnet{1, col}(1), punnet{row, 1}(1)]), sort([punnet{1, col}(2), punnet{row, 1}(2)])];    
    end
end

fprintf("Ther resulting punnet square: \n")
% FInally we can pretty print our matrix considering the spacing and
% alignent
for row = 1:5 % Printing row counter.
    fprintf("%5s %5s %5s %5s %5s\n", punnet{row, 1}, punnet{row, 2}, punnet{row, 3}, punnet{row, 4}, punnet{row, 5});
end









