function varargout = Page5(varargin)
% PAGE5 MATLAB code for Page5.fig
%      PAGE5, by itself, creates a new PAGE5 or raises the existing
%      singleton*.
%
%      H = PAGE5 returns the handle to a new PAGE5 or the handle to
%      the existing singleton*.
%
%      PAGE5('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in PAGE5.M with the given input arguments.
%
%      PAGE5('Property','Value',...) creates a new PAGE5 or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Page5_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Page5_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Page5

% Last Modified by GUIDE v2.5 05-Mar-2023 21:07:10

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Page5_OpeningFcn, ...
                   'gui_OutputFcn',  @Page5_OutputFcn, ...
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


% --- Executes just before Page5 is made visible.
function Page5_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Page5 (see VARARGIN)

% Choose default command line output for Page5
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Page5 wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Page5_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in radiobutton1.
function radiobutton1_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton1
global im;
%global f_med;
global f_moy1;
valeur = psnr(f_moy1,im);
set(handles.psnr, 'String', sprintf('%0.4f dB', valeur));
if valeur > 30 
    set(handles.msg, 'String', sprintf('Image de bonne qualité'));
else 
     set(handles.msg, 'String', sprintf('Image de mauvaise qualité'));
end



function psnr_Callback(hObject, eventdata, handles)
% hObject    handle to psnr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of psnr as text
%        str2double(get(hObject,'String')) returns contents of psnr as a double


% --- Executes during object creation, after setting all properties.
function psnr_CreateFcn(hObject, eventdata, handles)
% hObject    handle to psnr (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function msg_Callback(hObject, eventdata, handles)
% hObject    handle to msg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of msg as text
%        str2double(get(hObject,'String')) returns contents of msg as a double


% --- Executes during object creation, after setting all properties.
function msg_CreateFcn(hObject, eventdata, handles)
% hObject    handle to msg (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Spec_f_moy.
function Spec_f_moy_Callback(hObject, eventdata, handles)
% hObject    handle to Spec_f_moy (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Spec_f_moy
global im;
%global f_med;
global f_moy2;
conv_f=im2uint8(f_moy2);
valeur = psnr(conv_f,im);
set(handles.psnr, 'String', sprintf('%0.4f dB', valeur));
if valeur > 30 
    set(handles.msg, 'String', sprintf('Image de bonne qualité'));
else 
     set(handles.msg, 'String', sprintf('Image de mauvaise qualité'));
end


% --- Executes on button press in radiobutton3.
function radiobutton3_Callback(hObject, eventdata, handles)
% hObject    handle to radiobutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of radiobutton3
global im;
global f_med1;
valeur = psnr(f_med1,im);
set(handles.psnr, 'String', sprintf('%0.4f dB', valeur));
if valeur > 30 
    set(handles.msg, 'String', sprintf('Image de bonne qualité'));
else 
     set(handles.msg, 'String', sprintf('Image de mauvaise qualité'));
end


% --- Executes on button press in Spe_f_med.
function Spe_f_med_Callback(hObject, eventdata, handles)
% hObject    handle to Spe_f_med (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hint: get(hObject,'Value') returns toggle state of Spe_f_med
global im;
global f_med2;
conv_f=im2uint8(f_med2);
valeur = psnr(conv_f,im);
set(handles.psnr, 'String', sprintf('%0.4f dB', valeur));
if valeur > 30 
    set(handles.msg, 'String', sprintf('Image de bonne qualité'));
else 
     set(handles.msg, 'String', sprintf('Image de mauvaise qualité'));
end


% --- Executes on button press in Previous.
function Previous_Callback(hObject, eventdata, handles)
% hObject    handle to Previous (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
uicontrol(page4);
