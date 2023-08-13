function varargout = TeksimAntrianGUI(varargin)
% TEKSIMANTRIANGUI MATLAB code for TeksimAntrianGUI.fig
%      TEKSIMANTRIANGUI, by itself, creates a new TEKSIMANTRIANGUI or raises the existing
%      singleton*.
%
%      H = TEKSIMANTRIANGUI returns the handle to a new TEKSIMANTRIANGUI or the handle to
%      the existing singleton*.
%
%      TEKSIMANTRIANGUI('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in TEKSIMANTRIANGUI.M with the given input arguments.
%
%      TEKSIMANTRIANGUI('Property','Value',...) creates a new TEKSIMANTRIANGUI or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before TeksimAntrianGUI_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to TeksimAntrianGUI_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help TeksimAntrianGUI

% Last Modified by GUIDE v2.5 01-Dec-2021 06:49:09

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @TeksimAntrianGUI_OpeningFcn, ...
                   'gui_OutputFcn',  @TeksimAntrianGUI_OutputFcn, ...
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


% --- Executes just before TeksimAntrianGUI is made visible.
function TeksimAntrianGUI_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to TeksimAntrianGUI (see VARARGIN)

% Choose default command line output for TeksimAntrianGUI
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes TeksimAntrianGUI wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = TeksimAntrianGUI_OutputFcn(hObject, eventdata, handles) 
% varargout  cell array for returning output args (see VARARGOUT);
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Get default command line output from handles structure
varargout{1} = handles.output;


% --- Executes on button press in BtnKeluar.
function BtnKeluar_Callback(hObject, eventdata, handles)
% hObject    handle to BtnKeluar (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
close
clear
clc



function TxtRataJumlah_Callback(hObject, eventdata, handles)
% hObject    handle to TxtRataJumlah (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TxtRataJumlah as text
%        str2double(get(hObject,'String')) returns contents of TxtRataJumlah as a double


% --- Executes during object creation, after setting all properties.
function TxtRataJumlah_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TxtRataJumlah (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function TxtRataWaktu_Callback(hObject, eventdata, handles)
% hObject    handle to TxtRataWaktu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TxtRataWaktu as text
%        str2double(get(hObject,'String')) returns contents of TxtRataWaktu as a double


% --- Executes during object creation, after setting all properties.
function TxtRataWaktu_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TxtRataWaktu (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in BtnHasil.
function BtnHasil_Callback(hObject, eventdata, handles)
% hObject    handle to BtnHasil (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
x = str2num(get(handles.TxtKastemer,'string'));
t1 = str2num(get(handles.TxtRataDatang,'string'));
t2 = str2num(get(handles.TxtRataLayanan,'string'));

Arrival=x;

WaitNextArrival=zeros(1,x);
for i=1:x
    u=rand();
    WaitNextArrival(i)= -t1*log(u);%variabel acak dist eksponensial 
end

Service=zeros(1,x);
for i=1:x
    u=rand();
    Service(i)= -t2*log(u);%variabel acak dist eksponensial 
end

%tabel
row=x+1;
column=2;
isi=[transpose(WaitNextArrival) transpose(Service)]
judul=["Waktu Antar Kedatangan" "Lama Waktu Pelayanan"]
num=linspace(1,x,x);
set(handles.TableData,'data',isi,'ColumnName',judul,'RowName',num);
set(handles.TableData,'Userdata',isi);

N=0;
T=0;
S=0;%kesibukan server
Ts=inf;%inisialisasi nilai awal service time
Ta=0;%waktu datang kastemer pertama
K=0;
Tn=0;

j=1; i=1;
while(j<=length(Service))
    if N>=1 && S==0
        Ts=T+Service(j);
        j=j+1;
        S=1;
    end
    if Ta<Ts
        Tn=Tn+(Ta-T)*N;
        T=Ta; N=N+1; K=K+1;
        Ta=T+WaitNextArrival(i);
        i=i+1;
        if i>length(WaitNextArrival)
            Ta=inf;
        end
    elseif Ta>Ts
        Tn=Tn+(Ts-T)*N;
        T=Ts; N=N-1; S=0;
        Ts=inf;
    end
end
n=Tn/T;
w=Tn/K;

set(handles.TxtRataJumlah,'string',n);
set(handles.TxtRataWaktu,'string',w);

% --- Executes on button press in BtnClear.
function BtnClear_Callback(hObject, eventdata, handles)
% hObject    handle to BtnClear (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


function TxtKastemer_Callback(hObject, eventdata, handles)
% hObject    handle to TxtKastemer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% Hints: get(hObject,'String') returns contents of TxtKastemer as text
%        str2double(get(hObject,'String')) returns contents of TxtKastemer as a double


% --- Executes during object creation, after setting all properties.
function TxtKastemer_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TxtKastemer (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function TxtRataDatang_Callback(hObject, eventdata, handles)
% hObject    handle to TxtRataDatang (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TxtRataDatang as text
%        str2double(get(hObject,'String')) returns contents of TxtRataDatang as a double


% --- Executes during object creation, after setting all properties.
function TxtRataDatang_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TxtRataDatang (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end



function TxtRataLayanan_Callback(hObject, eventdata, handles)
% hObject    handle to TxtRataLayanan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)

% Hints: get(hObject,'String') returns contents of TxtRataLayanan as text
%        str2double(get(hObject,'String')) returns contents of TxtRataLayanan as a double


% --- Executes during object creation, after setting all properties.
function TxtRataLayanan_CreateFcn(hObject, eventdata, handles)
% hObject    handle to TxtRataLayanan (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called

% Hint: edit controls usually have a white background on Windows.
%       See ISPC and COMPUTER.
if ispc && isequal(get(hObject,'BackgroundColor'), get(0,'defaultUicontrolBackgroundColor'))
    set(hObject,'BackgroundColor','white');
end


% --- Executes on button press in BtnHapus.
function BtnHapus_Callback(hObject, eventdata, handles)
% hObject    handle to BtnHapus (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
set(handles.TxtRataWaktu,'string','');
set(handles.TxtRataJumlah,'string','');
set(handles.TableData,'Data','');
set(handles.TxtKastemer,'string','');
set(handles.TxtRataDatang,'string','');
set(handles.TxtRataLayanan,'string','');
