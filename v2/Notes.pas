unit Notes;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, sFrameAdapter, StdCtrls, ComCtrls, sRichEdit, ExtCtrls, Buttons,
  sSpeedButton, sComboBox, sFontCtrls, sHintManager, sMemo, Menus;

type
  TFrame1 = class(TFrame)
    sFrameAdapter1: TsFrameAdapter;
    pass1timer: TTimer;
    sComboBox1: TsComboBox;
    sSpeedButton1: TsSpeedButton;
    FontDialog1: TFontDialog;
    sHintManager1: TsHintManager;
    sMemo1: TsMemo;
    sSpeedButton2: TsSpeedButton;
    sSpeedButton3: TsSpeedButton;
    Memo1: TMemo;
    procedure pass1timerTimer(Sender: TObject);
    procedure sComboBox1Change(Sender: TObject);
    procedure sSpeedButton1Click(Sender: TObject);
    procedure sMemo1Exit(Sender: TObject);
    procedure sMemo1KeyUp(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure sSpeedButton2Click(Sender: TObject);
    procedure sSpeedButton3Click(Sender: TObject);
    procedure sComboBox1KeyPress(Sender: TObject; var Key: Char);



  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Frame1: TFrame1;
  ni:integer;
  curnote:string;
  MemFont:Tfont;

implementation

{$R *.dfm}

uses Main;









procedure TFrame1.pass1timerTimer(Sender: TObject);
var fex:textfile;
begin
ni:=1;

sComboBox1.Clear;
repeat
 Memo1.Lines.LoadFromFile('notes'+inttostr(ni)+'.dat');
 sComboBox1.Items.Add(Memo1.lines[0]);
 ni:=ni+1;
until (FileExists(cd_str+'/notes'+IntToStr(ni)+'.dat')=false);

Memo1.Lines.Clear;

SetCurrentDir(cd_str);
sMemo1.Lines.LoadFromFile(form1.memo1.Lines[11]);
sComboBox1.ItemIndex:=strtoint(form1.memo1.Lines[11][6])-1;
curnote:=form1.memo1.Lines[11];

form1.TrayIcon1.Hint:='Info Utility v.5.1'+#13+'Начало заметки: '+sMemo1.Lines[0]+#13+
sMemo1.Lines[1]+#13+sMemo1.Lines[2]+'...';

sMemo1.Font.Name:=form1.memo1.Lines[9];
sMemo1.Font.Size:=strtoint(form1.memo1.Lines[10]);

//fmb:=StrToBool(form1.memo1.Lines[8]);

pass1timer.Enabled:=false;
pass1timer.Free;

//sMemo1.Color:=$00c6f1f9;
end;

procedure TFrame1.sComboBox1Change(Sender: TObject);
begin
sMemo1.Lines.Clear;
sMemo1.Font.Name:=form1.memo1.Lines[9];
sMemo1.Font.Size:=strtoint(form1.memo1.Lines[10]);
sMemo1.Lines.LoadFromFile('notes'+inttostr(sComboBox1.ItemIndex+1)+'.dat');
curnote:='notes'+inttostr(sComboBox1.ItemIndex+1)+'.dat';

form1.memo1.Lines[11]:=curnote;
form1.Memo1.Lines.SaveToFile('settings.dat');

//sMemo1.Color:=$00c6f1f9;

//form1.sFrameBar1.Items[2].Caption:=sMemo1.Font.Name+' '+inttostr(sMemo1.Font.Size)

end;

procedure TFrame1.sComboBox1KeyPress(Sender: TObject; var Key: Char);
begin
key:=#0;
end;

procedure TFrame1.sMemo1Exit(Sender: TObject);
begin
 sComboBox1.Items[sComboBox1.ItemIndex]:=sMemo1.Lines[0];
 if (sMemo1.Lines[0]='') or (sMemo1.Lines[0]=' ') then Application.MessageBox('Вы не ввели заголовок заметки - '+#13+'Заметка будет отбражаться путстой строкой в списке!','',MB_OK+MB_ICONEXCLAMATION)

end;


procedure TFrame1.sMemo1KeyUp(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
 SetCurrentDir(cd_str);
 sMemo1.Lines.SaveToFile(curnote);

 sComboBox1.Text:=sMemo1.Lines[0];
end;

procedure TFrame1.sSpeedButton1Click(Sender: TObject);
begin

if FontDialog1.Execute then
begin
sMemo1.Font:=FontDialog1.Font;
form1.memo1.Lines[9]:=FontDialog1.Font.Name;
form1.memo1.Lines[10]:=inttostr(FontDialog1.Font.Size);
//form1.memo1.Lines[11]:=FontDialog1.Font.Style;
form1.Memo1.Lines.SaveToFile('settings.dat');
end;

end;

procedure TFrame1.sSpeedButton2Click(Sender: TObject);
var f:textfile; cap:AnsiString;
begin
if FileExists('notes'+inttostr(ni)+'.dat') then ni:=ni+1;

AssignFile(f,'notes'+inttostr(ni)+'.dat');
Rewrite(f);
cap:='Новая заметка';
Writeln(f,cap);
CloseFile(f);

sComboBox1.Items.Add('Новая заметка');
Application.MessageBox('Новая заметка создана, и добавлена в конец списка'+#13+'с именем "Новая заметка"','Выполнено:',MB_OK+MB_ICONINFORMATION);
end;

procedure TFrame1.sSpeedButton3Click(Sender: TObject);
var mb2res:integer; readerlist:TStrings; cap:PWideChar;
begin
readerlist:=TStringList.Create;
readerlist.Text:='';

if not FileExists('notes'+inttostr(ni)+'.dat') then ni:=ni-1;

readerlist.LoadFromFile('notes'+IntToStr(ni)+'.dat');
cap:=Pchar('Будет удалена последняя заметка с заголовком:'+#13+'"'+readerlist[0]+'"');
mb2res:=Application.MessageBox(cap,'Внимание!',MB_YESNO+MB_ICONQUESTION);
readerlist.Clear;

if mb2res=6 then
begin
DeleteFile('notes'+IntToStr(ni)+'.dat');
sComboBox1.Items.Delete(ni-1);
if curnote='notes'+IntToStr(ni)+'.dat' then
begin
  sMemo1.Lines.LoadFromFile('notes'+IntToStr(ni-1)+'.dat');
end;
end;

end;

end.
