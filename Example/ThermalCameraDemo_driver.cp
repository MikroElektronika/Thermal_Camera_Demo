#line 1 "D:/Projects_git/demo_app/ThermalCamera/ThermalCameraDemo_driver.c"
#line 1 "d:/projects_git/demo_app/thermalcamera/thermalcamerademo_objects.h"
typedef enum {_taLeft, _taCenter, _taRight} TTextAlign;
typedef enum {_tavTop, _tavMiddle, _tavBottom} TTextAlignVertical;

typedef struct Screen TScreen;

typedef struct Button {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 char Pen_Width;
 unsigned int Pen_Color;
 char Visible;
 char Active;
 char Transparent;
 char *Caption;
 TTextAlign TextAlign;
 TTextAlignVertical TextAlignVertical;
 const char *FontName;
 unsigned int Font_Color;
 char VerticalText;
 char Gradient;
 char Gradient_Orientation;
 unsigned int Gradient_Start_Color;
 unsigned int Gradient_End_Color;
 unsigned int Color;
 char PressColEnabled;
 unsigned int Press_Color;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TButton;

typedef struct Label {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 char *Caption;
 const char *FontName;
 unsigned int Font_Color;
 char VerticalText;
 char Visible;
 char Active;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TLabel;

typedef struct Image {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 const char *Picture_Name;
 char Visible;
 char Active;
 char Picture_Type;
 char Picture_Ratio;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TImage;

typedef struct Box {
 TScreen* OwnerScreen;
 char Order;
 unsigned int Left;
 unsigned int Top;
 unsigned int Width;
 unsigned int Height;
 char Pen_Width;
 unsigned int Pen_Color;
 char Visible;
 char Active;
 char Transparent;
 char Gradient;
 char Gradient_Orientation;
 unsigned int Gradient_Start_Color;
 unsigned int Gradient_End_Color;
 unsigned int Color;
 char PressColEnabled;
 unsigned int Press_Color;
 void (*OnUpPtr)();
 void (*OnDownPtr)();
 void (*OnClickPtr)();
 void (*OnPressPtr)();
} TBox;

struct Screen {
 unsigned int Color;
 unsigned int Width;
 unsigned int Height;
 unsigned int ObjectsCount;
 unsigned int ButtonsCount;
 TButton * const code *Buttons;
 unsigned int LabelsCount;
 TLabel * const code *Labels;
 unsigned int ImagesCount;
 TImage * const code *Images;
 unsigned int BoxesCount;
 TBox * const code *Boxes;
 void (*OnSwipeLeftPtr)();
 void (*OnSwipeRightPtr)();
 void (*OnSwipeUpPtr)();
 void (*OnSwipeDownPtr)();
 void (*OnZoomInPtr)();
 void (*OnZoomOutPtr)();
};

extern TScreen Screen1;
extern TImage Image1;
extern TBox Box1;
extern TLabel Label1;
extern TLabel * const code Screen1_Labels[1];
extern TImage * const code Screen1_Images[1];
extern TBox * const code Screen1_Boxes[1];

extern TScreen Screen2;
extern TImage Image2;
extern TButton Button_min_p;
extern TButton Button_min_m;
extern TButton Button_low_p;
extern TButton Button_low_m;
extern TButton Button_med_p;
extern TButton Button_med_m;
extern TButton Button_high_p;
extern TButton Button_high_m;
extern TButton Button_max_p;
extern TButton Button_max_m;
extern TButton * const code Screen2_Buttons[10];
extern TImage * const code Screen2_Images[1];




void Button_high_mOnClick();
void Button_high_pOnClick();
void Button_low_mOnClick();
void Button_low_pOnClick();
void Button_max_mOnClick();
void Button_max_pOnClick();
void Button_med_mOnClick();
void Button_med_pOnClick();
void Button_min_mOnClick();
void Button_min_pOnClick();




extern char Image1_Caption[];
extern char Box1_Caption[];
extern char Label1_Caption[];
extern char Image2_Caption[];
extern char Button_min_p_Caption[];
extern char Button_min_m_Caption[];
extern char Button_low_p_Caption[];
extern char Button_low_m_Caption[];
extern char Button_med_p_Caption[];
extern char Button_med_m_Caption[];
extern char Button_high_p_Caption[];
extern char Button_high_m_Caption[];
extern char Button_max_p_Caption[];
extern char Button_max_m_Caption[];


void DrawScreen(TScreen *aScreen);
void DrawButton(TButton *aButton);
void DrawLabel(TLabel *ALabel);
void DrawImage(TImage *AImage);
void DrawBox(TBox *ABox);
void Check_TP();
void Start_TP();
void Process_TP_Press(unsigned int X, unsigned int Y);
void Process_TP_Up(unsigned int X, unsigned int Y);
void Process_TP_Down(unsigned int X, unsigned int Y);
#line 1 "d:/projects_git/demo_app/thermalcamera/thermalcamerademo_resources.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/built_in.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/uses/st m4/__lib_mmc.h"

typedef struct
{
 unsigned long cmd_timeout;
 unsigned long spi_timeout;
 unsigned long init_timeout;
} Mmc_Timeout_Values;
#line 8 "D:/Projects_git/demo_app/ThermalCamera/ThermalCameraDemo_driver.c"
sbit Mmc_Chip_Select at GPIOA_ODR.B4;


Mmc_Timeout_Values mmc_timeout;
unsigned long currentSector = -1, res_file_size;
short rfHandle;
char* rfName;
unsigned long rfStartSect;





sbit TFT_BLED at GPIOF_ODR.B10;
sbit TFT_CS at GPIOF_ODR.B12;
unsigned int TFT_DataPort at GPIOG_ODR;
sbit TFT_RD at GPIOF_ODR.B14;
sbit TFT_RS at GPIOF_ODR.B13;
sbit TFT_RST at GPIOF_ODR.B11;
sbit TFT_WR at GPIOF_ODR.B15;






unsigned int Xcoord, Ycoord;
char PenDown;
void *PressedObject;
int PressedObjectType;
unsigned int caption_length, caption_height;
unsigned int display_width, display_height;

int _object_count;
unsigned short object_pressed;
TButton *local_button;
TButton *exec_button;
int button_order;
TLabel *local_label;
TLabel *exec_label;
int label_order;
TImage *local_image;
TImage *exec_image;
int image_order;
TBox *local_box;
TBox *exec_box;
int box_order;


void Write_to_Data_Lines(unsigned char _hi, unsigned char _lo) {
 GPIOG_ODR = (unsigned int) (_lo | (_hi << 8));
}

void Set_Index(unsigned short index) {
 TFT_RS = 0;
 Write_to_Data_Lines(0, index);
 TFT_WR = 0;
 asm nop;
 TFT_WR = 1;
}

void Write_Command(unsigned short cmd) {
 TFT_RS = 1;
 Write_to_Data_Lines(0, cmd);
 TFT_WR = 0;
 asm nop;
 TFT_WR = 1;
}

void Write_Data(unsigned int _data) {
 TFT_RS = 1;
 Write_to_Data_Lines( ((char *)&_data)[1] ,  ((char *)&_data)[0] );
 TFT_WR = 0;
 asm nop;
 TFT_WR = 1;
}


char *TFT_Get_Data(unsigned long fPos, unsigned long bytesToGet, unsigned long *pBytesGot) {
 unsigned int scOffset;

 *pBytesGot = 0;

 if (rfHandle < 0) {
 return 0;
 }







 f32_sector.fSectNum = rfStartSect + fPos / 512;
 Mmc_Read_Sector(f32_sector.fSectNum, f32_sector.fSect);


 scOffset = fPos % 512;
 if(bytesToGet > 512-scOffset)
 *pBytesGot = 512-scOffset;
 else
 *pBytesGot = bytesToGet;

 return &f32_sector.fSect + scOffset;
}
static void InitializeTouchPanel() {
 TFT_Set_Active(Set_Index, Write_Command, Write_Data);
 TFT_Init_SSD1963_Board_50(800, 480);
 TFT_Set_Ext_Buffer(TFT_Get_Data);

 TFT_Set_DBC_SSD1963(255);

 PenDown = 0;
 PressedObject = 0;
 PressedObjectType = -1;
}



 TScreen* CurrentScreen;

 TScreen Screen1;
 TImage Image1;
 TBox Box1;
 TLabel Label1;
char Label1_Caption[2] = " ";

 TLabel * const code Screen1_Labels[1]=
 {
 &Label1
 };
 TImage * const code Screen1_Images[1]=
 {
 &Image1
 };
 TBox * const code Screen1_Boxes[1]=
 {
 &Box1
 };

 TScreen Screen2;
 TImage Image2;
 TButton Button_min_p;
char Button_min_p_Caption[2] = " ";

 TButton Button_min_m;
char Button_min_m_Caption[2] = " ";

 TButton Button_low_p;
char Button_low_p_Caption[2] = " ";

 TButton Button_low_m;
char Button_low_m_Caption[2] = " ";

 TButton Button_med_p;
char Button_med_p_Caption[2] = " ";

 TButton Button_med_m;
char Button_med_m_Caption[2] = " ";

 TButton Button_high_p;
char Button_high_p_Caption[2] = " ";

 TButton Button_high_m;
char Button_high_m_Caption[2] = " ";

 TButton Button_max_p;
char Button_max_p_Caption[2] = " ";

 TButton Button_max_m;
char Button_max_m_Caption[2] = " ";

 TButton * const code Screen2_Buttons[10]=
 {
 &Button_min_p,
 &Button_min_m,
 &Button_low_p,
 &Button_low_m,
 &Button_med_p,
 &Button_med_m,
 &Button_high_p,
 &Button_high_m,
 &Button_max_p,
 &Button_max_m
 };
 TImage * const code Screen2_Images[1]=
 {
 &Image2
 };



static void InitializeObjects() {
 Screen1.Color = 0x0000;
 Screen1.Width = 800;
 Screen1.Height = 480;
 Screen1.ButtonsCount = 0;
 Screen1.LabelsCount = 1;
 Screen1.Labels = Screen1_Labels;
 Screen1.ImagesCount = 1;
 Screen1.Images = Screen1_Images;
 Screen1.BoxesCount = 1;
 Screen1.Boxes = Screen1_Boxes;
 Screen1.ObjectsCount = 3;
 Screen1.OnSwipeUpPtr = 0;
 Screen1.OnSwipeDownPtr = 0;
 Screen1.OnSwipeLeftPtr = 0;
 Screen1.OnSwipeRightPtr = 0;
 Screen1.OnZoomInPtr = 0;
 Screen1.OnZoomOutPtr = 0;

 Screen2.Color = 0x5AEB;
 Screen2.Width = 800;
 Screen2.Height = 480;
 Screen2.ButtonsCount = 10;
 Screen2.Buttons = Screen2_Buttons;
 Screen2.LabelsCount = 0;
 Screen2.ImagesCount = 1;
 Screen2.Images = Screen2_Images;
 Screen2.BoxesCount = 0;
 Screen2.ObjectsCount = 11;
 Screen2.OnSwipeUpPtr = 0;
 Screen2.OnSwipeDownPtr = 0;
 Screen2.OnSwipeLeftPtr = 0;
 Screen2.OnSwipeRightPtr = 0;
 Screen2.OnZoomInPtr = 0;
 Screen2.OnZoomOutPtr = 0;


 Image1.OwnerScreen = &Screen1;
 Image1.Order = 0;
 Image1.Left = 1;
 Image1.Top = 1;
 Image1.Width = 800;
 Image1.Height = 480;
 Image1.Picture_Type = 0;
 Image1.Picture_Ratio = 1;
 Image1.Picture_Name =  0x00003232 ;
 Image1.Visible = 1;
 Image1.Active = 1;

 Box1.OwnerScreen = &Screen1;
 Box1.Order = 1;
 Box1.Left = 44;
 Box1.Top = 378;
 Box1.Width = 214;
 Box1.Height = 66;
 Box1.Pen_Width = 1;
 Box1.Pen_Color = 0xCE79;
 Box1.Visible = 1;
 Box1.Active = 1;
 Box1.Transparent = 1;
 Box1.Gradient = 1;
 Box1.Gradient_Orientation = 0;
 Box1.Gradient_Start_Color = 0x0679;
 Box1.Gradient_End_Color = 0x0679;
 Box1.Color = 0xC618;
 Box1.PressColEnabled = 1;
 Box1.Press_Color = 0xE71C;

 Label1.OwnerScreen = &Screen1;
 Label1.Order = 2;
 Label1.Left = 60;
 Label1.Top = 389;
 Label1.Width = 11;
 Label1.Height = 44;
 Label1.Visible = 1;
 Label1.Active = 1;
 Label1.Caption = Label1_Caption;
 Label1.FontName =  0x0000008B ;
 Label1.Font_Color = 0x632C;
 Label1.VerticalText = 0;

 Image2.OwnerScreen = &Screen2;
 Image2.Order = 0;
 Image2.Left = 0;
 Image2.Top = 0;
 Image2.Width = 800;
 Image2.Height = 480;
 Image2.Picture_Type = 0;
 Image2.Picture_Ratio = 1;
 Image2.Picture_Name =  0x000BEA38 ;
 Image2.Visible = 1;
 Image2.Active = 1;

 Button_min_p.OwnerScreen = &Screen2;
 Button_min_p.Order = 1;
 Button_min_p.Left = 327;
 Button_min_p.Top = 66;
 Button_min_p.Width = 81;
 Button_min_p.Height = 59;
 Button_min_p.Pen_Width = 0;
 Button_min_p.Pen_Color = 0x0000;
 Button_min_p.Visible = 1;
 Button_min_p.Active = 1;
 Button_min_p.Transparent = 0;
 Button_min_p.Caption = Button_min_p_Caption;
 Button_min_p.TextAlign = _taCenter;
 Button_min_p.TextAlignVertical= _tavMiddle;
 Button_min_p.FontName =  0x00002BA3 ;
 Button_min_p.PressColEnabled = 1;
 Button_min_p.Font_Color = 0x0000;
 Button_min_p.VerticalText = 0;
 Button_min_p.Gradient = 1;
 Button_min_p.Gradient_Orientation = 0;
 Button_min_p.Gradient_Start_Color = 0xFFFF;
 Button_min_p.Gradient_End_Color = 0xC618;
 Button_min_p.Color = 0xC618;
 Button_min_p.Press_Color = 0xE71C;
 Button_min_p.OnClickPtr = Button_min_pOnClick;

 Button_min_m.OwnerScreen = &Screen2;
 Button_min_m.Order = 2;
 Button_min_m.Left = 416;
 Button_min_m.Top = 66;
 Button_min_m.Width = 81;
 Button_min_m.Height = 59;
 Button_min_m.Pen_Width = 0;
 Button_min_m.Pen_Color = 0x0000;
 Button_min_m.Visible = 1;
 Button_min_m.Active = 1;
 Button_min_m.Transparent = 0;
 Button_min_m.Caption = Button_min_m_Caption;
 Button_min_m.TextAlign = _taCenter;
 Button_min_m.TextAlignVertical= _tavMiddle;
 Button_min_m.FontName =  0x00002BA3 ;
 Button_min_m.PressColEnabled = 1;
 Button_min_m.Font_Color = 0x0000;
 Button_min_m.VerticalText = 0;
 Button_min_m.Gradient = 1;
 Button_min_m.Gradient_Orientation = 0;
 Button_min_m.Gradient_Start_Color = 0xFFFF;
 Button_min_m.Gradient_End_Color = 0xC618;
 Button_min_m.Color = 0xC618;
 Button_min_m.Press_Color = 0xE71C;
 Button_min_m.OnClickPtr = Button_min_mOnClick;

 Button_low_p.OwnerScreen = &Screen2;
 Button_low_p.Order = 3;
 Button_low_p.Left = 327;
 Button_low_p.Top = 146;
 Button_low_p.Width = 81;
 Button_low_p.Height = 59;
 Button_low_p.Pen_Width = 0;
 Button_low_p.Pen_Color = 0x0000;
 Button_low_p.Visible = 1;
 Button_low_p.Active = 1;
 Button_low_p.Transparent = 0;
 Button_low_p.Caption = Button_low_p_Caption;
 Button_low_p.TextAlign = _taCenter;
 Button_low_p.TextAlignVertical= _tavMiddle;
 Button_low_p.FontName =  0x00002BA3 ;
 Button_low_p.PressColEnabled = 1;
 Button_low_p.Font_Color = 0x0000;
 Button_low_p.VerticalText = 0;
 Button_low_p.Gradient = 1;
 Button_low_p.Gradient_Orientation = 0;
 Button_low_p.Gradient_Start_Color = 0xFFFF;
 Button_low_p.Gradient_End_Color = 0xC618;
 Button_low_p.Color = 0xC618;
 Button_low_p.Press_Color = 0xE71C;
 Button_low_p.OnClickPtr = Button_low_pOnClick;

 Button_low_m.OwnerScreen = &Screen2;
 Button_low_m.Order = 4;
 Button_low_m.Left = 415;
 Button_low_m.Top = 144;
 Button_low_m.Width = 81;
 Button_low_m.Height = 59;
 Button_low_m.Pen_Width = 0;
 Button_low_m.Pen_Color = 0x0000;
 Button_low_m.Visible = 1;
 Button_low_m.Active = 1;
 Button_low_m.Transparent = 0;
 Button_low_m.Caption = Button_low_m_Caption;
 Button_low_m.TextAlign = _taCenter;
 Button_low_m.TextAlignVertical= _tavMiddle;
 Button_low_m.FontName =  0x00002BA3 ;
 Button_low_m.PressColEnabled = 1;
 Button_low_m.Font_Color = 0x0000;
 Button_low_m.VerticalText = 0;
 Button_low_m.Gradient = 1;
 Button_low_m.Gradient_Orientation = 0;
 Button_low_m.Gradient_Start_Color = 0xFFFF;
 Button_low_m.Gradient_End_Color = 0xC618;
 Button_low_m.Color = 0xC618;
 Button_low_m.Press_Color = 0xE71C;
 Button_low_m.OnClickPtr = Button_low_mOnClick;

 Button_med_p.OwnerScreen = &Screen2;
 Button_med_p.Order = 5;
 Button_med_p.Left = 327;
 Button_med_p.Top = 225;
 Button_med_p.Width = 81;
 Button_med_p.Height = 59;
 Button_med_p.Pen_Width = 0;
 Button_med_p.Pen_Color = 0x0000;
 Button_med_p.Visible = 1;
 Button_med_p.Active = 1;
 Button_med_p.Transparent = 0;
 Button_med_p.Caption = Button_med_p_Caption;
 Button_med_p.TextAlign = _taCenter;
 Button_med_p.TextAlignVertical= _tavMiddle;
 Button_med_p.FontName =  0x00002BA3 ;
 Button_med_p.PressColEnabled = 1;
 Button_med_p.Font_Color = 0x0000;
 Button_med_p.VerticalText = 0;
 Button_med_p.Gradient = 1;
 Button_med_p.Gradient_Orientation = 0;
 Button_med_p.Gradient_Start_Color = 0xFFFF;
 Button_med_p.Gradient_End_Color = 0xC618;
 Button_med_p.Color = 0xC618;
 Button_med_p.Press_Color = 0xE71C;
 Button_med_p.OnClickPtr = Button_med_pOnClick;

 Button_med_m.OwnerScreen = &Screen2;
 Button_med_m.Order = 6;
 Button_med_m.Left = 415;
 Button_med_m.Top = 225;
 Button_med_m.Width = 81;
 Button_med_m.Height = 59;
 Button_med_m.Pen_Width = 0;
 Button_med_m.Pen_Color = 0x0000;
 Button_med_m.Visible = 1;
 Button_med_m.Active = 1;
 Button_med_m.Transparent = 0;
 Button_med_m.Caption = Button_med_m_Caption;
 Button_med_m.TextAlign = _taCenter;
 Button_med_m.TextAlignVertical= _tavMiddle;
 Button_med_m.FontName =  0x00002BA3 ;
 Button_med_m.PressColEnabled = 1;
 Button_med_m.Font_Color = 0x0000;
 Button_med_m.VerticalText = 0;
 Button_med_m.Gradient = 1;
 Button_med_m.Gradient_Orientation = 0;
 Button_med_m.Gradient_Start_Color = 0xFFFF;
 Button_med_m.Gradient_End_Color = 0xC618;
 Button_med_m.Color = 0xC618;
 Button_med_m.Press_Color = 0xE71C;
 Button_med_m.OnClickPtr = Button_med_mOnClick;

 Button_high_p.OwnerScreen = &Screen2;
 Button_high_p.Order = 7;
 Button_high_p.Left = 327;
 Button_high_p.Top = 309;
 Button_high_p.Width = 81;
 Button_high_p.Height = 59;
 Button_high_p.Pen_Width = 0;
 Button_high_p.Pen_Color = 0x0000;
 Button_high_p.Visible = 1;
 Button_high_p.Active = 1;
 Button_high_p.Transparent = 0;
 Button_high_p.Caption = Button_high_p_Caption;
 Button_high_p.TextAlign = _taCenter;
 Button_high_p.TextAlignVertical= _tavMiddle;
 Button_high_p.FontName =  0x00002BA3 ;
 Button_high_p.PressColEnabled = 1;
 Button_high_p.Font_Color = 0x0000;
 Button_high_p.VerticalText = 0;
 Button_high_p.Gradient = 1;
 Button_high_p.Gradient_Orientation = 0;
 Button_high_p.Gradient_Start_Color = 0xFFFF;
 Button_high_p.Gradient_End_Color = 0xC618;
 Button_high_p.Color = 0xC618;
 Button_high_p.Press_Color = 0xE71C;
 Button_high_p.OnClickPtr = Button_high_pOnClick;

 Button_high_m.OwnerScreen = &Screen2;
 Button_high_m.Order = 8;
 Button_high_m.Left = 416;
 Button_high_m.Top = 309;
 Button_high_m.Width = 81;
 Button_high_m.Height = 59;
 Button_high_m.Pen_Width = 0;
 Button_high_m.Pen_Color = 0x0000;
 Button_high_m.Visible = 1;
 Button_high_m.Active = 1;
 Button_high_m.Transparent = 0;
 Button_high_m.Caption = Button_high_m_Caption;
 Button_high_m.TextAlign = _taCenter;
 Button_high_m.TextAlignVertical= _tavMiddle;
 Button_high_m.FontName =  0x00002BA3 ;
 Button_high_m.PressColEnabled = 1;
 Button_high_m.Font_Color = 0x0000;
 Button_high_m.VerticalText = 0;
 Button_high_m.Gradient = 1;
 Button_high_m.Gradient_Orientation = 0;
 Button_high_m.Gradient_Start_Color = 0xFFFF;
 Button_high_m.Gradient_End_Color = 0xC618;
 Button_high_m.Color = 0xC618;
 Button_high_m.Press_Color = 0xE71C;
 Button_high_m.OnClickPtr = Button_high_mOnClick;

 Button_max_p.OwnerScreen = &Screen2;
 Button_max_p.Order = 9;
 Button_max_p.Left = 327;
 Button_max_p.Top = 381;
 Button_max_p.Width = 81;
 Button_max_p.Height = 59;
 Button_max_p.Pen_Width = 0;
 Button_max_p.Pen_Color = 0x0000;
 Button_max_p.Visible = 1;
 Button_max_p.Active = 1;
 Button_max_p.Transparent = 0;
 Button_max_p.Caption = Button_max_p_Caption;
 Button_max_p.TextAlign = _taCenter;
 Button_max_p.TextAlignVertical= _tavMiddle;
 Button_max_p.FontName =  0x00002BA3 ;
 Button_max_p.PressColEnabled = 1;
 Button_max_p.Font_Color = 0x0000;
 Button_max_p.VerticalText = 0;
 Button_max_p.Gradient = 1;
 Button_max_p.Gradient_Orientation = 0;
 Button_max_p.Gradient_Start_Color = 0xFFFF;
 Button_max_p.Gradient_End_Color = 0xC618;
 Button_max_p.Color = 0xC618;
 Button_max_p.Press_Color = 0xE71C;
 Button_max_p.OnClickPtr = Button_max_pOnClick;

 Button_max_m.OwnerScreen = &Screen2;
 Button_max_m.Order = 10;
 Button_max_m.Left = 418;
 Button_max_m.Top = 381;
 Button_max_m.Width = 81;
 Button_max_m.Height = 59;
 Button_max_m.Pen_Width = 0;
 Button_max_m.Pen_Color = 0x0000;
 Button_max_m.Visible = 1;
 Button_max_m.Active = 1;
 Button_max_m.Transparent = 0;
 Button_max_m.Caption = Button_max_m_Caption;
 Button_max_m.TextAlign = _taCenter;
 Button_max_m.TextAlignVertical= _tavMiddle;
 Button_max_m.FontName =  0x00002BA3 ;
 Button_max_m.PressColEnabled = 1;
 Button_max_m.Font_Color = 0x0000;
 Button_max_m.VerticalText = 0;
 Button_max_m.Gradient = 1;
 Button_max_m.Gradient_Orientation = 0;
 Button_max_m.Gradient_Start_Color = 0xFFFF;
 Button_max_m.Gradient_End_Color = 0xC618;
 Button_max_m.Color = 0xC618;
 Button_max_m.Press_Color = 0xE71C;
 Button_max_m.OnClickPtr = Button_max_mOnClick;
}

static char IsInsideObject (unsigned int X, unsigned int Y, unsigned int Left, unsigned int Top, unsigned int Width, unsigned int Height) {
 if ( (Left<= X) && (Left+ Width - 1 >= X) &&
 (Top <= Y) && (Top + Height - 1 >= Y) )
 return 1;
 else
 return 0;
}







void DrawButton(TButton *Abutton) {
unsigned int ALeft, ATop;
 if (Abutton->Visible != 0) {
 if (object_pressed == 1) {
 object_pressed = 0;
 TFT_Set_Brush(Abutton->Transparent, Abutton->Press_Color, Abutton->Gradient, Abutton->Gradient_Orientation, Abutton->Gradient_End_Color, Abutton->Gradient_Start_Color);
 }
 else {
 TFT_Set_Brush(Abutton->Transparent, Abutton->Color, Abutton->Gradient, Abutton->Gradient_Orientation, Abutton->Gradient_Start_Color, Abutton->Gradient_End_Color);
 }
 TFT_Set_Pen(Abutton->Pen_Color, Abutton->Pen_Width);
 TFT_Rectangle(Abutton->Left, Abutton->Top, Abutton->Left + Abutton->Width - 1, Abutton->Top + Abutton->Height - 1);
 if (Abutton->VerticalText != 0)
 TFT_Set_Ext_Font(Abutton->FontName, Abutton->Font_Color, FO_VERTICAL_COLUMN);
 else
 TFT_Set_Ext_Font(Abutton->FontName, Abutton->Font_Color, FO_HORIZONTAL);
 TFT_Write_Text_Return_Pos(Abutton->Caption, Abutton->Left, Abutton->Top);
 if (Abutton->TextAlign == _taLeft)
 ALeft = Abutton->Left + 4;
 else if (Abutton->TextAlign == _taCenter)
 ALeft = Abutton->Left + (Abutton->Width - caption_length) / 2;
 else if (Abutton->TextAlign == _taRight)
 ALeft = Abutton->Left + Abutton->Width - caption_length - 4;

 if (Abutton->TextAlignVertical == _tavTop)
 ATop = Abutton->Top + 4;
 else if (Abutton->TextAlignVertical == _tavMiddle)
 ATop = Abutton->Top + ((Abutton->Height - caption_height) / 2);
 else if (Abutton->TextAlignVertical == _tavBottom)
 ATop = Abutton->Top + (Abutton->Height - caption_height - 4);

 TFT_Write_Text(Abutton->Caption, ALeft, ATop);
 }
}

void DrawLabel(TLabel *ALabel) {
 if (ALabel->Visible != 0) {
 if (ALabel->VerticalText != 0)
 TFT_Set_Ext_Font(ALabel->FontName, ALabel->Font_Color, FO_VERTICAL_COLUMN);
 else
 TFT_Set_Ext_Font(ALabel->FontName, ALabel->Font_Color, FO_HORIZONTAL);
 TFT_Write_Text(ALabel->Caption, ALabel->Left, ALabel->Top);
 }
}

void DrawImage(TImage *AImage) {
 if (AImage->Visible != 0) {
 TFT_Ext_Image(AImage->Left, AImage->Top, AImage->Picture_Name, AImage->Picture_Ratio);
 }
}

void DrawBox(TBox *ABox) {
 if (ABox->Visible != 0) {
 if (object_pressed == 1) {
 object_pressed = 0;
 TFT_Set_Brush(ABox->Transparent, ABox->Press_Color, ABox->Gradient, ABox->Gradient_Orientation, ABox->Gradient_End_Color, ABox->Gradient_Start_Color);
 }
 else {
 TFT_Set_Brush(ABox->Transparent, ABox->Color, ABox->Gradient, ABox->Gradient_Orientation, ABox->Gradient_Start_Color, ABox->Gradient_End_Color);
 }
 TFT_Set_Pen(ABox->Pen_Color, ABox->Pen_Width);
 TFT_Rectangle(ABox->Left, ABox->Top, ABox->Left + ABox->Width - 1, ABox->Top + ABox->Height - 1);
 }
}

void DrawScreen(TScreen *aScreen) {
 unsigned int order;
 unsigned short button_idx;
 TButton *local_button;
 unsigned short label_idx;
 TLabel *local_label;
 unsigned short image_idx;
 TImage *local_image;
 unsigned short box_idx;
 TBox *local_box;
 char save_bled;
 int it;

 object_pressed = 0;
 order = 0;
 button_idx = 0;
 label_idx = 0;
 image_idx = 0;
 box_idx = 0;
 CurrentScreen = aScreen;

 for (it = 255; it >= 0; it--)
 {
 TFT_Set_DBC_SSD1963(it);
 Delay_1ms( );
 }
 if ((display_width != CurrentScreen->Width) || (display_height != CurrentScreen->Height)) {
 save_bled = TFT_BLED;
 TFT_BLED = 0;
 TFT_Set_Active(Set_Index, Write_Command, Write_Data);
 TFT_Init_SSD1963_Board_50(CurrentScreen->Width, CurrentScreen->Height);
 FT5XX6_SetSize(CurrentScreen->Width, CurrentScreen->Height);
 TFT_Set_Ext_Buffer(TFT_Get_Data);
 TFT_Fill_Screen(CurrentScreen->Color);
 TFT_Set_DBC_SSD1963(255);
 display_width = CurrentScreen->Width;
 display_height = CurrentScreen->Height;
 TFT_BLED = save_bled;
 }
 else
 TFT_Fill_Screen(CurrentScreen->Color);


 while (order < CurrentScreen->ObjectsCount) {
 if (button_idx < CurrentScreen->ButtonsCount) {
 local_button =  CurrentScreen->Buttons[button_idx] ;
 if (order == local_button->Order) {
 button_idx++;
 order++;
 DrawButton(local_button);
 }
 }

 if (label_idx < CurrentScreen->LabelsCount) {
 local_label =  CurrentScreen->Labels[label_idx] ;
 if (order == local_label->Order) {
 label_idx++;
 order++;
 DrawLabel(local_label);
 }
 }

 if (box_idx < CurrentScreen->BoxesCount) {
 local_box =  CurrentScreen->Boxes[box_idx] ;
 if (order == local_box->Order) {
 box_idx++;
 order++;
 DrawBox(local_box);
 }
 }

 if (image_idx < CurrentScreen->ImagesCount) {
 local_image =  CurrentScreen->Images[image_idx] ;
 if (order == local_image->Order) {
 image_idx++;
 order++;
 DrawImage(local_image);
 }
 }

 }
 for (it = 0; it <= 255; it++)
 {
 TFT_Set_DBC_SSD1963(it);
 Delay_1ms( );
 }
}

void Get_Object(unsigned int X, unsigned int Y) {
 button_order = -1;
 label_order = -1;
 image_order = -1;
 box_order = -1;

 for ( _object_count = 0 ; _object_count < CurrentScreen->ButtonsCount ; _object_count++ ) {
 local_button =  CurrentScreen->Buttons[_object_count] ;
 if (local_button->Active != 0) {
 if (IsInsideObject(X, Y, local_button->Left, local_button->Top,
 local_button->Width, local_button->Height) == 1) {
 button_order = local_button->Order;
 exec_button = local_button;
 }
 }
 }


 for ( _object_count = 0 ; _object_count < CurrentScreen->LabelsCount ; _object_count++ ) {
 local_label =  CurrentScreen->Labels[_object_count] ;
 if (local_label->Active != 0) {
 if (IsInsideObject(X, Y, local_label->Left, local_label->Top,
 local_label->Width, local_label->Height) == 1) {
 label_order = local_label->Order;
 exec_label = local_label;
 }
 }
 }


 for ( _object_count = 0 ; _object_count < CurrentScreen->ImagesCount ; _object_count++ ) {
 local_image =  CurrentScreen->Images[_object_count] ;
 if (local_image->Active != 0) {
 if (IsInsideObject(X, Y, local_image->Left, local_image->Top,
 local_image->Width, local_image->Height) == 1) {
 image_order = local_image->Order;
 exec_image = local_image;
 }
 }
 }


 for ( _object_count = 0 ; _object_count < CurrentScreen->BoxesCount ; _object_count++ ) {
 local_box =  CurrentScreen->Boxes[_object_count] ;
 if (local_box->Active != 0) {
 if (IsInsideObject(X, Y, local_box->Left, local_box->Top,
 local_box->Width, local_box->Height) == 1) {
 box_order = local_box->Order;
 exec_box = local_box;
 }
 }
 }

 _object_count = -1;
 if (button_order > _object_count )
 _object_count = button_order;
 if (label_order > _object_count )
 _object_count = label_order;
 if (image_order > _object_count )
 _object_count = image_order;
 if (box_order > _object_count )
 _object_count = box_order;
}


void Process_TP_Press(unsigned int X, unsigned int Y) {
 exec_button = 0;
 exec_label = 0;
 exec_image = 0;
 exec_box = 0;

 Get_Object(X, Y);

 if (_object_count != -1) {
 if (_object_count == button_order) {
 if (exec_button->Active != 0) {
 if (exec_button->OnPressPtr != 0) {
 exec_button->OnPressPtr();
 return;
 }
 }
 }

 if (_object_count == label_order) {
 if (exec_label->Active != 0) {
 if (exec_label->OnPressPtr != 0) {
 exec_label->OnPressPtr();
 return;
 }
 }
 }

 if (_object_count == image_order) {
 if (exec_image->Active != 0) {
 if (exec_image->OnPressPtr != 0) {
 exec_image->OnPressPtr();
 return;
 }
 }
 }

 if (_object_count == box_order) {
 if (exec_box->Active != 0) {
 if (exec_box->OnPressPtr != 0) {
 exec_box->OnPressPtr();
 return;
 }
 }
 }

 }
}

void Process_TP_Up(unsigned int X, unsigned int Y) {

 switch (PressedObjectType) {

 case 0: {
 if (PressedObject != 0) {
 exec_button = (TButton*)PressedObject;
 if ((exec_button->PressColEnabled != 0) && (exec_button->OwnerScreen == CurrentScreen)) {
 DrawButton(exec_button);
 }
 break;
 }
 break;
 }

 case 6: {
 if (PressedObject != 0) {
 exec_box = (TBox*)PressedObject;
 if ((exec_box->PressColEnabled != 0) && (exec_box->OwnerScreen == CurrentScreen)) {
 DrawBox(exec_box);
 }
 break;
 }
 break;
 }
 }

 exec_label = 0;
 exec_image = 0;

 Get_Object(X, Y);


 if (_object_count != -1) {

 if (_object_count == button_order) {
 if (exec_button->Active != 0) {
 if (exec_button->OnUpPtr != 0)
 exec_button->OnUpPtr();
 if (PressedObject == (void *)exec_button)
 if (exec_button->OnClickPtr != 0)
 exec_button->OnClickPtr();
 PressedObject = 0;
 PressedObjectType = -1;
 return;
 }
 }


 if (_object_count == label_order) {
 if (exec_label->Active != 0) {
 if (exec_label->OnUpPtr != 0)
 exec_label->OnUpPtr();
 if (PressedObject == (void *)exec_label)
 if (exec_label->OnClickPtr != 0)
 exec_label->OnClickPtr();
 PressedObject = 0;
 PressedObjectType = -1;
 return;
 }
 }


 if (_object_count == image_order) {
 if (exec_image->Active != 0) {
 if (exec_image->OnUpPtr != 0)
 exec_image->OnUpPtr();
 if (PressedObject == (void *)exec_image)
 if (exec_image->OnClickPtr != 0)
 exec_image->OnClickPtr();
 PressedObject = 0;
 PressedObjectType = -1;
 return;
 }
 }


 if (_object_count == box_order) {
 if (exec_box->Active != 0) {
 if (exec_box->OnUpPtr != 0)
 exec_box->OnUpPtr();
 if (PressedObject == (void *)exec_box)
 if (exec_box->OnClickPtr != 0)
 exec_box->OnClickPtr();
 PressedObject = 0;
 PressedObjectType = -1;
 return;
 }
 }

 }
 PressedObject = 0;
 PressedObjectType = -1;
}

void Process_TP_Down(unsigned int X, unsigned int Y) {

 object_pressed = 0;
 exec_button = 0;
 exec_label = 0;
 exec_image = 0;
 exec_box = 0;

 Get_Object(X, Y);

 if (_object_count != -1) {
 if (_object_count == button_order) {
 if (exec_button->Active != 0) {
 if (exec_button->PressColEnabled != 0) {
 object_pressed = 1;
 DrawButton(exec_button);
 }
 PressedObject = (void *)exec_button;
 PressedObjectType = 0;
 if (exec_button->OnDownPtr != 0) {
 exec_button->OnDownPtr();
 return;
 }
 }
 }

 if (_object_count == label_order) {
 if (exec_label->Active != 0) {
 PressedObject = (void *)exec_label;
 PressedObjectType = 2;
 if (exec_label->OnDownPtr != 0) {
 exec_label->OnDownPtr();
 return;
 }
 }
 }

 if (_object_count == image_order) {
 if (exec_image->Active != 0) {
 PressedObject = (void *)exec_image;
 PressedObjectType = 3;
 if (exec_image->OnDownPtr != 0) {
 exec_image->OnDownPtr();
 return;
 }
 }
 }

 if (_object_count == box_order) {
 if (exec_box->Active != 0) {
 if (exec_box->PressColEnabled != 0) {
 object_pressed = 1;
 DrawBox(exec_box);
 }
 PressedObject = (void *)exec_box;
 PressedObjectType = 6;
 if (exec_box->OnDownPtr != 0) {
 exec_box->OnDownPtr();
 return;
 }
 }
 }

 }
}

void Check_TP() {
 if (FT5XX6_PressDetect()) {
 if (FT5XX6_GetCoordinates(&Xcoord, &Ycoord) == 0) {

 Process_TP_Press(Xcoord, Ycoord);
 if (PenDown == 0) {
 PenDown = 1;
 Process_TP_Down(Xcoord, Ycoord);
 }
 }
 }
 else if (PenDown == 1) {
 PenDown = 0;
 Process_TP_Up(Xcoord, Ycoord);
 }
}

void Init_MCU()
{
 GPIO_Digital_Output(&GPIOF_BASE, _GPIO_PINMASK_1);
 GPIO_Digital_Input(&GPIOF_BASE, _GPIO_PINMASK_0);
 GPIOF_ODR.B1 = 1;
 while (GPIOF_IDR.B0 == 0) {
 GPIOF_ODR.B1 = 0;
 Delay_us(10);
 GPIOF_ODR.B1 = 1;
 Delay_us(10);
 }
 I2C2_Init_Advanced(400000, &_GPIO_MODULE_I2C2_PF01);

 TFT_Set_Default_Mode();
}

void MMC_TimeoutCallback(char errorCode){
 if(errorCode = _MMC_INIT_TIMEOUT){

 }
 if(errorCode = _MMC_CMD_TIMEOUT){

 }
 if(errorCode = _MMC_SPI_TIMEOUT){

 }
}

void Init_Ext_Mem() {
 rfStartSect = 0;
 rfName = "ThermalC.RES";

 mmc_timeout.cmd_timeout = 10000;
 mmc_timeout.spi_timeout = 10000;
 mmc_timeout.init_timeout = 10000;
 Mmc_SetTimeoutCallback(&mmc_timeout,&MMC_TimeoutCallback);


 GPIO_Digital_Output(&GPIOA_BASE, _GPIO_PINMASK_4);
 Mmc_Chip_Select = 1;
 SPI1_Init_Advanced(_SPI_FPCLK_DIV64, _SPI_MASTER | _SPI_8_BIT |
 _SPI_CLK_IDLE_LOW | _SPI_FIRST_CLK_EDGE_TRANSITION |
 _SPI_MSB_FIRST | _SPI_SS_DISABLE | _SPI_SSM_ENABLE | _SPI_SSI_1,
&_GPIO_MODULE_SPI1_PA56_PB5);

 if (FAT32_Init() == 0)
 SPI1_Init_Advanced(_SPI_FPCLK_DIV8, _SPI_MASTER | _SPI_8_BIT |
 _SPI_CLK_IDLE_LOW | _SPI_FIRST_CLK_EDGE_TRANSITION |
 _SPI_MSB_FIRST | _SPI_SS_DISABLE | _SPI_SSM_ENABLE | _SPI_SSI_1,
&_GPIO_MODULE_SPI1_PA56_PB5);


 rfHandle = FAT32_Open(rfName, 0x01);
 rfStartSect = FAT32_ClustToSect(fat32_fdesc[rfHandle]._1stClust);
}

char FT5XX6_Config() {
 FT5XX6_SetI2CAddress(0x38);
 if (FT5XX6_IsOperational() != FT5XX6_OK)
 return FT5XX6_FAILURE;
 FT5XX6_SetDefaultMode();
 FT5XX6_SetController(_TC_FT5X06);
 FT5XX6_SetSizeAndRotation(800,480,2);
return FT5XX6_OK;
}

void Start_TP() {
 Init_MCU();

 Init_Ext_Mem();

 InitializeTouchPanel();
 if (FT5XX6_Config() == FT5XX6_OK) {
 } else {
 while(1);
 }


 InitializeObjects();
 display_width = Screen2.Width;
 display_height = Screen2.Height;
 DrawScreen(&Screen1);
}
