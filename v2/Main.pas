unit Main;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, Gauges, ComCtrls,
  Menus, acProgressBar, sTrackBar, sSkinProvider, sSkinManager, sPanel,
  sCheckBox, sLabel, Buttons, sSpeedButton, sGroupBox, FileCtrl, Mask, sMaskEdit, sCustomComboEdit,
  sCurrEdit, sScrollBox, sFrameBar, acNoteBook, sRichEdit, sEdit, sSpinEdit, MPlayer,
  DiskInfo, Alarmer, Notes, Settings, Thems, acAlphaHints, sHintManager,
  sDialogs;

type
  TForm1 = class(TForm)
    PopupMenu1: TPopupMenu;
    Restore1: TMenuItem;
    Exit1: TMenuItem;
    sSkinManager1: TsSkinManager;
    sSkinProvider1: TsSkinProvider;
    TrayIcon1: TTrayIcon;
    sFrameBar1: TsFrameBar;
    Timer1: TTimer;
    MediaPlayer1: TMediaPlayer;
    Memo1: TsRichEdit;
    {procedure TrayIcon1MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);}
    procedure FormDestroy(Sender: TObject);
    procedure sFrameBar1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure FormCreate(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure sFrameBar1Items4CreateFrame(Sender: TObject;
      var Frame: TCustomFrame);
    procedure sFrameBar1Items3CreateFrame(Sender: TObject;
      var Frame: TCustomFrame);
    procedure sFrameBar1Items2CreateFrame(Sender: TObject;
      var Frame: TCustomFrame);
    procedure sFrameBar1Items1CreateFrame(Sender: TObject;
      var Frame: TCustomFrame);
    procedure sFrameBar1Items0CreateFrame(Sender: TObject;
      var Frame: TCustomFrame);
    procedure sDragBar1MouseDown(Sender: TObject; Button: TMouseButton;
      Shift: TShiftState; X, Y: Integer);
    procedure Exit1Click(Sender: TObject);
    procedure Restore1Click(Sender: TObject);
    procedure TrayIcon1Click(Sender: TObject);


  private

    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;
  c, re, re_d:boolean;
  av:byte;
  cd_str:string;

  val, endVal:integer;
  aniTarg: tobject;

  fmb:Boolean;


implementation

{$R *.dfm}



procedure TForm1.Exit1Click(Sender: TObject);
begin
form1.Close;
end;

procedure TForm1.FormCreate(Sender: TObject);
var fs:textfile;
begin
form1.TrayIcon1.Hint:='Info Utility v.5.1';
memo1.Lines.LoadFromFile('settings.dat');

if form1.Memo1.Lines[7]='Vista (internal)' then form1.sSkinManager1.SkinName:='Vista (internal)';
if form1.Memo1.Lines[7]='Office2010 Blue (internal)' then form1.sSkinManager1.SkinName:='Office2010 Blue (internal)';
if form1.Memo1.Lines[7]='WLM (internal)' then form1.sSkinManager1.SkinName:='WLM (internal)';

av:=strtoint(form1.Memo1.Lines[5]);

cd_str:=GetCurrentDir;
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin

SetCurrentDir(cd_str);
memo1.Lines.SaveToFile('settings.dat');

end;

procedure TForm1.Restore1Click(Sender: TObject);
begin
form1.Show;
end;

procedure TForm1.sDragBar1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
if button=mbRight then form1.Hide;

end;

procedure TForm1.sFrameBar1Items0CreateFrame(Sender: TObject;
  var Frame: TCustomFrame);
begin
Frame:=TFrameIn.Create(nil);
end;

procedure TForm1.sFrameBar1Items1CreateFrame(Sender: TObject;
  var Frame: TCustomFrame);
begin
Frame:=TFrameIn2.Create(nil);
c:=true;
end;

procedure TForm1.sFrameBar1Items2CreateFrame(Sender: TObject;
  var Frame: TCustomFrame);
begin
Frame:=TFrame1.Create(nil);
re:=true;
end;


procedure TForm1.sFrameBar1Items3CreateFrame(Sender: TObject;
  var Frame: TCustomFrame);
begin
Frame:=TFrame12.Create(nil);
end;

procedure TForm1.sFrameBar1Items4CreateFrame(Sender: TObject;
  var Frame: TCustomFrame);
begin
Frame:=TFrame123.Create(nil);
end;


procedure TForm1.sFrameBar1MouseDown(Sender: TObject; Button: TMouseButton;
  Shift: TShiftState; X, Y: Integer);
begin
if Button=mbRight then
begin
form1.Hide;

SetCurrentDir(cd_str);
memo1.lines.SaveToFile('settings.dat');

end;
end;

procedure TForm1.Timer1Timer(Sender: TObject);
begin
AlphaBlendValue:=av;
end;

procedure TForm1.TrayIcon1Click(Sender: TObject);
begin
form1.Show;
end;



{procedure TForm1.TrayIcon1MouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
TrayIcon1.ShowBalloonHint;
if TrayIcon1.BalloonHint='' then
TrayIcon1.BalloonHint:=' ';
end;}

end.
