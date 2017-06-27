program InfoUtility;

uses
  Forms,
  windows,
  Main in 'Main.pas' {Form1},
  DiskInfo in 'DiskInfo.pas' {FrameIn: TFrame},
  Alarmer in 'Alarmer.pas' {FrameIn2: TFrame},
  Notes in 'Notes.pas' {Frame1: TFrame},
  Settings in 'Settings.pas' {Frame12: TFrame},
  Thems in 'Thems.pas' {Frame123: TFrame};

{$R *.res}

var estyle:integer;

begin
  Application.Initialize;

  estyle:=getwindowlong(Application.Handle, gwl_exstyle);
  setwindowlong(application.Handle, gwl_exstyle, estyle or ws_ex_toolwindow);

  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
