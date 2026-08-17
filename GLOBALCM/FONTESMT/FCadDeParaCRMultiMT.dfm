inherited frmCadDeParaCRMultiMT: TfrmCadDeParaCRMultiMT
  Left = 93
  Top = 134
  Caption = 'De/Para Centro de Responsabilidade'
  ClientHeight = 476
  ClientWidth = 774
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 774
    Height = 437
    object Panel1: TPanel
      Left = 5
      Top = 25
      Width = 300
      Height = 193
      TabOrder = 0
      object Label2: TLabel
        Left = 6
        Top = 4
        Width = 220
        Height = 13
        Caption = 'Plano de Centros de Responsabilidade'
      end
      object Label4: TLabel
        Left = 6
        Top = 42
        Width = 160
        Height = 13
        Caption = 'Centro de Responsabilidade'
      end
      object DBcboPlanCRIni: TwwDBLookupCombo
        Left = 6
        Top = 18
        Width = 288
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCPLANCRESPON'#9'60'#9'Descrição'#9'F')
        DataField = 'IDPLANCCINI'
        LookupTable = cdsPlano
        LookupField = 'IDPLANCRESPON'
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        AllowClearKey = False
        OnCloseUp = DBcboPlanCRIniCloseUp
      end
      object lbOrigem: TListBox
        Left = 7
        Top = 55
        Width = 286
        Height = 134
        ItemHeight = 13
        Sorted = True
        TabOrder = 1
      end
    end
    object Panel5: TPanel
      Left = 5
      Top = 5
      Width = 300
      Height = 20
      Caption = 'Origem'
      Color = clNavy
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object Panel4: TPanel
      Left = 6
      Top = 218
      Width = 299
      Height = 20
      Caption = 'Destino'
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object Panel2: TPanel
      Left = 6
      Top = 238
      Width = 299
      Height = 193
      TabOrder = 3
      object Label3: TLabel
        Left = 6
        Top = 5
        Width = 220
        Height = 13
        Caption = 'Plano de Centros de Responsabilidade'
      end
      object Label1: TLabel
        Left = 6
        Top = 44
        Width = 160
        Height = 13
        Caption = 'Centro de Responsabilidade'
      end
      object DBcboPlanCRFim: TwwDBLookupCombo
        Left = 5
        Top = 19
        Width = 288
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCPLANCRESPON'#9'60'#9'Descrição'#9'F')
        DataField = 'IDPLANCCFIM'
        LookupTable = cdsPlano
        LookupField = 'IDPLANCRESPON'
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        AllowClearKey = False
        OnCloseUp = DBcboPlanCRFimCloseUp
      end
      object LbDestino: TListBox
        Left = 5
        Top = 57
        Width = 286
        Height = 134
        ItemHeight = 13
        Sorted = True
        TabOrder = 1
      end
    end
    object pnlBotoes: TPanel
      Left = 305
      Top = 5
      Width = 40
      Height = 426
      TabOrder = 4
      object spdInclui: TSpeedButton
        Left = 5
        Top = 181
        Width = 33
        Height = 33
        Hint = 'Inclui na composição'
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888006666600
          88888887788888778F88880666666666088888788888F88878F880E6666F6666
          608887F888878F8887F880E6666FF66660888788888778F8878F0E66666FFF66
          66087F88FFF7778F887F0E6FFFFFFFF666087F8777777778F87F0E6FFFFFFFFF
          66087F8777777777887F0E6FFFFFFFF666087F8777777778887F0E66666FFF66
          660878F888877788887880E6666FF666608887F88887788887F880E6666F6666
          6088878F888788888788880EE666666608888878FF888888788888800EEEEE00
          8888888778FFFF77888888888000008888888888877777888888}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = spdIncluiClick
      end
      object spdExclui: TSpeedButton
        Left = 5
        Top = 214
        Width = 33
        Height = 33
        Hint = 'Exclui da composição'
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888006666600
          88888887788888778F88880666666666088888788888F88878F880E6666F6666
          608887F88887F88887F880E666FF6666608887888877F888878F0E666FFF6666
          66087F888777FFFFF87F0E66FFFFFFFF66087F8877777777F87F0E6FFFFFFFFF
          66087F8777777777F87F0E66FFFFFFFF66087F8877777777887F0E666FFF6666
          660878F88777F888887880E666FF6666608887F88877F88887F880E6666F6666
          6088878F888788888788880EE666666608888878FF888888788888800EEEEE00
          8888888778FFFF77888888888000008888888888877777888888}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = spdExcluiClick
      end
    end
    object Panel3: TPanel
      Left = 347
      Top = 5
      Width = 422
      Height = 22
      Caption = 'Composição Selecionada'
      Color = clNavy
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
    end
    object Panel6: TPanel
      Left = 347
      Top = 27
      Width = 422
      Height = 21
      Alignment = taLeftJustify
      Caption = 'Origem     Destino     Nome'
      Font.Charset = ANSI_CHARSET
      Font.Color = clBlack
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
    end
    object lbSelecionado: TListBox
      Left = 347
      Top = 48
      Width = 422
      Height = 383
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ItemHeight = 16
      ParentFont = False
      Sorted = True
      TabOrder = 7
    end
  end
  inherited Dock971: TDock97
    Top = 437
    Width = 774
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 291
    Top = 477
  end
  object sqlPlano: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   IDPLANCRESPON,'
      '   IDPLANOANTERIOR,'
      '   DATAFIM,'
      '   MASCARA,'
      '   DESCPLANCRESPON,'
      '   DATAINI'
      'FROM'
      '   PLANCENTRESPON'
      'ORDER BY'
      '   DESCPLANCRESPON')
    ClientDataSet = cdsPlano
    Left = 464
    Top = 17
  end
  object cdsPlano: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 464
    Top = 1
  end
  object sqlCRIni: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   CODCENTRORESPON,'
      '   IDEMPRESA,'
      '   NOME,'
      '   ATIVO,'
      '   CODEXTERNO,'
      '   IDPLANCRESPON'
      'FROM'
      '   CENTRESPON'
      'WHERE'
      '       IDEMPRESA      =:PIDEMPRESA'
      '   AND IDPLANCRESPON  =:PIDPLANCRESPON'
      'ORDER BY'
      '   CODEXTERNO, NOME, CODCENTRORESPON'
      ' '
      ' ')
    ClientDataSet = cdsCRIni
    Left = 128
    Top = 145
  end
  object cdsCRIni: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 80
    Top = 144
  end
  object cdsCRFim: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 80
    Top = 375
  end
  object sqlCRFim: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   CODCENTRORESPON,'
      '   IDEMPRESA,'
      '   NOME,'
      '   ATIVO,'
      '   CODEXTERNO,'
      '   IDPLANCRESPON'
      'FROM'
      '   CENTRESPON'
      'WHERE'
      '       IDEMPRESA      =:PIDEMPRESA'
      '   AND IDPLANCRESPON  =:PIDPLANCRESPON'
      'ORDER BY'
      '   CODEXTERNO, NOME, CODCENTRORESPON')
    ClientDataSet = cdsCRFim
    Left = 80
    Top = 391
  end
  object sqlComposicao: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '    D.*,'
      '    CD.NOME'
      'FROM'
      '    DEPARACC D,'
      '    CENTCUST CD'
      'WHERE'
      '    D.IDEMPRESAPROP   = :PIDEMPRESAPROP'
      'AND (:PIDPLANCCINI    IS NULL OR IDPLANCCINI = :PIDPLANCCINI)'
      'AND (:PIDPLANCCFIM    IS NULL OR IDPLANCCFIM = :PIDPLANCCFIM)'
      'AND CD.CODCENTROCUSTO = D.CODCCINI'
      'ORDER BY'
      '    D.CODCCFIM,'
      '    D.CODCCINI,'
      '    CD.NOME'
      ' '
      ' '
      ' '
      ' ')
    ClientDataSet = cdsComposicao
    Left = 512
    Top = 135
  end
  object cdsComposicao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 592
    Top = 143
  end
  object cdsCodExterno: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 464
    Top = 367
  end
  object sqlCodExterno: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   CODEXTERNO'
      'FROM'
      '   CENTRESPON'
      'WHERE'
      '       IDEMPRESA       =:PIDEMPRESA'
      '   AND IDPLANCRESPON   =:PIDPLANCRESPON'
      '   AND CODCENTRORESPON =:PCODCENTRORESPON'
      ''
      ' '
      ' ')
    ClientDataSet = cdsCodExterno
    Left = 464
    Top = 351
  end
  object sqlCodCentroRespon: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   CODCENTRORESPON'
      'FROM'
      '   CENTRESPON'
      'WHERE'
      '       IDEMPRESA      =:PIDEMPRESA'
      '   AND IDPLANCRESPON  =:PIDPLANCRESPON'
      '   AND CODEXTERNO     =:PCODEXTERNO'
      ' ')
    ClientDataSet = cdsCodCentroRespon
    Left = 616
    Top = 351
  end
  object cdsCodCentroRespon: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 584
    Top = 375
  end
end
