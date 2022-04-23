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
    QryListagemclienteId: TIntegerField;
    QryListagemnome: TWideStringField;
    QryListagemendereco: TWideStringField;
    QryListagemcidade: TWideStringField;
    QryListagembairro: TWideStringField;
    QryListagemcep: TWideStringField;
    QryListagemtelefone: TWideStringField;
    QryListagememail: TWideStringField;
    QryListagemdataNascimento: TDateTimeField;
    cBoxUf: TComboBox;
    QryListagemestado: TWideStringField;
    procedure FormCreate(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAlterarClick(Sender: TObject);

  private
    { Private declarations }
    oCliente :TCliente;

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

function TfrmCadCliente.Apagar: boolean;
begin
  if oCliente.Selecionar(QryListagem.FieldByName('clienteId').AsInteger) then
      Result := oCliente.Apagar;

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

procedure TfrmCadCliente.btnNovoClick(Sender: TObject);
begin
  inherited;
  edtNome.SetFocus;
edtNome.Text := 'Gustavo Gama Dos Santos';
  edtEndereco.Text := 'Rua Salustiano Nunes,N° 76';
  edtBairro.Text := 'São João';
  edtData.Text := '31/10/2001';
  cBoxUf.Text := 'AL';
  mEdtCep.Text := '57-320-000';
  cboxUf.Text := 'AL';
  edtCidade.Text := 'Craíbas';
  edtEmail.Text := 'gustavogama494@gmail.com';
//  mEdtTelefone.Text := '(82)99137-5483';
end;

procedure TfrmCadCliente.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;
  if Assigned(oCliente) then
    FreeAndNil(oCliente);
end;

procedure TfrmCadCliente.FormCreate(Sender: TObject);
begin
  inherited;
  oCliente := TCliente.Create(dtmPrincipal.conexaoDB);
  IndiceAtual := 'clienteid';

end;

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

end.
