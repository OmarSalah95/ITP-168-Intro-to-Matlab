% Omar Salah-Eddine
% ITP168 Fall 2022
% Homework 2
% salahedd@usc.edu

clear;clc;

% First we need to display a menu of items for sale and their prices to the user so they can make a
% selection

% Might as well save the products in a array so that we can easily add
% products and just iterate over our array to parse and display the data we need for
% our menu
products =  ["Gum" "0.65"; "Skittles" "0.47"; "Snickers" "0.33"; "Reeses" "0.84"];

% Here we display the menu and iterate over our array displaying all of the
% products available

fprintf("Please select from the following options:\n\n ")
for i = 1:length(products)
    fprintf("\t%0.f. %-10s - $%4s \n", i, products(i, 1), products(i, 2));
end
fprintf("\n");

% Validate users input otherwise continue to ask for a valid input, by
% taking it as a string and converting it to a number, we can later test to
% see if the user input a string or character which would break our code
userSelection = input("Selection: ", "s");
userSelection = str2num(userSelection);
% Here is the actual validation and loop. If we recieve a string or char
% our userSeelection will be an empty vector, and if it is beyond the
% bounds of our list item we would not be able to search for it in our list
% of products, so these cases will be accounted for here in this condition,
% and so long as the user gives us invalid inputs we will continue to
% prompt them until a valid input is recieved
while  isempty(userSelection) || userSelection < 1 || userSelection >= length(products) 
    userSelection = input("Sorry that was an invalid selection, please choose again: ", "s");
    userSelection = str2num(userSelection);
end
% Now that we have a valid selection, we can pull the price from our matrix
selectionPrice = products(userSelection,2);

% Calculate the change left over if the user inserted 1$ and store a
% temporary variable we can decrement when determining coins to return
change = 1 - double(selectionPrice);
remainingDue = change;

% To get our quarter count we will just divide the remaining due by .25
% evenly and decrement the remaineder by the value of that number of
% quarters. Follow the same process for all other denominations of change
quarterCount = fix(remainingDue/.25);
remainingDue = remainingDue - quarterCount*.25;

dimeCount = fix(remainingDue/.10);
remainingDue = remainingDue - dimeCount*.10;

nickleCount = fix(remainingDue/.05);
remainingDue = remainingDue - nickleCount*.05;

pennyCount = uint8(remainingDue*100);
remainingDue = 0;

% Clear the console and pretty print the data for our user about their
% change and the denominations it will come in.
clc;
fprintf("Change due: $%0.2f\n\tQuarters: % 4d\n\tDimes: % 7d\n\tNickles: % 5d\n\tPennies: % 5d\n",change ,quarterCount,dimeCount,nickleCount, pennyCount)




