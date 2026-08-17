inherited frmParamAnalSintProc: TfrmParamAnalSintProc
  Left = 79
  Top = 80
  HelpContext = 760028
  BorderStyle = bsToolWindow
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
          Top = 45
          TabOrder = 1
        end
        inherited gbxNumPr: TGroupBox
          Top = 45
          Width = 226
          Enabled = False
          Font.Color = clGray
          Font.Style = []
          ParentFont = False
          TabOrder = 3
          Visible = False
          inherited Label2: TLabel
            Left = 105
            Width = 6
          end
          inherited ednNum1: TEditNum
            Left = 9
            Width = 91
          end
          inherited ednNum2: TEditNum
            Left = 117
          end
        end
        inherited gbxTipEncer: TGroupBox
          Top = 91
          Height = 48
          TabOrder = 4
        end
        inherited gbxSalario: TGroupBox
          Top = 91
          Height = 48
          TabOrder = 5
          inherited Label4: TLabel
            Width = 6
          end
        end
        inherited gbxFaixaInc: TGroupBox
          Top = 141
          Height = 43
          TabOrder = 6
          inherited Label15: TLabel
            Width = 6
          end
        end
        inherited gbxFaixaAju: TGroupBox
          Top = 187
          Height = 43
          TabOrder = 7
          inherited Label1: TLabel
            Width = 6
          end
        end
        inherited gbxFaixaData: TGroupBox
          Top = 233
          Height = 43
          TabOrder = 8
          inherited Label3: TLabel
            Width = 6
          end
        end
        inherited gbxDataEnc: TGroupBox
          Top = 279
          Height = 43
          TabOrder = 9
          inherited Label5: TLabel
            Width = 6
          end
        end
        inherited gbxTempAdm: TGroupBox
          Top = 325
          Height = 43
          TabOrder = 10
          inherited Label14: TLabel
            Width = 6
          end
        end
        inherited rgTipoProc: TRadioGroup
          Top = 141
          Height = 31
          TabOrder = 11
        end
        inherited gbxTipoProc: TGroupBox
          Top = 176
          Height = 193
          TabOrder = 12
        end
        inherited rgTipoAcao: TRadioGroup
          Top = 141
          Height = 31
          TabOrder = 14
        end
        inherited gbxTipoAcao: TGroupBox
          Top = 176
          Height = 193
          TabOrder = 13
        end
        object grpMesRef: TGroupBox
          Left = 322
          Top = 45
          Width = 276
          Height = 43
          Caption = ' Mês e Ano de Referência '
          TabOrder = 2
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
            OnChange = cmbMesChange
          end
        end
        object gbxTituloRelat: TGroupBox
          Left = 7
          Top = 0
          Width = 591
          Height = 43
          Caption = 'Título do Relatório'
          TabOrder = 0
          object edTituloRelat: TEdit
            Left = 8
            Top = 14
            Width = 574
            Height = 21
            TabOrder = 0
          end
        end
      end
      inherited tbshReclamante: TTabSheet
        inherited pgctrlDadosReclamante: TPageControl
          Height = 375
          inherited tsDadosFunc: TTabSheet
            inherited GroupBox1: TGroupBox
              inherited Label6: TLabel
                Width = 6
              end
            end
            inherited GroupBox2: TGroupBox
              inherited Label7: TLabel
                Width = 6
              end
              inherited ednAdm1: TSpinEdit
                Height = 21
              end
              inherited ednAdm2: TSpinEdit
                Height = 21
              end
            end
            inherited gbxTempLot: TGroupBox
              inherited Label8: TLabel
                Width = 6
              end
              inherited ednLot1: TSpinEdit
                Height = 21
              end
              inherited ednLot2: TSpinEdit
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
            inherited GroupBox3: TGroupBox
              inherited Label40: TLabel
                Width = 24
              end
              inherited Label41: TLabel
                Width = 38
              end
              inherited Label42: TLabel
                Width = 41
              end
            end
          end
          inherited tbsDemit: TTabSheet
            inherited pnlDemitidos: TPanel
              Height = 347
              inherited Label12: TLabel
                Width = 14
              end
              inherited Label13: TLabel
                Width = 7
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
