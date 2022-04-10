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
    btnNovo: TBitBtn;
    btnAlterar: TBitBtn;
    btnCancelar: TBitBtn;
    btnNavigator: TDBNavigator;
    btnGravar: TBitBtn;
    btnDeletar: TBitBtn;
    btnFechar: TBitBtn;
    QryListagem: TZQuery;
    dtsListagem: TDataSource;
    grdListagem: TDBGrid;
    procedure FormCreate(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
  private
    { Private declarations }
   procedure ControlarBotoes(btnNovo, btnAlterar,btnCancelar,
   btnGravar, btnDeletar  : TBitBtn; btnNavigator:TDBNavigator;
   pgcPrincipal:TPageControl;Flag:boolean);

  public
    { Public declarations }
  end;

var
  frmTelaHeranca: TfrmTelaHeranca;

implementation

{$R *.dfm}

  procedure TfrmTelaHeranca.ControlarBotoes(btnNovo, btnAlterar,btnCancelar,
   btnGravar, btnDeletar  : TBitBtn; btnNavigator:TDBNavigator;
   pgcPrincipal:TPageControl;Flag:boolean);
  begin
      btnNovo.Enabled := Flag;
      btnDeletar.Enabled := flag;
      btnAlterar.Enabled := Flag;
      btnNavigator.Enabled := Flag;
      pgcPrincipal.Pages[0].TabVisible := Flag;
      btnCancelar.Enabled := not(Flag);
      btnGravar.Enabled := not(flag);
  end;

procedure TfrmTelaHeranca.btnNovoClick(Sender: TObject);
  begin
    ControlarBotoes(btnNovo,btnAlterar,btnCancelar,btnGravar,btnDeletar,
    btnNavigator,pgcPrincipal,false);
  end;

procedure TfrmTelaHeranca.btnGravarClick(Sender: TObject);
  begin
    ControlarBotoes(btnNovo,btnAlterar,btnCancelar,btnGravar,btnDeletar,
      btnNavigator,pgcPrincipal,true);
  end;

procedure TfrmTelaHeranca.btnAlterarClick(Sender: TObject);
  begin
   ControlarBotoes(btnNovo,btnAlterar,btnCancelar,btnGravar,btnDeletar,
      btnNavigator,pgcPrincipal,false);
  end;

procedure TfrmTelaHeranca.btnCancelarClick(Sender: TObject);
  begin
  ControlarBotoes(btnNovo,btnAlterar,btnCancelar,btnGravar,btnDeletar,
    btnNavigator,pgcPrincipal,true);
  end;

procedure TfrmTelaHeranca.btnDeletarClick(Sender: TObject);
  begin
      ControlarBotoes(btnNovo,btnAlterar,btnCancelar,btnGravar,btnDeletar,
      btnNavigator,pgcPrincipal,true);
  end;

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
