%% 
%  
%% *Exercises for GUI Development with Matlab*
% **
%% Practice Session 1
% 
% 
% 
% 
% Writer a GUI program to add tw numbers
% 
% 
% 
% 
%%
% --- Executes just before adder is made visible.
function adder_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to adder (see VARARGIN)

% Choose default command line output for adder
handles.output = hObject;
handles.a1=1;
handles.a2=2;
% Update handles structure
guidata(hObject, handles);
end

%%
function edit2_Callback(hObject, eventdata, handles)
% hObject    handle to edit2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit2 as text
%        str2double(get(hObject,'String')) returns contents of edit2 as a double
handles.a2=str2double(get(hObject,'String'));
guidata(hObject, handles);
end
%%
function edit1_Callback(hObject, eventdata, handles)
% hObject    handle to edit1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of edit1 as text
%        str2double(get(hObject,'String')) returns contents of edit1 as a double
handles.a1=str2double(get(hObject,'String'));
guidata(hObject, handles);
end
%%
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
    result=handles.a1+handles.a2    
    set(handles.result, 'String', num2str(result));
 
guidata(hObject,handles)
end
%% 
% 
% 
% 
% 
% 
% 
% 
% 
% 
%% Getting Started 
% •          Startup MATLAB
% 
% •          Start up and experiment with the following
% 
% –        Editor
% 
% –        Demos
% 
% –        Help
% 
% –        Use the file/files File operations to navigate directories
% 
% –        Under the applications menu start up the variable browser (windows 
% only).
% 
% Practice on the command window
% 
% •          Enter the following lines into the command window and observe 
% what happens:

a = 1.234
b= 5.6
c = a*b 
D = [ a b c ]
E = [ c ; b; a] 
F = D*E
G= E*del2

%% 
% •          Use the who and whos command to get information about the assigned 
% variables note  how the variables are stored and how much storage is used.
%% Exercises 1: Matrices
% 1.1 Define the following matrix in MATLAB:
% 
% 
% 
% 1.2 Define a row vector X which is set to the second row of  matrix A
% 
% 1.3 Define a column vector Y, which is set to the first column of A
% 
% 1.4 Define a column vector Z, which is set to the first row of A
% 
% 1.5 Define a column vector V, which contains the third column of A in reverse 
% order 
% 
% 1.6 Find out X*Y and Y*X 
%%
A = [ 1 2 3 ; 3 4 5 ; 2 6 6 ] ;  
X = A( 2, : )  ;
Y =  A( : , 1 )  ;
Z = A(1, : )';
V = A(3:-1:1 , 3)  ;
W1= Y*Z ;
W2 = Z*Y  ;

%% 
% 1.7 Find the determinant of A
% 
% Determine the solution of the following simultaneous equations
% 
%             x  + 2y +  3z = 4
% 
%             3x+ 4y + 5z = 14
% 
%             2x+ 6y + 6z = 20
%%
% w = [%RHS here] 
% A=[] %define matrixe of coefficients
% xyz=..... % compute solution using inverse of A

D = det(A)  ;
w = [4;14;20]  ;  
     
xyz = inv(A)*w;
%or
% xyz = A\w  

%% Exercises 2  : Functions Applied to Arrays and Matrices
% 2.1 Using the RAND function define a 16 by 16 matrix R of random numbers, 
% elements of which range between 0 and 10.
% 
% 2.2        Using the PASCAL function set B to the 5 by 5 Pascal triangle
% 
% 2.3        Find the inverse of matrix B and store it in C 
% 
% 2.4        Using the SUM function find the sum of each column of matrix 
% C  
% 
% 2.5        Define a new matrix D which is the subset of B and made up of 
% rows 2 to 4 and columns 2 to 4 of the B matrix.
%%
R= 10*rand (16 , 16 ) ;
B = pascal ( 5 ) ;
C = inv(B) ;
Sum(C) ;
D= C(2:4,2:4) ;

%% 
% 
%% Exercises 3: Data Types
% Store the following table -
% 
% (a)  As a cell array 
% 
% (b)  As a structure
% 
% 
%%
%alkali metals as a cell array
alkalimetals=cell(3,4);

%alkali metals as a structure
% s = struct(field1,value1,...,fieldN,valueN)
am(1)=struct('name','Lithium','aw',6.941,'density',0.534,'cindex',[0.3 0.4 0.3]);
am(2)=struct('name','Sodium','aw',22.990,'density',0.968,'cindex',[0.6 0.8 0.7]);
%% Exercise 4 :  Writing MATLAB Functions
% Sin(x) can be represented by the series;
% 
%     Sin(x) = x – x3/3! + x5/5! – x7/7! + …
% 
% * Write a MATLAB function named mysine that will calculate sin(x) to the power 
% 11. 
% * Improve your function by putting checks for the range of x and n supplied 
% by the user.
% * Modify the function so that the calculations are carried out to any user     
% specified number of terms _(n)._
%%
%you may write the following in a separate function file called mysine

% % % function y = mysin(x)
% % %     % MYSIN : Calculates the sine of an angle expressed 
% % %     %          in radians.
% % %     sum = x ;   
% % %     nexterm = x ;
% % %     for i =3:2:11
% % %       nexterm = -nexterm.*x.^2./(i*(i-1));
% % %       sum = sum+nexterm;
% % %     end
% % %     y = sum;
% % % end
%%
% % % %improved function
% % % function y = mysin(x)
% % % % MYSIN : Calculates the sine of an angle expressed 
% % % %          in radians using 5 terms of the expansion.
% % % % 	       Range must be between +- pi. 
% % % % 
% % % if x < pi & x > -pi 
% % %   sum = x ;   
% % %   nexterm = x ;
% % %   for i =3:2:11
% % %     nexterm = -nexterm.*x.^2./(i*(i-1));
% % %     sum = sum+nexterm;
% % %   end
% % % else
% % %    sum = nan;
% % %   
% % %   disp(['Outside the permited range of ' , num2str(-pi),...
% % %         ' to ' , num2str(pi) ] ); 
% % % end
% % % y = sum;
% % % end
%%
% % % %compute to any number of terms
% % % function y = mysin(x,nseries)
% % % % MYSIN : Calculates the sine of an angle expressed 
% % % %          in radians.
% % % % 	        Range must be between +- pi. 
% % % % Second parameter is optional which determines the number of
% % % % terms in the series. Default is 5.
% % % if exist('nseries','var' ) 
% % %    nn = nseries*2 + 1;
% % % else
% % %    nn = 11;
% % % end
% % % 
% % % if x < pi & x > -pi 
% % %   sum = x ;   
% % %   nexterm = x ;
% % %   for i =3:2:nn
% % %     nexterm = -nexterm.*x.^2./(i*(i-1));
% % %     sum = sum+nexterm;
% % %   end
% % % else
% % %    sum = nan;
% % %    disp(['Outside the permited range of ' , num2str(-pi),...
% % %         ' to ' , num2str(pi) ] ); 
% % % end
% % % y = sum;
% % % end

%% Exercise 5: Data Import
% Import the data gasprices.csv in the exercise folder into a table.
%%
G = readtable('../data/gasprices.csv', 'Delimiter', ',', 'Headerlines', 4);
%% 
%  Extract the data for Japan, and compute mean and std.

JP = G.Japan;
JP_mean = mean(JP);
JP_std = std(JP);
%% 
% Extract the data for Europe, and compute the mean European price in each 
% year.

Europe = [G.France, G.Germany, G.Italy, G.UK];
annualEuroMeans = mean(Europe, 2);
%% 
%  Compute the return series for Europe.

Euro_Returns = log( Europe(2:end, :) ./ Europe(1:end-1, :) );
%% 
% Compute and visualise correlation.

C = corrcoef(Euro_Returns);
figure
imagesc(C, [-1, 1])
set(gca, 'XTick', 1:4, 'XTickLabel', {'France', 'Germany', 'Italy', 'UK'}, ...
    'YTick', 1:4, 'YTickLabel', {'France', 'Germany', 'Italy', 'UK'})
colorbar
%% 
% 
% 
% 
%%