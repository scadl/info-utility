unit Settings;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, sFrameAdapter, ExtCtrls, ComCtrls, sTrackBar, StdCtrls, sCheckBox,
  sLabel, sHintManager;

type
  TFrame12 = class(TFrame)
    sFrameAdapter1: TsFrameAdapter;
    sCheckBox1: TsCheckBox;
    sTrackBar1: TsTrackBar;
    Timer1: TTimer;
    sLabel1: TsLabel;
    pass1timer: TTimer;
    sHintManager1: TsHintManager;
    procedure pass1timerTimer(Sender: TObject);
    procedure sCheckBox1Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure sTrackBar1Change(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  asFrame1: TFrame12;

implementation

uses Main;

{$R *.dfm}

procedure TFrame12.pass1timerTimer(Sender: TObject);
begin
av:=strtoint(form1.Memo1.Lines[5]);
sCheckBox1.Checked:=strtobool(form1.Memo1.Lines[6]);
pass1timer.Enabled:=false;
pass1timer.Free;
end;

procedure TFrame12.sCheckBox1Click(Sender: TObject);
begin
if sCheckBox1.Checked
then begin form1.FormStyle:=fsStayOnTop; form1.Memo1.Lines[6]:='1' end
else begin form1.FormStyle:=fsNormal; form1.Memo1.Lines[6]:='0' end;
end;

procedure TFrame12.sTrackBar1Change(Sender: TObject);
begin
 av:=sTrackBar1.Position;
 form1.Memo1.Lines[5]:=inttostr(av);
end;

procedure TFrame12.Timer1Timer(Sender: TObject);
begin
if sCheckBox1.Checked
then form1.FormStyle:=fsStayOnTop
else form1.FormStyle:=fsNormal;

{Form1.AlphaBlendValue:=sTrackBar1.Position;}
sTrackBar1.Position:=av;

form1.TrayIcon1.Hint:='Info Utility v.5.1'+#13+
'Коэффициент прозрачности: '+inttostr(av)+' из 255';
end;

end.
