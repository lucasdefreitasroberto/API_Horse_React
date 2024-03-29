unit uDmConexao;

interface

uses
  System.SysUtils, System.Classes, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf, FireDAC.Stan.Def,
  FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys, FireDAC.Phys.FB,
  FireDAC.Phys.FBDef, FireDAC.VCLUI.Wait, FireDAC.Stan.Param, FireDAC.DatS,
  FireDAC.DApt.Intf, FireDAC.DApt, Data.DB, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, System.JSON, DataSetConverter4D, DataSetConverter4D.Impl,
  DataSetConverter4D.Util, DataSetConverter4D.Helper, FireDAC.Phys.IBBase;

type
  TDMConexao = class(TDataModule)
    con: TFDConnection;
    FQuery: TFDQuery;
    FDPhysFBDriverLink: TFDPhysFBDriverLink;
  private
    { Private declarations }
  public
    { Public declarations }
    function ExecuteReaderJSONObject(SQL: string): TJSONObject;
    function ExecuteReaderJSONArray(SQL: string): TJSONArray;
    procedure ConectDB;
  end;

var
  DMConexao: TDMConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

procedure TDMConexao.ConectDB;
begin

  with con do
  begin
    Connected := False;
    DriverName := 'FB';
    LoginPrompt := False;
    Params.UserName := 'SYSDBA';
    Params.Password := 'masterkey';
    Params.Database := 'C:\Users\HAHA\Desktop\Horse\PRODUCTS.FDB';
  end;

  try
    FQuery.Connection := con;
    con.Open;
  except
    on E: Exception do
      raise Exception.Create('Erro ao Conectar na Base de Dados' + #13 + E.Message);
  end;

end;

function TDMConexao.ExecuteReaderJSONArray(SQL: string): TJSONArray;
begin
  FQuery.Close;
  FQuery.Open(SQL);
  Result := FQuery.AsJSONArray;
end;

function TDMConexao.ExecuteReaderJSONObject(SQL: string): TJSONObject;
begin
  FQuery.Close;
  FQuery.Open(SQL);
  Result := FQuery.AsJSONObject;
end;

end.

