inherited frmMemoriaCalculo: TfrmMemoriaCalculo
  Left = 252
  Top = 287
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Memória de Cálculo'
  ClientHeight = 281
  ClientWidth = 560
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 560
    Height = 242
    object dbGrd: TwwDBGrid
      Left = 1
      Top = 1
      Width = 558
      Height = 240
      Selected.Strings = (
        'DT_GERACAO'#9'20'#9'Data de Geração'
        'DS_HIPOTESE'#9'50'#9'Hipótese')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
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
  end
  inherited Dock971: TDock97
    Top = 242
    Width = 560
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
    object bbtReCalculo: TBitBtn
      Left = 32
      Top = 0
      Width = 94
      Height = 37
      Caption = 'Recalculo'
      TabOrder = 2
      OnClick = bbtReCalculoClick
    end
  end
  object ds: TwwDataSource
    AutoEdit = False
    DataSet = qryPrincipal
    Left = 269
    Top = 23
  end
  object qryPrincipal: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select a.CD_PESSOA_ENTID, a.CD_PESSOA_PATROC,'
      '           a.CD_PLANO, a.DT_GERACAO, b.CD_HIPOTESE,'
      '           b.DS_HIPOTESE'
      'from  FI_REFER_CALCULO_ATUARIAL a, FI_HIPOTESE b'
      'where a.CD_HIPOTESE = b.CD_HIPOTESE '
      '  and a.CD_PESSOA_ENTID = :CD_PESSOA_ENTID'
      '  and a.CD_PESSOA_PATROC  = :CD_PESSOA_PATROC'
      '  and a.CD_PLANO  = :CD_PLANO'
      '  and a.CD_VERSAO  = :CD_VERSAO'
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
    object qryPrincipalDS_HIPOTESE: TStringField
      FieldName = 'DS_HIPOTESE'
      Origin = 'FI_HIPOTESE.DS_HIPOTESE'
      Size = 50
    end
    object qryPrincipalCD_HIPOTESE: TFloatField
      FieldName = 'CD_HIPOTESE'
      Origin = 'BASEDADOS.FI_HIPOTESE.CD_HIPOTESE'
    end
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 239
    Top = 65
  end
end
