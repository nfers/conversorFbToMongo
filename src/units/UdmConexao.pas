unit UdmConexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.MongoDBDataSet,
  FireDAC.Comp.BatchMove.DataSet, FireDAC.Comp.BatchMove,
  FireDAC.Comp.BatchMove.SQL, FireDAC.Phys.FBDef, FireDAC.Phys.IBBase,
  FireDAC.Phys.FB;

type
  TdmConexao = class(TDataModule)
    ConFb: TFDConnection;
    ConMongo: TFDConnection;
    BatchMoveSqlReader: TFDBatchMoveSQLReader;
    BatchMove: TFDBatchMove;
    BatchMoveDataSetWriter: TFDBatchMoveDataSetWriter;
    qryMongo: TFDMongoQuery;
    FDPhysFBDriverLink1: TFDPhysFBDriverLink;
  private
    { Private declarations }
  public
    { Public declarations }
    function ConectaFirebird(sCaminho: string): Boolean;
    procedure ConectaMongo;
  end;

var
  dmConexao: TdmConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

uses UfrmPrincipal;

{ TdmConexao }

function TdmConexao.ConectaFirebird(sCaminho: string): Boolean;
begin
  Result := False;
  ConFb  := TFDConnection.Create(Nil);
  try
   ConFb.DriverName             := 'FB';
   ConFb.Params.Database        := sCaminho;
   ConFb.Params.UserName        := 'SYSDBA';
   ConFb.Params.Password        := 'masterkey';
   try
    ConFb.Connected          := True;
    if  ConFb.Connected = True then
     begin
      frmPrincipal.lblFirebird.Caption := sCaminho;
      frmPrincipal.mmLogPrinc.Lines.Add(Format('Conectado no banco: %s' ,[sCaminho]));
     end;
   except
    on E: EFDDBEngineException do
     case E.Kind of
      ekUserPwdInvalid:
       frmPrincipal.mmLogPrinc.Lines.Add(Format('Erro: %s' ,[E.Message]));
      ekUserPwdExpired:
       frmPrincipal.mmLogPrinc.Lines.Add(Format('Erro: %s' ,[E.Message]));
      ekServerGone:
       frmPrincipal.mmLogPrinc.Lines.Add(Format('Erro: %s' ,[E.Message]));
      else                // other issues
      frmPrincipal.mmLogPrinc.Lines.Add(Format('Erro: %s' ,[E.Message]));
     end;
   end;
  finally
   Result:= True;
  end;
end;

procedure TdmConexao.ConectaMongo;
begin
  ConMongo    := TFDConnection.Create(Nil);
  try
   ConMongo.DriverName             := 'Mongo';
   ConMongo.Params.Database        := 'db_migrate';
   try
    ConMongo.Connected          := True;
    if  ConMongo.Connected = True then
     begin
      frmPrincipal.lblMongoDb.Caption := ConMongo.Params.Database;
      frmPrincipal.mmLogPrinc.Lines.Add(Format('Conectado no banco: %s' ,[ConMongo.Params.Database]));
     end;
   except
    on E: EFDDBEngineException do
     case E.Kind of
      ekUserPwdInvalid:
       frmPrincipal.mmLogPrinc.Lines.Add(Format('Erro: %s' ,[E.Message]));
      ekUserPwdExpired:
       frmPrincipal.mmLogPrinc.Lines.Add(Format('Erro: %s' ,[E.Message]));
      ekServerGone:
       frmPrincipal.mmLogPrinc.Lines.Add(Format('Erro: %s' ,[E.Message]));
      else                // other issues
      frmPrincipal.mmLogPrinc.Lines.Add(Format('Erro: %s' ,[E.Message]));
     end;
   end;
  finally
  end;
end;

end.
