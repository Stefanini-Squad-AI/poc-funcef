object frameDadosExportados: TframeDadosExportados
  Left = 0
  Top = 0
  Width = 766
  Height = 368
  TabOrder = 0
  object pnlTabela: TPanel
    Left = 0
    Top = 0
    Width = 766
    Height = 368
    Align = alClient
    BevelOuter = bvNone
    TabOrder = 0
    object dbgrdWebLogAlteracao: TDBGrid
      Left = 0
      Top = 0
      Width = 423
      Height = 343
      Align = alClient
      DataSource = dtsExibe
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgTitles, dgColLines, dgRowLines, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit]
      ParentFont = False
      TabOrder = 0
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clNavy
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = []
      Columns = <
        item
          Expanded = False
          FieldName = 'DATAHORA'
          Title.Caption = 'Data/Hora'
          Width = 114
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'Usuario'
          Width = 85
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TpOperacao'
          Title.Caption = 'Operação'
          Width = 65
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'TABELA'
          Title.Caption = 'Tabela'
          Width = 130
          Visible = True
        end
        item
          Expanded = False
          FieldName = 'CHAVEPRIMARIA'
          Title.Caption = 'Chave Primária Atual'
          Visible = False
        end>
    end
    object pnlBotoes: TPanel
      Left = 0
      Top = 343
      Width = 766
      Height = 25
      Align = alBottom
      BevelOuter = bvNone
      TabOrder = 1
      object pnlBottomTotal: TPanel
        Left = 0
        Top = 0
        Width = 145
        Height = 25
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object lblTotalReg: TLabel
          Left = 3
          Top = 7
          Width = 92
          Height = 13
          AutoSize = False
          Caption = 'Total de Registros:'
        end
        object lblTotal: TLabel
          Left = 97
          Top = 7
          Width = 45
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
      object pnlBottomCenter: TPanel
        Left = 145
        Top = 0
        Width = 287
        Height = 25
        Align = alClient
        BevelOuter = bvNone
        BorderWidth = 5
        TabOrder = 1
        object pgrProgresso: TProgressBar
          Left = 5
          Top = 5
          Width = 277
          Height = 15
          Align = alClient
          Min = 0
          Max = 100
          Step = 1
          TabOrder = 0
        end
      end
      object pnlBottomMostraChave: TPanel
        Left = 432
        Top = 0
        Width = 334
        Height = 25
        Align = alRight
        BevelOuter = bvNone
        TabOrder = 2
        object Label1: TLabel
          Left = 8
          Top = 6
          Width = 217
          Height = 14
          Caption = '* Usuário Oracle;   ** Usuário do Sistema'
          Font.Charset = ANSI_CHARSET
          Font.Color = clNavy
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object cbMostraChaves: TCheckBox
          Left = 235
          Top = 6
          Width = 97
          Height = 17
          Caption = 'Mostra Chaves'
          TabOrder = 0
          OnClick = cbMostraChavesClick
        end
      end
    end
    object pnlDetalhes: TPanel
      Left = 423
      Top = 0
      Width = 343
      Height = 343
      Align = alRight
      BevelOuter = bvLowered
      TabOrder = 2
      object strgrdDetalhes: TStringGrid
        Left = 1
        Top = 22
        Width = 341
        Height = 320
        Align = alClient
        Color = 15925247
        ColCount = 3
        DefaultRowHeight = 17
        FixedCols = 0
        RowCount = 2
        Options = [goFixedVertLine, goFixedHorzLine, goVertLine, goHorzLine, goRangeSelect, goColSizing, goColMoving, goRowSelect]
        TabOrder = 0
        ColWidths = (
          106
          106
          105)
      end
      object pnlTopDetalhes: TPanel
        Left = 1
        Top = 1
        Width = 341
        Height = 21
        Align = alTop
        Alignment = taLeftJustify
        BevelOuter = bvNone
        Caption = '  Campos alterados:'
        TabOrder = 1
      end
    end
  end
  object cdsWebLogAlteracao_Local: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterOpen = cdsWebLogAlteracao_LocalAfterOpen
    AfterClose = cdsWebLogAlteracao_LocalAfterClose
    Left = 224
    Top = 48
  end
  object dtsExibe: TDataSource
    DataSet = cdsExibe
    Left = 256
    Top = 112
  end
  object cdsExibe: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = cdsExibeAfterScroll
    Left = 224
    Top = 112
    object cdsExibeIDWEBLOGALTERACAO: TFloatField
      FieldName = 'IDWEBLOGALTERACAO'
    end
    object cdsExibeDATAHORA: TDateTimeField
      FieldName = 'DATAHORA'
    end
    object cdsExibeOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Size = 1
    end
    object cdsExibeTABELA: TStringField
      FieldName = 'TABELA'
      Size = 50
    end
    object cdsExibeCHAVEPRIMARIA: TStringField
      FieldName = 'CHAVEPRIMARIA'
      Size = 120
    end
    object cdsExibeLOTE: TFloatField
      FieldName = 'LOTE'
    end
    object cdsExibeTpOperacao: TStringField
      FieldName = 'TpOperacao'
      Size = 10
    end
    object cdsExibeUsuario: TStringField
      DisplayLabel = 'Usuário'
      FieldName = 'Usuario'
    end
  end
end
