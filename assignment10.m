%% DIY Fourier Transform App
% This GUI takes assignment 7, when we learned about Fourier Transforms,
% and makes it easier to understand how different parameters work by making
% them interactive. Make sure you have the sound files from the assignment 
% loaded into the same directory, and that you wait until the first
% spectrogram loads. If you have any problems with running it, just type in
% 'guide' in the terminal and load the .fig version of this file.
% Enjoy!

function varargout = assignment10(varargin)
% ASSIGNMENT10 MATLAB code for assignment10.fig
%      ASSIGNMENT10, by itself, creates a new ASSIGNMENT10 or raises the existing
%      singleton*.
%
%      H = ASSIGNMENT10 returns the handle to a new ASSIGNMENT10 or the handle to
%      the existing singleton*.
%
%      ASSIGNMENT10('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in ASSIGNMENT10.M with the given input arguments.
%
%      ASSIGNMENT10('Property','Value',...) creates a new ASSIGNMENT10 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before assignment10_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to assignment10_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help assignment10

% Last Modified by GUIDE v2.5 07-May-2017 18:26:39

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @assignment10_OpeningFcn, ...
                   'gui_OutputFcn',  @assignment10_OutputFcn, ...
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


% --- Executes just before assignment10 is made visible.
function assignment10_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to assignment10 (see VARARGIN)

handles.soundData = load('Top_100_male_midwestern.mat');
% dataFields = fieldnames(handles.soundData); %get each word field and store it in a new object
window = hamming(8); 
overl = 7; 
ySubDivisions = [0:512];
sampleRate = 44100;

axes(handles.spectrogramPlot)
spectrogram(handles.soundData.i1,window,overl,ySubDivisions,sampleRate,'yaxis')

% Choose default command line output for assignment10
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes assignment10 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = assignment10_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in plotSpect.
function plotSpect_Callback(hObject, eventdata, handles)
% hObject    handle to plotSpect (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
windowSz = str2num(get(handles.windowSz,'String'));
overlapSize = str2num(get(handles.overlapSize,'String'));
sampleRate = str2num(get(handles.sampleRate,'String'));
subDivVal = str2num(get(handles.subdivisions,'String'));
ySubDivisions = [0:subDivVal];

if get(handles.hammingButton,'Value') == 1
	window = hamming(windowSz);
else
    window = kaiser(windowSz);
end

axes(handles.spectrogramPlot)
spectrogram(handles.soundData.i1,window,overlapSize,ySubDivisions,sampleRate,'yaxis')

guidata(hObject, handles);



function windowSz_Callback(hObject, eventdata, handles)
% hObject    handle to windowSz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of windowSz as text
%        str2double(get(hObject,'String')) returns contents of windowSz as a double


% --- Executes during object creation, after setting all properties.
function windowSz_CreateFcn(hObject, eventdata, handles)
% hObject    handle to windowSz (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function overlapSize_Callback(hObject, eventdata, handles)
% hObject    handle to overlapSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of overlapSize as text
%        str2double(get(hObject,'String')) returns contents of overlapSize as a double


% --- Executes during object creation, after setting all properties.
function overlapSize_CreateFcn(hObject, eventdata, handles)
% hObject    handle to overlapSize (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function sampleRate_Callback(hObject, eventdata, handles)
% hObject    handle to sampleRate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of sampleRate as text
%        str2double(get(hObject,'String')) returns contents of sampleRate as a double


% --- Executes during object creation, after setting all properties.
function sampleRate_CreateFcn(hObject, eventdata, handles)
% hObject    handle to sampleRate (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in hammingButton.
function hammingButton_Callback(hObject, eventdata, handles)
% hObject    handle to hammingButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of hammingButton


% --- Executes on button press in kaiserButton.
function kaiserButton_Callback(hObject, eventdata, handles)
% hObject    handle to kaiserButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of kaiserButton



function subdivisions_Callback(hObject, eventdata, handles)
% hObject    handle to subdivisions (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of subdivisions as text
%        str2double(get(hObject,'String')) returns contents of subdivisions as a double


% --- Executes during object creation, after setting all properties.
function subdivisions_CreateFcn(hObject, eventdata, handles)
% hObject    handle to subdivisions (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in hintButton.
function hintButton_Callback(hObject, eventdata, handles)
    set(handles.windowSz, 'String', '3600')
    set(handles.overlapSize, 'String', '3500')
    set(handles.sampleRate, 'String', '44100')
    set(handles.subdivisions, 'String', '8000')
% hObject    handle to hintButton (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
