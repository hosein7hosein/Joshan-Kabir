unit Unit4Splash;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, ExtCtrls, StdCtrls, TntStdCtrls, jpeg;

type
  TForm1Splash = class(TForm)
    img1: TImage;
    TntLabel1: TTntLabel;
    TntLabel2: TTntLabel;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1Splash: TForm1Splash;

implementation

{$R *.dfm}

procedure TForm1Splash.FormCreate(Sender: TObject);
var
  h12 :HWND;
  MainPath :string;
begin
  MainPath:=ExtractFilePath(Application.ExeName);
h12:= Application.Handle;
AddFontResource(PChar(MainPath+'fonts\EntezarD3.ttf')) ;
SendMessage(h12, WM_FONTCHANGE, 0, 0) ;

AddFontResource(PChar(MainPath+'fonts\NoorMitraBold.ttf')) ;
SendMessage(h12, WM_FONTCHANGE, 0, 0) ;
end;

end.
