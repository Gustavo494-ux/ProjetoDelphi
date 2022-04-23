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
    procedure mskEditChange(Sender: TObject);
    procedure grdListagemDblClick(Sender: TObject);
  private
    { Private declarations }
    EstadoDoCadastro: TEstadoDoCadastro;

    procedure ControlarBotoes(btnNovo, btnAlterar,btnCancelar,
    btnGravar, btnDeletar  : TBitBtn; btnNavigator:TDBNavigator;
    pgcPrincipal:TPageControl;Flag:boolean);

    procedure ControlarIndiceTab(pgcPrincipal: TPageControl; index: integer);
    function RetornarCampoTraduzido(Campo: string): string;
    procedure DesabilitarEditPk;
    procedure LimparEdit;


  public
    { Public declarations }
    IndiceAtual : string;

    procedure ExibirLabelIndice(Campo: string; aLabel: Tlabel);

    function ExisteCampoObrigatorio: Boolean;

    function Gravar(EstadoDoCadastro:TEstadoDoCadastro): boolean; virtual;
    function Listar: boolean; virtual;
    function Apagar: boolean; virtual;
  end;

var
  frmTelaHeranca: TfrmTelaHeranca;

implementation

{$R *.dfm}

  {$Region 'Observações'}
   //Tag: 1 - Chave Primária - PK
   //Tag: 2 - Campos Obrigatórios

  {$endRegion}


{$region 'Métodos Virtuais'}

  function TfrmTelaHeranca.Gravar(EstadoDoCadastro: TEstadoDoCadastro): boolean;
  begin
    case EstadoDoCadastro of
      ecInserir: ShowMessage('Inserir');
      ecAlterar: ShowMessage('Alterado');
    end;
    Result := True;
  end;

  function TfrmTelaHeranca.Listar: boolean;
  begin
    ShowMessage('Registro Deletado');
    Result:= True;
  end;

  function TfrmTelaHeranca.Apagar: boolean;
   begin
    ShowMessage('Registro Deletado');
    Result := True;
   end;
{$endregion}

{$region 'Funções e Prodecures'}

  function TfrmTelaHeranca.RetornarCampoTraduzido(Campo:string):string;
    var i:Integer;
    begin
      for I := 0 to QryListagem.Fields.Count -1 do
      begin
        if lowercase(QryListagem.Fields[i].FieldName) =lowercase(Campo) then
         begin
            Result:= QryListagem.Fields[i].DisplayLabel;
            break;
         end;
      end;
    end;

  function TfrmTelaHeranca.ExisteCampoObrigatorio:Boolean;
  var i:integer;
  begin
   Result:= False;
   for I := 0 to ComponentCount -1 do
   begin
    If(Components[i] is TLabeledEdit) then
    begin
      if(TLabeledEdit(Components[i]).Tag = 2) AND
        (TLabeledEdit(Components[i]).Text = EmptyStr) then
        begin
          MessageDlg((TLabeledEdit(Components[i]).EditLabel.Caption +
          ' é um campo obrigatório'),TMsgDlgType.mtInformation,[mbOk],0);

          TLabeledEdit(Components[i]).SetFocus;
          Result := True;
          Break;
        end;
    end;
   end;
  end;


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

  procedure TfrmTelaHeranca.ExibirLabelIndice(Campo:string; aLabel:Tlabel);
  begin
    aLabel.Caption := RetornarCampoTraduzido(Campo);

  end;

  procedure TfrmTelaHeranca.ControlarIndiceTab(pgcPrincipal:TPageControl;
  index: integer);
  begin
     if pgcPrincipal.Pages[index].TabVisible then
      pgcPrincipal.TabIndex := 0
  end;

  procedure TfrmTelaHeranca.DesabilitarEditPk;
  var i:integer;
  begin
     for I := 0 to ComponentCount -1 do
     begin
      If(Components[i] is TLabeledEdit) then
      begin
        if(TLabeledEdit(Components[i]).Tag = 1) then
        begin
           TLabeledEdit(Components[i]).Enabled := false;
           break;
        end;
      end;
     end;
  end;

  procedure TfrmTelaHeranca.LimparEdit;
  var i:integer;
  begin
     for I := 0 to ComponentCount -1 do
     begin
      If(Components[i] is TLabeledEdit) then
           TLabeledEdit(Components[i]).Text := EmptyStr;
     end;
  end;


{$endRegion}

{$region 'Eventos dos Formulario'}

  procedure TfrmTelaHeranca.FormClose(Sender: TObject; var Action: TCloseAction);
  begin
    qryListagem.Close;
  end;

  procedure TfrmTelaHeranca.FormCreate(Sender: TObject);
  begin
      // Assim que o formulario é criado as configurações de conexão são realizadas;
     QryListagem.Connection := dtmPrincipal.ConexaoDB;
     dtsListagem.DataSet := QryListagem;
     grdListagem.DataSource := dtsListagem;
     grdListagem.Options := [dgTitles,dgIndicator,dgColumnResize,
                             dgColLines,dgRowLines,dgTabs,dgRowSelect,
                             dgAlwaysShowSelection,dgCancelOnExit,
                             dgTitleClick,dgTitleHotTrack];
     btnNavigator.DataSource := dtsListagem;
  end;

  procedure TfrmTelaHeranca.FormShow(Sender: TObject);
  begin
     if(qryListagem.Sql.Text <> EmptyStr) then
     begin
        QryListagem.IndexFieldNames := indiceAtual;
        ExibirLabelIndice(IndiceAtual, Lbl_Indice);
       qryListagem.Open;
     end;

     ControlarIndiceTab(pgcPrincipal, 0);
     DesabilitarEditPk;
     ControlarBotoes(btnNovo,btnAlterar,btnCancelar,btnGravar,
                    btnDeletar,btnNavigator,pgcPrincipal,true);
  end;

{$endRegion}

{$region 'Eventos Click Dos Componentes'}

  procedure TfrmTelaHeranca.btnNovoClick(Sender: TObject);
  begin

      ControlarBotoes(btnNovo,btnAlterar,btnCancelar,btnGravar,btnDeletar,
      btnNavigator,pgcPrincipal,false);
      EstadoDoCadastro := ecInserir;
      LimparEdit;
  End;

  procedure TfrmTelaHeranca.btnGravarClick(Sender: TObject);
  begin
    if(ExisteCampoObrigatorio) then abort;
    try
      if Gravar(EstadoDoCadastro) then
      begin
        ControlarBotoes(btnNovo,btnAlterar,btnCancelar,btnGravar,btnDeletar,
        btnNavigator,pgcPrincipal,true);
        ControlarIndiceTab(pgcPrincipal,0);
         EstadoDoCadastro := ecNenhum;
        LimparEdit;
        QryListagem.Refresh;
      end
      else begin
        MessageDlg('Erro na Gravação', mtError,[mbok],0);
      end;

    finally

    end;
  end;

  procedure TfrmTelaHeranca.btnAlterarClick(Sender: TObject);
  begin
   ControlarBotoes(btnNovo,btnAlterar,btnCancelar,btnGravar,btnDeletar,
      btnNavigator,pgcPrincipal,false);
      EstadoDoCadastro := ecAlterar;
      LimparEdit;
  end;

  procedure TfrmTelaHeranca.btnCancelarClick(Sender: TObject);
  begin
  ControlarBotoes(btnNovo,btnAlterar,btnCancelar,btnGravar,btnDeletar,
    btnNavigator,pgcPrincipal,true);

    ControlarIndiceTab(pgcPrincipal,0);
    EstadoDoCadastro := ecNenhum;
    LimparEdit;
    QryListagem.Refresh;
  end;

  procedure TfrmTelaHeranca.btnDeletarClick(Sender: TObject);
  begin
      try
         if Apagar then
          begin
            ControlarBotoes(btnNovo,btnAlterar,btnCancelar,btnGravar,btnDeletar,
            btnNavigator,pgcPrincipal,true);
            ControlarIndiceTab(pgcPrincipal,0);
            LimparEdit;
            QryListagem.Refresh;
          end
          else begin
            MessageDlg('Erro na Exclução', mtError,[mbok],0);
          end;
      finally
         EstadoDoCadastro := ecNenhum;
      end;
  end;

  procedure TfrmTelaHeranca.btnFecharClick(Sender: TObject);
  begin
     Close;
  end;

  procedure TfrmTelaHeranca.grdListagemDblClick(Sender: TObject);
  begin
    btnAlterar.Click;
  end;

  procedure TfrmTelaHeranca.grdListagemTitleClick(Column: TColumn);
    begin
      IndiceAtual := Column.FieldName;
      qryListagem.IndexFieldNames := IndiceAtual;
      ExibirLabelIndice(IndiceAtual,Lbl_Indice);

    end;

  procedure TfrmTelaHeranca.mskEditChange(Sender: TObject);
    begin
      QryListagem.Locate(IndiceAtual, TmaskEdit(Sender).Text,[loPartialKey]);
    end;

{$endRegion}

end.
