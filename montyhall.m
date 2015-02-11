clc;
close all;
clear all;


% create variables

changeWon=0; % win because of changing
change=0;
sameWon=0;   % win because of staying same
same=0;
sameLost=0;
changeLost=0;
availOptions=[0,0];

options=[1,2,3];  % available options to choose

n=1000;

%Uniformly distributed probability for switching and keeping choice constant
for i=1:n % play game many times
    
    prize=randi(3,1); % randomly set prize
    prizeTot(i,1)=prize; % book keeping
    choice1=randi(3,1); % randomly make first choice
    choice1Tot(i,1)=choice1;
    
    if choice1==prize   % if first choice was indeed correct
        randopen=randi(2,1);
        avialOptions=options(options~=prize);
        randopen=availOptions(randopen); % choose empty hat
    else
        randopen=options(options~=prize & options~=choice1); % choose remaining hat
        
    end
    
    choice2=randi(2,1);     % make random second choice
    availOptions=options(options~=randopen);
    
    choice2=availOptions(choice2);
    choice2Tot(i,1)=choice2;
    
    if choice2==prize % if won
        if choice2==choice1
            same=same+1;
            sameWon=sameWon+1;
            %   fprintf('Game won because of staying same\n');
        else
            change=change+1;
            changeWon=changeWon+1;
            %  fprintf('Game won because of changing\n');
        end
    else % if lost
        if choice2==choice1
            same=same+1;
            sameLost=sameLost+1;
            %  fprintf('Game lost because of staying same\n');
        else
            changeLost=changeLost+1;
            change=change+1;
            %Z  fprintf('Game lost becuase of changing\n');
        end
    end
end

fprintf('Uniformly distributed probability for switching and keeping choice constant:\n');
fprintf('Number of times changed   choice  won is %d times (%2.2f percent)\n',changeWon,100*changeWon/change);
fprintf('Number of times changed   choice lost is %d times (%2.2f percent)\n',changeLost,100*changeLost/change);
fprintf('Number of times unchanged choice  won is %d times (%2.2f percent)\n',sameWon,100*sameWon/same);
fprintf('Number of times unchanged choice lost is %d times (%2.2f percent)\n\n\n',sameLost,100*sameLost/same);


% Always Going with the initial Choice
clearvars -except n prizeTot choice1Tot choice2To options;
changeWon=0; % win because of changing
change=0;
sameWon=0;   % win because of staying same
same=0;
sameLost=0;
changeLost=0;

for i=1:n
    prize=randi(3,1); % randomly set prize
    prizeTot(i,2)=prize; % book keeping
    choice1=randi(3,1); % randomly make first choice
    choice1Tot(i,2)=choice1;
    
    choice2=choice1;
    choice2Tot(i,2)=choice2;
    
    if choice2==prize % if won
        if choice2==choice1
            same=same+1;
            sameWon=sameWon+1;
            %   fprintf('Game won because of staying same\n');
        end
    else % if lost
        if choice2==choice1
            same=same+1;
            sameLost=sameLost+1;
            %  fprintf('Game lost because of staying same\n');
        end
    end
    
end

fprintf('Going with the Initial Choice\n');
fprintf('Number of times unchanged choice  won is %d times (%2.2f percent)\n',sameWon,100*sameWon/same);
fprintf('Number of times unchanged choice lost is %d times (%2.2f percent)\n\n\n',sameLost,100*sameLost/same);



% Always Changing the initial Choice
clearvars -except n prizeTot choice1Tot choice2Tot options;
changeWon=0; % win because of changing
change=0;
sameWon=0;   % win because of staying same
same=0;
sameLost=0;
changeLost=0;
availOptions=[0,0];
for i=1:n
    prize=randi(3,1); % randomly set prize
    prizeTot(i,3)=prize; % book keeping
    choice1=randi(3,1); % randomly make first choice
    choice1Tot(i,3)=choice1;
    
    if choice1==prize   % if first choice was indeed correct
        randopen=randi(2,1);
        avialOptions=options(options~=prize);
        randopen=availOptions(randopen); % choose empty hat
    else
        randopen=options(options~=prize & options~=choice1); % choose remaining hat
        
    end
    
    availOptions=options(options~=randopen);
    choice2=availOptions(availOptions~=choice1);
    choice2Tot(i,2)-choice2;
    
    if choice2==prize % if won
        if choice2~=choice1
            change=change+1;
            changeWon=changeWon+1;
            %  fprintf('Game won because of changing\n');
        end
    else % if lost
        changeLost=changeLost+1;
        change=change+1;
        %Z  fprintf('Game lost becuase of changing\n');
        
    end
    
end

fprintf('Always Changing  with the Initial Choice\n');
fprintf('Number of times changed   choice  won is %d times (%2.2f percent)\n',changeWon,100*changeWon/change);
fprintf('Number of times changed   choice lost is %d times (%2.2f percent)\n',changeLost,100*changeLost/change);


