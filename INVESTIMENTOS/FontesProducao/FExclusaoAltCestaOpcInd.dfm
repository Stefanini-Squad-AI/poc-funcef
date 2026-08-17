inherited frmExclusaoAltCestaOpcInd: TfrmExclusaoAltCestaOpcInd
  Left = 299
  Top = 184
  HelpContext = 790315
  Caption = 'Operação'
  ClientHeight = 248
  ClientWidth = 468
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 468
    Height = 162
    inherited Bevel2: TBevel
      Width = 466
    end
    object lblCestaOpcInd: TLabel [1]
      Left = 16
      Top = 76
      Width = 161
      Height = 13
      Caption = 'Cesta de Opções de Índices'
    end
    inherited pnlTitulo: TPanel
      Width = 466
      inherited lbNomItem: TfcLabel
        Left = 11
        Width = 436
        Caption = 'Exclusão de Alteração de Cesta de Opções'
      end
    end
    object dblOpcao: TwwDBLookupCombo
      Left = 16
      Top = 94
      Width = 432
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'INVEST'#9'56'#9'Opção'#9'F')
      LookupTable = qry
      LookupField = 'IDBOLETA'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 1
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      OnChange = dblOpcaoChange
    end
  end
  inherited Dock972: TDock97
    Width = 468
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
    Top = 209
    Width = 468
    inherited tb97Fundo: TToolbar97
      Left = 296
      DockPos = 466
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 127
      DockPos = 297
    end
  end
  inherited ds: TwwDataSource
    Left = 406
    Top = 2
  end
  inherited upd: TUpdateSQL
    Left = 434
    Top = 2
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'INVESTIMENTO.DESCINVESTIMENTO'
      'CESTAOPCIND.DATAVIGENCIA')
    TipodeDado.Strings = (
      'C'
      'D')
    Descricao.Strings = (
      'Opção'
      'Vigência')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'CESTAOPCIND'
      'ORDEMOPCIND'
      'INVESTIMENTO')
    CamposChave.Strings = (
      'CESTAOPCIND.IDCESTAOPCIND'
      'CESTAOPCIND.DATAVIGENCIA')
    Filtro.Strings = (
      'CESTAOPCIND.DATAVIGENCIA > ORDEMOPCIND.DATAORDEM'
      'CESTAOPCIND.IDCESTAOPCIND = ORDEMOPCIND.IDCESTAOPCIND'
      'ORDEMOPCIND.IDINVESTIMENTO = INVESTIMENTO.IDINVESTIMENTO'
      
        'CESTAOPCIND.IDCESTAOPCIND || CESTAOPCIND.DATAVIGENCIA IN (SELECT' +
        ' C.IDCESTAOPCIND || MAX(C.DATAVIGENCIA ) FROM CESTAOPCIND C, PAR' +
        'AMINVEST P WHERE (C.DATAVIGENCIA <= P.DATAULTFECH + 1) GROUP BY ' +
        'IDCESTAOPCIND)'
      'CESTAOPCIND.IDBOLETA IS NULL')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '60'
      '25')
    UsaDistinct = True
    Left = 325
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      
        '   IV.DESCINVESTIMENTO ||'#39' - Vigência : '#39'|| TO_CHAR(CD.DATAVIGEN' +
        'CIA,'#39'DD/MM/YYYY'#39')  AS INVEST,'
      '   OD.IDORDEMOPCIND, OD.IDINVESTIMENTO AS IDINVESTOPC,'
      '   IV.DESCINVESTIMENTO,'
      '   CD.IDBOLETA, CD.DATAVIGENCIA, OD.IDCESTAOPCIND'
      'FROM'
      '   CESTAOPCIND CD, ORDEMOPCIND OD, INVESTIMENTO IV'
      'WHERE'
      
        '   CD.IDCESTAOPCIND || CD.DATAVIGENCIA IN (SELECT C.IDCESTAOPCIN' +
        'D || MAX(C.DATAVIGENCIA )'
      
        '                                           FROM CESTAOPCIND C, P' +
        'ARAMINVEST P'
      
        '                                           GROUP BY IDCESTAOPCIN' +
        'D)'
      '   AND (CD.DATAVIGENCIA > OD.DATAORDEM)'
      '   AND (CD.IDCESTAOPCIND = OD.IDCESTAOPCIND)'
      '   AND (CD.IDBOLETA IS NULL)'
      '   AND (OD.IDINVESTIMENTO = IV.IDINVESTIMENTO)'
      'GROUP BY'
      '   OD.IDORDEMOPCIND, OD.IDINVESTIMENTO,'
      '   IV.DESCINVESTIMENTO,'
      '   CD.IDBOLETA,CD.DATAVIGENCIA, OD.IDCESTAOPCIND'
      'ORDER BY CD.DATAVIGENCIA'
      ''
      ' '
      ' '
      ' '
      ' '
      ''
      ' '
      ' '
      ' ')
    UpdateObject = nil
    Left = 378
    Top = 2
    object qryINVEST: TStringField
      DisplayLabel = 'Opção'
      DisplayWidth = 56
      FieldName = 'INVEST'
      Size = 84
    end
    object qryIDORDEMOPCIND: TFloatField
      DisplayWidth = 10
      FieldName = 'IDORDEMOPCIND'
      Visible = False
    end
    object qryIDINVESTOPC: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINVESTOPC'
      Visible = False
    end
    object qryDESCINVESTIMENTO: TStringField
      DisplayWidth = 60
      FieldName = 'DESCINVESTIMENTO'
      Visible = False
      Size = 60
    end
    object qryIDBOLETA: TStringField
      DisplayWidth = 30
      FieldName = 'IDBOLETA'
      Visible = False
      Size = 30
    end
    object qryDATAVIGENCIA: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATAVIGENCIA'
      Visible = False
    end
    object qryIDCESTAOPCIND: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCESTAOPCIND'
      Visible = False
    end
  end
  object qryOrdemOpcInd: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   OD.DATAORDEM, IV.DESCINVESTIMENTO, OD.IDCESTAOPCIND,'
      '   OD.IDINVESTIMENTO, OD.IDTIPOOPERACAO, OD.IDLOTE, OD.IDBOLETA'
      'FROM ORDEMOPCIND OD, INVESTIMENTO IV, OPCOES OP,'
      '     (SELECT DISTINCT IDCESTAOPCIND, DATAVIGENCIA, IDBOLETA'
      '      FROM  CESTAOPCIND C1'
      '      WHERE ((C1.IDCESTAOPCIND || C1.DATAVIGENCIA) IN'
      
        '                 (SELECT C2.IDCESTAOPCIND || MAX(C2.DATAVIGENCIA' +
        ')'
      '                  FROM CESTAOPCIND C2'
      
        '                  WHERE DATAVIGENCIA <= TO_DATE(:DATAFECHTO,'#39'DD/' +
        'MM/YYYY'#39')'
      '                  GROUP BY IDCESTAOPCIND))) CO'
      'WHERE OD.IDINVESTIMENTO = IV.IDINVESTIMENTO'
      '  AND OD.IDTIPOOPERACAO = -86'
      '  AND OD.STATUS         = '#39'F'#39
      '  AND OD.IDCESTAOPCIND IS NOT NULL'
      '  AND OD.DATAORDEM      < TO_DATE(:DATAFECHTO,'#39'DD/MM/YYYY'#39')'
      '  AND OP.DTAVENCTO     >= TO_DATE(:DATAFECHTO,'#39'DD/MM/YYYY'#39')'
      '  AND OD.IDCESTAOPCIND = CO.IDCESTAOPCIND'
      '  AND CO.IDBOLETA IS NULL'
      '  AND OP.IDINVESTIMENTO = OD.IDINVESTIMENTO'
      'ORDER BY IV.DESCINVESTIMENTO'
      ' ')
    ValidateWithMask = True
    Left = 521
    Top = 3
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAFECHTO'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAFECHTO'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAFECHTO'
        ParamType = ptResult
      end>
    object qryOrdemOpcIndDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldName = 'DESCINVESTIMENTO'
      Origin = 'INVESTIMENTO.DESCINVESTIMENTO'
      Size = 60
    end
    object qryOrdemOpcIndDATAORDEM: TDateTimeField
      DisplayLabel = 'Data da Operação'
      DisplayWidth = 15
      FieldName = 'DATAORDEM'
    end
    object qryOrdemOpcIndIDCESTAOPCIND: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCESTAOPCIND'
      Origin = 'ORDEMOPCIND.IDCESTAOPCIND'
      Visible = False
    end
    object qryOrdemOpcIndIDINVESTIMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINVESTIMENTO'
      Origin = 'ORDEMOPCIND.IDINVESTIMENTO'
      Visible = False
    end
    object qryOrdemOpcIndIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Visible = False
    end
    object qryOrdemOpcIndIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Size = 10
    end
    object qryOrdemOpcIndIDBOLETA: TStringField
      FieldName = 'IDBOLETA'
      Size = 30
    end
  end
end
