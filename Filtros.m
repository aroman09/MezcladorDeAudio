function varargout = Filtros(varargin)
% FILTROS M-file for Filtros.fig
%      FILTROS, by itself, creates a new FILTROS or raises the existing
%      singleton*.
%
%      H = FILTROS returns the handle to a new FILTROS or the handle to
%      the existing singleton*.
%
%      FILTROS('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FILTROS.M with the given input arguments.
%
%      FILTROS('Property','Value',...) creates a new FILTROS or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Filtros_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Filtros_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Filtros

% Last Modified by GUIDE v2.5 09-Jul-2015 15:00:49

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Filtros_OpeningFcn, ...
                   'gui_OutputFcn',  @Filtros_OutputFcn, ...
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


% --- Executes just before Filtros is made visible.
function Filtros_OpeningFcn(hObject, eventdata, handles, varargin)

senialFiltro = 0;
playerFiltro = 0;

handles.senialFiltro = senialFiltro;
handles.playerFiltro = playerFiltro;

fondo = imread('Imagenes/filtroo.jpg');
axes(handles.graficaFiltro);
axis off
imshow(fondo);

imgplayFiltro = imread('Imagenes/play.png');
set(handles.playFiltro,'CData',imgplayFiltro);
imgstopFiltro = imread('Imagenes/stop.png');
set(handles.stopFiltro,'CData',imgstopFiltro);
imgpauseFiltro = imread('Imagenes/pause.png');
set(handles.pauseFiltro,'CData',imgpauseFiltro);

axes(handles.axes4);
path = 'logomix.jpg';
img = imread(path);
imshow(img);
axis off;
% Choose default command line output for Filtros
handles.output = hObject;
% Update handles structure
guidata(hObject, handles);




% --- Outputs from this function are returned to the command line.
function varargout = Filtros_OutputFcn(hObject, eventdata, handles) 

varargout{1} = handles.output;



function editFrec1_Callback(hObject, eventdata, handles)


% --- Executes during object creation, after setting all properties.
function editFrec1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editFrec1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


function editFrec2_Callback(hObject, eventdata, handles)



% --- Executes during object creation, after setting all properties.
function editFrec2_CreateFcn(hObject, eventdata, handles)
% hObject    handle to editFrec2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in botonPasaBajo.
function botonPasaBajo_Callback(hObject, eventdata, handles)

global senialMezcla frecMuestreoMezcla

set(handles.botonPasaBajo,'ForegroundColor', [0.941 0.941 0.941]);
set(handles.botonPasaBajo,'BackgroundColor', [1.0 0.686 0.0]);
set(handles.botonPasaAlto,'ForegroundColor', [0.0 0.0 0.0]);
set(handles.botonPasaAlto,'BackgroundColor', [0.941 0.941 0.941]);
set(handles.botonPasaBanda,'ForegroundColor', [0.0 0.0 0.0]);
set(handles.botonPasaBanda,'BackgroundColor', [0.941 0.941 0.941]);
set(handles.botonRechazaBanda,'ForegroundColor', [0.0 0.0 0.0]);
set(handles.botonRechazaBanda,'BackgroundColor', [0.941 0.941 0.941]);

if senialMezcla == 0
    errordlg('No se han cargado el track!!!', 'Filtros');
else
    
    senialFiltro = senialMezcla;
    frecMuestreoFiltro = frecMuestreoMezcla;
    
    y = senialFiltro';
    Rp = 3;
    Rs = 60;
    Fs = frecMuestreoFiltro;
    Ws = 2000 / Fs;
    Wp = 1000 / Fs;
    [n,Wn] = buttord(Wp,Ws,Rp,Rs,'s');
    [b,a] = butter(n,Wn,'low');
    y_Bajo = filter(b, a, y);       %Filtro de la señal
    
    handles.playerFiltro = audioplayer(y_Bajo,Fs);
end

handles.senialFiltro = y_Bajo;
handles.frecMuestreoFiltro = Fs;

grafico = imread('Imagenes/LowPass.jpg');
axes(handles.graficaFiltro);
axis off
imshow(grafico);

guidata(hObject, handles);


% --- Executes on button press in botonPasaAlto.
function botonPasaAlto_Callback(hObject, eventdata, handles)

global senialMezcla frecMuestreoMezcla

set(handles.botonPasaBajo,'ForegroundColor', [0.0 0.0 0.]);
set(handles.botonPasaBajo,'BackgroundColor', [0.941 0.941 0.941]);
set(handles.botonPasaAlto,'ForegroundColor', [0.941 0.941 0.941]);
set(handles.botonPasaAlto,'BackgroundColor', [1.0 0.686 0.0]);
set(handles.botonPasaBanda,'ForegroundColor', [0.0 0.0 0.0]);
set(handles.botonPasaBanda,'BackgroundColor', [0.941 0.941 0.941]);
set(handles.botonRechazaBanda,'ForegroundColor', [0.0 0.0 0.0]);
set(handles.botonRechazaBanda,'BackgroundColor', [0.941 0.941 0.941]);

if senialMezcla == 0
    errordlg('No se han cargado el track!!!', 'Filtros');
else
    
    senialFiltro = senialMezcla;
    frecMuestreoFiltro = frecMuestreoMezcla;
    
    y = senialFiltro';
    Rp = 3;
    Rs = 60;
    Fs = frecMuestreoFiltro;
    Ws = 2000 / Fs;
    Wp = 1000 / Fs;
    [n,Wn] = buttord(Wp,Ws,Rp,Rs,'s');
    [b,a] = butter(n,Wn,'high');
    y_Alto = filter(b, a, y);       %Filtro de la señal
    
    handles.playerFiltro = audioplayer(y_Alto,Fs);
end

handles.senialFiltro = y_Alto;
handles.frecMuestreoFiltro = Fs;

grafico = imread('Imagenes/HighPass.jpg');
axes(handles.graficaFiltro);
axis off
imshow(grafico);

guidata(hObject, handles);



% --- Executes on button press in botonPasaBanda.
function botonPasaBanda_Callback(hObject, eventdata, handles)

global senialMezcla frecMuestreoMezcla

set(handles.botonPasaBajo,'ForegroundColor', [0.0 0.0 0.0]);
set(handles.botonPasaBajo,'BackgroundColor', [0.941 0.941 0.941]);
set(handles.botonPasaAlto,'ForegroundColor', [0.0 0.0 0.0]);
set(handles.botonPasaAlto,'BackgroundColor', [0.941 0.941 0.941]);
set(handles.botonPasaBanda,'ForegroundColor', [0.941 0.941 0.941]);
set(handles.botonPasaBanda,'BackgroundColor', [1.0 0.686 0.0]);
set(handles.botonRechazaBanda,'ForegroundColor', [0.0 0.0 0.0]);
set(handles.botonRechazaBanda,'BackgroundColor', [0.941 0.941 0.941]);

if senialMezcla == 0
    errordlg('No se han cargado el track!!!', 'Filtros');
else
    
    senialFiltro = senialMezcla;
    frecMuestreoFiltro = frecMuestreoMezcla;
    
    y = senialFiltro';
    Rp = 3;
    Rs = 60;
    Fs = frecMuestreoFiltro;
    Fnyquist = Fs / 2;
    Ws = [3000 12000] / Fnyquist;
    Wp = [5000 10000] / Fnyquist;
    [n,Wn] = buttord(Wp,Ws,Rp,Rs,'s');
    [b,a] = butter(n, Wn);
    y_Banda = filter(b, a, y);       %Filtro de la señal
    
    handles.playerFiltro = audioplayer(y_Banda,Fs);
end

handles.senialFiltro = y_Banda;
handles.frecMuestreoFiltro = Fs;

grafico = imread('Imagenes/BandPass.jpg');
axes(handles.graficaFiltro);
axis off
imshow(grafico);

guidata(hObject, handles);


% --- Executes on button press in botonRechazaBanda.
function botonRechazaBanda_Callback(hObject, eventdata, handles)

global senialMezcla frecMuestreoMezcla

set(handles.botonPasaBajo,'ForegroundColor', [0.0 0.0 0.0]);
set(handles.botonPasaBajo,'BackgroundColor', [0.941 0.941 0.941]);
set(handles.botonPasaAlto,'ForegroundColor', [0.0 0.0 0.0]);
set(handles.botonPasaAlto,'BackgroundColor', [0.941 0.941 0.941]);
set(handles.botonPasaBanda,'ForegroundColor', [0.0 0.0 0.0]);
set(handles.botonPasaBanda,'BackgroundColor', [0.941 0.941 0.941]);
set(handles.botonRechazaBanda,'ForegroundColor', [0.941 0.941 0.941]);
set(handles.botonRechazaBanda,'BackgroundColor', [1.0 0.686 0.0]);

if senialMezcla == 0
    errordlg('No se han cargado el track!!!', 'Filtros');
else
    
    senialFiltro = senialMezcla;
    frecMuestreoFiltro = frecMuestreoMezcla;
    
    y = senialFiltro';
    Rp = 3;
    Rs = 60;
    Fs = frecMuestreoFiltro;
    Fnyquist = Fs / 2;
    Ws = [3000 12000] / Fnyquist;
    Wp = [5000 10000] / Fnyquist;
    [n,Wn] = buttord(Wp,Ws,Rp,Rs,'s');
    [b,a] = butter(n, Wn, 'stop');
    y_Rechazo = filter(b, a, y);       %Filtro de la señal
    
    handles.playerFiltro = audioplayer(y_Rechazo,Fs);
end

handles.senialFiltro = y_Rechazo;
handles.frecMuestreoFiltro = Fs;

grafico = imread('Imagenes/RechazoBanda.jpg');
axes(handles.graficaFiltro);
axis off
imshow(grafico);

guidata(hObject, handles);



% --- Executes on button press in playFiltro.
function playFiltro_Callback(hObject, eventdata, handles)

if handles.senialFiltro == 0
    errordlg('No se han cargado el track!!!', 'Filtros');
elseif handles.stopFiltro == 1
    play(handles.playerFiltro);
else
    resume(handles.playerFiltro);
end


% --- Executes on button press in stopFiltro.
function stopFiltro_Callback(hObject, eventdata, handles)

if handles.senialFiltro == 0
    errordlg('No se han cargado el track!!!', 'Filtros');
else
    stop(handles.playerFiltro);
end


% --- Executes on button press in pauseFiltro.
function pauseFiltro_Callback(hObject, eventdata, handles)

if handles.senialFiltro == 0
    errordlg('No se han cargado el track!!!', 'Filtros');
else
    pause(handles.playerFiltro);
end

% --- Executes on button press in botonFiltrar.
function botonFiltrar_Callback(hObject, eventdata, handles)

global senialNueva frecMuestreoNueva

senialNueva = handles.senialFiltro;
frecMuestreoNueva = handles.frecMuestreoFiltro;

Aplicacion

close Filtros
