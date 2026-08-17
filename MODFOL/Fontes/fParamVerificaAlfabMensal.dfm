inherited frmParamVerificaAlfabMensal: TfrmParamVerificaAlfabMensal
  Left = 292
  Top = 185
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsToolWindow
  Caption = 'Verifiação - Relação de Empregados Alfabética Mensal'
  ClientHeight = 169
  ClientWidth = 384
  Font.Style = []
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 384
    Height = 130
    BorderWidth = 2
    object pnlResult: TPanel
      Left = 6
      Top = 6
      Width = 372
      Height = 118
      Anchors = [akLeft, akTop, akRight, akBottom]
      TabOrder = 2
      Visible = False
      object dbgrdResult: TwwDBGrid
        Left = 6
        Top = 5
        Width = 360
        Height = 107
        IniAttributes.Delimiter = ';;'
        TitleColor = clGray
        FixedCols = 0
        ShowHorzScrollBar = True
        Anchors = [akLeft, akTop, akRight, akBottom]
        DataSource = dsAlfabMensal
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit]
        ParentFont = False
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWhite
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        IndicatorColor = icBlack
      end
    end
    object gbxEstab: TGroupBox
      Left = 52
      Top = 13
      Width = 280
      Height = 46
      Anchors = []
      Caption = 'Estabelecimento'
      TabOrder = 0
      object dblkcbEstab: TwwDBLookupCombo
        Left = 8
        Top = 16
        Width = 263
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'Estabelecimento')
        LookupTable = qryEstab
        LookupField = 'CODIGO'
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        OnChange = dblkcbEstabChange
      end
    end
    object gbxAnoMesRef: TGroupBox
      Left = 52
      Top = 69
      Width = 280
      Height = 46
      Anchors = []
      Caption = 'Mês e Ano de Referência'
      TabOrder = 1
      object cmbMes: TComboBox
        Left = 8
        Top = 16
        Width = 137
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        ParentShowHint = False
        ShowHint = False
        TabOrder = 0
        Items.Strings = (
          'Janeiro'
          'Fevereiro'
          'Março'
          'Abril'
          'Maio'
          'Junho'
          'Julho'
          'Agosto'
          'Setembro'
          'Outubro'
          'Novembro'
          'Dezembro')
      end
      object speAno: TSpinEdit
        Left = 172
        Top = 16
        Width = 81
        Height = 22
        MaxLength = 4
        MaxValue = 3000
        MinValue = 1900
        ParentShowHint = False
        ShowHint = False
        TabOrder = 1
        Value = 1900
        OnChange = dblkcbEstabChange
      end
    end
  end
  inherited Dock971: TDock97
    Top = 130
    Width = 384
    inherited tb97Fundo: TToolbar97
      Left = 91
      DockPos = 99
      inherited sep1: TToolbarSep97
        Left = 287
      end
      object ToolbarSep972: TToolbarSep97 [1]
        Left = 97
        Top = 0
        Blank = True
        SizeHorz = 30
      end
      inherited bbtnSair: TBitBtn
        Left = 127
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 207
      end
      object bbtnVerificar: TBitBtn
        Left = 0
        Top = 0
        Width = 97
        Height = 33
        Caption = '  &Verificar'
        Default = True
        TabOrder = 2
        OnClick = bbtnVerificarClick
        Glyph.Data = {
          96010000424D9601000000000000760000002800000018000000180000000100
          0400000000002001000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777777777777777777777777770777777777777777777777770077777777777
          777777777770B077777777777777777777770B077777777777777777700000B0
          7777777777777777770BBBBB0777777777700077770BBB0000777777788FF087
          7770BBB0777777788FFFFF070000BFBF0777778FFFF88F070BFBFB000077778F
          F00F0FF070BFBF07777777700FFF0FF000FBFBF07777700FFFFFF0FF070FBFBF
          077778FFFFFCF0FFF0000000077778FFCCCFFF0FF07777777777778FFFFFCF0F
          887777777777778FFCCCFFF07777777777777778FFFFFCFF0777777777777778
          FFCCCFFFF0777777777777778FFFFFF8877777777777777778FFF88777777777
          7777777777888777777777777777777777777777777777777777}
        Spacing = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 278
    Top = 29
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryEstab: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  PJ.IDPESSOA AS CODIGO, PJ.NOME'
      'FROM'
      '  PESSOA PJ, FILIALPESSOA FP'
      'WHERE'
      ''
      '  (PJ.IDGRUPO        = :EMPRESA) AND'
      '  (FP.IDFILIALPESSOA = PJ.IDPESSOA)')
    ValidateWithMask = True
    Left = 136
    Top = 29
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EMPRESA'
        ParamType = ptUnknown
      end>
  end
  object qryParamRH: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  NORMALINI, NORMALFIM, IDMOTIVO'
      'FROM'
      '  PARAMRH')
    ValidateWithMask = True
    Left = 75
    Top = 29
  end
  object dsAlfabMensal: TwwDataSource
    DataSet = qryAlfabMensal
    Left = 204
    Top = 29
  end
  object qryAlfabMensal: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 204
    Top = 16
  end
end
