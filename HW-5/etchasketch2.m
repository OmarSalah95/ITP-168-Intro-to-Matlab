
function etchasketch()
% Omar Salah-Eddine
% ITP168 Fall 2022
% Homework 5
% salahedd@usc.edu
% ETCHASKETCH - simulate an Etch A Sketch
%     INPUT: None
%     OUTPUT: None
%     This function will simulate an Etch A Sketch, but will not allow for
%     two directions to be actuated at the same time (UP and RIGHT) does not
%     work. Only one direction will be able to be recognized at a time. It
%     uses the standard WASD directions for UP, LEFT, DOWN, RIGHT
%     The cursor starts in the center of the screen with a stage that is
%     1001x1001 in size.
%% don't touch this stuff
set(gcf,'KeyPressFcn',@callback);
set(gcf,'CurrentCharacter','n');
choose = 'n';
Xdata = [0];
Ydata = [0];
while (choose ~= 'q')
  choose = get(gcf,'CurrentCharacter');
 
  switch choose
      case 's' %the user wants to move down
          %% TODO: WRITE CODE HERE
          if Ydata(end) > -50
              Xdata(end + 1) = Xdata(end);
              Ydata(end + 1) = Ydata(end) - 1;
          end
          %% stop writing code here
      case 'w' %the user wants to move up
          %% TODO: WRITE CODE HERE
          if Ydata(end) < 50
              Xdata(end + 1) =  Xdata(end);
              Ydata(end + 1) = Ydata(end) + 1;
          end
          %% stop writing code here
      case 'a' %the user wants to move left
          %% TODO: WRITE CODE HERE
          if Xdata(end) > -50
              Xdata(end+1) = Xdata(end) - 1;
              Ydata(end+1) = Ydata(end);
          end
          %% stop writing code here
      case 'd' %the user wants to move right
          %% TODO: WRITE CODE HERE
          if Xdata(end) < 50
              Xdata(end+1) = Xdata(end) + 1;
              Ydata(end+1) = Ydata(end);
          end
        
          %% stop writing code here
  end
  set(gcf,'CurrentCharacter','n');
  %% TODO: WRITE CODE HERE
 
  figure(1)
  lPlot = plot(Xdata, Ydata)
  axis([-50 50 -50 50]);
  hold on
  % linkdata on
  sPlot = scatter(Xdata(end), Ydata(end));
  hold off
   %% stop writing code here
  pause(0.1);
 end
end
%% don't touch any of this.
function callback(hObject, callbackdata)
end



