inherited frmWizardMT1: TfrmWizardMT1
  Left = 62
  Top = 113
  Caption = 'frmWizardMT1'
  ClientHeight = 342
  ClientWidth = 638
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 638
    Height = 303
    inherited PagControle: TPageControl
      Width = 636
      Height = 301
      ActivePage = TabSheet1
      inherited tabSelecao: TTabSheet
        inherited lblTitulo: TfcLabel
          Width = 628
          Caption = 'Ativação da numeração por "Sequence" [ passo 1 de 2 ]'
        end
        object Panel1: TPanel
          Left = 0
          Top = 24
          Width = 628
          Height = 267
          Align = alClient
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 0
          object Label1: TLabel
            Left = 33
            Top = 110
            Width = 559
            Height = 41
            AutoSize = False
            Caption = 
              'Ativar Numeração de Planilhas por "Sequence". Este processo é ir' +
              'reversível. Com este método a numeração não mais se repetirá, e ' +
              'não será garantida a seqüência exata (a seqüência poderá ser alt' +
              'ernada).'
            WordWrap = True
          end
          object DbChkRenum: TDBCheckBox
            Left = 35
            Top = 87
            Width = 62
            Height = 17
            Caption = 'Ativar'
            DataField = 'FLGPLNSEQUENCE'
            DataSource = DsParamContab
            TabOrder = 0
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
        end
      end
      inherited TabSheet1: TTabSheet
        inherited fcLabel1: TfcLabel
          Width = 628
          Caption = 'Processamento dos períodos [ passo 2 de 2]'
        end
        object Panel2: TPanel
          Left = 0
          Top = 24
          Width = 628
          Height = 267
          Align = alClient
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 0
          object Panel3: TPanel
            Left = 2
            Top = 2
            Width = 624
            Height = 20
            Align = alTop
            BevelInner = bvRaised
            BevelOuter = bvLowered
            Caption = 'Períodos Contábeis Desbloqueados'
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
          object wwDBGrid1: TwwDBGrid
            Left = 2
            Top = 22
            Width = 624
            Height = 131
            ControlType.Strings = (
              'FLGSEQUENCE;CheckBox;S;N')
            Selected.Strings = (
              'FLGSEQUENCE'#9'1'#9'Renumerar'#9'F'
              'PERNUMERO'#9'2'#9'Período'#9'F'
              'PEREXERCICIO'#9'4'#9'Exercício'#9'F'
              'PERDATINI'#9'10'#9'Data Inicial'#9'F'
              'PERDATFIM'#9'10'#9'Data Final'#9'F'
              'PERNOME'#9'25'#9'Período'#9'F'
              'PERPLANIL'#9'10'#9'Planilha'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alTop
            DataSource = DsPeriodo
            TabOrder = 1
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            IndicatorColor = icBlack
          end
          object Panel4: TPanel
            Left = 2
            Top = 153
            Width = 624
            Height = 20
            Align = alTop
            BevelInner = bvRaised
            BevelOuter = bvLowered
            Caption = 'Log do processamento'
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 2
          end
          object meErros: TwwDBRichEdit
            Left = 2
            Top = 173
            Width = 624
            Height = 92
            ScrollBars = ssBoth
            Align = alClient
            AutoURLDetect = False
            PrintJobName = 'Log de Operações'
            TabOrder = 3
            WordWrap = False
            PopupOptions = []
            EditorOptions = []
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
  end
  inherited Dock971: TDock97
    Top = 303
    Width = 638
    inherited tb97Fundo: TToolbar97
      Left = 198
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
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
  object PopupMenu2: TPopupMenu
    Left = 117
    Top = 243
    object MenuItem2: TMenuItem
      Caption = '&Imprimir'
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 86
    Top = 243
    object Salvar1: TMenuItem
      Caption = '&Salvar'
    end
    object Imprimir1: TMenuItem
      Caption = '&Imprimir'
    end
  end
  object SaveDialog1: TSaveDialog
    Filter = 'Texto|*.txt'
    Left = 193
    Top = 241
  end
  object CdsPeriodos: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 229
    Top = 103
    Data = {
      D80000009619E0BD010000001800000007000000000003000000D8000B464C47
      53455155454E434501004900000002000753554254595045020049000A004669
      7865644368617200055749445448020002000100095045524E554D45524F0800
      0400000000000C50455245584552434943494F08000400000000000950455244
      4154494E4908000800000000000950455244415446494D080008000000000007
      5045524E4F4D4501004900000001000557494454480200020019000950455250
      4C414E494C08000400000000000100044C4349440400010009080000}
  end
  object sqlPeriodos: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '  FLGSEQUENCE, '
      '  PERNUMERO, '
      '  PEREXERCICIO, '
      '  PERDATINI, '
      '  PERDATFIM, '
      '  PERNOME, '
      '  PERPLANIL '
      'FROM PERIODO '
      'WHERE 1 = 2')
    ClientDataSet = CdsPeriodos
    Left = 309
    Top = 103
  end
  object DsPeriodo: TwwDataSource
    DataSet = CdsPeriodos
    Left = 157
    Top = 103
  end
  object cdsParamContab: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 397
    Top = 63
  end
  object DsParamContab: TwwDataSource
    DataSet = cdsParamContab
    Left = 509
    Top = 63
  end
end
