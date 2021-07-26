
## log-normal distribution generation

In this project, we have to generate a log-normal distribution of the  three  available methods, which briefly addresses each of them

### first method - rejection
To implement this method, I first write a function that produces a normal number each time I call it. I implemented the function as follows:

    function [x] = STDNormal()
    % generate standard normal distribution using Acceptance-rejection method
    rng('shuffle');

    y1=-log(rand);
    y2=-log(rand);

    while y2<((y1-1).^2)/2
        y1=-log(rand);
        y2=-log(rand);
    end

    abs_z=y1;

    u=rand;
    if u<=0.5
        z=abs_z;
    else
        z=-abs_z;
    end
    x=z;
    end

