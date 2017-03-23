unit Unit3Set;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, SkinCtrls, SkinBoxCtrls, StdCtrls, ExtCtrls,Inifiles,
  TntStdCtrls, CheckLst, TntCheckLst, Buttons, TntButtons;

type
  TForm1Set = class(TForm)
    dlgFont1: TFontDialog;
    dlgFont2: TFontDialog;
    dlgFont3: TFontDialog;
    btn1: TTntButton;
    btn2: TTntButton;
    btn3: TTntButton;
    TntSpeedButton1: TTntSpeedButton;
    TntComboBox1: TTntComboBox;
    TntLabel1: TTntLabel;
    procedure btn1Click(Sender: TObject);
    procedure btn2Click(Sender: TObject);
    procedure btn3Click(Sender: TObject);
    procedure TntSpeedButton1Click(Sender: TObject);
    procedure TntComboBox1Change(Sender: TObject);
    procedure FormActivate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1Set: TForm1Set;

implementation

uses Math, Unit1MainForm;

{$R *.dfm}
procedure SaveFont(FName: string; Section: string; smFont: TFont);
var
  FStream: TIniFile;
begin
  FStream := TIniFile.Create(FName);
  try
    FStream.WriteString(Section, 'Name', smFont.Name);
    FStream.WriteInteger(Section, 'CharSet', smFont.CharSet);
    FStream.WriteInteger(Section, 'Color', smFont.Color);
    FStream.WriteInteger(Section, 'Size', smFont.Size);
    FStream.WriteInteger(Section, 'Style', Byte(smFont.Style));
  finally
    FStream.Free;
  end;
end;
procedure TForm1Set.btn1Click(Sender: TObject);
begin
dlgFont1.Font := Form1Main.TntDBText3.Font;
If dlgFont1.Execute then begin
SaveFont(MainPath+'set.ini', 'Ar', dlgFont1.Font);
Form1Main.TntDBText3.Font := dlgFont1.Font;
end;
end;

procedure TForm1Set.btn2Click(Sender: TObject);
begin
  dlgFont1.Font := Form1Main.TntDBText2.Font;
If dlgFont1.Execute then begin
SaveFont(MainPath+'set.ini', 'Fa', dlgFont1.Font);
Form1Main.TntDBText2.Font := dlgFont1.Font;
end;
end;

procedure TForm1Set.btn3Click(Sender: TObject);
begin
  dlgFont1.Font := Form1Main.TntDBText4.Font;
If dlgFont1.Execute then begin
SaveFont(MainPath+'set.ini', 'Nu', dlgFont1.Font);
Form1Main.TntDBText4.Font := dlgFont1.Font;
end;
end;

procedure TForm1Set.TntSpeedButton1Click(Sender: TObject);
begin
if (TntComboBox1.ItemIndex > -1) and (TntComboBox1.ItemIndex<5) then
Form1Main.spSkinData1.SkinIndex := TntComboBox1.ItemIndex;
close;
end;

procedure TForm1Set.TntComboBox1Change(Sender: TObject);
begin
if (TntComboBox1.ItemIndex > -1) and (TntComboBox1.ItemIndex<5) then begin
  IniFile.WriteInteger('Set','Skin',TntComboBox1.ItemIndex) ;
end else ShowMessage('Invalid Skin!!!');
  //Form1Main.spSkinData1.SkinIndex := TntComboBox1.ItemIndex;

end;

procedure TForm1Set.FormActivate(Sender: TObject);
begin
TntComboBox1.ItemIndex := IniFile.ReadInteger('Set','Skin',1) ;
end;

end.
