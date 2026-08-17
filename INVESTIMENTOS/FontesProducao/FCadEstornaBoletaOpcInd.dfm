inherited frmCadEstornaBoletaOpcInd: TfrmCadEstornaBoletaOpcInd
  Left = 299
  Top = 179
  HelpContext = 790313
  Caption = 'Estorna Boleta - Opções de Índices'
  ClientHeight = 215
  ClientWidth = 325
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 325
    Height = 129
    object pnlDados: TPanel
      Left = 1
      Top = 1
      Width = 323
      Height = 59
      Align = alTop
      TabOrder = 0
      object Label1: TLabel
        Left = 4
        Top = 7
        Width = 37
        Height = 13
        Caption = 'Boleta'
      end
      object dblBoleta: TwwDBLookupCombo
        Left = 4
        Top = 23
        Width = 306
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'IDBOLETA'#9'20'#9'Boleta'#9'F'
          'DATAOPERACAO'#9'12'#9'Data da Operação'#9'F')
        LookupTable = QryBoleta
        LookupField = 'IDBOLETA'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnChange = dblBoletaChange
      end
    end
    object pnlBarras: TPanel
      Left = 1
      Top = 60
      Width = 323
      Height = 68
      Align = alClient
      TabOrder = 1
      object pnlBarraBoleta: TPanel
        Left = 1
        Top = 1
        Width = 321
        Height = 35
        Align = alTop
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 0
        object lblBoleta: TfcLabel
          Left = 2
          Top = 2
          Width = 114
          Height = 31
          Align = alLeft
          AutoSize = False
          TextOptions.Alignment = taCenter
          TextOptions.VAlignment = vaVCenter
          TextOptions.WordWrap = True
        end
        object prbBoletas: TProgressBar
          Left = 116
          Top = 2
          Width = 203
          Height = 31
          Align = alClient
          Min = 0
          Max = 100
          Step = 1
          TabOrder = 0
        end
      end
      object pnlBarraProgresso: TPanel
        Left = 1
        Top = 36
        Width = 321
        Height = 31
        Align = alClient
        BevelInner = bvRaised
        BevelOuter = bvLowered
        TabOrder = 1
        object prbExclusao: TProgressBar
          Left = 2
          Top = 2
          Width = 317
          Height = 27
          Align = alClient
          Min = 0
          Max = 100
          Step = 1
          TabOrder = 0
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 325
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Enabled = False
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Enabled = False
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Enabled = False
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 176
    Width = 325
    inherited tb97Fundo: TToolbar97
      Left = 169
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      inherited ToolbarSep971: TToolbarSep97
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 248
    Top = 6
  end
  inherited ds: TwwDataSource
    Left = 43
    Top = 6
  end
  inherited upd: TUpdateSQL
    Left = 71
    Top = 6
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Procura Boleta'
    Colunas.Strings = (
      'OPERACAOOPCIND.IDBOLETA'
      'OPERACAOOPCIND.DATAOPERACAO')
    TipodeDado.Strings = (
      'C'
      'D')
    Descricao.Strings = (
      'Boleta'
      'Data')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'BOLETA'
      'ORDEMOPCIND'
      'OPERACAOOPCIND')
    CamposChave.Strings = (
      'OPERACAOOPCIND.DATAOPERACAO'
      'OPERACAOOPCIND.IDBOLETA'
      'BOLETA.PLNCODIGO'
      'BOLETA.CODDOCUMENTO')
    Filtro.Strings = (
      'ORDEMOPCIND.STATUS = '#39'F'#39
      'OPERACAOOPCIND.IDBOLETA = ORDEMOPCIND.IDBOLETA'
      'OPERACAOOPCIND.IDBOLETA = BOLETA.IDBOLETA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '30'
      '18')
    UsaDistinct = True
    Left = 165
    Top = 65534
  end
  inherited ImlPadrao: TImageList
    Left = 153
    Top = 65534
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 156
    Top = 65526
  end
  inherited qry: TwwQuery
    Left = 15
    Top = 6
  end
  object QryBoleta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   DISTINCT OP.IDBOLETA, OP.DATAOPERACAO, BO.PLNCODIGO, BO.CODDO' +
        'CUMENTO'
      'FROM'
      '   OPERACAOOPCIND OP, ORDEMOPCIND OD, BOLETA BO'
      'WHERE'
      '   (OD.STATUS = '#39'F'#39')           AND'
      '   (OP.IDBOLETA = OD.IDBOLETA) AND'
      '   (OP.IDBOLETA = BO.IDBOLETA)'
      'ORDER BY OP.DATAOPERACAO DESC'
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 177
    Top = 118
    object QryBoletaIDBOLETA: TStringField
      DisplayLabel = 'Boleta'
      DisplayWidth = 20
      FieldName = 'IDBOLETA'
      Origin = 'BASEDADOS.OPERACAOOPCIND.IDBOLETA'
      Size = 30
    end
    object QryBoletaDATAOPERACAO: TDateTimeField
      DisplayLabel = 'Data da Operação'
      DisplayWidth = 12
      FieldName = 'DATAOPERACAO'
      Origin = 'BASEDADOS.OPERACAOOPCIND.DATAOPERACAO'
    end
    object QryBoletaPLNCODIGO: TFloatField
      DisplayWidth = 10
      FieldName = 'PLNCODIGO'
      Origin = 'BASEDADOS.BOLETA.PLNCODIGO'
      Visible = False
    end
    object QryBoletaCODDOCUMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'CODDOCUMENTO'
      Origin = 'BASEDADOS.BOLETA.CODDOCUMENTO'
      Visible = False
    end
  end
  object DsBoleta: TwwDataSource
    DataSet = QryBoleta
    Left = 237
    Top = 118
  end
  object qryBuscaCestasFuturas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDCESTAOPCIND, IDBOLETA, DATAVIGENCIA'
      'FROM  CESTAOPCIND'
      'WHERE IDCESTAOPCIND IN (SELECT IDCESTAOPCIND'
      '                        FROM  ORDEMOPCIND'
      '                        WHERE IDBOLETA = :IDBOLETA'
      '                          AND IDCESTAOPCIND IS NOT NULL'
      '                        GROUP BY IDCESTAOPCIND)'
      '  AND DATAVIGENCIA > TO_DATE(:DATAVIGENCIA, '#39'DD/MM/YYYY'#39')'
      '  AND IDBOLETA IS NOT NULL'
      'GROUP BY IDCESTAOPCIND, IDBOLETA, DATAVIGENCIA'
      'ORDER BY DATAVIGENCIA DESC'
      ' ')
    ValidateWithMask = True
    Left = 61
    Top = 118
    ParamData = <
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAVIGENCIA'
        ParamType = ptResult
      end>
    object qryBuscaCestasFuturasIDCESTAOPCIND: TFloatField
      FieldName = 'IDCESTAOPCIND'
    end
    object qryBuscaCestasFuturasIDBOLETA: TStringField
      FieldName = 'IDBOLETA'
      Size = 30
    end
    object qryBuscaCestasFuturasDATAVIGENCIA: TDateTimeField
      FieldName = 'DATAVIGENCIA'
    end
  end
  object qryBuscaBoletasFuturas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   DISTINCT OP.IDBOLETA, OP.DATAOPERACAO, BO.PLNCODIGO, BO.CODDO' +
        'CUMENTO'
      'FROM'
      '   OPERACAOOPCIND OP, ORDEMOPCIND OD, BOLETA BO'
      'WHERE (OD.STATUS = '#39'F'#39') '
      '  AND (OP.IDBOLETA = OD.IDBOLETA) '
      '  AND (OP.IDBOLETA = BO.IDBOLETA) '
      
        '  AND ((OP.DATAOPERACAO > TO_DATE(:DATAOPERACAO,'#39'DD/MM/YYYY'#39')) O' +
        'R'
      
        '       ((OP.DATAOPERACAO = TO_DATE(:DATAOPERACAO,'#39'DD/MM/YYYY'#39')) ' +
        'AND (OP.IDBOLETA = :IDBOLETA)))'
      'ORDER BY OP.DATAOPERACAO DESC'
      ' ')
    ValidateWithMask = True
    Left = 64
    Top = 71
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptResult
      end>
    object qryBuscaBoletasFuturasIDBOLETA: TStringField
      FieldName = 'IDBOLETA'
      Size = 30
    end
    object qryBuscaBoletasFuturasDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
    end
    object qryBuscaBoletasFuturasPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
    end
    object qryBuscaBoletasFuturasCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
  end
  object qryBuscaBoletaTRC: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '   IDBOLETA'
      'FROM'
      '   CESTAOPCIND'
      'WHERE'
      
        '   IDCESTAOPCIND IN  (SELECT IDCESTAOPCIND FROM ORDEMOPCIND WHER' +
        'E IDBOLETA = :IDBOLETA)  AND'
      '   DATAVIGENCIA    = (SELECT MAX(DATAVIGENCIA)'
      #9#9'      FROM CESTAOPCIND'
      #9#9'      WHERE'
      #9#9'         (IDCESTAOPCIND IN (SELECT IDCESTAOPCIND'
      '                                            FROM ORDEMOPCIND'
      
        '                                            WHERE IDBOLETA = :ID' +
        'BOLETA)) AND'
      
        #9#9'         (DATAVIGENCIA  = TO_DATE(:DATAVIGENCIA,'#39'DD/MM/YYYY'#39'))' +
        ')'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 176
    Top = 71
    ParamData = <
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'IDBOLETA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'DATAVIGENCIA'
        ParamType = ptResult
      end>
    object qryBuscaBoletaTRCIDBOLETA: TStringField
      FieldName = 'IDBOLETA'
      Size = 30
    end
  end
end
