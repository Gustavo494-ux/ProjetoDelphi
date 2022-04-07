unit uPrincipal;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.Menus;

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
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

  procedure TForm1.Fechar1Click(Sender: TObject);
  begin
    Application.Terminate;
  end;

end.
