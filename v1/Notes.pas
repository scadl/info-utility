unit Notes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, sFrameAdapter, StdCtrls, ComCtrls, sRichEdit, ExtCtrls, Buttons,
  sSpeedButton;

type
  TFrame1 = class(TFrame)
    sFrameAdapter1: TsFrameAdapter;
    pass1timer: TTimer;
    sRichEdit1: TRichEdit;
    procedure sRichEdit1KeyUp(Sender: TObject; var Key: Word;
      Shift: TShiftState);
    procedure pass1timerTimer(Sender: TObject);


  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frame1: TFrame1;

implementation

{$R *.dfm}

uses Main;



procedure TFrame1.pass1timerTimer(Sender: TObject);
begin
SetCurrentDir(cd_str);
sRichEdit1.Lines.LoadFromFile('notes.dat');

form1.TrayIcon1.Hint:='Info Utility v.5.1'+#13+'Начало заметки: '+sRichEdit1.Lines[0]+#13+
sRichEdit1.Lines[1]+#13+sRichEdit1.Lines[2]+'...';

pass1timer.Enabled:=false;
pass1timer.Free;
end;

procedure TFrame1.sRichEdit1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
SetCurrentDir(cd_str);
sRichEdit1.Lines.SaveToFile('notes.dat');
end;

end.
