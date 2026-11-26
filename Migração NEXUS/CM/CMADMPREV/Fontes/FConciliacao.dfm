inherited FrmConciliacao: TFrmConciliacao
  Left = 331
  Top = 121
  HelpContext = 160089
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Conciliação do INSS com as Mantenedoras'
  ClientHeight = 508
  ClientWidth = 374
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock971: TDock97 [0]
    Top = 469
    Width = 374
    inherited tb97Fundo: TToolbar97
      Left = 178
      DockPos = 178
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 9
      DockPos = 9
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited pnlFundo: TPanel [1]
    Width = 374
    Height = 469
    object lblPathArqProc: TLabel
      Left = 24
      Top = 178
      Width = 115
      Height = 13
      Caption = 'Arquivo a Processar'
    end
    object SB1: TSpeedButton
      Left = 320
      Top = 192
      Width = 25
      Height = 23
      Hint = 'Buscar Arquivo '
      Glyph.Data = {
        4E010000424D4E01000000000000760000002800000012000000120000000100
        040000000000D800000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDD000000DDDDDDDDDDDDDDDDDD000000D000000000000DD00D000000D0FF
        FFFFFFFF0D000D000000D0FFFFFFF0000800DD000000D0FFFFFF0877808DDD00
        0000D0FFFFF0877E880DDD000000D0FFFFF07777870DDD000000D0FFFFF07E77
        870DDD000000D0FFFFF08EE7880DDD000000D0FFFFFF087780DDDD000000D0FF
        FFFFF0000DDDDD000000D0FFFFFFFFFF0DDDDD000000D0FFFFFFF0000DDDDD00
        0000D0FFFFFFF070DDDDDD000000D0FFFFFFF00DDDDDDD000000DD00000000DD
        DDDDDD000000DDDDDDDDDDDDDDDDDD000000}
      ParentShowHint = False
      ShowHint = True
      OnClick = SB1Click
    end
    object lblBarraProgresso: TLabel
      Left = 113
      Top = 375
      Width = 145
      Height = 13
      Caption = 'Aguarde Processando ....'
      Visible = False
    end
    object lblMantenedora: TLabel
      Left = 296
      Top = 138
      Width = 75
      Height = 13
      Caption = 'Mantenedora'
    end
    object lblPathArqExc: TLabel
      Left = 24
      Top = 218
      Width = 121
      Height = 13
      Caption = 'Arquivo de Exceções'
    end
    object spedExcessao: TSpeedButton
      Left = 320
      Top = 232
      Width = 25
      Height = 23
      Hint = 'Buscar Arquivo '
      Glyph.Data = {
        4E010000424D4E01000000000000760000002800000012000000120000000100
        040000000000D800000000000000000000001000000010000000000000000000
        BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
        DDDDDD000000DDDDDDDDDDDDDDDDDD000000D000000000000DD00D000000D0FF
        FFFFFFFF0D000D000000D0FFFFFFF0000800DD000000D0FFFFFF0877808DDD00
        0000D0FFFFF0877E880DDD000000D0FFFFF07777870DDD000000D0FFFFF07E77
        870DDD000000D0FFFFF08EE7880DDD000000D0FFFFFF087780DDDD000000D0FF
        FFFFF0000DDDDD000000D0FFFFFFFFFF0DDDDD000000D0FFFFFFF0000DDDDD00
        0000D0FFFFFFF070DDDDDD000000D0FFFFFFF00DDDDDDD000000DD00000000DD
        DDDDDD000000DDDDDDDDDDDDDDDDDD000000}
      ParentShowHint = False
      ShowHint = True
      OnClick = spedExcessaoClick
    end
    object Animate1: TAnimate
      Left = 24
      Top = 319
      Width = 315
      Height = 44
      Active = False
      AutoSize = False
      CommonAVI = aviCopyFiles
      StopFrame = 34
      Visible = False
    end
    object edtArqProc: TEdit
      Left = 24
      Top = 192
      Width = 297
      Height = 21
      TabOrder = 2
    end
    object rdgTipo: TRadioGroup
      Left = 24
      Top = 88
      Width = 321
      Height = 40
      Caption = 'Origem do Arquivo'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        '&INSS')
      TabOrder = 0
      OnClick = rdgTipoClick
    end
    object dblMantenedora: TwwDBLookupCombo
      Left = 296
      Top = 152
      Width = 321
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'40'#9'Mantenedora')
      LookupTable = qrymantenedora
      LookupField = 'CODMANTENEDORA'
      TabOrder = 1
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
    object grpMesAno: TGroupBox
      Left = 24
      Top = 16
      Width = 321
      Height = 67
      Caption = ' Mês e Ano de Processamento do Arquivo '
      TabOrder = 4
      object lblAnoMes: TLabel
        Left = 208
        Top = 18
        Width = 27
        Height = 13
        Caption = 'Ano '
      end
      object lblMes: TLabel
        Left = 16
        Top = 18
        Width = 24
        Height = 13
        Caption = 'Mês'
      end
      object spnAno: TSpinEdit
        Left = 208
        Top = 32
        Width = 57
        Height = 22
        MaxValue = 3000
        MinValue = 2000
        TabOrder = 0
        Value = 2004
      end
      object cboMes: TComboBox
        Left = 16
        Top = 32
        Width = 177
        Height = 21
        ItemHeight = 13
        TabOrder = 1
        Items.Strings = (
          'Janeiro'
          'Fevereiro'
          'Março'
          'Abril'
          'Maio'
          'Junho'
          'Julho'
          'Agosto'
          'Setembro'
          'Outubro'
          'Novembro'
          'Dezembro')
      end
    end
    object edtArqExcecao: TEdit
      Left = 24
      Top = 232
      Width = 297
      Height = 21
      TabOrder = 5
    end
    object chkReimporta: TCheckBox
      Left = 24
      Top = 272
      Width = 321
      Height = 17
      Caption = 'Apagar arquivo já importado para o mês selecionado'
      TabOrder = 6
    end
    object btnValidarArquivo: TButton
      Left = 117
      Top = 399
      Width = 137
      Height = 25
      Caption = 'Validar Arquivo'
      TabOrder = 7
      OnClick = btnValidarArquivoClick
    end
    object chkImportEtapas: TCheckBox
      Left = 24
      Top = 292
      Width = 321
      Height = 17
      Caption = 'Importar mais de um arquivo para o mesmo mês'
      TabOrder = 8
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 363
    Top = 282
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object OpenDialog: TOpenDialog
    InitialDir = 'C:\'
    Title = 'Busca Arquivo de Importação '
    Left = 296
    Top = 72
  end
  object QryConcInss: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 159
    Top = 46
  end
  object dsConcInss: TwwDataSource
    DataSet = QryConcInss
    Left = 229
    Top = 46
  end
  object QryProcuraRegistro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  HST.IDBENEFICIO       , HST.IDBENEFICIARIOPP  , HST.NUMEROPROC' +
        'ESSO    , HST.DATAPAGAMENTO     ,'
      
        '  HST.IDMOTIVO          , HST.CODPORTFORMA      , HST.IDLOTE    ' +
        '        , HST.MES               ,'
      
        '  HST.MESREFERENCIA     , HST.VALORCALCULADO    , HST.VALORPAGO ' +
        '        , HST.FLGCONCESSAO      ,'
      #9' HST.FLGEFETUADO       , HST.FONTEPAGADORA     , HST.FLGENVIADO'
      'FROM'
      '  HSTBENEFBFPP HST'
      'WHERE'
      '  HST.NUMEROPROCESSO = :NUMEROPROCESSO AND'
      '  HST.DATAPAGAMENTO  = :DATAPAGAMENTO'
      '')
    ValidateWithMask = True
    Left = 254
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'NUMEROPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATAPAGAMENTO'
        ParamType = ptUnknown
      end>
  end
  object DsProcuraRegistro: TwwDataSource
    DataSet = QryProcuraRegistro
    Left = 190
    Top = 86
  end
  object qrymantenedora: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CODMANTENEDORA,'
      '   NOME,'
      '  FLGFUNDACAO'
      'FROM'
      '    MANTENEDORA'
      'ORDER BY '
      '    NOME'
      '')
    ValidateWithMask = True
    Left = 188
    Top = 8
    object qrymantenedoraCODMANTENEDORA: TStringField
      FieldName = 'CODMANTENEDORA'
      Origin = 'MANTENEDORA.CODMANTENEDORA'
      Size = 10
    end
    object qrymantenedoraNOME: TStringField
      FieldName = 'NOME'
      Origin = 'MANTENEDORA.NOME'
      Size = 60
    end
    object qrymantenedoraFLGFUNDACAO: TFloatField
      FieldName = 'FLGFUNDACAO'
      Origin = 'MANTENEDORA.FLGFUNDACAO'
    end
  end
  object dsMantenedora: TwwDataSource
    DataSet = qrymantenedora
    Left = 19
    Top = 46
  end
  object dsAuxDadosPart: TwwDataSource
    DataSet = QryAuxDadosPart
    Left = 194
    Top = 46
  end
  object QryAuxDadosPart: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 124
    Top = 46
  end
  object qryRetArqINSS: TwwQuery
    DatabaseName = 'basedados'
    ValidateWithMask = True
    Left = 283
    Top = 8
  end
  object qryPrisma: TwwQuery
    DatabaseName = 'basedados'
    ValidateWithMask = True
    Left = 291
    Top = 41
  end
  object qryDetConcInss: TwwQuery
    DatabaseName = 'basedados'
    ValidateWithMask = True
    Left = 58
    Top = 46
  end
  object qryAux: TwwQuery
    DatabaseName = 'basedados'
    ValidateWithMask = True
    Left = 89
    Top = 46
  end
  object qryRetPrisma: TwwQuery
    DatabaseName = 'basedados'
    ValidateWithMask = True
    Left = 218
    Top = 8
  end
  object qryHRSPessoa: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PI.IDPLANOCONTABIL, HRS.IDPESSOA, HRS.IDTITULAR,'
      '   SUM(HRS.VALORPROVENTO) AS VALOR'
      ''
      'FROM'
      '   HISTRUBSAL      HRS,'
      '   CONJUNTORUBRICA CJR,'
      '   CONJUNTORUBXRUB CXR,'
      '   PERFILINVEST PI'
      'WHERE'
      '   HRS.MESCOBRANCA        =:PMESCOBRANCA'
      '   AND HRS.IDPESSOA           =:PIDPESSOA'
      '   AND HRS.IDTITULAR          =:PIDTITULAR'
      '   AND HRS.IDMODULO           = 18'
      '   AND HRS.FONTEPAGADORA      = 2'
      '   AND CJR.IDCONJUNTORUBRICA  = -1'
      '   AND PI.IDPERFILINVEST = HRS.IDPERFILINVEST'
      '   AND CJR.IDCONJUNTORUBRICA  = CXR.IDCONJUNTORUBRICA'
      '   AND CXR.IDRUBRICA          = HRS.IDRUBRICA'
      ''
      'GROUP BY'
      '   HRS.IDPLANOCONTABIL, HRS.IDPESSOA, HRS.IDTITULAR'
      ''
      'ORDER BY'
      '   SUM(HRS.VALORPROVENTO) DESC')
    ValidateWithMask = True
    Left = 168
    Top = 104
    ParamData = <
      item
        DataType = ftString
        Name = 'PMESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTITULAR'
        ParamType = ptInput
      end>
    object qryHRSPessoaIDPLANOCONTABIL: TFloatField
      FieldName = 'IDPLANOCONTABIL'
    end
    object qryHRSPessoaIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryHRSPessoaIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
    end
    object qryHRSPessoaVALOR: TFloatField
      FieldName = 'VALOR'
    end
  end
  object qryHRS: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   HRS.IDPESSOA, HRS.IDTITULAR, HRS.IDRUBRICA,'
      '   COUNT(DISTINCT(HRS.IDPLANOCONTABIL)) AS QUANT'
      ''
      'FROM'
      '   HISTRUBSAL      HRS,'
      '   CONJUNTORUBRICA CJR,'
      '   CONJUNTORUBXRUB CXR'
      ''
      'WHERE'
      '       HRS.MESCOBRANCA        =:PMESCOBRANCA'
      '   AND HRS.IDMODULO           = 18'
      '   AND HRS.FONTEPAGADORA      = 2'
      '   AND CJR.IDCONJUNTORUBRICA  = -1'
      '   AND CJR.IDCONJUNTORUBRICA  = CXR.IDCONJUNTORUBRICA'
      '   AND CXR.IDRUBRICA          = HRS.IDRUBRICA'
      ''
      'GROUP BY'
      '   HRS.IDPESSOA, HRS.IDTITULAR, HRS.IDRUBRICA'
      ''
      'HAVING'
      '   COUNT(DISTINCT(HRS.IDPLANOCONTABIL)) > 1'
      ''
      'ORDER BY'
      '   HRS.IDPESSOA, HRS.IDTITULAR, HRS.IDRUBRICA')
    ValidateWithMask = True
    Left = 232
    Top = 104
    ParamData = <
      item
        DataType = ftString
        Name = 'PMESCOBRANCA'
        ParamType = ptInput
      end>
    object qryHRSIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.HISTRUBSAL.IDPESSOA'
    end
    object qryHRSIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
      Origin = 'BASEDADOS.HISTRUBSAL.IDTITULAR'
    end
    object qryHRSIDRUBRICA: TFloatField
      FieldName = 'IDRUBRICA'
      Origin = 'BASEDADOS.HISTRUBSAL.IDRUBRICA'
    end
    object qryHRSQUANT: TFloatField
      FieldName = 'QUANT'
      Origin = 'BASEDADOS.HISTRUBSAL.IDPLANOCONTABIL'
    end
  end
  object dspHRS: TDataSetProvider
    DataSet = qryHRS
    Constraints = True
    Left = 232
    Top = 92
  end
  object cdsHRS: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspHRS'
    Left = 232
    Top = 80
    object cdsHRSIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object cdsHRSIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
    end
    object cdsHRSIDRUBRICA: TFloatField
      FieldName = 'IDRUBRICA'
    end
    object cdsHRSQUANT: TFloatField
      FieldName = 'QUANT'
    end
  end
  object qryInsertDetConc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO DETCONCINSS'
      '('
      'MESREFERENCIA,'
      'MESCOBRANCA,'
      'NUMPROCINSS,'
      'IDBENEFICIO,'
      'SEQUENCIAL,'
      'IDPLANOPREV,'
      'IDPESSOA,'
      'CODCONCESSORINSS,'
      'VALORINSS,'
      'CODMANTENEDORINSS,'
      'IDRUBRICA,'
      'RUBRICAINSS,'
      'CODMANTENEDORA,'
      'MATRICULA,'
      'RMREAJ,'
      'APREAJ,'
      'ESPECIE,'
      'DIB,'
      'FLGMANUAL,'
      'IDPLANOPREVPREV,'
      'CODSINONIMO,'
      'DTINICIOCRED,'
      'DTFIMCRED'#10
      ''
      ''
      ')'
      'VALUES'
      '('
      ':PMESREFERENCIA,'
      ':PMESCOBRANCA,'
      ':PNUMPROCINSS,'
      ':PIDBENEFICIO,'
      ':PSEQUENCIAL,'
      ':PIDPLANOPREV,'
      ':PIDPESSOA,'
      ':PCODCONCESSORINSS,'
      ':PVALORINSS,'
      ':PCODMANTENEDORINSS,'
      ':PIDRUBRICA,'
      ':PRUBRICAINSS,'
      ':PCODMANTENEDORA,'
      ':PMATRICULA,'
      ':PRMREAJ,'
      ':PAPREAJ,'
      ':PESPECIE,'
      ':PDIB,'
      ':PFLGMANUAL,'
      ':PIDPLANOPREVPREV,'
      ':pCODSINONIMO,'
      'TO_DATE(:pDTINICIOCRED,'#39'yymmdd'#39'),'
      'TO_DATE(:pDTFIMCRED,'#39'yymmdd'#39')'
      ''
      ')')
    ValidateWithMask = True
    Left = 96
    Top = 128
    ParamData = <
      item
        DataType = ftString
        Name = 'PMESREFERENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PMESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PNUMPROCINSS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PIDBENEFICIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PSEQUENCIAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PCODCONCESSORINSS'
        ParamType = ptInput
      end
      item
        DataType = ftCurrency
        Name = 'PVALORINSS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PCODMANTENEDORINSS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PIDRUBRICA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PRUBRICAINSS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PCODMANTENEDORA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PMATRICULA'
        ParamType = ptInput
      end
      item
        DataType = ftCurrency
        Name = 'PRMREAJ'
        ParamType = ptInput
      end
      item
        DataType = ftCurrency
        Name = 'PAPREAJ'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PESPECIE'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDIB'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PFLGMANUAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PIDPLANOPREVPREV'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'pCODSINONIMO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pDTINICIOCRED'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'pDTFIMCRED'
        ParamType = ptUnknown
      end>
  end
  object qrySequencial: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  NVL(MAX(SEQUENCIAL), 0) AS SEQUENCIAL'
      'FROM'
      '  DETCONCINSS'
      'WHERE'
      '    MESCOBRANCA = :PMESCOBRANCA'
      'AND (IDPESSOA = :PIDPESSOA OR NUMPROCINSS = :PNUMPROCINSS)')
    ValidateWithMask = True
    Left = 88
    Top = 88
    ParamData = <
      item
        DataType = ftString
        Name = 'PMESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PNUMPROCINSS'
        ParamType = ptInput
      end>
    object qrySequencialSEQUENCIAL: TFloatField
      FieldName = 'SEQUENCIAL'
      Origin = 'BASEDADOS."CM.DETCONCINSS".SEQUENCIAL'
    end
  end
end
