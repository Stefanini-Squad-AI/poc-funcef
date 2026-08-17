inherited FrmRelSimula: TFrmRelSimula
  Left = 20
  Top = 99
  BorderIcons = []
  BorderStyle = bsDialog
  Caption = 'Simulação do Empréstimo'
  ClientHeight = 381
  ClientWidth = 761
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 761
    Height = 348
    object dbGrd: TDBGrid
      Left = 1
      Top = 1
      Width = 759
      Height = 346
      Align = alClient
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      OnDblClick = bbtnConfirmarClick
    end
  end
  inherited Dock971: TDock97
    Top = 348
    Width = 761
    Height = 33
    inherited tb97Fundo: TToolbar97
      Left = 423
      DockPos = 543
      inherited sep1: TToolbarSep97
        Left = 249
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 166
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      object ToolbarSep972: TToolbarSep97 [2]
        Left = 332
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      object ToolbarSep973: TToolbarSep97 [3]
        Left = 83
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      object ToolbarSep974: TToolbarSep97 [4]
        Left = 0
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 168
        Height = 27
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 251
        Height = 27
      end
      object bbtnConfirmar: TBitBtn
        Left = 85
        Top = 0
        Width = 81
        Height = 27
        Caption = '&Aceitar'
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
      object btnImprimir: TBitBtn
        Left = 2
        Top = 0
        Width = 81
        Height = 27
        Caption = '&Imprimir'
        ModalResult = 1
        TabOrder = 3
        OnClick = btnImprimirClick
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888880008
          8888888888888F7778FF8888000088888800877008888888888F7787F778FF88
          0000888800880007700888888F778F7778F778FF000088008800877007700888
          778F7787F778F778000080880088877770077087FF778887F88778F700008700
          888887777770008777888887FF888777000080888888F77777777087F8888F77
          78FF88870000878888FF888777777087F88F77888778FF8700008788FF888888
          87777087FF778888888778F7000087FF88899888888770877788888888888777
          000087888AA88888808880878FF8888888FFF8F700008877F888888FF0877888
          778FF88FF77787780000888877F87FFFFF08888888778F77788878F800008888
          88777FFFFFF088888888777FF888878F00008888888877FFFFFF008888888877
          8F888F77000088888888887FFF7788888888888878FF77880000888888888887
          7788888888888888877788880000888888888888888888888888888888888888
          0000}
        NumGlyphs = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 211
    Top = 14
  end
  object qry: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 287
    Top = 142
  end
  object ds: TwwDataSource
    AutoEdit = False
    DataSet = qry
    Left = 371
    Top = 22
  end
end
