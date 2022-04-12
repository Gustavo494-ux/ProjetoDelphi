unit uTelaHeranca;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Data.DB, Vcl.DBCtrls, Vcl.Grids,
  Vcl.DBGrids, Vcl.StdCtrls, Vcl.Buttons, Vcl.Mask, Vcl.ComCtrls, Vcl.ExtCtrls,
  ZAbstractRODataset, ZAbstractDataset, ZDataset,
  uDtmConexao,uEnum;

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
    Lbl_Indice: TLabel;
    procedure FormCreate(Sender: TObject);
    procedure btnFecharClick(Sender: TObject);
    procedure btnNovoClick(Sender: TObject);
    procedure btnGravarClick(Sender: TObject);
    procedure btnCancelarClick(Sender: TObject);
    procedure btnDeletarClick(Sender: TObject);
    procedure btnAlterarClick(Sender: TObject);
    procedure FormShow(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
    procedure grdListagemTitleClick(Column: TColumn);
  private
    { Private declarations }
    EstadoDoCadastro: TEstadoDoCadastro;

   procedure ControlarBotoes(btnNovo, btnAlterar,btnCancelar,
   btnGravar, btnDeletar  : TBitBtn; btnNavigator:TDBNavigator;
   pgcPrincipal:TPageControl;Flag:boolean);

    procedure ControlarIndiceTab(pgcPrincipal: TPageControl; index: integer);
    function RetornarCampoTraduzido(Campo: string): string;


  public
    { Public declarations }
    IndiceAtual : string;
  end;

var
  frmTelaHeranca: TfrmTelaHeranca;

implementation

{$R *.dfm}
  function TfrmTelaHeranca.RetornarCampoTraduzido(Campo:string):string;
  var i:Integer;
  begin
    for I := 0 to QryListagem.Fields.Count -1 do
    begin
      if QryListagem.Fields[i].FieldName = Campo then
       begin
          Result:= QryListagem.Fields[i].DisplayLabel;
          break;
       end;
    end;
  end;

  procedure TfrmTelaHeranca.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    qryListagem.Close;
  end;

procedure TfrmTelaHeranca.FormCreate(Sender: TObject);
  begin
      // Assim que o formulario � criado as configura��es de conex�o s�o realizadas;
     QryListagem.Connection := dtmPrincipal.ConexaoDB;
     dtsListagem.DataSet := QryListagem;
     grdListagem.DataSource := dtsListagem;
     btnNavigator.DataSource := dtsListagem;
  end;

  procedure TfrmTelaHeranca.FormShow(Sender: TObject);
  begin
     if(qryListagem.Sql.Text <> EmptyStr) then
     begin
       qryListagem.Open;
     end;
  end;

  procedure TfrmTelaHeranca.grdListagemTitleClick(Column: TColumn);
  begin
   IndiceAtual := Column.FieldName;
   qryListagem.IndexFieldNames := IndiceAtual;
   Lbl_Indice.Caption := RetornarCampoTraduzido(IndiceAtual);

  end;

//Procedure de controle de tela
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

procedure TfrmTelaHeranca.ControlarIndiceTab(pgcPrincipal:TPageControl;
index: integer);
begin
   if pgcPrincipal.Pages[index].TabVisible then
    pgcPrincipal.TabIndex := 0
end;

procedure TfrmTelaHeranca.btnNovoClick(Sender: TObject);
begin
  ControlarBotoes(btnNovo,btnAlterar,btnCancelar,btnGravar,btnDeletar,
  btnNavigator,pgcPrincipal,false);
  EstadoDoCadastro := ecInserir;
End;

procedure TfrmTelaHeranca.btnGravarClick(Sender: TObject);
begin
  try
    ControlarBotoes(btnNovo,btnAlterar,btnCancelar,btnGravar,btnDeletar,
    btnNavigator,pgcPrincipal,true);
    ControlarIndiceTab(pgcPrincipal,0);

    if(EstadoDoCadastro  = ecInserir) then
      showMessage('Inserir')
    else if (EstadoDoCadastro = ecAlterar) then
      showMessage('Alterado')
    else
      showMessage('Nada aconteceu')


  finally
    EstadoDoCadastro := ecNenhum;
  end;
end;

procedure TfrmTelaHeranca.btnAlterarClick(Sender: TObject);
begin
 ControlarBotoes(btnNovo,btnAlterar,btnCancelar,btnGravar,btnDeletar,
    btnNavigator,pgcPrincipal,false);
    EstadoDoCadastro := ecAlterar;
end;

procedure TfrmTelaHeranca.btnCancelarClick(Sender: TObject);
begin
ControlarBotoes(btnNovo,btnAlterar,btnCancelar,btnGravar,btnDeletar,
  btnNavigator,pgcPrincipal,true);

  ControlarIndiceTab(pgcPrincipal,0);
  EstadoDoCadastro := ecNenhum;
end;

procedure TfrmTelaHeranca.btnDeletarClick(Sender: TObject);
begin
    ControlarBotoes(btnNovo,btnAlterar,btnCancelar,btnGravar,btnDeletar,
    btnNavigator,pgcPrincipal,true);
    ControlarIndiceTab(pgcPrincipal,0);

    EstadoDoCadastro := ecNenhum;
end;

procedure TfrmTelaHeranca.btnFecharClick(Sender: TObject);
begin
   Close;
end;



end.
