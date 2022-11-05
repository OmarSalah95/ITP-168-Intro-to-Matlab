% Omar Salah
% ITP 168 Fall 2022
% Homework 1
% salahedd@usc.edu

% This should be a fairly simple script that imports some variables from
% another file, prompts the user for their name, radius of the planet we
% are calculating their weight on, mass of that planet, and their mass so
% that we can calculate first the specific gravity of the planet so that we
% can then predict their projected weight when standing on the surface of
% that planet.


% Clear the screen to make sure everything looks nice and neat
clear;clc;


% Load data from constants.mat to our workspace so we can use them in
% calculations later
load("constants.mat");

% Promt users for input on the remaining data needed for our calculations
% and store them to variables so we can access them as needed after input.
userName = input("Please enter your name: ", "s"); % Passing the second argument specifies a string as the expected input
% Here we might as well account for the fact that we are receiving radii in
% kilometers, and we need to convert that to meters. So we can simply
% multiply the km input by 1000 to get the units we need.
radius = input("Please enter the radius of the plant you are on (in km): ")*1000;
planetaryMass = input("Please enter the mass of the planet in question in (in kg): ");
userMass = input("Please enter your mass (in kg): ");

% Calculate and store the planets specific gravity as well as the users
% weight on this planet
specificGravity = (universalGravity * planetaryMass)/radius^2;
calculatedUserWeight = specificGravity * userMass * newtonsToPounds;

% Pretty Print the data calculated formatting the outputs to meet
% requirements (2 decimals for Specific Gravity, whole numbers no rounding
% for the calculated user weight) and be displayed to the user.
disp("The specific gravity of the planet is "+ sprintf("%0.2f",specificGravity) +" m/s^2");
disp( userName+" would weigh " + sprintf("%0.0f",calculatedUserWeight) +" lbs on this planet");





