unit classe_relatorios;

interface

uses
  FireDAC.Comp.Client, System.SysUtils, Vcl.Forms, uUtils, Data.DB;

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

  var
    QryInserir: TFDQuery;
begin

  try
    try
      FConexao.Connected := False;
      FConexao.Connected := True;

      QryInserir            := TFDQUery.Create( nil );
      QryInserir.Connection := FConexao;

      QryInserir.Close;
      QryInserir.SQL.Clear;

      if TipoOperacao = 'INSERIR' then
      begin
        QryInserir.SQL.Add('INSERT INTO TB_RELATORIO (NOME, DESCRICAO, ID_GRUPO, ID_SUB_GRUPO, FR3)');
        QryInserir.SQL.Add('VALUES (:NOME, :DESCRICAO, :ID_GRUPO, :ID_SUB_GRUPO, :FR3)');
      end else
        begin
          QryInserir.SQL.Add('UPDATE TB_RELATORIO SET ');
          QryInserir.SQL.Add('NOME         = :NOME, ');
          QryInserir.SQL.Add('DESCRICAO    = :DESCRICAO, ');
          QryInserir.SQL.Add('ID_GRUPO     = :ID_GRUPO, ');
          QryInserir.SQL.Add('ID_SUB_GRUPO = :ID_SUB_GRUPO, ');
          QryInserir.SQL.Add('FR3          = :FR3 ');

          QryInserir.SQL.Add('WHERE ID     = :ID ');

          QryInserir.ParamByName('ID').AsInteger         := FId;
        end;

        QryInserir.ParamByName('NOME').AsString          := FNome;
        QryInserir.ParamByName('DESCRICAO').AsString     := FDescricao;

        if FGrupo > 0 then
          QryInserir.ParamByName('ID_GRUPO').AsInteger   := FGrupo
        else
          QryInserir.ParamByName('ID_GRUPO').DataType    := ftInteger;
          QryInserir.ParamByName('ID_GRUPO').Clear;

        if FSubGrupo > 0 then
          QryInserir.ParamByName('ID_SUB_GRUPO').AsInteger := FSubGrupo
        else
          QryInserir.ParamByName('ID_SUB_GRUPO').DataType  := ftInteger;
          QryInserir.ParamByName('ID_SUB_GRUPO').Clear;

        QryInserir.ParamByName('FR3').AsString             := FFr3;

        QryInserir.ExecSQL;

        Result := True;
    except
      on E: Exception do
        begin
          Erro   := E.Message;
          Result := False;
        end;
    end;
  finally
    QryInserir.Destroy;
  end;
end;

procedure TRelatorios.deletar(IdRelatorio: integer);
begin
  if Util.CriarMensagem('CONFIRMA', 'EXCLUSÃO DE RELATÓRIO',
                        'Remover Relatório?', 'Esta ação não pode ser desfeita e excluirá o relatório do cadastro. Tem certeza?',
                        'TRASH')
  then begin
    FConexao.Connected := False;
    FConexao.Connected := True;

    FConexao.ExecSQL('DELETE FROM TB_USU_PERMISSAO WHERE ID_RELATORIO = :ID; DELETE FROM TB_RELATORIO WHERE ID = :ID', [IdRelatorio])
  end;

end;

destructor TRelatorios.Destroy;
begin
  QryConsulta.Destroy;
  inherited;
end;

end.
