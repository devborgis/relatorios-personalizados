unit uCadReport;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, JvExControls, JvButton,
  JvTransparentButton, Vcl.StdCtrls, Vcl.DBCtrls, Vcl.ExtCtrls;

type
  TForm1 = class(TForm)
    edtIdReport: TEdit;
    edtNameReport: TEdit;
    DBLookupComboBox1: TDBLookupComboBox;
    Label1: TLabel;
    Label2: TLabel;
    btnAddGroupReport: TJvTransparentButton;
    Panel1: TPanel;
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

end.
