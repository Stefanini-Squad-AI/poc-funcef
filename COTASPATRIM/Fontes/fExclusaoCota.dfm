inherited frmExclusaoCota: TfrmExclusaoCota
  Left = 398
  Top = 273
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Exclusão de Cota'
  ClientHeight = 280
  ClientWidth = 408
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 408
    Height = 241
    object lblAtivo: TLabel
      Left = 10
      Top = 8
      Width = 30
      Height = 13
      Caption = 'Ativo'
    end
    object lblListaCotas: TLabel
      Left = 10
      Top = 59
      Width = 79
      Height = 13
      Caption = 'Cota a excluir'
    end
    object dblkpAtivo: TCMDBLookupCombo
      Left = 10
      Top = 24
      Width = 387
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'30'#9'Nome do Ativo'#9'F')
      DataField = 'IDCPATIVO'
      LookupTable = CdsAtivo
      LookupField = 'IDCPATIVO'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnChange = dblkpAtivoChange
    end
    object grpDadosCota: TGroupBox
      Left = 10
      Top = 112
      Width = 387
      Height = 118
      Caption = 'Dados da cota'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object lblData: TLabel
        Left = 11
        Top = 17
        Width = 28
        Height = 13
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblValorCota: TLabel
        Left = 247
        Top = 17
        Width = 77
        Height = 13
        Caption = 'Valor da cota'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblSituacao: TLabel
        Left = 10
        Top = 69
        Width = 51
        Height = 13
        Caption = 'Situação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblValida: TLabel
        Left = 247
        Top = 69
        Width = 36
        Height = 13
        Caption = 'Válida'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbedtVALOR: TDBEdit
        Left = 247
        Top = 33
        Width = 128
        Height = 21
        Color = 15658734
        DataField = 'VALOR'
        DataSource = dtsValorCota
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object dbedtStatus: TDBEdit
        Left = 10
        Top = 85
        Width = 190
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Color = 15658734
        DataField = 'STATUS'
        DataSource = dtsValorCota
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object dtCota: TwwDBDateTimePicker
        Left = 10
        Top = 32
        Width = 190
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        Color = 15658734
        DataField = 'DTCOTA'
        DataSource = dtsValorCota
        Epoch = 1950
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        ShowButton = True
        TabOrder = 0
      end
      object dbedtValida: TDBEdit
        Left = 247
        Top = 85
        Width = 128
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Color = 15658734
        DataField = 'VALIDO'
        DataSource = dtsValorCota
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
    end
    object dblkpCotas: TCMDBLookupCombo
      Left = 10
      Top = 72
      Width = 387
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DTCOTA'#9'1'#9'Data da cota'#9'F'
        'VALOR'#9'12'#9'             Valor'#9'F'
        'STATUS'#9'19'#9'Situação'#9'F'
        'VALIDO'#9'3'#9'Válida?'#9'F')
      DataField = 'IDCPATIVO'
      LookupTable = cdsListaCotas
      LookupField = 'IDCPVALORCOTA'
      Options = [loTitles]
      Style = csDropDownList
      Enabled = False
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
      OnChange = dblkpCotasChange
    end
  end
  inherited Dock971: TDock97
    Top = 241
    Width = 408
    inherited tb97Fundo: TToolbar97
      Left = 236
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 67
      inherited ToolbarSep971: TToolbarSep97
        Visible = False
      end
      inherited bbtnConfirmar: TBitBtn
        Caption = 'E&xcluir'
        ModalResult = 0
        OnClick = bbtnConfirmarClick
        Glyph.Data = {
          36040000424D3604000000000000360000002800000010000000100000000100
          2000000000000004000000000000000000000000000000000000FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF008484
          840084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF000000000000000000FFFF
          FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF000000000000000000FFFFFF00FFFFFF00FFFF
          FF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
          FF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF0084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FF00
          0000FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF000000840000008400000084000000840000008400FF000000FF000000FFFF
          FF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF00FF00FF00FF00FF000000
          84000000FF000000FF000000FF000000FF000000FF0000008400FFFFFF00FFFF
          FF00FF000000FFFFFF0000000000FF00FF00FF00FF00FF00FF000000FF000000
          FF000000FF000000FF000000FF000000FF000000FF000000FF0000008400FF00
          0000FFFFFF00FFFFFF00FFFFFF0000000000FF00FF00FF00FF000000FF000000
          FF00FF00FF00FFFFFF000000FF00FFFFFF00FFFFFF000000FF0000008400FFFF
          FF00FFFFFF00FF000000FFFFFF00FFFFFF0000000000FF00FF000000FF000000
          FF000000FF00FF00FF00FFFFFF00FFFFFF000000FF000000FF0000008400FF00
          0000FF000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00000000000000FF000000
          FF000000FF00FFFFFF00FFFFFF00FF00FF000000FF000000FF0000008400FFFF
          FF00FFFFFF00FFFFFF00FFFFFF008484840084848400FF00FF000000FF000000
          FF00FF00FF00FFFFFF000000FF00FFFFFF00FFFFFF000000FF0000008400FFFF
          FF00FFFFFF008484840084848400FF00FF00FF00FF00FF00FF00FF00FF000000
          FF000000FF000000FF000000FF000000FF000000FF0000008400848484008484
          840084848400FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF000000FF000000FF000000FF000000FF000000FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00
          FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00FF00}
        NumGlyphs = 1
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 75
    Top = 303
  end
  object CdsAtivo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 20
    Top = 303
  end
  object cdsListaCotas: TCMClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'STATUS'
        DataType = ftString
        Size = 22
      end
      item
        Name = 'VALIDO'
        DataType = ftString
        Size = 3
      end
      item
        Name = 'IDCPVALORCOTA'
        DataType = ftFloat
      end
      item
        Name = 'DTCOTA'
        DataType = ftDateTime
      end
      item
        Name = 'VALOR'
        DataType = ftFloat
      end
      item
        Name = 'FLGSTATUS'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'FLGVALIDO'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterOpen = cdsListaCotasAfterOpen
    Left = 144
    Top = 304
    Data = {
      1E0200009619E0BD010000001800000007000500000003000000160106535441
      54555301004900000001000557494454480200020016000656414C49444F0100
      4900000001000557494454480200020003000D4944435056414C4F52434F5441
      0800040000000000064454434F544108000800000000000556414C4F52080004
      000000000009464C475354415455530100490000000200075355425459504502
      0049000A004669786564436861720005574944544802000200010009464C4756
      414C49444F01004900000002000753554254595045020049000A004669786564
      436861720005574944544802000200010002000D44454641554C545F4F524445
      52020082000200000007800400044C43494404000100160800000000000B5265
      63616C63756C6164610353696D000000000040674000009A5D97CCCC42B1F8F7
      632BF457400152015300000012526563E16C63756C6F20726563757361646F03
      4EE36F0000000000206840000086EA87CCCC429A99999999D95740014F014E00
      000013446976756C6761E7E36F207265637573616461034EE36F0000000000C0
      654000003E3792CCCC42474B0E6DFAEA57400155014E00000012526563E16C63
      756C6F20726563757361646F034EE36F0000000000C0674000003E3792CCCC42
      474B0E6DFAEA5740014F014E00000012526563E16C63756C6F20726563757361
      646F034EE36F000000000080674000006CCA94CCCC427A3FC596A3F15740014F
      014E}
  end
  object dtsValorCota: TDataSource
    DataSet = cdsValorCota
    Left = 312
    Top = 303
  end
  object cdsValorCota: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = cdsListaCotasAfterOpen
    Left = 244
    Top = 303
  end
end
