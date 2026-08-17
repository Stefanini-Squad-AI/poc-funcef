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
    object GroupBox1: TGroupBox
      Left = 10
      Top = 5
      Width = 343
      Height = 95
      Caption = 'Identificação'
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
        DataField = 'ID_SOLIC_ALTER_FUNC'
        DataSource = ds
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
        LookupTable = qryMotac
        LookupField = 'IDMOTIVO'
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
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
    object GroupBox2: TGroupBox
      Left = 359
      Top = 5
      Width = 346
      Height = 95
      Caption = 'Requisitante'
      TabOrder = 1
      object dbedCargoR: TDBEdit
        Left = 8
        Top = 66
        Width = 328
        Height = 21
        TabStop = False
        DataField = 'TITULO'
        DataSource = ds8
        ReadOnly = True
        TabOrder = 1
      end
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
    end
    object GroupBox3: TGroupBox
      Left = 10
      Top = 104
      Width = 343
      Height = 124
      Caption = 'Indicado'
      TabOrder = 2
      object dbrgTipoSalar: TDBRadioGroup
        Left = 90
        Top = 85
        Width = 150
        Height = 31
        Columns = 3
        DataField = 'TIPOPAGAMENTO'
        DataSource = ds5
        Items.Strings = (
          'Hora'
          'Dia'
          'Mês')
        ReadOnly = True
        TabOrder = 3
        Values.Strings = (
          'H'
          'D'
          'M')
      end
      object dbedDatSalar: TDBEdit
        Left = 245
        Top = 93
        Width = 90
        Height = 21
        TabStop = False
        DataField = 'DATASALARIO'
        DataSource = ds5
        ReadOnly = True
        TabOrder = 4
      end
      object dbedCargoI: TDBEdit
        Left = 7
        Top = 65
        Width = 233
        Height = 21
        TabStop = False
        DataField = 'TITULO'
        DataSource = ds9
        ReadOnly = True
        TabOrder = 1
      end
      object dbedDatCargo: TDBEdit
        Left = 245
        Top = 65
        Width = 90
        Height = 21
        TabStop = False
        DataField = 'DATACARGO'
        DataSource = ds5
        ReadOnly = True
        TabOrder = 2
      end
      object CMProcuraInd: TCMProcuraSubTipo
        Left = 7
        Top = 11
        Width = 328
        Height = 50
        TabOrder = 0
        OnExit = CMProcuraIndExit
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
      object dbedSalAtual: TDBRealEdit
        Left = 7
        Top = 93
        Width = 78
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 5
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'SALARIOATUAL'
        DataSource = ds5
      end
    end
    object GroupBox4: TGroupBox
      Left = 359
      Top = 104
      Width = 346
      Height = 253
      Caption = 'Proposição'
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
        LookupTable = qryCargo
        LookupField = 'IDCARGO'
        TabOrder = 1
        AutoDropDown = False
        ShowButton = True
        SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
        AllowClearKey = False
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
        LookupTable = qryEstab
        LookupField = 'IDPESSOA'
        TabOrder = 2
        AutoDropDown = False
        ShowButton = True
        SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
        AllowClearKey = False
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
        LookupTable = qryCust
        LookupField = 'CODCENTROCUSTO'
        Options = [loColLines, loTitles]
        TabOrder = 3
        AutoDropDown = False
        ShowButton = True
        SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
        AllowClearKey = False
      end
      object dbedNomeCC: TwwDBEdit
        Left = 91
        Top = 226
        Width = 246
        Height = 21
        TabStop = False
        Color = clGray
        DataField = 'NOME'
        DataSource = dsLot
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object rgAltSalario: TRadioGroup
        Left = 119
        Top = 14
        Width = 217
        Height = 35
        Caption = 'Altera Salário ?'
        Columns = 4
        ItemIndex = 0
        Items.Strings = (
          'Não'
          'Valor'
          '%'
          'Faixa')
        TabOrder = 5
        OnClick = rgAltSalarioClick
      end
      object gbxSalario: TGroupBox
        Left = 6
        Top = 54
        Width = 331
        Height = 100
        TabOrder = 6
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
          Caption = 'Base do Salário'
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
          Caption = 'Steps da Faixa'
          TabOrder = 3
          Visible = False
          object cmbSteps: TComboBox
            Left = 8
            Top = 15
            Width = 147
            Height = 21
            ItemHeight = 13
            TabOrder = 0
            OnChange = cmbStepsChange
          end
        end
      end
    end
    object GroupBox5: TGroupBox
      Left = 10
      Top = 232
      Width = 343
      Height = 125
      Caption = 'Observações'
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
      Left = 548
      DockPos = 556
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 381
      DockPos = 389
    end
    object Toolbar972: TToolbar97
      Left = 0
      Top = 0
      Caption = 'TB97oKCancelar'
      DockPos = 0
      TabOrder = 2
      object ToolbarSep972: TToolbarSep97
        Left = 33
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      object sbtnConfigEtiqueta: TSpeedButton
        Left = 0
        Top = 0
        Width = 33
        Height = 33
        Hint = 'Alterar Layout de Cartas ou Comunicados'
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888880008
          8888888888888F7778FF8888000088888800877008888888888F7787F778FF88
          0000888800880007700888888F778F7778F778FF000088008800877007700888
          778F7787F778F778000080880088877770077087FF778887F88778F700008700
          888887777770008777888887FF888777000080888888F77777777087F8888F77
          78FF88870000878888FF888777777087F88F77888778FF8700008788FF888888
          87777087FF778888888778F7000087FF88099888888770877788888888888777
          0000878880E08888808880878FF8888888FFF8F7000088770EEE088FF0877888
          778FF88FF777877800008880000EE0000000008888778F77788878F800008888
          880EEEEEEEEEE0888888777FF888878F00008888880EEEEEEEEEE08888888877
          8F888F7700008880000EE000000000888888888878FF7788000088880EEE0887
          7788888888888888877788880000888880E08888888888888888888888888888
          0000}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = sbtnConfigEtiquetaClick
      end
      object sbtnDesfConfigCartaComunic: TSpeedButton
        Left = 36
        Top = 0
        Width = 33
        Height = 33
        Hint = 'Restaurar Alteração do Layout de Cartas ou Comunicados'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888888888888888888888888888888888888888888888888888444488
          8888888887777888888888884444444488888887777777788888888444888844
          4888887778888777888888844888888448888877888888778888884488888888
          4488877888888887788888448888888844888778888888877888884488888888
          4488877888888887788888448888888844888778888888877888888448888484
          4888887788887877888888844888844448888877888877778888888888888444
          8888888888887778888888888888844448888888888877778888888888888888
          8888888888888888888888888888888888888888888888888888}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = sbtnDesfConfigCartaComunicClick
      end
    end
  end
  inherited qry: TwwQuery
    BeforeInsert = qryBeforeInsert
    AfterInsert = qryAfterInsert
    SQL.Strings = (
      'SELECT * FROM SOLALTFUNC'
      'WHERE ID_SOLIC_ALTER_FUNC = :IDSOLIC')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDSOLIC'
        ParamType = ptUnknown
      end>
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update SOLALTFUNC'
      'set'
      '  IDEMPRESA = :IDEMPRESA,'
      '  IDESTAB = :IDESTAB,'
      '  CODCENTROCUSTO = :CODCENTROCUSTO,'
      '  IDMOTIVO = :IDMOTIVO,'
      '  IDCARGO = :IDCARGO,'
      '  DATA_SOLIC_ALTER = :DATA_SOLIC_ALTER,'
      '  DATA_EFETIV_ALTER = :DATA_EFETIV_ALTER,'
      '  PERC_REAJ = :PERC_REAJ,'
      '  NOVO_SALARIO = :NOVO_SALARIO,'
      '  NOVO_TIPO_SAL = :NOVO_TIPO_SAL,'
      '  SITUACAO_SOLIC = :SITUACAO_SOLIC,'
      '  FLAG_PERC_SALAR = :FLAG_PERC_SALAR,'
      '  IDINDICADO = :IDINDICADO,'
      '  OBSERV_SOLIC = :OBSERV_SOLIC,'
      '  IDREQUISITANTE = :IDREQUISITANTE,'
      '  IDPROCESSO = :IDPROCESSO'
      'where'
      '  ID_SOLIC_ALTER_FUNC = :OLD_ID_SOLIC_ALTER_FUNC')
    InsertSQL.Strings = (
      'insert into SOLALTFUNC'
      '  (ID_SOLIC_ALTER_FUNC, IDEMPRESA, IDESTAB, CODCENTROCUSTO, '
      'IDMOTIVO, IDCARGO, '
      
        '   DATA_SOLIC_ALTER, DATA_EFETIV_ALTER, PERC_REAJ, NOVO_SALARIO,' +
        ' '
      'NOVO_TIPO_SAL, '
      '   SITUACAO_SOLIC, FLAG_PERC_SALAR, IDINDICADO, OBSERV_SOLIC, '
      'IDREQUISITANTE, '
      '   IDPROCESSO)'
      'values'
      '  (:ID_SOLIC_ALTER_FUNC, :IDEMPRESA, :IDESTAB, :CODCENTROCUSTO, '
      ':IDMOTIVO, '
      '   :IDCARGO, :DATA_SOLIC_ALTER, :DATA_EFETIV_ALTER, :PERC_REAJ, '
      ':NOVO_SALARIO, '
      
        '   :NOVO_TIPO_SAL, :SITUACAO_SOLIC, :FLAG_PERC_SALAR, :IDINDICAD' +
        'O, '
      ':OBSERV_SOLIC, '
      '   :IDREQUISITANTE, :IDPROCESSO)')
    DeleteSQL.Strings = (
      'delete from SOLALTFUNC'
      'where'
      '  ID_SOLIC_ALTER_FUNC = :OLD_ID_SOLIC_ALTER_FUNC')
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'P1.NOME'
      'F1.MATRICULA'
      'P2.NOME'
      'F2.MATRICULA'
      'CC.NOME AS CENTROCUSTO'
      'M.DESCRICAO'
      'S.DATA_SOLIC_ALTER'
      'S.DATA_EFETIV_ALTER'
      'S.SITUACAO_SOLIC')
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
      'Sit.(0=Prop, 1=Efet)')
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
      'S.IDINDICADO             = P1.IDPESSOA'
      'S.IDINDICADO             = F1.IDPESSOA'
      'S.IDREQUISITANTE  = P2.IDPESSOA'
      'S.IDREQUISITANTE  = F2.IDPESSOA'
      'S.IDMOTIVO                      = M.IDMOTIVO'
      'S.IDEMPRESA       = CC.IDEMPRESA'
      'S.CODCENTROCUSTO = CC.CODCENTROCUSTO')
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
  end
  inherited ds: TwwDataSource
    Left = 318
    Top = 2
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
  end
  object qryMotac: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select IDMOTIVO, DESCRICAO '
      'from MOTIVO '
      'where GRUPOMOTIVO = '#39'A'#39' '
      'order by upper(DESCRICAO)')
    ValidateWithMask = True
    Left = 408
    Top = 65535
  end
  object qryCargo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select IDCARGO, TITULO from CARGO order by TITULO')
    ValidateWithMask = True
    Left = 504
    Top = 2
  end
  object ds5: TwwDataSource
    DataSet = tblFuncio2
    Left = 185
    Top = 6
  end
  object tblFuncio2: TwwTable
    AfterScroll = tblFuncio2AfterScroll
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDPESSOA'
    MasterFields = 'IDINDICADO'
    MasterSource = ds
    TableName = 'CM.FUNCIONARIO'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 142
    Top = 6
  end
  object ds3: TwwDataSource
    Left = 105
    Top = 65535
  end
  object ds9: TwwDataSource
    DataSet = tblCargo2
    Left = 472
    Top = 352
  end
  object tblCargo2: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDCARGO'
    MasterFields = 'IDCARGO'
    MasterSource = ds5
    TableName = 'CM.CARGO'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 519
    Top = 351
  end
  object ds8: TwwDataSource
    DataSet = qryCargo2
    Left = 243
    Top = 9
  end
  object tblHstces: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDPESSOA;DATAALTERFUNC'
    TableName = 'CM.EVOLFUNC'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 456
    Top = 3
  end
  object qryEstab: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select IDPESSOA, NOME from PESSOA '
      'where IDGRUPO =:IdEmpresaProp '
      'order by NOME')
    ValidateWithMask = True
    Left = 557
    Top = 4
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdEmpresaProp'
        ParamType = ptUnknown
      end>
  end
  object qryCust: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select CODCENTROCUSTO, NOME, IDEMPRESA from CENTCUST '
      'where IDEMPRESA =:IdEmpresaProp '
      'order by NOME')
    ValidateWithMask = True
    Left = 219
    Top = 352
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdEmpresaProp'
        ParamType = ptUnknown
      end>
  end
  object dsLot: TwwDataSource
    DataSet = tblLotacao
    Left = 269
    Top = 354
  end
  object tblLotacao: TwwTable
    DatabaseName = 'BaseDados'
    IndexFieldNames = 'IDEMPRESA;CODCENTROCUSTO'
    MasterFields = 'IDEMPRESA;CODCENTROCUSTO'
    MasterSource = ds
    TableName = 'CM.CENTCUST'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 568
    Top = 351
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  S.IDMOTIVO, C.NUMCARTA'
      'FROM'
      '  SOLALTFUNC S, CARTA C'
      'WHERE'
      '  (S.ID_SOLIC_ALTER_FUNC = :ID_SOLIC_ALTER_FUNC) AND'
      '  (S.IDMOTIVO            = C.IDMOTIVO)')
    ValidateWithMask = True
    Left = 92
    Top = 352
    ParamData = <
      item
        DataType = ftFloat
        Name = 'ID_SOLIC_ALTER_FUNC'
        ParamType = ptUnknown
      end>
  end
  object qryAux2: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  S.ID_SOLIC_ALTER_FUNC, S.DATA_SOLIC_ALTER'
      'FROM'
      '  SOLALTFUNC S'
      'ORDER BY S.ID_SOLIC_ALTER_FUNC DESC')
    ValidateWithMask = True
    Left = 156
    Top = 352
  end
  object qryFaixa: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  F.*'
      'FROM'
      '  FAIXASAL F, CARGO C'
      'WHERE'
      '  (C.IDCARGO         = :IDCARGO) AND'
      '  (F.IDFAIXASALARIAL = C.IDFAIXASALARIAL)')
    ValidateWithMask = True
    Left = 622
    Top = 12
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCARGO'
        ParamType = ptUnknown
      end>
  end
  object qryParamRH: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  NUMSTEPS, FLGDOISCARGOS, INDPOLITICA'
      'FROM'
      '  PARAMRH')
    ValidateWithMask = True
    Left = 667
    Top = 9
  end
  object qryCargo2: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'Select C.TITULO from CARGO C, FUNCIONARIO F'
      'WHERE F.IDCARGO = C.IDCARGO'
      'AND       F.IDPESSOA = :IDREQUISITANTE')
    ValidateWithMask = True
    Left = 280
    Top = 10
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDREQUISITANTE'
        ParamType = ptUnknown
      end>
  end
end
