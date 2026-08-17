inherited FrmExpLancto: TFrmExpLancto
  Left = 119
  Top = 145
  BorderStyle = bsSingle
  Caption = 'Exportação de Lançamentos'
  ClientHeight = 393
  ClientWidth = 522
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 522
    Height = 354
    object Panel1: TPanel
      Left = 5
      Top = 5
      Width = 512
      Height = 116
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object Label1: TLabel
        Left = 16
        Top = 28
        Width = 109
        Height = 13
        Caption = 'Arquivo de Destino'
      end
      object BtnFile: TSpeedButton
        Left = 467
        Top = 41
        Width = 25
        Height = 25
        Hint = 'Selecionar Diretório'
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
          FFFFFFF7777777777777FF00000000000007FF0FB8B8B8B8B707F0FB8B8B8B8B
          8707F0F8B8B8B8B8B0070F8B8B8B8B8B70070FFFFFFFFFF70807000000000000
          0B07F0F0FFCFCFCFF007F0FB0FFCFCFCFF07F0F8B0FFCFCFF00FFF0FFF0FFCFF
          07FFFFF00070FFF07FFFFFFFFFFF0F07FFFFFFFFFFFFF07FFFFF}
        OnClick = BtnFileClick
      end
      object Label2: TLabel
        Left = 14
        Top = 9
        Width = 361
        Height = 13
        Caption = 
          ' Data de Inclusão dos Documentos Entre                          ' +
          '    e'
      end
      object lblCentroRespon: TLabel
        Left = 14
        Top = 71
        Width = 160
        Height = 13
        Caption = 'Centro de Responsabilidade'
      end
      object EdtFile: TEdit
        Left = 16
        Top = 43
        Width = 449
        Height = 21
        TabOrder = 0
      end
      object DtLancIni: TCMDateTimePicker
        Left = 253
        Top = 4
        Width = 109
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        Epoch = 1950
        ButtonGlyph.Data = {
          06050000424D06050000000000003604000028000000100000000D0000000100
          080000000000D000000000000000000000000001000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
          A6000020400000206000002080000020A0000020C0000020E000004000000040
          20000040400000406000004080000040A0000040C0000040E000006000000060
          20000060400000606000006080000060A0000060C0000060E000008000000080
          20000080400000806000008080000080A0000080C0000080E00000A0000000A0
          200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
          200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
          200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
          20004000400040006000400080004000A0004000C0004000E000402000004020
          20004020400040206000402080004020A0004020C0004020E000404000004040
          20004040400040406000404080004040A0004040C0004040E000406000004060
          20004060400040606000406080004060A0004060C0004060E000408000004080
          20004080400040806000408080004080A0004080C0004080E00040A0000040A0
          200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
          200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
          200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
          20008000400080006000800080008000A0008000C0008000E000802000008020
          20008020400080206000802080008020A0008020C0008020E000804000008040
          20008040400080406000804080008040A0008040C0008040E000806000008060
          20008060400080606000806080008060A0008060C0008060E000808000008080
          20008080400080806000808080008080A0008080C0008080E00080A0000080A0
          200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
          200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
          200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
          2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
          2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
          2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
          2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
          2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
          2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
          2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
          000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
          A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
          A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
          A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
          FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
          04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
          000000000000000000FF}
        ShowButton = True
        TabOrder = 1
      end
      object DtLancFin: TCMDateTimePicker
        Left = 383
        Top = 4
        Width = 109
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        Epoch = 1950
        ButtonGlyph.Data = {
          06050000424D06050000000000003604000028000000100000000D0000000100
          080000000000D000000000000000000000000001000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
          A6000020400000206000002080000020A0000020C0000020E000004000000040
          20000040400000406000004080000040A0000040C0000040E000006000000060
          20000060400000606000006080000060A0000060C0000060E000008000000080
          20000080400000806000008080000080A0000080C0000080E00000A0000000A0
          200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
          200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
          200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
          20004000400040006000400080004000A0004000C0004000E000402000004020
          20004020400040206000402080004020A0004020C0004020E000404000004040
          20004040400040406000404080004040A0004040C0004040E000406000004060
          20004060400040606000406080004060A0004060C0004060E000408000004080
          20004080400040806000408080004080A0004080C0004080E00040A0000040A0
          200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
          200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
          200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
          20008000400080006000800080008000A0008000C0008000E000802000008020
          20008020400080206000802080008020A0008020C0008020E000804000008040
          20008040400080406000804080008040A0008040C0008040E000806000008060
          20008060400080606000806080008060A0008060C0008060E000808000008080
          20008080400080806000808080008080A0008080C0008080E00080A0000080A0
          200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
          200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
          200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
          2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
          2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
          2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
          2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
          2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
          2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
          2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
          000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
          A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
          A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
          A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
          FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
          04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
          000000000000000000FF}
        ShowButton = True
        TabOrder = 2
      end
      object dblcCentroRespon: TwwDBLookupCombo
        Left = 14
        Top = 87
        Width = 304
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'25'#9'Descrição'
          'ANALITICOSINTET'#9'1'#9'T'
          'CODCENTRORESPON'#9'10'#9'Código')
        LookupTable = qryCentroRespon
        LookupField = 'CODCENTRORESPON'
        Options = [loColLines, loTitles]
        Style = csDropDownList
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        OrderByDisplay = False
        UseTFields = False
        AllowClearKey = True
        ShowMatchText = True
      end
    end
    object MemLog: TMemo
      Left = 5
      Top = 121
      Width = 512
      Height = 228
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ReadOnly = True
      ScrollBars = ssVertical
      TabOrder = 1
    end
  end
  inherited Dock971: TDock97
    Top = 354
    Width = 522
    inherited tb97Fundo: TToolbar97
      Left = 343
      DockPos = 343
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 175
      DockPos = 175
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 255
    Top = 252
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object QryDocs: TwwQuery
    OnCalcFields = QryDocsCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      ' D.CODDOCUMENTO,'
      ' CR.NOME AS CODCENTRORESPON,'
      ' D.NUMAPGR AS NODOCUMENTO,'
      ' D.REFERENCIA,'
      ' D.DATAVENCTO,'
      ' D.DATAPROGRAMADA,'
      ' L.DATALANCTO,'
      ' P.RAZAOSOCIAL,'
      ' P.NUMDOCUMENTO,'
      ' L.VALOR,'
      ' L.HISTORICOCOMPL,'
      ' F.CODFORMA,'
      '-- DECODE(F.FLGDADOSBANCARIOS,'#39'S'#39',B.NUMBANCO,'#39#39') AS NUMBANCO,'
      
        '-- DECODE(F.FLGDADOSBANCARIOS,'#39'S'#39',PB.RAZAOSOCIAL,'#39#39') AS NOMEBANC' +
        'O,'
      
        '-- DECODE(F.FLGDADOSBANCARIOS,'#39'S'#39',A.NUMAGENCIA,'#39#39') AS NUMAGENCIA' +
        ','
      
        '-- DECODE(F.FLGDADOSBANCARIOS,'#39'S'#39',PA.RAZAOSOCIAL,'#39#39') AS NOMEAGEN' +
        'CIA,'
      
        '-- DECODE(F.FLGDADOSBANCARIOS,'#39'S'#39',C.CONTACORRENTE,'#39#39') AS CONTACO' +
        'RRENTE,'
      ' DECODE(F.FLGDADOSBANCARIOS,'#39'S'#39','#39#39',F.DESCRICAO) AS DESCRICAO,'
      ' D.OBS'
      'FROM'
      ' PESSOA P,'
      '-- PESSOA PB,'
      '-- PESSOA PA,'
      '-- CONTABANCARIA C,'
      '-- AGENCIABANCARIA A,'
      '-- BANCO B,'
      ' DOCUMENTO D,'
      ' LANCTODOCUM L,'
      ' RATEIODOCUM RD,'
      ' FORMARECPAG F,'
      ' CENTRESPON CR'
      'WHERE'
      
        ' (TO_CHAR(D.TRGDTINCLUSAO,'#39'YYYYMMDD'#39') BETWEEN TO_CHAR(TO_DATE(:D' +
        'ATAINI,'#39'DD/MM/YYYY'#39'),'#39'YYYYMMDD'#39') AND TO_CHAR(TO_DATE(:DATAFIN,'#39'D' +
        'D/MM/YYYY'#39'),'#39'YYYYMMDD'#39')) AND'
      ' (RTRIM(D.OPERACAO)     <> '#39'3'#39') AND'
      
        ' (NOT ((RTRIM(D.OPERACAO) = '#39'1'#39') AND (RTRIM(D.STATUS) = '#39'2'#39'))) A' +
        'ND'
      ' (D.NUMFATURA           IS NULL)'#9'      AND'
      ' (L.ESTORNO             IS NULL) '#9'      AND'
      '-- (C.IDPESSOA(+) = D.IDFORCLI)                 AND'
      '-- (C.FLGCONTAPREF(+) = 1)                      AND'
      '-- (C.IDAGENCIA   = A.IDPESSOA(+))              AND'
      '-- (A.IDBANCO     = B.IDPESSOA(+))'#9'      AND'
      '-- (A.IDPESSOA    = PA.IDPESSOA(+))             AND'
      '-- (B.IDPESSOA    = PB.IDPESSOA(+))             AND'
      ' (D.CODDOCUMENTO        = L.CODDOCUMENTO)     AND'
      ' (D.OPERACAO            = L.OPERACAO)         AND'
      ' (D.CODDOCUMENTO        = RD.CODDOCUMENTO)    AND'
      ' (P.IDPESSOA            = D.IDFORCLI)         AND'
      ' (RD.CODCENTRORESPON    = CR.CODCENTRORESPON(+)) AND'
      ' (RD.IDPESSOA           = CR.IDPESSOA(+))     AND'
      ' (D.CODFORMA            = F.CODFORMA(+))')
    ValidateWithMask = True
    Left = 90
    Top = 142
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptUnknown
        Value = '31/01/2000'
      end
      item
        DataType = ftString
        Name = 'DATAFIN'
        ParamType = ptUnknown
        Value = '01/01/2000'
      end>
    object QryDocsCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object QryDocsCODCENTRORESPON: TStringField
      Tag = 10
      FieldName = 'CODCENTRORESPON'
      Size = 30
    end
    object QryDocsNODOCUMENTO: TFloatField
      Tag = 10
      FieldName = 'NODOCUMENTO'
    end
    object QryDocsREFERENCIA: TStringField
      Tag = 20
      FieldName = 'REFERENCIA'
      Size = 30
    end
    object QryDocsDATAVENCTO: TDateTimeField
      Tag = 8
      FieldName = 'DATAVENCTO'
    end
    object QryDocsDATAPROGRAMADA: TDateTimeField
      Tag = 8
      FieldName = 'DATAPROGRAMADA'
    end
    object QryDocsDATALANCTO: TDateTimeField
      Tag = 8
      FieldName = 'DATALANCTO'
    end
    object QryDocsRAZAOSOCIAL: TStringField
      Tag = 50
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object QryDocsNUMDOCUMENTO: TStringField
      Tag = 18
      FieldName = 'NUMDOCUMENTO'
      Size = 18
    end
    object QryDocsVALOR: TFloatField
      Tag = 15
      FieldName = 'VALOR'
    end
    object QryDocsVALORALTERACRES: TFloatField
      Tag = 15
      FieldKind = fkCalculated
      FieldName = 'VALORALTERACRES'
      Calculated = True
    end
    object QryDocsVALORALTERDECRES: TFloatField
      Tag = 15
      FieldKind = fkCalculated
      FieldName = 'VALORALTERDECRES'
      Calculated = True
    end
    object QryDocsVALORALTERIRRF: TFloatField
      Tag = 15
      FieldKind = fkCalculated
      FieldName = 'VALORALTERIRRF'
      Calculated = True
    end
    object QryDocsVALORSALDO: TFloatField
      Tag = 15
      FieldKind = fkCalculated
      FieldName = 'VALORSALDO'
      Calculated = True
    end
    object QryDocsHISTORICOCOMPL: TStringField
      Tag = 60
      FieldName = 'HISTORICOCOMPL'
      Size = 60
    end
    object QryDocsCODFORMA: TFloatField
      Tag = 3
      FieldName = 'CODFORMA'
    end
    object QryDocsNUMBANCO: TStringField
      Tag = 3
      FieldKind = fkCalculated
      FieldName = 'NUMBANCO'
      Size = 10
      Calculated = True
    end
    object QryDocsNOMEBANCO: TStringField
      Tag = 20
      FieldKind = fkCalculated
      FieldName = 'NOMEBANCO'
      Size = 60
      Calculated = True
    end
    object QryDocsNUMAGENCIA: TStringField
      Tag = 6
      FieldKind = fkCalculated
      FieldName = 'NUMAGENCIA'
      Size = 15
      Calculated = True
    end
    object QryDocsNOMEAGENCIA: TStringField
      Tag = 30
      FieldKind = fkCalculated
      FieldName = 'NOMEAGENCIA'
      Size = 60
      Calculated = True
    end
    object QryDocsCONTACORRENTE: TStringField
      Tag = 12
      FieldKind = fkCalculated
      FieldName = 'CONTACORRENTE'
      Size = 15
      Calculated = True
    end
    object QryDocsDESCRICAO: TStringField
      Tag = 30
      FieldName = 'DESCRICAO'
      Size = 30
    end
    object QryDocsOBS: TMemoField
      Tag = 500
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1000
    end
  end
  object QryDocsParcelados: TwwQuery
    OnCalcFields = QryDocsParceladosCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '  Q1.CODDOCUMENTO, Q2.NOMECR,  Q1.NODOCUMENTO,  Q1.REFERENCIA,'
      
        '  Q1.DATAVENCTO,   Q1.DATAPROGRAMADA,  Q1.DATALANCTO,  Q1.RAZAOS' +
        'OCIAL,'
      
        '  Q1.NUMDOCUMENTO,   SUM(((Q1.VALOR * Q2.VALOR)/ Q3.VALOR)) AS V' +
        'ALOR,'
      '  Q1.HISTORICOCOMPL,   Q1.CODFORMA,'
      '--  Q1.NUMBANCO,  Q1.NOMEBANCO,  Q1.NUMAGENCIA,'
      '--  Q1.NOMEAGENCIA,  Q1.CONTACORRENTE,'
      '  Q1.DESCRICAO, Q1.NUMFATURA, Q1.OBS'
      'FROM'
      '  (SELECT'
      '     DOC.CODDOCUMENTO,'
      '     DOC.NUMFATURA,'
      '     LAN.VALOR,'
      '     DOC.NUMAPGR AS NODOCUMENTO,'
      '     DOC.REFERENCIA,'
      '     DOC.DATAVENCTO,'
      '     DOC.DATAPROGRAMADA,'
      '     LAN.DATALANCTO,'
      '     PES.RAZAOSOCIAL,'
      '     PES.NUMDOCUMENTO,'
      '     LAN.HISTORICOCOMPL,'
      '     F.CODFORMA,'
      
        '--     DECODE(F.FLGDADOSBANCARIOS,'#39'S'#39',B.NUMBANCO,'#39#39') AS NUMBANCO' +
        ','
      
        '--     DECODE(F.FLGDADOSBANCARIOS,'#39'S'#39',PB.RAZAOSOCIAL,'#39#39') AS NOME' +
        'BANCO,'
      
        '--     DECODE(F.FLGDADOSBANCARIOS,'#39'S'#39',A.NUMAGENCIA,'#39#39') AS NUMAGE' +
        'NCIA,'
      
        '--     DECODE(F.FLGDADOSBANCARIOS,'#39'S'#39',PA.RAZAOSOCIAL,'#39#39') AS NOME' +
        'AGENCIA,'
      
        '--     DECODE(F.FLGDADOSBANCARIOS,'#39'S'#39',C.CONTACORRENTE,'#39#39') AS CON' +
        'TACORRENTE,'
      
        '     DECODE(F.FLGDADOSBANCARIOS,'#39'S'#39','#39#39',F.DESCRICAO) AS DESCRICAO' +
        ','
      '     DOC.OBS'
      '  FROM'
      '     PESSOA PES,'
      '--     PESSOA PB,'
      '--     PESSOA PA,'
      '--     AGENCIABANCARIA A,'
      '--     BANCO B,'
      '--     CONTABANCARIA C,'
      '     DOCUMENTO DOC,'
      '     LANCTODOCUM LAN,'
      '     FORMARECPAG F'
      '  WHERE'
      
        '    (TO_CHAR(DOC.TRGDTINCLUSAO,'#39'YYYYMMDD'#39') BETWEEN TO_CHAR(TO_DA' +
        'TE(:DATAINI,'#39'DD/MM/YYYY'#39'),'#39'YYYYMMDD'#39') AND TO_CHAR(TO_DATE(:DATAF' +
        'IN,'#39'DD/MM/YYYY'#39'),'#39'YYYYMMDD'#39')) AND'
      '    ((LAN.OPERACAO = '#39'3'#39') OR (LAN.OPERACAO = '#39'13'#39')) AND'
      '    (PES.IDPESSOA = DOC.IDFORCLI) AND'
      '--    (C.IDPESSOA(+) = DOC.IDFORCLI) AND'
      '--    (C.FLGCONTAPREF(+) = 1) AND'
      '--    (C.IDAGENCIA = A.IDPESSOA(+)) AND'
      '--    (A.IDBANCO   = B.IDPESSOA(+)) AND'
      '--    (A.IDPESSOA  = PA.IDPESSOA(+)) AND'
      '--    (B.IDPESSOA  = PB.IDPESSOA(+)) AND'
      '    (DOC.CODFORMA = F.CODFORMA(+)) AND'
      '    (LAN.CODDOCUMENTO = DOC.CODDOCUMENTO)) Q1,'
      ' (SELECT'
      '   D.NUMFATURA,'
      '   RD.VALOR,'
      '   TDR.DESCRICAO AS DESCTDR,'
      '   AP.NOME AS NOMEAP,'
      '   CR.NOME AS NOMECR,'
      '   CR.CODCENTRORESPON'
      '  FROM'
      '   DOCUMENTO D,'
      '   RATEIODOCUM RD,'
      '   UNIDNEGOCIO AP,'
      '   CENTRESPON CR,'
      '   TIPORECEBDESEMB TDR'
      '  WHERE'
      '   (D.NUMFATURA IS NOT NULL)                    AND'
      '   (D.CODDOCUMENTO        = RD.CODDOCUMENTO)    AND'
      '   (TDR.CODTIPRECDES(+)   = RD.CODTIPRECDES)    AND'
      '   (TDR.RECPAG(+)         = RD.RECPAG)          AND'
      '   (TDR.IDPESSOA(+)       = RD.IDPESSOA)        AND'
      '   (AP.UNIDNEGOC(+)       = RD.UNIDNEGOC)       AND'
      '   (AP.IDPESSOA(+)        = RD.IDPESSOA)        AND'
      '   (CR.CODCENTRORESPON(+) = RD.CODCENTRORESPON) AND'
      
        '   (CR.IDPESSOA(+)        = RD.IDPESSOA) order by d.numfatura) Q' +
        '2,'
      '  (SELECT'
      '    D.NUMFATURA, SUM(L.VALOR) AS VALOR'
      '   FROM'
      '    LANCTODOCUM L, DOCUMENTO D'
      '   WHERE'
      '    ((L.OPERACAO = '#39'1'#39') OR  (L.OPERACAO = '#39'11'#39')) AND'
      '    (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '    (D.OPERACAO = L.OPERACAO) AND'
      '    (D.NUMFATURA IS NOT NULL)'
      '   GROUP BY D.NUMFATURA) Q3'
      
        'WHERE (Q1.NUMFATURA = Q2.NUMFATURA) AND (Q3.NUMFATURA = Q2.NUMFA' +
        'TURA)'
      'GROUP BY'
      '  Q1.CODDOCUMENTO,'
      '  Q2.NOMECR,'
      '  Q1.NODOCUMENTO,'
      '  Q1.REFERENCIA,'
      '  Q1.DATAVENCTO,'
      '  Q1.DATAPROGRAMADA,'
      '  Q1.DATALANCTO,'
      '  Q1.RAZAOSOCIAL,'
      '  Q1.NUMDOCUMENTO,'
      '  Q1.HISTORICOCOMPL,'
      '  Q1.CODFORMA,'
      '--  Q1.NUMBANCO,'
      '--  Q1.NOMEBANCO,'
      '--  Q1.NUMAGENCIA,'
      '--  Q1.NOMEAGENCIA,'
      '--  Q1.CONTACORRENTE,'
      '  Q1.DESCRICAO,'
      '  Q1.NUMFATURA,'
      '  Q1.OBS'
      'ORDER BY'
      '  Q2.NOMECR,'
      '  Q1.NODOCUMENTO')
    ValidateWithMask = True
    Left = 90
    Top = 201
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAFIN'
        ParamType = ptUnknown
      end>
    object QryDocsParceladosCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object QryDocsParceladosNOMECR: TStringField
      Tag = 10
      FieldName = 'NOMECR'
      Size = 30
    end
    object QryDocsParceladosNODOCUMENTO: TFloatField
      Tag = 10
      FieldName = 'NODOCUMENTO'
    end
    object QryDocsParceladosREFERENCIA: TStringField
      Tag = 20
      FieldName = 'REFERENCIA'
      Size = 30
    end
    object QryDocsParceladosDATAVENCTO: TDateTimeField
      Tag = 8
      FieldName = 'DATAVENCTO'
    end
    object QryDocsParceladosDATAPROGRAMADA: TDateTimeField
      Tag = 8
      FieldName = 'DATAPROGRAMADA'
    end
    object QryDocsParceladosDATALANCTO: TDateTimeField
      Tag = 8
      FieldName = 'DATALANCTO'
    end
    object QryDocsParceladosRAZAOSOCIAL: TStringField
      Tag = 50
      FieldName = 'RAZAOSOCIAL'
      Size = 60
    end
    object QryDocsParceladosNUMDOCUMENTO: TStringField
      Tag = 18
      FieldName = 'NUMDOCUMENTO'
      Size = 18
    end
    object QryDocsParceladosVALOR: TFloatField
      Tag = 15
      FieldName = 'VALOR'
    end
    object QryDocsParceladosVALORALTERACRES: TFloatField
      Tag = 15
      FieldKind = fkCalculated
      FieldName = 'VALORALTERACRES'
      Calculated = True
    end
    object QryDocsParceladosVALORALTERDECRES: TFloatField
      Tag = 15
      FieldKind = fkCalculated
      FieldName = 'VALORALTERDECRES'
      Calculated = True
    end
    object QryDocsParceladosVALORALTERIRRF: TFloatField
      Tag = 15
      FieldKind = fkCalculated
      FieldName = 'VALORALTERIRRF'
      Calculated = True
    end
    object QryDocsParceladosVALORSALDO: TFloatField
      Tag = 15
      FieldKind = fkCalculated
      FieldName = 'VALORSALDO'
      Calculated = True
    end
    object QryDocsParceladosHISTORICOCOMPL: TStringField
      Tag = 60
      FieldName = 'HISTORICOCOMPL'
      Size = 60
    end
    object QryDocsParceladosCODFORMA: TFloatField
      Tag = 3
      FieldName = 'CODFORMA'
    end
    object QryDocsParceladosNUMBANCO: TStringField
      Tag = 3
      FieldKind = fkCalculated
      FieldName = 'NUMBANCO'
      Size = 10
      Calculated = True
    end
    object QryDocsParceladosNOMEBANCO: TStringField
      Tag = 20
      FieldKind = fkCalculated
      FieldName = 'NOMEBANCO'
      Size = 60
      Calculated = True
    end
    object QryDocsParceladosNUMAGENCIA: TStringField
      Tag = 6
      FieldKind = fkCalculated
      FieldName = 'NUMAGENCIA'
      Size = 15
      Calculated = True
    end
    object QryDocsParceladosNOMEAGENCIA: TStringField
      Tag = 30
      FieldKind = fkCalculated
      FieldName = 'NOMEAGENCIA'
      Size = 60
      Calculated = True
    end
    object QryDocsParceladosCONTACORRENTE: TStringField
      Tag = 12
      FieldKind = fkCalculated
      FieldName = 'CONTACORRENTE'
      Size = 15
      Calculated = True
    end
    object QryDocsParceladosDESCRICAO: TStringField
      Tag = 30
      FieldName = 'DESCRICAO'
      Size = 30
    end
    object QryDocsParceladosOBS: TMemoField
      Tag = 500
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1000
    end
    object QryDocsParceladosNUMFATURA: TFloatField
      FieldName = 'NUMFATURA'
    end
  end
  object QryRateioDocs: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      ' CR.NOME AS CODCENTRORESPON,'
      ' D.NUMAPGR AS NODOCUMENTO,'
      ' CC.NOME AS CODCENTROCUSTO,'
      ' SUM(RD.VALOR) AS VALOR,'
      ' RD.CODTIPRECDES'
      'FROM'
      ' DOCUMENTO D,'
      ' RATEIODOCUM RD,'
      ' CENTRESPON CR,'
      ' CENTCUST CC'
      'WHERE'
      ' (D.CODDOCUMENTO = :CODDOCUMENTO) AND'
      ' (D.CODDOCUMENTO = RD.CODDOCUMENTO) AND'
      ' (RD.CODCENTROCUSTO     = CC.CODCENTROCUSTO(+)) AND'
      ' (RD.IDPESSOA           = CC.IDEMPRESA(+))        AND'
      ' (RD.CODCENTRORESPON    = CR.CODCENTRORESPON(+)) AND'
      ' (RD.IDPESSOA           = CR.IDPESSOA(+))'
      'GROUP BY'
      ' CR.NOME,'
      ' D.NUMAPGR,'
      ' CC.NOME,'
      ' RD.CODTIPRECDES'
      'ORDER BY'
      ' CR.NOME,'
      ' D.NUMAPGR,'
      ' CC.NOME,'
      ' RD.CODTIPRECDES')
    ValidateWithMask = True
    Left = 248
    Top = 134
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end>
    object QryRateioDocsCODCENTRORESPON: TStringField
      Tag = 10
      FieldName = 'CODCENTRORESPON'
      Size = 30
    end
    object QryRateioDocsNODOCUMENTO: TFloatField
      Tag = 10
      FieldName = 'NODOCUMENTO'
      Origin = '"CM.DOCUMENTO".NODOCUMENTO'
    end
    object QryRateioDocsCODCENTROCUSTO: TStringField
      Tag = 10
      FieldName = 'CODCENTROCUSTO'
      Size = 30
    end
    object QryRateioDocsVALOR: TFloatField
      Tag = 15
      FieldName = 'VALOR'
      Origin = 'RATEIODOCUM.VALOR'
    end
    object QryRateioDocsCODTIPRECDES: TStringField
      Tag = 8
      FieldName = 'CODTIPRECDES'
      Origin = 'RATEIODOCUM.CODTIPRECDES'
      Size = 15
    end
  end
  object QryRateioParc: TwwQuery
    Tag = 10
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      ' Q2.CODCENTRORESPON,'
      ' Q1.NODOCUMENTO,'
      ' Q2.CODCENTROCUSTO,'
      ' SUM(((Q1.VALOR * Q2.VALOR)/ Q3.VALOR)) AS VALOR,'
      ' Q2.CODTIPRECDES'
      'FROM'
      '  (SELECT'
      '     DOC.NUMFATURA,'
      '     DOC.NUMAPGR AS NODOCUMENTO,'
      '     LAN.VALOR'
      '   FROM'
      '     DOCUMENTO DOC,'
      '     LANCTODOCUM LAN'
      '   WHERE'
      '    (DOC.CODDOCUMENTO = :CODDOCUMENTO) AND'
      '    ((LAN.OPERACAO = '#39'3'#39') OR (LAN.OPERACAO = '#39'13'#39')) AND'
      
        '    (LAN.CODDOCUMENTO = DOC.CODDOCUMENTO) order by doc.numfatura' +
        ') Q1,'
      ' (SELECT'
      '   D.NUMFATURA,'
      '   CR.NOME AS CODCENTRORESPON,'
      '   CC.NOME AS CODCENTROCUSTO,'
      '   SUM(RD.VALOR) AS VALOR,'
      '   RD.CODTIPRECDES'
      '  FROM'
      '   RATEIODOCUM RD,'
      '   DOCUMENTO D,'
      '   CENTRESPON CR,'
      '   CENTCUST CC'
      '  WHERE'
      '   (D.NUMFATURA IS NOT NULL)                       AND'
      '   (RD.CODCENTROCUSTO     = CC.CODCENTROCUSTO(+)) AND'
      '   (RD.IDPESSOA           = CC.IDEMPRESA(+))        AND'
      '   (RD.CODCENTRORESPON    = CR.CODCENTRORESPON(+)) AND'
      '   (RD.IDPESSOA           = CR.IDPESSOA(+))        AND'
      '   (D.CODDOCUMENTO        = RD.CODDOCUMENTO)'
      '   GROUP BY'
      '   D.NUMFATURA,'
      '   CR.NOME,'
      '   CC.NOME,'
      '   RD.CODTIPRECDES) Q2,'
      '  (SELECT'
      '    D.NUMFATURA, SUM(L.VALOR) AS VALOR'
      '   FROM'
      '    LANCTODOCUM L, DOCUMENTO D'
      '   WHERE'
      '    ((L.OPERACAO = '#39'1'#39') OR  (L.OPERACAO = '#39'11'#39')) AND'
      '    (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '    (D.OPERACAO = L.OPERACAO) AND'
      '    (D.NUMFATURA IS NOT NULL)'
      '   GROUP BY D.NUMFATURA) Q3'
      
        'WHERE (Q1.NUMFATURA = Q2.NUMFATURA) AND (Q3.NUMFATURA = Q2.NUMFA' +
        'TURA)'
      'GROUP BY'
      ' Q2.CODCENTRORESPON,'
      ' Q1.NODOCUMENTO,'
      ' Q2.CODCENTROCUSTO,'
      ' Q2.CODTIPRECDES'
      'ORDER BY'
      ' Q2.CODCENTRORESPON,'
      ' Q1.NODOCUMENTO'
      '')
    ValidateWithMask = True
    Left = 256
    Top = 193
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end>
    object QryRateioParcCODCENTRORESPON: TStringField
      Tag = 10
      FieldName = 'CODCENTRORESPON'
      Size = 30
    end
    object QryRateioParcNODOCUMENTO: TFloatField
      Tag = 10
      FieldName = 'NODOCUMENTO'
    end
    object QryRateioParcCODCENTROCUSTO: TStringField
      Tag = 10
      FieldName = 'CODCENTROCUSTO'
      Size = 30
    end
    object QryRateioParcVALOR: TFloatField
      Tag = 15
      FieldName = 'VALOR'
    end
    object QryRateioParcCODTIPRECDES: TStringField
      Tag = 8
      FieldName = 'CODTIPRECDES'
      Size = 15
    end
  end
  object QryAlteraDocs: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   SUM(VALACRE) AS VALACRE ,'
      '   SUM(VALDECR)  AS VALDECR ,'
      '   SUM(VALIMP) AS VALIMP'
      'FROM'
      '(SELECT'
      '   DECODE(L.DEBCRE,'#39'C'#39',SUM(L.VALOR)) AS VALACRE,'
      '   DECODE(L.DEBCRE,'#39'D'#39',SUM(L.VALOR)) AS VALDECR,'
      '   0 AS VALIMP'
      ' FROM'
      '   LANCTODOCUM L'
      ' WHERE'
      '   (L.CODDOCUMENTO=:CODDOCUMENTO) AND'
      '   (RTRIM(L.OPERACAO)='#39'4'#39') AND'
      '   (CODALTERADOR NOT IN'
      '     (SELECT'
      '        CODALTERADOR'
      '      FROM'
      '        ALTXIMPOSTO'
      '      WHERE'
      '        CODIMPOSTO = 1))'
      ' GROUP BY'
      '   DEBCRE'
      'UNION ALL'
      'SELECT'
      '  0 AS VALACRE,'
      '  0 AS VALDECR,'
      '  SUM(L.VALOR) AS VALIMP'
      'FROM'
      '  LANCTODOCUM L, ALTXIMPOSTO AL'
      'WHERE'
      '  (L.CODDOCUMENTO=:CODDOCUMENTO) AND'
      '  (RTRIM(L.OPERACAO)='#39'4'#39') AND'
      '  (L.CODALTERADOR = AL.CODALTERADOR) AND'
      '  (AL.CODIMPOSTO = 1))'
      '')
    ValidateWithMask = True
    Left = 423
    Top = 142
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end>
    object QryAlteraDocsVALACRE: TFloatField
      FieldName = 'VALACRE'
    end
    object QryAlteraDocsVALDECR: TFloatField
      FieldName = 'VALDECR'
    end
    object QryAlteraDocsVALIMP: TFloatField
      FieldName = 'VALIMP'
    end
  end
  object QryAlteraParcOrigem: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  (Q2.VALACRE * (Q3.VALORPARCELAS))/(Q1.VALORIGINAL + Q2.VALACRE' +
        ' - Q2.VALDECR - Q2.VALIMP) AS VALACRE,'
      
        '  (Q2.VALDECR * (Q3.VALORPARCELAS))/(Q1.VALORIGINAL + Q2.VALACRE' +
        ' - Q2.VALDECR - Q2.VALIMP) AS VALDECR,'
      
        '  (Q2.VALIMP * (Q3.VALORPARCELAS))/(Q1.VALORIGINAL + Q2.VALACRE ' +
        '- Q2.VALDECR - Q2.VALIMP) AS VALIMP,'
      '  Q3.CODDOCUMENTO  '
      'FROM'
      '   (SELECT'
      '     D.CODDOCUMENTO,'
      '     L.VALOR AS VALORPARCELAS'
      '    FROM'
      '     DOCUMENTO D, LANCTODOCUM L'
      '    WHERE'
      '     (D.CODDOCUMENTO = :CODDOCUMENTO) AND'
      '     (D.OPERACAO = L.OPERACAO) AND'
      '     (D.CODDOCUMENTO= L.CODDOCUMENTO) AND'
      '     (RTRIM(D.OPERACAO) IN ('#39'3'#39','#39'13'#39')) AND'
      '     (L.ESTORNO IS NULL)) Q3,'
      '   (SELECT'
      '     SUM(L.VALOR) AS VALORIGINAL'
      '    FROM'
      '     DOCUMENTO D, LANCTODOCUM L'
      '    WHERE'
      '     (D.NUMFATURA=:NUMFATURA) AND'
      '     (D.OPERACAO = L.OPERACAO) AND'
      '     (D.CODDOCUMENTO= L.CODDOCUMENTO) AND'
      '     (RTRIM(D.OPERACAO) NOT IN ('#39'3'#39','#39'13'#39')) AND'
      '     (L.ESTORNO IS NULL)) Q1,'
      '   (SELECT'
      '      SUM(VALACRE) AS VALACRE ,'
      '      SUM(VALDECR) AS VALDECR ,'
      '      SUM(VALIMP)  AS VALIMP'
      '    FROM'
      '      (SELECT'
      '         DECODE(L.DEBCRE,'#39'C'#39',SUM(L.VALOR)) AS VALACRE,'
      '         DECODE(L.DEBCRE,'#39'D'#39',SUM(L.VALOR)) AS VALDECR,'
      '         0 AS VALIMP'
      '       FROM'
      '         LANCTODOCUM L, DOCUMENTO D'
      '       WHERE'
      '         (D.NUMFATURA=:NUMFATURA) AND'
      '         (RTRIM(D.OPERACAO) NOT IN ('#39'3'#39','#39'13'#39')) AND'
      '         (D.CODDOCUMENTO = L.CODDOCUMENTO) AND'
      '         (RTRIM(L.OPERACAO)='#39'4'#39') AND'
      '         (CODALTERADOR NOT IN'
      '           (SELECT'
      '              CODALTERADOR'
      '            FROM'
      '              ALTXIMPOSTO'
      '            WHERE'
      '              CODIMPOSTO = 1))'
      '       GROUP BY'
      '         L.DEBCRE'
      '      UNION ALL'
      '      SELECT'
      '        0 AS VALACRE,'
      '        0 AS VALDECR,'
      '        SUM(L.VALOR) AS VALIMP'
      '      FROM'
      '        DOCUMENTO D, LANCTODOCUM L, ALTXIMPOSTO AL'
      '      WHERE'
      '        (D.NUMFATURA=:NUMFATURA) AND'
      '        (L.CODDOCUMENTO=D.CODDOCUMENTO) AND'
      '        (RTRIM(D.OPERACAO) NOT IN ('#39'3'#39','#39'13'#39')) AND'
      '        (RTRIM(L.OPERACAO)='#39'4'#39') AND'
      '        (L.CODALTERADOR = AL.CODALTERADOR) AND'
      '        (AL.CODIMPOSTO = 1))) Q2'
      '')
    ValidateWithMask = True
    Left = 423
    Top = 209
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'NUMFATURA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'NUMFATURA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'NUMFATURA'
        ParamType = ptUnknown
      end>
    object QryAlteraParcOrigemVALACRE: TFloatField
      FieldName = 'VALACRE'
    end
    object QryAlteraParcOrigemVALDECR: TFloatField
      FieldName = 'VALDECR'
    end
    object QryAlteraParcOrigemVALIMP: TFloatField
      FieldName = 'VALIMP'
    end
  end
  object QryAlteraParc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   SUM(VALACRE) AS VALACRE ,'
      '   SUM(VALDECR)  AS VALDECR ,'
      '   SUM(VALIMP) AS VALIMP'
      'FROM'
      '(SELECT'
      '   DECODE(L.DEBCRE,'#39'C'#39',SUM(L.VALOR)) AS VALACRE,'
      '   DECODE(L.DEBCRE,'#39'D'#39',SUM(L.VALOR)) AS VALDECR,'
      '   0 AS VALIMP'
      ' FROM'
      '   LANCTODOCUM L'
      ' WHERE'
      '   (L.CODDOCUMENTO=:CODDOCUMENTO) AND'
      '   (RTRIM(L.OPERACAO)='#39'4'#39') AND'
      '   (CODALTERADOR NOT IN'
      '     (SELECT'
      '        CODALTERADOR'
      '      FROM'
      '        ALTXIMPOSTO'
      '      WHERE'
      '        CODIMPOSTO = 1))'
      ' GROUP BY'
      '   DEBCRE'
      'UNION ALL'
      'SELECT'
      '  0 AS VALACRE,'
      '  0 AS VALDECR,'
      '  SUM(L.VALOR) AS VALIMP'
      'FROM'
      '  LANCTODOCUM L, ALTXIMPOSTO AL'
      'WHERE'
      '  (L.CODDOCUMENTO=:CODDOCUMENTO) AND'
      '  (RTRIM(L.OPERACAO)='#39'4'#39') AND'
      '  (L.CODALTERADOR = AL.CODALTERADOR) AND'
      '  (AL.CODIMPOSTO = 1))'
      '')
    ValidateWithMask = True
    Left = 327
    Top = 249
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end>
    object QryAlteraParcVALACRE: TFloatField
      FieldName = 'VALACRE'
    end
    object QryAlteraParcVALDECR: TFloatField
      FieldName = 'VALDECR'
    end
    object QryAlteraParcVALIMP: TFloatField
      FieldName = 'VALIMP'
    end
  end
  object DirDlg: TProcuraDirDlg
    Caption = 'Exportação de Lançamentos'
    Directory = 
      'AS CODBANCOFAVORECIDO, AG.NUMAGENCIA, '#39' +'#13#10'                     ' +
      '          '#39' E.LOGRADOURO, E.NUMERO, E.COMPLEMENTO, E.BAIRRO, CID' +
      '.NOME AS CIDADE, ES.CODESTADO, '#39' +'#13#10'                            ' +
      '   '#39' E.CEP, DOC.IDFORCLI, DOC.CODDOCUMENTO, LOTEX.VALOR, '#39' +'#13#10'  ' +
      '    '
    Folder = foCustom
    ShowPath = False
    Title = 'Seleciona Dritetório de Destino Para Exportação do Arquivo'
    Left = 255
    Top = 303
  end
  object qryCentroRespon: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODCENTRORESPON,NOME,ANALITICOSINTET, CODCENTROCUSTO'
      ' FROM CENTRESPON')
    ValidateWithMask = True
    Left = 94
    Top = 265
    object qryCentroResponCODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      Origin = 'CENTRESPON.CODCENTRORESPON'
      Size = 10
    end
    object qryCentroResponNOME: TStringField
      FieldName = 'NOME'
      Origin = 'CENTRESPON.NOME'
      Size = 30
    end
    object qryCentroResponANALITICOSINTET: TStringField
      FieldName = 'ANALITICOSINTET'
      Origin = 'CENTRESPON.ANALITICOSINTET'
      Size = 1
    end
    object qryCentroResponCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Origin = 'CENTRESPON.CODCENTROCUSTO'
      Size = 10
    end
  end
end
