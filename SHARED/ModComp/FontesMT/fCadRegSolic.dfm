inherited frmCadRegSolic: TfrmCadRegSolic
  Left = 43
  Top = 74
  HelpContext = 740016
  Caption = 'Solicitação de Alteração Funcional'
  ClientHeight = 452
  ClientWidth = 718
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 718
    Height = 366
    BorderWidth = 2
    object gbxIdentif: TGroupBox
      Left = 10
      Top = 5
      Width = 343
      Height = 95
      Caption = ' Identificação '
      TabOrder = 0
      object Label2: TLabel
        Left = 14
        Top = 43
        Width = 28
        Height = 13
        Caption = 'Data'
      end
      object Label1: TLabel
        Left = 14
        Top = 21
        Width = 30
        Height = 13
        Caption = 'Num.'
      end
      object Label3: TLabel
        Left = 14
        Top = 66
        Width = 26
        Height = 13
        Caption = 'Tipo'
      end
      object dbedNumero: TDBEdit
        Left = 45
        Top = 15
        Width = 100
        Height = 21
        TabStop = False
        Color = clGray
        DataField = 'ID_SOLIC_ALTER_FUNC'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object dbedData: TCMDateTimePicker
        Left = 45
        Top = 40
        Width = 100
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATA_SOLIC_ALTER'
        DataSource = ds
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
      object dblcTipoEv: TwwDBLookupCombo
        Left = 45
        Top = 65
        Width = 193
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'50'#9'DESCRICAO')
        DataField = 'IDMOTIVO'
        DataSource = ds
        LookupTable = CdsMotivo
        LookupField = 'IDMOTIVO'
        Style = csDropDownList
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
      object rgSituacao: TDBRadioGroup
        Left = 243
        Top = 10
        Width = 91
        Height = 76
        Caption = 'Situação'
        DataField = 'SITUACAO_SOLIC'
        DataSource = ds
        Items.Strings = (
          'Proposta'
          'Efetivada')
        TabOrder = 3
        Values.Strings = (
          '0'
          '1')
        OnClick = rgSituacaoClick
      end
    end
    object gbxReq: TGroupBox
      Left = 359
      Top = 5
      Width = 346
      Height = 95
      Caption = ' Requisitante '
      TabOrder = 1
      object CMProcuraReq: TCMProcuraSubTipo
        Left = 8
        Top = 11
        Width = 328
        Height = 50
        TabOrder = 0
        CampoEdit = ceNome
        MostraMensagens = True
        DataSource = ds
        DataField = 'IDREQUISITANTE'
        Mensagens.EmBranco = 'Novo Ocupante não pode estar em branco'
        Mensagens.NaoExiste = 'Novo Ocupante não existe'
        PermiteChaveInvalida = False
        PermiteChaveEmBranco = True
        SubTipo = stFuncionario
        FiltraSubTipo = True
      end
      object edCargoReq: TEdit
        Left = 8
        Top = 66
        Width = 328
        Height = 21
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
    end
    object gbxInd: TGroupBox
      Left = 10
      Top = 104
      Width = 343
      Height = 124
      Caption = ' Indicado '
      TabOrder = 2
      object CMProcuraInd: TCMProcuraSubTipo
        Left = 7
        Top = 11
        Width = 328
        Height = 50
        TabOrder = 0
        CampoEdit = ceNome
        MostraMensagens = True
        DataSource = ds
        DataField = 'IDINDICADO'
        Mensagens.EmBranco = 'Novo Ocupante não pode estar em branco'
        Mensagens.NaoExiste = 'Novo Ocupante não existe'
        PermiteChaveInvalida = False
        PermiteChaveEmBranco = True
        SubTipo = stFuncionario
        FiltraSubTipo = True
      end
      object edCargoInd: TEdit
        Left = 7
        Top = 65
        Width = 240
        Height = 21
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object dbedDatCargo: TDBEdit
        Left = 253
        Top = 65
        Width = 82
        Height = 21
        TabStop = False
        Color = clGray
        DataField = 'DATACARGO'
        DataSource = dsFunc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object dbedSalAtual: TDBRealEdit
        Left = 7
        Top = 93
        Width = 78
        Height = 21
        Alignment = taRightJustify
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Lines.Strings = (
          '      0,00')
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'SALARIOATUAL'
        DataSource = dsFunc
      end
      object dbrgTipoSalar: TDBRadioGroup
        Left = 90
        Top = 86
        Width = 157
        Height = 31
        Columns = 3
        DataField = 'TIPOPAGAMENTO'
        DataSource = dsFunc
        Items.Strings = (
          'Hora'
          'Dia'
          'Mês')
        ReadOnly = True
        TabOrder = 4
        Values.Strings = (
          'H'
          'D'
          'M')
      end
      object dbedDatSalar: TDBEdit
        Left = 253
        Top = 93
        Width = 82
        Height = 21
        TabStop = False
        Color = clGray
        DataField = 'DATASALARIO'
        DataSource = dsFunc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
      end
    end
    object GroupBox4: TGroupBox
      Left = 359
      Top = 104
      Width = 346
      Height = 253
      Caption = ' Proposição '
      TabOrder = 3
      object Label5: TLabel
        Left = 9
        Top = 15
        Width = 93
        Height = 13
        Caption = 'Data Efetivação'
      end
      object Label8: TLabel
        Left = 6
        Top = 164
        Width = 34
        Height = 13
        Caption = 'Cargo'
      end
      object Label9: TLabel
        Left = 6
        Top = 199
        Width = 47
        Height = 13
        Caption = 'Lotação'
      end
      object dbedDatEfet: TCMDateTimePicker
        Left = 9
        Top = 28
        Width = 100
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATA_EFETIV_ALTER'
        DataSource = ds
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
      object rgAltSalario: TRadioGroup
        Left = 119
        Top = 14
        Width = 217
        Height = 35
        Caption = ' Alterar Salário? '
        Columns = 4
        ItemIndex = 0
        Items.Strings = (
          'Não'
          'Valor'
          '%'
          'Faixa')
        TabOrder = 1
        OnClick = rgAltSalarioClick
      end
      object gbxSalario: TGroupBox
        Left = 9
        Top = 54
        Width = 327
        Height = 100
        TabOrder = 2
        object Label4: TLabel
          Left = 5
          Top = 12
          Width = 40
          Height = 13
          Caption = 'Salário'
        end
        object Label6: TLabel
          Left = 5
          Top = 56
          Width = 62
          Height = 13
          Caption = 'Percentual'
        end
        object dbedTipoSal: TDBRadioGroup
          Left = 154
          Top = 12
          Width = 163
          Height = 31
          Caption = ' Base do Salário '
          Columns = 3
          DataField = 'NOVO_TIPO_SAL'
          DataSource = ds
          Items.Strings = (
            'Hora'
            'Dia'
            'Mês')
          TabOrder = 2
          Values.Strings = (
            'H'
            'D'
            'M')
        end
        object dbedSalario: TDBRealEdit
          Left = 5
          Top = 26
          Width = 120
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          TabOrder = 0
          WordWrap = False
          OnChange = dbedSalarioChange
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fFixed
          Signal = False
          DataField = 'NOVO_SALARIO'
          DataSource = ds
        end
        object dbedPerc: TDBRealEdit
          Left = 5
          Top = 70
          Width = 120
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          TabOrder = 1
          WordWrap = False
          OnChange = dbedPercChange
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fFixed
          Signal = False
          DataField = 'PERC_REAJ'
          DataSource = ds
        end
        object gbxStepsFaixa: TGroupBox
          Left = 155
          Top = 49
          Width = 163
          Height = 42
          Caption = ' Steps da Faixa '
          TabOrder = 3
          Visible = False
          object cmbSteps: TComboBox
            Left = 8
            Top = 13
            Width = 147
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 0
            OnChange = cmbStepsChange
          end
        end
      end
      object dblcCargo: TwwDBLookupCombo
        Left = 56
        Top = 162
        Width = 281
        Height = 21
        DropDownAlignment = taRightJustify
        Selected.Strings = (
          'TITULO'#9'30'#9'TITULO')
        DataField = 'IDCARGO'
        DataSource = ds
        LookupTable = CdsCargo
        LookupField = 'IDCARGO'
        Style = csDropDownList
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        OnCloseUp = dblcCargoCloseUp
      end
      object dblcEstab: TwwDBLookupCombo
        Left = 56
        Top = 194
        Width = 281
        Height = 21
        DropDownAlignment = taRightJustify
        Selected.Strings = (
          'NOME'#9'60'#9'NOME')
        DataField = 'IDESTAB'
        DataSource = ds
        LookupTable = CdsEstab
        LookupField = 'IDPESSOA'
        Style = csDropDownList
        TabOrder = 4
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
      object dblcLotacao: TwwDBLookupCombo
        Left = 6
        Top = 226
        Width = 83
        Height = 21
        DropDownAlignment = taRightJustify
        Selected.Strings = (
          'CODCENTROCUSTO'#9'10'#9'Código'
          'NOME'#9'30'#9'Nome')
        DataField = 'CODCENTROCUSTO'
        DataSource = ds
        LookupTable = CdsCCusto
        LookupField = 'CODCENTROCUSTO'
        Options = [loColLines, loTitles]
        Style = csDropDownList
        ParentShowHint = False
        ShowHint = False
        TabOrder = 5
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        OnChange = dblcLotacaoChange
      end
      object edNomeCCusto: TEdit
        Left = 91
        Top = 226
        Width = 246
        Height = 21
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
      end
    end
    object gbxOBS: TGroupBox
      Left = 10
      Top = 232
      Width = 343
      Height = 125
      Caption = ' Observações '
      TabOrder = 4
      object dbmObser: TDBMemo
        Left = 8
        Top = 12
        Width = 327
        Height = 107
        DataField = 'OBSERV_SOLIC'
        DataSource = ds
        ScrollBars = ssVertical
        TabOrder = 0
      end
    end
  end
  inherited Dock972: TDock97
    Width = 718
  end
  inherited Dock971: TDock97
    Top = 413
    Width = 718
    inherited tb97Fundo: TToolbar97
      Left = 546
      DockPos = 558
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 377
      DockPos = 389
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 494
    Top = 1
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 270
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 547
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 608
    Top = 1
  end
  inherited Cds: TCMClientDataSet
    AfterInsert = CdsAfterInsert
    Left = 242
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Solicitações'
    Colunas.Strings = (
      'P1.NOME'
      'F1.MATRICULA'
      'P2.NOME'
      'F2.MATRICULA'
      'CC.NOME AS CENTROCUSTO'
      'M.DESCRICAO'
      'S.DATA_SOLIC_ALTER'
      'S.DATA_EFETIV_ALTER'
      'DECODE(S.SITUACAO_SOLIC, 1, '#39'Efetivada'#39', '#39'Proposta'#39')')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'D'
      'D'
      'N')
    Descricao.Strings = (
      'Nome do Indicado'
      'Matricula do Indicado'
      'Nome do Requisitante'
      'Matricula do Requisitante'
      'Centro de Custo'
      'Motivo da Alteração'
      'Data da Solicitação'
      'Data de Efetivação'
      'Situação')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA P1'
      'FUNCIONARIO F1'
      'PESSOA P2'
      'FUNCIONARIO F2'
      'CENTCUST CC'
      'MOTIVO M'
      'SOLALTFUNC S')
    CamposChave.Strings = (
      'S.ID_SOLIC_ALTER_FUNC')
    Filtro.Strings = (
      'S.IDINDICADO     = P1.IDPESSOA'
      'S.IDINDICADO     = F1.IDPESSOA'
      'S.IDREQUISITANTE = P2.IDPESSOA'
      'S.IDREQUISITANTE = F2.IDPESSOA'
      'S.IDMOTIVO       = M.IDMOTIVO'
      'S.IDEMPRESA      = CC.IDEMPRESA(+)'
      'S.CODCENTROCUSTO = CC.CODCENTROCUSTO(+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '10'
      '60'
      '10'
      '40'
      '40'
      '15'
      '15'
      '10')
    Left = 672
    Top = 1
  end
  object dsFunc: TwwDataSource
    DataSet = CdsFunc
    Left = 353
    Top = 1
  end
  object CdsFaixaSal: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 22
    Top = 407
  end
  object CdsFunc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterScroll = CdsFuncAfterScroll
    Left = 308
    Top = 1
  end
  object CdsMotivo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 252
    Top = 407
  end
  object CdsCargo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 84
    Top = 407
  end
  object CdsCCusto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 140
    Top = 407
  end
  object CdsEstab: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 196
    Top = 407
  end
end
