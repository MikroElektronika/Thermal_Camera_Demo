typedef enum {_taLeft, _taCenter, _taRight} TTextAlign;
typedef enum {_tavTop, _tavMiddle, _tavBottom} TTextAlignVertical;

typedef struct Screen TScreen;

typedef struct  Button {
  TScreen*  OwnerScreen;
  char          Order;
  unsigned int  Left;
  unsigned int  Top;
  unsigned int  Width;
  unsigned int  Height;
  char          Pen_Width;
  unsigned int  Pen_Color;
  char          Visible;
  char          Active;
  char          Transparent;
  char          *Caption;
  TTextAlign    TextAlign;
  TTextAlignVertical TextAlignVertical;
  const char    *FontName;
  unsigned int  Font_Color;
  char          VerticalText;
  char          Gradient;
  char          Gradient_Orientation;
  unsigned int  Gradient_Start_Color;
  unsigned int  Gradient_End_Color;
  unsigned int  Color;
  char          PressColEnabled;
  unsigned int  Press_Color;
  void          (*OnUpPtr)();
  void          (*OnDownPtr)();
  void          (*OnClickPtr)();
  void          (*OnPressPtr)();
} TButton;

typedef struct  Label {
  TScreen*  OwnerScreen;
  char          Order;
  unsigned int  Left;
  unsigned int  Top;
  unsigned int  Width;
  unsigned int  Height;
  char          *Caption;
  const char    *FontName;
  unsigned int  Font_Color;
  char          VerticalText;
  char          Visible;
  char          Active;
  void          (*OnUpPtr)();
  void          (*OnDownPtr)();
  void          (*OnClickPtr)();
  void          (*OnPressPtr)();
} TLabel;

typedef struct  Image {
  TScreen*  OwnerScreen;
  char          Order;
  unsigned int  Left;
  unsigned int  Top;
  unsigned int  Width;
  unsigned int  Height;
  const char    *Picture_Name;
  char          Visible;
  char          Active;
  char          Picture_Type;
  char          Picture_Ratio;
  void          (*OnUpPtr)();
  void          (*OnDownPtr)();
  void          (*OnClickPtr)();
  void          (*OnPressPtr)();
} TImage;

typedef struct  Box {
  TScreen*  OwnerScreen;
  char          Order;
  unsigned int  Left;
  unsigned int  Top;
  unsigned int  Width;
  unsigned int  Height;
  char          Pen_Width;
  unsigned int  Pen_Color;
  char          Visible;
  char          Active;
  char          Transparent;
  char          Gradient;
  char          Gradient_Orientation;
  unsigned int  Gradient_Start_Color;
  unsigned int  Gradient_End_Color;
  unsigned int  Color;
  char          PressColEnabled;
  unsigned int  Press_Color;
  void          (*OnUpPtr)();
  void          (*OnDownPtr)();
  void          (*OnClickPtr)();
  void          (*OnPressPtr)();
} TBox;

struct Screen {
  unsigned int           Color;
  unsigned int           Width;
  unsigned int           Height;
  unsigned int           ObjectsCount;
  unsigned int           ButtonsCount;
  TButton                * const code *Buttons;
  unsigned int           LabelsCount;
  TLabel                 * const code *Labels;
  unsigned int           ImagesCount;
  TImage                 * const code *Images;
  unsigned int           BoxesCount;
  TBox                   * const code *Boxes;
  void          (*OnSwipeLeftPtr)();
  void          (*OnSwipeRightPtr)();
  void          (*OnSwipeUpPtr)();
  void          (*OnSwipeDownPtr)();
  void          (*OnZoomInPtr)();
  void          (*OnZoomOutPtr)();
};

extern   TScreen                Screen1;
extern   TImage               Image1;
extern   TBox                   Box1;
extern   TLabel                 Label1;
extern   TLabel                 * const code Screen1_Labels[1];
extern   TImage                 * const code Screen1_Images[1];
extern   TBox                   * const code Screen1_Boxes[1];

extern   TScreen                Screen2;
extern   TImage               Image2;
extern   TButton               Button_min_p;
extern   TButton               Button_min_m;
extern   TButton               Button_low_p;
extern   TButton               Button_low_m;
extern   TButton               Button_med_p;
extern   TButton               Button_med_m;
extern   TButton               Button_high_p;
extern   TButton               Button_high_m;
extern   TButton               Button_max_p;
extern   TButton               Button_max_m;
extern   TButton                * const code Screen2_Buttons[10];
extern   TImage                 * const code Screen2_Images[1];


/////////////////////////
// Events Code Declarations
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
/////////////////////////

/////////////////////////////////
// Caption variables Declarations
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
/////////////////////////////////

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
