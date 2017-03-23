unit Unit1About;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, Buttons, TntButtons, ComCtrls, TntComCtrls, StdCtrls,
  TntStdCtrls;

type
  TForm1About = class(TForm)
    TntPageControl1: TTntPageControl;
    TntSpeedButton1: TTntSpeedButton;
    TntTabSheet1: TTntTabSheet;
    TntTabSheet2: TTntTabSheet;
    TntTabSheet3: TTntTabSheet;
    TntTabSheet4: TTntTabSheet;
    TntTabSheet5: TTntTabSheet;
    TntMemo1: TTntMemo;
    TntMemo2: TTntMemo;
    TntMemo3: TTntMemo;
    TntMemo4: TTntMemo;
    TntMemo5: TTntMemo;
    procedure TntSpeedButton1Click(Sender: TObject);
    procedure FormShow(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1About: TForm1About;

implementation

{$R *.dfm}

procedure TForm1About.TntSpeedButton1Click(Sender: TObject);
begin
Close;
end;

procedure TForm1About.FormShow(Sender: TObject);
var
  i1 :Word;
begin
for i1 := Form1About.ComponentCount - 1 downto 0 do
begin
  if Form1About.Components[i1] is TTntMemo then
    TTntMemo(Form1About.Components[i1]).Font.Name := 'NoorMitra';
  if Form1About.Components[i1] is TTntTabSheet then
  TTntTabSheet(Form1About.Components[i1]).Font.Name := 'NoorMitra';
end;
end;

end.
