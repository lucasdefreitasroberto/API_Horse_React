unit services.product;

interface

uses
  System.SysUtils,
  System.Classes,
  uDMConexao,
  FireDAC.Stan.Intf,
  FireDAC.Stan.Option,
  FireDAC.Stan.Error,
  FireDAC.UI.Intf,
  FireDAC.Phys.Intf,
  FireDAC.Stan.Def,
  FireDAC.Stan.Pool,
  FireDAC.Stan.Async,
  FireDAC.Phys,
  FireDAC.Phys.FB,
  FireDAC.Phys.FBDef,
  FireDAC.VCLUI.Wait,
  FireDAC.Phys.IBBase,
  Data.DB,
  FireDAC.Comp.Client,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  System.JSON,
  DataSet.Serialize;

type
  TServicesProduct = class(TDMConexao)
  public
    function ListAll: TFDQuery;
    function GetById(const ID: Int64): TFDQuery;
    function Insert(const AProduct: TJSONObject): TFDQuery;
    function Update(const AProduct: TJSONObject): TFDQuery;
    function Delete(const AId: Int64): Boolean;
  end;

var
  ServicesProduct: TServicesProduct;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

{$R *.dfm}

{ TServiceProduct }

{$REGION ' Delete'}

function TServicesProduct.Delete(const AId: Int64): Boolean;
begin
  FDQuery.Delete;
  Result := FDQuery.IsEmpty;
end;

{$ENDREGION}

{$REGION ' GetById'}
function TServicesProduct.GetById(const ID: Int64): TFDQuery;
begin
  Result := FDQuery;
  FDQuery.SQL.Add('where id = :id');
  FDQuery.ParamByName('id').AsLargeInt := ID;
  FDQuery.Open();
end;
{$ENDREGION}

{$REGION ' Insert'}

function TServicesProduct.Insert(const AProduct: TJSONObject): TFDQuery;
var
  id: Int64;
  sqlGen: string;
begin
  sqlGen := 'select gen_id(GEN_PRODUCT_ID,1) from RDB$DATABASE';
  id := StrToInt(DMConexao.ExecuteScalar(sqlGen));

  Result := FDQuery;
  FDQuery.SQL.Add('where 1 <> 1');
  FDQuery.Open();

  AProduct.AddPair('id', id.ToString);
  FDQuery.LoadFromJSON(AProduct, False);
end;
{$ENDREGION}

{$REGION ' ListAll'}

function TServicesProduct.ListAll: TFDQuery;
begin
  Result := FDQuery;
  FDQuery.SQL.Add('order by ID');
  FDQuery.Open();
end;
{$ENDREGION}

{$REGION ' Insert'}

function TServicesProduct.Update(const AProduct: TJSONObject): TFDQuery;
begin
  Result := FDQuery;
  FDQuery.MergeFromJSONObject(AProduct, False);
end;
 {$ENDREGION}

end.

