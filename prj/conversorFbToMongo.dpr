program conversorFbToMongo;

uses
  Vcl.Forms,
  UfrmPrincipal in '..\src\forms\UfrmPrincipal.pas' {frmPrincipal},
  Vcl.Themes,
  Vcl.Styles,
  UdmConexao in '..\src\units\UdmConexao.pas' {dmConexao: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  TStyleManager.TrySetStyle('Cobalt XEMedia');
  Application.CreateForm(TfrmPrincipal, frmPrincipal);
  Application.CreateForm(TdmConexao, dmConexao);
  Application.Run;
end.
