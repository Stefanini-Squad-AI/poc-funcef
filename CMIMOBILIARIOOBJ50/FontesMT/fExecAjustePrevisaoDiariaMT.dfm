inherited frmExecAjustePrevisaoDiariaMT: TfrmExecAjustePrevisaoDiariaMT
  Left = 270
  Top = 144
  HelpContext = 1350020
  Caption = 'Ajusta Contabilização Diária'
  ClientHeight = 381
  ClientWidth = 645
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 645
    Height = 342
    inherited PagControle: TPageControl
      Width = 643
      Height = 340
      inherited tabSelecao: TTabSheet
        inherited lblTitulo: TfcLabel
          Width = 635
          Caption = 'Ajuste Contabilização Diária [ Seleção ]'
        end
        object pcSelecao: TPageControl
          Left = 0
          Top = 24
          Width = 635
          Height = 306
          ActivePage = tsSelOperacao
          Align = alClient
          TabOrder = 0
          object tsSelOperacao: TTabSheet
            Caption = 'Operações Contábeis'
            object GroupBox1: TGroupBox
              Left = 16
              Top = 80
              Width = 577
              Height = 193
              Caption = ' Operações Contábeis para processamento '
              TabOrder = 0
              object chkCalculaProvisao: TCheckBox
                Left = 16
                Top = 83
                Width = 183
                Height = 17
                Caption = 'Calcula Provisão de Perdas'
                Checked = True
                State = cbChecked
                TabOrder = 2
              end
              object chkIntegraProvisao: TCheckBox
                Left = 16
                Top = 99
                Width = 183
                Height = 17
                Caption = 'Integra Provisão de Perdas'
                Checked = True
                State = cbChecked
                TabOrder = 3
              end
              object chkAtualizaDocum: TCheckBox
                Left = 16
                Top = 24
                Width = 223
                Height = 17
                Caption = 'Atualiza Documentos Vencidos'
                Checked = True
                State = cbChecked
                TabOrder = 0
              end
              object chkIntegraAtual: TCheckBox
                Left = 16
                Top = 56
                Width = 217
                Height = 17
                Caption = 'Integra Atualizações Contábil'
                Checked = True
                State = cbChecked
                TabOrder = 1
              end
              object chkCalculaReceita: TCheckBox
                Left = 16
                Top = 131
                Width = 215
                Height = 17
                Caption = 'Calcula Provisão de Receitas'
                Checked = True
                State = cbChecked
                TabOrder = 4
              end
              object chkIntegraReceita: TCheckBox
                Left = 16
                Top = 147
                Width = 207
                Height = 17
                Caption = 'Integra Provisão de Receitas'
                Checked = True
                State = cbChecked
                TabOrder = 5
              end
              object chkCalculaJurosAlienacao: TCheckBox
                Left = 328
                Top = 24
                Width = 215
                Height = 17
                Caption = 'Calcula Juros de Alienação'
                Checked = True
                State = cbChecked
                TabOrder = 6
              end
              object chkIntegraJurosAlienacao: TCheckBox
                Left = 328
                Top = 40
                Width = 207
                Height = 17
                Caption = 'Integra Juros de Alienação'
                Checked = True
                State = cbChecked
                TabOrder = 7
              end
              object chkAtualizaResiduo: TCheckBox
                Left = 328
                Top = 107
                Width = 215
                Height = 17
                Caption = 'Calcula Atualização de Resíduo'
                Checked = True
                State = cbChecked
                TabOrder = 8
              end
              object chkIntegraAtualResiduo: TCheckBox
                Left = 328
                Top = 123
                Width = 207
                Height = 17
                Caption = 'Integra Atualização de Resíduo'
                TabOrder = 9
              end
              object chkIntegraFinanc: TCheckBox
                Left = 16
                Top = 40
                Width = 217
                Height = 17
                Caption = 'Integra Atualizações Financeiro'
                Checked = True
                State = cbChecked
                TabOrder = 10
              end
              object chkIntegraSaldo: TCheckBox
                Left = 328
                Top = 163
                Width = 207
                Height = 17
                Caption = 'Integra Atualização de Saldo'
                TabOrder = 11
              end
              object chkCalculaCMAlienacao: TCheckBox
                Left = 328
                Top = 67
                Width = 215
                Height = 17
                Caption = 'Calcula Corr. Mon. de Alienação'
                Checked = True
                State = cbChecked
                TabOrder = 12
              end
              object chkIntegraCMAlienacao: TCheckBox
                Left = 328
                Top = 83
                Width = 207
                Height = 17
                Caption = 'Integra Corr. Mon. de Alienação'
                TabOrder = 13
              end
            end
            object GroupBox5: TGroupBox
              Left = 16
              Top = 8
              Width = 241
              Height = 65
              Caption = 'Período de Processamento'
              TabOrder = 1
              object Label2: TLabel
                Left = 24
                Top = 16
                Width = 66
                Height = 13
                Caption = 'Data Inicial'
              end
              object Label4: TLabel
                Left = 128
                Top = 16
                Width = 59
                Height = 13
                Caption = 'Data Final'
              end
              object edtDataProv: TCMDateTimePicker
                Left = 24
                Top = 30
                Width = 91
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                Epoch = 1950
                ButtonGlyph.Data = {
                  06050000424D06050000000000003604000028000000100000000D0000000100
                  080000000000D000000000000000000000000001000000000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                  A6000020400000206000002080000020A0000020C0000020E000004000000040
                  20000040400000406000004080000040A0000040C0000040E000006000000060
                  20000060400000606000006080000060A0000060C0000060E000008000000080
                  20000080400000806000008080000080A0000080C0000080E00000A0000000A0
                  200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
                  200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
                  200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
                  20004000400040006000400080004000A0004000C0004000E000402000004020
                  20004020400040206000402080004020A0004020C0004020E000404000004040
                  20004040400040406000404080004040A0004040C0004040E000406000004060
                  20004060400040606000406080004060A0004060C0004060E000408000004080
                  20004080400040806000408080004080A0004080C0004080E00040A0000040A0
                  200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
                  200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
                  200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
                  20008000400080006000800080008000A0008000C0008000E000802000008020
                  20008020400080206000802080008020A0008020C0008020E000804000008040
                  20008040400080406000804080008040A0008040C0008040E000806000008060
                  20008060400080606000806080008060A0008060C0008060E000808000008080
                  20008080400080806000808080008080A0008080C0008080E00080A0000080A0
                  200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
                  200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
                  200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
                  2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
                  2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
                  2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
                  2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
                  2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
                  2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
                  2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
                  000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
                  A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
                  A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
                  A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
                  FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
                  04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
                  000000000000000000FF}
                ShowButton = True
                TabOrder = 0
              end
              object edtDataFim: TCMDateTimePicker
                Left = 128
                Top = 30
                Width = 91
                Height = 21
                CalendarAttributes.Font.Charset = DEFAULT_CHARSET
                CalendarAttributes.Font.Color = clWindowText
                CalendarAttributes.Font.Height = -11
                CalendarAttributes.Font.Name = 'MS Sans Serif'
                CalendarAttributes.Font.Style = []
                ButtonStyle = cbsCustom
                Epoch = 1950
                ButtonGlyph.Data = {
                  06050000424D06050000000000003604000028000000100000000D0000000100
                  080000000000D000000000000000000000000001000000000000000000000000
                  80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                  A6000020400000206000002080000020A0000020C0000020E000004000000040
                  20000040400000406000004080000040A0000040C0000040E000006000000060
                  20000060400000606000006080000060A0000060C0000060E000008000000080
                  20000080400000806000008080000080A0000080C0000080E00000A0000000A0
                  200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
                  200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
                  200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
                  20004000400040006000400080004000A0004000C0004000E000402000004020
                  20004020400040206000402080004020A0004020C0004020E000404000004040
                  20004040400040406000404080004040A0004040C0004040E000406000004060
                  20004060400040606000406080004060A0004060C0004060E000408000004080
                  20004080400040806000408080004080A0004080C0004080E00040A0000040A0
                  200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
                  200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
                  200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
                  20008000400080006000800080008000A0008000C0008000E000802000008020
                  20008020400080206000802080008020A0008020C0008020E000804000008040
                  20008040400080406000804080008040A0008040C0008040E000806000008060
                  20008060400080606000806080008060A0008060C0008060E000808000008080
                  20008080400080806000808080008080A0008080C0008080E00080A0000080A0
                  200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
                  200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
                  200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
                  2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
                  2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
                  2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
                  2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
                  2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
                  2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
                  2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
                  000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
                  A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
                  A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
                  A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
                  FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
                  04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
                  000000000000000000FF}
                ShowButton = True
                TabOrder = 1
              end
            end
            object gbDocumento: TGroupBox
              Left = 496
              Top = 31
              Width = 113
              Height = 45
              Caption = 'Documento '
              TabOrder = 2
              Visible = False
              object edtDoc: TRealEdit
                Left = 16
                Top = 18
                Width = 89
                Height = 21
                Alignment = taRightJustify
                Color = 12648447
                Lines.Strings = (
                  '        0')
                TabOrder = 0
                WordWrap = False
                OnExit = edtDocExit
                IntDigits = 10
                DecDigits = 0
                NumberFormat = fNumber
                Signal = True
              end
            end
            object chkGeraLog: TCheckBox
              Left = 304
              Top = 59
              Width = 185
              Height = 17
              Caption = 'Gera Log de Atualização'
              TabOrder = 3
            end
            object chkAtualizaSaldo: TCheckBox
              Left = 344
              Top = 227
              Width = 215
              Height = 17
              Caption = 'Calcula Atualização de Saldo'
              Checked = True
              State = cbChecked
              TabOrder = 4
            end
            object chkExeRotinaETL: TCheckBox
              Left = 304
              Top = 43
              Width = 185
              Height = 17
              Caption = 'Executar rotina via ETL'
              Checked = True
              State = cbChecked
              TabOrder = 5
            end
          end
          object tsSelRecDes: TTabSheet
            Caption = 'Receitas e Despesas'
            ImageIndex = 1
            object GroupBox3: TGroupBox
              Left = 100
              Top = 8
              Width = 409
              Height = 284
              Caption = ' Provisão Diária de Receitas e Despesas '
              TabOrder = 0
              object Label1: TLabel
                Left = 16
                Top = 99
                Width = 108
                Height = 13
                Caption = 'Receita / Despesa'
              end
              object rdPeriodicidade: TRadioGroup
                Left = 288
                Top = 24
                Width = 105
                Height = 65
                Caption = ' Periodicidade '
                ItemIndex = 0
                Items.Strings = (
                  'Mensal'
                  'Anual')
                TabOrder = 1
                OnClick = rdPeriodicidadeClick
              end
              object dbCboTipoCustoRecImov: TwwDBLookupCombo
                Left = 16
                Top = 113
                Width = 377
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCCUSTORECIMO'#9'60'#9'Receita / Despesa'#9'F')
                LookupTable = CdsTipoCustoRecImov
                LookupField = 'IDTIPOCUSTORECIMO'
                DropDownWidth = 313
                TabOrder = 2
                AutoDropDown = False
                ShowButton = True
                AllowClearKey = False
              end
              object chkEncerra: TCheckBox
                Left = 24
                Top = 137
                Width = 311
                Height = 17
                Caption = 'Utilizar Características de Encerramento'
                TabOrder = 3
              end
              inline molImovelouMestre1: TmolImovelouMestre
                Left = 8
                Top = 158
                Height = 49
                TabOrder = 4
                inherited edtImovel: TEdit
                  Width = 328
                end
                inherited btnBuscaImovel: TBitBtn
                  Left = 336
                end
                inherited btnLimpaImovel: TBitBtn
                  Left = 360
                end
              end
              object GroupBox4: TGroupBox
                Left = 16
                Top = 24
                Width = 257
                Height = 65
                Caption = ' Competência '
                TabOrder = 0
                object Label5: TLabel
                  Left = 16
                  Top = 18
                  Width = 24
                  Height = 13
                  Caption = 'Mês'
                end
                object Label3: TLabel
                  Left = 176
                  Top = 18
                  Width = 23
                  Height = 13
                  Caption = 'Ano'
                end
                object cboMes: TwwDBComboBox
                  Left = 16
                  Top = 32
                  Width = 161
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
                  Left = 176
                  Top = 32
                  Width = 65
                  Height = 21
                  Increment = 1
                  DataField = 'ANOCOMPETENCIA'
                  Enabled = False
                  TabOrder = 1
                  UnboundDataType = wwDefault
                end
              end
              object GroupBox2: TGroupBox
                Left = 16
                Top = 208
                Width = 377
                Height = 65
                Caption = ' Processos '
                TabOrder = 5
                object chkAjusta: TCheckBox
                  Left = 13
                  Top = 17
                  Width = 129
                  Height = 19
                  Caption = 'Ajusta Provisão'
                  Checked = True
                  State = cbChecked
                  TabOrder = 0
                end
                object chkConsolida: TCheckBox
                  Left = 13
                  Top = 37
                  Width = 129
                  Height = 19
                  Caption = 'Consolida Provisão'
                  Checked = True
                  State = cbChecked
                  TabOrder = 1
                end
                object chkIntegra: TCheckBox
                  Left = 186
                  Top = 17
                  Width = 129
                  Height = 19
                  Caption = 'Integra Provisão'
                  Checked = True
                  State = cbChecked
                  TabOrder = 2
                end
              end
            end
          end
        end
      end
      inherited TabSheet1: TTabSheet
        inherited fcLabel1: TfcLabel
          Width = 635
          Caption = 'Ajuste Contabilização Diária [ resultado ]'
        end
        object memResultado: TwwDBRichEdit
          Left = 0
          Top = 24
          Width = 635
          Height = 306
          ScrollBars = ssVertical
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
    Top = 342
    Width = 645
    inherited tb97Fundo: TToolbar97
      Left = 243
      inherited sep1: TToolbarSep97
        Left = 315
      end
      inherited CMSeparaWizard2: TToolbarSep97
        Left = 83
      end
      inherited CMSeparaWizard1: TToolbarSep97
        Left = 166
      end
      inherited bbtnSair: TBitBtn
        Left = 234
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 317
      end
      inherited btnContinuar: TfcShapeBtn
        Left = 85
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
        Left = 191
        Width = 43
        Visible = False
      end
    end
  end
  object CdsTipoCustoRecImov: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 565
    Top = 8
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
  object SaveDialog1: TSaveDialog
    Filter = 'Arquivos Texto (*.txt)|*.txt|Todos Arquivos (*.*)|*.*'
    Left = 33
    Top = 411
  end
  object PrintDialog1: TPrintDialog
    Left = 113
    Top = 403
  end
  object PopupMenu1: TPopupMenu
    Left = 193
    Top = 403
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
