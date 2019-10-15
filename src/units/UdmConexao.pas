unit UdmConexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.VCLUI.Wait,
  FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf, Data.DB,
  FireDAC.Comp.DataSet, FireDAC.Comp.Client, FireDAC.Phys.MongoDBDataSet,
  FireDAC.Comp.BatchMove.DataSet, FireDAC.Comp.BatchMove,
  FireDAC.Comp.BatchMove.SQL;

type
  TdmConexao = class(TDataModule)
    ConFb: TFDConnection;
    ConMongo: TFDConnection;
    BatchMoveSqlReader: TFDBatchMoveSQLReader;
    BatchMove: TFDBatchMove;
    BatchMoveDataSetWriter: TFDBatchMoveDataSetWriter;
    qryMongo: TFDMongoQuery;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  dmConexao: TdmConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

end.
