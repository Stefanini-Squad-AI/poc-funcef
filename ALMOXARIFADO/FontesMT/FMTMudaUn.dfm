inherited FrmMTMudaUn: TFrmMTMudaUn
  Left = 149
  Top = 138
  HelpContext = 50006
  Caption = 'Mudança de Unidade do Custo Médio'
  ClientHeight = 271
  ClientWidth = 447
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 447
    Height = 232
    object LbArtigo: TLabel
      Left = 24
      Top = 80
      Width = 34
      Height = 13
      Caption = 'Artigo'
    end
    object Label1: TLabel
      Left = 24
      Top = 128
      Width = 122
      Height = 13
      Caption = 'Unidade Custo Médio'
    end
    object Label15: TLabel
      Left = 168
      Top = 128
      Width = 122
      Height = 13
      Caption = 'Unidades Disponíves'
    end
    object Panel1: TPanel
      Left = 5
      Top = 5
      Width = 437
      Height = 60
      Align = alTop
      BevelInner = bvRaised
      BevelWidth = 2
      Caption = 'Panel1'
      Color = clGray
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -15
      Font.Name = 'Courier New'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Memo1: TMemo
        Left = 4
        Top = 4
        Width = 429
        Height = 52
        Align = alClient
        Alignment = taCenter
        Color = clGray
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        Lines.Strings = (
          'Esta Rotina irá atualizar  TODOS os movimentos do '
          'produto escolhido.')
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
    end
    object edUnCusto: TDBEdit
      Left = 24
      Top = 144
      Width = 121
      Height = 21
      Color = clSilver
      Ctl3D = True
      DataField = 'CODMEDCUSTO'
      DataSource = dsArtigo
      ParentCtl3D = False
      TabOrder = 3
    end
    object dblcUnidMedida: TwwDBLookupCombo
      Left = 168
      Top = 144
      Width = 141
      Height = 21
      Hint = 'Unidades de Conversão deste Produto'
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CODMEDIDA'#9'4'#9'Código'
        'FATOR'#9'10'#9'Fator'
        'DESCMEDIDA'#9'25'#9'Decrição')
      LookupTable = cdsUnMedida
      LookupField = 'CODMEDIDA'
      Options = [loTitles]
      Style = csDropDownList
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object plnStatus: TPanel
      Left = 5
      Top = 172
      Width = 437
      Height = 55
      Align = alBottom
      Alignment = taLeftJustify
      BevelOuter = bvNone
      TabOrder = 4
      Visible = False
      object pgbar: TProgressBar
        Left = 0
        Top = 38
        Width = 437
        Height = 17
        Align = alBottom
        Min = 0
        Max = 100
        TabOrder = 0
      end
    end
    object dblcArt: TwwDBLookupCombo
      Left = 24
      Top = 96
      Width = 393
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'50'#9'Descrição'
        'CODARTIGO'#9'14'#9'Código')
      LookupTable = cdsArtigo
      LookupField = 'CODARTIGO'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      OrderByDisplay = False
      AllowClearKey = True
      ShowMatchText = True
      OnCloseUp = dblcArtCloseUp
    end
  end
  inherited Dock971: TDock97
    Top = 232
    Width = 447
    inherited tb97Fundo: TToolbar97
      Left = 199
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 162
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 82
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 164
        HelpContext = 50006
      end
      object BtnAtualiza: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&Atualizar'
        TabOrder = 2
        OnClick = BtnAtualizaClick
        Glyph.Data = {
          6E020000424D6E02000000000000760000002800000036000000120000000100
          040000000000F801000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777777777777FFFFFF777777777777777777777770077777770000007777777
          777FF888888F7777777777777777777777007777700111111077017777F88777
          77787F8777777700000077777700777701111111110011777F877FFFFF7788F8
          7777004444440770470077701119999911111177F877F88888F777F877704444
          4444400447007701119777779111117F877F8777778F77F8770444CCCCC44444
          47007701197777777111117F87F87777777877F870444C77777C444447007700
          0977777711111177888877777F8FFFF87044C777777744444700777777777779
          99999977FFFFF777788888887000C77777744444470070000007777777777778
          888887777777FFF77777777777CCCCCCC7007044444C777777000C787777F877
          7777888800000077777777777700704444C7777777044C7877778777777F87F8
          011111C77777700097007044440077777044C778777788FFFFF8778701111C77
          7777701197007044444400000444C7787FF7778888877F870111100777770119
          7700704CC4444444444C7778F88FF777777FF8770111111000001119770077C7
          7CC444444CC7777787788FFFFFF88777019911111111119777007777777CCCCC
          C777777777777888888777777977991111119977770077777777777777777777
          777777777777777777777799999977777700}
        NumGlyphs = 3
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 779
    Top = 65523
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
  object cdsArtigo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 360
    Top = 64
  end
  object cdsUnMedida: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 360
    Top = 120
  end
  object dsArtigo: TwwDataSource
    AutoEdit = False
    DataSet = cdsArtigo
    Left = 357
    Top = 29
  end
end
