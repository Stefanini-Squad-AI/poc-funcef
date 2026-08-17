inherited frmExecGeraXMLSPC: TfrmExecGeraXMLSPC
  Left = 294
  Top = 135
  Caption = 'GeraÁ„o de Arquivo XML -> SPC'
  ClientHeight = 376
  ClientWidth = 472
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 472
    Height = 337
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 94
      Height = 13
      Caption = 'Data ReferÍncia'
    end
    object Label2: TLabel
      Left = 191
      Top = 8
      Width = 88
      Height = 13
      Caption = 'CÛdigo Carteira'
    end
    object Label3: TLabel
      Left = 16
      Top = 56
      Width = 60
      Height = 13
      Caption = 'PatrimÙnio'
    end
    object Label4: TLabel
      Left = 191
      Top = 56
      Width = 47
      Height = 13
      Caption = 'Tributos'
    end
    object Label5: TLabel
      Left = 16
      Top = 96
      Width = 93
      Height = 13
      Caption = 'Valor a Receber'
    end
    object Label6: TLabel
      Left = 191
      Top = 96
      Width = 78
      Height = 13
      Caption = 'Valor a Pagar'
    end
    object Label7: TLabel
      Left = 16
      Top = 136
      Width = 36
      Height = 13
      Caption = 'Ativos'
    end
    object Label8: TLabel
      Left = 16
      Top = 176
      Width = 188
      Height = 13
      Caption = 'Caminho para criaÁ„o do arquivo'
    end
    object dbgPlano: TwwDBGrid
      Left = 1
      Top = 216
      Width = 470
      Height = 120
      Selected.Strings = (
        'NOME'#9'33'#9'Plano'
        'CODIGOSPC'#9'12'#9'CÛdigo'#9'F'
        'PERCPART'#9'15'#9'% Part.')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alBottom
      DataSource = dsPlano
      TabOrder = 7
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
    object edtDataReferencia: TCMDateTimePicker
      Left = 16
      Top = 22
      Width = 105
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
      TabOrder = 0
    end
    object edtCarteira: TEdit
      Left = 191
      Top = 21
      Width = 121
      Height = 21
      TabOrder = 1
      Text = '000000000000001'
    end
    object edtPatrimonio: TRealEdit
      Left = 16
      Top = 70
      Width = 153
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '0,00')
      TabOrder = 2
      WordWrap = False
      IntDigits = 17
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
    end
    object edtTributos: TRealEdit
      Left = 191
      Top = 70
      Width = 153
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 3
      WordWrap = False
      IntDigits = 17
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
    end
    object edtValorReceber: TRealEdit
      Left = 16
      Top = 110
      Width = 153
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 4
      WordWrap = False
      IntDigits = 17
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
    end
    object edtValorPagar: TRealEdit
      Left = 191
      Top = 110
      Width = 153
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 5
      WordWrap = False
      IntDigits = 17
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
    end
    object edtAtivos: TRealEdit
      Left = 16
      Top = 150
      Width = 153
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 6
      WordWrap = False
      IntDigits = 17
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
    end
    object pnlPasta: TPanel
      Left = 16
      Top = 190
      Width = 329
      Height = 21
      Alignment = taLeftJustify
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Caption = 'C:\'
      Color = clWindow
      TabOrder = 8
      object lblDiretorio: TLabel
        Left = 588
        Top = 22
        Width = 19
        Height = 13
        Caption = 'C:\'
        Visible = False
      end
    end
    object btnEscolheDir: TBitBtn
      Left = 344
      Top = 189
      Width = 27
      Height = 24
      Hint = 'Seleciona a Pasta que ser· gravado os arquivos para banco'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 9
      OnClick = btnEscolheDirClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00303333333333
        333337F3333333333333303333333333333337F33FFFFF3FF3FF303300000300
        300337FF77777F77377330000BBB0333333337777F337F33333330330BB00333
        333337F373F773333333303330033333333337F3377333333333303333333333
        333337F33FFFFF3FF3FF303300000300300337FF77777F77377330000BBB0333
        333337777F337F33333330330BB00333333337F373F773333333303330033333
        333337F3377333333333303333333333333337FFFF3FF3FFF333000003003000
        333377777F77377733330BBB0333333333337F337F33333333330BB003333333
        333373F773333333333330033333333333333773333333333333}
      NumGlyphs = 2
    end
  end
  inherited Dock971: TDock97
    Top = 337
    Width = 472
    inherited tb97Fundo: TToolbar97
      Left = 300
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 131
      inherited bbtnConfirmar: TBitBtn
        Caption = '&Gerar'
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 19
    Top = 331
    TargetsData = (
      1
      1
      (
        'TRealEdit'
        'Text'
        0))
  end
  object cdsPatro: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 24
    Top = 248
    object cdsPatroCNPJCPF: TStringField
      FieldName = 'CNPJCPF'
      Size = 18
    end
    object cdsPatroNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object cdsPatroCODCNTCOR: TMemoField
      FieldName = 'CODCNTCOR'
      BlobType = ftMemo
      Size = 4000
    end
    object cdsPatroNOMEGESTOR: TStringField
      FieldName = 'NOMEGESTOR'
      Size = 60
    end
    object cdsPatroCNPJGESTOR: TStringField
      FieldName = 'CNPJGESTOR'
      Size = 18
    end
    object cdsPatroNOMECUSTODIANTE: TStringField
      FieldName = 'NOMECUSTODIANTE'
      Size = 60
    end
    object cdsPatroCNPJCUSTODIANTE: TStringField
      FieldName = 'CNPJCUSTODIANTE'
      Size = 18
    end
    object cdsPatroPATLIQ: TFloatField
      FieldName = 'PATLIQ'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object cdsPatroTRIBUTOS: TFloatField
      FieldName = 'TRIBUTOS'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object cdsPatroVALORATIVOS: TFloatField
      FieldName = 'VALORATIVOS'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object cdsPatroVALORRECEBER: TFloatField
      FieldName = 'VALORRECEBER'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object cdsPatroVALORPAGAR: TFloatField
      FieldName = 'VALORPAGAR'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
  end
  object sqlPatro: TCMSqlParams
    SQL.Strings = (
      'select'
      '   trim(doc.numdocumento) as cnpjcpf,'
      '   trim(emp.nomeempresa) as nome,'
      
        '   lpad(bco.numbanco,7-length(trim(bco.numbanco)),'#39'0'#39') || substr' +
        '(age.numagencia,1,4) || lpad(substr(cta.contacorrente,1,5),14-le' +
        'ngth(trim(substr(cta.contacorrente,1,5))),'#39'0'#39') as codcntcor,'
      '   trim(emp.nomeempresa) as nomegestor,'
      '   trim(doc.numdocumento) as cnpjgestor,'
      '   trim(emp.nomeempresa) as nomecustodiante,'
      '   trim(doc.numdocumento) as cnpjcustodiante,'
      '   0 as patliq,'
      '   0 as tributos,'
      '   0 as valorativos,'
      '   0 as valorreceber,'
      '   0 as valorpagar'
      'from'
      '   empresaprop emp,'
      '   docpessoa doc,'
      '   contabancaria cta,'
      '   agenciabancaria age,'
      '   banco bco'
      'where'
      '    doc.idpessoa = emp.idpessoa'
      'and cta.idpessoa = emp.idpessoa'
      'and age.idpessoa = cta.idagencia'
      'and bco.idpessoa = age.idbanco'
      ''
      ' ')
    ClientDataSet = cdsPatro
    Left = 24
    Top = 288
  end
  object cdsPlano: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 72
    Top = 248
    object cdsPlanoNOME: TStringField
      DisplayLabel = 'Plano'
      DisplayWidth = 33
      FieldName = 'NOME'
      ReadOnly = True
      Size = 50
    end
    object cdsPlanoCODIGOSPC: TStringField
      DisplayLabel = 'CÛdigo'
      DisplayWidth = 12
      FieldName = 'CODIGOSPC'
      ReadOnly = True
      Size = 15
    end
    object cdsPlanoPERCPART: TFloatField
      DisplayLabel = '% Part.'
      DisplayWidth = 15
      FieldName = 'PERCPART'
      DisplayFormat = ',0.00000000'
      EditFormat = ',0.00000000'
    end
  end
  object sqlPlano: TCMSqlParams
    SQL.Strings = (
      'select nome,codigospc, 0 as percpart from planprev')
    ClientDataSet = cdsPlano
    Left = 72
    Top = 288
  end
  object cdsImovel: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 120
    Top = 248
    object cdsImovelIMOLOGRADOURO: TStringField
      FieldName = 'IMOLOGRADOURO'
      Size = 80
    end
    object cdsImovelIMONUMERO: TStringField
      FieldName = 'IMONUMERO'
      Size = 8
    end
    object cdsImovelIMONOME: TStringField
      FieldName = 'IMONOME'
      Size = 60
    end
    object cdsImovelCIDADE: TStringField
      FieldName = 'CIDADE'
      Size = 50
    end
    object cdsImovelCODESTADO: TStringField
      FieldName = 'CODESTADO'
      FixedChar = True
      Size = 3
    end
    object cdsImovelIMOCEP: TStringField
      FieldName = 'IMOCEP'
      Size = 8
    end
    object cdsImovelIMONOME_1: TStringField
      FieldName = 'IMONOME_1'
      Size = 60
    end
    object cdsImovelPERCPART: TFloatField
      FieldName = 'PERCPART'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object cdsImovelVALORCONTABIL: TFloatField
      FieldName = 'VALORCONTABIL'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object cdsImovelJUSTIFICATIVA: TFloatField
      FieldName = 'JUSTIFICATIVA'
    end
    object cdsImovelIMOVLRREAVAL: TFloatField
      FieldName = 'IMOVLRREAVAL'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object cdsImovelIMODATAREAVAL: TDateTimeField
      FieldName = 'IMODATAREAVAL'
    end
    object cdsImovelTPAVALIADOR: TStringField
      FieldName = 'TPAVALIADOR'
      Size = 1
    end
    object cdsImovelCNPJCPFAVALIADOR: TStringField
      FieldName = 'CNPJCPFAVALIADOR'
      Size = 18
    end
    object cdsImovelALUGUELCONTRATADO: TFloatField
      FieldName = 'ALUGUELCONTRATADO'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object cdsImovelALUGUELATRASADO: TFloatField
      FieldName = 'ALUGUELATRASADO'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
    end
    object cdsImovelOPCAORECOMPRA: TStringField
      FieldName = 'OPCAORECOMPRA'
      Size = 1
    end
    object cdsImovelDTRECOMPRA: TStringField
      FieldName = 'DTRECOMPRA'
      Size = 8
    end
    object cdsImovelTIPOIMOVEL: TFloatField
      FieldName = 'TIPOIMOVEL'
    end
    object cdsImovelQUESTJUR: TStringField
      FieldName = 'QUESTJUR'
      FixedChar = True
      Size = 1
    end
    object cdsImovelTIPOUSO: TFloatField
      FieldName = 'TIPOUSO'
    end
    object cdsImovelMATRICULA: TStringField
      FieldName = 'MATRICULA'
    end
    object cdsImovelCNPJEMP: TStringField
      FieldName = 'CNPJEMP'
      FixedChar = True
      Size = 14
    end
    object cdsImovelIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
    end
  end
  object sqlImovel: TCMSqlParams
    SQL.Strings = (
      '  SELECT '
      '       I.IDIMOVEL,'
      '       IM.IMOLOGRADOURO,  '
      '       IM.IMONUMERO, '
      '       I.IMONOME, '
      '       CI.NOME AS CIDADE, '
      '       UF.CODESTADO, '
      '       IM.IMOCEP, '
      '       IM.IMONOME, '
      '       100.00 AS PERCPART, '
      '       0 AS VALORCONTABIL, -- calcular em tempo de execucao'
      
        '       DECODE(AV.ANOMESREAV, '#39'200802'#39',3,1) AS JUSTIFICATIVA, -- ' +
        'Passar a competencia do processamento'
      '       I.IMOVLRREAVAL, '
      '       I.IMODATAREAVAL, '
      '       DECODE(PEA.NUMDOCUMENTO,NULL,'#39'J'#39','#39'F'#39') AS TPAVALIADOR,'
      
        '       DECODE(DAV.NUMDOCUMENTO,NULL,DOC.NUMDOCUMENTO,DAV.NUMDOCU' +
        'MENTO) AS CNPJCPFAVALIADOR,'
      '       NVL(ALU.VLRALUGUEL,0) AS ALUGUELCONTRATADO, '
      '       NVL(VENC.VLRATRASO,0) AS ALUGUELATRASADO,   '
      '       DECODE(I.FLGSTATUS,'#39'A'#39','#39'S'#39','#39'N'#39') AS OPCAORECOMPRA,   '
      
        '       DECODE(I.FLGSTATUS,'#39'A'#39',DECODE(AL.CONDATAASSINATURA,NULL,N' +
        'ULL,AL.CONDATAASSINATURA),NULL) AS DTRECOMPRA,'
      
        '       DECODE(I.CODIMOVELSPC,NULL,TI.CODIMOVELSPC,I.CODIMOVELSPC' +
        ') AS TIPOIMOVEL,'
      '       '#39'N'#39' AS QUESTJUR,'
      '       D.CODSEGMENTO AS TIPOUSO,  '
      '       TRIM(I.IMOMATRICULA) AS MATRICULA,'
      '       '#39'99999999999999'#39' AS CNPJEMP -- Verificar preenchimento'
      '  FROM '
      '       IMOVEL        I,         '
      '       IMOVEL        IM,        '
      '       DAIEACIDADES  DC,  '
      '       CIDADES       CI,       '
      '       ESTADO        UF,        '
      '       TIPOIMOVEL    TI,    '
      '       CARTEIRASPC   D,  '
      '       PARAMIMOVEL   PA,   '
      '       PESSOA        PEA,       '
      '       DOCPESSOA     DAV,'
      '       DOCPESSOA     DOC,'
      '       EMPRESAPROP   EPR,'
      '       (                 '
      
        '        SELECT DISTINCT R.IDIMOVEL, R.IDAVALIADOR, TO_CHAR(DATAR' +
        'EAVALIACAO,'#39'YYYYMM'#39') AS ANOMESREAV, datareavaliacao'
      '        FROM REAVALIAXREAVALIA R  '
      
        '        WHERE R.DATAREAVALIACAO IN ( SELECT MAX(DATAREAVALIACAO)' +
        ' AS DATAREAVALIACAO  '
      
        '                                     FROM REAVALIAXREAVALIA     ' +
        '   '
      
        '                                     WHERE IDIMOVEL = R.IDIMOVEL' +
        ' )  '
      '       ) AV,'
      '       ('
      '         SELECT CXI.IDIMOVEL, CON.CONDATAASSINATURA'
      '         FROM CONTRATOIMOVEL CON, CONTRATOXIMOVEL CXI'
      '         WHERE CXI.IDCONTRATOIMOVEL = CON.IDCONTRATOIMOVEL'
      '         AND   CON.FLGTIPOCONTRATO  = '#39'C'#39
      '       ) AL,'
      '       ('
      '         SELECT CXI.IDIMOVEL, CXI.CIMVLRAJUSTADO AS VLRALUGUEL'
      '         FROM CONTRATOXIMOVEL CXI'
      '         WHERE '#39'200802'#39' BETWEEN TO_CHAR(CIMDTINI,'#39'YYYYMM'#39') AND '
      
        '                                TO_CHAR(CIMDTFIM,'#39'YYYYMM'#39') -- Pa' +
        'ssar a competencia do processamento'
      '       ) ALU,'
      '       ('
      
        '         SELECT LI.IDIMOVEL, SUM(NVL(LI.TOT_RECEBER,0) - NVL(LI.' +
        'TOT_RECEBIDO,0) + NVL(LI.TOT_ALTERADOR,0)) AS VLRATRASO'
      '         FROM VWLANCAMENTO LI, CONTRATOIMOVEL CON'
      
        '         WHERE TO_CHAR(LI.DATAVENCIMENTO,'#39'YYYYMM'#39') < '#39'200802'#39' --' +
        ' Passar a competencia do processamento'
      '         AND   LI.IDCONTRATOIMOVEL  = CON.IDCONTRATOIMOVEL'
      '         AND   LI.IDTIPOCUSTORECIMO = CON.IDTIPOCUSTORECIMO'
      '         GROUP BY LI.IDIMOVEL'
      
        '         HAVING SUM(NVL(LI.TOT_RECEBER,0) - NVL(LI.TOT_RECEBIDO,' +
        '0) + NVL(LI.TOT_ALTERADOR,0)) > 0'
      '       ) VENC'
      '  WHERE '
      '        I.IDPESSOA         = PA.IDPESSOA                   '
      '    AND I.IDIMOVELMESTRE   IS NOT NULL               '
      '    AND I.IDIMOVELMESTRE   = IM.IDIMOVEL(+)        '
      '    AND I.CODTIPIMOVEL     = TI.CODTIPIMOVEL(+)    '
      '    AND I.IDIMOVEL         = AV.IDIMOVEL(+)        '
      '    AND TI.IDCARTEIRASPC   = D.IDCARTEIRASPC(+)    '
      '    AND IM.IDCIDADES       = CI.IDCIDADES(+)       '
      '    AND CI.IDESTADO        = UF.IDESTADO(+)        '
      '    AND CI.IDCIDADES       = DC.IDCIDADES(+)       '
      '    AND AV.IDAVALIADOR     = PEA.IDPESSOA(+)       '
      '    AND PEA.IDPESSOA       = DAV.IDPESSOA(+)'
      '    AND DAV.IDDOCUMENTO(+) = -1'
      '    AND EPR.IDPESSOA       = DOC.IDPESSOA(+)'
      '    AND I.FLGATIVO         = 1                     '
      '    AND I.IDIMOVEL         = AL.IDIMOVEL(+)'
      '    AND I.IDIMOVEL         = ALU.IDIMOVEL(+)'
      '    AND I.IDIMOVEL         = VENC.IDIMOVEL(+)'
      '  ORDER BY IM.IMONOME'
      ''
      '  ')
    ClientDataSet = cdsImovel
    Left = 120
    Top = 288
  end
  object dsPlano: TDataSource
    DataSet = cdsPlano
    Left = 80
    Top = 224
  end
  object dlgCaminho: TProcuraDirDlg
    Caption = 'SeleÁ„o de Caminho'
    Directory = 
      '6'#19#0'@'#8'¸‡'#4#0#0#0#0#8'ø'#15'R'#24'ø'#15'RÔ¿'#15'RÑ'#9'‡'#4'Ñ'#9'‡'#4#16#1#0#0'ƒó·'#4'–∫'#27#2'å»‹'#4'ÃØ'#25#2#28'F‚'#4'\ú*'#19'¿5‚'#4 +
      #0'7›'#4'åÕ‹'#4'»ê€'#4'¿G‚'#4'ƒ|·'#4'8&‚'#4'ê'#15'›'#4'êò€'#4'ÃÑ‘'#4'`à‘'#4#8'-‚'#4'87‚'#4',/›'#4'¿A‚'#4#28',›'#4'DB‡'#4 +
      #28'C‡'#4#0'D‡'#4' û€'#4'Hü€'#4't⁄ﬂ'#4'L€ﬂ'#4'<º€'#4'0Ω€'#4'\æ€'#4'@'#8'‡'#4'$'#17'‡'#4#24#28'‚'#4#16'v‡'#4'†–€'#4'»—€'#4'XV·'#4 +
      '$”€'#4'∞çﬁ'#4'Ù1›'#4'Ã2›'#4'§3›'#4'|4›'#4#4'@·'#4'‹@·'#4'¥A·'#4'ÃB·'#4'åª*'#19'¥Ω*'#19'®æ*'#19'4√‹'#4'Äƒ‹'#4'X≈‹'#4 +
      '®∆‹'#4
    Folder = foCustom
    ShowPath = False
    Title = 
      'Navegue na ·rvore de pastas e selecione o caminho desejado para ' +
      'gravaÁ„o dos arquivos.'
    Left = 257
    Top = 138
  end
end
