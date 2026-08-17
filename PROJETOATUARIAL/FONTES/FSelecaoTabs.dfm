inherited frmSelecaoTabs: TfrmSelecaoTabs
  Left = 93
  Top = 66
  Caption = 'Seleção das Informações necessárias'
  ClientHeight = 464
  ClientWidth = 651
  OnPaint = nil
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Top = -24
    Width = 657
    Height = 449
    Align = alNone
    object Label1: TLabel
      Left = 18
      Top = 22
      Width = 235
      Height = 16
      Caption = 'Indique a Tabela ser selecionada'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Panel5: TPanel
      Left = 21
      Top = 80
      Width = 603
      Height = 297
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object nome2: TLabel
        Left = 320
        Top = 6
        Width = 264
        Height = 49
        Alignment = taCenter
        AutoSize = False
        Caption = 'Informações Selecionadas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -19
        Font.Name = 'Bookman Old Style'
        Font.Style = [fsItalic]
        ParentFont = False
        WordWrap = True
      end
      object sbtnAssocia: TSpeedButton
        Left = 285
        Top = 194
        Width = 25
        Height = 26
        Hint = 'Retira informação selecionada'
        Caption = '<'
        ParentShowHint = False
        ShowHint = True
        OnClick = sbtnAssociaClick
      end
      object sbtnAssociaTodos: TSpeedButton
        Left = 285
        Top = 162
        Width = 25
        Height = 26
        Hint = 'Retira todas as informações selecionadas'
        Caption = '<<'
        ParentShowHint = False
        ShowHint = True
        OnClick = sbtnAssociaTodosClick
      end
      object sbtnDesassocia: TSpeedButton
        Left = 285
        Top = 100
        Width = 25
        Height = 26
        Hint = 'Seleciona a informação indicada'
        Caption = '>'
        ParentShowHint = False
        ShowHint = True
        OnClick = sbtnDesassociaClick
      end
      object sbtnDesassociaTodos: TSpeedButton
        Left = 285
        Top = 132
        Width = 25
        Height = 25
        Hint = 'Seleciona todas as informações'
        Caption = '>>'
        ParentShowHint = False
        ShowHint = True
        OnClick = sbtnDesassociaTodosClick
      end
      object nome1: TLabel
        Left = -18
        Top = 6
        Width = 283
        Height = 52
        Alignment = taCenter
        AutoSize = False
        Caption = 'Informações do Cadastro Atuarial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindow
        Font.Height = -19
        Font.Name = 'Bookman Old Style'
        Font.Style = [fsItalic]
        ParentFont = False
        WordWrap = True
      end
      object Descricao: TwwDBGrid
        Left = 0
        Top = 32
        Width = 282
        Height = 257
        Selected.Strings = (
          'DESCRICAO'#9'40'#9'DESCRICAO'
          'IDCAMPO'#9'12'#9'IDCAMPO')
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = False
        DataSource = dsPlanPatro
        Options = [dgEditing, dgColumnResize, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = []
        TitleLines = 1
        TitleButtons = False
        OnCalcCellColors = DescricaoCalcCellColors
        IndicatorColor = icBlack
      end
    end
    object EscolheCampos: TListBox
      Left = 336
      Top = 112
      Width = 297
      Height = 257
      ItemHeight = 13
      TabOrder = 1
    end
    object LkcTabelas: TwwDBLookupCombo
      Left = 15
      Top = 47
      Width = 309
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'60'#9'Descrição da Tabela'
        'IDTABELA'#9'12'#9'Código')
      LookupTable = QrySelecionaTabela
      LookupField = 'IDTABELA'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
      OnChange = LkcTabelasChange
    end
    object campo: TListBox
      Left = 456
      Top = 8
      Width = 161
      Height = 49
      ItemHeight = 13
      TabOrder = 2
      Visible = False
    end
    object total: TBitBtn
      Left = 256
      Top = 384
      Width = 137
      Height = 33
      Caption = 'Total selecionado'
      TabOrder = 4
      OnClick = totalClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333303
        333333333333337FF3333333333333903333333333333377FF33333333333399
        03333FFFFFFFFF777FF3000000999999903377777777777777FF0FFFF0999999
        99037F3337777777777F0FFFF099999999907F3FF777777777770F00F0999999
        99037F773777777777730FFFF099999990337F3FF777777777330F00FFFFF099
        03337F773333377773330FFFFFFFF09033337F3FF3FFF77733330F00F0000003
        33337F773777777333330FFFF0FF033333337F3FF7F3733333330F08F0F03333
        33337F7737F7333333330FFFF003333333337FFFF77333333333000000333333
        3333777777333333333333333333333333333333333333333333}
      NumGlyphs = 2
    end
  end
  inherited Dock971: TDock97
    Top = 425
    Width = 651
    inherited tb97Fundo: TToolbar97
      Left = 469
      DockPos = 469
      inherited sep1: TToolbarSep97
        Left = 157
      end
      inherited bbtnSair: TBitBtn
        Width = 77
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 77
      end
    end
    object TB97oKCancelar: TToolbar97
      Left = 301
      Top = 0
      Caption = 'TB97oKCancelar'
      DockPos = 301
      TabOrder = 1
      object ToolbarSep971: TToolbarSep97
        Left = 80
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      object bbtnConfirmar: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Hint = 'Confirma seleção dos campos'
        Caption = '&OK'
        TabOrder = 0
        OnClick = bbtnConfirmarClick
        Kind = bkOK
        Spacing = 2
      end
      object bbtnCancelar: TBitBtn
        Left = 83
        Top = 0
        Width = 81
        Height = 33
        Hint = 'Limpa o grid das Informações selecionadas'
        Caption = '&Cancelar'
        TabOrder = 1
        OnClick = bbtnCancelarClick
        Kind = bkCancel
        Spacing = 2
      end
    end
  end
  object dsPlanPatro: TwwDataSource
    DataSet = qryCampos
    Left = 536
    Top = 7
  end
  object qryCampos: TwwQuery
    DatabaseName = 'basedados'
    DataSource = DsSelecionaTabela
    SQL.Strings = (
      'SELECT DESCRICAO,IDCAMPO,RELACAO,TIPO FROM TBCAMPOPART  '
      'WHERE IDTABELA = :IDTABELA')
    Params.Data = {01000100084944544142454C4100030400000000000000}
    ValidateWithMask = True
    Left = 482
    Top = 7
  end
  object DsSelecionaTabela: TwwDataSource
    DataSet = QrySelecionaTabela
    Left = 180
    Top = 119
  end
  object QrySelecionaTabela: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT DISTINCT IDTABELA,DESCRICAO FROM TBPARTICIP'
      '')
    ValidateWithMask = True
    Left = 54
    Top = 119
    object QrySelecionaTabelaDESCRICAO: TStringField
      DisplayLabel = 'Descrição da Tabela'
      DisplayWidth = 60
      FieldName = 'DESCRICAO'
      Origin = 'TBPARTICIP.DESCRICAO'
      Size = 80
    end
    object QrySelecionaTabelaIDTABELA: TFloatField
      DisplayLabel = 'Código'
      DisplayWidth = 12
      FieldName = 'IDTABELA'
      Origin = 'TBPARTICIP.IDTABELA'
    end
  end
  object QryAux: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      '')
    ValidateWithMask = True
    Left = 600
    Top = 16
  end
end

DataSourcedsEnabledReadOnly	TabOrder
