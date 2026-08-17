inherited FrmCadastroGridMTInv: TFrmCadastroGridMTInv
  Left = 280
  Top = 220
  Caption = 'FrmCadastroGridMTInv'
  ClientWidth = 545
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Top = 78
    Width = 545
    Height = 170
    inherited pnlControles: TPanel
      Width = 543
      Height = 168
    end
    inherited dbGrd: TwwDBGrid
      Width = 543
      Height = 168
      Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap]
      ParentFont = False
      PopupMenu = pmnuFixaColunas
      TitleAlignment = taCenter
      TitleFont.Color = clMaroon
      OnTitleButtonClick = dbGrdTitleButtonClick
    end
  end
  inherited Dock972: TDock97
    Width = 545
  end
  inherited Dock971: TDock97
    Width = 545
    inherited tb97Fundo: TToolbar97
      Left = 373
      DockPos = 407
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 204
      DockPos = 238
    end
    inline fraMens: TfraMensagem
      Width = 201
      Height = 38
      TabOrder = 2
      inherited pnlProgresso: TPanel
        Width = 201
        Height = 38
        inherited pnlProgressoMensagem: TPanel
          Width = 104
          Height = 36
          inherited lblProgressoMensagem: TfcLabel
            Width = 102
            Height = 34
          end
        end
        inherited pnlProgressoBarra: TPanel
          Left = 105
          Width = 95
          Height = 36
          inherited pgbProcesso: TProgressBar
            Width = 93
            Height = 34
          end
        end
      end
    end
  end
  object pnlTitulo: TPanel [3]
    Left = 0
    Top = 47
    Width = 545
    Height = 31
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 3
    object lbNomItem: TfcLabel
      Left = 13
      Top = 3
      Width = 147
      Height = 24
      Caption = 'Titulo do Form'
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TextOptions.Alignment = taLeftJustify
      TextOptions.Style = fclsRaised
      TextOptions.VAlignment = vaTop
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 330
    Top = 7
  end
  inherited ds: TwwDataSource
    Left = 94
    Top = 111
  end
  inherited ImlPadrao: TImageList
    Left = 400
    Top = 7
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 200
    Top = 111
  end
  inherited Cds: TCMClientDataSet
    Left = 140
    Top = 111
  end
  inherited MontaSelect: TMontaSelect
    Left = 272
    Top = 7
  end
  object CdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 92
    Top = 159
  end
  object pmnuFixaColunas: TPopupMenu
    OnPopup = pmnuFixaColunasPopup
    Left = 88
    Top = 212
    object FixarColuna1: TMenuItem
      Caption = 'Fixar Coluna'
      Enabled = False
      OnClick = FixarColuna1Click
    end
    object LiberarColuna1: TMenuItem
      Caption = 'Liberar Coluna'
      Enabled = False
      OnClick = LiberarColuna1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object LiberaTodasasColunas1: TMenuItem
      Caption = 'Libera Todas as Colunas'
      Enabled = False
      OnClick = LiberaTodasasColunas1Click
    end
  end
end
