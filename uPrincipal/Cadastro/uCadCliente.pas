unit uCadCliente;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls, Vcl.ComCtrls,
  RxToolEdit,uEnum,cCadCliente;

type
  TfrmCadCliente = class(TfrmTelaHeranca)
    edtClienteId: TLabeledEdit;
    edtNome: TLabeledEdit;
    mEdtCep: TMaskEdit;
    lblCep: TLabel;
    edtEndereco: TLabeledEdit;
    edtBairro: TLabeledEdit;
    edtCidade: TLabeledEdit;
    edtEmail: TLabeledEdit;
    mEdtTelefone: TMaskEdit;
    lblTelefone: TLabel;
    edtData: TDateEdit;
    lblDataNascimento: TLabel;
    cBoxUf: TComboBox;
    QryListagemclienteId: TIntegerField;
    QryListagemnome: TWideStringField;
    QryListagemcidade: TWideStringField;
    QryListagemtelefone: TWideStringField;
    procedure FormCreate(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAlterarClick(Sender: TObject);

  private
    { Private declarations }
    oCliente :TCliente;
    Data_Atual : TDate;

    function Apagar:boolean; override;
    function Gravar(EstadoDoCadastro:TEstadoDoCadastro):boolean; Override;

  public
    { Public declarations }
  end;

var
  frmCadCliente: TfrmCadCliente;

implementation

{$R *.dfm}

uses uDTMConexao;

{ TfrmCadCliente }

{$Region 'Eventos do Formulario'}

procedure TfrmCadCliente.FormCreate(Sender: TObject);
begin
  inherited;
  oCliente := TCliente.Create(dtmPrincipal.conexaoDB);
  IndiceAtual := 'clienteId';
  Data_Atual := Date();
end;

procedure TfrmCadCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if Assigned(oCliente) then
    FreeAndNil(oCliente);
end;

{$endRegion}

{$Region 'Eventos CRUD''}

procedure TfrmCadCliente.btnNovoClick(Sender: TObject);
begin
  inherited;
  edtNome.SetFocus;
  edtData.Text := dateToStr(Data_Atual);
end;

procedure TfrmCadCliente.btnAlterarClick(Sender: TObject);
begin
  inherited;
  if oCliente.Selecionar(QryListagem.FieldByName('clienteId').AsInteger) then
  begin
    edtClienteId.Text := intToStr(oCliente.codigo);
    edtNome.Text := oCliente.Nome;
    edtData.Text := datetimeToStr(oCliente.dataNascimento);
    edtEndereco.Text := oCliente.endereco;
    medtCep.Text := oCliente.cep;
    cBoxUf.Text:= oCliente.estado;
    edtCidade.Text := oCliente.cidade;
    edtBairro.Text := oCliente.bairro;
    edtEmail.Text := oCliente.email;
    medtTelefone.Text := oCliente.telefone;

  end;
end;

{$endRegion}

{$Region 'Métodos CRUD'}

function TfrmCadCliente.Gravar(EstadoDoCadastro: TEstadoDoCadastro): boolean;
begin
  if edtClienteId.Text <> EmptyStr then
      oCliente.codigo := strToInt(edtClienteId.Text)
    else oCliente.codigo := 0;

  oCliente.nome := edtNome.Text;
  oCliente.dataNascimento := strToDatetime(edtData.Text);
  oCliente.endereco := edtEndereco.Text;
  oCliente.cep := mEdtCep.Text;
  oCliente.cidade := edtCidade.Text;
  oCliente.estado := cBoxUf.Text;
  oCliente.bairro := edtBairro.Text;
  oCliente.email :=  edtEmail.Text;
  oCliente.telefone := mEdtTelefone.Text;

  if(EstadoDoCadastro=ecInserir) then
    Result := oCliente.Inserir
  else if (EstadoDoCadastro=ecAlterar) then
    Result := oCliente.Atualizar;
end;

function TfrmCadCliente.Apagar: boolean;
begin
  if oCliente.Selecionar(QryListagem.FieldByName('clienteId').AsInteger) then
      Result := oCliente.Apagar;

end;

{$endRegion}
end.
