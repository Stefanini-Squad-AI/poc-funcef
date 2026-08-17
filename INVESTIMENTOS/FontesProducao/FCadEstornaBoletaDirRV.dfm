inherited frmCadEstornaBoletaDirRV: TfrmCadEstornaBoletaDirRV
  Left = 249
  Caption = 'Estorna Boleta de Direitos - Renda Variável'
  ClientHeight = 226
  ClientWidth = 364
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 364
    Height = 140
    object Label1: TLabel
      Left = 14
      Top = 33
      Width = 37
      Height = 13
      Caption = 'Boleta'
    end
    object dblBoleta: TwwDBLookupCombo
      Left = 13
      Top = 52
      Width = 337
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NUMDOCUMENTO'#9'12'#9'Boleta'#9'F'
        'DATAOPERACAO'#9'10'#9'Data'
        'DESCTIPOOPERACAO'#9'20'#9'Operação'
        'DESCINVESTIMENTO'#9'15'#9'Investimento'#9'F'
        'VLROPERACAO'#9'18'#9'Valor da Operação'#9'F')
      LookupTable = QryBoleta
      LookupField = 'NUMDOCUMENTO'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      OnChange = dblBoletaChange
      OnCloseUp = dblBoletaCloseUp
      OnExit = dblBoletaExit
    end
  end
  inherited Dock972: TDock97
    Width = 364
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 187
    Width = 364
    inherited tb97Fundo: TToolbar97
      Left = 169
      DockPos = 169
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      DockPos = 0
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 6
  end
  inherited ds: TwwDataSource
    Left = 237
    Top = 60
  end
  inherited upd: TUpdateSQL
    Left = 177
    Top = 60
  end
  inherited MontaSelect: TMontaSelect
    Caption = ''
    Colunas.Strings = (
      'OPERACAOINVEST.NUMDOCUMENTO'
      'OPERACAOINVEST.DATAOPERACAO'
      'TIPOOPERACAO.DESCTIPOOPERACAO'
      'INVESTIMENTO.DESCINVESTIMENTO'
      'OPERACAOINVEST.VLROPERACAO')
    TipodeDado.Strings = (
      'C'
      'D'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Boleta'
      'Data'
      'Operação'
      'Investimento'
      'Valor da Operação')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'OPERACAOINVEST'
      'BOLETA'
      'TIPOOPERACAO'
      'EMISSOR'
      'INVESTIMENTO')
    CamposChave.Strings = (
      'BOLETA.IDBOLETA')
    Filtro.Strings = (
      'INVESTIMENTO.IDINVESTIMENTO = OPERACAOINVEST.IDINVESTIMENTO'
      'EMISSOR.IDEMISSOR           = INVESTIMENTO.IDEMISSOR'
      'TIPOOPERACAO.IDTIPOOPERACAO = OPERACAOINVEST.IDTIPOOPERACAO'
      'BOLETA.IDBOLETA             = OPERACAOINVEST.NUMDOCUMENTO(+)'
      'OPERACAOINVEST.IDOPERACAODIREITO IS NOT NULL')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '###,###,###,###0.00')
    Larguras.Strings = (
      '12'
      '10'
      '30'
      '25'
      '16')
    UsaDistinct = True
    Left = 293
    Top = 6
  end
  inherited ImlPadrao: TImageList
    Left = 73
    Top = 6
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 246
    Top = 6
  end
  inherited qry: TwwQuery
    Left = 207
    Top = 60
  end
  object QryAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM PARAMINVEST')
    ValidateWithMask = True
    Left = 196
    Top = 156
  end
  object QryBoleta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      
        '     O.NUMDOCUMENTO, O.DATAOPERACAO, O.VLROPERACAO, O.IDOPERACAO' +
        'DIREITO,'
      '     E.SIGLAEMISSOR, T.DESCTIPOOPERACAO, I.DESCINVESTIMENTO,'
      
        '     T.IDTIPOINVEST, T.IDTIPOOPERACAO, O.QTDEOPERACAO, B.TIPMOVB' +
        'OLETA'
      'FROM'
      
        '     OPERACAOINVEST O, BOLETA B, TIPOOPERACAO T, EMISSOR E, INVE' +
        'STIMENTO I'
      'WHERE'
      '     O.IDTIPOINVEST   = 2 AND'
      '     I.IDINVESTIMENTO = O.IDINVESTIMENTO  AND'
      '     E.IDEMISSOR      = I.IDEMISSOR       AND'
      '     T.IDTIPOOPERACAO = O.IDTIPOOPERACAO  AND'
      '     B.IDBOLETA       = O.NUMDOCUMENTO(+) AND'
      '     O.IDOPERACAODIREITO IS NOT NULL'
      
        'ORDER BY DATAOPERACAO DESC, DESCTIPOOPERACAO, SIGLAEMISSOR, DESC' +
        'INVESTIMENTO'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 200
    Top = 108
    object QryBoletaNUMDOCUMENTO: TStringField
      DisplayLabel = 'Boleta'
      DisplayWidth = 12
      FieldName = 'NUMDOCUMENTO'
      Origin = 'OPERACAOINVEST.NUMDOCUMENTO'
      Size = 30
    end
    object QryBoletaDATAOPERACAO: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 10
      FieldName = 'DATAOPERACAO'
      Origin = 'OPERACAOINVEST.DATAOPERACAO'
    end
    object QryBoletaDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Operação'
      DisplayWidth = 20
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object QryBoletaDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 15
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object QryBoletaVLROPERACAO: TFloatField
      DisplayLabel = 'Valor da Operação'
      DisplayWidth = 18
      FieldName = 'VLROPERACAO'
      DisplayFormat = '###,###,###,###0.00'
    end
    object QryBoletaIDOPERACAODIREITO: TFloatField
      FieldName = 'IDOPERACAODIREITO'
      Visible = False
    end
    object QryBoletaIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Visible = False
    end
    object QryBoletaSIGLAEMISSOR: TStringField
      DisplayLabel = 'Emissor'
      DisplayWidth = 15
      FieldName = 'SIGLAEMISSOR'
      Visible = False
      Size = 15
    end
    object QryBoletaIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Visible = False
    end
    object QryBoletaQTDEOPERACAO: TFloatField
      FieldName = 'QTDEOPERACAO'
    end
    object QryBoletaTIPMOVBOLETA: TStringField
      FieldName = 'TIPMOVBOLETA'
      Size = 3
    end
  end
  object DsBoleta: TwwDataSource
    DataSet = QryBoleta
    Left = 232
    Top = 108
  end
  object QryFlgOpDireito: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '     TP.FLGOPDIREITO'
      'FROM '
      '     OPERACAOINVEST OP,'
      '     TIPOOPERACAO TP'
      'WHERE'
      '     (OP.NUMDOCUMENTO = :pNUMDOCUMENTO) AND'
      '     (OP.IDTIPOOPERACAO = TP.IDTIPOOPERACAO)'
      ''
      ''
      ''
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 128
    Top = 154
    ParamData = <
      item
        DataType = ftString
        Name = 'pNUMDOCUMENTO'
        ParamType = ptUnknown
      end>
    object QryFlgOpDireitoFLGOPDIREITO: TStringField
      FieldName = 'FLGOPDIREITO'
      Origin = 'TIPOOPERACAO.FLGOPDIREITO'
      Size = 1
    end
  end
  object QryOperacaoInvest: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDOPERACAOINVEST'
      'FROM   OPERACAOINVEST'
      'WHERE  NUMDOCUMENTO =:NUMDOCUMENTO')
    ValidateWithMask = True
    Left = 40
    Top = 153
    ParamData = <
      item
        DataType = ftString
        Name = 'NUMDOCUMENTO'
        ParamType = ptUnknown
      end>
  end
  object QryBoletaTodosRec: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      
        '     OI.NUMDOCUMENTO, OI.IDINVESTIMENTO, OI.IDCARTEIRAINVEST, OI' +
        '.DATAOPERACAO, OI.IDPLANPREVCTBPATR'
      'FROM'
      '    OPERACAOINVEST OI, BOLETA BO'
      'WHERE'
      '    OI.IDOPERACAODIREITO = :IDOPERACAODIREITO  AND'
      
        '  ((OI.IDTIPOOPERACAO    = :IDTIPOOPERACAO) OR (OI.IDTIPOOPERACA' +
        'O = (:IDTIPOOPERACAO + 10000))) AND'
      '    BO.TIPMOVBOLETA     <> '#39'DTA'#39'            AND'
      '    BO.IDBOLETA          = OI.NUMDOCUMENTO'
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 40
    Top = 60
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptResult
      end>
  end
  object QryOperacaoDireito: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '*'
      'FROM'
      '   OPERACAODIREITO'
      'WHERE'
      '   IDOPERACAODIREITO =:IDOPERACAODIREITO'
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 126
    Top = 60
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptUnknown
      end>
  end
  object QryBoletaPontaAnuncio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      
        '     OI.NUMDOCUMENTO, OI.IDINVESTIMENTO, OI.IDCARTEIRAINVEST, OI' +
        '.DATAOPERACAO'
      'FROM'
      '    OPERACAOINVEST OI, BOLETA BO'
      'WHERE'
      '    OI.IDOPERACAODIREITO = :IDOPERACAODIREITO  AND'
      '    BO.IDBOLETA          = OI.NUMDOCUMENTO     AND'
      '    BO.TIPMOVBOLETA      = '#39'DTA'#39'     '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 40
    Top = 108
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptResult
      end>
  end
end
