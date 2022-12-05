% This is a function that will simulate an object being dropped and
% reaching terminal velocity

% Omar Salah-Eddine
% ITP168 Fall 2022
% Homework 5
% salahedd@usc.edu
% terminal - This is a function that will simulate an object being dropped and
%               reaching terminal velocity
%     INPUT: <objectMass>, <dropHieght>, <dragCoefficient> 
%     OUTPUT: <freeFallTime>, <terminalVelocity>

function [tg, termV] = terminal(mass, height, drag)

    if nargin ~= 3
        error("ITP168:nargin", "You must provide all 3 arguments for this function. The objects mass, the height from which it is dropped, and the drag coefficient")
    end

    if ~isnumeric(mass) || ~isscalar(mass) || mass <=0
        error("ITP168:mass", "You must provide a positive numeric scalar value for mass")
    end
    
    if ~isnumeric(height) || ~isscalar(height) || height <=0
        error("ITP168:mass", "You must provide a positive numeric scalar value for height")
    end

    if ~isnumeric(drag) || ~isscalar(drag) || drag <=0
        error("ITP168:mass", "You must provide a positive numeric scalar value for drag")
    end
    
    fg = mass*9.81;
    
    termV = fg/drag;
    
    v_t = @(t) (fg / drag) * (1 - exp((- drag * t) / mass));

    tg = 0;
    
    distance = 0;

    % While loop that calculates the fall time of the object
    while(distance < height)
        distance = integral(v_t, 0, tg); % Increment the distance to the current point in time
        if(distance < height) 
            tg = tg + 0.01; % If we have not hit the ground yet, we increase the time incrememnt by 1 step
        end
    end
    t = (0 : 0.01 : tg + 0.01);
    velocity = v_t(t);
    acceleration = [9.81, diff(velocity) ./ diff(t)];
    height = height - cumtrapz(t, velocity);


    figure(1);
    subplot(3,1,1)
    plot(t, height);
    title(sprintf('Freefall With Air Resistance: C_D = %.3f, V_t = %.2f m/s', drag, termV));
    xlabel('Time (s)');
    ylabel("height (meters)")
    
    subplot(3,1,2)
    plot(t, velocity);
    xlabel('Time (s)');
    ylabel("Velcoity (m/s)")

    subplot(3,1,3)
    plot(t, acceleration);
    xlabel('Time (s)');
    ylabel("Acceleration (m/s^2)")

end

