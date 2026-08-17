inherited FrmViewContrato: TFrmViewContrato
  Left = 61
  Top = 150
  Caption = 'Vizsualização dos Contratos de Produto '
  ClientWidth = 632
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 632
    object plnTitulo: TPanel
      Left = 5
      Top = 5
      Width = 622
      Height = 27
      Align = alTop
      Alignment = taLeftJustify
      Caption = ' Artigo : ABACAT  -  Abacate'
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object Grd: TwwDBGrid
      Left = 5
      Top = 32
      Width = 622
      Height = 197
      Selected.Strings = (
        'IDCONTRATOPROD'#9'10'#9'Nº  do Contrato'
        'RAZAOSOCIAL'#9'35'#9'Fornecedor'
        'CODMEDIDA'#9'4'#9'Unidade~Media'
        'VLRUNITARIO'#9'10'#9'Valor~Unitário'
        'QTDEESPERADA'#9'10'#9'Quantidade')
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = dsContrato
      Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      TabOrder = 1
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 2
      TitleButtons = False
      IndicatorColor = icBlack
    end
  end
  inherited Dock971: TDock97
    Width = 632
    inherited tb97Fundo: TToolbar97
      Left = 386
      DockPos = 386
      inherited sep1: TToolbarSep97
        Left = 160
      end
      inherited bbtnSair: TBitBtn
        Left = 80
        ModalResult = 2
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 162
      end
      object BtnAceitar: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&Usar'
        Default = True
        ModalResult = 1
        TabOrder = 2
        OnClick = BtnAceitarClick
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888088888888888888800888888888888880B0888888888888880B088
          8888888800000B088888888880BBBBB08888888880BBB00008888888880BBB08
          88888880000BFBF088888880BFBFB000088888880BFBF088888888880FBFBF08
          8888888880FBFBF0888888888000000088888888888888888888}
        Spacing = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 771
  end
  object dsContrato: TwwDataSource
    DataSet = FrmSoliComp2.qryContrato
    Left = 368
    Top = 64
  end
end
 
