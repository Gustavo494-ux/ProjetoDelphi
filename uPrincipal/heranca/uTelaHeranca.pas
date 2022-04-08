unit uTelaHeranca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ComCtrls, Vcl.ExtCtrls,
  ZAbstractRODataset, ZAbstractDataset, ZDataset,
  uDtmConexao;

type
  TfrmTelaHeranca = class(TForm)
    pgcPrincipal: TPageControl;
    pnlRodaPe: TPanel;
    tabListagem: TTabSheet;
    TabManutencao: TTabSheet;
    pnlListagemTopo: TPanel;
    mskEdit: TMaskEdit;
    btnPesquisar: TBitBtn;
    grdListagem: TDBGrid;
    btnNovo: TBitBtn;
    btnAlterar: TBitBtn;
    btnCancelar: TBitBtn;
    btnNavigator: TDBNavigator;
    btnGravar: TBitBtn;
    btnDeletar: TBitBtn;
    btnFechar: TBitBtn;
    QryListagem: TZQuery;
    dtsListagem: TDataSource;
    procedure FormCreate(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmTelaHeranca: TfrmTelaHeranca;

implementation

{$R *.dfm}

  procedure TfrmTelaHeranca.btnFecharClick(Sender: TObject);
  begin
     Close;
  end;

procedure TfrmTelaHeranca.FormCreate(Sender: TObject);
  begin
      // Assim que o formulario é criado as configurações de conexão são realizadas;
     QryListagem.Connection := dtmPrincipal.ConexaoDB;
     dtsListagem.DataSet := QryListagem;
     grdListagem.DataSource := dtsListagem;
     btnNavigator.DataSource := dtsListagem;
  end;

end.
