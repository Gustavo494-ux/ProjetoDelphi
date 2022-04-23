object frmPrincipal: TfrmPrincipal
  Left = 0
  Top = 0
  Caption = 'Vendas'
  ClientHeight = 299
  ClientWidth = 635
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = mainPrincipal
  OldCreateOrder = False
  WindowState = wsMaximized
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object mainPrincipal: TMainMenu
    Left = 600
    object menuCadastro: TMenuItem
      Caption = 'Cadastro'
      object CadastroCliente: TMenuItem
        Caption = 'Cliente'
        OnClick = CadastroClienteClick
      end
      object LinhaCadastro1: TMenuItem
        Caption = '-'
      end
      object CadastroCategoria: TMenuItem
        Caption = 'Categoria'
        OnClick = CadastroCategoriaClick
      end
      object CadastroProduto: TMenuItem
        Caption = 'Produto'
      end
      object LinhaCadastro2: TMenuItem
        Caption = '-'
      end
      object FecharAplicacao: TMenuItem
        Caption = 'Fechar'
        OnClick = FecharAplicacaoClick
      end
    end
    object menuMovimentacao: TMenuItem
      Caption = 'Movimenta'#231#227'o'
      ImageName = ' '
      object MovimentoVendas: TMenuItem
        Caption = 'Vendas'
      end
    end
    object menuRelatrios: TMenuItem
      Caption = 'Relat'#243'rio'
      object RelatorioCliente: TMenuItem
        Caption = 'Cliente'
      end
      object LinhaRelatorio1: TMenuItem
        Caption = '-'
      end
      object RelatorioProduto: TMenuItem
        Caption = 'Produto'
      end
      object LinhaRelatorio2: TMenuItem
        Caption = '-'
      end
      object VendaPorData1: TMenuItem
        Caption = 'Venda Por Data'
      end
    end
  end
end
