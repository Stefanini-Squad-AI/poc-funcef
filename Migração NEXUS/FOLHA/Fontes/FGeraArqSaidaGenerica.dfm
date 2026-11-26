inherited FrmOkCancelar1: TFrmOkCancelar1
  Left = 233
  Top = 127
  Caption = 'FrmOkCancelar1'
  ClientHeight = 392
  ClientWidth = 641
  PixelsPerInch = 120
  TextHeight = 16
  inherited pnlFundo: TPanel
    Width = 641
    Height = 345
    object Panel1: TPanel
      Left = 5
      Top = 75
      Width = 631
      Height = 214
      Align = alClient
      BevelInner = bvLowered
      TabOrder = 0
      object dbgParametros: TwwDBGrid
        Left = 2
        Top = 2
        Width = 627
        Height = 210
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dsParametros
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
    end
    object grbSaidaGenerica: TGroupBox
      Left = 5
      Top = 5
      Width = 631
      Height = 70
      Align = alTop
      Caption = 'Escolha a Saída Genérica'
      TabOrder = 1
      object dblkSaidaGenerica: TwwDBLookupCombo
        Left = 20
        Top = 26
        Width = 539
        Height = 24
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'50'#9'Descrição'#9'F')
        LookupTable = qrySaidaGenerica
        LookupField = 'IDSAIDA'
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
    end
    object Panel2: TPanel
      Left = 5
      Top = 289
      Width = 631
      Height = 51
      Align = alBottom
      TabOrder = 2
      object BevelArqGerado: TBevel
        Left = 228
        Top = 14
        Width = 288
        Height = 27
      end
      object lblCaminho: TLabel
        Left = 6
        Top = 20
        Width = 215
        Height = 16
        Caption = 'Caminho para gravar o arquivo'
      end
      object lbNomeArqGerado: TLabel
        Left = 236
        Top = 20
        Width = 259
        Height = 16
        AutoSize = False
        Caption = 'C:\'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object bbtnSalvar: TBitBtn
        Left = 532
        Top = 10
        Width = 88
        Height = 36
        Caption = 'Salvar'
        TabOrder = 0
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
          7700333333337777777733333333008088003333333377F73377333333330088
          88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
          000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
          FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
          99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
          99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
          99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
          93337FFFF7737777733300000033333333337777773333333333}
        NumGlyphs = 2
      end
    end
  end
  inherited Dock971: TDock97
    Top = 345
    Width = 641
    inherited tb97Fundo: TToolbar97
      Left = 424
      DockPos = 424
    end
    inherited TB97oKCancelar: TToolbar97
      inherited ToolbarSep971: TToolbarSep97
        Left = 128
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 128
        Caption = '&Processar'
      end
      inherited bbtnCancelar: TBitBtn
        Left = 131
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 483
    Top = 231
    TargetsData = (
      1
      2
      (
        ''
        'Filter'
        0)
      (
        ''
        'Title'
        0))
  end
  object qrySaidaGenerica: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM SAIDAGENERICA'
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 296
    Top = 16
  end
  object qryParametros: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 229
    Top = 110
  end
  object dsParametros: TwwDataSource
    DataSet = qryParametros
    Left = 317
    Top = 110
  end
  object SaveDialog1: TSaveDialog
    Left = 568
    Top = 233
  end
end
