unit uCadProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls, Vcl.ComCtrls,
  RxToolEdit, RxCurrEdit;

type
  TfrmCadProduto = class(TfrmTelaHeranca)
    QryListagemprodutoId: TIntegerField;
    QryListagemnome: TWideStringField;
    QryListagemvalor: TFloatField;
    QryListagemquantidade: TFloatField;
    QryListagemDescricaoCategoria: TWideStringField;
    edtProdutoId: TLabeledEdit;
    edtNomeProduto: TLabeledEdit;
    edtDescricao: TMemo;
    LblDescricaoProduto: TLabel;
    edtValor: TCurrencyEdit;
    edtQuantidade: TCurrencyEdit;
    lblValorProduto: TLabel;
    lblQuantidadeProduto: TLabel;
    dtsCategoria: TDataSource;
    QryCategoria: TZQuery;
    QryCategoriacategoriaId: TIntegerField;
    QryCategoriadescricao: TWideStringField;
    lkpCategoria: TDBLookupComboBox;
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmCadProduto: TfrmCadProduto;

implementation

{$R *.dfm}

uses uDTMConexao;

procedure TfrmCadProduto.FormCreate(Sender: TObject);
begin
  inherited;
  QryCategoria.Connection := dtmPrincipal.ConexaoDB;
  dtsCategoria.DataSet := QryCategoria;
end;

end.
