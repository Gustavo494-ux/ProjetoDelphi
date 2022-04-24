inherited frmCadProduto: TfrmCadProduto
  Caption = 'Cadastro Produto'
  ClientHeight = 452
  ClientWidth = 768
  ExplicitWidth = 774
  ExplicitHeight = 481
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcPrincipal: TPageControl
    Width = 768
    Height = 403
    ActivePage = TabManutencao
    inherited tabListagem: TTabSheet
      ExplicitWidth = 760
      ExplicitHeight = 375
      inherited pnlListagemTopo: TPanel
        Width = 760
      end
      inherited grdListagem: TDBGrid
        Width = 760
        Height = 318
        DataSource = dtsListagem
        Columns = <
          item
            Expanded = False
            FieldName = 'produtoId'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'nome'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'valor'
            Title.Alignment = taRightJustify
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'quantidade'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'DescricaoCategoria'
            Width = 515
            Visible = True
          end>
      end
    end
    inherited TabManutencao: TTabSheet
      ExplicitWidth = 760
      ExplicitHeight = 375
      object LblDescricaoProduto: TLabel
        Left = 24
        Top = 128
        Width = 46
        Height = 13
        Caption = 'Descri'#231#227'o'
      end
      object lblValorProduto: TLabel
        Left = 24
        Top = 215
        Width = 24
        Height = 13
        Caption = 'Valor'
      end
      object lblQuantidadeProduto: TLabel
        Left = 151
        Top = 215
        Width = 56
        Height = 13
        Caption = 'Quantidade'
      end
      object edtProdutoId: TLabeledEdit
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
      object edtNomeProduto: TLabeledEdit
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
      object edtDescricao: TMemo
        Left = 24
        Top = 147
        Width = 537
        Height = 62
        Lines.Strings = (
          'edtDescricao')
        MaxLength = 255
        TabOrder = 2
      end
      object edtValor: TCurrencyEdit
        Left = 24
        Top = 232
        Width = 121
        Height = 21
        DisplayFormat = 'R$ ,0.00;R$- ,0.00'
        TabOrder = 3
      end
      object edtQuantidade: TCurrencyEdit
        Left = 151
        Top = 232
        Width = 121
        Height = 21
        DisplayFormat = ' ,0.00;- ,0.00'
        TabOrder = 4
      end
      object lkpCategoria: TDBLookupComboBox
        Left = 383
        Top = 96
        Width = 178
        Height = 21
        DataSource = dtsCategoria
        KeyField = 'categoriaId'
        ListField = 'descricao'
        ListSource = dtsCategoria
        TabOrder = 5
      end
    end
  end
  inherited pnlRodaPe: TPanel
    Top = 403
    Width = 768
    inherited btnNavigator: TDBNavigator
      Hints.Strings = ()
    end
    inherited btnFechar: TBitBtn
      Left = 684
    end
  end
  inherited QryListagem: TZQuery
    SQL.Strings = (
      'SELECT '
      #9'P.produtoId,'
      #9'P.nome,'
      #9'P.descricao,'
      #9'P.valor,'
      #9'P.quantidade,'
      #9'c.categoriaId,'
      #9'C.descricao DescricaoCategoria'
      'FROM vendas..produtos P'
      'LEFT JOIN  categorias C ON C.categoriaId = P.categoriaId;')
    Left = 72
    Top = 32
    object QryListagemprodutoId: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'produtoId'
      ReadOnly = True
    end
    object QryListagemnome: TWideStringField
      DisplayLabel = 'Nome'
      FieldName = 'nome'
      ReadOnly = True
      Size = 60
    end
    object QryListagemvalor: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'valor'
      ReadOnly = True
    end
    object QryListagemquantidade: TFloatField
      DisplayLabel = 'Quantidade'
      FieldName = 'quantidade'
      ReadOnly = True
    end
    object QryListagemDescricaoCategoria: TWideStringField
      DisplayLabel = 'Descri'#231#227'o Da Categoria'
      FieldName = 'DescricaoCategoria'
      Size = 100
    end
  end
  inherited dtsListagem: TDataSource
    Left = 148
    Top = 32
  end
  object dtsCategoria: TDataSource
    DataSet = QryCategoria
    Left = 220
    Top = 32
  end
  object QryCategoria: TZQuery
    Connection = dtmPrincipal.conexaoDB
    SQL.Strings = (
      'SELECT categoriaId,descricao FROM categorias')
    Params = <>
    Left = 284
    Top = 32
    object QryCategoriacategoriaId: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'categoriaId'
      ReadOnly = True
    end
    object QryCategoriadescricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'descricao'
      Size = 100
    end
  end
end
