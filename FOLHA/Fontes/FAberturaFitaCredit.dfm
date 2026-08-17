inherited FrmAberturaFitaCredito: TFrmAberturaFitaCredito
  Left = 494
  Top = 164
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Abertura da Fita de Crédito por Plano'
  ClientHeight = 506
  ClientWidth = 507
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 507
    Height = 467
    object GroupBox1: TGroupBox
      Left = 8
      Top = 0
      Width = 489
      Height = 55
      Caption = ' Arquivo da Fita de Crédito por Plano  '
      TabOrder = 0
      object SpeedButton1: TSpeedButton
        Left = 454
        Top = 14
        Width = 23
        Height = 22
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          5555555555555555555555555555555555555555555555555555555555555555
          555555555555555555555555555555555555555FFFFFFFFFF555550000000000
          55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
          B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
          000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
          555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
          55555575FFF75555555555700007555555555557777555555555555555555555
          5555555555555555555555555555555555555555555555555555}
        NumGlyphs = 2
        OnClick = SpeedButton1Click
      end
      object txArqEnt: TEdit
        Left = 9
        Top = 16
        Width = 432
        Height = 18
        BorderStyle = bsNone
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 0
      end
      object EdtMensagem: TEdit
        Left = 9
        Top = 34
        Width = 432
        Height = 16
        BorderStyle = bsNone
        Color = clBtnFace
        ReadOnly = True
        TabOrder = 1
      end
    end
    object REdtPrinter: TRichEdit
      Left = 664
      Top = 40
      Width = 66
      Height = 23
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Courier New'
      Font.Style = []
      Lines.Strings = (
        '')
      ParentFont = False
      TabOrder = 1
      Visible = False
    end
    object mmObs: TRichEdit
      Left = 8
      Top = 56
      Width = 489
      Height = 405
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
      ScrollBars = ssBoth
      TabOrder = 2
    end
  end
  inherited Dock971: TDock97
    Top = 467
    Width = 507
    inherited tb97Fundo: TToolbar97
      Left = 134
      inherited sep1: TToolbarSep97
        Left = 367
      end
      inherited bbtnSair: TBitBtn
        Left = 286
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 0
        Width = 1
        Visible = False
      end
      object btnPtocessar: TBitBtn
        Left = 1
        Top = 0
        Width = 92
        Height = 33
        Caption = '&Processar'
        Default = True
        Enabled = False
        ModalResult = 1
        TabOrder = 2
        OnClick = btnPtocessarClick
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
        Left = 93
        Top = 0
        Width = 92
        Height = 33
        Caption = '&Imprimir'
        Default = True
        Enabled = False
        ModalResult = 1
        TabOrder = 3
        OnClick = btnImprimirClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
          8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
          8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
          8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
        NumGlyphs = 2
      end
      object btnCancelar: TBitBtn
        Left = 185
        Top = 0
        Width = 101
        Height = 33
        Cancel = True
        Caption = '&Cancelar'
        Enabled = False
        ModalResult = 2
        TabOrder = 4
        OnClick = btnCancelarClick
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
        NumGlyphs = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 175
    Top = 223
    TargetsData = (
      1
      4
      (
        'TMemo'
        'Text'
        0)
      (
        'TRichEdit'
        'Text'
        0)
      (
        ''
        'Filter'
        0)
      (
        ''
        'DisplayLabel'
        0))
  end
  object QryAuxiliar: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.NOME, P.RAZAOSOCIAL FROM'
      'PESSOA P, '
      'EMPRESAPROP E '
      'WHERE  P.IDPESSOA = E.IDPESSOA'
      'AND P.IDPESSOA = :PIDPESSOA')
    ValidateWithMask = True
    Left = 303
    Top = 223
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object QryAux1: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 75
    Top = 227
  end
  object dlgSalvaArq: TSaveDialog
    Filter = 
      'Arquivo Texto (*.txt)|*.txt|Arquivo Dat (*.dat)|*.dat|Todos arqu' +
      'ivos (*.*)|*.*'
    Options = [ofHideReadOnly, ofFileMustExist, ofEnableSizing]
    Title = 'Arquivo de Saída'
    Left = 271
    Top = 223
  end
  object dlgAbreArq: TOpenDialog
    Filter = 
      'Arquivo Texto (*.txt)|*.txt|Arquivos DAT (*.dat)|*.dat|Arquivos ' +
      'DAT (*.rem)|*.rem|Todos Arquivos (*.*)|*.*'
    Title = 'Arquivo de Entrada'
    Left = 229
    Top = 141
  end
  object PrintDialog: TPrintDialog
    Left = 239
    Top = 223
  end
  object qryDepentit: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DE.MATRICULA'
      
        'FROM ARQUIVOXDOCUM AD                                           ' +
        '                  '
      
        'JOIN DOCUMENTOXPESSOAS DP ON AD.ID_DOC_CODBARRAS_PESSOAS = DP.ID' +
        'DOCUMENTOXPESSOAS '
      
        'JOIN ARQUIVOPAGTO AP ON AP.IDARQUIVOPAGTO = AD.IDARQUIVOPAGTO   ' +
        '                  '
      
        'JOIN DEPENTIT DE ON DE.IDTITULAR = DP.IDTITULAR AND DE.IDPESSOA ' +
        '= DP.IDFORCLI     '
      'WHERE AD.CODDOCARQ = :pCODDOCARQ;'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 273
    Top = 293
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pCODDOCARQ'
        ParamType = ptUnknown
      end>
    object qryDepentitMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 15
    end
  end
  object qryArquivoxDocum: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT DP.IDFORCLI AS IDPESSOA,                                 ' +
        '              '
      
        '             DP.IDTITULAR AS IDTITULAR,                         ' +
        '                          '
      
        '             DP.RAZAOSOCIAL AS NOME,                            ' +
        '                          '
      
        '      '#9'     NULL AS MATRICULA,                                  ' +
        '                           '
      
        '             TO_CHAR(DP.IDFORCLI) || '#39','#39' || TO_CHAR(DP.IDTITULAR' +
        ') AS IDPESSOAETITULAR   '
      
        '      FROM ARQUIVOXDOCUM AD                                     ' +
        '                         '
      
        '      JOIN ARQUIVOPAGTO AP ON AP.IDARQUIVOPAGTO = AD.IDARQUIVOPA' +
        'GTO                      '
      
        '      JOIN DOCUMENTOXPESSOAS DP ON AD.ID_DOC_CODBARRAS_PESSOAS =' +
        ' DP.IDDOCUMENTOXPESSOAS  '
      '      WHERE AP.IDARQUIVOPAGTO = :pIDARQUIVOPAGTO'
      '            AND AD.CODDOCARQ = :pCODDOCARQ;'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 379
    Top = 291
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDARQUIVOPAGTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pCODDOCARQ'
        ParamType = ptUnknown
      end>
    object FloatField1: TFloatField
      FieldName = 'IDPESSOA'
    end
    object FloatField2: TFloatField
      FieldName = 'IDTITULAR'
    end
    object StringField1: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object StringField2: TStringField
      FieldName = 'MATRICULA'
      Size = 15
    end
    object StringField3: TStringField
      FieldName = 'IDPESSOAETITULAR'
      Size = 93
    end
  end
  object qryVersaoFolha: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 185
    Top = 295
  end
  object qryArqPagto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT A.IDARQUIVOPAGTO'
      'FROM CM.ARQUIVOPAGTO A'
      'JOIN CM.PORTADORFORMA P ON A.CODPORTFORMA = P.CODPORTFORMA'
      'WHERE P.NUMEMPRESABANCO =:pNUMEMPRESABANCO'
      '      AND A.NSA =:pNSA'
      ' ')
    ValidateWithMask = True
    Left = 181
    Top = 381
    ParamData = <
      item
        DataType = ftString
        Name = 'pNUMEMPRESABANCO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pNSA'
        ParamType = ptUnknown
      end>
    object qryArqPagtoIDARQUIVOPAGTO: TFloatField
      FieldName = 'IDARQUIVOPAGTO'
      Origin = 'BASEDADOS.ARQUIVOPAGTO.IDARQUIVOPAGTO'
    end
  end
  object cdsMatriculas: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 80
    Top = 324
    object cdsMatriculasCODDOCARQ: TFloatField
      FieldName = 'CODDOCARQ'
    end
    object cdsMatriculasIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object cdsMatriculasIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
    end
    object cdsMatriculasNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object cdsMatriculasMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 15
    end
    object cdsMatriculasIDPESSOAETITULAR: TStringField
      FieldName = 'IDPESSOAETITULAR'
      Size = 93
    end
  end
  object sqlMatriculas: TCMSqlParams
    SQL.Strings = (
      'SELECT RPD.CODDOCARQ,'
      
        '       RPD.IDRESPONSAVEL AS IDPESSOA,                           ' +
        '                         '
      
        '       RPD.IDTITULAR AS IDTITULAR,                              ' +
        '                         '
      
        '       P.NOME AS NOME,                                          ' +
        '                         '
      
        '       RPD.MATRICULA AS MATRICULA,                              ' +
        '                         '
      
        '       (TO_CHAR(RPD.IDRESPONSAVEL) || '#39','#39' || TO_CHAR(RPD.IDTITUL' +
        'AR)) AS IDPESSOAETITULAR'
      
        'FROM CM.REMESSAPREVIA RP                                        ' +
        '                         '
      
        'INNER JOIN CM.REMESSAPREVIA_DETALHE RPD ON RP.IDREMESSAPREVIA = ' +
        'RPD.IDREMESSAPREVIA      '
      
        'INNER JOIN CM.PESSOA P ON P.IDPESSOA = RPD.IDRESPONSAVEL        ' +
        '                         '
      'WHERE RP.IDREMESSAPREVIA = -1'
      'ORDER BY RPD.CODDOCARQ;')
    ClientDataSet = cdsMatriculas
    Left = 80
    Top = 382
  end
end
