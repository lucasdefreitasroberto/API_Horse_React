unit Principal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants,
  System.Classes, Vcl.Graphics, Vcl.Controls, Vcl.Forms, Vcl.Dialogs,
  Vcl.StdCtrls, Horse, Horse.Jhonson, System.JSON, Vcl.Buttons, ShellApi,
  Controller.product, uDMConexao, Vcl.ExtCtrls, Horse.CORS;

type
  TForm1 = class(TForm)
    Button1: TButton;
    btnUrl: TBitBtn;
    Panel1: TPanel;
    lblstatus: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure btnUrlClick(Sender: TObject);
  private
                { Private declarations }
  public
                { Public declarations }
    procedure methods;
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.btnUrlClick(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'http://localhost:4000/', nil, nil, SW_SHOWMAXIMIZED);
end;

procedure TForm1.Button1Click(Sender: TObject);
begin

  if (THorse.IsRunning = false) then
  begin
    Button1.Caption := 'Paused';
    lblstatus.Caption := 'Server running on port 4000...';
    btnUrl.Enabled := not THorse.IsRunning;
    btnUrl.Visible:= True;
    methods;
    THorse.Listen(4000);

                // TDMConexao.Create(Self);
  end
  else
  begin
    Button1.Caption := 'Start';
    lblstatus.Caption := 'Server paused';
    btnUrl.Enabled := not THorse.IsRunning;
    btnUrl.Visible := False;
    THorse.StopListen;
                // DMConexao.Free;
  end;

end;

procedure TForm1.methods;
begin

  THorse.Use(Jhonson());
  THorse.Use(CORS);

  THorse.Get('/',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    begin
      Res.Send('<h1> Servidor Funcionando</h1>')
    end);

  THorse.Get('/ping',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    begin
      Res.Send<TJSONObject>(TJSONObject.Create.AddPair('nome', 'Lucas De Freitas Roberto'));
    end);

  Controller.product.Registry;


end;

end.

