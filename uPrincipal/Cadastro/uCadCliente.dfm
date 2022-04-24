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
    ExplicitWidth = 770
    ExplicitHeight = 401
    inherited tabListagem: TTabSheet
      ExplicitWidth = 762
      ExplicitHeight = 373
      inherited pnlListagemTopo: TPanel
        Width = 762
        ExplicitWidth = 762
      end
      inherited grdListagem: TDBGrid
        Width = 762
        Height = 316
        DataSource = dtsListagem
        Columns = <
          item
            Alignment = taCenter
            Expanded = False
            FieldName = 'clienteId'
            Width = 45
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome'
            Width = 413
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'cidade'
            Width = 200
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'telefone'
            Width = 85
            Visible = True
          end>
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
      object edtClienteId: TLabeledEdit
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
        Width = 94
        Height = 21
        EditMask = '(99) 9.9999-9999;'
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
      object cBoxUf: TComboBox
        Left = 471
        Top = 139
        Width = 50
        Height = 21
        TabOrder = 9
        TextHint = 'UF'
        Items.Strings = (
          'AC'
          'AL'
          'AP'
          'AM'
          'BA'
          'CE'
          'DF'
          'ES'
          'GO'
          'MA'
          'MT'
          'MS'
          'MG'
          'PA'
          'PB'
          'PR'
          'PE'
          'PI'
          'RJ'
          'RN'
          'RS'
          'RO'
          'RR'
          'SC'
          'SP'
          'SE'
          'TO')
      end
    end
  end
  inherited pnlRodaPe: TPanel
    Top = 401
    Width = 770
    ExplicitTop = 401
    ExplicitWidth = 770
    inherited btnNovo: TBitBtn
      Left = 12
      ExplicitLeft = 12
    end
    inherited btnAlterar: TBitBtn
      Left = 177
      ExplicitLeft = 177
    end
    inherited btnNavigator: TDBNavigator
      Hints.Strings = ()
    end
    inherited btnGravar: TBitBtn
      Left = 95
      ExplicitLeft = 95
    end
    inherited btnFechar: TBitBtn
      Left = 686
      ExplicitLeft = 686
    end
  end
  inherited QryListagem: TZQuery
    SQL.Strings = (
      'select '
      #9'clienteId,'
      #9'nome,'
      #9'endereco,'
      #9'cidade,'
      #9'bairro,'
      '                estado,'
      #9'cep,'
      #9'telefone,'
      #9'email,'
      #9'dataNascimento'
      'from clientes')
    Left = 664
    object QryListagemclienteId: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'clienteId'
      ReadOnly = True
    end
    object QryListagemnome: TWideStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      Size = 60
    end
    object QryListagemtelefone: TWideStringField
      DisplayLabel = 'Telefone'
      FieldName = 'telefone'
      Size = 16
    end
    object QryListagemcidade: TWideStringField
      DisplayLabel = 'Cidade'
      FieldName = 'cidade'
      Size = 50
    end
  end
  inherited dtsListagem: TDataSource
    Left = 628
    Top = 16
  end
end
