inherited frmListaTitular: TfrmListaTitular
  Left = 42
  Top = 219
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsToolWindow
  Caption = 
    'Lista de Titulares a alterar o número de dependentes que Constam' +
    ' para Sal. Fam. e IRRF'
  ClientHeight = 245
  ClientWidth = 708
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 708
    Height = 206
    BevelInner = bvRaised
    BevelOuter = bvNone
    BorderWidth = 2
    object dbgdListaTit: TwwDBGrid
      Left = 6
      Top = 6
      Width = 695
      Height = 194
      ControlType.Strings = (
        'MUDANUM;CheckBox;1;0')
      Selected.Strings = (
        'NOME'#9'40'#9'Nome'#9'T'
        'NUMDEPIRRF'#9'10'#9'IRRF (Cadastro)'#9'T'
        'NUM_IRRF'#9'10'#9'IRRF (Calculado)'
        'NUMDEPSALF'#9'10'#9'Sal. Fam. (Cadastro)'#9'T'
        'NUM_SAL_FAM'#9'10'#9'Sal. Fam. (Calculado)'#9'T'
        'MUDANUM'#9'7'#9'Altera?'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
      DataSource = dsTitular
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      KeyOptions = []
      Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowSelect, dgAlwaysShowSelection]
      ParentFont = False
      TabOrder = 0
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      TitleLines = 1
      TitleButtons = False
      OnCalcCellColors = dbgdListaTitCalcCellColors
      IndicatorColor = icBlack
      OnTopRowChanged = dbgdListaTitTopRowChanged
    end
  end
  inherited Dock971: TDock97
    Top = 206
    Width = 708
    inherited tb97Fundo: TToolbar97
      Left = 460
      DockPos = 548
      inherited sep1: TToolbarSep97
        Left = 162
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 80
        Top = 0
        Blank = True
        SizeHorz = 2
        Visible = False
      end
      inherited bbtnSair: TBitBtn
        Left = 82
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 164
      end
      object bbtnConfirmar: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&OK'
        Default = True
        ModalResult = 1
        TabOrder = 2
        OnClick = bbtnConfirmarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888002222200
          88888887788888778F88887222222222088888788888888878F887A228822222
          208887F88FFF888887F887A2FFF8222220888788777FF888878F7A22FFFF8222
          22087F887777FF88887F7A22FFFFF82222087F8877777FF8887F7A22FF8FFF82
          22087F8877F777FF887F7A22FF82FFF822087F8877F8777F887F7A22FF222FF8
          220878F87788877FF87887A2222222FF208887F88888887787F887A222222222
          2088878F888888888788887AA222222208888878FF88888F788888877AAAAA77
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 381
    Top = 81
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object dsTitular: TwwDataSource
    DataSet = CdsTitular
    Left = 334
    Top = 81
  end
  object CdsTitular: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDPESSOA'
        DataType = ftFloat
      end
      item
        Name = 'NOME'
        DataType = ftString
        Size = 60
      end
      item
        Name = 'NUMDEPTOT'
        DataType = ftFloat
      end
      item
        Name = 'NUM_TOT'
        DataType = ftFloat
      end
      item
        Name = 'NUMDEPIRRF'
        DataType = ftFloat
      end
      item
        Name = 'NUM_IRRF'
        DataType = ftFloat
      end
      item
        Name = 'NUMDEPSALF'
        DataType = ftFloat
      end
      item
        Name = 'NUM_SAL_FAM'
        DataType = ftFloat
      end
      item
        Name = 'MUDANUM'
        DataType = ftFloat
      end>
    IndexDefs = <
      item
        Name = 'CdsTitularIndex'
        CaseInsFields = 'NOME'
        Fields = 'NOME'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'CdsTitularIndex'
    Params = <>
    StoreDefs = True
    Left = 288
    Top = 81
  end
end
