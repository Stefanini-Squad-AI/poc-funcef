inherited frmCadOperAjusteCustoRV: TfrmCadOperAjusteCustoRV
  Left = 239
  Top = 182
  HelpContext = 790307
  Caption = 'Operação'
  ClientHeight = 385
  ClientWidth = 615
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 615
    Height = 299
    inherited Bevel2: TBevel
      Width = 613
    end
    object Label7: TLabel [1]
      Left = 21
      Top = 50
      Width = 103
      Height = 13
      Caption = 'Tipo de Operação'
    end
    object Label1: TLabel [2]
      Left = 21
      Top = 170
      Width = 73
      Height = 13
      Caption = 'Investimento'
    end
    object Label2: TLabel [3]
      Left = 21
      Top = 248
      Width = 113
      Height = 13
      Caption = 'Data de Operação :'
    end
    object Label16: TLabel [4]
      Left = 157
      Top = 248
      Width = 30
      Height = 13
      Caption = 'Valor'
    end
    object Label3: TLabel [5]
      Left = 21
      Top = 130
      Width = 45
      Height = 13
      Caption = 'Carteira'
    end
    object Label4: TLabel [6]
      Left = 21
      Top = 210
      Width = 72
      Height = 13
      Caption = 'Contra Parte'
    end
    object Label5: TLabel [7]
      Left = 341
      Top = 50
      Width = 69
      Height = 13
      Caption = 'Observação'
    end
    object Label6: TLabel [8]
      Left = 21
      Top = 91
      Width = 126
      Height = 13
      Caption = 'Plano / Patrocinadora'
    end
    inherited pnlTitulo: TPanel
      Width = 613
      TabOrder = 8
      inherited lbNomItem: TfcLabel
        Width = 161
        Caption = 'Ajuste de Custo'
      end
      object lblBoleta: TfcLabel
        Left = 487
        Top = 8
        Width = 104
        Height = 23
        Caption = 'RV-04/1000'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -19
        Font.Name = 'Arial'
        Font.Style = [fsItalic]
        ParentColor = False
        ParentFont = False
        TextOptions.Alignment = taLeftJustify
        TextOptions.Style = fclsRaised
        TextOptions.VAlignment = vaTop
      end
    end
    object dblOperacao: TwwDBLookupCombo
      Left = 21
      Top = 66
      Width = 305
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCTIPOOPERACAO'#9'40'#9'Descrição')
      DataField = 'IDTIPOOPERACAO'
      DataSource = ds
      LookupTable = qryOperacao
      LookupField = 'IDTIPOOPERACAO'
      Options = [loRowLines, loTitles]
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnExit = dblOperacaoExit
    end
    object dblInvestimento: TwwDBLookupCombo
      Left = 21
      Top = 184
      Width = 305
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCINVESTIMENTO'#9'15'#9'Descrição')
      DataField = 'IDINVESTIMENTO'
      DataSource = ds
      LookupTable = qryInvestimento
      LookupField = 'IDINVESTIMENTO'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object dbDtaOperacao: TCMDateTimePicker
      Left = 21
      Top = 262
      Width = 121
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
      TabOrder = 5
    end
    object dbrVlrOperacao: TDBRealEdit
      Tag = -1
      Left = 157
      Top = 262
      Width = 165
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '0,00')
      TabOrder = 6
      WordWrap = False
      IntDigits = 15
      DecDigits = 2
      NumberFormat = fNumber
      Signal = True
      DataField = 'VLROPERACAO'
      DataSource = ds
    end
    object dblCarteira: TwwDBLookupCombo
      Left = 21
      Top = 144
      Width = 305
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCCARTINVEST'#9'60'#9'Descrição'#9'F')
      DataField = 'IDCARTEIRAINVEST'
      DataSource = ds
      LookupTable = qryCarteira
      LookupField = 'IDCARTEIRAINVEST'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object dblContraParte: TwwDBLookupCombo
      Left = 21
      Top = 224
      Width = 305
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'SGLFORCLI'#9'15'#9'Descrição'#9'F')
      DataField = 'IDFORCLI'
      DataSource = ds
      LookupTable = qryContraParte
      LookupField = 'IDFORCLI'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 4
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object dbmObservacao: TDBMemo
      Left = 341
      Top = 66
      Width = 254
      Height = 216
      DataField = 'OBSERVACAO'
      DataSource = ds
      TabOrder = 7
    end
    object dblPlanoPatro: TwwDBLookupCombo
      Left = 21
      Top = 106
      Width = 305
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'PLANPRVCONTABPATRO'#9'60'#9'Descrição'#9'F')
      DataField = 'IDPLANPREVCTBPATR'
      DataSource = ds
      LookupTable = qryPlanoPatro
      LookupField = 'IDPLANPREVCTBPATR'
      Options = [loRowLines, loTitles]
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnExit = dblOperacaoExit
    end
  end
  inherited Dock972: TDock97
    Width = 615
    inherited Toolbar971: TToolbar97
      inherited sbtnAlterar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 346
    Width = 615
    inherited tb97Fundo: TToolbar97
      Left = 394
      DockPos = 394
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 225
      DockPos = 225
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 296
    TargetsData = (
      1
      2
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        'TDBMemo'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 389
    Top = 4
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
    Left = 417
    Top = 4
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Operação de Ajuste de Custo'
    Colunas.Strings = (
      'VWPLANPREVCTBPATR.PLANPRVCONTABPATRO'
      'OPERACAOINVEST.NUMDOCUMENTO'
      'TIPOOPERACAO.DESCTIPOOPERACAO'
      'CARTEIRAINVEST.DESCCARTINVEST'
      'CARTEIRAGERENC.DESCCARTGERENC'
      'INVESTIMENTO.DESCINVESTIMENTO'
      'OPERACAOINVEST.DATAOPERACAO'
      'OPERACAOINVEST.VLROPERACAO')
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
      'Plano / Patrocinadora'
      'Boleta'
      'Operação'
      'Carteira'
      'Carteira Gerencial'
      'Investimento'
      'Data da Operação'
      'Valor da operação')
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
      'CARTEIRAINVEST'
      'CARTEIRAGERENC'
      'INVESTIMENTO'
      'VWPLANPREVCTBPATR')
    CamposChave.Strings = (
      'OPERACAOINVEST.IDOPERACAOINVEST')
    Filtro.Strings = (
      'OPERACAOINVEST.IDTIPOOPERACAO IN (-113,-112,-111,-110)'
      'OPERACAOINVEST.IDTIPOOPERACAO = TIPOOPERACAO.IDTIPOOPERACAO'
      
        'OPERACAOINVEST.IDCARTEIRAINVEST = CARTEIRAINVEST.IDCARTEIRAINVES' +
        'T'
      
        'OPERACAOINVEST.IDCARTEIRAGERENC = CARTEIRAGERENC.IDCARTEIRAGEREN' +
        'C(+)'
      'OPERACAOINVEST.IDINVESTIMENTO = INVESTIMENTO.IDINVESTIMENTO'
      
        'OPERACAOINVEST.IDPLANPREVCTBPATR = VWPLANPREVCTBPATR.IDPLANPREVC' +
        'TBPATR')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      'dd/mm/yyyy'
      '###,###,###,###,##0.00')
    Larguras.Strings = (
      '40'
      '30'
      '60'
      '60'
      '40'
      '60'
      '18'
      '10')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    Left = 285
  end
  inherited ImlPadrao: TImageList
    Left = 273
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 260
  end
  inherited qry: TwwQuery
    BeforePost = qryBeforePost
    AfterPost = qryAfterPost
    SQL.Strings = (
      'SELECT *'
      'FROM OPERACAOINVEST'
      'WHERE IDTIPOOPERACAO IN (-113,-112,-111,-110)'
      '  AND IDOPERACAOINVEST = :IDOPERACAOINVEST'
      'ORDER BY DATAOPERACAO')
    Left = 361
    Top = 4
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAOINVEST'
        ParamType = ptResult
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
  object qryOperacao: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  *'
      'FROM TIPOOPERACAO TP'
      'WHERE (TP.IDTIPOINVEST = 2)'
      '  AND (TP.IDTIPOOPERACAO IN (-113,-112,-111,-110))'
      '  AND (TP.STAATIVO = '#39'S'#39')'
      'ORDER BY TP.DESCTIPOOPERACAO'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 281
    Top = 105
    object qryOperacaoIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
    end
    object qryOperacaoIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object qryOperacaoIDMERCADO: TFloatField
      FieldName = 'IDMERCADO'
    end
    object qryOperacaoCODTIPDOC: TFloatField
      FieldName = 'CODTIPDOC'
    end
    object qryOperacaoDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object qryOperacaoNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      FixedChar = True
      Size = 1
    end
    object qryOperacaoTIPOCUSTODIA: TStringField
      FieldName = 'TIPOCUSTODIA'
      FixedChar = True
      Size = 1
    end
    object qryOperacaoVENCIMENTO: TFloatField
      FieldName = 'VENCIMENTO'
    end
    object qryOperacaoFLGGERACONTAB: TFloatField
      FieldName = 'FLGGERACONTAB'
    end
    object qryOperacaoFLGGERACAPCAR: TFloatField
      FieldName = 'FLGGERACAPCAR'
    end
    object qryOperacaoRECPAG: TStringField
      FieldName = 'RECPAG'
      FixedChar = True
      Size = 1
    end
    object qryOperacaoTIPCREDOR: TStringField
      FieldName = 'TIPCREDOR'
      Size = 2
    end
    object qryOperacaoFLGGERACAF: TFloatField
      FieldName = 'FLGGERACAF'
    end
    object qryOperacaoFLGTRANSF: TStringField
      FieldName = 'FLGTRANSF'
      FixedChar = True
      Size = 1
    end
    object qryOperacaoTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
    end
    object qryOperacaoTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Size = 30
    end
    object qryOperacaoFLGCORRET: TStringField
      FieldName = 'FLGCORRET'
      FixedChar = True
      Size = 1
    end
    object qryOperacaoFLGORDMOVINV: TStringField
      FieldName = 'FLGORDMOVINV'
      FixedChar = True
      Size = 1
    end
    object qryOperacaoIDMOTIVOBLOQUEIO: TFloatField
      FieldName = 'IDMOTIVOBLOQUEIO'
    end
    object qryOperacaoFLGOPDIREITO: TStringField
      FieldName = 'FLGOPDIREITO'
      FixedChar = True
      Size = 1
    end
    object qryOperacaoFLGAGE: TStringField
      FieldName = 'FLGAGE'
      FixedChar = True
      Size = 1
    end
    object qryOperacaoFLGDATAEX: TStringField
      FieldName = 'FLGDATAEX'
      FixedChar = True
      Size = 1
    end
    object qryOperacaoFLGDATACOM: TStringField
      FieldName = 'FLGDATACOM'
      FixedChar = True
      Size = 1
    end
    object qryOperacaoFLGINVORIGEM: TStringField
      FieldName = 'FLGINVORIGEM'
      FixedChar = True
      Size = 1
    end
    object qryOperacaoFLGPERC: TStringField
      FieldName = 'FLGPERC'
      FixedChar = True
      Size = 1
    end
    object qryOperacaoFLGPARIDADE: TStringField
      FieldName = 'FLGPARIDADE'
      FixedChar = True
      Size = 1
    end
    object qryOperacaoFLGPRZBOLSA: TStringField
      FieldName = 'FLGPRZBOLSA'
      FixedChar = True
      Size = 1
    end
    object qryOperacaoFLGPRZEMP: TStringField
      FieldName = 'FLGPRZEMP'
      FixedChar = True
      Size = 1
    end
    object qryOperacaoFLGATADEC: TStringField
      FieldName = 'FLGATADEC'
      FixedChar = True
      Size = 1
    end
    object qryOperacaoFLGFORMAPAGREC: TStringField
      FieldName = 'FLGFORMAPAGREC'
      FixedChar = True
      Size = 1
    end
    object qryOperacaoFLGDIVACAO: TStringField
      FieldName = 'FLGDIVACAO'
      FixedChar = True
      Size = 1
    end
    object qryOperacaoFLGINIPAG: TStringField
      FieldName = 'FLGINIPAG'
      FixedChar = True
      Size = 1
    end
    object qryOperacaoFLGJUROS: TStringField
      FieldName = 'FLGJUROS'
      FixedChar = True
      Size = 1
    end
    object qryOperacaoMOTBLOQCARTORIG: TFloatField
      FieldName = 'MOTBLOQCARTORIG'
    end
    object qryOperacaoMOTBLOQCARTDEST: TFloatField
      FieldName = 'MOTBLOQCARTDEST'
    end
    object qryOperacaoTIPSALDOCARTORIG: TStringField
      FieldName = 'TIPSALDOCARTORIG'
      FixedChar = True
      Size = 1
    end
    object qryOperacaoTIPSALDOCARTDEST: TStringField
      FieldName = 'TIPSALDOCARTDEST'
      FixedChar = True
      Size = 1
    end
    object qryOperacaoFLGTRATAIR: TStringField
      FieldName = 'FLGTRATAIR'
      FixedChar = True
      Size = 1
    end
    object qryOperacaoSIGLATIPOOPER: TStringField
      FieldName = 'SIGLATIPOOPER'
      Size = 4
    end
    object qryOperacaoFLGISENTOIR: TStringField
      FieldName = 'FLGISENTOIR'
      FixedChar = True
      Size = 1
    end
    object qryOperacaoFLGGRAVAIRLITIGIO: TStringField
      FieldName = 'FLGGRAVAIRLITIGIO'
      FixedChar = True
      Size = 1
    end
    object qryOperacaoFLGOPGERENC: TStringField
      FieldName = 'FLGOPGERENC'
      FixedChar = True
      Size = 1
    end
    object qryOperacaoTIPOMOVTO: TStringField
      FieldName = 'TIPOMOVTO'
      Size = 3
    end
    object qryOperacaoSTAATIVO: TStringField
      FieldName = 'STAATIVO'
      FixedChar = True
      Size = 1
    end
    object qryOperacaoFLGRENTABILIDADE: TStringField
      FieldName = 'FLGRENTABILIDADE'
      FixedChar = True
      Size = 1
    end
    object qryOperacaoFLGMOVCOTA: TStringField
      FieldName = 'FLGMOVCOTA'
      FixedChar = True
      Size = 1
    end
    object qryOperacaoFLGCONTAINVEST: TFloatField
      FieldName = 'FLGCONTAINVEST'
    end
  end
  object qryInvestimento: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM INVESTIMENTO'
      'WHERE IDTIPOINVEST = 2'
      '  AND ((STAOPCAO <> '#39'S'#39') OR (STAOPCAO IS NULL))'
      'ORDER BY DESCINVESTIMENTO')
    ValidateWithMask = True
    Left = 281
    Top = 223
    object qryInvestimentoIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = 'BASEDADOS.INVESTIMENTO.IDINVESTIMENTO'
    end
    object qryInvestimentoIDMOEDACONTAB: TFloatField
      FieldName = 'IDMOEDACONTAB'
      Origin = 'BASEDADOS.INVESTIMENTO.IDMOEDACONTAB'
    end
    object qryInvestimentoIDEMISSOR: TFloatField
      FieldName = 'IDEMISSOR'
      Origin = 'BASEDADOS.INVESTIMENTO.IDEMISSOR'
    end
    object qryInvestimentoIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'BASEDADOS.INVESTIMENTO.IDTIPOINVEST'
    end
    object qryInvestimentoDESCINVESTIMENTO: TStringField
      FieldName = 'DESCINVESTIMENTO'
      Origin = 'BASEDADOS.INVESTIMENTO.DESCINVESTIMENTO'
      Size = 60
    end
    object qryInvestimentoFLGATIVO: TStringField
      FieldName = 'FLGATIVO'
      Origin = 'BASEDADOS.INVESTIMENTO.FLGATIVO'
      FixedChar = True
      Size = 1
    end
    object qryInvestimentoOBSINVESTIMENTO: TStringField
      FieldName = 'OBSINVESTIMENTO'
      Origin = 'BASEDADOS.INVESTIMENTO.OBSINVESTIMENTO'
      Size = 200
    end
    object qryInvestimentoDESCCLASSINVEST: TStringField
      FieldName = 'DESCCLASSINVEST'
      Origin = 'BASEDADOS.INVESTIMENTO.DESCCLASSINVEST'
      Size = 60
    end
    object qryInvestimentoCODISIN: TStringField
      FieldName = 'CODISIN'
      Origin = 'BASEDADOS.INVESTIMENTO.CODISIN'
      Size = 14
    end
    object qryInvestimentoIDCLASSETIT: TFloatField
      FieldName = 'IDCLASSETIT'
      Origin = 'BASEDADOS.INVESTIMENTO.IDCLASSETIT'
    end
    object qryInvestimentoCARENCIA: TFloatField
      FieldName = 'CARENCIA'
      Origin = 'BASEDADOS.INVESTIMENTO.CARENCIA'
    end
    object qryInvestimentoTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.INVESTIMENTO.TRGDTINCLUSAO'
    end
    object qryInvestimentoTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.INVESTIMENTO.TRGUSERINCLUSAO'
      Size = 30
    end
    object qryInvestimentoSTAOPCAO: TStringField
      FieldName = 'STAOPCAO'
      Origin = 'BASEDADOS.INVESTIMENTO.STAOPCAO'
      FixedChar = True
      Size = 1
    end
    object qryInvestimentoIDCARTEIRASPC: TFloatField
      FieldName = 'IDCARTEIRASPC'
      Origin = 'BASEDADOS.INVESTIMENTO.IDCARTEIRASPC'
    end
    object qryInvestimentoFLGRFXANTIGO: TStringField
      FieldName = 'FLGRFXANTIGO'
      Origin = 'BASEDADOS.INVESTIMENTO.FLGRFXANTIGO'
      FixedChar = True
      Size = 1
    end
  end
  object qryCarteira: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    IDCARTEIRAINVEST, DESCCARTINVEST'
      'FROM'
      '    CARTEIRAINVEST'
      'WHERE'
      '    IDTIPOINVEST = 2'
      ''
      'ORDER BY DESCCARTINVEST'
      ' ')
    ValidateWithMask = True
    Left = 280
    Top = 183
    object qryCarteiraDESCCARTINVEST: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
    object qryCarteiraIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
  end
  object qryContraParte: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT *'
      'FROM('
      
        '     SELECT IDCUSTODIANTE AS IDFORCLI, SGLCUSTODIANTE AS SGLFORC' +
        'LI'
      '     FROM CUSTODIANTE'
      '     UNION'
      '     SELECT IDEMISSOR AS IDFORCLI, SIGLAEMISSOR AS SGLFORCLI'
      '     FROM EMISSOR'
      '     UNION'
      
        '     SELECT IDBOLSAVALORES AS IDFORCLI, SGLBOLSAVALORES AS SGLFO' +
        'RCLI'
      '     FROM BOLSAVALORES)'
      'ORDER BY SGLFORCLI'
      ' ')
    ValidateWithMask = True
    Left = 281
    Top = 263
    object qryContraParteSGLFORCLI: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 15
      FieldName = 'SGLFORCLI'
      Size = 15
    end
    object qryContraParteIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Visible = False
    end
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 464
    Top = 7
  end
  object qryPlanoPatro: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT PLANPRVCONTABPATRO, PLANOCONTABIL, PATROCINADORA, IDPLANP' +
        'REVCTBPATR, IDPLANOPREV, IDPATRO'
      'FROM VWPLANPREVCTBPATR'
      'ORDER BY PLANPRVCONTABPATRO')
    ValidateWithMask = True
    Left = 281
    Top = 145
    object qryPlanoPatroPLANPRVCONTABPATRO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'PLANPRVCONTABPATRO'
      Origin = 'BASEDADOS."CM.VWPLANPREVCTBPATR".PLANPRVCONTABPATRO'
      Size = 113
    end
    object qryPlanoPatroPLANOCONTABIL: TStringField
      FieldName = 'PLANOCONTABIL'
      Origin = 'BASEDADOS."CM.VWPLANPREVCTBPATR".PLANOCONTABIL'
      Visible = False
      Size = 50
    end
    object qryPlanoPatroPATROCINADORA: TStringField
      FieldName = 'PATROCINADORA'
      Origin = 'BASEDADOS."CM.VWPLANPREVCTBPATR".PATROCINADORA'
      Visible = False
      Size = 60
    end
    object qryPlanoPatroIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Origin = 'BASEDADOS."CM.VWPLANPREVCTBPATR".IDPLANPREVCTBPATR'
      Visible = False
    end
    object qryPlanoPatroIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS."CM.VWPLANPREVCTBPATR".IDPLANOPREV'
      Visible = False
    end
    object qryPlanoPatroIDPATRO: TFloatField
      FieldName = 'IDPATRO'
      Origin = 'BASEDADOS."CM.VWPLANPREVCTBPATR".IDPATRO'
      Visible = False
    end
  end
end
