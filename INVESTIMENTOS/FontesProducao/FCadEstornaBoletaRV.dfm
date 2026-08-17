inherited frmCadEstornaBoletaRV: TfrmCadEstornaBoletaRV
  Left = 340
  Top = 163
  HelpContext = 790281
  Caption = 'Estorna Boleta - Renda Variável'
  ClientHeight = 189
  ClientWidth = 364
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 364
    Height = 103
    object Label1: TLabel
      Left = 15
      Top = 12
      Width = 37
      Height = 13
      Caption = 'Boleta'
    end
    object dblBoleta: TwwDBLookupCombo
      Left = 14
      Top = 29
      Width = 337
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NUMDOCUMENTO'#9'15'#9'Boleta'#9'F'
        'DATAOPERACAO'#9'10'#9'Data'#9'F'
        'TIPMOVBOLETA'#9'5'#9'Tipo'#9'F'
        'DESCINVESTIMENTO'#9'30'#9'Investimento'#9'F')
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
    object chkExcluiHist: TCheckBox
      Left = 14
      Top = 62
      Width = 219
      Height = 17
      Caption = 'Exclui Históricos Posteriores'
      Checked = True
      State = cbChecked
      TabOrder = 1
      Visible = False
    end
    object pnlProgresso: TPanel
      Left = 1
      Top = 61
      Width = 362
      Height = 41
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 2
      Visible = False
      object Label2: TLabel
        Left = 14
        Top = 3
        Width = 180
        Height = 13
        Caption = 'Excluindo históricos posteriores'
      end
      object pgbExclusao: TProgressBar
        Left = 14
        Top = 20
        Width = 334
        Height = 16
        Min = 0
        Max = 100
        TabOrder = 0
      end
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
    Top = 150
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
    Left = 20
    Top = 53
    TargetsData = (
      1
      2
      (
        ''
        'Filter'
        0)
      (
        ''
        'DisplayLabel'
        0))
  end
  inherited ds: TwwDataSource
    Left = 253
  end
  inherited upd: TUpdateSQL
    Left = 193
  end
  inherited MontaSelect: TMontaSelect
    Caption = ''
    Colunas.Strings = (
      'BOLETA.IDBOLETA'
      'BOLETA.DATABOLETA'
      'BOLETA.STATUS'
      'PESSOA.NOME')
    TipodeDado.Strings = (
      'C'
      'D'
      'C'
      'C')
    Descricao.Strings = (
      'Boleta'
      'Data'
      'Status'
      'Corretora')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'BOLETA'
      'OPERACAOINVEST')
    CamposChave.Strings = (
      'BOLETA.IDBOLETA'
      'BOLETA.DATABOLETA')
    Filtro.Strings = (
      'BOLETA.IDFORCLI = PESSOA.IDPESSOA(+)'
      'BOLETA.STATUS IS NOT NULL'
      'BOLETA.IDBOLETA = OPERACAOINVEST.NUMDOCUMENTO'
      'OPERACAOINVEST.IDOPERACAODIREITO IS NULL')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '23'
      '15'
      '5'
      '50')
    UsaDistinct = True
    Left = 37
    Top = 6
  end
  inherited ImlPadrao: TImageList
    Left = 81
    Top = 54
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 86
    Top = 7
  end
  inherited qry: TwwQuery
    Left = 223
  end
  object DsBoleta: TwwDataSource
    DataSet = QryBoleta
    Left = 128
    Top = 63
  end
  object QryAux1: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM PARAMINVEST')
    ValidateWithMask = True
    Left = 260
    Top = 145
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
    Left = 44
    Top = 145
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
  object QryBuscaCartTerc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM'
      '  ORDMOVINV O, CARTEIRAINVEST C'
      'WHERE'
      '   O.STAAUTORIZA        = '#39'A'#39'                         AND'
      '(((:IDPLANPREVCTBPATR IS NOT NULL)                    AND'
      '  (O.IDPLANPREVCTBPATR  = :IDPLANPREVCTBPATR))        OR'
      '  (:IDPLANPREVCTBPATR IS NULL) )                      AND'
      '  O.DATAORDMOVINV LIKE TO_DATE(:STRDATA,'#39'DD/MM/YYYY'#39') AND'
      '   C.IDCARTEIRAINVEST   = O.IDCARTEIRAINVEST          AND'
      '   C.FLGCARTTERC        = '#39'S'#39
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 129
    Top = 145
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'STRDATA'
        ParamType = ptUnknown
      end>
  end
  object QryBoleta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   DISTINCT O.NUMDOCUMENTO, O.DATAOPERACAO, O.IDTIPOINVEST, B.TI' +
        'PMOVBOLETA,'
      
        '   DECODE(B.TIPMOVBOLETA,'#39'AJQ'#39',(SELECT DESCINVESTIMENTO FROM INV' +
        'ESTIMENTO I WHERE  I.IDINVESTIMENTO = O.IDINVESTIMENTO),'#39#39') AS D' +
        'ESCINVESTIMENTO'
      'FROM'
      '   OPERACAOINVEST O, BOLETA B, OPERCONTACOES OP'
      'WHERE'
      '   O.IDTIPOINVEST = 2'
      '   AND B.IDBOLETA = O.NUMDOCUMENTO'
      '   AND B.STATUS IS NOT NULL'
      '   AND O.IDOPERACAODIREITO IS NULL'
      '   AND B.TIPMOVBOLETA NOT IN ('#39'TRP'#39', '#39'TRI'#39')'
      '   AND (O.IDOPERCONTACOES IS NULL)'
      '   AND (O.IDOPERCONTACOES = OP.IDOPERCONTACOES(+))'
      'ORDER BY   DATAOPERACAO DESC'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 128
    Top = 51
    object QryBoletaNUMDOCUMENTO: TStringField
      DisplayLabel = 'Boleta'
      DisplayWidth = 15
      FieldName = 'NUMDOCUMENTO'
      Origin = 'BASEDADOS.OPERACAOINVEST.NUMDOCUMENTO'
      Size = 30
    end
    object QryBoletaDATAOPERACAO: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 10
      FieldName = 'DATAOPERACAO'
      Origin = 'BASEDADOS.OPERACAOINVEST.DATAOPERACAO'
    end
    object QryBoletaTIPMOVBOLETA: TStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 5
      FieldName = 'TIPMOVBOLETA'
      Origin = 'BASEDADOS.BOLETA.TIPMOVBOLETA'
      Size = 3
    end
    object QryBoletaDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 30
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object QryBoletaIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'BASEDADOS.OPERACAOINVEST.IDTIPOINVEST'
      Visible = False
    end
  end
  object qryBuscaOperBoleta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT DISTINCT O.IDINVESTIMENTO, O.IDCARTEIRAINVEST, O.DATAOPER' +
        'ACAO, O.IDPLANPREVCTBPATR,'
      '                O.IDCUSTODIANTE'
      'FROM OPERACAOINVEST O'
      'WHERE O.NUMDOCUMENTO = :BOLETA'
      'ORDER BY O.IDINVESTIMENTO, O.IDCARTEIRAINVEST'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 204
    Top = 145
    ParamData = <
      item
        DataType = ftString
        Name = 'BOLETA'
        ParamType = ptResult
      end>
    object qryBuscaOperBoletaIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = 'BASEDADOS.OPERACAOINVEST.IDINVESTIMENTO'
    end
    object qryBuscaOperBoletaIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'BASEDADOS.OPERACAOINVEST.IDCARTEIRAINVEST'
    end
    object qryBuscaOperBoletaDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
      Origin = 'BASEDADOS.OPERACAOINVEST.DATAOPERACAO'
    end
    object qryBuscaOperBoletaIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
    end
    object qryBuscaOperBoletaIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
      Origin = 'BASEDADOS.OPERACAOINVEST.IDCUSTODIANTE'
    end
  end
  object qryBuscaDirCancAut: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT O.NUMDOCUMENTO'
      'FROM OPERACAOINVEST O'
      'WHERE'
      '    O.IDINVESTIMENTO    =:IDINVESTIMENTO'
      'AND O.IDCARTEIRAINVEST  =:IDCARTEIRAINVEST'
      'AND O.IDPLANPREVCTBPATR =:IDPLANPREVCTBPATR'
      'AND O.IDCUSTODIANTE     =:IDCUSTODIANTE'
      'AND O.DATAOPERACAO      = TO_DATE(:DATAOPERACAO,'#39'DD/MM/YYYY'#39')'
      'AND O.FLGSTATUSORDMOV   = '#39'V'#39
      ' '
      ' ')
    ValidateWithMask = True
    Left = 236
    Top = 97
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCUSTODIANTE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptInput
      end>
  end
end
