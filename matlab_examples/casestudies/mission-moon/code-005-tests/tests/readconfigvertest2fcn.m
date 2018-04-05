function test = readconfigvertest2()
test = functiontests(localfunctions);
end

%%
function setupOnce(testcase) %#ok<*DEFNU>
    
    addpath('../tests')
    testcase.TestData.moondat =load('moonorbittest.mat');
    testcase.TestData.rocketdat =load('rocketorbittest.mat');
    testcase.TestData.tol = 1.0e-4;
    
end % setupOnce



% Create two tests to test the function dist.m
% Each test will test a different input file:
%  - rocketorbittest.mat
%  - moonorbittest.mat
% Test that the file produces the correct distance between the rocket and
% the body it is orbiting i.e. earth or moon

function rocketorbitdisttest(testcase)
%% Test rocketorbitest.mat
state=testcase.TestData.rocketdat.state;
de=dist(state.x,state.y,state.xe,state.ye);
de=single(de);  %convert to single precision to enable testing use num2str(de) to display all digits
verifyTrue(testcase, isequal(12321135,single(de)))
end

function rocketorbitveltest(testcase)
%% Test x and y components of velocity for  rocket in rocket (earth) orbit test
state=testcase.TestData.rocketdat.state;
tol = testcase.TestData.tol;

verifyTrue(testcase, lt(   abs(state.vx-(-4573.7983)),tol))
verifyTrue(testcase, lt(   abs(state.vy-1294.8071),tol))
end

function moonorbitdisttest(testcase)
%% Testmoonorbitest.mat
state=testcase.TestData.moondat.state;
dm=dist(state.x,state.y,state.xm,state.ym);
dm=single(dm); %convert to single precision to enable testing use num2str(dm) to display all digits
verifyTrue(testcase, isequal(dm,1928455.25))
end

function moonorbitveltest(testcase)
%% Test x and y components of velocity for  rocket in moon orbit test
state=testcase.TestData.moondat.state;
tol = testcase.TestData.tol;
verifyTrue(testcase, lt(    abs(state.vx-(578.56453)),tol))
verifyTrue(testcase, lt(    abs(state.vy-(-179.8933)),tol))
end

%%
function teardownOnce(testCase)
    
    % Remove the test directory from the path.
    rmpath('../tests')

end % teardownOnce



