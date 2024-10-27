unit classe_relatorios;

interface

uses
  FireDAC.Comp.Client, System.SysUtils, Vcl.Forms;

  type TRelatorios = Class
    private
      FConexao    : TFDConnection;
      FId         : Integer;
      FNome       : String;
      FDescricao  : String;
      FGrupo      : Integer;
      FSubGrupo   : Integer;
      FFr3        : String;
    public
      property Conexao    : TFDConnection read FConexao   write FConexao;
      property Id         : Integer       read FId        write FId;
      property Nome       : String        read FNome      write FNome;
      property Descricao  : String        read FDescricao write FDescricao;
      property Grupo      : Integer       read FGrupo     write FGrupo;
      property SubGrupo   : Integer       read FSubGrupo  write FSubGrupo;
      property Fr3        : String        read FFr3       write FFr3;

      constructor Create (Conexao : TFDConnection);
      destructor Destroy; Override;

      function inserir_alterar(TipoOperacao: String; out Erro: String): Boolean;
      procedure deletar(IdRelatorio: integer);
      function consulta(Texto: String): TFDQuery;
  End;

  var
    QryConsulta: TFDQuery;

implementation

{ TRelatorios }

constructor TRelatorios.Create(Conexao: TFDConnection);
begin
  FConexao               := Conexao;
  QryConsulta            := TFDQuery.Create( nil );
  QryConsulta.Connection := FConexao;
end;

function TRelatorios.consulta(Texto: String): TFDQuery;
begin
  try
    FConexao.Connected := False;
    FConexao.Connected := True;

    QryConsulta.SQL.Clear;
    QryConsulta.SQL.Add('SELECT ID, NOME, DESCRICAO, ID_GRUPO, ID_SUB_GRUPO, FR3');
    QryConsulta.SQL.Add('FROM TB_RELATORIO');
    QryConsulta.SQL.Add('WHERE NOME LIKE :P_TEXTO');
    QryConsulta.ParamByName('P_TEXTO').AsString := '%'+Texto+'%';
    QryConsulta.Open;
  finally
    Result := QryConsulta;
  end;
end;

function TRelatorios.inserir_alterar(TipoOperacao: String;
  out Erro: String): Boolean;
begin

end;

procedure TRelatorios.deletar(IdRelatorio: integer);
begin

end;

destructor TRelatorios.Destroy;
begin
  QryConsulta.Destroy;
  inherited;
end;

end.
