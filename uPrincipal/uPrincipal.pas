unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus, ZAbstractConnection,
  ZConnection;

type
  TForm1 = class(TForm)
    mainPrincipal: TMainMenu;
    Cadastro1: TMenuItem;
    Cadastro2: TMenuItem;
    Relatrios1: TMenuItem;
    Cliente1: TMenuItem;
    Cliente2: TMenuItem;
    Categoria1: TMenuItem;
    Categoria2: TMenuItem;
    Produto1: TMenuItem;
    Fechar1: TMenuItem;
    Vendas1: TMenuItem;
    Cliente3: TMenuItem;
    Cliente4: TMenuItem;
    Produto2: TMenuItem;
    Produto3: TMenuItem;
    VendaPorData1: TMenuItem;
    procedure Fechar1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

uses uDTMConexao;

  procedure TForm1.Fechar1Click(Sender: TObject);
  begin
    Application.Terminate;
  end;

  procedure TForm1.FormCreate(Sender: TObject);
  begin
    dtmPrincipal  := TdtmPrincipal.Create(self);
    with dtmPrincipal.ConexaoDB do
    begin
      SQLHourGlass := True;
      Protocol := 'mssql';
      LibraryLocation := 'F:\Projetos\Delphi\delphi_e_sql-server_na_pratica\ProjetoDelphi\dll\ntwdblib.dll';
      HostName := '.\SHOPCONTROL9';
      Port := 1433;
      User := 'sa';
      Password := 'Senha123';
      Database := 'vendas';
      Connected := True;

    end;
  end;

end.
