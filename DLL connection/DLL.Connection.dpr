library DLL.Connection;

uses
  System.SysUtils,
  System.Classes,
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
  Vcl.Dialogs,
  FireDAC.Stan.Param,
  FireDAC.DatS,
  FireDAC.DApt.Intf,
  FireDAC.DApt,
  FireDAC.Comp.DataSet,
  ShellAPI,
  Windows;


{$R *.res}
procedure ConnectionDB(con: TFDConnection);
begin
  const driver = 'FB';
  const database = 'C:\Users\HAHA\Desktop\CRUD-Horse\backend\dados\PRODUCTS.FDB';
  const password = 'masterkey';
  const user = 'SYSDBA';
  const protocol = 'LOCAL';
  const server = '';
  const port = 3050;


  con.Params.Add('DriverID=' + driver);
  con.Params.Add('Database=' + database);
  con.Params.Add('Password=' + password);
  con.Params.Add('User_Name=' + user);
  con.Params.Add('Protocol=' + protocol);
  con.Params.Add('Server=' + server);
  con.Params.Add('Port=' + System.SysUtils.IntToStr(port));

end;

exports
  ConnectionDB;

begin
end.

