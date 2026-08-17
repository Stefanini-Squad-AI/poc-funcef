inherited frmAlteracaoBeneficioSaldadoFAB: TfrmAlteracaoBeneficioSaldadoFAB
  Left = 397
  Top = 173
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Benefício Saldado e FAB'
  ClientHeight = 455
  ClientWidth = 558
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 558
    Height = 416
    TabOrder = 3
    object TPanel
      Left = 3
      Top = 3
      Width = 550
      Height = 405
      BevelInner = bvLowered
      BevelOuter = bvLowered
      TabOrder = 0
      object Label1: TLabel
        Left = 18
        Top = 12
        Width = 133
        Height = 13
        Caption = 'Salário de Participação'
      end
      object Label2: TLabel
        Left = 18
        Top = 38
        Width = 89
        Height = 13
        Caption = 'Benefício INSS'
      end
      object Label3: TLabel
        Left = 258
        Top = 13
        Width = 38
        Height = 13
        Caption = '% PBE'
      end
      object lblBS: TLabel
        Left = 258
        Top = 38
        Width = 106
        Height = 13
        Caption = 'Benefício Saldado'
      end
      object GroupBox1: TGroupBox
        Left = 8
        Top = 64
        Width = 296
        Height = 75
        Caption = 'Cargo'
        TabOrder = 0
        object Label4: TLabel
          Left = 8
          Top = 22
          Width = 33
          Height = 13
          Caption = 'Nome'
        end
        object Label5: TLabel
          Left = 8
          Top = 49
          Width = 30
          Height = 13
          Caption = 'Valor'
        end
        object dbtNomeCargo: TDBEdit
          Left = 55
          Top = 17
          Width = 234
          Height = 21
          DataField = 'NOMECARGO'
          DataSource = dsCargaBen
          TabOrder = 0
        end
        object dbredValorCargo: TDBRealEdit
          Left = 55
          Top = 44
          Width = 130
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          TabOrder = 1
          WordWrap = False
          IntDigits = 9
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'VALORCARGO'
          DataSource = dsCargaBen
        end
      end
      object GroupBox2: TGroupBox
        Left = 313
        Top = 64
        Width = 230
        Height = 75
        Caption = 'ATS'
        TabOrder = 4
        object Label6: TLabel
          Left = 7
          Top = 19
          Width = 14
          Height = 16
          Caption = '%'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 8
          Top = 47
          Width = 30
          Height = 13
          Caption = 'Valor'
        end
        object dbredVALORAts: TDBRealEdit
          Left = 44
          Top = 44
          Width = 101
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          TabOrder = 1
          WordWrap = False
          IntDigits = 9
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'VALORATS'
          DataSource = dsCargaBen
        end
        object dbredPercAts: TDBRealEdit
          Left = 44
          Top = 17
          Width = 53
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0')
          TabOrder = 0
          WordWrap = False
          IntDigits = 3
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'PERCENTATS'
          DataSource = dsCargaBen
        end
      end
      object GroupBox3: TGroupBox
        Left = 8
        Top = 146
        Width = 296
        Height = 126
        Caption = 'VP'
        TabOrder = 1
        object Label8: TLabel
          Left = 8
          Top = 17
          Width = 194
          Height = 13
          Caption = 'Grat. sem adic. Tempo de Serviço'
        end
        object Label9: TLabel
          Left = 8
          Top = 45
          Width = 137
          Height = 13
          Caption = 'GIP - Tempo de Serviço'
        end
        object Label10: TLabel
          Left = 8
          Top = 73
          Width = 148
          Height = 13
          Caption = 'GIP sem Salário + Função'
        end
        object Label11: TLabel
          Left = 8
          Top = 101
          Width = 45
          Height = 13
          Caption = 'Ex-BNH'
        end
        object dbredSenAdicTenp: TDBRealEdit
          Left = 206
          Top = 15
          Width = 81
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0')
          TabOrder = 0
          WordWrap = False
          IntDigits = 7
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'VPGRATSEMADICTEMPSERV'
          DataSource = dsCargaBen
        end
        object dbredTempServ: TDBRealEdit
          Left = 206
          Top = 42
          Width = 81
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0')
          TabOrder = 1
          WordWrap = False
          IntDigits = 7
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'VPGIPTEMPOSERV'
          DataSource = dsCargaBen
        end
        object dbredSalFunc: TDBRealEdit
          Left = 206
          Top = 70
          Width = 81
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0')
          TabOrder = 2
          WordWrap = False
          IntDigits = 7
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'VPGIPSEMSALCOMFUNC'
          DataSource = dsCargaBen
        end
        object dbredExBNH: TDBRealEdit
          Left = 206
          Top = 97
          Width = 81
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0')
          TabOrder = 3
          WordWrap = False
          IntDigits = 7
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'VPEXBH'
          DataSource = dsCargaBen
        end
      end
      object GroupBox4: TGroupBox
        Left = 313
        Top = 147
        Width = 230
        Height = 226
        Caption = 'Adicionais'
        TabOrder = 5
        object Label12: TLabel
          Left = 8
          Top = 21
          Width = 110
          Height = 26
          Caption = 'Compensatório por Perda de Função'
          WordWrap = True
        end
        object Label13: TLabel
          Left = 8
          Top = 55
          Width = 76
          Height = 13
          Caption = 'Incorporação'
        end
        object Label14: TLabel
          Left = 8
          Top = 82
          Width = 46
          Height = 13
          Caption = 'Noturno'
        end
        object Label15: TLabel
          Left = 8
          Top = 110
          Width = 77
          Height = 13
          Caption = 'Insalubirdade'
        end
        object Label16: TLabel
          Left = 8
          Top = 139
          Width = 84
          Height = 13
          Caption = 'Periculosidade'
        end
        object Label17: TLabel
          Left = 8
          Top = 168
          Width = 123
          Height = 13
          Caption = 'Incorporação Judicial'
        end
        object lblcsp: TLabel
          Left = 8
          Top = 196
          Width = 123
          Height = 13
          Caption = 'Comp. Salário Padrão'
        end
        object dbredIncorpJud: TDBRealEdit
          Left = 137
          Top = 164
          Width = 85
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0')
          TabOrder = 5
          WordWrap = False
          IntDigits = 7
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'INCORPJUD'
          DataSource = dsCargaBen
        end
        object dbredCOmpPerdFunc: TDBRealEdit
          Left = 137
          Top = 20
          Width = 85
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0')
          TabOrder = 0
          WordWrap = False
          IntDigits = 7
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'ADICCOMP'
          DataSource = dsCargaBen
        end
        object dbredIncorp: TDBRealEdit
          Left = 137
          Top = 48
          Width = 85
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0')
          TabOrder = 1
          WordWrap = False
          IntDigits = 7
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'ADICINCORP'
          DataSource = dsCargaBen
        end
        object dbredNotur: TDBRealEdit
          Left = 137
          Top = 78
          Width = 85
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0')
          TabOrder = 2
          WordWrap = False
          IntDigits = 7
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'ADICNOTURNO'
          DataSource = dsCargaBen
        end
        object dbredInsalubr: TDBRealEdit
          Left = 137
          Top = 108
          Width = 85
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0')
          TabOrder = 3
          WordWrap = False
          IntDigits = 7
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'ADICINSALU'
          DataSource = dsCargaBen
        end
        object dbredPericulosidade: TDBRealEdit
          Left = 137
          Top = 136
          Width = 85
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0')
          TabOrder = 4
          WordWrap = False
          IntDigits = 7
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'ADICPERI'
          DataSource = dsCargaBen
        end
        object dbredCSP: TDBRealEdit
          Left = 137
          Top = 192
          Width = 85
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0')
          TabOrder = 6
          WordWrap = False
          IntDigits = 7
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'COMPSALPADRAO'
          DataSource = dsCargaBen
        end
      end
      object GroupBox5: TGroupBox
        Left = 8
        Top = 282
        Width = 296
        Height = 115
        Caption = 'Cargo Comissionado ou Função de Confiança'
        TabOrder = 2
        object Label18: TLabel
          Left = 8
          Top = 29
          Width = 40
          Height = 13
          Caption = 'Código'
        end
        object Label19: TLabel
          Left = 8
          Top = 57
          Width = 33
          Height = 13
          Caption = 'Nome'
        end
        object Label21: TLabel
          Left = 8
          Top = 85
          Width = 30
          Height = 13
          Caption = 'Valor'
        end
        object dbtCargoComiCod: TDBEdit
          Left = 55
          Top = 25
          Width = 79
          Height = 21
          DataField = 'CODCARGOCOMIS'
          DataSource = dsCargaBen
          TabOrder = 0
        end
        object dbtCargoComiNome: TDBEdit
          Left = 55
          Top = 53
          Width = 234
          Height = 21
          DataField = 'NOMECARGOCOMIS'
          DataSource = dsCargaBen
          TabOrder = 1
        end
        object dbredVALORCARGOCOMIS: TDBRealEdit
          Left = 55
          Top = 80
          Width = 130
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          TabOrder = 2
          WordWrap = False
          IntDigits = 9
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
          DataField = 'VALORCARGOCOMIS'
          DataSource = dsCargaBen
        end
      end
      object dbredBeneficioSaldado: TcmMaskEditDlg
        Left = 370
        Top = 34
        Width = 121
        Height = 21
        Hint = 'Clique no botão à direita para calcular o valor do  BS'
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 3
        OnBtnClick = dbredBeneficioSaldadoBtnClick
        BtnGlyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
          73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
          0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
          0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
          0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
          0333337F777777737F333308888888880333337F333333337F33330888888888
          03333373FFFFFFFF733333700000000073333337777777773333}
        BtnNumGlyphs = 2
        BtnWidth = 17
      end
    end
  end
  inherited Dock971: TDock97
    Top = 416
    Width = 558
    inherited tb97Fundo: TToolbar97
      Left = 367
      inherited sep1: TToolbarSep97
        Left = 169
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Width = 85
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        Caption = 'Atualizar'
        ModalResult = 0
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        ModalResult = 0
        OnClick = bbtnCancelarClick
      end
    end
  end
  object dbredSalario: TDBRealEdit [2]
    Left = 158
    Top = 11
    Width = 82
    Height = 21
    Alignment = taRightJustify
    Lines.Strings = (
      '0,00')
    TabOrder = 0
    WordWrap = False
    IntDigits = 7
    DecDigits = 2
    NumberFormat = fNumber
    Signal = False
    DataField = 'SALPART'
    DataSource = dsCargaBen
  end
  object dbredBeneficioINSS: TDBRealEdit [3]
    Left = 158
    Top = 36
    Width = 82
    Height = 21
    Alignment = taRightJustify
    Lines.Strings = (
      '0,00')
    TabOrder = 1
    WordWrap = False
    IntDigits = 7
    DecDigits = 2
    NumberFormat = fNumber
    Signal = False
    DataField = 'BINSS'
    DataSource = dsCargaBen
  end
  object dbredPBE: TDBRealEdit [4]
    Left = 373
    Top = 12
    Width = 81
    Height = 21
    Alignment = taRightJustify
    Lines.Strings = (
      '0')
    TabOrder = 2
    WordWrap = False
    IntDigits = 3
    DecDigits = 2
    NumberFormat = fNumber
    Signal = False
    DataField = 'PERCENTPBE'
    DataSource = dsCargaBen
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 461
    Top = 390
    TargetsData = (
      1
      2
      (
        ''
        'DisplayLabel'
        0)
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  object qryCargaBen: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT * FROM CM.CARGABENEFSALDFAB '
      'WHERE   IDPESSOA =  :IDPESSOA'
      'AND  IDTITULAR = :IDTITULAR')
    UpdateObject = upd
    ValidateWithMask = True
    Left = 193
    Top = 113
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end>
  end
  object dsCargaBen: TDataSource
    DataSet = qryCargaBen
    Left = 265
    Top = 113
  end
  object upd: TUpdateSQL
    ModifySQL.Strings = (
      'update CM.CARGABENEFSALDFAB'
      'set'
      '  IDCARGABENEFSALDFAB = :IDCARGABENEFSALDFAB,'
      '  IDCARGAARQUIVO = :IDCARGAARQUIVO,'
      '  IDPESSOA = :IDPESSOA,'
      '  IDTITULAR = :IDTITULAR,'
      '  DATASALDAMENTO = :DATASALDAMENTO,'
      '  DATAIMPORTACAO = :DATAIMPORTACAO,'
      '  PCS = :PCS,'
      '  NOMECARGO = :NOMECARGO,'
      '  VALORCARGO = :VALORCARGO,'
      '  PERCENTATS = :PERCENTATS,'
      '  VALORATS = :VALORATS,'
      '  VPGRATSEMADICTEMPSERV = :VPGRATSEMADICTEMPSERV,'
      '  VPGIPTEMPOSERV = :VPGIPTEMPOSERV,'
      '  VPGIPSEMSALCOMFUNC = :VPGIPSEMSALCOMFUNC,'
      '  VPEXBH = :VPEXBH,'
      '  ADICCOMP = :ADICCOMP,'
      '  ADICINCORP = :ADICINCORP,'
      '  ADICNOTURNO = :ADICNOTURNO,'
      '  ADICINSALU = :ADICINSALU,'
      '  ADICPERI = :ADICPERI,'
      '  INCORPJUD = :INCORPJUD,'
      '  CODCARGOCOMIS = :CODCARGOCOMIS,'
      '  NOMECARGOCOMIS = :NOMECARGOCOMIS,'
      '  VALORCARGOCOMIS = :VALORCARGOCOMIS,'
      '  SALPART = :SALPART,'
      '  BENEFICIOSALDADO = :BENEFICIOSALDADO,'
      '  PERCENTPBE = :PERCENTPBE,'
      '  ULTIMOMESPROC = :ULTIMOMESPROC,'
      '  DATAELEGIBILIDADE = :DATAELEGIBILIDADE,'
      '  COMPSALPADRAO = :COMPSALPADRAO,'
      '  -- 253577/18089'
      '  BINSS = :BINSS'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDTITULAR = :OLD_IDTITULAR'
      ' '
      ' ')
    Left = 515
    Top = 49
  end
  object qryHistorico: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT * FROM CM.HSTALTBENEFSALDFAB WHERE 1 = 2')
    UpdateObject = updHistorico
    ValidateWithMask = True
    Left = 329
    Top = 393
    object qryHistoricoIDHSTALTBENEFSALDFAB: TFloatField
      FieldName = 'IDHSTALTBENEFSALDFAB'
      Origin = 'BASEDADOS.HSTALTBENEFSALDFAB.IDHSTALTBENEFSALDFAB'
    end
    object qryHistoricoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.HSTALTBENEFSALDFAB.IDPESSOA'
    end
    object qryHistoricoIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
      Origin = 'BASEDADOS.HSTALTBENEFSALDFAB.IDTITULAR'
    end
    object qryHistoricoTIPO: TStringField
      FieldName = 'TIPO'
      Origin = 'BASEDADOS.HSTALTBENEFSALDFAB.TIPO'
      FixedChar = True
      Size = 1
    end
    object qryHistoricoCAMPO: TStringField
      FieldName = 'CAMPO'
      Origin = 'BASEDADOS.HSTALTBENEFSALDFAB.CAMPO'
    end
    object qryHistoricoVALORANTERIOR: TStringField
      FieldName = 'VALORANTERIOR'
      Origin = 'BASEDADOS.HSTALTBENEFSALDFAB.VALORANTERIOR'
      Size = 50
    end
    object qryHistoricoVALORALTERADO: TStringField
      FieldName = 'VALORALTERADO'
      Origin = 'BASEDADOS.HSTALTBENEFSALDFAB.VALORALTERADO'
      Size = 50
    end
    object qryHistoricoMESREFERENCIA: TStringField
      FieldName = 'MESREFERENCIA'
      Origin = 'BASEDADOS.HSTALTBENEFSALDFAB.MESREFERENCIA'
      Size = 10
    end
  end
  object updHistorico: TUpdateSQL
    InsertSQL.Strings = (
      'insert into CM.HSTALTBENEFSALDFAB'
      
        '  (IDHSTALTBENEFSALDFAB, IDPESSOA, IDTITULAR, TIPO, CAMPO, VALOR' +
        'ANTERIOR, '
      '   VALORALTERADO, MESREFERENCIA)'
      'values'
      
        '  (SEQHSTALTBENEFSALDFAB.NEXTVAL, :IDPESSOA, :IDTITULAR, :TIPO, ' +
        ':CAMPO, :VALORANTERIOR, '
      '   :VALORALTERADO, :MESREFERENCIA)')
    Left = 395
    Top = 393
  end
  object qryUpdBenef: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'UPDATE CM.BENEFSALDFAB SET BENEFSALDADO = :BENEFSALDADO'
      ' WHERE IDPESSOA = :IDPESSOA'
      ' AND IDTITULAR = :IDTITULAR'
      ' AND IDCARGAARQUIVO = :IDCARGAARQUIVO'
      ' AND INDICE IS NULL')
    ValidateWithMask = True
    Left = 513
    Top = 97
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'BENEFSALDADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDCARGAARQUIVO'
        ParamType = ptUnknown
      end>
  end
end
