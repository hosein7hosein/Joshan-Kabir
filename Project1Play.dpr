program Project1Play;

uses
  Forms,
  Windows,
  Unit1MainForm in 'Unit1MainForm.pas' {Form1Main},
  Unit2Goto in 'Unit2Goto.pas' {FormGoto},
  Unit3Set in 'Unit3Set.pas' {Form1Set},
  Unit4Splash in 'Unit4Splash.pas' {Form1Splash},
  Unit1About in 'Unit1About.pas' {Form1About};

{$R *.res}

begin
  Application.Initialize;
  Application.Title := 'ÃÊ‘‰ ò»Ì—';
  Form1Splash := TForm1Splash.Create(nil) ;
  Form1Splash.Show;
  Form1Splash.Update;
  Sleep(3000);
  Application.CreateForm(TForm1Main, Form1Main);
  Application.CreateForm(TFormGoto, FormGoto);
  Application.CreateForm(TForm1Set, Form1Set);
  Application.CreateForm(TForm1About, Form1About);
  Form1Splash.Hide;
  Form1Splash.Free;
  Application.Run;
end.
