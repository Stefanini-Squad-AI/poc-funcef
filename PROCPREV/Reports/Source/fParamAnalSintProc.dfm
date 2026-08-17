inherited frmParamAnalSintProc: TfrmParamAnalSintProc
  Caption = 
    'Seleção de Processos para o Relatório de Análise Sintética dos P' +
    'rocessos'
  ClientHeight = 450
  Font.Style = []
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 411
    inherited pnResult: TPanel
      Height = 403
    end
    inherited pgctrlPrincipal: TPageControl
      Height = 403
      inherited tbshGeral: TTabSheet
        inherited rgSitProc: TRadioGroup
          Top = 46
        end
        inherited gbxNumPr: TGroupBox
          Left = 202
          Top = 433
          Visible = False
          inherited Label2: TLabel
            Width = 6
          end
        end
        inherited gbxTipEncer: TGroupBox
          Top = 97
        end
        inherited rgParte: TRadioGroup
          Top = 97
        end
        inherited gbxSalario: TGroupBox
          Top = 97
          inherited Label4: TLabel
            Width = 6
          end
        end
        inherited gbxFaixaInc: TGroupBox
          Top = 163
          inherited Label15: TLabel
            Width = 6
          end
        end
        inherited gbxFaixaAju: TGroupBox
          Top = 205
          inherited Label6: TLabel
            Width = 6
          end
        end
        inherited gbxFaixaData: TGroupBox
          Top = 247
          inherited Label3: TLabel
            Width = 6
          end
        end
        inherited gbxDataEnc: TGroupBox
          Top = 288
          inherited Label5: TLabel
            Width = 6
          end
        end
        inherited gbxTempAdm: TGroupBox
          Top = 329
          inherited Label1: TLabel
            Width = 6
          end
        end
        inherited rgTipoProc: TRadioGroup
          Top = 163
        end
        inherited gbxTipoProc: TGroupBox
          Top = 197
        end
        inherited rgTipoAcao: TRadioGroup
          Top = 163
        end
        inherited gbxTipoAcao: TGroupBox
          Top = 197
        end
        object gbxTituloRelat: TGroupBox
          Left = 7
          Top = 0
          Width = 591
          Height = 43
          Caption = 'Título do Relatório'
          TabOrder = 14
          object edTituloRelat: TEdit
            Left = 8
            Top = 14
            Width = 574
            Height = 21
            TabOrder = 0
          end
        end
        object grpMesRef: TGroupBox
          Left = 322
          Top = 45
          Width = 276
          Height = 43
          Caption = ' Mês e Ano de Referência '
          TabOrder = 15
          object cmbMes: TComboBox
            Left = 25
            Top = 14
            Width = 122
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 0
            OnChange = cmbMesChange
            Items.Strings = (
              'Janeiro'
              'Fevereiro'
              'Março'
              'Abril'
              'Maio'
              'Junho'
              'Julho'
              'Agosto'
              'Setembro'
              'Outubro'
              'Novembro'
              'Dezembro')
          end
          object spedAno: TSpinEdit
            Left = 176
            Top = 14
            Width = 77
            Height = 22
            MaxValue = 0
            MinValue = 0
            TabOrder = 1
            Value = 0
          end
        end
      end
      inherited tbshContraParte: TTabSheet
        inherited pgctrlContraParte: TPageControl
          Height = 375
          inherited tsDadosFunc: TTabSheet
            inherited pnlSelDadosFunc: TPanel
              inherited GroupBox1: TGroupBox
                inherited Label7: TLabel
                  Width = 6
                end
              end
              inherited GroupBox2: TGroupBox
                inherited Label8: TLabel
                  Width = 6
                end
                inherited SpinEdit1: TSpinEdit
                  Height = 21
                end
                inherited SpinEdit2: TSpinEdit
                  Height = 21
                end
              end
              inherited gbxTempCar: TGroupBox
                inherited Label9: TLabel
                  Width = 6
                end
                inherited ednCar1: TSpinEdit
                  Height = 21
                end
                inherited ednCar2: TSpinEdit
                  Height = 21
                end
              end
            end
          end
          inherited tsDadosPess: TTabSheet
            inherited gbxIdade: TGroupBox
              inherited Label10: TLabel
                Width = 6
              end
              inherited ednIda1: TSpinEdit
                Height = 21
              end
              inherited ednIda2: TSpinEdit
                Height = 21
              end
            end
            inherited gbxCep: TGroupBox
              inherited Label11: TLabel
                Width = 6
              end
            end
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 411
  end
  inherited Cmp_Padrao: TCmParamReport
    Params = <
      item
        Caption = 'ListaNumProcesso'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'ListaNumProcesso'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'MesRef'
        Controle = tcEdit
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'MesRef'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'AnoRef'
        Controle = tcEdit
        TipodeDado = tdInteger
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'AnoRef'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end
      item
        Caption = 'TituloRelatorio'
        Controle = tcEdit
        TipodeDado = tdString
        LookupSettings.SQL.Strings = ()
        LookupSettings.Tamanho = '0'
        CheckBoxSetings.ValueChecked = 'True'
        CheckBoxSetings.ValueUnChecked = 'False'
        CheckBoxSetings.Checked = True
        RadioGroupSettings.Items.Strings = ()
        RadioGroupSettings.Values.Strings = ()
        RadioGroupSettings.Columns = 1
        RadioGroupSettings.ItemIndex = -1
        RadioGroupSettings.Height = 40
        ComboBoxSettings.Sorted = False
        ComboBoxSettings.Style = csDropDownList
        ComboBoxSettings.Items.Strings = ()
        ComboBoxSettings.DropDownCount = 8
        ComboBoxSettings.ItemIndex = -1
        ListBoxSettings.Items.Strings = ()
        ListBoxSettings.MultiSelect = False
        ListBoxSettings.ExtendedSelect = False
        ListBoxSettings.Sorted = False
        ListBoxSettings.Style = lbStandard
        ListBoxSettings.height = 70
        MostraComboCompara = True
        Required = False
        EditSettings.Color = clWindow
        EditSettings.Readonly = False
        EditSettings.Font.Charset = DEFAULT_CHARSET
        EditSettings.Font.Color = clWindowText
        EditSettings.Font.Height = -11
        EditSettings.Font.Name = 'MS Sans Serif'
        EditSettings.Font.Style = [fsBold]
        Name = 'TituloRelatorio'
        SpinEditSettings.MaxValue = 0
        SpinEditSettings.MinValue = 0
        SpinEditSettings.Increment = 0
        SpinEditSettings.Value = 0
        MaskEditSettings.MaxLength = 0
        ProcuraSTSettings.Subtipo = stFornecedor
        ProcuraSTSettings.CampoEdit = ceRazaoSocial
        ProcuraSTSettings.FiltraSubTipo = True
        ProcuraFCSettings.Status = fcAll
        ProcuraFCSettings.CampoEdit = ceRazaoSocial
        ProcuraFCSettings.MostraEndereco = False
        ProcuraFCSettings.ForCli = fcFornecedor
        ProcuraCCSettings.Plano = 0
        ProcuraCCSettings.Status = scSoAtiva
        ProcuraCCSettings.AceitaTipoConta = Indiferente
        Width = 0
      end>
  end
end
