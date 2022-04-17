inherited frmCadCategoria: TfrmCadCategoria
  Caption = 'Cadastro de Categoria'
  ClientHeight = 366
  ClientWidth = 751
  ExplicitWidth = 757
  ExplicitHeight = 395
  PixelsPerInch = 96
  TextHeight = 13
  inherited pgcPrincipal: TPageControl
    Width = 751
    Height = 317
    ActivePage = TabManutencao
    ExplicitWidth = 751
    ExplicitHeight = 317
    inherited tabListagem: TTabSheet
      ExplicitWidth = 743
      ExplicitHeight = 289
      inherited pnlListagemTopo: TPanel
        Width = 743
        ExplicitWidth = 743
      end
      inherited grdListagem: TDBGrid
        Width = 743
        Height = 232
        DataSource = dtsListagem
        Columns = <
          item
            Expanded = False
            FieldName = 'categoriaId'
            Visible = True
          end
          item
            Expanded = False
            FieldName = 'Descricao'
            Width = 644
            Visible = True
          end>
      end
    end
    inherited TabManutencao: TTabSheet
      ExplicitWidth = 743
      ExplicitHeight = 289
      object edtCategoriaId: TLabeledEdit
        Left = 40
        Top = 48
        Width = 121
        Height = 21
        EditLabel.Width = 33
        EditLabel.Height = 13
        EditLabel.Caption = 'C'#243'digo'
        MaxLength = 10
        NumbersOnly = True
        TabOrder = 0
      end
      object edtDescricao: TLabeledEdit
        Left = 40
        Top = 88
        Width = 281
        Height = 21
        EditLabel.Width = 42
        EditLabel.Height = 13
        EditLabel.Caption = 'Desci'#231#227'o'
        MaxLength = 100
        TabOrder = 1
      end
    end
  end
  inherited pnlRodaPe: TPanel
    Top = 317
    Width = 751
    ExplicitTop = 317
    ExplicitWidth = 751
    inherited btnNavigator: TDBNavigator
      Left = 441
      Hints.Strings = ()
      ExplicitLeft = 441
    end
    inherited btnFechar: TBitBtn
      Left = 667
      Anchors = [akTop, akRight]
      ExplicitLeft = 667
    end
  end
  inherited QryListagem: TZQuery
    SQL.Strings = (
      'SELECT'
      '  categoriaId,'
      '  Descricao'
      'FROM Categorias')
    Left = 600
    object QryListagemcategoriaId: TIntegerField
      DisplayLabel = 'C'#243'digo'
      FieldName = 'categoriaId'
      ReadOnly = True
    end
    object QryListagemDescricao: TWideStringField
      DisplayLabel = 'Descri'#231#227'o'
      FieldName = 'Descricao'
      Size = 100
    end
  end
  inherited dtsListagem: TDataSource
    Left = 652
  end
end
