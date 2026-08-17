inherited frmAvisoContratosCorrecaoMT: TfrmAvisoContratosCorrecaoMT
  Left = 64
  Top = 87
  HelpContext = 120019
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Contratos que serão Reajustados em até x dias'
  ClientHeight = 370
  ClientWidth = 668
  FormStyle = fsNormal
  Visible = False
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 668
    Height = 331
    object dbgContratos: TwwDBGrid
      Left = 1
      Top = 1
      Width = 666
      Height = 329
      ControlType.Strings = (
        'FLG_CORRIGE;CheckBox;S;N')
      Selected.Strings = (
        'FLG_CORRIGE'#9'2'#9#9'F'
        'CODCONTRATOEMPR'#9'10'#9'Número'#9'F'
        'NOMECONTRATO'#9'60'#9'Contrato'#9'F'
        'DATAPROXCORR'#9'15'#9'Data do Reajuste'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = ds
      KeyOptions = []
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
      UseTFields = False
      OnCalcCellColors = dbgContratosCalcCellColors
      OnDblClick = dbgContratosDblClick
      IndicatorColor = icBlack
    end
  end
  inherited Dock971: TDock97
    Top = 331
    Width = 668
    object shpEmCorrecao: TShape [0]
      Left = 16
      Top = 2
      Width = 15
      Height = 15
      Brush.Color = 9953674
    end
    object Label1: TLabel [1]
      Left = 40
      Top = 3
      Width = 263
      Height = 13
      Caption = 'Reajuste / Procedimento em data de correção'
      Transparent = True
    end
    object shpEmAtraso: TShape [2]
      Left = 16
      Top = 19
      Width = 15
      Height = 15
      Brush.Color = 14607358
    end
    object lblEmatraso: TLabel [3]
      Left = 40
      Top = 20
      Width = 201
      Height = 13
      Caption = 'Reajuste / Procedimento em atraso'
      Transparent = True
    end
    inherited tb97Fundo: TToolbar97
      Left = 411
      inherited sep1: TToolbarSep97
        Left = 168
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 83
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 85
        Width = 83
        TabOrder = 1
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 170
        Width = 83
        TabOrder = 2
      end
      object btnCorrigir: TBitBtn
        Left = 0
        Top = 0
        Width = 83
        Height = 33
        Caption = '&Reajustar'
        Enabled = False
        TabOrder = 0
        OnClick = btnCorrigirClick
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333444444
          33333333333F8888883F33330000324334222222443333388F3833333388F333
          000032244222222222433338F8833FFFFF338F3300003222222AAAAA22243338
          F333F88888F338F30000322222A33333A2224338F33F8333338F338F00003222
          223333333A224338F33833333338F38F00003222222333333A444338FFFF8F33
          3338888300003AAAAAAA33333333333888888833333333330000333333333333
          333333333333333333FFFFFF000033333333333344444433FFFF333333888888
          00003A444333333A22222438888F333338F3333800003A2243333333A2222438
          F38F333333833338000033A224333334422224338338FFFFF8833338000033A2
          22444442222224338F3388888333FF380000333A2222222222AA243338FF3333
          33FF88F800003333AA222222AA33A3333388FFFFFF8833830000333333AAAAAA
          3333333333338888883333330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 24
    Top = 272
  end
  object cdsContratosCorr: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 216
    Top = 24
    Data = {
      D80000009619E0BD010000001800000005000000000003000000D8000B464C47
      5F434F525249474501004900000002000753554254595045020049000A004669
      78656443686172000557494454480200020001000A4944434F4E545241544F08
      000400000000000F434F44434F4E545241544F454D505208000400000000000C
      4E4F4D45434F4E545241544F0100490000000200075355425459504502004900
      0A00466978656443686172000557494454480200020001000C4441544150524F
      58434F525208000800000000000100044C4349440400010009080000}
  end
  object ds: TDataSource
    DataSet = cdsContratosCorr
    Left = 288
    Top = 24
  end
  object spAux: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   '#39'S'#39' AS FLG_CORRIGE, '
      '   0 AS IDCONTRATO,'
      '   0 AS CODCONTRATOEMPR,'
      '   '#39' '#39' AS NOMECONTRATO,'
      '   TO_DATE('#39'01/01/2002'#39', '#39'dd/mm/yyyy'#39') AS DATAPROXCORR'
      'FROM DUAL WHERE (1=2)'
      ' '
      ' ')
    ClientDataSet = cdsContratosCorr
    Left = 72
    Top = 272
  end
end
