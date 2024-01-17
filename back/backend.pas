unit backend;

interface

uses
  Winapi.Windows,
  Winapi.Messages,
  System.SysUtils,
  System.Variants,
  System.Classes,
  Vcl.Graphics,
  Vcl.Controls,
  Vcl.Forms,
  Vcl.Dialogs,
  Vcl.StdCtrls,
  Horse,
  Horse.Logger,
  Horse.Jhonson,
  Horse.HandleException,
  Horse.CORS,
  Vcl.ExtCtrls,
  Vcl.Buttons,
  System.JSON,
  ShellApi,
  uDMConexao,
  uController.Products, Vcl.AppEvnts, Vcl.Menus;

type
  TFrmPrincipal = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    btnUrl: TBitBtn;
    btnStart: TButton;
    lblStatus: TLabel;
    aplctnvnts: TApplicationEvents;
    trycn: TTrayIcon;
    pm: TPopupMenu;
    Sair: TMenuItem;
    Abrir: TMenuItem;
    procedure btnStartClick(Sender: TObject);
    procedure btnUrlClick(Sender: TObject);
    procedure aplctnvntsMinimize(Sender: TObject);
    procedure trycnDblClick(Sender: TObject);
    procedure SairClick(Sender: TObject);
    procedure AbrirClick(Sender: TObject);
  private
    procedure VisualStart;
    procedure VisualStop;

  public
    procedure methods;
    procedure Registry;
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.dfm}

procedure TFrmPrincipal.btnUrlClick(Sender: TObject);
begin
  ShellExecute(Handle, 'open', 'http://localhost:9000/', nil, nil, SW_SHOWMAXIMIZED);
end;

procedure TFrmPrincipal.btnStartClick(Sender: TObject);
begin

  if (THorse.IsRunning = false) then
  begin
    DMConexao.con.Open;
    if DMConexao.con.Connected then
    begin
      methods;
      Registry;
      THorse.Listen(9000);
      VisualStart;
    end;

  end
  else
    VisualStop;

end;

procedure TFrmPrincipal.methods;
begin

  THorse.Use(Jhonson());
  THorse.Use(CORS);

  THorse.Get('/',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    begin
      Res.Send('<h3>Server running ....</h3>')
    end);

  THorse.Get('/dev',
    procedure(Req: THorseRequest; Res: THorseResponse; Next: TProc)
    begin
      Res.Send<TJSONObject>(TJSONObject.Create.AddPair('nome', 'Lucas De Freitas Roberto'));
    end);

end;

procedure TFrmPrincipal.Registry;
begin
  uController.Products.Registry;
end;

procedure TFrmPrincipal.VisualStop;
begin
  btnStart.Caption := 'Start';
  lblstatus.Caption := 'Server paused';
  btnUrl.Enabled := not THorse.IsRunning;
  btnUrl.Visible := not THorse.IsRunning;
  THorse.StopListen;
end;
procedure TFrmPrincipal.VisualStart;
begin
  btnStart.Caption := 'Paused';
  lblstatus.Caption := 'Server running on port 9000...';
  btnUrl.Enabled := THorse.IsRunning;
  btnUrl.Visible := THorse.IsRunning;
end;

procedure TFrmPrincipal.aplctnvntsMinimize(Sender: TObject);
begin
  self.Hide;
  Self.WindowState := wsMaximized;
  trycn.Visible := True;
  trycn.Animate := True;
  trycn.ShowBalloonHint;
end;

procedure TFrmPrincipal.trycnDblClick(Sender: TObject);
begin
  trycn.Visible := False;
  Show();
  WindowState := wsNormal;
  Application.BringToFront();
end;

procedure TFrmPrincipal.SairClick(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TFrmPrincipal.AbrirClick(Sender: TObject);
begin
  trycn.Visible := False;
  Show();
  WindowState := wsNormal;
  Application.BringToFront();
end;
end.

