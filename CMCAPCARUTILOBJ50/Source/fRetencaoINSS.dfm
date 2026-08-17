inherited frmRetencaoINSS: TfrmRetencaoINSS
  Left = 96
  Top = 173
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Retenção de INSS de autônomos'
  ClientHeight = 204
  ClientWidth = 514
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 514
    Height = 165
    object Label1: TLabel
      Left = 92
      Top = 26
      Width = 283
      Height = 13
      Alignment = taRightJustify
      Caption = 'Valor do INSS retido na fundação até o momento:'
    end
    object Label2: TLabel
      Left = 19
      Top = 58
      Width = 356
      Height = 13
      Alignment = taRightJustify
      Caption = 'Valor do INSS relativo ao documento atual (limitado pelo teto):'
    end
    object lblAte: TLabel
      Left = 109
      Top = 90
      Width = 266
      Height = 13
      Alignment = taRightJustify
      Caption = 'Valor da retenção em outras empresas no mês:'
    end
    object Label5: TLabel
      Left = 119
      Top = 130
      Width = 256
      Height = 13
      Alignment = taRightJustify
      Caption = 'Total da retenção do INSS (limitado ao teto):'
    end
    object Bevel1: TBevel
      Left = 383
      Top = 114
      Width = 111
      Height = 4
    end
    object edtVlAnterior: TDBRealEdit
      Left = 383
      Top = 21
      Width = 110
      Height = 21
      Alignment = taRightJustify
      Color = clBtnFace
      Lines.Strings = (
        '0,00')
      ReadOnly = True
      TabOrder = 0
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
      DataField = 'VLDOC'
      DataSource = dtsRetencao
    end
    object edtVlOutros: TDBRealEdit
      Left = 383
      Top = 85
      Width = 110
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '0,00')
      TabOrder = 2
      WordWrap = False
      OnExit = edtVlOutrosExit
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
      DataField = 'VLINFORMADO'
      DataSource = dtsRetencao
    end
    object edtVlImposto: TDBRealEdit
      Left = 383
      Top = 53
      Width = 110
      Height = 21
      Alignment = taRightJustify
      Color = clBtnFace
      Lines.Strings = (
        '0,00')
      ReadOnly = True
      TabOrder = 1
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
      DataField = 'VLRETIDO'
      DataSource = dtsRetencao
    end
    object edtVlTotal: TDBRealEdit
      Left = 383
      Top = 125
      Width = 110
      Height = 21
      Alignment = taRightJustify
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Lines.Strings = (
        '0,00')
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
      DataField = 'VLTOTAL'
      DataSource = dtsRetencao
    end
  end
  inherited Dock971: TDock97
    Top = 165
    Width = 514
    inherited tb97Fundo: TToolbar97
      Left = 344
      Visible = False
      inherited sep1: TToolbarSep97
        Visible = False
      end
      inherited sep3: TToolbarSep97
        Visible = False
      end
      inherited bbtnSair: TBitBtn
        Visible = False
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Visible = False
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 177
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 11
    Top = 11
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  object cdsRetencao: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'VLDOC'
        DataType = ftFloat
      end
      item
        Name = 'VLRETIDO'
        DataType = ftFloat
      end
      item
        Name = 'VLINFORMADO'
        DataType = ftFloat
      end
      item
        Name = 'TETOINSS'
        DataType = ftFloat
      end
      item
        Name = 'VLTOTAL'
        DataType = ftFloat
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    Left = 11
    Top = 152
    object cdsRetencaoVLDOC: TFloatField
      FieldName = 'VLDOC'
    end
    object cdsRetencaoVLRETIDO: TFloatField
      FieldName = 'VLRETIDO'
    end
    object cdsRetencaoVLINFORMADO: TFloatField
      FieldName = 'VLINFORMADO'
    end
    object cdsRetencaoTETOINSS: TFloatField
      FieldName = 'TETOINSS'
    end
    object cdsRetencaoVLTOTAL: TFloatField
      FieldName = 'VLTOTAL'
    end
  end
  object dtsRetencao: TDataSource
    DataSet = cdsRetencao
    Left = 43
    Top = 152
  end
end
