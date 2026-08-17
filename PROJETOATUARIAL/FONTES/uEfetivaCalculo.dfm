inherited frmEfetivaCalculo: TfrmEfetivaCalculo
  Left = 191
  Top = 136
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Efetiva Cálculo Atuarial'
  ClientWidth = 575
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 575
    object dbGrd: TwwDBGrid
      Left = 1
      Top = 1
      Width = 573
      Height = 146
      Selected.Strings = (
        'DT_GERACAO'#9'20'#9'Data de Geração'
        'DS_HIPOTESE'#9'45'#9'Hipótese')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alTop
      DataSource = ds
      KeyOptions = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgCancelOnExit, dgWordWrap]
      TabOrder = 0
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
    object RdGrpSituacao: TRadioGroup
      Left = 40
      Top = 165
      Width = 356
      Height = 51
      Caption = 'Situação do Cálculo'
      Columns = 2
      ItemIndex = 1
      Items.Strings = (
        'Efetivados'
        'Não efetivados')
      TabOrder = 1
      OnClick = RdGrpSituacaoClick
    end
  end
  inherited Dock971: TDock97
    Width = 575
    inherited tb97Fundo: TToolbar97
      Left = 407
      DockPos = 409
      TabOrder = 1
    end
    object TB97oKCancelar: TToolbar97
      Left = 239
      Top = 0
      Caption = 'TB97oKCancelar'
      Color = clNone
      CloseButton = False
      DefaultDock = Dock971
      DockPos = 241
      TabOrder = 0
      object ToolbarSep971: TToolbarSep97
        Left = 80
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      object bbtnEfetivar: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&Efetiva'
        TabOrder = 0
        OnClick = bbtnEfetivarClick
        Kind = bkOK
        Spacing = 2
      end
      object bbtnExcluir: TBitBtn
        Left = 83
        Top = 0
        Width = 81
        Height = 33
        Caption = 'E&xclui'
        TabOrder = 1
        OnClick = bbtnExcluirClick
        Kind = bkCancel
        Spacing = 2
      end
    end
  end
  object qryPrincipal: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select a.*, b.DS_HIPOTESE'
      'from  FI_REFER_CALCULO_ATUARIAL a, FI_HIPOTESE b'
      'where a.CD_HIPOTESE = b.CD_HIPOTESE '
      '  and a.CD_PESSOA_ENTID = :CD_PESSOA_ENTID'
      '  and a.CD_PESSOA_PATROC  = :CD_PESSOA_PATROC'
      '  and a.CD_PLANO  = :CD_PLANO'
      '  and a.CD_VERSAO  = :CD_VERSAO'
      '  and a.IR_CALCULO_EFETIVADO = '#39'N'#39
      'order by a.DT_GERACAO desc')
    ValidateWithMask = True
    Left = 240
    Top = 25
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_PESSOA_ENTID'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PESSOA_PATROC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end>
    object qryPrincipalDT_GERACAO: TDateTimeField
      DisplayLabel = 'Data de Geração'
      DisplayWidth = 20
      FieldName = 'DT_GERACAO'
      Origin = 'FI_REFER_CALCULO_ATUARIAL.DT_GERACAO'
      DisplayFormat = 'dd/mm/yyyy hh:mm:ss'
    end
    object qryPrincipalDS_HIPOTESE: TStringField
      DisplayLabel = 'Hipótese'
      DisplayWidth = 45
      FieldName = 'DS_HIPOTESE'
      Origin = 'FI_HIPOTESE.DS_HIPOTESE'
      Size = 50
    end
    object qryPrincipalCD_PESSOA_ENTID: TFloatField
      FieldName = 'CD_PESSOA_ENTID'
      Origin = 'FI_REFER_CALCULO_ATUARIAL.CD_PESSOA_ENTID'
      Visible = False
    end
    object qryPrincipalCD_PESSOA_PATROC: TFloatField
      FieldName = 'CD_PESSOA_PATROC'
      Origin = 'FI_REFER_CALCULO_ATUARIAL.CD_PESSOA_PATROC'
      Visible = False
    end
    object qryPrincipalCD_PLANO: TFloatField
      FieldName = 'CD_PLANO'
      Origin = 'FI_REFER_CALCULO_ATUARIAL.CD_PLANO'
      Visible = False
    end
    object qryPrincipalCD_HIPOTESE: TFloatField
      FieldName = 'CD_HIPOTESE'
      Origin = 'FI_REFER_CALCULO_ATUARIAL.CD_HIPOTESE'
      Visible = False
    end
    object qryPrincipalDT_REFER_CALCULO: TDateTimeField
      FieldName = 'DT_REFER_CALCULO'
      Origin = 'FI_REFER_CALCULO_ATUARIAL.DT_REFER_CALCULO'
      Visible = False
    end
    object qryPrincipalIR_CALCULO_EFETIVADO: TStringField
      FieldName = 'IR_CALCULO_EFETIVADO'
      Origin = 'FI_REFER_CALCULO_ATUARIAL.IR_CALCULO_EFETIVADO'
      Visible = False
      Size = 1
    end
    object qryPrincipalCD_VERSAO: TFloatField
      FieldName = 'CD_VERSAO'
      Origin = 'FI_REFER_CALCULO_ATUARIAL.CD_VERSAO'
      Visible = False
    end
  end
  object ds: TwwDataSource
    AutoEdit = False
    DataSet = qryPrincipal
    Left = 269
    Top = 23
  end
  object qryEfetivaCalculo: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'Update FI_REFER_CALCULO_ATUARIAL'
      'set IR_CALCULO_EFETIVADO = '#39'S'#39
      'where DT_GERACAO = :DT_GERACAO'
      '   and CD_PESSOA_PATROC = :CD_PESSOA_PATROC'
      '   and CD_PESSOA_ENTID = :CD_PESSOA_ENTID'
      '   and CD_PLANO = :CD_PLANO'
      '   and CD_VERSAO = :CD_VERSAO')
    ValidateWithMask = True
    Left = 220
    Top = 60
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DT_GERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PESSOA_PATROC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PESSOA_ENTID'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end>
  end
  object qryCalculo: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'delete  FI_REFER_CALCULO_ATUARIAL'
      'where DT_GERACAO = :DT_GERACAO'
      '  and CD_PESSOA_ENTID = :CD_PESSOA_ENTID'
      '  and CD_PESSOA_PATROC  = :CD_PESSOA_PATROC'
      '  and CD_PLANO  = :CD_PLANO'
      '  and CD_VERSAO  = :CD_VERSAO')
    ValidateWithMask = True
    Left = 255
    Top = 60
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DT_GERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PESSOA_ENTID'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PESSOA_PATROC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end>
  end
  object qryOcorCalculo: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'delete  FI_OCOR_CALCULO_ATUARIAL'
      'where DT_GERACAO = :DT_GERACAO'
      '  and CD_PESSOA_ENTID = :CD_PESSOA_ENTID'
      '  and CD_PESSOA_PATROC  = :CD_PESSOA_PATROC'
      '  and CD_PLANO  = :CD_PLANO'
      '  and CD_VERSAO  = :CD_VERSAO')
    ValidateWithMask = True
    Left = 290
    Top = 60
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DT_GERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PESSOA_ENTID'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PESSOA_PATROC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptUnknown
      end>
  end
  object qryOpcaoCalculo: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'delete  FI_OPCAO_CALCULO_GRUPO_PARTIC'
      'where DT_GERACAO = :DT_GERACAO'
      '  and CD_PESSOA_ENTID = :CD_PESSOA_ENTID'
      '  and CD_PESSOA_PATROC  = :CD_PESSOA_PATROC'
      '  and CD_PLANO  = :CD_PLANO')
    ValidateWithMask = True
    Left = 324
    Top = 60
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'DT_GERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PESSOA_ENTID'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PESSOA_PATROC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'CD_PLANO'
        ParamType = ptUnknown
      end>
  end
end
