function output = extractmail(input)

if(nargin > 1)
    error('Input must be a single argument.');
end

if((~ischar(input) || ~isvector(input)) && (~isstring(input) || ~isscalar(input)))
    error('Input must be a character vector or string.');
end

emailExtract = regexp(input, '[\w\.\-]+@[\w\.\-]+[\.][\w\-]+', 'match');

if(length(emailExtract) == 1)
    output = emailExtract{1};
else
    output = [];
end

if(length(emailExtract) > 1)
    for i = 1:length(emailExtract)
        if(i < length(emailExtract))
            output = [output, emailExtract{i}, ' '];
        end
        if(i == length(emailExtract))
            output = [output, emailExtract{i}];
        end
    end
end        

end