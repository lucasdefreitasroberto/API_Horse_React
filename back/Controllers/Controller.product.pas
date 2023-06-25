unit Controller.product;

interface

uses
  Horse, system.JSON, Data.FMTBcd, Datasnap.DBClient, Data.DB, Data.SqlExpr,
  Datasnap.Provider, system.SysUtils, uDMConexao, DataSetConverter4D,
  DataSetConverter4D.Impl, DataSetConverter4D.Util, DataSetConverter4D.Helper;

procedure Registry;

procedure Get(Req: THorseRequest; Res: THorseResponse; Next: TProc);

procedure GetID(Req: THorseRequest; Res: THorseResponse; Next: TProc);

implementation

procedure Registry;
begin
  THorse.Get('/product', Get);
  THorse.Get('/product/:id', GetID);
end;

procedure Get(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  SQL: string;
begin
  SQL := 'select ID_PRODUTO, DESCRICAO, VALOR from PRODUTO';
  Res.Send<TJSONArray>(DMConexao.ExecuteReaderJSONArray(SQL));
end;

procedure GetID(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  SQL: string;
begin
  SQL := 'select PRODUTO.ID_PRODUTO, PRODUTO.DESCRICAO, PRODUTO.VALOR from PRODUTO '+#13+
         'where PRODUTO.ID_PRODUTO = '+ Req.Params.Items['id'];

   Res.Send<TJSONObject>(DMConexao.ExecuteReaderJSONObject(SQL));
end;

end.

