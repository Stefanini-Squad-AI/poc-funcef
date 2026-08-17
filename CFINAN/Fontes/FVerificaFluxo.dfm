inherited frmVerificaFluxo: TfrmVerificaFluxo
  Left = 229
  Top = 213
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Verificação de Montagem de Fluxo de Caixa'
  ClientHeight = 441
  ClientWidth = 640
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 640
    Height = 402
    object Panel1: TPanel
      Left = 5
      Top = 5
      Width = 630
      Height = 28
      Align = alTop
      BevelInner = bvLowered
      Caption = 
        'Tipos de Recebimento/Desembolso que ainda não fazem parte do Flu' +
        'xo '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clRed
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object dbgdTipoRecDes: TwwDBGrid
      Left = 5
      Top = 33
      Width = 630
      Height = 303
      Selected.Strings = (
        'SELECIONADO'#9'2'#9'Ok'
        'CODTIPRECDES'#9'13'#9'Código'
        'DESCRICAO'#9'51'#9'Recebimento/Desembolso'
        'RECPAG'#9'4'#9'Tipo')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = dsTipoRecdes
      TabOrder = 1
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
    object Panel2: TPanel
      Left = 5
      Top = 336
      Width = 630
      Height = 61
      Align = alBottom
      BevelInner = bvLowered
      TabOrder = 2
      object rgModoInclusao: TRadioGroup
        Left = 405
        Top = 2
        Width = 217
        Height = 57
        Caption = 'Modo de Inclusão'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ItemIndex = 0
        Items.Strings = (
          'Inclui em uma Nova Linha'
          'Inclui em uma Linha já Existente')
        ParentFont = False
        TabOrder = 2
      end
      object rgTipo: TRadioGroup
        Left = 183
        Top = 2
        Width = 215
        Height = 57
        Caption = 'Tipo de Recebimento/Desembolso'
        ItemIndex = 0
        Items.Strings = (
          'Tipo de Rec/Des'
          'Tipo de Doc. Rec/Des')
        TabOrder = 1
        OnClick = rgTipoClick
      end
      object rgFaltantes: TRadioGroup
        Left = 7
        Top = 2
        Width = 167
        Height = 57
        Caption = 'Faltantes'
        ItemIndex = 0
        Items.Strings = (
          'Tipo de Rec/Des'
          'Tipo de Doc. Rec/Des')
        TabOrder = 0
        OnClick = rgFaltantesClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 402
    Width = 640
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 355
    Top = 171
  end
  object dsTipoRecdes: TDataSource
    DataSet = qryTipoRecDes
    Left = 136
    Top = 112
  end
  object qryTipoRecDes: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      ' SELECT'
      '    '#39'N'#39' AS Selecionado,'
      '    CODTIPRECDES,'
      '    DESCRICAO,'
      '    RECPAG'
      ' FROM'
      '    TIPORECEBDESEMB'
      ' WHERE'
      '    (ANASINT = :Tipo) AND'
      '    (IDPESSOA = :IDPessoa)'
      'MINUS'
      ' SELECT'
      '    '#39'N'#39' AS Selecionado,'
      '    T.CODTIPRECDES,'
      '    T.DESCRICAO,'
      '    T.RECPAG'
      ' FROM'
      '    TIPORECEBDESEMB T,'
      '    COMPFLUXO C'
      ' WHERE'
      '    (T.ANASINT = :Tipo) AND'
      '    (T.IDPESSOA = :IDPessoa) AND'
      '    (C.IDPESSOA = :IDPessoa) AND'
      
        '    (SubStr(T.CodTipRecDes,1,Length(RTrim(C.CodTipRecdes)))=RTri' +
        'm(C.CodTipRecDes)) AND'
      '    (T.RECPAG=C.RECPAG)'
      'ORDER BY RECPAG,DESCRICAO'
      ' '
      ' '
      ' ')
    UpdateObject = updTipoRecDes
    ControlType.Strings = (
      'SELECIONADO;CheckBox;S;N')
    ValidateWithMask = True
    Left = 56
    Top = 112
    ParamData = <
      item
        DataType = ftString
        Name = 'Tipo'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDPessoa'
        ParamType = ptInput
        Value = '1'
      end
      item
        DataType = ftString
        Name = 'Tipo'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDPessoa'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDPessoa'
        ParamType = ptInput
      end>
    object qryTipoRecDesSELECIONADO: TStringField
      DisplayLabel = 'Ok'
      DisplayWidth = 2
      FieldName = 'SELECIONADO'
      OnChange = qryTipoRecDesSELECIONADOChange
      FixedChar = True
      Size = 1
    end
    object qryTipoRecDesCODTIPRECDES: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 13
      FieldName = 'CODTIPRECDES'
      FixedChar = True
      Size = 15
    end
    object qryTipoRecDesDESCRICAO: TStringField
      DisplayLabel = 'Recebimento/Desembolso'
      DisplayWidth = 51
      FieldName = 'DESCRICAO'
      Size = 35
    end
    object qryTipoRecDesRECPAG: TStringField
      DisplayLabel = 'Tipo'
      DisplayWidth = 4
      FieldName = 'RECPAG'
      FixedChar = True
      Size = 1
    end
  end
  object updTipoRecDes: TUpdateSQL
    Left = 216
    Top = 112
  end
end
