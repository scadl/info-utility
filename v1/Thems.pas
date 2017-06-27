unit Thems;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, sFrameAdapter, Buttons, sSpeedButton, ExtCtrls;

type
  TFrame123 = class(TFrame)
    sFrameAdapter1: TsFrameAdapter;
    sSpeedButton1: TsSpeedButton;
    sSpeedButton5: TsSpeedButton;
    sSpeedButton7: TsSpeedButton;
    Timer1: TTimer;
    procedure Timer1Timer(Sender: TObject);
    procedure sSpeedButton7Click(Sender: TObject);
    procedure sSpeedButton5Click(Sender: TObject);
    procedure sSpeedButton1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  asFrame1: TFrame123;
  hs:string[150];

implementation

uses Main;

{$R *.dfm}



procedure TFrame123.sSpeedButton1Click(Sender: TObject);
begin
form1.sSkinManager1.SkinName:='Vista (internal)';
form1.Memo1.Lines[7]:='Vista (internal)';
form1.TrayIcon1.BalloonHint:='义爨: '+form1.Memo1.Lines[7];
end;

procedure TFrame123.sSpeedButton5Click(Sender: TObject);
begin
form1.sSkinManager1.SkinName:='Office2007 Black (internal)';
form1.Memo1.Lines[7]:='Office2007 Black (internal)';
form1.TrayIcon1.BalloonHint:='义爨: '+form1.Memo1.Lines[7];
end;

procedure TFrame123.sSpeedButton7Click(Sender: TObject);
begin
form1.sSkinManager1.SkinName:='Cappuccino (internal)';
form1.Memo1.Lines[7]:='Cappuccino (internal)';
form1.TrayIcon1.BalloonHint:='义爨: '+form1.Memo1.Lines[7];
end;

procedure TFrame123.Timer1Timer(Sender: TObject);
begin
if form1.sSkinManager1.SkinName<>form1.Memo1.Lines[7] then
begin
if form1.Memo1.Lines[7]='Vista (internal)' then form1.sSkinManager1.SkinName:='Vista (internal)';
if form1.Memo1.Lines[7]='Office2007 Black (internal)'then form1.sSkinManager1.SkinName:='Office2007 Black (internal)';
if form1.Memo1.Lines[7]='Cappuccino (internal)'then form1.sSkinManager1.SkinName:='Cappuccino (internal)';
end;

hs:=form1.sSkinManager1.SkinName;
form1.TrayIcon1.Hint:='Info Utility v.5.1'+#13+'义爨: '+hs;

if form1.sSkinManager1.SkinName='Vista (internal)' then sSpeedButton1.Down:=true;
if form1.sSkinManager1.SkinName='Office2007 Black (internal)' then sSpeedButton5.Down:=true;
if form1.sSkinManager1.SkinName='Cappuccino (internal)' then sSpeedButton7.Down:=true;


timer1.Enabled:=false;
timer1.Free;

end;

end.
