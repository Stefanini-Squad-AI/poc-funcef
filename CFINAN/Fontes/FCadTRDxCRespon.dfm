inherited FrmCadastroMT1: TFrmCadastroMT1
  Caption = 
    'Cadastro de Centro de Responsabilidade x Tipo de Recebimento/Des' +
    'embolso'
  ClientHeight = 414
  ClientWidth = 672
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 672
    Height = 328
    object PnlCadastro: TPanel
      Left = 5
      Top = 5
      Width = 297
      Height = 318
      Align = alLeft
      BevelOuter = bvNone
      Caption = 'PnlCadastro'
      TabOrder = 0
      object GrdTipoDesembAssoc: TwwDBGrid
        Left = 0
        Top = 67
        Width = 297
        Height = 251
        Selected.Strings = (
          'DESCRICAO'#9'36'#9'Descrição')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = ds
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        ReadOnly = True
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object PnlTitTipoAgreAssoc: TPanel
        Left = 0
        Top = 41
        Width = 297
        Height = 26
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Tipos de Recebimentos/Desembolsos Associados'
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
      object PblRamoForn: TPanel
        Left = 0
        Top = 0
        Width = 297
        Height = 41
        Align = alTop
        BevelOuter = bvNone
        TabOrder = 2
        object Label1: TLabel
          Left = 8
          Top = 0
          Width = 164
          Height = 13
          Caption = 'Centro de Responsabilidade:'
        end
        object edCentroRespon: TEdit
          Left = 8
          Top = 16
          Width = 281
          Height = 21
          Color = clInfoBk
          ReadOnly = True
          TabOrder = 0
        end
      end
    end
    object PnlCtrls: TPanel
      Left = 302
      Top = 5
      Width = 31
      Height = 318
      Align = alLeft
      BevelOuter = bvNone
      TabOrder = 1
      object BtnIncluiDesemb: TSpeedButton
        Left = 4
        Top = 156
        Width = 25
        Height = 25
        Hint = 'Selciona'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888006666600
          88888887788888778F88887666666666088888788888888878F887E666666666
          608887F888888F8887F887E66666F6666088878888887F88878F7E66666FF666
          66087F8888877F88887F7E6666FFF66666087F8888777F88887F7E666FFFF666
          66087F8887777F88887F7E6666FFF66666087F8888777F88887F7E66666FF666
          660878F888877F88887887E66666F666608887F88888788887F887E666666666
          6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
      end
      object BtnIncluiTodosDesemb: TSpeedButton
        Left = 4
        Top = 188
        Width = 25
        Height = 25
        Hint = 'Selciona Todos'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888006666600
          88888887788888778F88887666666666088888788888888878F887E666666666
          608887F8888F888F87F887E666F666F660888788887F887F878F7E666FF66FF6
          66087F88877F877F887F7E66FFF6FFF666087F88777F777F887F7E6FFFFFFFF6
          66087F877777777F887F7E66FFF6FFF666087F88777F777F887F7E666FF66FF6
          660878F8877F877F887887E666F666F6608887F88878887887F887E666666666
          6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
      end
      object BtnExcluiDesembAssoc: TSpeedButton
        Left = 4
        Top = 252
        Width = 25
        Height = 25
        Hint = 'Exclui Todos'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888006666600
          88888887788888778F88887666666666088888788888888878F887E666666666
          608887F8888F888887F887E666F66666608887888878F888878F7E6666FF6666
          66087F8888778F88887F7E6666FFF66666087F88887778F8887F7E6666FFFF66
          66087F8888777788887F7E6666FFF66666087F8888777888887F7E6666FF6666
          660878F888778888887887E666F66666608887F88878888887F887E666666666
          6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
      end
      object BtnExcluiTodosDesembAssoc: TSpeedButton
        Left = 4
        Top = 220
        Width = 25
        Height = 25
        Hint = 'Exclui'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888006666600
          88888887788888778F88887666666666088888788888888878F887E666666666
          608887F88F888F8887F887E6F666F6666088878878F878F8878F7E66FF66FF66
          66087F88778F778F887F7E66FFF6FFF666087F8877787778F87F7E66FFFFFFFF
          66087F8877777777887F7E66FFF6FFF666087F8877787778887F7E66FF66FF66
          660878F877887788887887E6F666F666608887F87888788887F887E666666666
          6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
      end
    end
    object PnlDesemb: TPanel
      Left = 333
      Top = 5
      Width = 334
      Height = 318
      Align = alClient
      BevelOuter = bvNone
      Caption = 'Panel1'
      TabOrder = 2
      object PnlTitDesemb: TPanel
        Left = 0
        Top = 41
        Width = 334
        Height = 26
        Align = alTop
        BevelInner = bvLowered
        Caption = 'Tipos de Recebimentos/Desembolsos Disponíveis'
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object GrdTipDesemb: TwwDBGrid
        Left = 0
        Top = 67
        Width = 334
        Height = 251
        Selected.Strings = (
          'DESCRICAO'#9'35'#9'Descrição')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        ReadOnly = True
        TabOrder = 1
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object rdgTiposRD: TRadioGroup
        Left = 0
        Top = 0
        Width = 334
        Height = 41
        Align = alTop
        Columns = 3
        ItemIndex = 2
        Items.Strings = (
          'Pagamentos'
          'Recebimentos    '
          'Todos')
        TabOrder = 2
      end
    end
  end
  inherited Dock972: TDock97
    Width = 672
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Width = 17
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Left = 17
        Width = 77
        Caption = '&Relacionar'
      end
      inherited sbtnProcurar: TToolbarButton97
        Left = 113
        Width = 32
      end
      inherited sbtnApagar: TToolbarButton97
        Left = 94
        Width = 19
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 375
    Width = 672
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 482
    Top = 65535
  end
  inherited ds: TwwDataSource
    Left = 230
    Top = 65535
  end
  inherited ImlPadrao: TImageList
    Left = 432
    Top = 65535
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 296
    Top = 65535
  end
  inherited Cds: TCMClientDataSet
    Left = 192
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Left = 368
    Top = 65535
  end
end
