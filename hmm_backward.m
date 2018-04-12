%% Backward Algorithm



close all;
clear all;
clc;



%% State Transition Probability

% T = [T11 T21; T12 T22];
T = [0.7 0.2; 0.3 0.8];
T = T';
E = [0.8 0.3;0.2 0.7];
% Let the symbols be HTTH
EP = []
symbol ='HTTH'
states =[1, 2]';
for i = 1: length(symbol)
    if symbol(i) == 'H'
    EP = [EP E(1,:)'];
    if (i== length(symbol))
        BP =  ones(length(states),1);
    end
    else if symbol(i) == 'T'
            EP = [EP E(2,:)'];
            if (i==length(symbol))
                BP = ones(length(states),1);
            end
            
        end
        end
    end
    
%% Backward Probability Computation 
BP_temp = BP;
for i = length(symbol)-1:-1:1

  
    AP = T*(EP(:,i+1).*BP_temp)
    BP = [AP BP];
    BP_temp = AP;
    
end
P = sum(BP(:,1).*EP(:,1)*0.5)