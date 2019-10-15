program conversorFbToMongo;

uses
  Vcl.Forms,
  UfrmPrincipal in '..\src\forms\UfrmPrincipal.pas' {Form1},
  Vcl.Themes,
  Vcl.Styles;

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Cobalt XEMedia');
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
