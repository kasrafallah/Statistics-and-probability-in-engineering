
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

After doing this, in a loop by calling this function we create a normal sequence and with the "exp" command, we generate a normal log-normal distribution as we can see

<p align="center">
<image align="center" src = "images/one.png" width="600">
</p>
    
### The second method - polar coordinates
    
This method, which is the fastest method, is formed by vectoring two exponential vectors with uniform distribution and then we extract the normal random vector from them with the given relations as follows.
    
    u = rand(1,1000000);
    v = rand(1,1000000);
    z = sqrt(-2*log(v)).*cos(pi*(2-u));
    
now we could easily see the output:
    
<p align="center">
<image align="center" src = "images/two.png" width="600">
</p>

### The third method - the central limit theorem
    
In this method, from the sum of a number of uniform random variables and averaging, we can easily obtain the normal distribution as follows.
    
    a = zeros(1,100000);
    s = input('inter sigma  ');
    b = input('inter mean   ');  
    for i = 1:100000
        temp = rand(1,100000);
        a(i) = (sum(temp)/length(temp)-0.5)*10^3;
    end
    a = s*a +b;
For sigma 1, we have an average of 0.2:
    
<p align="center">
<image align="center" src = "images/three.png" width="600">
</p>
    
