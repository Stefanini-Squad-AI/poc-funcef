inherited frmParamCadDependente: TfrmParamCadDependente
  Left = 156
  Top = 97
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsToolWindow
  Caption = 'Relação / Declaração de Dependentes'
  ClientHeight = 431
  ClientWidth = 487
  Font.Style = []
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 487
    Height = 392
    BorderWidth = 2
    object gbxFunc: TGroupBox
      Left = 12
      Top = 13
      Width = 465
      Height = 181
      Caption = 'Empregados'
      TabOrder = 0
      object pgctrlEmpregados: TPageControl
        Left = 6
        Top = 15
        Width = 453
        Height = 158
        ActivePage = tbshListaFunc
        HotTrack = True
        TabOrder = 0
        object tbshListaFunc: TTabSheet
          Caption = '&Lista'
          object chklstFunc: TColorCheckListBox
            Left = 2
            Top = 2
            Width = 306
            Height = 127
            ItemHeight = 13
            Style = lbOwnerDrawFixed
            TabOrder = 0
          end
          object bbtnInverteSel: TBitBtn
            Left = 312
            Top = 29
            Width = 131
            Height = 25
            Caption = '   Inverte Seleção'
            TabOrder = 1
            TabStop = False
            OnClick = bbtnInverteSelClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3333333333333333333333333333000000003333333388888888333333330FFF
              FFF0333333338FFFFFF8333000330FFFFFF0333788338FFFFFF8333033330FFF
              FFF0333833338FFFFFF8330003330FFFFFF0337783338FFFFFF8333033330FFF
              FFF0333833338FFFFFF833333333000000003333333388888888000000003333
              333388888888333333330FF9FFF0333303338FF7FFF8333383330F999FF03330
              00338F777FF833387733099F99F033330333877F77F83333833309FFF9903300
              033387FFF778338873330FFFFF99333333338FFFFF7733333333000000099333
              3333888888877333333333333333333333333333333333333333}
            NumGlyphs = 2
            Spacing = 0
          end
          object bbtnSelTodos: TBitBtn
            Left = 312
            Top = 2
            Width = 131
            Height = 25
            Caption = '   Seleciona Todos'
            TabOrder = 2
            TabStop = False
            OnClick = bbtnSelTodosClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3333333333333333333333333333333333333333333333333333333333300000
              0003333333388888888333333330FF9FFF0333333338FF7FFF8333333000F999
              FF0333333888F777FF83333330F099F99F03333338F877F77F83333000F09FFF
              9903333888F87FFF77833330F090FFFFF9933338F878FFFFF7733000F0900000
              00993888F8788888887730F090FFFFF9933338F878FFFFF7733330F090000000
              993338F87888888877333090FFFFF99333333878FFFFF7733333309000000099
              3333387888888877333330FFFFF99333333338FFFFF773333333300000009933
              3333388888887733333333333333333333333333333333333333}
            NumGlyphs = 2
            Spacing = 0
          end
        end
        object tbshFiltroFunc: TTabSheet
          Caption = '&Tipos / Situações / Sexo'
          object gbxTipContra: TGroupBox
            Left = 5
            Top = 20
            Width = 220
            Height = 90
            Hint = '"Tique" Uma ou Mais Alternativas'
            Caption = 'Tipo de Contrato'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            OnEnter = gbxTipContraEnter
            OnExit = gbxTipContraExit
            object cbxEfetivos: TCheckBox
              Left = 9
              Top = 17
              Width = 64
              Height = 13
              Caption = 'Efetivos'
              Checked = True
              State = cbChecked
              TabOrder = 0
            end
            object cbxEspeciais: TCheckBox
              Left = 9
              Top = 35
              Width = 90
              Height = 13
              Caption = 'LEF'
              Checked = True
              State = cbChecked
              TabOrder = 1
            end
            object cbxTemporarios: TCheckBox
              Left = 9
              Top = 52
              Width = 85
              Height = 13
              Caption = 'Terceirizado'
              Checked = True
              State = cbChecked
              TabOrder = 2
            end
            object cbxEstagiarios: TCheckBox
              Left = 9
              Top = 69
              Width = 74
              Height = 13
              Caption = 'Estagiários'
              Checked = True
              State = cbChecked
              TabOrder = 3
            end
            object cbxTerceiros: TCheckBox
              Left = 113
              Top = 17
              Width = 66
              Height = 13
              Caption = 'Cessão'
              TabOrder = 4
            end
            object cbxPropDirSemVinc: TCheckBox
              Left = 113
              Top = 35
              Width = 97
              Height = 13
              Caption = 'Prop/Dir s/ Vinc'
              TabOrder = 5
            end
            object cbxAutonomos: TCheckBox
              Left = 113
              Top = 52
              Width = 75
              Height = 13
              Caption = 'Autônomos'
              TabOrder = 6
            end
          end
          object gbxSituacao: TGroupBox
            Left = 232
            Top = 39
            Width = 111
            Height = 57
            Hint = '"Tique" Uma ou Mais Alternativas'
            Caption = 'Situação Funcional'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            OnEnter = gbxSituacaoEnter
            OnExit = gbxSituacaoExit
            object cbxAtivos: TCheckBox
              Left = 9
              Top = 17
              Width = 52
              Height = 13
              Caption = 'Ativos'
              Checked = True
              State = cbChecked
              TabOrder = 0
            end
            object cbxAfastados: TCheckBox
              Left = 9
              Top = 36
              Width = 69
              Height = 13
              Caption = 'Afastados'
              TabOrder = 1
            end
          end
          object gbxSexoFunc: TGroupBox
            Left = 351
            Top = 39
            Width = 85
            Height = 57
            Caption = 'Sexo'
            ParentShowHint = False
            ShowHint = False
            TabOrder = 2
            object cbxMasculinoTit: TCheckBox
              Left = 9
              Top = 17
              Width = 72
              Height = 14
              Caption = 'Masculino'
              Checked = True
              State = cbChecked
              TabOrder = 0
              OnClick = cbxMasculinoTitClick
            end
            object cbxFemininoTit: TCheckBox
              Left = 9
              Top = 37
              Width = 64
              Height = 15
              Caption = 'Feminino'
              Checked = True
              State = cbChecked
              TabOrder = 1
            end
          end
        end
        object tbshEstabelecimento: TTabSheet
          Caption = 'Estabelecimentos'
          ImageIndex = 2
          object chklstEstab: TColorCheckListBox
            Left = 2
            Top = 2
            Width = 306
            Height = 127
            OnClickCheck = chklstEstabClickCheck
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            ParentFont = False
            ParentShowHint = False
            ShowHint = False
            Style = lbOwnerDrawFixed
            TabOrder = 0
          end
          object bbtnSelTodosEstab: TBitBtn
            Left = 313
            Top = 2
            Width = 131
            Height = 25
            Caption = '   Seleciona Todos'
            TabOrder = 1
            TabStop = False
            OnClick = bbtnSelTodosEstabClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3333333333333333333333333333333333333333333333333333333333300000
              0003333333388888888333333330FF9FFF0333333338FF7FFF8333333000F999
              FF0333333888F777FF83333330F099F99F03333338F877F77F83333000F09FFF
              9903333888F87FFF77833330F090FFFFF9933338F878FFFFF7733000F0900000
              00993888F8788888887730F090FFFFF9933338F878FFFFF7733330F090000000
              993338F87888888877333090FFFFF99333333878FFFFF7733333309000000099
              3333387888888877333330FFFFF99333333338FFFFF773333333300000009933
              3333388888887733333333333333333333333333333333333333}
            NumGlyphs = 2
            Spacing = 0
          end
          object bbtnInverteSelEstab: TBitBtn
            Left = 313
            Top = 30
            Width = 131
            Height = 25
            Caption = '   Inverte Seleção'
            TabOrder = 2
            TabStop = False
            OnClick = bbtnInverteSelEstabClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
              3333333333333333333333333333000000003333333388888888333333330FFF
              FFF0333333338FFFFFF8333000330FFFFFF0333788338FFFFFF8333033330FFF
              FFF0333833338FFFFFF8330003330FFFFFF0337783338FFFFFF8333033330FFF
              FFF0333833338FFFFFF833333333000000003333333388888888000000003333
              333388888888333333330FF9FFF0333303338FF7FFF8333383330F999FF03330
              00338F777FF833387733099F99F033330333877F77F83333833309FFF9903300
              033387FFF778338873330FFFFF99333333338FFFFF7733333333000000099333
              3333888888877333333333333333333333333333333333333333}
            NumGlyphs = 2
            Spacing = 0
          end
        end
      end
    end
    object gbxDependente: TGroupBox
      Left = 11
      Top = 202
      Width = 465
      Height = 132
      Caption = 'Dependentes'
      TabOrder = 1
      object pgctrlDepend: TPageControl
        Left = 6
        Top = 14
        Width = 453
        Height = 113
        ActivePage = tbshTipoDepend
        HotTrack = True
        TabOrder = 0
        object tbshTipoDepend: TTabSheet
          Caption = '&Tipos de Dependência'
          object chklstTipoDepend: TColorCheckListBox
            Left = 2
            Top = 2
            Width = 440
            Height = 81
            Columns = 5
            ItemHeight = 13
            Style = lbOwnerDrawFixed
            TabOrder = 0
          end
        end
        object tbshOpcoes: TTabSheet
          Caption = '&Faixa Etária / Sexo'
          object GroupBox2: TGroupBox
            Left = 279
            Top = 10
            Width = 111
            Height = 58
            Caption = 'Sexo'
            ParentShowHint = False
            ShowHint = False
            TabOrder = 0
            OnEnter = gbxSituacaoEnter
            OnExit = gbxSituacaoExit
            object cbxMasculinoDep: TCheckBox
              Left = 9
              Top = 17
              Width = 72
              Height = 14
              Caption = 'Masculino'
              Checked = True
              State = cbChecked
              TabOrder = 0
            end
            object cbxFemininoDep: TCheckBox
              Left = 9
              Top = 36
              Width = 64
              Height = 15
              Caption = 'Feminino'
              Checked = True
              State = cbChecked
              TabOrder = 1
              OnClick = cbxMasculinoTitClick
            end
          end
          object gbxIdade: TGroupBox
            Left = 44
            Top = 10
            Width = 194
            Height = 58
            Hint = 'Valores Mínimo e Máximo da Faixa Desejada'
            Caption = 'Faixa Etária (anos)'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 1
            object Label5: TLabel
              Left = 93
              Top = 26
              Width = 6
              Height = 13
              Caption = 'a'
            end
            object ednIda1: TSpinEdit
              Left = 16
              Top = 23
              Width = 62
              Height = 22
              MaxValue = 99
              MinValue = 0
              TabOrder = 0
              Value = 0
              OnChange = ednIda1Change
            end
            object ednIda2: TSpinEdit
              Left = 115
              Top = 23
              Width = 62
              Height = 22
              MaxValue = 99
              MinValue = 0
              TabOrder = 1
              Value = 99
              OnChange = ednIda2Change
            end
          end
        end
      end
    end
    object gbxOrdem: TGroupBox
      Left = 12
      Top = 337
      Width = 465
      Height = 44
      Caption = 'Ordem de Impressão'
      TabOrder = 2
      object cmbOrderBy: TComboBox
        Left = 8
        Top = 15
        Width = 449
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        Items.Strings = (
          'Empregado'
          'Matrícula')
      end
    end
  end
  inherited Dock971: TDock97
    Top = 392
    Width = 487
    inherited tb97Fundo: TToolbar97
      Left = 315
      DockPos = 359
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 146
      inherited ToolbarSep971: TToolbarSep97
        Visible = False
      end
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Enabled = False
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 331
    Top = 158
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited Cmp_Padrao: TCmParamReport
    Params = <
      item
        Caption = 'ListaIdEstab'
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
        Name = 'ListaIdEstab'
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
        Caption = 'CodFuncSel'
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
        Name = 'CodFuncSel'
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
        Caption = 'SitFunc'
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
        Name = 'SitFunc'
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
        Caption = 'TipoContrato'
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
        Name = 'TipoContrato'
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
        Caption = 'CodTipoDependSel'
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
        Name = 'CodTipoDependSel'
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
        Caption = 'SexoTitular'
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
        Name = 'SexoTitular'
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
        Caption = 'FaixaEtariaIni'
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
        Name = 'FaixaEtariaIni'
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
        Caption = 'FaixaEtariaFin'
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
        Name = 'FaixaEtariaFin'
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
        Caption = 'SexoDependente'
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
        Name = 'SexoDependente'
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
        Caption = 'Ordenacao'
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
        Name = 'Ordenacao'
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
    Left = 283
    Top = 158
  end
  object CdsEstab: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 163
    Top = 161
  end
  object CdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 237
    Top = 161
  end
end
