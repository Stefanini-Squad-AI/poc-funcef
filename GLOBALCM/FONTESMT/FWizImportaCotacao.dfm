inherited frmWizImportaCotacao: TfrmWizImportaCotacao
  Left = 273
  Top = 178
  Caption = 'Importação de dados de cotação de moeda de planilha excel'
  ClientHeight = 420
  ClientWidth = 584
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 584
    Height = 381
    inherited PagControle: TPageControl
      Width = 582
      Height = 379
      ActivePage = TabSheet1
      inherited tabSelecao: TTabSheet
        inherited lblTitulo: TfcLabel
          Width = 574
          Caption = 'Importação de planilhas Excel [ parâmeros ]'
        end
        object Label1: TLabel
          Left = 104
          Top = 96
          Width = 39
          Height = 13
          Caption = 'Moeda'
        end
        object lblCaminho: TLabel
          Left = 24
          Top = 47
          Width = 170
          Height = 13
          Caption = 'Caminho completo da planilha'
        end
        object Label6: TLabel
          Left = 24
          Top = 96
          Width = 29
          Height = 13
          Caption = 'Sigla'
        end
        object bitBtnAbrir: TBitBtn
          Left = 444
          Top = 62
          Width = 27
          Height = 23
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          OnClick = bitBtnAbrirClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
            5555555555555555555555555555555555555555555555555555555555555555
            555555555555555555555555555555555555555FFFFFFFFFF555550000000000
            55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
            B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
            000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
            555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
            55555575FFF75555555555700007555555555557777555555555555555555555
            5555555555555555555555555555555555555555555555555555}
          NumGlyphs = 2
        end
        object edtCaminho: TEdit
          Left = 22
          Top = 62
          Width = 421
          Height = 21
          TabOrder = 0
          Text = 'C:\'
        end
        object Panel2: TPanel
          Left = 0
          Top = 176
          Width = 574
          Height = 193
          Align = alBottom
          BevelOuter = bvLowered
          TabOrder = 5
          object Label5: TLabel
            Left = 314
            Top = 60
            Width = 149
            Height = 13
            Caption = 'Col. do campo "Mês Ref."'
          end
          object Label3: TLabel
            Left = 314
            Top = 13
            Width = 148
            Height = 13
            Caption = 'Col. do campo "Data Fim"'
          end
          object Label7: TLabel
            Left = 22
            Top = 109
            Width = 191
            Height = 13
            Caption = 'Linha inicial de dados na planilha'
          end
          object Label4: TLabel
            Left = 22
            Top = 60
            Width = 127
            Height = 13
            Caption = 'Col. do campo "Valor"'
          end
          object Label2: TLabel
            Left = 22
            Top = 13
            Width = 162
            Height = 13
            Caption = 'Col. do campo "Data Início"'
          end
          object Label8: TLabel
            Left = 314
            Top = 109
            Width = 33
            Height = 13
            Caption = 'Prazo'
          end
          object dbedColMesRef: TwwDBEdit
            Left = 314
            Top = 77
            Width = 163
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 3
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbedColDataFim: TwwDBEdit
            Left = 314
            Top = 31
            Width = 163
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 1
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbSpinLinIni: TwwDBSpinEdit
            Left = 24
            Top = 126
            Width = 97
            Height = 21
            Increment = 1
            Value = 2
            TabOrder = 4
            UnboundDataType = wwDefault
          end
          object dbedColValor: TwwDBEdit
            Left = 22
            Top = 77
            Width = 163
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 2
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbedColDataIni: TwwDBEdit
            Left = 22
            Top = 31
            Width = 163
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 0
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object chkboxSobrescreve: TCheckBox
            Left = 270
            Top = 166
            Width = 211
            Height = 17
            Caption = 'Sobrescrever cotações existente'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 6
          end
          object dbedPrazo: TwwDBEdit
            Left = 314
            Top = 126
            Width = 163
            Height = 21
            CharCase = ecUpperCase
            TabOrder = 5
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
        end
        object edtMoeda: TEdit
          Left = 102
          Top = 110
          Width = 342
          Height = 21
          Enabled = False
          TabOrder = 3
        end
        object edtSigla: TEdit
          Left = 22
          Top = 110
          Width = 70
          Height = 21
          Enabled = False
          TabOrder = 2
        end
        object BbtnProcura: TBitBtn
          Left = 445
          Top = 110
          Width = 27
          Height = 23
          Caption = '...'
          TabOrder = 4
          OnClick = BbtnProcuraClick
        end
      end
      inherited TabSheet1: TTabSheet
        inherited fcLabel1: TfcLabel
          Width = 574
          Caption = 'Cotações importadas da planilha [ Resultado ]'
        end
        object Panel1: TPanel
          Left = 0
          Top = 24
          Width = 574
          Height = 33
          Align = alTop
          BevelOuter = bvLowered
          TabOrder = 0
          object LblMoedaNome: TLabel
            Left = 148
            Top = 11
            Width = 47
            Height = 13
            Caption = 'Moeda: '
          end
          object LblMoedaSigla: TLabel
            Left = 12
            Top = 11
            Width = 37
            Height = 13
            Caption = 'Sigla: '
          end
          object edtMoeda2: TEdit
            Left = 196
            Top = 6
            Width = 286
            Height = 21
            Enabled = False
            TabOrder = 0
          end
          object edtSigla2: TEdit
            Left = 47
            Top = 6
            Width = 89
            Height = 21
            Enabled = False
            TabOrder = 1
          end
        end
        object dbgCotacao: TwwDBGrid
          Left = 0
          Top = 57
          Width = 574
          Height = 214
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsCotacao
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          ReadOnly = True
          TabOrder = 1
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = True
          OnTitleButtonClick = dbgCotacaoTitleButtonClick
          OnDrawDataCell = dbgCotacaoDrawDataCell
          IndicatorColor = icBlack
        end
        object Panel3: TPanel
          Left = 0
          Top = 271
          Width = 574
          Height = 21
          Align = alBottom
          Caption = 'Log da importação'
          Color = clAppWorkSpace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
        end
        object meErros: TwwDBRichEdit
          Left = 0
          Top = 292
          Width = 574
          Height = 77
          ScrollBars = ssBoth
          Align = alBottom
          AutoURLDetect = False
          PopupMenu = PopupMenu1
          PrintJobName = 'Delphi 5'
          TabOrder = 3
          WordWrap = False
          EditorCaption = 'Edit Rich Text'
          EditorPosition.Left = 0
          EditorPosition.Top = 0
          EditorPosition.Width = 0
          EditorPosition.Height = 0
          MeasurementUnits = muInches
          PrintMargins.Top = 1
          PrintMargins.Bottom = 1
          PrintMargins.Left = 1
          PrintMargins.Right = 1
          RichEditVersion = 2
          Data = {
            750000007B5C727466315C616E73695C616E7369637067313235325C64656666
            305C6465666C616E67313034367B5C666F6E7474626C7B5C66305C666E696C20
            4D532053616E732053657269663B7D7D0D0A5C766965776B696E64345C756331
            5C706172645C625C66305C667331345C7061720D0A7D0D0A00}
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 381
    Width = 584
    inherited tb97Fundo: TToolbar97
      Left = 144
      inherited btnConfirmar: TfcShapeBtn
        OnClick = btnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 275
    Top = 83
    TargetsData = (
      1
      2
      (
        'TMemo'
        'Text'
        0)
      (
        'TwwDBRichEdit'
        'Text'
        0))
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Planihas EXCEL(*.xls)|*.xls'
    Left = 264
    Top = 144
  end
  object cdsCotacao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 172
    Top = 143
    object cdsCotacaoMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
    end
    object cdsCotacaoCOTDATA: TDateTimeField
      FieldName = 'COTDATA'
    end
    object cdsCotacaoIDUSUARIOINCLUSAO: TFloatField
      FieldName = 'IDUSUARIOINCLUSAO'
    end
    object cdsCotacaoINDICEBASE: TFloatField
      FieldName = 'INDICEBASE'
    end
    object cdsCotacaoCOTVALOR: TFloatField
      FieldName = 'COTVALOR'
      DisplayFormat = '#,##0.00000000;(#,##0.00000000)'
      EditFormat = '#,##0.00000000;(#,##0.00000000)'
    end
    object cdsCotacaoCOTMESREF: TStringField
      FieldName = 'COTMESREF'
      FixedChar = True
      Size = 6
    end
    object cdsCotacaoTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
    end
    object cdsCotacaoTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Size = 30
    end
    object cdsCotacaoCOTDATAFIM: TDateTimeField
      FieldName = 'COTDATAFIM'
    end
    object cdsCotacaoNUMDIASPRAZO: TFloatField
      FieldName = 'NUMDIASPRAZO'
    end
    object cdsCotacaoIDCOTACAOMOEDA: TFloatField
      FieldName = 'IDCOTACAOMOEDA'
    end
    object cdsCotacaoOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
      Size = 500
    end
  end
  object sqlCotacao: TCMSqlParams
    SQL.Strings = (
      'SELECT * FROM COTACAOMOEDA WHERE 1 = 2')
    ClientDataSet = cdsCotacao
    Left = 204
    Top = 143
  end
  object dsCotacao: TwwDataSource
    DataSet = cdsCotacao
    Left = 138
    Top = 143
  end
  object msMoeda: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Selecione a moeda'
    Colunas.Strings = (
      'MOEDA.MOESIGLA'
      'MOEDA.MOEDESC')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Sigla'
      'Moeda')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'MOEDA')
    CamposChave.Strings = (
      'MOEDA.MOECODIGO'
      'MOEDA.MOESIGLA'
      'MOEDA.MOEDESC')
    Filtro.Strings = (
      'MOEDA.MOEINATIVO = '#39'A'#39)
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '20')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 325
    Top = 87
  end
  object SaveDialog1: TSaveDialog
    DefaultExt = 'txt'
    Filter = 'Arquivo Texto(*.txt)|*.txt'
    Left = 277
    Top = 2
  end
  object PopupMenu1: TPopupMenu
    Left = 350
    Top = 3
    object Salvar1: TMenuItem
      Caption = '&Salvar'
      OnClick = Salvar1Click
    end
    object Imprimir1: TMenuItem
      Caption = '&Imprimir'
      OnClick = Imprimir1Click
    end
  end
end
