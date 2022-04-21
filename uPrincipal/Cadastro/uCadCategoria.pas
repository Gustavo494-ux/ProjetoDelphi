unit uCadCategoria;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, uTelaHeranca, Data.DB,
  ZAbstractRODataset, ZAbstractDataset, ZDataset, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ExtCtrls, Vcl.ComCtrls,
  cCadCategoria;

type
    TfrmCadCategoria = class(TfrmTelaHeranca)
    QryListagemcategoriaId: TIntegerField;
    QryListagemDescricao: TWideStringField;
    edtCategoriaId: TLabeledEdit;
    edtDescricao: TLabeledEdit;

    procedure FormCreate(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    oCategoria :TCategoria;
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
      oCategoria := TCategoria.Create;
      IndiceAtual := 'descricao';
    end;
{$endRegion}

{$region 'Eventos Gerais'}
{$endregion}


end.
