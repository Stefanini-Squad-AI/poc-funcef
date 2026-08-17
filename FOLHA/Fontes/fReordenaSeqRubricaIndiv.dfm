inherited frmReordenaSeqRubricaIndiv: TfrmReordenaSeqRubricaIndiv
  Left = 281
  Top = 129
  Caption = 'Reordena sequencia da Rubrica Individual'
  ClientHeight = 465
  ClientWidth = 545
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 545
    Height = 426
    object wwDBGrid1: TwwDBGrid
      Left = 5
      Top = 5
      Width = 535
      Height = 416
      Selected.Strings = (
        'IDEMPRESA'#9'10'#9'IDEMPRESA'
        'IDTITULAR'#9'10'#9'IDTITULAR'
        'IDPESSOA'#9'10'#9'IDPESSOA'
        'IDRUBRICA'#9'10'#9'IDRUBRICA'
        'SEQRUBRICAINDIV'#9'10'#9'SEQRUBRICAINDIV'
        'SEQORIGINAL'#9'10'#9'SEQORIGINAL')
      MemoAttributes = []
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = dsRubricaIndiv
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      KeyOptions = []
      ParentFont = False
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
  end
  inherited Dock971: TDock97
    Top = 426
    Width = 545
    inherited tb97Fundo: TToolbar97
      Left = 375
      DockPos = 453
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 112
      inherited ToolbarSep971: TToolbarSep97
        Left = 176
      end
      inherited bbtnConfirmar: TBitBtn
        Left = 96
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 179
      end
      object BitBtn1: TBitBtn
        Left = 0
        Top = 0
        Width = 96
        Height = 33
        Caption = '&Processa'
        Default = True
        ModalResult = 1
        TabOrder = 2
        OnClick = BitBtn1Click
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
  object qryRubricaIndiv: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDEMPRESA, IDTITULAR, IDPESSOA, IDRUBRICA, SEQRUBRICAINDI' +
        'V, SEQRUBRICAINDIV AS SEQORIGINAL'
      'FROM RUBRICAINDIV'
      'WHERE FLGTPRUBMANUT = '#39'1'#39
      'AND NVL(FLGPENSAOALIM,0) = 0 '
      
        'ORDER BY IDEMPRESA, IDTITULAR, IDPESSOA, IDRUBRICA, SEQRUBRICAIN' +
        'DIV'
      ' '
      ' ')
    UpdateObject = udpRubricaIndiv
    ValidateWithMask = True
    Left = 46
    Top = 134
  end
  object dsRubricaIndiv: TwwDataSource
    DataSet = qryRubricaIndiv
    Left = 48
    Top = 181
  end
  object udpRubricaIndiv: TUpdateSQL
    ModifySQL.Strings = (
      'update RUBRICAINDIV'
      'set'
      '  SEQRUBRICAINDIV = :SEQRUBRICAINDIV'
      'where'
      '  IDEMPRESA = :OLD_IDEMPRESA and'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDRUBRICA = :OLD_IDRUBRICA and'
      '  SEQRUBRICAINDIV = :OLD_SEQRUBRICAINDIV')
    Left = 48
    Top = 88
  end
end
