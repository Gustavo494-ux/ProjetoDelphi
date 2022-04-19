unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, ZAbstractConnection,
  ZConnection,Enter;

type
  TfrmPrincipal = class(TForm)
    mainPrincipal: TMainMenu;
    menuCadastro: TMenuItem;
    menuMovimentacao: TMenuItem;
    menuRelatrios: TMenuItem;
    CadastroCliente: TMenuItem;
    LinhaCadastro1: TMenuItem;
    RelatorioVendaPorData: TMenuItem;
    LinhaCadastro2: TMenuItem;
    CadastroProduto: TMenuItem;
    FecharAplicacao: TMenuItem;
    MovimentoVendas: TMenuItem;
    RelatorioCliente: TMenuItem;
    LinhaRelatorio2: TMenuItem;
    RelatorioProduto: TMenuItem;
    LinhaRelatorio1: TMenuItem;
    VendaPorData1: TMenuItem;
    procedure FecharAplicacaoClick(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure RelatorioVendaPorDataClick(Sender: TObject);
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
    TeclaEnter: TMREnter;
  public
    { Public declarations }
  end;

var
  frmPrincipal: TfrmPrincipal;

implementation

{$R *.dfm}

uses uDTMConexao, uCadCategoria;

  procedure TfrmPrincipal.FormCreate(Sender: TObject);
  begin
    dtmPrincipal  := TdtmPrincipal.Create(self);

    with dtmPrincipal.ConexaoDB do
    begin
      SQLHourGlass := false;
      Protocol := 'mssql';
      LibraryLocation := 'F:\Projetos\Delphi\delphi_e_sql-server_na_pratica\ProjetoDelphi\dll\ntwdblib.dll';
      HostName := '.\SHOPCONTROL9';
      Port := 1433;
      User := 'sa';
      Password := 'Senha123';
      Database := 'vendas';
      Connected := True;

    end;

    TeclaEnter := TMREnter.Create(self);
    TeclaEnter.FocusEnabled := true;
    TeclaEnter.FocusColor := clInfoBk;


  end;

  procedure TfrmPrincipal.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    FreeAndNil(TeclaEnter);
    FreeAndNil(dtmPrincipal);
  end;

  procedure TfrmPrincipal.FecharAplicacaoClick(Sender: TObject);
  begin

    Application.Terminate;
  end;

  procedure TfrmPrincipal.RelatorioVendaPorDataClick(Sender: TObject);
  begin
    frmCadCategoria := TfrmCadCategoria.Create(self);
    frmCadCategoria.ShowModal;
    frmCadCategoria.Release;
  end;

end.
