function varargout = Edicion(varargin)
% EDICION M-file for Edicion.fig
%      EDICION, by itself, creates a new EDICION or raises the existing
%      singleton*.
%
%      H = EDICION returns the handle to a new EDICION or the handle to
%      the existing singleton*.
%
%      EDICION('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in EDICION.M with the given input arguments.
%
%      EDICION('Property','Value',...) creates a new EDICION or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Edicion_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Edicion_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Edicion

% Last Modified by GUIDE v2.5 09-Jul-2015 16:04:55

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Edicion_OpeningFcn, ...
                   'gui_OutputFcn',  @Edicion_OutputFcn, ...
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


% --- Executes just before Edicion is made visible.
function Edicion_OpeningFcn(hObject, eventdata, handles, varargin)

fondo = imread('Imagenes/fondoEdicion.jpg');
axes(handles.axes1);
axis off
imshow(fondo);

handles.output = hObject;
guidata(hObject, handles);


% --- Outputs from this function are returned to the command line.
function varargout = Edicion_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;


% --- Executes during object creation, after setting all properties.
function tiempoInicial_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes during object creation, after setting all properties.
function tiempoFinal_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function tiempoInicial_Callback(hObject, eventdata, handles)

function tiempoFinal_Callback(hObject, eventdata, handles)


% --- Executes on button press in botonCortar.
function botonCortar_Callback(hObject, eventdata, handles)

global tiempoInicio tiempoFin

tiempoInicio = get(handles.tiempoInicial, 'String');
tiempoFin = get(handles.tiempoFinal, 'String');

tI = str2double(tiempoInicio);
tF = str2double(tiempoFin);

if isnan(tI) || isnan(tF)
  errordlg('Debes ingresar un valor numerico!!','Edicion')
  %uicontrol(hObject)
  return
else
    Aplicacion
    close Edicion
end
