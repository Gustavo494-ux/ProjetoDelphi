unit uCadCategoria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls, Vcl.ComCtrls,
  cCadCategoria,uDTMConexao, uEnum;

type
    TfrmCadCategoria = class(TfrmTelaHeranca)
    QryListagemcategoriaId: TIntegerField;
    QryListagemDescricao: TWideStringField;
    edtCategoriaId: TLabeledEdit;
    edtDescricao: TLabeledEdit;

    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure btnAlterarClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);

  private
    { Private declarations }
    oCategoria :TCategoria;

    function Gravar(EstadoDoCadastro:TEstadoDoCadastro): boolean; override;
    function Apagar: boolean; override;

    public
    { Public declarations }
  end;

var
  frmCadCategoria: TfrmCadCategoria;

implementation

{$R *.dfm}

{$region 'Eventos do Formulario'}

procedure TfrmCadCategoria.FormClose(Sender: TObject; var Action: TCloseAction);
begin
  inherited;

  if Assigned(oCategoria) then
    FreeAndNil(oCategoria);
end;

procedure TfrmCadCategoria.FormCreate(Sender: TObject);
  begin
    inherited;
    oCategoria := TCategoria.Create(dtmPrincipal.conexaoDB);
    IndiceAtual := 'categoriaid';
  end;

{$endRegion}

{$Region 'M?todos Crud'}
//Override
function TfrmCadCategoria.Apagar: boolean;
//var del: Integer;
begin
  if MessageDlg('Tem certeza que deseja apagar permanemente essa categoria?',
  mtConfirmation,[mbYes,mbNo],0) = mrYes then
  begin
    Result := oCategoria.Apagar(QryListagem.FieldByName('categoriaId').AsInteger);
    ShowMessage('Categoria Apagada');
  end else abort;
end;

function TfrmCadCategoria.Gravar(EstadoDoCadastro: TEstadoDoCadastro):boolean;
begin
  if edtCategoriaId.Text <> EmptyStr then
    oCategoria.codigo := strToInt(edtCategoriaId.Text)
  else
    oCategoria.codigo := 0;

  oCategoria.descricao := edtDescricao.Text;

 if (EstadoDoCadastro = ecInserir) then
    Result:=  oCategoria.Inserir
  else if (EstadoDoCadastro = ecAlterar) then
    Result:= oCategoria.Atualizar;
end;

{$endRegion}

{$region 'Eventos CRUD'}

procedure TfrmCadCategoria.btnAlterarClick(Sender: TObject);
begin
  inherited;

  if oCategoria.Selecionar(QryListagem.FieldByName('categoriaId').AsInteger) then
  begin
   edtCategoriaId.Text := intToStr(oCategoria.codigo) ;
   edtDescricao.Text := oCategoria.descricao;
  end
  else
  begin
   btnCancelar.Click;
   Abort;
  end;

  edtDescricao.SetFocus;
end;

procedure TfrmCadCategoria.btnNovoClick(Sender: TObject);
begin
  inherited;
  edtDescricao.SetFocus;
end;

{$endregion}


end.
