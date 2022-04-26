unit uCadProduto;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls, Vcl.ComCtrls,
  RxToolEdit, RxCurrEdit, cCadProduto, uEnum;

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
    lkpCategoria: TDBLookupComboBox;
    QryCategoria: TZQuery;
    dtsCategoria: TDataSource;
    QryCategoriacategoriaId: TIntegerField;
    QryCategoriadescricao: TWideStringField;
    procedure FormCreate(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    oProduto : TProduto;
    function Apagar:Boolean; override;
    function Gravar(EstadoDoCadastro:TEstadoDoCadastro):Boolean;override;

  public
    { Public declarations }
  end;

var
  frmCadProduto: TfrmCadProduto;

implementation

{$R *.dfm}

uses uDTMConexao;

{$Region 'Eventos Formulario'}

procedure TfrmCadProduto.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  QryCategoria.Close;
  if Assigned(oProduto) then
    FreeAndNil(oProduto);
end;

procedure TfrmCadProduto.FormCreate(Sender: TObject);
begin
  inherited;
  QryCategoria.Connection := dtmPrincipal.ConexaoDB;
  QryCategoria.DataSource := dtsListagem;
  dtsCategoria.DataSet := QryCategoria;
  QryCategoria.Open;

  lkpCategoria.ListSource := dtsCategoria;
  edtDescricao.Text := '';

  oProduto := TProduto.Create(dtmPrincipal.conexaoDB);
  IndiceAtual := 'produtoId';
end;

{$endRegion}

{$Region 'Métodos CRUD'}

function TfrmCadProduto.Gravar(EstadoDoCadastro: TEstadoDoCadastro): Boolean;
begin
  if edtProdutoId.Text <> EmptyStr then
    oProduto.codigo := strToInt(edtProdutoId.Text)
  else
    oProduto.codigo := 0;

  oProduto.nome         := edtNomeProduto.Text;
  oProduto.descricao    := edtDescricao.Text;
  oProduto.categoriaId  := lkpCategoria.KeyValue;
  oProduto.valor        := edtValor.Value;
  oProduto.quantidade   := edtQuantidade.Value;


  if (EstadoDoCadastro=ecInserir) then
    Result:= oProduto.Inserir
  else if EstadoDoCadastro=ecAlterar then
    Result := oProduto.Atualizar;
end;

procedure TfrmCadProduto.btnAlterarClick(Sender: TObject);
begin
  inherited;
  if oProduto.Selecionar(QryListagem.FieldByName('produtoId').AsInteger) then
  begin
    edtProdutoId.Text := intToStr(oProduto.codigo);
    edtNomeProduto.Text := oProduto.nome;
    edtDescricao.Text := oProduto.descricao;
    lkpCategoria.KeyValue := oProduto.categoriaId;
    edtValor.Value := oProduto.valor;
    edtQuantidade.Value := oProduto.quantidade;
  end
  else begin
    btnCancelar.Click;
    Abort;
  end;


end;

procedure TfrmCadProduto.btnNovoClick(Sender: TObject);
begin
  inherited;
  edtNomeProduto.SetFocus;
end;

function TfrmCadProduto.Apagar: Boolean;
begin
  if oProduto.Selecionar(QryListagem.FieldByName('produtoId').AsInteger) then
    Result := oProduto.Apagar;
end;


{$endRegion}


end.
