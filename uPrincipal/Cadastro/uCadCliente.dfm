inherited frmCadCliente: TfrmCadCliente
  Caption = 'Cadastro de Cliente'
  ClientHeight = 450
  ClientWidth = 770
  ExplicitWidth = 776
  ExplicitHeight = 479
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcPrincipal: TPageControl
    Width = 770
    Height = 401
    ActivePage = TabManutencao
    inherited tabListagem: TTabSheet
      ExplicitWidth = 762
      ExplicitHeight = 373
      inherited pnlListagemTopo: TPanel
        Width = 762
      end
      inherited grdListagem: TDBGrid
        Width = 762
        Height = 316
      end
    end
    inherited TabManutencao: TTabSheet
      ExplicitWidth = 762
      ExplicitHeight = 373
      object lblCep: TLabel
        Left = 383
        Top = 123
        Width = 19
        Height = 13
        Caption = 'CEP'
      end
      object lblTelefone: TLabel
        Left = 383
        Top = 216
        Width = 42
        Height = 13
        Caption = 'Telefone'
      end
      object lblDataNascimento: TLabel
        Left = 383
        Top = 82
        Width = 81
        Height = 13
        Caption = 'Data Nascimento'
      end
      object edtCategoriaId: TLabeledEdit
        Tag = 1
        Left = 24
        Top = 56
        Width = 57
        Height = 21
        EditLabel.Width = 33
        EditLabel.Height = 13
        EditLabel.Caption = 'C'#243'digo'
        MaxLength = 10
        NumbersOnly = True
        TabOrder = 0
        Text = '0'
      end
      object edtNome: TLabeledEdit
        Tag = 2
        Left = 24
        Top = 96
        Width = 353
        Height = 21
        EditLabel.Width = 27
        EditLabel.Height = 13
        EditLabel.Caption = 'Nome'
        MaxLength = 60
        TabOrder = 1
      end
      object mEdtCep: TMaskEdit
        Left = 383
        Top = 139
        Width = 82
        Height = 21
        EditMask = '99-999-999;1;_'
        MaxLength = 10
        TabOrder = 4
        Text = '  -   -   '
      end
      object edtEndereco: TLabeledEdit
        Tag = 2
        Left = 24
        Top = 139
        Width = 353
        Height = 21
        EditLabel.Width = 45
        EditLabel.Height = 13
        EditLabel.Caption = 'Endere'#231'o'
        MaxLength = 60
        TabOrder = 3
      end
      object edtBairro: TLabeledEdit
        Tag = 2
        Left = 383
        Top = 187
        Width = 186
        Height = 21
        EditLabel.Width = 28
        EditLabel.Height = 13
        EditLabel.Caption = 'Bairro'
        MaxLength = 40
        TabOrder = 6
      end
      object edtCidade: TLabeledEdit
        Tag = 2
        Left = 24
        Top = 187
        Width = 353
        Height = 21
        EditLabel.Width = 33
        EditLabel.Height = 13
        EditLabel.Caption = 'Cidade'
        MaxLength = 50
        TabOrder = 5
      end
      object edtEmail: TLabeledEdit
        Tag = 2
        Left = 24
        Top = 231
        Width = 353
        Height = 21
        EditLabel.Width = 24
        EditLabel.Height = 13
        EditLabel.Caption = 'Email'
        MaxLength = 100
        TabOrder = 7
      end
      object mEdtTelefone: TMaskEdit
        Left = 383
        Top = 231
        Width = 98
        Height = 21
        EditMask = '(99) 9.9999-9999;1;_'
        MaxLength = 16
        TabOrder = 8
        Text = '(  )  .    -    '
      end
      object edtData: TDateEdit
        Left = 383
        Top = 96
        Width = 121
        Height = 21
        ClickKey = 114
        DialogTitle = 'Selecione a Data'
        NumGlyphs = 2
        TabOrder = 2
      end
    end
  end
  inherited pnlRodaPe: TPanel
    Top = 401
    Width = 770
    inherited btnNavigator: TDBNavigator
      Hints.Strings = ()
    end
    inherited btnFechar: TBitBtn
      Left = 686
    end
  end
  inherited QryListagem: TZQuery
    Left = 64
    Top = 32
  end
  inherited dtsListagem: TDataSource
    Left = 108
    Top = 16
  end
end
