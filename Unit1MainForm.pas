unit Unit1MainForm;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TntStdCtrls, Grids, DBGrids, TntDBGrids, DB, DBAccess,
  Uni, MemDS, UniProvider, SQLiteUniProvider, DBCtrls, TntDBCtrls, MPlayer,
  ExtCtrls, DynamicSkinForm, dsaadapter, SkinData, TntExtCtrls,Inifiles;

type
  TForm1Main = class(TForm)
    SQLiteUniProvider1: TSQLiteUniProvider;
    UniConnection1: TUniConnection;
    UniTable1: TUniTable;
    UniDataSource1: TUniDataSource;
    TntDBGrid1: TTntDBGrid;
    TntDBText1: TTntDBText;
    Timer1: TTimer;
    spDynamicSkinForm1: TspDynamicSkinForm;
    spSkinData1: TspSkinData;
    dsaSkinAdapter1: TdsaSkinAdapter;
    TntDBText2: TTntDBText;
    TntDBText3: TTntDBText;
    TntDBText4: TTntDBText;
    MediaPlayer1: TMediaPlayer;
    TntPanel1: TTntPanel;
    spCompressedSkinList1: TspCompressedSkinList;
    pnl1: TPanel;
    btn7: TTntButton;
    btn6: TTntButton;
    btn5: TTntButton;
    btn4: TTntButton;
    btn3: TTntButton;
    btn2: TTntButton;
    btn1: TTntButton;
    btn8: TTntButton;
    btn9: TTntButton;
    procedure btn9Click(Sender: TObject);
    procedure Timer1Timer(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure TntDBText4MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure TntDBText2MouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure btn4Click(Sender: TObject);
    procedure btn8Click(Sender: TObject);
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure btn5Click(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btn7Click(Sender: TObject);
    procedure btn6Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1Main: TForm1Main;
  MainPath: WideString;
  IniFile : TIniFile;
  StartPoint : Word; 
implementation

uses
  Unit2Goto, Unit3Set, Unit1About;

{$R *.dfm}
const
   SectionsID : array[1..100] of Integer = (1, 15, 26, 37, 48, 60, 71, 82, 93, 105, 116, 127, 138, 150, 161, 172, 183, 195, 206, 217, 228, 240, 251, 262, 273, 285, 296, 307, 318, 330, 341, 352, 364, 375, 386, 397, 409, 420, 431, 442, 454, 465, 476, 487, 499, 510, 521, 532, 543, 555, 566, 577, 588, 600, 611, 623, 634, 646, 657, 668, 679, 691, 702, 713, 724, 736, 747, 758, 769, 781, 792, 803, 814, 826, 837, 848, 859, 871, 882, 893, 904, 916, 927, 938, 949, 961, 972, 983, 994, 1006, 1017, 1028, 1039, 1051, 1062, 1073, 1084, 1096, 1107, 1118);
procedure LoadFont(FName: string; Section: string; smFont: TFont);
var
  FStream: TIniFile;

begin
  FStream := TIniFile.Create(Fname);
  try
    smFont.Name    := FStream.ReadString(Section, 'Name', smFont.Name);
    smFont.CharSet := TFontCharSet(FStream.ReadInteger(Section, 'CharSet', smFont.CharSet));
    smFont.Color   := TColor(FStream.ReadInteger(Section, 'Color', smFont.Color));
    smFont.Size    := FStream.ReadInteger(Section, 'Size', smFont.Size);
    smFont.Style   := TFontStyles(Byte(FStream.ReadInteger(Section, 'Style', Byte(smFont.Style))));
  finally
    FStream.Free;
  end;
end;   
procedure TForm1Main.btn9Click(Sender: TObject);
begin
if MediaPlayer1.Mode <> mpPlaying then begin
Timer1.Enabled:=True;
MediaPlayer1.Play;
btn9.Enabled:=False;
btn8.Enabled := True;
end;
end;

procedure TForm1Main.Timer1Timer(Sender: TObject);
begin
   if (MediaPlayer1.Position>UniDataSource1.DataSet.FieldByName('EndFrame').AsInteger)and not(UniTable1.Eof) then begin
   UniTable1.Next;
   IniFile.WriteInteger('Set','RecNo',UniTable1.RecNo);
  end;
  if UniTable1.Eof then
  Timer1.Enabled:=False;

if (MediaPlayer1.Mode = mpPlaying)and(btn9.Enabled)or not(btn8.Enabled) then begin
btn9.Enabled:=False;
btn8.Enabled := True;
end;
if (MediaPlayer1.Mode <> mpPlaying) then begin
 btn8.Enabled:=False;
 btn9.Enabled := True;

 Timer1.Enabled :=  False;
end;
end;
procedure TForm1Main.FormCreate(Sender: TObject);
var
    i1 : Word;
begin
try
MainPath:=ExtractFilePath(Application.ExeName);

LoadFont(MainPath+'set.ini', 'Ar', TntDBText3.Font);
LoadFont(MainPath+'set.ini', 'Fa', TntDBText2.Font);
LoadFont(MainPath+'set.ini', 'Nu', TntDBText4.Font);

IniFile := TIniFile.Create(MainPath+'Appset.ini') ;


spSkinData1.SkinIndex := IniFile.ReadInteger('Set','Skin',1) ;

UniConnection1.Database := MainPath + 'JoshaneKabir.db';
UniDataSource1.DataSet.Open;
MediaPlayer1.FileName := MainPath + 'JoshanKabir.mp3';
MediaPlayer1.Open;
UniTable1.Open;

StartPoint := IniFile.ReadInteger('Set','RecNo',1);

UniDataSource1.DataSet.RecNo := StartPoint;


  if  UniDataSource1.DataSet.RecNo = 1 then begin
     UniDataSource1.DataSet.First;
     MediaPlayer1.Position:= 0 ;
  end else begin

        UniDataSource1.DataSet.Prior;
        MediaPlayer1.Position := UniDataSource1.DataSet.FieldByName('EndFrame').AsInteger +1;
        UniDataSource1.DataSet.Next;
  end;


pnl1.Left := Screen.Width div 2 - pnl1.Width div 2;

Width := Screen.Width;
Height := Screen.Height;
Left := 0;
Top := 0;
for i1 := Form1Main.ComponentCount - 1 downto 0 do
begin
  if Form1Main.Components[i1] is TTntButton then
    TTntButton(Form1Main.Components[i1]).Font.Name := 'NoorMitra';
end;

except
    on E : Exception do
      ShowMessage(E.ClassName+' error raised, with message : '+E.Message + '„ «”›«‰Â «Ì—«œÌ »—Ê“ ò—œ. ·ÿ›« «Ì‰ «Ì—«œ —« »Â ¬œ—” h.moh@rayana.ir «Ì„Ì· ‰„«ÌÌœ' );

end;

end;
procedure TForm1Main.FormMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
TntPanel1.Hide;
end;

procedure TForm1Main.TntDBText4MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
TntPanel1.Show;
end;

procedure TForm1Main.TntDBText2MouseMove(Sender: TObject; Shift: TShiftState;
  X, Y: Integer);
begin
TntPanel1.Hide;
end;

procedure TForm1Main.btn4Click(Sender: TObject);
begin
FormGoto.ShowModal;
end;

procedure TForm1Main.btn8Click(Sender: TObject);
begin
if MediaPlayer1.Mode = mpPlaying then begin
MediaPlayer1.Pause;
btn8.Enabled:=False;
btn9.Enabled := True;
end;
end;

procedure TForm1Main.btn1Click(Sender: TObject);
var
  CurrentSection : Byte;
begin
  try
     CurrentSection := UniDataSource1.DataSet.FieldByName('SectionID').AsInteger;
  if  CurrentSection < 2 then begin
     UniDataSource1.DataSet.First;
     MediaPlayer1.Position:= 0 ;
  end else begin

        UniDataSource1.DataSet.RecNo := SectionsID[CurrentSection-1];
        UniDataSource1.DataSet.Prior;
        MediaPlayer1.Position := UniDataSource1.DataSet.FieldByName('EndFrame').AsInteger +1;
        UniDataSource1.DataSet.Next;
        end;

        MediaPlayer1.Play;
        Timer1.Enabled:=True;
        except
    on E : Exception do
      ShowMessage(E.ClassName+' error raised, with message : '+E.Message + '„ «”›«‰Â «Ì—«œÌ »—Ê“ ò—œ. ·ÿ›« «Ì‰ «Ì—«œ —« »Â ¬œ—” h.moh@rayana.ir «Ì„Ì· ‰„«ÌÌœ' );

end;
end;

procedure TForm1Main.btn2Click(Sender: TObject);
var
  CurrentSection : Byte;
begin
  try
     CurrentSection := UniDataSource1.DataSet.FieldByName('SectionID').AsInteger;
  if  CurrentSection > 99 then begin
     UniDataSource1.DataSet.RecNo:=1118;
     UniDataSource1.DataSet.Prior;
     MediaPlayer1.Position := UniDataSource1.DataSet.FieldByName('EndFrame').AsInteger +1;
     UniDataSource1.DataSet.Next;
  end else begin

        UniDataSource1.DataSet.RecNo := SectionsID[CurrentSection+1];
        UniDataSource1.DataSet.Prior;
        MediaPlayer1.Position := UniDataSource1.DataSet.FieldByName('EndFrame').AsInteger +1;
        UniDataSource1.DataSet.Next;
        end;
        
        MediaPlayer1.Play;
        Timer1.Enabled:=True;
 except
    on E : Exception do
      ShowMessage(E.ClassName+' error raised, with message : '+E.Message + '„ «”›«‰Â «Ì—«œÌ »—Ê“ ò—œ. ·ÿ›« «Ì‰ «Ì—«œ —« »Â ¬œ—” h.moh@rayana.ir «Ì„Ì· ‰„«ÌÌœ' );

end;
end;

procedure TForm1Main.btn3Click(Sender: TObject);
begin
MediaPlayer1.Position:=0;
UniDataSource1.DataSet.First;
MediaPlayer1.Play;
Timer1.Enabled:=True;
end;

procedure TForm1Main.btn5Click(Sender: TObject);
begin
if MediaPlayer1.Mode = mpPlaying then
btn8Click(nil);
if Timer1.Enabled then
Timer1.Enabled:=False;
Form1Set.ShowModal;
end;

procedure TForm1Main.FormClose(Sender: TObject; var Action: TCloseAction);
begin
IniFile.Free;
end;

procedure TForm1Main.btn7Click(Sender: TObject);
begin
Close;
end;

procedure TForm1Main.btn6Click(Sender: TObject);
begin
if MediaPlayer1.Mode = mpPlaying then
btn8Click(nil);
if Timer1.Enabled then
Timer1.Enabled:=False;
Form1About.ShowModal;
end;

end.
