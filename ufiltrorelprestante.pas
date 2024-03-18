{*****************************************************************************
 * Nome do Arquivo: uFiltroRelPRestante.pas
 * Descrição: Tela de filtros do relatorio de rastreio de contas
 * Licença: Apache License, Version 2.0
 ******************************************************************************
 * Copyright (c) 2024 Vinicius Borges Gomes - Borgis & Co. Desenvolvimento
 ******************************************************************************
 * Informações de Licença:
 *
 * Este software é licenciado sob os termos da Licença Apache, Versão 2.0 (a "Licença");
 * Você não pode usar este arquivo, exceto em conformidade com a Licença.
 * Você pode obter uma cópia da Licença em
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * A menos que exigido por lei aplicável ou acordado por escrito, software
 * distribuído sob a Licença é distribuído "COMO ESTÁ", SEM GARANTIAS OU CONDIÇÕES DE QUALQUER TIPO,
 * expressa ou implícita.
 * Consulte a Licença para as permissões específicas que regem o uso do software.
 * ****************************************************************************}


unit uFiltroRelPRestante;

{$mode ObjFPC}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, DBCtrls,
  EditBtn, dmDados, uRelRastreioContas, DateUtils;

type

  { TfrmFiltrosRelParRestante }

  TfrmFiltrosRelParRestante = class(TForm)
    Button1: TButton;
    Button2: TButton;
    DateEdit1: TDateEdit;
    DateEdit2: TDateEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    Label8: TLabel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DateEdit1KeyPress(Sender: TObject; var Key: char);
    procedure DateEdit2Change(Sender: TObject);
    procedure DateEdit2KeyPress(Sender: TObject; var Key: char);
    procedure DBLookupComboBox1KeyPress(Sender: TObject; var Key: char);
    procedure FormShow(Sender: TObject);
  private

  public

  end;

var
  frmFiltrosRelParRestante: TfrmFiltrosRelParRestante;

implementation

{$R *.lfm}

{ TfrmFiltrosRelParRestante }

procedure TfrmFiltrosRelParRestante.FormShow(Sender: TObject);
begin
  DBLookupComboBox1.ListSource.DataSet.Active:= True;
  DBLookupComboBox1.KeyValue:= 0;
  DateEdit1.Date:= StartOfTheMonth(Now);
  DateEdit2.Date:= EndOfTheMonth(Now);
end;

procedure TfrmFiltrosRelParRestante.Button2Click(Sender: TObject);
begin
  frmFiltrosRelParRestante.Close;
end;

procedure TfrmFiltrosRelParRestante.DateEdit1KeyPress(Sender: TObject;
  var Key: char);
begin
  if Key = #13 then
     begin
     DateEdit2.SetFocus;
     end;
end;

procedure TfrmFiltrosRelParRestante.DateEdit2Change(Sender: TObject);
begin

end;

procedure TfrmFiltrosRelParRestante.DateEdit2KeyPress(Sender: TObject;
  var Key: char);
begin
  if Key = #13 then
     begin
     DBLookupComboBox1.SetFocus;
     end;
end;

procedure TfrmFiltrosRelParRestante.DBLookupComboBox1KeyPress(Sender: TObject;
  var Key: char);
begin
  if Key = #13 then
     begin
     Button1.SetFocus;
     end;
end;

procedure TfrmFiltrosRelParRestante.Button1Click(Sender: TObject);
begin
  DataModule1.qryRelRastreioConta.Close;
  DataModule1.qryRelRastreioConta.ParamByName('id_cliente').AsString:= DBLookupComboBox1.KeyValue;
  DataModule1.qryRelRastreioConta.ParamByName('dt_inicial').AsDate:= DateEdit1.Date;
  DataModule1.qryRelRastreioConta.ParamByName('dt_final').AsDate:= DateEdit2.Date;
  DataModule1.qryRelRastreioConta.Open;

  if DataModule1.qryRelRastreioConta.IsEmpty then
     begin
     ShowMessage('Nenhum registro encontrado com esses filtros, verifique!' + #13#10 + #13#10
     + 'Dt.Inicial ' + DateToStr(DateEdit1.Date) + ' Dt.Final ' + DateToStr(DateEdit2.Date) + #13#10
     + 'Cliente: ' + DBLookupComboBox1.Text);
     Exit;
  end;

  frmRelatorio1 := TfrmRelatorio1.Create(Self);
  frmRelatorio1.RLReport1.Preview;
end;


end.

