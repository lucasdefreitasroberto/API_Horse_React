unit uController.Products;

interface

uses
  Horse, Services.Product, DataSet.Serialize, System.JSON, System.SysUtils,
  Data.DB;

procedure Registry;

implementation
{$REGION ' DoListProducts'}

procedure DoListProducts(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LService: TServicesProduct;
begin
  LService := TServicesProduct.Create;
  try
    Res.Send<TJSONArray>(LService.ListAll.ToJSONArray()).Status(THTTPStatus.OK);
  finally
    LService.Free;
  end;
end;
{$ENDREGION}

{$REGION ' DoGetProduct'}

procedure DoGetProduct(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LService: TServicesProduct;
  id: Int64;
begin
  LService := TServicesProduct.Create;
  try
    id := Req.Params['id'].ToInt64;

    if LService.GetById(id).IsEmpty then
      raise EHorseException.New.Error('Not found').Status(THTTPStatus.NotFound);

    Res.Send<TJSONObject>(LService.FDQuery.ToJSONObject());
  finally
    LService.Free;
  end;
end;
{$ENDREGION}

{$REGION ' DoPostProduct'}

procedure DoPostProduct(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  LService: TServicesProduct;

begin
  LService := TServicesProduct.Create;

  try
    Res.Send<TJSONObject>(LService.Insert(Req.Body<TJSONObject>).ToJSONObject()).Status(THTTPStatus.Created);
  finally
    LService.Free;
  end;

end;

{$ENDREGION}

{$REGION ' DoPutProduct'}
procedure DoPutProduct(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  id: Int64;
  LService: TServicesProduct;
begin
  LService := TServicesProduct.Create;
  try
    id := Req.Params['id'].ToInt64;

    if LService.GetById(id).IsEmpty then
      raise EHorseException.New.Error('Not found').Status(THTTPStatus.NotFound);

    Res.Send<TJSONObject>(LService.Update(Req.Body<TJSONObject>).ToJSONObject());
  finally
    LService.Free;
  end;
end;
{$ENDREGION}

{$REGION ' DoDeleteProduct'}

procedure DoDeleteProduct(Req: THorseRequest; Res: THorseResponse; Next: TProc);
var
  id: Int64;
  LService: TServicesProduct;
begin
  LService := TServicesProduct.Create;
  try
    id := Req.Params['id'].ToInt64;

    if LService.GetById(id).IsEmpty then
      raise EHorseException.New.Error('Not found').Status(THTTPStatus.NotFound);

    if LService.Delete(id) then
      Res.Status(THTTPStatus.NoContent);
  finally
    LService.Free;
  end;
end;
{$ENDREGION}

{$REGION ' Registry'}

procedure Registry;
begin
  THorse.Get('/products', DoListProducts);
  THorse.Get('/products/:id', DoGetProduct);
  THorse.Post('/products', DoPostProduct);
  THorse.Put('/products/:id', DoPutProduct);
  THorse.Delete('/products/:id', DoDeleteProduct);
end;
{$ENDREGION}
end.

