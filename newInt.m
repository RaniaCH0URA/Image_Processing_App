function varargout = newInt(varargin)
% NEWINT MATLAB code for newInt.fig
%      NEWINT, by itself, creates a new NEWINT or raises the existing
%      singleton*.
%
%      H = NEWINT returns the handle to a new NEWINT or the handle to
%      the existing singleton*.
%
%      NEWINT('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in NEWINT.M with the given input arguments.
%
%      NEWINT('Property','Value',...) creates a new NEWINT or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before newInt_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to newInt_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help newInt

% Last Modified by GUIDE v2.5 03-Mar-2023 00:39:40

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @newInt_OpeningFcn, ...
                   'gui_OutputFcn',  @newInt_OutputFcn, ...
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


% --- Executes just before newInt is made visible.
function newInt_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to newInt (see VARARGIN)

% Choose default command line output for newInt
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes newInt wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = newInt_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in pushbutton1.
function pushbutton1_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
[filename,pathname] = uigetfile({'*.jpg;*.jpeg;*.png;*.bmp;*.tif;*.tiff','Image Files'},'Sélectionnez une image');

% Si l'utilisateur a sélectionné une image, affichez-la
if ~isequal(filename,0)
    image_path = fullfile(pathname,filename);
    imshow(image_path,'Parent',handles.axes1);
end


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
im = getimage(handles.axes1);

% Obtenez la taille de l'image
sz = size(im);

% Affichez la taille de l'image dans la zone de texte "text1"
set(handles.text1,'String',sprintf('%d x %d',sz(1),sz(2)));




% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im;
im= getimage(handles.axes1);
sz = size(im);
for i=1:sz(1)
    for j=1:sz(2)
        img_inverse(i,j)=255-im(i,j);
    end
imshow(img_inverse,'Parent',handles.axes2);
end


%%%%%




% --- Executes on button press in Bloc d'image.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% Obtenez l'image affichée dans l'axe 1
im = getimage(handles.axes1);

% Utilisez la fonction imcrop pour extraire un bloc de l'image
cropped_im = imcrop(im);

% Affichez le bloc extrait dans l'axe 2
imshow(cropped_im, 'Parent', handles.axes3);

% --- Executes on button press in pushbutton4. Next
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global im;
im = getimage(handles.axes1);
uicontrol(page2);
