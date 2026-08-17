inherited frmListaPessoas: TfrmListaPessoas
  Left = 154
  Top = 176
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsToolWindow
  Caption = 'Listagem das Pessoas que já tiveram inscrição no Curso'
  ClientWidth = 504
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 504
    BorderWidth = 2
    object lstbxPessoas: TColorCheckListBox
      Left = 8
      Top = 64
      Width = 488
      Height = 162
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ItemHeight = 16
      ParentFont = False
      Style = lbOwnerDrawFixed
      TabOrder = 0
    end
    object memMensagem: TMemo
      Left = 10
      Top = 7
      Width = 485
      Height = 57
      BorderStyle = bsNone
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Lines.Strings = (
        
          'Abaixo estão listadas as pessoas que já tiveram inscrição no cur' +
          'so: .'
        'Marque as pessoas que devem ser inscritas mesmo assim.')
      ParentFont = False
      TabOrder = 1
    end
  end
  inherited Dock971: TDock97
    Width = 504
    inherited tb97Fundo: TToolbar97
      Left = 255
      Caption = '`'
      inherited sep1: TToolbarSep97
        Left = 163
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 80
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      inherited bbtnSair: TBitBtn
        Left = 83
        Caption = '&Cancelar'
        ModalResult = 2
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888009191900
          88888887788888778F88887991919191088888788888888878F8879919191919
          108887F888F888F887F887917F919F719088878887FF87FF878F7919FFF9FFF9
          19087F88777F7778887F79919FFFFF9191087F8887777788887F791919FFF919
          19087F8888777FF8887F79919FFFFF9191087F88877777FF887F7919FFF9FFF9
          190878F877787778887887917F919F71908887F88788878887F8879919191919
          1088878F88888888878888799191919108888878FF88888F7888888779999977
          8888888778FFFF77888888888777778888888888877777888888}
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 165
      end
      object bbtnConfirmar: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&Ok'
        Default = True
        ModalResult = 1
        TabOrder = 2
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
    Left = 67
    Top = 227
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
end
