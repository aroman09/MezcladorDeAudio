function varargout = GUIMezcla(varargin)
% GUIMezcla M-archivo for GUIMezcla.fig
%      GUIMezcla, by itself, creates a new GUIMezcla or raises the existing
%      singleton*.
%
%      H = GUIMezcla returns the handle to a new GUIMezcla or the handle to
%      the existing singleton*.
%
%      GUIMezcla('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in GUIMezcla.M with the given input arguments.
%
%      GUIMezcla('Property','Value',...) creates a new GUIMezcla or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before GUIMezcla_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to GUIMezcla_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help GUIMezcla

% Last Modified by GUIDE v2.5 04-Jul-2015 23:25:27

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @GUIMezcla_OpeningFcn, ...
                   'gui_OutputFcn',  @GUIMezcla_OutputFcn, ...
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


% --- Executes just before GUIMezcla is made visible.
function GUIMezcla_OpeningFcn(hObject, eventdata, handles, varargin)

s1 = 0;
s2 = 0;
mezcla = 0;
player1 = 0;
player2 = 0;
player3 = 0;

handles.s1 = s1;
handles.s2 = s2;
handles.mezcla = mezcla;
handles.player1 = player1;
handles.player2 = player2;
handles.player3 = player3;

imgplay1 = imread('Imagenes/play.png');
set(handles.play1,'CData',imgplay1);
imgstop1 = imread('Imagenes/stop.png');
set(handles.stop1,'CData',imgstop1);
imgpause1 = imread('Imagenes/pause.png');
set(handles.pause1,'CData',imgpause1);

imgplay2 = imread('Imagenes/play.png');
set(handles.play2,'CData',imgplay2);
imgstop2 = imread('Imagenes/stop.png');
set(handles.stop2,'CData',imgstop2);
imgpause2 = imread('Imagenes/pause.png');
set(handles.pause2,'CData',imgpause2);

imgplay3 = imread('Imagenes/play.png');
set(handles.play3,'CData',imgplay3);
imgstop3 = imread('Imagenes/stop.png');
set(handles.stop3,'CData',imgstop3);
imgpause3 = imread('Imagenes/pause.png');
set(handles.pause3,'CData',imgpause3);

axes(handles.axes6);
path = 'logomix.jpg';
img = imread(path);
imshow(img);
axis off;

%fondo = imread('Imagenes/fondoGUIMezcla.jpg');
%axes(handles.fondoGUIMezcla);
%axis off
%imshow(fondo);


handles.output = hObject;
guidata(hObject, handles);

% UIWAIT makes GUIMezcla wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = GUIMezcla_OutputFcn(hObject, eventdata, handles) 
varargout{1} = handles.output;


function sampleRate1_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function sampleRate1_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Resample1.
function Resample1_Callback(hObject, eventdata, handles)

s1 = handles.s1;
SR1 = get(handles.sampleRate1, 'String');
disp(SR1)
Fs1 = str2double(SR1);

if isnan(Fs1)
  errordlg('Debes ingresar un valor numerico!!','GUIMezcla')
  %uicontrol(hObject)
  return
else
    axes(handles.grafico1);
    plot(s1,'b')
    str = int2str(Fs1);
    mensaje = strcat(str,' Frecuencia de Muestreo');
    legend(mensaje)
    disp(length(s1));
    grid on  
    
    handles.Fs1 = Fs1;
    handles.s1 = s1;
    handles.player1 = audioplayer(s1,Fs1);
end

guidata(hObject,handles)


function sampleRate2_Callback(hObject, eventdata, handles)

% --- Executes during object creation, after setting all properties.
function sampleRate2_CreateFcn(hObject, eventdata, handles)

if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in Resample2.
function Resample2_Callback(hObject, eventdata, handles)

s2 = handles.s2;
SR2 = get(handles.sampleRate2, 'String');
Fs2 = str2double(SR2);

if isnan(Fs2)
  errordlg('Debes ingresar un valor numerico!!','GUIMezcla')
  %uicontrol(hObject)
  return
else
    axes(handles.grafico2);
    plot(s2,'r')
    str = int2str(Fs2);
    mensaje = strcat(str,' Frecuencia de Muestreo');
    legend(mensaje)
    disp(length(s2));
    grid on
    handles.Fs2 = Fs2;
    handles.s2 = s2;
    handles.player2 = audioplayer(s2,Fs2);
end

guidata(hObject,handles)


% --- Executes during object creation, after setting all properties.
function track1_CreateFcn(hObject, eventdata, handles)
% hObject    handle to track1 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called




%**********************
%   BOTONES DEL MENU
%**********************
function archivo_Callback(hObject, eventdata, handles)

function guardar_Callback(hObject, eventdata, handles)

function audio1_Callback(hObject, eventdata, handles)

function audio2_Callback(hObject, eventdata, handles)



function abrirAudio1_Callback(hObject, eventdata, handles)

[nombre1, directorio1] = uigetfile('*.wav', 'Abrir Wav');
if isequal(nombre1,0) || isequal(directorio1,0)
    return
end

cancion1 = fullfile(directorio1, nombre1);
[s1 Fs1] = wavread(cancion1);
s1 = s1(:,1);

axes(handles.grafico1);
plot(s1,'b')
str = int2str(Fs1);
mensaje = strcat(str,' Frecuencia de Muestreo');
legend(mensaje);
xlabel('Frecuencia de muestreo');
ylabel('Señal')
disp(length(s1));
disp(length(Fs1));
grid on

handles.s1 = s1;
handles.Fs1 = Fs1;
handles.player1 = audioplayer(s1,Fs1);
guidata(hObject,handles)

% --- Executes on button press in play1.
function play1_Callback(hObject, eventdata, handles)

if handles.s1 == 0
    errordlg('El audio 1 aun no se ha cargado', 'GUIMezcla');
elseif handles.stop1 == 1
    play(handles.player1);
else
    resume(handles.player1);
          
%     senial1 = handles.s1;
%     frecMuestreo1 = handles.Fs1;
%     wavplay(senial1,frecMuestreo1)
end


% --- Executes on button press in stop1.
function stop1_Callback(hObject, eventdata, handles)
if handles.s1 == 0
    errordlg('El audio #01 aun no se ha cargado', 'GUIMezcla');
else
    stop(handles.player1);
end


% --- Executes on button press in pause1.
function pause1_Callback(hObject, eventdata, handles)
if handles.s1 == 0
    errordlg('El audio 1 aun no se ha cargado', 'GUIMezcla');
else
    pause(handles.player1);
end


function abrirAudio2_Callback(hObject, eventdata, handles)

[nombre2, directorio2] = uigetfile('*.wav', 'Abrir Wav');
if isequal(nombre2,0) || isequal(directorio2,0)
	return
end
cancion2 = fullfile(directorio2, nombre2);
[s2 Fs2] = wavread(cancion2);
s2 = s2(:,1);

axes(handles.grafico2);
plot(s2,'r')
str = int2str(Fs2);
mensaje = strcat(str,' Frecuencia de Muestreo');
legend(mensaje)
disp(length(s2));
xlabel('Frecuencia de muestreo');
ylabel('Señal')
grid on

handles.s2 = s2;
handles.Fs2 = Fs2;
handles.player2 = audioplayer(s2,Fs2);

guidata(hObject,handles)

% --- Executes on button press in play2.
function play2_Callback(hObject, eventdata, handles)

if handles.s2 == 0
    errordlg('El audio 2 aun no se ha cargado', 'GUIMezcla');
elseif handles.stop2 == 1
    play(handles.player2);
else
    resume(handles.player2);
end


% --- Executes on button press in stop2.
function stop2_Callback(hObject, eventdata, handles)

if handles.s2 == 0
    errordlg('El audio 2 aun no se ha cargado', 'GUIMezcla');
else
    stop(handles.player2);
end


% --- Executes on button press in pause2.
function pause2_Callback(hObject, eventdata, handles)

if handles.s2 == 0
    errordlg('El audio 2 aun no se ha cargado', 'GUIMezcla');
else
    pause(handles.player2);
end


function grabarAudio1_Callback(hObject, eventdata, handles)

%Abrimos la ventana Edicion
GrabarAudio
uiwait

global tiempo

time = str2double(tiempo);
fs = 44100;
y = audiorecorder(time*fs,8,1);
 recordblocking(y,time);
y = y.getaudiodata();
wavwrite(y, fs, uiputfile({'*.wav'},'Guardar como'));

axes(handles.grafico1);
plot(y,'b')
str = int2str(fs);
mensaje = strcat(str,' Frecuencia de Muestreo');
legend(mensaje);
xlabel('Frecuencia de muestreo');
ylabel('Señal')
disp(length(y));
disp(length(fs));
grid on

set(handles.nombreAudio1,'String',strcat('---','audioGrabado1','---'));

handles.s1 = y;
handles.Fs1 = fs;

handles.player1 = audioplayer(y,fs);
guidata(hObject,handles)

function grabarAudio2_Callback(hObject, eventdata, handles)

%Abrimos la ventana Edicion
GrabarAudio
uiwait

global tiempo

time = str2double(tiempo);
fs = 44100;
y = audiorecorder(time*fs, 24,1);
wavwrite(y, fs, uiputfile({'*.wav'},'Guardar como'));

axes(handles.grafico2);
plot(y,'r')
str = int2str(fs);
mensaje = strcat(str,' Frecuencia de Muestreo');
legend(mensaje);
xlabel('Frecuencia de muestreo');
ylabel('Señal')
disp(length(y));
disp(length(fs));
grid on

set(handles.nombreAudio2,'String',strcat('---','audioGrabado2','---'));

handles.s2 = y;
handles.Fs2 = fs;

handles.player2 = audioplayer(y,fs);
guidata(hObject,handles)


% --------------------------------------------------------------------
function funciones_Callback(hObject, eventdata, handles)

function editar_Callback(hObject, eventdata, handles)



% --------------------------------------------------------------------
function funcionMezclar_Callback(hObject, eventdata, handles)

global senialMezcla frecMuestreoMezcla

if handles.s1 == 0
    errordlg('No hay audios cargados. No se puede mezclar !!!', 'GUIMezcla');
elseif handles.s2 == 0
    errordlg('No hay audios cargados. No se puede mezclar !!!', 'GUIMezcla');
else
    senial1 = handles.s1;
    senial2 = handles.s2;
    frecMuestreo1 = handles.Fs1;
    frecMuestreo2 = handles.Fs2;
    
    if frecMuestreo1 == frecMuestreo2
        
        m = min(length(senial1), length(senial2));
        mezcla = senial1(1:m) + senial2(1:m);

        str = int2str(frecMuestreo1);
        mensaje = strcat(str,' Frecuencia de Muestreo');
        axes(handles.grafico3)
        plot(mezcla,'g')
        disp(length(mezcla));
        legend(mensaje)
        xlabel('Frecuencia de muestreo');
        ylabel('Señal');
        grid on
        
        handles.mezcla = mezcla;
        handles.frecMuestreo1 = frecMuestreo1;
        handles.player3 = audioplayer(mezcla,frecMuestreo1);
        
        
        senialMezcla = mezcla;
        frecMuestreoMezcla = frecMuestreo1;
    else
        errordlg('Frecuencias de Muestreo distintas. No se puede mezclar !!!', 'GUIMezcla');
    end
end

guidata(hObject,handles)


% --- Executes on button press in play3.
function play3_Callback(hObject, eventdata, handles)

if handles.mezcla == 0
    errordlg('Aun no se han mezclado los tracks!!!', 'GUIMezcla');
elseif handles.stop3 == 1
    play(handles.player3);
else
    resume(handles.player3);
end



% --- Executes on button press in stop3.
function stop3_Callback(hObject, eventdata, handles)

if handles.mezcla == 0
    errordlg('Aun no se han mezclado los tracks!!!', 'GUIMezcla');
else
    stop(handles.player3);
end


% --- Executes on button press in pause3.
function pause3_Callback(hObject, eventdata, handles)
if handles.mezcla == 0
    errordlg('Aun no se han mezclado los tracks!!!', 'GUIMezcla');
else
    pause(handles.player3);
end



% --------------------------------------------------------------------
function exportarMezcla_Callback(hObject, eventdata, handles)

if handles.mezcla == 0
    errordlg('No existe la mezcla, por lo tanto no se puede exportar!!!', 'GUIMezcla');
else
    senial3 = handles.mezcla;
    frecMuestreo3 = handles.frecMuestreo1;
    
    [file, path] = uiputfile('*.wav','Exportar como');
    wavwrite(senial3, frecMuestreo3, 32, strcat(path, '/', file));
    
    msgbox('El Track ha sido exportado con éxito!!!','GUIMezcla');
end


% --------------------------------------------------------------------
function funcionFiltro_Callback(hObject, eventdata, handles)

if handles.mezcla == 0
    errordlg('No existe la mezcla. Aun no se puede poner filtros!!!', 'GUIMezcla');
else
    
    Filtros

    uiwait

    global senialNueva frecMuestreoNueva

    str = int2str(frecMuestreoNueva);
    mensaje = strcat(str,' Frecuencia de Muestreo Filtrada');
    axes(handles.grafico3)
    plot(senialNueva,'g')
    legend(mensaje)
    xlabel('Frecuencia de Muestreo Filtrada');
    ylabel('Señal Muestreada');
    grid on

    handles.mezcla = senialNueva;
    handles.frecMuestreo1 = frecMuestreoNueva;
    handles.player3 = audioplayer(senialNueva,frecMuestreoNueva);
end

guidata(hObject,handles)        

% --------------------------------------------------------------------
function graficaFrecuencias_Callback(hObject, eventdata, handles)

if handles.s1 == 0
    errordlg('El audio #01 aun no se ha cargado', 'GUIMezcla');
else
    axes(handles.grafico1);
    plot(handles.s1,'b')
    str1 = int2str(handles.Fs1);
    mensaje1 = strcat(str1,' Frecuencia de Muestreo');
    legend(mensaje1)
    xlabel('Frecuencia de muestreo');
    ylabel('Señal')
    grid on
end

if handles.s2 == 0
    errordlg('El audio #02 aun no se ha cargado', 'GUIMezcla');
else
    axes(handles.grafico2);
    plot(handles.s2,'r')
    str2 = int2str(handles.Fs2);
    mensaje2 = strcat(str2,' Frecuencia de Muestreo');
    legend(mensaje2)
    xlabel('Frecuencia de muestreo');
    ylabel('Señal')
    grid on
end

if handles.mezcla == 0
    errordlg('La mezcla aun no se ha cargado', 'GUIMezcla');
else
    axes(handles.grafico3)
    str3 = int2str(handles.frecMuestreo1);
    mensaje3 = strcat(str3,' Frecuencia de Muestreo');
    plot(handles.mezcla,'g')
    legend(mensaje3)
    disp(length(handles.mezcla));
    xlabel('Frecuencia de muestreo');
    ylabel('Señal');
    grid on
end

% --------------------------------------------------------------------
function graficaTiempo_Callback(hObject, eventdata, handles)

if handles.s1 == 0
    errordlg('El audio #01 aun no se ha cargado', 'GUIMezcla');
else
    
    tiempo1 = size(handles.s1,1)/handles.Fs1;
    t1 = 0:1/handles.Fs1:tiempo1;
    axes(handles.grafico1);
    plot(t1(2:end), handles.s1,'b')
    xlim([0 tiempo1]);

    str1 = num2str(tiempo1);
    mensaje1 = strcat(str1,' Tiempo en Segundos');
    legend(mensaje1)
    xlabel('tiempo (s)');
    ylabel('Señal')
    grid on
end

if handles.s2 == 0
    errordlg('El audio #02 aun no se ha cargado', 'GUIMezcla');
else
    tiempo2 = size(handles.s2,1)/handles.Fs2;
    t2 = 0:1/handles.Fs2:tiempo2;
    axes(handles.grafico2);
    plot(t2(2:end), handles.s2,'r')
    xlim([0 tiempo2]);

    str2 = num2str(tiempo2);
    mensaje2 = strcat(str2,' Tiempo en Segundos');
    legend(mensaje2)
    xlabel('tiempo (s)');
    ylabel('Señal')
    grid on
end

if handles.mezcla == 0
    errordlg('El audio mezcla aun no se ha cargado', 'GUIMezcla');
else
    tiempo3 = size(handles.mezcla,1)/(handles.frecMuestreo1);
    t3 = 0:1/handles.frecMuestreo1:tiempo3;
    axes(handles.grafico3);
    plot(t3(2:end), handles.mezcla,'g')
    xlim([0 tiempo3]);

    str3 = num2str(tiempo3);
    mensaje3 = strcat(str3,' Tiempo en Segundos');
    legend(mensaje3)
    xlabel('tiempo (s)');
    ylabel('Señal')
    grid on
end

% --------------------------------------------------------------------
function graficaEspectro_Callback(hObject, eventdata, handles)

if handles.s1 == 0
    errordlg('El audio #01 aun no se ha cargado', 'GUIMezcla');
else
    y1 = fft(handles.s1);
    pot1 = y1.*conj(y1);
    espectroFrec1 = (100:3000);
    axes(handles.grafico1);
    plot(espectroFrec1, pot1(1:2901),'b')
    disp('Potencia Maxima1: ')
    disp(max(pot1));
    xlabel('Espectro de Frecuencia');
    ylabel('Potencia de la Señal');
    grid on
end

if handles.s2 == 0
    errordlg('El audio #02 aun no se ha cargado', 'GUIMezcla');
else
    y2 = fft(handles.s2);
    pot2 = y2.*conj(y2);
    espectroFrec2 = (100:3000);
    axes(handles.grafico2);
    plot(espectroFrec2, pot2(1:2901),'r')
    disp('Potencia Maxima2: ')
    disp(max(pot2));
    xlabel('Espectro de Frecuencia');
    ylabel('Potencia de la Señal');
    grid on
end

if handles.mezcla == 0
    errordlg('El audio mezcla aun no se ha cargado', 'GUIMezcla');
else
    y3 = fft(handles.mezcla);
    pot3 = y3.*conj(y3);
    espectroFrec3 = (100:3000);
    axes(handles.grafico3);
    plot(espectroFrec3, pot3(1:2901),'g')
    disp('Potencia Maxima3: ')
    disp(max(pot3));
    xlabel('Espectro de Frecuencia');
    ylabel('Potencia de la Señal');
    grid on
end

% --------------------------------------------------------------------
function editarAudio1_Callback(hObject, eventdata, handles)

%Abrimos la ventana Edicion
Edicion

uiwait

global tiempoInicio tiempoFin

tiempoTotal = size(handles.s1,1)/handles.Fs1;

tiempo = roundn(tiempoTotal,-2);
disp(tiempo);

tiempoInicio = str2double(tiempoInicio);
tiempoFin = str2double(tiempoFin);

t1 = round(size(handles.s1,1) * tiempoInicio / tiempoTotal);
t2 = round(size(handles.s1,1) * tiempoFin / tiempoTotal);

for i = t1:t2
    handles.s1(i,1) = 0;
    %handles.s1(i,2) = 0;
end

axes(handles.grafico1);
plot(handles.s1,'b');
str1 = int2str(handles.Fs1);
mensaje1 = strcat(str1,' Frecuencia de Muestreo');
legend(mensaje1)
xlabel('Frecuencia de muestreo');
ylabel('Señal')
grid on

handles.s1 = handles.s1;
handles.player1 = audioplayer(handles.s1,handles.Fs1);
        
guidata(hObject,handles)

% --------------------------------------------------------------------
function editarAudio2_Callback(hObject, eventdata, handles)

Edicion

uiwait

global tiempoInicio tiempoFin

tiempoTotal = size(handles.s2,1)/handles.Fs2;

tiempo = roundn(tiempoTotal,-2);
disp(tiempo);

tiempoInicio = str2double(tiempoInicio);
tiempoFin = str2double(tiempoFin);

t1 = round(size(handles.s2,1) * tiempoInicio / tiempoTotal);
t2 = round(size(handles.s2,1) * tiempoFin / tiempoTotal);

for i = t1:t2
    handles.s2(i,1) = 0;
    %handles.s2(i,2) = 0;
end

axes(handles.grafico2);
plot(handles.s2,'r');
str1 = int2str(handles.Fs2);
mensaje1 = strcat(str1,' Frecuencia de Muestreo');
legend(mensaje1)
xlabel('Frecuencia de muestreo');
ylabel('Señal')
grid on

handles.s2 = handles.s2;
handles.player2 = audioplayer(handles.s2,handles.Fs2);
        
guidata(hObject,handles)




% --- Executes when user attempts to close figure1.
function figure1_CloseRequestFcn(hObject, eventdata, handles)

opc = questdlg('¿Desea Salir del Programa?', 'SALIR', 'Si', 'No', 'No');
if strcmp(opc, 'No');
    return;
end
delete(hObject);
