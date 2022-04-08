object frmTelaHeranca: TfrmTelaHeranca
  Left = 0
  Top = 0
  ActiveControl = pgcPrincipal
  BorderStyle = bsDialog
  Caption = 'Informe Aqui o Titulo'
  ClientHeight = 641
  ClientWidth = 1070
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  PixelsPerInch = 96
  TextHeight = 13
  object pgcPrincipal: TPageControl
    Left = 0
    Top = 0
    Width = 1070
    Height = 592
    ActivePage = tabListagem
    Align = alClient
    TabOrder = 0
    ExplicitHeight = 576
    object tabListagem: TTabSheet
      Caption = 'Listagem'
      object pnlListagemTopo: TPanel
        Left = 0
        Top = 0
        Width = 1062
        Height = 57
        Align = alTop
        TabOrder = 0
        object mskEdit: TMaskEdit
          Left = 16
          Top = 22
          Width = 409
          Height = 21
          TabOrder = 0
          Text = ''
          TextHint = 'Digite sua Pesquisa'
        end
        object btnPesquisar: TBitBtn
          Left = 431
          Top = 20
          Width = 106
          Height = 25
          Caption = '&Pesquisar'
          TabOrder = 1
        end
      end
      object grbListagem: TDBGrid
        Left = 0
        Top = 57
        Width = 1062
        Height = 507
        Align = alClient
        TabOrder = 1
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Tahoma'
        TitleFont.Style = []
      end
    end
    object TabManutencao: TTabSheet
      Caption = 'Manuten'#231#227'o'
      ImageIndex = 1
    end
  end
  object pnlRodaPe: TPanel
    Left = 0
    Top = 592
    Width = 1070
    Height = 49
    Align = alBottom
    TabOrder = 1
    ExplicitLeft = -248
    ExplicitTop = 594
    object btnNovo: TBitBtn
      Left = 20
      Top = 10
      Width = 75
      Height = 25
      Caption = '&Novo'
      TabOrder = 0
    end
    object btnAlterar: TBitBtn
      Left = 184
      Top = 10
      Width = 75
      Height = 25
      Caption = '&Alterar'
      TabOrder = 1
    end
    object btnCancelar: TBitBtn
      Left = 346
      Top = 10
      Width = 75
      Height = 25
      Caption = '&Cancelar'
      TabOrder = 2
    end
    object btnNavigator: TDBNavigator
      Left = 519
      Top = 10
      Width = 220
      Height = 25
      VisibleButtons = [nbFirst, nbPrior, nbNext, nbLast]
      TabOrder = 3
    end
    object btnGravar: TBitBtn
      Left = 103
      Top = 10
      Width = 75
      Height = 25
      Caption = '&Gravar'
      TabOrder = 4
    end
    object btnDeletar: TBitBtn
      Left = 264
      Top = 10
      Width = 75
      Height = 25
      Caption = '&Deletar'
      TabOrder = 5
    end
    object btnFechar: TBitBtn
      Left = 986
      Top = 10
      Width = 75
      Height = 25
      Caption = '&Fechar'
      TabOrder = 6
    end
  end
end
