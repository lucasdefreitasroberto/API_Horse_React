program Project1;

uses
  Vcl.Forms,
  Principal in 'Principal.pas' {Form1},
  Vcl.Themes,
  Vcl.Styles,
  Controller.product in 'Controllers\Controller.product.pas',
  uDmConexao in 'DM\uDmConexao.pas' {DMConexao: TDataModule};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  ReportMemoryLeaksOnShutdown := True;
  TStyleManager.TrySetStyle('Smokey Quartz Kamri');
  Application.CreateForm(TForm1, Form1);
  Application.CreateForm(TDMConexao, DMConexao);
  Application.Run;

end.
