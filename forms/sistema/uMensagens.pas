unit uMensagens;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.ExtCtrls, Vcl.Buttons, Vcl.StdCtrls,
  JvExControls, JvButton, JvTransparentButton, Vcl.Imaging.pngimage;

type
  TfrmMensagens = class(TForm)
    pnlFundo: TPanel;
    shpFundo: TShape;
    Panel1: TPanel;
    lb_titulo_janela: TLabel;
    img_error: TImage;
    lb_titulo_mensagem: TLabel;
    lb_mensagem: TLabel;
    btn_sim: TJvTransparentButton;
    btn_nao: TJvTransparentButton;
    img_danger: TImage;
    img_info: TImage;
    img_trash: TImage;
    procedure btn_naoClick(Sender: TObject);
    procedure btn_simClick(Sender: TObject);
    procedure FormKeyDown(Sender: TObject; var Key: Word; Shift: TShiftState);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
    sTipo, sTituloJanela, sTituloMensagem, sMensagem, sTipoIcone: String;

    bRespostaMSG : Boolean;
  end;

var
  frmMensagens: TfrmMensagens;

implementation

{$R *.dfm}

procedure TfrmMensagens.btn_naoClick(Sender: TObject);
begin
  bRespostaMSG := False;

  close;
end;

procedure TfrmMensagens.btn_simClick(Sender: TObject);
begin
  bRespostaMSG := True;

  close;
end;

procedure TfrmMensagens.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  Action := caFree;
end;

procedure TfrmMensagens.FormKeyDown(Sender: TObject; var Key: Word;
  Shift: TShiftState);
begin
  if Key = VK_RETURN then
    btn_simClick( self )
  else
  if Key = VK_ESCAPE then
    btn_naoClick( self );
end;

procedure TfrmMensagens.FormShow(Sender: TObject);
begin
  bRespostaMSG := False;

  if sTipo = 'OK' then
    begin
      btn_nao.Visible := False;
      btn_sim.Caption := 'OK (ENTER)'
    end;

    if sTipoIcone = 'DANGER' then
      img_danger.Visible := True
    else if sTipoIcone = 'INFO' then
      img_info.Visible := True
    else if sTipoIcone = 'ERROR' then
      img_error.Visible := True
    else if sTipoIcone = 'TRASH' then
      img_trash.Visible := True;

  lb_titulo_janela.Caption          := sTituloJanela;
  lb_titulo_mensagem.Caption        := sTituloMensagem;
  lb_mensagem.Caption               := sMensagem;


end;

end.
