unit UfrmPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls, Vcl.Buttons,
  FireDAC.Stan.Intf, FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf,
  FireDAC.Phys.Intf, FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async,
  FireDAC.Phys, FireDAC.VCLUI.Wait, Data.DB, FireDAC.Comp.Client, FireDAC.Phys.MongoDBDataSet;

type
  TfrmPrincipal = class(TForm)
    pnlPrinc: TPanel;
    mmLogPrinc: TMemo;
    btnDbFb: TSpeedButton;
    btnMigrar: TSpeedButton;
    btnBdMongo: TSpeedButton;
    lblFirebird: TLabel;
    lblMongoDb: TLabel;
    procedure btnMigrarClick(Sender: TObject);
    procedure btnDbFbClick(Sender: TObject);
    procedure btnBdMongoClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}
uses UdmConexao;

procedure TfrmPrincipal.btnBdMongoClick(Sender: TObject);
begin
  dmConexao.ConectaMongo;
end;

procedure TfrmPrincipal.btnDbFbClick(Sender: TObject);
begin
  dmConexao.ConectaFirebird('C:\Users\Desenvolvedor\Desktop\Tarefas\Tron x Tron\965408\948405.IDB');
end;

procedure TfrmPrincipal.btnMigrarClick(Sender: TObject);
var
  Tabelas: TStringList;
  i: integer;
begin
  Tabelas    := TStringList.Create;
  try
   dmConexao.ConFb.GetTableNames('', '', '', Tabelas, [osMy], [tkTable], true);
   dmConexao.qryMongo.DatabaseName := 'db_traininFit';

   for i := 0 to Tabelas.Count-1 do
    begin
     mmLogPrinc.Lines.add('Importando Tabela: ' + Tabelas[i]);
     if dmConexao.qryMongo = Nil then
      begin
       dmConexao.qryMongo  := TFDMongoQuery.Create(nil);
       dmConexao.qryMongo.Connection := dmConexao.MongoConnection;
       dmConexao.qryMongo.DatabaseName := 'db_traininFit';
       dmConexao.qryMongo.CollectionName        := 'Books';
       dmConexao.qryMongo.Active                := True;
      end;
     dmConexao.BatchMoveSqlReader.TableName   := Tabelas[i];
     dmConexao.qryMongo.Active                := False;
     dmConexao.qryMongo.CollectionName        := Tabelas[i];
     dmConexao.qryMongo.ServerDeleteAll();
     dmConexao.BatchMove.Mappings.Clear;
     dmConexao.BatchMove.Mappings.AddAll;
     dmConexao.BatchMove.Execute;
     dmConexao.qryMongo.Free;
    end;

  finally
  end;
end;


end.
