inherited FrmWizRenumPlanil: TFrmWizRenumPlanil
  Left = 42
  Top = 84
  HelpContext = 10136
  Caption = 'Ativação da numeração de planilhas por SEQUENCE'
  ClientHeight = 423
  ClientWidth = 637
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 637
    Height = 384
    inherited PagControle: TPageControl
      Width = 635
      Height = 382
      ActivePage = TabSheet1
      inherited tabSelecao: TTabSheet
        inherited lblTitulo: TfcLabel
          Width = 627
          Caption = 'Ativação da numeração por "Sequence" [ Ativação ]'
        end
        object Panel1: TPanel
          Left = 0
          Top = 24
          Width = 627
          Height = 348
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
          Width = 627
          Caption = 'Processamento dos períodos [ Seleção ]'
        end
        object Panel2: TPanel
          Left = 0
          Top = 24
          Width = 627
          Height = 348
          Align = alClient
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 0
          object Panel3: TPanel
            Left = 2
            Top = 2
            Width = 623
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
          object Panel4: TPanel
            Left = 2
            Top = 178
            Width = 623
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
            TabOrder = 1
          end
          object meErros: TwwDBRichEdit
            Left = 2
            Top = 198
            Width = 623
            Height = 148
            Hint = 'Clique com o botão direito do mouse para Imprimir ou Salvar.'
            ScrollBars = ssBoth
            Align = alClient
            AutoURLDetect = False
            ParentShowHint = False
            PopupMenu = PopupMenu1
            PrintJobName = 'Log de Operações'
            ReadOnly = True
            ShowHint = True
            TabOrder = 2
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
          object Panel5: TPanel
            Left = 2
            Top = 22
            Width = 623
            Height = 156
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 3
            object DbgPeriodo: TwwDBGrid
              Left = 0
              Top = 0
              Width = 597
              Height = 156
              Hint = 'Clique sobe o título da coluna para ordenar'
              ControlType.Strings = (
                'FLGSEQUENCE;CheckBox;S;N')
              Selected.Strings = (
                'FLGSEQUENCE'#9'1'#9'Renumerar'#9'F'
                'PERNUMERO'#9'2'#9'Período'#9'F'
                'PEREXERCICIO'#9'4'#9'Exercício'#9'F'
                'PERDATINI'#9'10'#9'Data Inicial'#9'F'
                'PERDATFIM'#9'10'#9'Data Final'#9'F'
                'PERNOME'#9'25'#9'Descrição'#9'F'
                'PERBLOINT'#9'1'#9'Integrado'#9'F')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = DsPeriodo
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              TitleAlignment = taLeftJustify
              TitleFont.Charset = DEFAULT_CHARSET
              TitleFont.Color = clWindowText
              TitleFont.Height = -9
              TitleFont.Name = 'MS Sans Serif'
              TitleFont.Style = [fsBold]
              TitleLines = 1
              TitleButtons = False
              OnDrawDataCell = DbgPeriodoDrawDataCell
              OnMouseUp = DbgPeriodoMouseUp
              IndicatorColor = icBlack
            end
            object Panel6: TPanel
              Left = 597
              Top = 0
              Width = 26
              Height = 156
              Align = alRight
              AutoSize = True
              BevelInner = bvSpace
              BevelOuter = bvLowered
              TabOrder = 1
              object spdbCheck: TSpeedButton
                Left = 2
                Top = 1
                Width = 22
                Height = 22
                Hint = 'Marcar todos'
                Flat = True
                Glyph.Data = {
                  F6000000424DF600000000000000760000002800000010000000100000000100
                  0400000000008000000000000000000000001000000000000000000000000000
                  8000008000000080800080000000800080008080000080808000C0C0C0000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                  888888FFFFFFFFFFFFF888708888888888F88870FFFFFFFFF8F88870FFF0FFFF
                  F8F88870FF000FFFF8F88870F00000FFF8F88870F00F000FF8F88870F0FFF000
                  F8F88870FFFFFF00F8F88870FFFFFFF0F8F88870FFFFFFFFF8F8887000000000
                  00F8887777777777777888888888888888888888888888888888}
                ParentShowHint = False
                ShowHint = True
                OnClick = spdbCheckClick
              end
              object spdbUnCheck: TSpeedButton
                Left = 2
                Top = 25
                Width = 22
                Height = 22
                Hint = 'Desmarcar todos'
                Flat = True
                Glyph.Data = {
                  F6000000424DF600000000000000760000002800000010000000100000000100
                  0400000000008000000000000000000000001000000000000000000000000000
                  8000008000000080800080000000800080008080000080808000C0C0C0000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                  888888FFFFFFFFFFFFF888708888888888F88870FFFFFFFFF8F88870FFFFFFFF
                  F8F88870FFFFFFFFF8F88870FFFFFFFFF8F88870FFFFFFFFF8F88870FFFFFFFF
                  F8F88870FFFFFFFFF8F88870FFFFFFFFF8F88870FFFFFFFFF8F8887000000000
                  00F8887777777777777888888888888888888888888888888888}
                ParentShowHint = False
                ShowHint = True
                OnClick = spdbUnCheckClick
              end
            end
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 384
    Width = 637
    inherited tb97Fundo: TToolbar97
      Left = 197
      inherited btnConfirmar: TfcShapeBtn
        OnClick = btnConfirmarClick
      end
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
  object PopupMenu1: TPopupMenu
    Left = 86
    Top = 243
    object Salvar1: TMenuItem
      Caption = '&Salvar'
      OnClick = Salvar1Click
    end
    object Imprimir1: TMenuItem
      Caption = '&Imprimir'
      OnClick = Imprimir1Click
    end
  end
  object SaveDialog1: TSaveDialog
    Filter = 'Texto|*.txt'
    Left = 193
    Top = 241
  end
  object CdsPeriodos: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 221
    Top = 71
    object CdsPeriodosFLGSEQUENCE: TStringField
      FieldName = 'FLGSEQUENCE'
      FixedChar = True
      Size = 1
    end
    object CdsPeriodosPERNUMERO: TFloatField
      FieldName = 'PERNUMERO'
    end
    object CdsPeriodosPEREXERCICIO: TFloatField
      FieldName = 'PEREXERCICIO'
    end
    object CdsPeriodosPERDATINI: TDateTimeField
      FieldName = 'PERDATINI'
    end
    object CdsPeriodosPERDATFIM: TDateTimeField
      FieldName = 'PERDATFIM'
    end
    object CdsPeriodosPERNOME: TStringField
      FieldName = 'PERNOME'
      Size = 25
    end
    object CdsPeriodosPERPLANIL: TFloatField
      FieldName = 'PERPLANIL'
    end
    object CdsPeriodosPERBLOINT: TStringField
      FieldName = 'PERBLOINT'
      FixedChar = True
      Size = 1
    end
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
      '  PERPLANIL,'
      ' PERBLOINT '
      'FROM PERIODO '
      'WHERE 1 = 2')
    ClientDataSet = CdsPeriodos
    Left = 301
    Top = 63
  end
  object DsPeriodo: TwwDataSource
    DataSet = CdsPeriodos
    Left = 165
    Top = 71
  end
  object cdsParamContab: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 397
    Top = 71
  end
  object DsParamContab: TwwDataSource
    DataSet = cdsParamContab
    Left = 509
    Top = 63
  end
end
