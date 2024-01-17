program Principal;

uses
  Vcl.Forms,
  backend in 'backend.pas' {FrmPrincipal},
  uDMConexao in 'dm\uDMConexao.pas' {DMConexao: TDataModule},
  uController.Products in 'controllers\uController.Products.pas',
  services.product in 'services\services.product.pas' {ServicesProduct: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrincipal, FrmPrincipal);
  Application.CreateForm(TDMConexao, DMConexao);
  Application.CreateForm(TServicesProduct, ServicesProduct);
  Application.Run;
end.
