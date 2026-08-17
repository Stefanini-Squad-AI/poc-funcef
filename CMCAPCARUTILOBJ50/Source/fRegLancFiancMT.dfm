inherited FrmRegLancFinancMT: TFrmRegLancFinancMT
  Left = 225
  Top = 246
  BorderStyle = bsSingle
  Caption = 'Regulariza lançamentos no financeiro'
  ClientHeight = 353
  ClientWidth = 707
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 707
    Height = 314
    object GrdFinanc: TwwDBGrid
      Left = 1
      Top = 1
      Width = 705
      Height = 312
      ControlType.Strings = (
        'REGULARIZA;CheckBox;1;0')
      Selected.Strings = (
        'REGULARIZA'#9'3'#9'Reg'
        'DATALANCFINAN'#9'9'#9'Data Lancto'
        'HISTORICO'#9'30'#9'Histórico'
        'NUMCHQBORDERO'#9'13'#9'Num Lote Receb.'
        'ENTRADASAIDA'#9'3'#9'E/S'
        'VALORLANCFINAN'#9'10'#9'Valor'
        'VALOROUTRAMOEDA'#9'10'#9'Valor O.M.')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = DsLancFinanc
      ReadOnly = True
      TabOrder = 0
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = True
      OnCalcCellColors = GrdFinancCalcCellColors
      OnTitleButtonClick = GrdFinancTitleButtonClick
      OnDblClick = GrdFinancDblClick
      OnKeyDown = GrdFinancKeyDown
      IndicatorColor = icBlack
    end
  end
  inherited Dock971: TDock97
    Top = 314
    Width = 707
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 155
    Top = 307
  end
  object DsLancFinanc: TwwDataSource
    DataSet = CdsLancFinanc
    Left = 368
    Top = 200
  end
  object SqlLancFinanc: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  (0) AS REGULARIZA,'
      '  CODLANCFINANC,  STATUSCONCILIA,'
      '  VALORLANCFINAN, VALOROUTRAMOEDA, NUMCHQBORDERO, DATALANCFINAN,'
      '  ENTRADASAIDA, HISTORICO'
      'FROM'
      '  MOVIMFINANC'
      'WHERE'
      ' CODPORTADOR = :CODPORTADOR AND'
      '  IDPESSOA = :IDPESSOA AND'
      '  STATUSCONCILIA = '#39'I'#39' AND'
      '  round(VALORLANCFINAN,2) = round(:VALORLANCFINAN,2)'
      'ORDER BY'
      '  DATALANCFINAN, NUMCHQBORDERO'
      ''
      ' ')
    ClientDataSet = CdsLancFinanc
    Left = 368
    Top = 144
  end
  object CdsLancFinanc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = CdsLancFinancAfterOpen
    Left = 368
    Top = 96
  end
end
