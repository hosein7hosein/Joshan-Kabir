unit Unit2Goto;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, TntStdCtrls;

type
  TFormGoto = class(TForm)
    TntLabel1: TTntLabel;
    TntEdit1: TTntEdit;
    btn1: TTntButton;
    procedure TntEdit1KeyPress(Sender: TObject; var Key: Char);
    procedure btn1Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FormGoto: TFormGoto;

implementation

uses
  Unit1MainForm;

{$R *.dfm}

procedure TFormGoto.TntEdit1KeyPress(Sender: TObject; var Key: Char);
begin
 if not (Key in [#8, '0'..'9']) then begin
    ShowMessage('Invalid key');
    Key := #0;
  end;
end;

const
   SectionsID : array[1..100] of Integer = (1, 15, 26, 37, 48, 60, 71, 82, 93, 105, 116, 127, 138, 150, 161, 172, 183, 195, 206, 217, 228, 240, 251, 262, 273, 285, 296, 307, 318, 330, 341, 352, 364, 375, 386, 397, 409, 420, 431, 442, 454, 465, 476, 487, 499, 510, 521, 532, 543, 555, 566, 577, 588, 600, 611, 623, 634, 646, 657, 668, 679, 691, 702, 713, 724, 736, 747, 758, 769, 781, 792, 803, 814, 826, 837, 848, 859, 871, 882, 893, 904, 916, 927, 938, 949, 961, 972, 983, 994, 1006, 1017, 1028, 1039, 1051, 1062, 1073, 1084, 1096, 1107, 1118);
procedure TFormGoto.btn1Click(Sender: TObject);
begin
  try
if (StrToInt(TntEdit1.Text)>0) and (StrToInt(TntEdit1.Text)<101) then begin
  Form1Main.UniDataSource1.DataSet.RecNo := SectionsID[StrToInt(TntEdit1.Text)];
  Form1Main.UniDataSource1.DataSet.Prior;
  Form1Main.MediaPlayer1.Position := Form1Main.UniDataSource1.DataSet.FieldByName('EndFrame').AsInteger +1;
  Form1Main.UniDataSource1.DataSet.Next;
  Form1Main.MediaPlayer1.Play;
  Form1Main.Timer1.Enabled:=True;
  close;
  end
  else ShowMessage('Invalid Range');


except
    on E : Exception do
      ShowMessage(E.ClassName+' error raised, with message : '+E.Message + 'ãÊÇÓÝÇäå ÇíÑÇÏí ÈÑæÒ ˜ÑÏ. áØÝÇ Çíä ÇíÑÇÏ ÑÇ Èå ÂÏÑÓ h.moh@rayana.ir Çíãíá äãÇííÏ' );

end;
end;
end.
