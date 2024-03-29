unit uDMConexao;

interface

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
  FireDAC.Comp.DataSet;

type
  TDMConexao = class(TDataModule)
    con: TFDConnection;
    FDPhysFBDriverLink: TFDPhysFBDriverLink;
    FDQuery: TFDQuery;
    procedure DataModuleCreate(Sender: TObject);
  private
    { Private declarations }
  public
    function ExecuteScalar(SQL: string): Variant;
    function ExecuteReader(SQL: string): OleVariant;
    procedure ExecuteCommand(SQL: string; NomeCampo: Integer; NomeParametroSQL: string);

    constructor Create; reintroduce;
  end;

var
  DMConexao: TDMConexao;

implementation

{%CLASSGROUP 'Vcl.Controls.TControl'}

uses
  backend;

{$R *.dfm}

procedure ConnectionDB(con: TFDConnection); stdcall; external 'DLL.Connection.dll' name 'ConnectionDB';
{ TDMConexao }

{$REGION ' constructor'}
constructor TDMConexao.Create;
begin
  inherited Create(nil);
end;
{$ENDREGION}

{$REGION ' DMCreate'}
procedure TDMConexao.DataModuleCreate(Sender: TObject);
var
  auxError: string;
begin

  if con.Connected then
    con.Close;
  con.Params.Clear;

  try

    ConnectionDB(con);

  except

    on E: exception do
    begin
      auxError := Copy(E.Message, 20, 500);
      MessageDlg('Erro ao tentar se conectar com o banco de dados.' + #13 + #13 + 'Motivo:' + #13 + #13 + '' + auxError, TMsgDlgType.mtWarning, [TMsgDlgBtn.mbOK], 0);
    end;

  end;
end;

{$ENDREGION}

{$REGION ' Functions'}
procedure TDMConexao.ExecuteCommand(SQL: string; NomeCampo: Integer; NomeParametroSQL: string);
begin
//
end;

function TDMConexao.ExecuteReader(SQL: string): OleVariant;
begin
  FDQuery.SQL.Text := SQL;

  FDQuery.Open;
  result := FDQuery.Data;
end;

function TDMConexao.ExecuteScalar(SQL: string): Variant;
begin
  FDQuery.Close;
  FDQuery.SQL.Clear;
  FDQuery.SQL.Add(SQL);

  FDQuery.Open;
  result := FDQuery.Fields[0].AsString;
end;
{$ENDREGION}

end.

