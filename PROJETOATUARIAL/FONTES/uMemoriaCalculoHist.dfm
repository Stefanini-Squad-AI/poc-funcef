inherited frmMemoriaCalculoHist: TfrmMemoriaCalculoHist
  Left = 147
  Top = 137
  HelpContext = 40246
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Base de Histórico  - Memória de Cálculo'
  ClientHeight = 281
  ClientWidth = 560
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 560
    Height = 242
    object dbGrd: TwwDBGrid
      Left = 5
      Top = 5
      Width = 550
      Height = 232
      Selected.Strings = (
        'DT_GERACAO'#9'20'#9'Data de Geração'
        'DS_HIPOTESE'#9'50'#9'Hipótese')
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      Color = clSilver
      DataSource = ds
      KeyOptions = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgRowSelect, dgCancelOnExit, dgWordWrap]
      ReadOnly = True
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
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
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
      '           a.CD_PLANO, a.DT_GERACAO, b.DS_HIPOTESE'
      'from  FI_BK_REFER_CALCULO_ATUARIAL a, FI_HIPOTESE b'
      'where a.CD_HIPOTESE = b.CD_HIPOTESE '
      '  and a.CD_VERSAO  = :CD_VERSAO'
      'order by a.DT_GERACAO desc')
    Params.Data = {010001000943445F56455253414F00030400000000000000}
    ValidateWithMask = True
    Left = 240
    Top = 25
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
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 215
    Top = 65
  end
end
O_ATUARIAL)BaseNameOC.VL_CALCULO_ATUARIALNameValorDerivedFromÿ
DimensionTypedimSumBinTypebinNone
ValueCountÿActive	
