unit Alarmer;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Gauges, StdCtrls, sLabel, sEdit, sSpinEdit, sFrameAdapter, ExtCtrls,
  Mask, sMaskEdit, sCustomComboEdit, sTooledit, sBevel, MPlayer, Buttons,
  sSpeedButton, sCheckBox, ImgList, acAlphaImageList, sHintManager;

type
  TFrameIn2 = class(TFrame)
    sTimePicker1: TsTimePicker;
    sFrameAdapter1: TsFrameAdapter;
    Timer1: TTimer;
    tstimefx: TsLabelFX;
    sSpeedButton1: TsSpeedButton;
    sCheckBox1: TsCheckBox;
    sCheckBox2: TsCheckBox;
    ssb_pict: TsSpeedButton;
    sAlphaImageList1: TsAlphaImageList;
    sLabel1: TsLabel;
    pass1timer: TTimer;
    sHintManager1: TsHintManager;
    sFilenameEdit1: TsFilenameEdit;
    procedure sCheckBox2Click(Sender: TObject);
    procedure sTimePicker1Change(Sender: TObject);
    procedure pass1timerTimer(Sender: TObject);
    procedure ssb_pictClick(Sender: TObject);
    procedure sSpeedButton1Click(Sender: TObject);
    procedure sFilenameEdit1AfterDialog(Sender: TObject; var Name: string;
      var Action: Boolean);
    procedure Timer1Timer(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form2: TFrameIn2;
  p,a:boolean;

implementation

{$R *.dfm}

uses Main;



procedure TFrameIn2.pass1timerTimer(Sender: TObject);
begin
sTimePicker1.Text:=form1.Memo1.Lines[1];
form1.MediaPlayer1.FileName:=form1.Memo1.Lines[2];
sFilenameEdit1.FileName:=form1.MediaPlayer1.FileName;
if strtobool(form1.Memo1.Lines[3]) then ssb_pict.Click;
sCheckBox2.Checked:=strtobool(form1.Memo1.Lines[4]);
pass1timer.Enabled:=false;
pass1timer.Free;
end;

procedure TFrameIn2.sCheckBox2Click(Sender: TObject);
begin
if sCheckBox2.Checked
then form1.Memo1.Lines[4]:='1'
else form1.Memo1.Lines[4]:='0';
end;

procedure TFrameIn2.sFilenameEdit1AfterDialog(Sender: TObject; var Name: string;
  var Action: Boolean);
begin
form1.MediaPlayer1.FileName:=Name;
sFilenameEdit1.Text:=sFilenameEdit1.shortname;
form1.Memo1.Lines[2]:=Name;
end;

procedure TFrameIn2.ssb_pictClick(Sender: TObject);
begin
if sCheckBox1.Checked
then begin sCheckBox1.Checked:=false; form1.Memo1.Lines[3]:='0'; end
else begin sCheckBox1.Checked:=true; a:=true; form1.Memo1.Lines[3]:='1'; end;
end;

procedure TFrameIn2.sSpeedButton1Click(Sender: TObject);
begin
if form1.MediaPlayer1.Mode=mpPlaying then
begin
sAlphaImageList1.GetBitmap32(2, sSpeedButton1.Glyph);
form1.MediaPlayer1.Stop;
form1.MediaPlayer1.Close;
p:=false;
sLabel1.Caption:='не'+#13+'проигр.';
exit;
end;


form1.MediaPlayer1.Open;
form1.MediaPlayer1.Play;
p:=true;
sAlphaImageList1.GetBitmap32(3, sSpeedButton1.Glyph);

end;

procedure TFrameIn2.sTimePicker1Change(Sender: TObject);
begin
form1.Memo1.Lines[1]:=sTimePicker1.Text;
end;

procedure TFrameIn2.Timer1Timer(Sender: TObject);
begin
tstimefx.Caption:=FormatDateTime('hh:mm:ss',Now());

if sCheckBox1.Checked
then sAlphaImageList1.GetBitmap32(1, ssb_pict.Glyph)
else sAlphaImageList1.GetBitmap32(0, ssb_pict.Glyph);

if c then
begin
sFilenameEdit1.Text:=form1.MediaPlayer1.FileName;
if form1.MediaPlayer1.Mode=mpPlaying
then sAlphaImageList1.GetBitmap32(3, sSpeedButton1.Glyph);
c:=false;
end;

if p then
begin
slabel1.Caption:=
'Проигр.:'+#13+
inttostr(round((100*form1.MediaPlayer1.Position)/form1.MediaPlayer1.length))+'%';

if form1.MediaPlayer1.Position=form1.MediaPlayer1.Length then
begin
form1.MediaPlayer1.Stop;
if sCheckBox2.Checked then sSpeedButton1.Click
else begin
sAlphaImageList1.GetBitmap32(2, sSpeedButton1.Glyph);
p:=false;
sLabel1.Caption:='не'+#13+'проигр.';
end;
end;
end;

if sFilenameEdit1.text='' then
begin
sCheckBox1.Enabled:=false;
sCheckBox2.Enabled:=false;
ssb_pict.Enabled:=false;
sSpeedButton1.Enabled:=false;
end else begin
sCheckBox1.Enabled:=true;
sCheckBox2.Enabled:=true;
ssb_pict.Enabled:=true;
sSpeedButton1.Enabled:=true;
end;

// alarmer
if a then
begin
if sCheckBox1.Checked then
if sTimePicker1.Text=FormatDateTime('hh:mm',Now())
then begin
sSpeedButton1.Click;
a:=false;
end;
end;
// end_alarmner

if sCheckBox1.Checked then
form1.TrayIcon1.Hint:='Info Utility v.5.1'+#13+'Звонок в: '+sTimePicker1.Text+#13+
'Мелодия: '+form1.MediaPlayer1.FileName
else form1.TrayIcon1.Hint:='Info Utility v.5.1'+#13+'Будильник выключен';
end;

end.
