inherited frmAjustaSCI: TfrmAjustaSCI
  Left = 34
  Top = 158
  HelpContext = 50009
  Caption = 'Consulta  SCI/OC com unidade de medidas invalidas'
  ClientHeight = 255
  ClientWidth = 725
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 725
    Height = 216
    object Splitter1: TSplitter
      Left = 356
      Top = 5
      Width = 8
      Height = 206
      Cursor = crHSplit
    end
    object wwDBGrid1: TwwDBGrid
      Left = 5
      Top = 5
      Width = 351
      Height = 206
      Selected.Strings = (
        'NUMSOLCOMPRA'#9'10'#9'Nº SCI'
        'IDITEMSOLI'#9'10'#9'Item SCI'
        'CODARTIGO'#9'14'#9'Cód. Artigo'
        'CODMEDIDA'#9'4'#9'Unid.')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alLeft
      DataSource = dsSCI
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
    object wwDBGrid2: TwwDBGrid
      Left = 364
      Top = 5
      Width = 356
      Height = 206
      Selected.Strings = (
        'NUMOC'#9'10'#9'Nº OC'
        'IDITEMOC'#9'10'#9'Item OC'
        'CODARTIGO'#9'14'#9'Cod. Artigo'
        'CODMEDIDA'#9'4'#9'Unid.')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = dsOC
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
  end
  inherited Dock971: TDock97
    Top = 216
    Width = 725
    inherited tb97Fundo: TToolbar97
      Left = 552
      DockPos = 552
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 50009
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 755
    Top = 65531
  end
  object qryOc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    I.NUMOC, I.IDITEMOC, I.CODARTIGO, I.CODMEDIDA'
      'FROM'
      '    ITEMOC I'
      'WHERE'
      '     (I.FLGITEMATENDIDO = '#39'F'#39')'
      
        '  AND(RTRIM(I.CODMEDIDA) NOT IN (SELECT RTRIM(CODMEDIDA) FROM CO' +
        'NVER ))'
      'ORDER BY I.NUMOC'
      '')
    ValidateWithMask = True
    Left = 576
    Top = 65
  end
  object qrySCI: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    I.NUMSOLCOMPRA, I.IDITEMSOLI, I.CODARTIGO, I.CODMEDIDA'
      'FROM'
      '    ITEMSOLI I'
      'WHERE'
      '      (I.QTDEPENDENTE > 0 )'
      
        '   AND(RTRIM(I.CODMEDIDA) NOT IN (SELECT RTRIM(CODMEDIDA) FROM C' +
        'ONVER ))'
      'ORDER BY I.NUMSOLCOMPRA'
      '')
    ValidateWithMask = True
    Left = 576
    Top = 17
  end
  object dsSCI: TwwDataSource
    DataSet = qrySCI
    Left = 520
    Top = 16
  end
  object dsOC: TwwDataSource
    DataSet = qryOc
    Left = 520
    Top = 72
  end
end
