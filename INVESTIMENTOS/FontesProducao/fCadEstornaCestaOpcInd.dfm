inherited frmCadEstornaCestaOpcInd: TfrmCadEstornaCestaOpcInd
  Left = 288
  Top = 173
  HelpContext = 790317
  Caption = 'Operações'
  ClientHeight = 234
  ClientWidth = 338
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 338
    Height = 148
    object pnlTitulo: TPanel
      Left = 1
      Top = 1
      Width = 336
      Height = 41
      Align = alTop
      TabOrder = 0
      object lbNomItem: TfcLabel
        Left = 7
        Top = 8
        Width = 306
        Height = 24
        Caption = 'Estorna Fechamento de Cesta'
        Color = clBtnFace
        Font.Charset = ANSI_CHARSET
        Font.Color = clNavy
        Font.Height = -21
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TextOptions.Alignment = taLeftJustify
        TextOptions.Style = fclsRaised
        TextOptions.VAlignment = vaTop
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 42
      Width = 336
      Height = 67
      Align = alTop
      TabOrder = 1
      object Label1: TLabel
        Left = 8
        Top = 12
        Width = 161
        Height = 13
        Caption = 'Cesta de Opções de Índices'
      end
      object dblOpcao: TwwDBLookupCombo
        Left = 7
        Top = 28
        Width = 306
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'IDBOLETA'#9'20'#9'Boleta'#9'F'
          'DATAVIGENCIA'#9'12'#9'Data'#9'F')
        LookupTable = qryBoleta
        LookupField = 'IDBOLETA'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnChange = dblOpcaoChange
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 109
      Width = 336
      Height = 38
      Align = alClient
      TabOrder = 2
      object prbProg: TProgressBar
        Left = 1
        Top = 1
        Width = 334
        Height = 36
        Align = alClient
        Min = 0
        Max = 100
        Step = 1
        TabOrder = 0
      end
    end
  end
  inherited Dock972: TDock97
    Width = 338
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
    Top = 195
    Width = 338
    inherited tb97Fundo: TToolbar97
      Left = 169
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 32
    Top = 6
  end
  inherited ds: TwwDataSource
    Left = 131
    Top = 62
  end
  inherited upd: TUpdateSQL
    Left = 195
    Top = 70
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'CESTAOPCIND.IDBOLETA'
      'CESTAOPCIND.DATAVIGENCIA')
    TipodeDado.Strings = (
      'C'
      'D')
    Descricao.Strings = (
      'Boleta'
      'Data de Vigencia')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'CESTAOPCIND'
      'ORDEMOPCIND')
    CamposChave.Strings = (
      'CESTAOPCIND.IDBOLETA')
    Filtro.Strings = (
      
        'CESTAOPCIND.IDCESTAOPCIND || CESTAOPCIND.DATAVIGENCIA IN (SELECT' +
        ' C.IDCESTAOPCIND || MAX(C.DATAVIGENCIA ) FROM CESTAOPCIND C, PAR' +
        'AMINVEST P WHERE (C.DATAVIGENCIA <= P.DATAULTFECH + 1) AND (C.ID' +
        'BOLETA IS NOT NULL) GROUP BY IDCESTAOPCIND)'
      'CESTAOPCIND.IDBOLETA IS NOT NULL'
      'CESTAOPCIND.IDCESTAOPCIND = ORDEMOPCIND.IDCESTAOPCIND'
      'CESTAOPCIND.DATAVIGENCIA > ORDEMOPCIND.DATAORDEM')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '30'
      '18')
    UsaDistinct = True
    Left = 277
    Top = 6
  end
  inherited ImlPadrao: TImageList
    Left = 73
    Top = 6
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 236
    Top = 6
  end
  inherited qry: TwwQuery
    UpdateObject = nil
    Left = 26
    Top = 62
  end
  object qryBuscaOperCustodia: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   OP.IDOPERCUSTODIA, OP.IDHISTCARTINVDEST, OP.IDHISTCARTINVORIG' +
        ',OP.IDINVESTIMENTO,'
      '   OP.IDCARTEIRAORIG, IDCARTEIRADEST'
      'FROM'
      '   OPERCUSTODIA OP'
      'WHERE (OP.IDBOLETA = :IDBOLETA)'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 32
    Top = 159
    ParamData = <
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptUnknown
      end>
    object qryBuscaOperCustodiaIDOPERCUSTODIA: TFloatField
      FieldName = 'IDOPERCUSTODIA'
      Origin = 'BASEDADOS.OPERCUSTODIA.IDOPERCUSTODIA'
    end
    object qryBuscaOperCustodiaIDHISTCARTINVDEST: TFloatField
      FieldName = 'IDHISTCARTINVDEST'
      Origin = 'BASEDADOS.OPERCUSTODIA.IDHISTCARTINVDEST'
    end
    object qryBuscaOperCustodiaIDHISTCARTINVORIG: TFloatField
      FieldName = 'IDHISTCARTINVORIG'
      Origin = 'BASEDADOS.OPERCUSTODIA.IDHISTCARTINVORIG'
    end
    object qryBuscaOperCustodiaIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = 'BASEDADOS.OPERCUSTODIA.IDINVESTIMENTO'
    end
    object qryBuscaOperCustodiaIDCARTEIRAORIG: TFloatField
      FieldName = 'IDCARTEIRAORIG'
      Origin = 'OPERCUSTODIA.IDCARTEIRAORIG'
    end
    object qryBuscaOperCustodiaIDCARTEIRADEST: TFloatField
      FieldName = 'IDCARTEIRADEST'
      Origin = 'OPERCUSTODIA.IDCARTEIRADEST'
    end
  end
  object dsBuscaOperCustodia: TwwDataSource
    DataSet = qryBuscaOperCustodia
    Left = 131
    Top = 158
  end
  object qryBoleta: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CD.DATAVIGENCIA, CD.IDBOLETA'
      'FROM'
      '   CESTAOPCIND CD, ORDEMOPCIND OD'
      'WHERE'
      
        '   CD.IDCESTAOPCIND || CD.DATAVIGENCIA IN (SELECT C.IDCESTAOPCIN' +
        'D || MAX(C.DATAVIGENCIA )'
      
        '                                           FROM CESTAOPCIND C, P' +
        'ARAMINVEST P'
      
        '                                           WHERE C.DATAVIGENCIA ' +
        '<= P.DATAULTFECH + 1'
      
        '                                             AND C.IDBOLETA IS N' +
        'OT NULL'
      
        '                                           GROUP BY IDCESTAOPCIN' +
        'D)'
      '   AND (CD.IDBOLETA IS NOT NULL)'
      '   AND (CD.IDCESTAOPCIND = OD.IDCESTAOPCIND)'
      '   AND (CD.DATAVIGENCIA > OD.DATAORDEM)'
      'GROUP BY'
      '   CD.DATAVIGENCIA, CD.IDBOLETA'
      'ORDER BY CD.DATAVIGENCIA'
      ' '
      ' ')
    UpdateObject = upd
    ValidateWithMask = True
    Left = 26
    Top = 110
    object qryBoletaIDBOLETA: TStringField
      DisplayLabel = 'Boleta'
      DisplayWidth = 20
      FieldName = 'IDBOLETA'
      Size = 30
    end
    object qryBoletaDATAVIGENCIA: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 12
      FieldName = 'DATAVIGENCIA'
    end
  end
  object dsBoleta: TwwDataSource
    DataSet = qryBoleta
    Left = 131
    Top = 118
  end
end
