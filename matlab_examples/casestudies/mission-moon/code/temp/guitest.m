function varargout = guitest(varargin)
%a simple animation example 

%this was created using GUIDE selecting a GUI with UI controls
%GUIwith UI controls

%This adaption of the default routine  adds the following features
%  startanimation button
%  this button triggers and calls the main simulation loop simloop
%  the parameters for the simulation data are are contained in the
%  handles.simdata data structure initialised at the pushbutton3_CreateFcn
%  which creates the figure window and stores graphical handles for the 
%  figure window used to run the animation

%  the animation starts when the StartAnimation button is pressed
%  the simloop updates tha plot with a pointer moving in a circle
%  a decay parameter converts this to a spiral motion

% the decay parameter can be modified by editing the density
% using values in the range .01 to 0.00001


% 
% guitest MATLAB code for guitest.fig
%      guitest, by itself, creates a new guitest or raises the existing
%      singleton*.
%
%      H = guitest returns the handle to a new guitest or the handle to
%      the existing singleton*.
%
%      guitest('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in guitest.M with the given input arguments.
%
%      guitest('Property','Value',...) creates a new guitest or raises
%      the existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before guitest_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to guitest_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help guitest

% Last Modified by GUIDE v2.5 20-Feb-2018 20:48:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @guitest_OpeningFcn, ...
                   'gui_OutputFcn',  @guitest_OutputFcn, ...
                   'gui_LayoutFcn',  [] , ...
                   'gui_Callback',   []);
if nargin && ischar(varargin{1})
    gui_State.gui_Callback = str2func(varargin{1});
end

if nargout
    [varargout{1:nargout}] = gui_mainfcn(gui_State, varargin{:});
else
    gui_mainfcn(gui_State, varargin{:});
end
% End initialization code - DO NOT EDIT

% --- Executes just before guitest is made visible.
function guitest_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to guitest (see VARARGIN)

% Choose default command line output for guitest
handles.output = hObject;

% Update handles structure



guidata(hObject, handles);

initialize_gui(hObject, handles, false);

% UIWAIT makes guitest wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = guitest_OutputFcn(hObject, eventdata, handles)
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function density_CreateFcn(hObject, eventdata, handles)
% hObject    handle to density (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function density_Callback(hObject, eventdata, handles)
% hObject    handle to density (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of density as text
%        str2double(get(hObject,'String')) returns contents of density as a double
density = str2double(get(hObject, 'String'));

if isnan(density)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end
handles.simdata.decay=density;

% Save the new density value
handles.metricdata.density = density;
guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function volume_CreateFcn(hObject, eventdata, handles)
% hObject    handle to volume (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: popupmenu controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function volume_Callback(hObject, eventdata, handles)
% hObject    handle to volume (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of volume as text
%        str2double(get(hObject,'String')) returns contents of volume as a double
volume = str2double(get(hObject, 'String'));
if isnan(volume)
    set(hObject, 'String', 0);
    errordlg('Input must be a number','Error');
end

% Save the new volume value
handles.metricdata.volume = volume;
guidata(hObject,handles)

% --- Executes on button press in calculate.
function calculate_Callback(hObject, eventdata, handles)
% hObject    handle to calculate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

mass = handles.metricdata.density * handles.metricdata.volume;
set(handles.mass, 'String', mass);

% --- Executes on button press in reset.
function reset_Callback(hObject, eventdata, handles)
% hObject    handle to reset (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

initialize_gui(gcbf, handles, true);

% --- Executes when selected object changed in unitgroup.
function unitgroup_SelectionChangedFcn(hObject, eventdata, handles)
% hObject    handle to the selected object in unitgroup 
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

if (hObject == handles.english)
    set(handles.text4, 'String', 'lb/cu.in');
    set(handles.text5, 'String', 'cu.in');
    set(handles.text6, 'String', 'lb');
else
    set(handles.text4, 'String', 'kg/cu.m');
    set(handles.text5, 'String', 'cu.m');
    set(handles.text6, 'String', 'kg');
end

% --------------------------------------------------------------------
function initialize_gui(fig_handle, handles, isreset)
% If the metricdata field is present and the reset flag is false, it means
% we are we are just re-initializing a GUI by calling it from the cmd line
% while it is up. So, bail out as we dont want to reset the data.
if isfield(handles, 'metricdata') && ~isreset
    return;
end

handles.metricdata.density = 0;
handles.metricdata.volume  = 0;



set(handles.density, 'String', handles.metricdata.density);
set(handles.volume,  'String', handles.metricdata.volume);
set(handles.mass, 'String', 0);

set(handles.unitgroup, 'SelectedObject', handles.english);

set(handles.text4, 'String', 'lb/cu.in');
set(handles.text5, 'String', 'cu.in');
set(handles.text6, 'String', 'lb');

handles.simdata.time = 0;
handles.simdata.theta = 0;
handles.simdata.dt = 0.1;
handles.simdata.radius = 1;
handles.simdata.decay=0.001;

handles.simdata.xp = 1;
handles.simdata.yp = 0;


% Update handles structure
guidata(handles.figure1, handles);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
simloop(hObject,eventdata,handles);
%guidata(hObject,handles)

% --- Executes during object creation, after setting all properties.
function pushbutton3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
handles.simdata.time = 0;
handles.simdata.theta = 0;
handles.simdata.dt = 0.1;
handles.simdata.radius = 1;
handles.simdata.decay=0.001;

handles.simdata.xp = 1;
handles.simdata.yp = 0;





handles.hgraph=figure;
hold on;
%re=re/2; %modification for moon model
x=-pi:2*pi/100:pi;
y=4*sin(x);
plot(x,y);
hold on
handles.hm=plot( handles.simdata.xp , handles.simdata.yp ,'o','MarkerFaceColor','g','MarkerSize',5);
hold off;
guidata(hObject, handles);

function simloop(hObject,eventdata,handles)

% handles.simdata.time = 0;
% handles.simdata.theta = 0;
% handles.simdata.dt = 0.1;
% handles.simdata.radius = 1;
for i=0:500
    handles.simdata.theta=handles.simdata.theta+(2*pi)/250;
    if handles.simdata.theta>(2*pi) 
        handles.simdata.theta=0;   
    end
    handles.simdata.radius=handles.simdata.radius*exp(-handles.simdata.decay);
    handles.simdata.xp=+4*handles.simdata.radius*cos(handles.simdata.theta);
    handles.simdata.yp=+4*handles.simdata.radius*sin(handles.simdata.theta);
    set(handles.hm,'XData',handles.simdata.xp);
    set(handles.hm,'YData',handles.simdata.yp);
      
    drawnow;
    %guidata(hObject, handles);
end
%handles.simdata.radius=1.0;

guidata(hObject, handles);
