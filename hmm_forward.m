%% Forward Algorithm



close all;
clear all;
clc;



%% State Transition Probability

% T = [T11 T21; T12 T22];
T = [0.7 0.2; 0.3 0.8];
E = [0.8 0.3;0.2 0.7];
% Let the symbols be HTTH
EP = []
symbol ='HTTH'
states =[1, 2]';
for i = 1: length(symbol)
    if symbol(i) == 'H'
    EP = [EP E(1,:)'];
    if (i== 1)
        FP = 0.5 * E(1,:)';
    end
    else if symbol(i) == 'T'
            EP = [EP E(2,:)'];
            if (i==1)
                FP = 0.5 *E(2,:)';
            end
            
        end
        end
    end
    
%% Intially in state 0. 
%% From State 0 it can go to State1 or State2 with 0.5 probability 
for i = 2:length(symbol)
    AP = T*FP(:,i-1) .* EP(:,i);
    FP =[FP AP];
end
