inherited busPlanoconta: TbusPlanoconta
  Left = 158
  Top = 207
  HelpContext = 150053
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Contas Contábeis'
  ClientHeight = 438
  ClientWidth = 621
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 621
    Height = 403
    object Panel1: TPanel
      Left = 5
      Top = 5
      Width = 611
      Height = 393
      Align = alClient
      TabOrder = 0
      object Panel3: TPanel
        Left = 1
        Top = 1
        Width = 609
        Height = 27
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        Caption = 'Plano de Contas'
        Color = clNavy
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -21
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object treeContaContabil: TCMTreeView
        Left = 1
        Top = 28
        Width = 609
        Height = 364
        PodeNavegar = True
        DataSource = dsPlanoConta
        CampoChave = qryLookPlanoContaPLACONTA
        CampoDescricao = qryLookPlanoContaPLANOME
        CampoTipo = qryLookPlanoContaPLATIPO
        OnDblClick = treeContaContabilDblClick
        Align = alClient
      end
    end
  end
  inherited Dock971: TDock97
    Top = 403
    Width = 621
    Height = 35
    inherited tb97Fundo: TToolbar97
      Left = 346
      DockPos = 491
      inherited sep1: TToolbarSep97
        Left = 180
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 89
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 91
        Width = 89
        Height = 29
        ModalResult = 2
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF88888800BBBBB00
          88888887788888778F88887BBBBBBBBB088888788FFF888878F887FB707BBBBB
          B08887F8777F888887F887FB000BBBBBB0888788777F888F878F7FBB000BBB0B
          BB087F88777F887F887F7FBB0007B00BBB087F887777877F887F7FBBB000000B
          BB087F888777777F887F7FBBBB70000BBB087F888877777F887F7FBBBB00000B
          BB0878F88877777F887887FBB000007BB08887F88777777887F887FBBBBBBBBB
          B088878F888888888788887FFBBBBBBB08888878FF88888F788888877FFFFF77
          8888888778FFFF77888888888777778888888888877777888888}
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 182
        Width = 89
        Height = 29
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888004444400
          888888877888F8778F888874447F7444088888788887FF8878F8874444FFF444
          408887F88877788887F88744447F74444088878888878888878F7C4444444444
          44087F888888F888887F7C44444F844444087F888887F888887F7C44444F8444
          44087F8888878FF8887F7C444448FF4444087F888FF877FF887F7C44FF448FF4
          440878F877F8877F887887C4FF848FF4408887F877FFF77887F887C44FFFFF84
          4088878F877777888788887CC4FFF44408888878FF77788F788888877CCCCC77
          8888888778FFFF77888888888777778888888888877777888888}
      end
      object btnOk: TBitBtn
        Left = 0
        Top = 0
        Width = 89
        Height = 29
        Cancel = True
        Caption = '&Ok'
        ModalResult = 1
        TabOrder = 2
        OnClick = treeContaContabilDblClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
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
    Left = 65499
    Top = 65499
    TargetsData = (
      1
      1
      (
        ''
        'Items'
        0))
  end
  object dsPlanoConta: TwwDataSource
    AutoEdit = False
    DataSet = qryLookPlanoConta
    Left = 64
    Top = 96
  end
  object qryLookPlanoConta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PLANO, PLANOME, PLACONTA, PLATIPO, PLACCUST'
      '   '
      'FROM'
      '   PLANOCONTA'
      ''
      'WHERE'
      '   PLANO =:PPLANO'
      '   AND ( PLAINATIVA = '#39'A'#39' )'
      ''
      'ORDER BY'
      '   PLACONTA')
    ValidateWithMask = True
    Left = 64
    Top = 48
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PPLANO'
        ParamType = ptUnknown
      end>
    object qryLookPlanoContaPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'PLANOCONTA.PLANO'
    end
    object qryLookPlanoContaPLACONTA: TStringField
      FieldName = 'PLACONTA'
      Origin = 'PLANOCONTA.PLACONTA'
      Size = 18
    end
    object qryLookPlanoContaPLATIPO: TStringField
      FieldName = 'PLATIPO'
      Origin = 'PLANOCONTA.PLATIPO'
      Size = 1
    end
    object qryLookPlanoContaPLANOME: TStringField
      FieldName = 'PLANOME'
      Origin = 'PLANOCONTA.PLANOME'
      Size = 40
    end
  end
end
