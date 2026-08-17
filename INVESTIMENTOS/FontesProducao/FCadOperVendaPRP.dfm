inherited frmCadOperVendaPRP: TfrmCadOperVendaPRP
  Left = 464
  Top = 232
  HelpContext = 790308
  Caption = 'Operação'
  ClientHeight = 311
  ClientWidth = 339
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 339
    Height = 225
    inherited Bevel2: TBevel
      Width = 337
    end
    object Label2: TLabel [1]
      Left = 8
      Top = 56
      Width = 45
      Height = 13
      Caption = 'Carteira'
    end
    object Label1: TLabel [2]
      Left = 8
      Top = 96
      Width = 73
      Height = 13
      Caption = 'Investimento'
    end
    object Label5: TLabel [3]
      Left = 8
      Top = 136
      Width = 68
      Height = 13
      Caption = 'Custodiante'
    end
    object Label6: TLabel [4]
      Left = 8
      Top = 176
      Width = 32
      Height = 13
      Caption = 'Data '
    end
    object Label7: TLabel [5]
      Left = 128
      Top = 176
      Width = 66
      Height = 13
      Caption = 'Quantidade'
    end
    inherited pnlTitulo: TPanel
      Width = 337
      inherited lbNomItem: TfcLabel
        Width = 143
        Caption = 'Venda de PRP'
      end
    end
    object lkcCarteira: TwwDBLookupCombo
      Left = 8
      Top = 72
      Width = 321
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCCARTINVEST'#9'40'#9'Descrição'#9'F')
      DataField = 'IDCARTEIRAINVEST'
      DataSource = ds
      LookupTable = qryCarteira
      LookupField = 'ID'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object lkcInvestimento: TwwDBLookupCombo
      Left = 8
      Top = 112
      Width = 321
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCINVESTIMENTO'#9'40'#9'Descrição'#9'F')
      DataField = 'IDINVESTIMENTO'
      DataSource = ds
      LookupTable = qryInvestimento
      LookupField = 'IDINVESTIMENTO'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object lkcCustodiante: TwwDBLookupCombo
      Left = 8
      Top = 152
      Width = 321
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'SGLCUSTODIANTE'#9'40'#9'Descrição'#9'F')
      DataField = 'IDCUSTODIANTE'
      DataSource = ds
      LookupTable = qryCustodiante
      LookupField = 'IDCUSTODIANTE'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object edData: TCMDateTimePicker
      Left = 8
      Top = 192
      Width = 113
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      ButtonStyle = cbsCustom
      DataField = 'DATAOPERACAO'
      DataSource = ds
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
      TabOrder = 4
    end
    object edQuantidade: TDBRealEdit
      Tag = -1
      Left = 128
      Top = 192
      Width = 201
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '0,00')
      TabOrder = 5
      WordWrap = False
      IntDigits = 15
      DecDigits = 2
      NumberFormat = fNumber
      Signal = True
      DataField = 'QTDEOPERACAO'
      DataSource = ds
    end
  end
  inherited Dock972: TDock97
    Width = 339
  end
  inherited Dock971: TDock97
    Top = 272
    Width = 339
    inherited tb97Fundo: TToolbar97
      Left = 169
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      2
      (
        'TRealEdit'
        'Text'
        0)
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 128
    Top = 80
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update OPERACAOINVEST'
      'set'
      '  IDCUSTODIANTE = :IDCUSTODIANTE,'
      '  IDCONTRATOIMOVEL = :IDCONTRATOIMOVEL,'
      '  IDCORRETVALORES = :IDCORRETVALORES,'
      '  MOECODIGO = :MOECODIGO,'
      '  IDMODULO = :IDMODULO,'
      '  EMPRESAPROP = :EMPRESAPROP,'
      '  IDINVESTDEST = :IDINVESTDEST,'
      '  IDCARTEIRAINVEST = :IDCARTEIRAINVEST,'
      '  IDINVESTIMENTO = :IDINVESTIMENTO,'
      '  IDTIPOINVEST = :IDTIPOINVEST,'
      '  IDTIPOOPERACAO = :IDTIPOOPERACAO,'
      '  IDINSTFIN = :IDINSTFIN,'
      '  DATAOPERACAO = :DATAOPERACAO,'
      '  NUMDOCUMENTO = :NUMDOCUMENTO,'
      '  QTDEOPERACAO = :QTDEOPERACAO,'
      '  PRECOUNITOPERACAO = :PRECOUNITOPERACAO,'
      '  VLROPERACAO = :VLROPERACAO,'
      '  DATAVENCOPER = :DATAVENCOPER,'
      '  VLROPERACAOOM = :VLROPERACAOOM,'
      '  IDFORCLI = :IDFORCLI,'
      '  OBSERVACAO = :OBSERVACAO,'
      '  IDORDMOVINV = :IDORDMOVINV,'
      '  IDCARTORIDEST = :IDCARTORIDEST,'
      '  FLGCUSTODIA = :FLGCUSTODIA,'
      '  IDLOTE = :IDLOTE,'
      '  TRGDTINCLUSAO = :TRGDTINCLUSAO,'
      '  TRGUSERINCLUSAO = :TRGUSERINCLUSAO,'
      '  DATAAGE = :DATAAGE,'
      '  DATAEX = :DATAEX,'
      '  DATACOM = :DATACOM,'
      '  INVORIGEM = :INVORIGEM,'
      '  PERCENTUAL = :PERCENTUAL,'
      '  PARIDADE = :PARIDADE,'
      '  PRZBOLSA = :PRZBOLSA,'
      '  PRZEMPRESA = :PRZEMPRESA,'
      '  ATADECISAO = :ATADECISAO,'
      '  FORMAPAGREC = :FORMAPAGREC,'
      '  DIVPORACAO = :DIVPORACAO,'
      '  INIPAGTO = :INIPAGTO,'
      '  JUROSCAP = :JUROSCAP,'
      '  IDCUSTORIG = :IDCUSTORIG,'
      '  IDCUSTDEST = :IDCUSTDEST,'
      '  IDOPERACAODIREITO = :IDOPERACAODIREITO,'
      '  FLGSTATUSFECHBOL = :FLGSTATUSFECHBOL,'
      '  FLGSTATUSORDMOV = :FLGSTATUSORDMOV,'
      '  IDTERCEIRO = :IDTERCEIRO,'
      '  DATALIQOPER = :DATALIQOPER,'
      '  VLRIR = :VLRIR,'
      '  IDOPERACAOORIGEM = :IDOPERACAOORIGEM,'
      '  VLRREMUNERACAO = :VLRREMUNERACAO,'
      '  VLRIRREMUNER = :VLRIRREMUNER,'
      '  CODFINANCEIRO = :CODFINANCEIRO,'
      '  IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR,'
      '  IDCARTEIRAGERENC = :IDCARTEIRAGERENC,'
      '  PUMERCADO = :PUMERCADO,'
      '  ORIGDEST = :ORIGDEST,'
      '  CODDOCUMENTO = :CODDOCUMENTO,'
      '  IDOPERCUSTODIA = :IDOPERCUSTODIA'
      'where'
      '  IDOPERACAOINVEST = :OLD_IDOPERACAOINVEST')
    InsertSQL.Strings = (
      'insert into OPERACAOINVEST'
      '  (IDOPERACAOINVEST, IDCUSTODIANTE, IDCONTRATOIMOVEL, '
      'IDCORRETVALORES, '
      '   MOECODIGO, IDMODULO, EMPRESAPROP, IDINVESTDEST, '
      'IDCARTEIRAINVEST, IDINVESTIMENTO, '
      '   IDTIPOINVEST, IDTIPOOPERACAO, IDINSTFIN, DATAOPERACAO, '
      'NUMDOCUMENTO, '
      '   QTDEOPERACAO, PRECOUNITOPERACAO, VLROPERACAO, DATAVENCOPER, '
      'VLROPERACAOOM, '
      
        '   IDFORCLI, OBSERVACAO, IDORDMOVINV, IDCARTORIDEST, FLGCUSTODIA' +
        ', '
      'IDLOTE, '
      '   TRGDTINCLUSAO, TRGUSERINCLUSAO, DATAAGE, DATAEX, DATACOM, '
      'INVORIGEM, '
      '   PERCENTUAL, PARIDADE, PRZBOLSA, PRZEMPRESA, ATADECISAO, '
      'FORMAPAGREC, '
      '   DIVPORACAO, INIPAGTO, JUROSCAP, IDCUSTORIG, IDCUSTDEST, '
      'IDOPERACAODIREITO, '
      '   FLGSTATUSFECHBOL, FLGSTATUSORDMOV, IDTERCEIRO, DATALIQOPER, '
      'VLRIR, IDOPERACAOORIGEM, '
      '   VLRREMUNERACAO, VLRIRREMUNER, CODFINANCEIRO, '
      'IDPLANPREVCTBPATR, IDCARTEIRAGERENC, '
      '   PUMERCADO, ORIGDEST, CODDOCUMENTO, IDOPERCUSTODIA)'
      'values'
      '  (:IDOPERACAOINVEST, :IDCUSTODIANTE, :IDCONTRATOIMOVEL, '
      ':IDCORRETVALORES, '
      '   :MOECODIGO, :IDMODULO, :EMPRESAPROP, :IDINVESTDEST, '
      ':IDCARTEIRAINVEST, '
      '   :IDINVESTIMENTO, :IDTIPOINVEST, :IDTIPOOPERACAO, :IDINSTFIN, '
      ':DATAOPERACAO, '
      '   :NUMDOCUMENTO, :QTDEOPERACAO, :PRECOUNITOPERACAO, '
      ':VLROPERACAO, :DATAVENCOPER, '
      '   :VLROPERACAOOM, :IDFORCLI, :OBSERVACAO, :IDORDMOVINV, '
      ':IDCARTORIDEST, '
      '   :FLGCUSTODIA, :IDLOTE, :TRGDTINCLUSAO, :TRGUSERINCLUSAO, '
      ':DATAAGE, :DATAEX, '
      '   :DATACOM, :INVORIGEM, :PERCENTUAL, :PARIDADE, :PRZBOLSA, '
      ':PRZEMPRESA, '
      
        '   :ATADECISAO, :FORMAPAGREC, :DIVPORACAO, :INIPAGTO, :JUROSCAP,' +
        ' '
      ':IDCUSTORIG, '
      '   :IDCUSTDEST, :IDOPERACAODIREITO, :FLGSTATUSFECHBOL, '
      ':FLGSTATUSORDMOV, '
      '   :IDTERCEIRO, :DATALIQOPER, :VLRIR, :IDOPERACAOORIGEM, '
      ':VLRREMUNERACAO, '
      '   :VLRIRREMUNER, :CODFINANCEIRO, :IDPLANPREVCTBPATR, '
      ':IDCARTEIRAGERENC, '
      '   :PUMERCADO, :ORIGDEST, :CODDOCUMENTO, :IDOPERCUSTODIA)')
    DeleteSQL.Strings = (
      'delete from OPERACAOINVEST'
      'where'
      '  IDOPERACAOINVEST = :OLD_IDOPERACAOINVEST')
    Left = 168
    Top = 80
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'OPERACAOINVEST.NUMDOCUMENTO'
      'CARTEIRAINVEST.DESCCARTINVEST'
      'CARTEIRAGERENC.DESCCARTGERENC'
      'INVESTIMENTO.DESCINVESTIMENTO'
      'TIPOOPERACAO.DESCTIPOOPERACAO'
      'CUSTODIANTE.SGLCUSTODIANTE'
      'OPERACAOINVEST.DATAOPERACAO'
      'OPERACAOINVEST.QTDEOPERACAO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'D'
      'N')
    Descricao.Strings = (
      'Boleta'
      'Carteira de Investimento'
      'Carteira Gerencial'
      'Investimento'
      'Tipo de Operação'
      'Custodiante'
      'Data'
      'Quantidade')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'OPERACAOINVEST'
      'TIPOOPERACAO'
      'CUSTODIANTE'
      'CARTEIRAINVEST'
      'INVESTIMENTO'
      'CARTEIRAGERENC')
    CamposChave.Strings = (
      'OPERACAOINVEST.IDOPERACAOINVEST')
    Filtro.Strings = (
      'OPERACAOINVEST.IDTIPOOPERACAO = TIPOOPERACAO.IDTIPOOPERACAO'
      'OPERACAOINVEST.IDCUSTODIANTE = CUSTODIANTE.IDCUSTODIANTE'
      
        'OPERACAOINVEST.IDCARTEIRAINVEST = CARTEIRAINVEST.IDCARTEIRAINVES' +
        'T'
      'OPERACAOINVEST.IDINVESTIMENTO = INVESTIMENTO.IDINVESTIMENTO'
      'OPERACAOINVEST.IDTIPOOPERACAO = -117'
      
        'OPERACAOINVEST.IDCARTEIRAGERENC = CARTEIRAGERENC.IDCARTEIRAGEREN' +
        'C(+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '###,###,###,###,##0.00')
    Larguras.Strings = (
      '30'
      '60'
      '40'
      '60'
      '60'
      '10'
      '18'
      '10')
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      '  SELECT *'
      '    FROM OPERACAOINVEST'
      '   WHERE IDTIPOOPERACAO IN (-117)'
      '     AND IDOPERACAOINVEST = :IDOPERACAOINVEST'
      'ORDER BY DATAOPERACAO')
    Left = 88
    Top = 80
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAOINVEST'
        ParamType = ptInputOutput
      end>
    object qryIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
    end
    object qryIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
    end
    object qryIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
    end
    object qryIDCORRETVALORES: TFloatField
      FieldName = 'IDCORRETVALORES'
    end
    object qryMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
    end
    object qryIDMODULO: TFloatField
      FieldName = 'IDMODULO'
    end
    object qryEMPRESAPROP: TFloatField
      FieldName = 'EMPRESAPROP'
    end
    object qryIDINVESTDEST: TFloatField
      FieldName = 'IDINVESTDEST'
    end
    object qryIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object qryIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object qryIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
    end
    object qryIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object qryIDINSTFIN: TFloatField
      FieldName = 'IDINSTFIN'
    end
    object qryDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
    end
    object qryNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Size = 30
    end
    object qryQTDEOPERACAO: TFloatField
      FieldName = 'QTDEOPERACAO'
    end
    object qryPRECOUNITOPERACAO: TFloatField
      FieldName = 'PRECOUNITOPERACAO'
    end
    object qryVLROPERACAO: TFloatField
      FieldName = 'VLROPERACAO'
    end
    object qryDATAVENCOPER: TDateTimeField
      FieldName = 'DATAVENCOPER'
    end
    object qryVLROPERACAOOM: TFloatField
      FieldName = 'VLROPERACAOOM'
    end
    object qryIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
    end
    object qryOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 200
    end
    object qryIDORDMOVINV: TFloatField
      FieldName = 'IDORDMOVINV'
    end
    object qryIDCARTORIDEST: TFloatField
      FieldName = 'IDCARTORIDEST'
    end
    object qryFLGCUSTODIA: TStringField
      FieldName = 'FLGCUSTODIA'
      FixedChar = True
      Size = 1
    end
    object qryIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Size = 10
    end
    object qryTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
    end
    object qryTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Size = 30
    end
    object qryDATAAGE: TDateTimeField
      FieldName = 'DATAAGE'
    end
    object qryDATAEX: TDateTimeField
      FieldName = 'DATAEX'
    end
    object qryDATACOM: TDateTimeField
      FieldName = 'DATACOM'
    end
    object qryINVORIGEM: TFloatField
      FieldName = 'INVORIGEM'
    end
    object qryPERCENTUAL: TFloatField
      FieldName = 'PERCENTUAL'
    end
    object qryPARIDADE: TFloatField
      FieldName = 'PARIDADE'
    end
    object qryPRZBOLSA: TDateTimeField
      FieldName = 'PRZBOLSA'
    end
    object qryPRZEMPRESA: TDateTimeField
      FieldName = 'PRZEMPRESA'
    end
    object qryATADECISAO: TDateTimeField
      FieldName = 'ATADECISAO'
    end
    object qryFORMAPAGREC: TStringField
      FieldName = 'FORMAPAGREC'
      Size = 30
    end
    object qryDIVPORACAO: TFloatField
      FieldName = 'DIVPORACAO'
    end
    object qryINIPAGTO: TDateTimeField
      FieldName = 'INIPAGTO'
    end
    object qryJUROSCAP: TStringField
      FieldName = 'JUROSCAP'
      FixedChar = True
      Size = 1
    end
    object qryIDCUSTORIG: TFloatField
      FieldName = 'IDCUSTORIG'
    end
    object qryIDCUSTDEST: TFloatField
      FieldName = 'IDCUSTDEST'
    end
    object qryIDOPERACAODIREITO: TFloatField
      FieldName = 'IDOPERACAODIREITO'
    end
    object qryFLGSTATUSFECHBOL: TStringField
      FieldName = 'FLGSTATUSFECHBOL'
      FixedChar = True
      Size = 1
    end
    object qryFLGSTATUSORDMOV: TStringField
      FieldName = 'FLGSTATUSORDMOV'
      FixedChar = True
      Size = 1
    end
    object qryIDTERCEIRO: TFloatField
      FieldName = 'IDTERCEIRO'
    end
    object qryDATALIQOPER: TDateTimeField
      FieldName = 'DATALIQOPER'
    end
    object qryVLRIR: TFloatField
      FieldName = 'VLRIR'
    end
    object qryIDOPERACAOORIGEM: TFloatField
      FieldName = 'IDOPERACAOORIGEM'
    end
    object qryVLRREMUNERACAO: TFloatField
      FieldName = 'VLRREMUNERACAO'
    end
    object qryVLRIRREMUNER: TFloatField
      FieldName = 'VLRIRREMUNER'
    end
    object qryCODFINANCEIRO: TFloatField
      FieldName = 'CODFINANCEIRO'
    end
    object qryIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
    end
    object qryIDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
    end
    object qryPUMERCADO: TFloatField
      FieldName = 'PUMERCADO'
    end
    object qryORIGDEST: TStringField
      FieldName = 'ORIGDEST'
      FixedChar = True
      Size = 1
    end
    object qryCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object qryIDOPERCUSTODIA: TFloatField
      FieldName = 'IDOPERCUSTODIA'
    end
  end
  object qryCarteira: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '  SELECT (IDCARTEIRAINVEST+IDCARTEIRAGERENC+1) AS ID,'
      '         IDCARTEIRAINVEST, IDCARTEIRAGERENC,'
      '         DESCCARTGERENC AS DESCCARTINVEST'
      '    FROM CARTEIRAGERENC'
      '   UNION'
      '   SELECT (IDCARTEIRAINVEST+1) AS ID,'
      '         IDCARTEIRAINVEST, 0 AS IDCARTEIRAGERENC,'
      '         DESCCARTINVEST'
      '    FROM CARTEIRAINVEST'
      
        '   WHERE (IDCARTEIRAINVEST NOT IN(SELECT IDCARTEIRAINVEST FROM C' +
        'ARTEIRAGERENC))AND(IDTIPOINVEST = 2)'
      'ORDER BY DESCCARTINVEST'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 88
    Top = 128
    object qryCarteiraDESCCARTINVEST: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldName = 'DESCCARTINVEST'
      Origin = 'CARTEIRAINVEST.DESCCARTINVEST'
      Size = 60
    end
    object qryCarteiraIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'CARTEIRAINVEST.IDCARTEIRAINVEST'
      Visible = False
    end
    object qryCarteiraID: TFloatField
      FieldName = 'ID'
      Visible = False
    end
    object qryCarteiraIDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
      Visible = False
    end
  end
  object qryInvestimento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT  I.IDINVESTIMENTO, I.DESCINVESTIMENTO, E.SIGLAEMISSOR, E.' +
        'IDEMISSOR'
      ''
      'FROM INVESTIMENTO I, EMISSOR E'
      ''
      'WHERE I.IDTIPOINVEST = 2'
      '  AND I.IDEMISSOR = E.IDEMISSOR(+)'
      ''
      'ORDER BY DESCINVESTIMENTO'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 128
    Top = 128
    object qryInvestimentoDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryInvestimentoIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
    object qryInvestimentoSIGLAEMISSOR: TStringField
      FieldName = 'SIGLAEMISSOR'
      Visible = False
      Size = 15
    end
    object qryInvestimentoIDEMISSOR: TFloatField
      FieldName = 'IDEMISSOR'
      Visible = False
    end
  end
  object dsInvestimento: TwwDataSource
    DataSet = qryInvestimento
    Left = 168
    Top = 128
  end
  object qryCustodiante: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  IDCUSTODIANTE, SGLCUSTODIANTE'
      ''
      'FROM CUSTODIANTE'
      ''
      'ORDER BY SGLCUSTODIANTE')
    ValidateWithMask = True
    Left = 88
    Top = 176
    object qryCustodianteSGLCUSTODIANTE: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldName = 'SGLCUSTODIANTE'
      Origin = 'CUSTODIANTE.SGLCUSTODIANTE'
      Size = 10
    end
    object qryCustodianteIDCUSTODIANTE: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCUSTODIANTE'
      Origin = 'CUSTODIANTE.IDCUSTODIANTE'
      Visible = False
    end
  end
  object qryCustodia: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   H1.IDCUSTODIA, H1.SALDOBLOQUEADO, H1.SALDOLIBERADO'
      'FROM'
      '   HISTCUSTODIA H1'
      'WHERE'
      '   (IDCARTEIRAINVEST =:IDCARTEIRA) AND'
      '   (IDINVESTIMENTO =:IDINVESTIMENTO) AND'
      
        '   (((:IDLOTE IS NOT NULL) AND (IDLOTE =:IDLOTE)) OR ((:IDLOTE I' +
        'S NULL) AND (IDLOTE IS NULL))) AND'
      '   (IDCUSTODIANTE =:IDCUSTODIANTE) AND'
      '   (H1.IDMOTIVOBLOQUEIO = :IDMOTIVOBLOQUEIO) AND'
      '   (H1.DATAMOVCUSTOD ='
      '         (SELECT MAX(H2.DATAMOVCUSTOD)'
      '          FROM   HISTCUSTODIA H2'
      '           WHERE (H2.IDCARTEIRAINVEST = H1.IDCARTEIRAINVEST) AND'
      
        '                          (H2.IDINVESTIMENTO   = H1.IDINVESTIMEN' +
        'TO) AND'
      
        '                          ((H2.IDLOTE = H1.IDLOTE) OR (H1.IDLOTE' +
        ' IS NULL)) AND'
      
        '                          (((H1.IDLOTE IS NOT NULL) AND (H2.IDLO' +
        'TE =H1.IDLOTE)) OR ((H1.IDLOTE IS NULL) AND (H2.IDLOTE IS NULL))' +
        ') AND'
      
        '                          (H2.IDCUSTODIANTE   = H1.IDCUSTODIANTE' +
        ') AND'
      
        '        '#9'          (H2.IDMOTIVOBLOQUEIO = H1.IDMOTIVOBLOQUEIO) A' +
        'ND'
      
        '                        ((H2.DATAMOVCUSTOD  <  :DATAMOV) OR     ' +
        '    '
      
        '                        ((H2.DATAMOVCUSTOD  =  :DATAMOV) AND    ' +
        '           '
      
        '                        (H2.IDCUSTODIA    <  :IDCUSTODIA))))) AN' +
        'D'
      '   (H1.IDCUSTODIA   ='
      '         (SELECT MAX(H3.IDCUSTODIA)'
      '          FROM   HISTCUSTODIA H3'
      '          WHERE (H3.IDCARTEIRAINVEST = H1.IDCARTEIRAINVEST) AND'
      
        '                         (H3.IDINVESTIMENTO   = H1.IDINVESTIMENT' +
        'O) AND'
      
        '                         (((H1.IDLOTE IS NOT NULL) AND (H3.IDLOT' +
        'E =H1.IDLOTE)) OR ((H1.IDLOTE IS NULL) AND (H3.IDLOTE IS NULL)))' +
        ' AND'
      
        '                         (H3.IDCUSTODIANTE   = H1.IDCUSTODIANTE)' +
        ' AND'
      #9'         (H3.IDMOTIVOBLOQUEIO = H1.IDMOTIVOBLOQUEIO) AND'
      
        '                         (H3.DATAMOVCUSTOD   = H1.DATAMOVCUSTOD)' +
        ' AND '
      '                         ((H3.DATAMOVCUSTOD < :DATAMOV) OR'
      '                          (H3.IDCUSTODIA    <  :IDCUSTODIA)))) '
      'ORDER BY'
      '   DATAMOVCUSTOD DESC, IDCUSTODIA DESC'
      '')
    ValidateWithMask = True
    Left = 168
    Top = 176
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCARTEIRA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'IDLOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCUSTODIANTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDMOTIVOBLOQUEIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCUSTODIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCUSTODIA'
        ParamType = ptUnknown
      end>
    object qryCustodiaSALDOBLOQUEADO: TFloatField
      FieldName = 'SALDOBLOQUEADO'
    end
    object qryCustodiaSALDOLIBERADO: TFloatField
      FieldName = 'SALDOLIBERADO'
    end
    object qryCustodiaIDCUSTODIA: TFloatField
      FieldName = 'IDCUSTODIA'
    end
  end
  object qryOperacaoInvest: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT NUMDOCUMENTO,'
      '       IDCARTEIRAINVEST,'
      '       IDCARTEIRAGERENC,'
      '       IDINVESTIMENTO,'
      '       IDCUSTODIANTE,'
      '       DATAOPERACAO'
      '  FROM'
      '       OPERACAOINVEST'
      ' WHERE'
      
        '      (((:IDTIPOOPERACAO   IS NOT NULL) AND (IDTIPOOPERACAO   = ' +
        '   :IDTIPOOPERACAO)) OR (:IDTIPOOPERACAO   IS NULL)) AND'
      
        '      (((:IDCUSTODIANTE    IS NOT NULL) AND (IDCUSTODIANTE    = ' +
        '   :IDCUSTODIANTE )) OR (:IDCUSTODIANTE    IS NULL)) AND'
      
        '      (((:IDCARTEIRAINVEST IS NOT NULL) AND (IDCARTEIRAINVEST = ' +
        ':IDCARTEIRAINVEST )) OR (:IDCARTEIRAINVEST IS NULL)) AND'
      
        '      (((:IDINVESTIMENTO   IS NOT NULL) AND (IDINVESTIMENTO   = ' +
        '  :IDINVESTIMENTO )) OR (:IDINVESTIMENTO   IS NULL)) AND'
      
        '      (((:DATAOPERACAO     IS NOT NULL) AND (DATAOPERACAO     = ' +
        '    :DATAOPERACAO )) OR (:DATAOPERACAO     IS NULL)) AND'
      
        '      (((:IDCARTEIRAGERENC IS NOT NULL) AND (IDCARTEIRAGERENC = ' +
        ' :IDCARTEIRAGERENC)) OR (:IDCARTEIRAGERENC IS NULL))')
    ControlType.Strings = (
      'IDCUSTODIANTE;CustomEdit;wwDBLookupCombo1'
      'SGLCUSTODIANTE;CustomEdit;wwDBLookupCombo1')
    ValidateWithMask = True
    Left = 88
    Top = 224
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCUSTODIANTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCUSTODIANTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCUSTODIANTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'DATAOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptUnknown
      end>
    object qryOperacaoInvestNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Origin = 'BASEDADOS.OPERACAOINVEST.NUMDOCUMENTO'
      Size = 30
    end
    object qryOperacaoInvestIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'BASEDADOS.OPERACAOINVEST.IDCARTEIRAINVEST'
    end
    object qryOperacaoInvestIDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
      Origin = 'BASEDADOS.OPERACAOINVEST.IDCARTEIRAGERENC'
    end
    object qryOperacaoInvestIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = 'BASEDADOS.OPERACAOINVEST.IDINVESTIMENTO'
    end
    object qryOperacaoInvestIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
      Origin = 'BASEDADOS.OPERACAOINVEST.IDCUSTODIANTE'
    end
    object qryOperacaoInvestDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
      Origin = 'BASEDADOS.OPERACAOINVEST.DATAOPERACAO'
    end
  end
  object qryBuscaBoletaOperacaoInvest: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '  SELECT *'
      '    FROM OPERACAOINVEST'
      '   WHERE IDTIPOOPERACAO IN (-117)'
      '     AND NUMDOCUMENTO = :NUMDOCUMENTO'
      'ORDER BY DATAOPERACAO'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 168
    Top = 224
    ParamData = <
      item
        DataType = ftString
        Name = 'NUMDOCUMENTO'
        ParamType = ptInputOutput
      end>
  end
  object qryTipoOperacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '  SELECT *'
      '    FROM TIPOOPERACAO'
      '   WHERE IDTIPOINVEST   = 2  AND'
      '         IDTIPOOPERACAO = -117'
      'ORDER BY DESCTIPOOPERACAO'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 128
    Top = 176
    object qryTipoOperacaoIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'BASEDADOS.TIPOOPERACAO.IDTIPOINVEST'
    end
    object qryTipoOperacaoIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.IDTIPOOPERACAO'
    end
    object qryTipoOperacaoIDMERCADO: TFloatField
      FieldName = 'IDMERCADO'
      Origin = 'BASEDADOS.TIPOOPERACAO.IDMERCADO'
    end
    object qryTipoOperacaoCODTIPDOC: TFloatField
      FieldName = 'CODTIPDOC'
      Origin = 'BASEDADOS.TIPOOPERACAO.CODTIPDOC'
    end
    object qryTipoOperacaoDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.DESCTIPOOPERACAO'
      Size = 60
    end
    object qryTipoOperacaoNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.NATUREZAOPERACAO'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoTIPOCUSTODIA: TStringField
      FieldName = 'TIPOCUSTODIA'
      Origin = 'BASEDADOS.TIPOOPERACAO.TIPOCUSTODIA'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoVENCIMENTO: TFloatField
      FieldName = 'VENCIMENTO'
      Origin = 'BASEDADOS.TIPOOPERACAO.VENCIMENTO'
    end
    object qryTipoOperacaoFLGGERACONTAB: TFloatField
      FieldName = 'FLGGERACONTAB'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGGERACONTAB'
    end
    object qryTipoOperacaoFLGGERACAPCAR: TFloatField
      FieldName = 'FLGGERACAPCAR'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGGERACAPCAR'
    end
    object qryTipoOperacaoRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'BASEDADOS.TIPOOPERACAO.RECPAG'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoTIPCREDOR: TStringField
      FieldName = 'TIPCREDOR'
      Origin = 'BASEDADOS.TIPOOPERACAO.TIPCREDOR'
      Size = 2
    end
    object qryTipoOperacaoFLGGERACAF: TFloatField
      FieldName = 'FLGGERACAF'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGGERACAF'
    end
    object qryTipoOperacaoFLGTRANSF: TStringField
      FieldName = 'FLGTRANSF'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGTRANSF'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGCORRET: TStringField
      FieldName = 'FLGCORRET'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGCORRET'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.TRGDTINCLUSAO'
    end
    object qryTipoOperacaoTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.TRGUSERINCLUSAO'
      Size = 30
    end
    object qryTipoOperacaoFLGORDMOVINV: TStringField
      FieldName = 'FLGORDMOVINV'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGORDMOVINV'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoIDMOTIVOBLOQUEIO: TFloatField
      FieldName = 'IDMOTIVOBLOQUEIO'
      Origin = 'BASEDADOS.TIPOOPERACAO.IDMOTIVOBLOQUEIO'
    end
    object qryTipoOperacaoFLGOPDIREITO: TStringField
      FieldName = 'FLGOPDIREITO'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGOPDIREITO'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGAGE: TStringField
      FieldName = 'FLGAGE'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGAGE'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGDATAEX: TStringField
      FieldName = 'FLGDATAEX'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGDATAEX'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGDATACOM: TStringField
      FieldName = 'FLGDATACOM'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGDATACOM'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGINVORIGEM: TStringField
      FieldName = 'FLGINVORIGEM'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGINVORIGEM'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGPERC: TStringField
      FieldName = 'FLGPERC'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGPERC'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGPARIDADE: TStringField
      FieldName = 'FLGPARIDADE'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGPARIDADE'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGPRZBOLSA: TStringField
      FieldName = 'FLGPRZBOLSA'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGPRZBOLSA'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGPRZEMP: TStringField
      FieldName = 'FLGPRZEMP'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGPRZEMP'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGATADEC: TStringField
      FieldName = 'FLGATADEC'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGATADEC'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGFORMAPAGREC: TStringField
      FieldName = 'FLGFORMAPAGREC'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGFORMAPAGREC'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGDIVACAO: TStringField
      FieldName = 'FLGDIVACAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGDIVACAO'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGINIPAG: TStringField
      FieldName = 'FLGINIPAG'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGINIPAG'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGJUROS: TStringField
      FieldName = 'FLGJUROS'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGJUROS'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoMOTBLOQCARTORIG: TFloatField
      FieldName = 'MOTBLOQCARTORIG'
      Origin = 'BASEDADOS.TIPOOPERACAO.MOTBLOQCARTORIG'
    end
    object qryTipoOperacaoMOTBLOQCARTDEST: TFloatField
      FieldName = 'MOTBLOQCARTDEST'
      Origin = 'BASEDADOS.TIPOOPERACAO.MOTBLOQCARTDEST'
    end
    object qryTipoOperacaoTIPSALDOCARTORIG: TStringField
      FieldName = 'TIPSALDOCARTORIG'
      Origin = 'BASEDADOS.TIPOOPERACAO.TIPSALDOCARTORIG'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoTIPSALDOCARTDEST: TStringField
      FieldName = 'TIPSALDOCARTDEST'
      Origin = 'BASEDADOS.TIPOOPERACAO.TIPSALDOCARTDEST'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGTRATAIR: TStringField
      FieldName = 'FLGTRATAIR'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGTRATAIR'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoSIGLATIPOOPER: TStringField
      FieldName = 'SIGLATIPOOPER'
      Origin = 'BASEDADOS.TIPOOPERACAO.SIGLATIPOOPER'
      Size = 4
    end
    object qryTipoOperacaoFLGISENTOIR: TStringField
      FieldName = 'FLGISENTOIR'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGISENTOIR'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGGRAVAIRLITIGIO: TStringField
      FieldName = 'FLGGRAVAIRLITIGIO'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGGRAVAIRLITIGIO'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGOPGERENC: TStringField
      FieldName = 'FLGOPGERENC'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGOPGERENC'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoTIPOMOVTO: TStringField
      FieldName = 'TIPOMOVTO'
      Origin = 'BASEDADOS.TIPOOPERACAO.TIPOMOVTO'
      Size = 3
    end
    object qryTipoOperacaoSTAATIVO: TStringField
      FieldName = 'STAATIVO'
      Origin = 'BASEDADOS.TIPOOPERACAO.STAATIVO'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGRENTABILIDADE: TStringField
      FieldName = 'FLGRENTABILIDADE'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGRENTABILIDADE'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGCONTAINVEST: TFloatField
      FieldName = 'FLGCONTAINVEST'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGCONTAINVEST'
    end
    object qryTipoOperacaoFLGMOVCOTA: TStringField
      FieldName = 'FLGMOVCOTA'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGMOVCOTA'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGCOTARECDES: TStringField
      FieldName = 'FLGCOTARECDES'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGCOTARECDES'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGDATAVENCIMENTO: TStringField
      FieldName = 'FLGDATAVENCIMENTO'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGDATAVENCIMENTO'
      FixedChar = True
      Size = 1
    end
  end
end
