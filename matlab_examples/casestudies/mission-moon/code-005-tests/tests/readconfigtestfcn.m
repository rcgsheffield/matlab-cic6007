function test = readconfigtest()
test = functiontests(localfunctions);
end




%%
% Create two tests to test the function dist.m
% Each test will test a different input file:
%  - rocketorbittest.mat
%  - moonorbittest.mat
% Test that the file produces the correct distance between the rocket and
% the body it is orbiting i.e. earth or moon

%%
function rocketorbitdisttest(testcase)
%% Test rocketorbitest.mat
load('../rocketorbittest.mat');
de=dist(state.x,state.y,state.xe,state.ye);
de=single(de);  %convert to single precision to enable testing use num2str(de) to display all digits
assert(isequal(12321135,single(de)))
end

%%
function rocketorbitveltest(testcase)
%% Test x and y components of velocity for  rocket in rocket (earth) orbit test
load('../rocketorbittest.mat');
tol=1.0e-4;

assert(lt(   abs(state.vx-(-4573.7983)),tol))
assert(lt(   abs(state.vy-1294.8071),tol))
end

%%
function moonorbitdisttest(testcase)
%% Testmoonorbitest.mat
load('../moonorbittest.mat');
dm=dist(state.x,state.y,state.xm,state.ym);
dm=single(dm); %convert to single precision to enable testing use num2str(dm) to display all digits
assert(isequal(dm,1928455.25))
end

%%
function moonorbitveltest(testcase)
%% Test x and y components of velocity for  rocket in moon orbit test
load('../moonorbittest.mat');
tol=1.0e-4;
assert(lt(    abs(state.vx-(578.56453)),tol))
assert(lt(    abs(state.vy-(-179.8933)),tol))
end




