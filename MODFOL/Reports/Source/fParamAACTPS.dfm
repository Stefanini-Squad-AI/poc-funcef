inherited frmParamAACTPS: TfrmParamAACTPS
  Left = 440
  Top = 78
  Caption = 'Ficha de anotações e atualizações da CTPS'
  ClientHeight = 554
  ClientWidth = 597
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 597
    Height = 515
    Font.Style = []
    ParentFont = False
    object grpEmpregados: TGroupBox
      Left = 306
      Top = 157
      Width = 283
      Height = 348
      Caption = '  Empregados  '
      TabOrder = 6
      TabStop = True
      object lblMatricula: TLabel
        Left = 10
        Top = 302
        Width = 56
        Height = 13
        Caption = 'Matrícula(s)'
      end
      object chklstFunc: TColorCheckListBox
        Left = 8
        Top = 20
        Width = 268
        Height = 251
        OnClickCheck = chklstFuncClickCheck
        ItemHeight = 13
        Style = lbOwnerDrawFixed
        TabOrder = 0
      end
      object bbtnSelFuncTodos: TBitBtn
        Left = 8
        Top = 274
        Width = 131
        Height = 25
        Caption = '   Seleciona Todos'
        TabOrder = 1
        TabStop = False
        OnClick = bbtnSelFuncTodosClick
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
      object bbtnInverteSelFunc: TBitBtn
        Left = 144
        Top = 274
        Width = 131
        Height = 25
        Caption = '   Inverte Seleção'
        TabOrder = 2
        TabStop = False
        OnClick = bbtnInverteSelFuncClick
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
      object edtSelEmpregados: TEdit
        Left = 10
        Top = 316
        Width = 188
        Height = 21
        Hint = 'Informe as matrículas separadas por vírgula.'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnKeyPress = edtSelEmpregadosKeyPress
      end
      object btnSelEmpregados: TBitBtn
        Left = 200
        Top = 313
        Width = 75
        Height = 25
        Caption = '   &Marcar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        TabOrder = 4
        TabStop = False
        OnClick = btnSelEmpregadosClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          88888888888888FF8888888888888778888888888888F77F8888888888800F08
          8888888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0
          88888887788888F7F8888887FFFFFCF088888887FFF887878F888811111CCFFF
          08888877777F788F7F8881999991FFCF088887777777F87878F8998999991CFF
          F088778777777F88F78F99F899991FFCFF0877F877777F87887899FF89991CCF
          FFF077FF87777F7888F799F9F8891FFFF77877F7F8877F88F77899F99FF81FF7
          788877F77FF878F7788889999991777888888777777787788888889999988888
          8888887777788888888888888888888888888888888888888888}
        NumGlyphs = 2
        Spacing = 0
      end
    end
    object grpCentroCust: TGroupBox
      Left = 13
      Top = 157
      Width = 285
      Height = 172
      Caption = '  Centro de Custo  '
      TabOrder = 5
      TabStop = True
      object chklstCCusto: TColorCheckListBox
        Left = 8
        Top = 18
        Width = 268
        Height = 117
        OnClickCheck = MontaListaClick
        ItemHeight = 13
        Style = lbOwnerDrawFixed
        TabOrder = 0
      end
      object bbtnSelCCTodos: TBitBtn
        Left = 8
        Top = 138
        Width = 131
        Height = 25
        Caption = '   Seleciona Todos'
        TabOrder = 1
        TabStop = False
        OnClick = bbtnSelCCTodosClick
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
      object bbtnInverteSelCC: TBitBtn
        Left = 144
        Top = 137
        Width = 131
        Height = 25
        Caption = '   Inverte Seleção'
        TabOrder = 2
        TabStop = False
        OnClick = bbtnInverteSelCCClick
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
    object grpTipContrato: TGroupBox
      Left = 13
      Top = 11
      Width = 285
      Height = 96
      Caption = 'Tipo de Contrato'
      ParentShowHint = False
      ShowHint = False
      TabOrder = 0
      TabStop = True
      object cbxEfetivos: TCheckBox
        Left = 9
        Top = 17
        Width = 64
        Height = 13
        Caption = 'Efetivos'
        Checked = True
        ParentShowHint = False
        ShowHint = False
        State = cbChecked
        TabOrder = 0
        OnClick = MontaListaClick
      end
      object cbxEspeciais: TCheckBox
        Left = 9
        Top = 36
        Width = 90
        Height = 13
        Caption = 'LEF'
        Checked = True
        ParentShowHint = False
        ShowHint = False
        State = cbChecked
        TabOrder = 1
        OnClick = MontaListaClick
      end
      object cbxTemporarios: TCheckBox
        Left = 9
        Top = 54
        Width = 85
        Height = 13
        Caption = 'Terceirizado'
        ParentShowHint = False
        ShowHint = False
        TabOrder = 2
        OnClick = MontaListaClick
      end
      object cbxEstagiarios: TCheckBox
        Left = 9
        Top = 73
        Width = 74
        Height = 13
        Caption = 'Estagiários'
        ParentShowHint = False
        ShowHint = False
        TabOrder = 3
        OnClick = MontaListaClick
      end
      object cbxTerceiros: TCheckBox
        Left = 127
        Top = 17
        Width = 66
        Height = 13
        Caption = 'Cessão'
        ParentShowHint = False
        ShowHint = False
        TabOrder = 4
        OnClick = MontaListaClick
      end
      object cbxPropDirSemVinc: TCheckBox
        Left = 127
        Top = 36
        Width = 97
        Height = 13
        Caption = 'Prop/Dir s/ Vinc'
        ParentShowHint = False
        ShowHint = False
        TabOrder = 5
        OnClick = MontaListaClick
      end
      object cbxAutonomos: TCheckBox
        Left = 127
        Top = 54
        Width = 75
        Height = 13
        Caption = 'Autônomos'
        ParentShowHint = False
        ShowHint = False
        TabOrder = 6
        OnClick = MontaListaClick
      end
    end
    object gbxSituacao: TGroupBox
      Left = 13
      Top = 111
      Width = 285
      Height = 41
      Caption = ' Situação Funcional '
      ParentShowHint = False
      ShowHint = False
      TabOrder = 2
      TabStop = True
      object cbxAtivos: TCheckBox
        Left = 9
        Top = 17
        Width = 52
        Height = 13
        Caption = 'Ativos'
        Checked = True
        ParentShowHint = False
        ShowHint = False
        State = cbChecked
        TabOrder = 0
        OnClick = MontaListaClick
      end
      object cbxAfastados: TCheckBox
        Left = 100
        Top = 17
        Width = 69
        Height = 13
        Caption = 'Afastados'
        ParentShowHint = False
        ShowHint = False
        TabOrder = 1
        OnClick = MontaListaClick
      end
      object cbxDemitidos: TCheckBox
        Tag = 2
        Left = 201
        Top = 17
        Width = 69
        Height = 13
        Caption = 'Demitidos'
        ParentShowHint = False
        ShowHint = False
        TabOrder = 2
        OnClick = MontaListaClick
      end
    end
    object grpCargo: TGroupBox
      Left = 13
      Top = 334
      Width = 285
      Height = 171
      Caption = '  Cargo / Função'
      TabOrder = 7
      TabStop = True
      object chklstCargo: TColorCheckListBox
        Left = 8
        Top = 18
        Width = 268
        Height = 117
        OnClickCheck = MontaListaClick
        ItemHeight = 13
        Style = lbOwnerDrawFixed
        TabOrder = 0
      end
      object bbtnSelCargoTodos: TBitBtn
        Left = 8
        Top = 138
        Width = 131
        Height = 25
        Caption = '   Seleciona Todos'
        TabOrder = 1
        TabStop = False
        OnClick = bbtnSelCargoTodosClick
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
      object bbtnInverteSelCargo: TBitBtn
        Left = 144
        Top = 137
        Width = 131
        Height = 25
        Caption = '   Inverte Seleção'
        TabOrder = 2
        TabStop = False
        OnClick = bbtnInverteSelCargoClick
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
    object grpSexo: TGroupBox
      Left = 306
      Top = 60
      Width = 95
      Height = 92
      Caption = ' Sexo'
      ParentShowHint = False
      ShowHint = False
      TabOrder = 3
      TabStop = True
      object chkMasc: TCheckBox
        Left = 9
        Top = 25
        Width = 80
        Height = 13
        Caption = 'Masculino'
        Checked = True
        ParentShowHint = False
        ShowHint = False
        State = cbChecked
        TabOrder = 0
        OnClick = MontaListaClick
      end
      object chkFem: TCheckBox
        Left = 9
        Top = 59
        Width = 69
        Height = 14
        Caption = 'Feminino'
        Checked = True
        ParentShowHint = False
        ShowHint = False
        State = cbChecked
        TabOrder = 1
        OnClick = MontaListaClick
      end
    end
    object grpEstCivil: TGroupBox
      Left = 405
      Top = 60
      Width = 184
      Height = 92
      Caption = 'Estado Civil'
      ParentShowHint = False
      ShowHint = False
      TabOrder = 4
      TabStop = True
      object chkSolteiro: TCheckBox
        Left = 9
        Top = 17
        Width = 75
        Height = 13
        Caption = 'Solteiro(a)'
        Checked = True
        ParentShowHint = False
        ShowHint = False
        State = cbChecked
        TabOrder = 0
        OnClick = MontaListaClick
      end
      object chkCasado: TCheckBox
        Left = 9
        Top = 36
        Width = 90
        Height = 13
        Caption = 'Casado(a)'
        Checked = True
        ParentShowHint = False
        ShowHint = False
        State = cbChecked
        TabOrder = 1
        OnClick = MontaListaClick
      end
      object chkSeparadoJud: TCheckBox
        Left = 9
        Top = 54
        Width = 152
        Height = 13
        Caption = 'Separado Judicialmente'
        Checked = True
        ParentShowHint = False
        ShowHint = False
        State = cbChecked
        TabOrder = 2
        OnClick = MontaListaClick
      end
      object chkOutros: TCheckBox
        Left = 9
        Top = 73
        Width = 74
        Height = 13
        Caption = 'Outros'
        Checked = True
        ParentShowHint = False
        ShowHint = False
        State = cbChecked
        TabOrder = 3
        OnClick = MontaListaClick
      end
      object chkDivorciado: TCheckBox
        Left = 94
        Top = 17
        Width = 84
        Height = 13
        Caption = 'Divorciado(a)'
        Checked = True
        ParentShowHint = False
        ShowHint = False
        State = cbChecked
        TabOrder = 4
        OnClick = MontaListaClick
      end
      object chkViuvo: TCheckBox
        Left = 94
        Top = 36
        Width = 76
        Height = 13
        Caption = 'Viúvo(a)'
        Checked = True
        ParentShowHint = False
        ShowHint = False
        State = cbChecked
        TabOrder = 5
        OnClick = MontaListaClick
      end
    end
    object grpOrdem: TGroupBox
      Left = 306
      Top = 11
      Width = 283
      Height = 48
      Caption = 'Ordem de Impressão'
      TabOrder = 1
      object cbbOrdem: TComboBox
        Left = 7
        Top = 17
        Width = 267
        Height = 21
        DropDownCount = 6
        ItemHeight = 13
        TabOrder = 0
        Items.Strings = (
          'Nome'
          'Matrícula'
          'Lotação, Nome'
          'Lotação, Matrícula'
          'Cargo, Nome'
          'Cargo, Matrícula')
      end
    end
  end
  inherited Dock971: TDock97
    Top = 515
    Width = 597
    inherited tb97Fundo: TToolbar97
      Left = 425
      DockPos = 568
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 256
      DockPos = 399
      inherited bbtnConfirmar: TBitBtn
        Enabled = False
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Enabled = False
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 504
    Top = 224
  end
  inherited Cmp_Padrao: TCmParamReport
    Params = <
      item
        Caption = 'ListaIdFuncSel'
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
        Name = 'ListaIdFuncSel'
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
        Caption = 'Ordem'
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
        Name = 'Ordem'
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
    Left = 504
    Top = 272
  end
end
