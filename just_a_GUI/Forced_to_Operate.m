function varargout = Forced_to_Operate(varargin)
% FORCED_TO_OPERATE MATLAB code for Forced_to_Operate.fig
%      FORCED_TO_OPERATE, by itself, creates a new FORCED_TO_OPERATE or raises the existing
%      singleton*.
%
%      H = FORCED_TO_OPERATE returns the handle to a new FORCED_TO_OPERATE or the handle to
%      the existing singleton*.
%
%      FORCED_TO_OPERATE('CALLBACK',hObject,eventData,handles,...) calls the local
%      function named CALLBACK in FORCED_TO_OPERATE.M with the given input arguments.
%
%      FORCED_TO_OPERATE('Property','Value',...) creates a new FORCED_TO_OPERATE or raises the
%      existing singleton*.  Starting from the left, property value pairs are
%      applied to the GUI before Forced_to_Operate_OpeningFcn gets called.  An
%      unrecognized property name or invalid value makes property application
%      stop.  All inputs are passed to Forced_to_Operate_OpeningFcn via varargin.
%
%      *See GUI Options on GUIDE's Tools menu.  Choose "GUI allows only one
%      instance to run (singleton)".
%
% See also: GUIDE, GUIDATA, GUIHANDLES

% Edit the above text to modify the response to help Forced_to_Operate

% Last Modified by GUIDE v2.5 03-Jan-2023 13:06:24

% Begin initialization code - DO NOT EDIT
gui_Singleton = 1;
gui_State = struct('gui_Name',       mfilename, ...
                   'gui_Singleton',  gui_Singleton, ...
                   'gui_OpeningFcn', @Forced_to_Operate_OpeningFcn, ...
                   'gui_OutputFcn',  @Forced_to_Operate_OutputFcn, ...
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


% --- Executes just before Forced_to_Operate is made visible.
function Forced_to_Operate_OpeningFcn(hObject, eventdata, handles, varargin)
% This function has no output args, see OutputFcn.
% hObject    handle to figure
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
% varargin   command line arguments to Forced_to_Operate (see VARARGIN)

% Choose default command line output for Forced_to_Operate
handles.output = hObject;

% Update handles structure
guidata(hObject, handles);

% UIWAIT makes Forced_to_Operate wait for user response (see UIRESUME)
% uiwait(handles.figure1);


% --- Outputs from this function are returned to the command line.
function varargout = Forced_to_Operate_OutputFcn(hObject, eventdata, handles) 
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
% 按键按下，进入文件夹选择
global filepath;
[filename, pathname] = uigetfile('.txt','选择表格文件','D:\');
disp(filename);
disp(pathname);
%没有打开文件直接退出，文件名是空的，需要处理
if (ischar(filename) == 0)||(ischar(pathname) == 0)
    disp('no file');
    return;
end
 %合并文件路径
filepath = [pathname filename];
disp(filepath);

%画图
points=load(filepath);
plot(points(:,1),points(:,2),'s','markersize',5);
grid on
% xlabel('X轴')
% ylabel('Y轴.')
% title('一个题目') 


% --- Executes on button press in pushbutton2.
function pushbutton2_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton2 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global filepath;
data = importdata(filepath)  %文件位置和名称
x = data(:,1)  %x等于第一列数据
y = data(:,2)  %y等于第二列数据
a1=polyfit(x,y,1);%1阶多项式最小二乘拟合
y1=polyval(a1,x);
gs = sprintf('y=%dx+%d',a1(1),a1(2));
hold on;
plot(x,y1,'g-','linewidth',2);
set(handles.text3,'string', gs);


% --- Executes on button press in pushbutton3.
function pushbutton3_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global filepath;
data = importdata(filepath)  %文件位置和名称
x = data(:,1)  %x等于第一列数据
y = data(:,2)  %y等于第二列数据
a1=polyfit(x,y,3);%5阶多项式最小二乘拟合
y1=polyval(a1,x);
gs = sprintf('y=%dx^3+%dx^2+%dx+%d',a1(1),a1(2),a1(3),a1(4));
hold on;
plot(x,y1,'b-','linewidth',2);
set(handles.text4,'string', gs);


% --- Executes on button press in pushbutton4.
function pushbutton4_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)
global filepath;
data = importdata(filepath)  %文件位置和名称
x = data(:,1)  %x等于第一列数据
y = data(:,2)  %y等于第二列数据
lny = log(y); % 先对要拟合的数据取对数
p = polyfit(x,lny,1); % 然后对这个中间量lny进行线性拟合
B = p(1);
A = exp(p(2));
x1 = min(x):0.1:max(x)
y1 = A*exp(B*x1);
gs = sprintf('y=%d*e^(%d*x1)',A,B);
hold on;
plot(x1,y1,'r-','linewidth',2)
set(handles.text5,'string', gs);


% --- Executes on button press in pushbutton5.
function pushbutton5_Callback(hObject, eventdata, handles)
% hObject    handle to pushbutton5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    structure with handles and user data (see GUIDATA)


% --- Executes during object creation, after setting all properties.
function text3_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text3 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function text4_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text4 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called


% --- Executes during object creation, after setting all properties.
function text5_CreateFcn(hObject, eventdata, handles)
% hObject    handle to text5 (see GCBO)
% eventdata  reserved - to be defined in a future version of MATLAB
% handles    empty - handles not created until after all CreateFcns called
