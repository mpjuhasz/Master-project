function means = meanx(beta, p, steps)
tic;
[a, lenb] = size(beta);    
[b, lens] = size(steps);
for k = 1:lenb   %iterating over the betas
    be = beta(1,k);
    for j = 1:lens   %iterating over the ns
        s = steps(j);
        for i = 1:100    %100 times for each setup
            n2 = ceil(s*(2^(-be)+0.5));
            A = perc(-n2, -s, s, s, p); %generating new environment for each iteration
            xn = 0;
            for r = 1:100
                C = rw(A, -n2, -s, s, be); %generating rw of n steps for the beta for each environment 10 times
                xn = xn + C(1,s); %take last step of the walk
            end
            xn = xn/100;
            B(1,i) = xn/(s); %take xn/n 
        end
        %disp(B);
        means(k, j) = mean(B); %average of last steps to get average X after n steps from 10000 data points
        fprintf('beta: %d, step: %d\n', k, j);
    end
end
save('new.mat','means');
toc;
end
