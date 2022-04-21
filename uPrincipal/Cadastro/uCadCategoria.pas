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
    procedure btnGravarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);

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
    IndiceAtual := 'descricao';
  end;

{$endRegion}

{$Region 'Métodos Crud'}
//Override
function TfrmCadCategoria.Apagar: boolean;
begin
  Result := oCategoria.Apagar;
end;

function TfrmCadCategoria.Gravar(EstadoDoCadastro: TEstadoDoCadastro):boolean;
begin
 if (EstadoDoCadastro = ecInserir) then
    Result:=  oCategoria.Gravar
  else if (EstadoDoCadastro = ecAlterar) then
    Result:= oCategoria.Atualizar;
end;

{$endRegion}

{$region 'Eventos CRUD'}
procedure TfrmCadCategoria.btnDeletarClick(Sender: TObject);
begin
  inherited;
//    oCategoria.Apagar;
end;

procedure TfrmCadCategoria.btnGravarClick(Sender: TObject);
begin

  inherited;
end;
{$endregion}


end.
