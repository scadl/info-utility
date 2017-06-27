unit DiskInfo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Gauges, sFrameAdapter, StdCtrls, sCheckBox, ComCtrls, sTrackBar,
  FileCtrl, sLabel, acProgressBar, MSI_Common, MSI_Disk, ExtCtrls, sHintManager;

type
  TFrameIn = class(TFrame)
    sFrameAdapter1: TsFrameAdapter;
    sProgressBar1: TsProgressBar;
    sLabelFX1: TsLabelFX;
    DriveComboBox1: TDriveComboBox;
    MiTeC_Disk1: TMiTeC_Disk;
    Timer1: TTimer;
    pass1timer: TTimer;
    sHintManager1: TsHintManager;
    procedure DriveComboBox1Change(Sender: TObject);
    procedure pass1timerTimer(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form3: TFrameIn;
  str: string[1];

implementation

uses Main;

{$R *.dfm}


procedure TFrameIn.DriveComboBox1Change(Sender: TObject);
begin
form1.Memo1.Lines[0]:=DriveComboBox1.Drive;
end;

procedure TFrameIn.pass1timerTimer(Sender: TObject);
begin
str:=form1.Memo1.Lines[0];
DriveComboBox1.Drive:=str[1];
pass1timer.Enabled:=false;
pass1timer.Free;
end;

procedure TFrameIn.Timer1Timer(Sender: TObject);
begin
MiTeC_Disk1.Drive:=DriveComboBox1.Drive+':';
sProgressBar1.Max:=MiTeC_Disk1.Capacity div 1024 div 1024;
sProgressBar1.Position:=MiTeC_Disk1.FreeSpace div 1024 div 1024;
sLabelFX1.Caption:='—вободно на '+UpCase(DriveComboBox1.Drive)+':\ '+inttostr(MiTeC_Disk1.FreeSpace div 1024div 1024)+' ћб';

{case MiTeC_Disk1.MediaType of
dtUnknown:sLabelFX1.Caption:='Unknown disk type!';
dtNotExists:sLabelFX1.Caption:='Disk not in drive!';
dtRemovable:sLabelFX1.Caption:='flash drive';
dtCDROM: sLabelFX1.Caption:='It''s CD or DVD.';
end;}

if MiTeC_Disk1.FileSystem='CDFS' then sLabelFX1.Caption:=UpCase(DriveComboBox1.Drive)+':\ - это CD или DVD.';
if MiTeC_Disk1.capacity=0 then sLabelFX1.Caption:='”стройство '+UpCase(DriveComboBox1.Drive)+':\ - пустое!';



form1.TrayIcon1.Hint:='Info Utility v.5.1'+#13+sLabelFX1.Caption;
end;

end.
