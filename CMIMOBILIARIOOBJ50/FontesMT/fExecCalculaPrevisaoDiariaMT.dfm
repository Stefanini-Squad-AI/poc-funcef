inherited frmExecCalculaPrevisaoDiariaMT: TfrmExecCalculaPrevisaoDiariaMT
  Left = 50
  Top = 164
  HelpContext = 1350018
  Caption = 'Contabilização Diária'
  ClientHeight = 325
  ClientWidth = 694
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 694
    Height = 286
    inherited PagControle: TPageControl
      Width = 692
      Height = 284
      inherited tabSelecao: TTabSheet
        inherited lblTitulo: TfcLabel
          Width = 684
          Caption = 'Contabilização Diária [ seleção ]'
        end
        object Label5: TLabel
          Left = 24
          Top = 40
          Width = 135
          Height = 13
          Caption = 'Competência (mês/ano)'
        end
        object Label1: TLabel
          Left = 24
          Top = 160
          Width = 108
          Height = 13
          Caption = 'Receita / Despesa'
        end
        object cboMes: TwwDBComboBox
          Left = 24
          Top = 54
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
          TabOrder = 0
          UnboundDataType = wwDefault
        end
        object DBspnAno: TwwDBSpinEdit
          Left = 200
          Top = 54
          Width = 65
          Height = 21
          Increment = 1
          DataField = 'ANOCOMPETENCIA'
          Enabled = False
          TabOrder = 1
          UnboundDataType = wwDefault
        end
        object rdPeriodicidade: TRadioGroup
          Left = 24
          Top = 96
          Width = 241
          Height = 49
          Caption = ' Periodicidade Despesa / Receita '
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'Mensal'
            'Anual')
          TabOrder = 2
          OnClick = rdPeriodicidadeClick
        end
        object dbCboTipoCustoRecImov: TwwDBLookupCombo
          Left = 24
          Top = 176
          Width = 321
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCCUSTORECIMO'#9'60'#9'Receita / Despesa'#9'F')
          LookupTable = CdsTipoCustoRecImov
          LookupField = 'IDTIPOCUSTORECIMO'
          DropDownWidth = 313
          TabOrder = 3
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
        end
        object GroupBox1: TGroupBox
          Left = 535
          Top = 24
          Width = 149
          Height = 250
          Align = alRight
          TabOrder = 4
          object chkRegistra: TCheckBox
            Left = 10
            Top = 40
            Width = 129
            Height = 17
            Caption = 'Registra Previsão'
            Checked = True
            State = cbChecked
            TabOrder = 0
          end
          object chkConsolida: TCheckBox
            Left = 10
            Top = 96
            Width = 129
            Height = 17
            Caption = 'Consolida Previsão'
            Checked = True
            State = cbChecked
            TabOrder = 1
          end
          object chkIntegra: TCheckBox
            Left = 10
            Top = 152
            Width = 129
            Height = 17
            Caption = 'Integra Previsão'
            Checked = True
            State = cbChecked
            TabOrder = 2
          end
        end
        inline molImovelouMestre1: TmolImovelouMestre
          Left = 16
          Top = 216
          TabOrder = 5
        end
      end
      inherited TabSheet1: TTabSheet
        inherited fcLabel1: TfcLabel
          Width = 684
          Caption = 'Contabilização Diária [ resultados ]'
        end
        object memResultado: TwwDBRichEdit
          Left = 0
          Top = 24
          Width = 684
          Height = 250
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
    Top = 286
    Width = 694
    inherited tb97Fundo: TToolbar97
      Left = 321
      inherited sep1: TToolbarSep97
        Left = 286
      end
      inherited bbtnSair: TBitBtn
        Left = 205
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 288
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
        Width = 39
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
  object CdsTipoCustoRecImov: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    StoreDefs = True
    Left = 168
    Top = 160
    object CdsTipoCustoRecImovDESCCUSTORECIMO: TStringField
      DisplayLabel = 'Receita / Despesa'
      DisplayWidth = 60
      FieldName = 'DESCCUSTORECIMO'
      Size = 60
    end
    object CdsTipoCustoRecImovFLGDIARIO: TStringField
      DisplayWidth = 1
      FieldName = 'FLGDIARIO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object CdsTipoCustoRecImovIDTIPOCUSTORECIMO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOCUSTORECIMO'
      Visible = False
    end
    object CdsTipoCustoRecImovRECCUSTO: TStringField
      DisplayWidth = 1
      FieldName = 'RECCUSTO'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object wwQuery1: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      'FLGDIARIO, IDTIPOCUSTORECIMO, DESCCUSTORECIMO, RECCUSTO'
      'FROM TIPOCUSTORECIMOV')
    ValidateWithMask = True
    Left = 464
    Top = 65528
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = wwQuery1
    Constraints = True
    Left = 376
    Top = 65528
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
