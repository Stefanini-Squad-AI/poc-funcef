inherited frmParamSindi: TfrmParamSindi
  Left = 314
  Top = 189
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsToolWindow
  Caption = 'Listagem de Sindicatos'
  ClientHeight = 199
  ClientWidth = 307
  Font.Style = []
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 307
    Height = 160
    BorderWidth = 2
    object cmbOrderBy: TRadioGroup
      Left = 17
      Top = 15
      Width = 274
      Height = 66
      Caption = 'Sequência'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Por Código'
        'Alfabética')
      TabOrder = 0
    end
    object gbxTipoPapel: TGroupBox
      Left = 17
      Top = 92
      Width = 274
      Height = 47
      Caption = 'Tipo de Papel'
      TabOrder = 1
      object cmbTipoPapel: TComboBox
        Left = 8
        Top = 17
        Width = 258
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
      end
    end
  end
  inherited Dock971: TDock97
    Top = 160
    Width = 307
    inherited tb97Fundo: TToolbar97
      Left = 59
      DockPos = 168
      inherited sep1: TToolbarSep97
        Left = 162
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 80
        Top = 0
        Blank = True
        SizeHorz = 2
        Visible = False
      end
      inherited bbtnSair: TBitBtn
        Left = 82
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 164
      end
      object bbtnConfirmar: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&OK'
        Default = True
        ModalResult = 1
        TabOrder = 2
        OnClick = bbtnConfirmarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888002222200
          88888887788888778F88887222222222088888788888888878F887A228822222
          208887F88FFF888887F887A2FFF8222220888788777FF888878F7A22FFFF8222
          22087F887777FF88887F7A22FFFFF82222087F8877777FF8887F7A22FF8FFF82
          22087F8877F777FF887F7A22FF82FFF822087F8877F8777F887F7A22FF222FF8
          220878F87788877FF87887A2222222FF208887F88888887787F887A222222222
          2088878F888888888788887AA222222208888878FF88888F788888877AAAAA77
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 116
    Top = 41
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
end
