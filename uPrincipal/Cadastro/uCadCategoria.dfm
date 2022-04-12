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
    inherited tabListagem: TTabSheet
      ExplicitWidth = 743
      ExplicitHeight = 289
      inherited pnlListagemTopo: TPanel
        Width = 743
        ExplicitLeft = -3
        ExplicitTop = -6
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
    end
  end
  inherited pnlRodaPe: TPanel
    Top = 317
    Width = 751
    ExplicitTop = 319
    ExplicitWidth = 751
    inherited btnNavigator: TDBNavigator
      Left = 441
      Top = 10
      Hints.Strings = ()
      ExplicitLeft = 441
      ExplicitTop = 10
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
