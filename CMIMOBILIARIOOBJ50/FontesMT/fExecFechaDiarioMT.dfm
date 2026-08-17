inherited frmExecFechaDiarioMT: TfrmExecFechaDiarioMT
  Left = 120
  Top = 173
  HelpContext = 1350021
  Caption = 'Contabilização Diária - Fechamento Mês'
  ClientWidth = 547
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 547
    inherited PagControle: TPageControl
      Width = 545
      inherited tabSelecao: TTabSheet
        inherited lblTitulo: TfcLabel
          Width = 537
          Caption = 'Fechamento Mês [ Seleção ]'
        end
        object Label5: TLabel
          Left = 24
          Top = 88
          Width = 135
          Height = 13
          Caption = 'Competência (mês/ano)'
        end
        object GroupBox1: TGroupBox
          Left = 388
          Top = 24
          Width = 149
          Height = 198
          Align = alRight
          TabOrder = 0
          object Bevel1: TBevel
            Left = 1
            Top = 73
            Width = 146
            Height = 8
            Shape = bsTopLine
          end
          object Label1: TLabel
            Left = 42
            Top = 67
            Width = 66
            Height = 13
            Caption = ' Novo Mês '
          end
          object chkFecha: TCheckBox
            Left = 10
            Top = 32
            Width = 129
            Height = 17
            Caption = 'Fecha Previsão'
            Checked = True
            Enabled = False
            State = cbChecked
            TabOrder = 0
          end
          object chkConsolida: TCheckBox
            Left = 10
            Top = 109
            Width = 129
            Height = 17
            Caption = 'Consolida Previsão'
            Checked = True
            State = cbChecked
            TabOrder = 1
          end
          object chkIntegra: TCheckBox
            Left = 10
            Top = 157
            Width = 129
            Height = 17
            Caption = 'Integra Previsão'
            Checked = True
            State = cbChecked
            TabOrder = 2
          end
        end
        object cboMes: TwwDBComboBox
          Left = 24
          Top = 102
          Width = 169
          Height = 21
          ShowButton = True
          Style = csDropDown
          MapList = True
          AllowClearKey = False
          DataField = 'MESCOMPETENCIA'
          DropDownCount = 8
          Enabled = False
          ItemHeight = 0
          Items.Strings = (
            'Janeiro'#9'1'
            'Fevereiro'#9'2'
            'Março'#9'3'
            'Abril'#9'4'
            'Maio'#9'5'
            'Junho'#9'6'
            'Julho'#9'7'
            'Agosto'#9'8'
            'Setembro'#9'9'
            'Outubro'#9'10'
            'Novembro'#9'11'
            'Dezembro'#9'12')
          Sorted = False
          TabOrder = 1
          UnboundDataType = wwDefault
        end
        object DBspnAno: TwwDBSpinEdit
          Left = 200
          Top = 102
          Width = 65
          Height = 21
          Increment = 1
          DataField = 'ANOCOMPETENCIA'
          Enabled = False
          TabOrder = 2
          UnboundDataType = wwDefault
        end
      end
      inherited TabSheet1: TTabSheet
        inherited fcLabel1: TfcLabel
          Width = 537
          Caption = 'Fechamento Mês [ resultado ]'
        end
        object memResultado: TwwDBRichEdit
          Left = 0
          Top = 24
          Width = 537
          Height = 198
          Align = alClient
          AutoURLDetect = False
          PopupMenu = PopupMenu1
          PrintJobName = 'Delphi 5'
          ReadOnly = True
          TabOrder = 0
          PopupOptions = [rpoPopupEdit, rpoPopupCut, rpoPopupCopy]
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
            820000007B5C727466315C616E73695C616E7369637067313235325C64656666
            305C6465666C616E67313034367B5C666F6E7474626C7B5C66305C666E696C20
            4D532053616E732053657269663B7D7D0D0A5C766965776B696E64345C756331
            5C706172645C625C66305C66733134206D656D526573756C7461646F5C706172
            0D0A7D0D0A00}
        end
      end
    end
  end
  inherited Dock971: TDock97
    Width = 547
    inherited tb97Fundo: TToolbar97
      Left = 170
      inherited sep1: TToolbarSep97
        Left = 290
      end
      inherited bbtnSair: TBitBtn
        Left = 209
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 292
      end
      inherited btnContinuar: TfcShapeBtn
        Caption = 'Confirmar'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
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
      end
      inherited btnConfirmar: TfcShapeBtn
        Width = 43
        Visible = False
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
  object SaveDialog1: TSaveDialog
    Filter = 'Arquivos Texto (*.txt)|*.txt|Todos Arquivos (*.*)|*.*'
    Left = 433
    Top = 59
  end
  object PrintDialog1: TPrintDialog
    Left = 433
    Top = 115
  end
  object PopupMenu1: TPopupMenu
    Left = 441
    Top = 171
    object mnuSalvar: TMenuItem
      Caption = 'Salvar'
      OnClick = mnuSalvarClick
    end
    object mnuImprimir: TMenuItem
      Caption = 'Imprimir'
      OnClick = mnuImprimirClick
    end
  end
end
