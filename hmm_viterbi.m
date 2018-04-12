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
    index = zeros(length(states),1);
    in = [];
%% Intially in state 0. 
%% From State 0 it can go to State1 or State2 with 0.5 probability 


for i = 2:length(symbol)
    matrix =(T.* repmat(FP(:,i-1)',2,1).*repmat(EP(:,i),1,2));
    
    FP = [FP , max(matrix')'];
    for k = 1:(size(matrix,1))
        if(length(find(matrix(k,:) == max(matrix(k,:))))>1)
            in(k,1) = min(find(matrix(k,:) == max(matrix(k,:))));
        else
            in(k,1) = find(matrix(k,:) == max(matrix(k,:)));
        end
    end
       index = [index in];
            
       
end

%% Finding most probable path based on index and Forward Probability
 a =  find(FP(:,size(FP,2)) == max(FP(:,size(FP,2))));
 p = a;

   for l = size(index,2)-1:-1:1
   vec = index(:,l)
   a= [ vec(p) a];
    p = a(1);
   end
   FP
   index
   Most_prob_path = a 
