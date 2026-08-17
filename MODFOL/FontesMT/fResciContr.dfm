inherited frmResciContr: TfrmResciContr
  Left = 312
  Top = 0
  HelpContext = 210072
  Caption = 'Rescisão de Contrato de Trabalho'
  ClientHeight = 696
  ClientWidth = 729
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 729
    Height = 610
    BorderWidth = 2
    object Label6: TLabel
      Left = 120
      Top = 296
      Width = 104
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = '(Gerencial)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label4: TLabel
      Left = 120
      Top = 251
      Width = 104
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = '(RAIS)'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Bevel1: TBevel
      Left = 4
      Top = 4
      Width = 721
      Height = 157
      Shape = bsFrame
      Style = bsRaised
    end
    object Label12: TLabel
      Left = 50
      Top = 13
      Width = 119
      Height = 14
      AutoSize = False
      Caption = 'Nome da Pessoa'
    end
    object Label8: TLabel
      Left = 51
      Top = 38
      Width = 119
      Height = 13
      AutoSize = False
      Caption = 'Último Cargo'
    end
    object Label9: TLabel
      Left = 51
      Top = 67
      Width = 119
      Height = 13
      AutoSize = False
      Caption = 'Último Salário'
    end
    object Label10: TLabel
      Left = 51
      Top = 98
      Width = 119
      Height = 13
      AutoSize = False
      Caption = 'Data Admissão'
    end
    object Label1: TLabel
      Left = 354
      Top = 98
      Width = 55
      Height = 13
      Caption = 'Matrícula'
    end
    object Label23: TLabel
      Left = 50
      Top = 164
      Width = 111
      Height = 13
      AutoSize = False
      Caption = 'Data Desligamento'
    end
    object Label19: TLabel
      Left = 240
      Top = 164
      Width = 109
      Height = 13
      Caption = 'Data Homologação'
    end
    object Label3: TLabel
      Left = 50
      Top = 207
      Width = 119
      Height = 13
      AutoSize = False
      Caption = 'Nova Situação'
    end
    object Label2: TLabel
      Left = 50
      Top = 251
      Width = 119
      Height = 13
      AutoSize = False
      Caption = 'Motivo Desligamento'
    end
    object Label5: TLabel
      Left = 50
      Top = 296
      Width = 119
      Height = 13
      AutoSize = False
      Caption = 'Motivo Desligamento'
    end
    object Label14: TLabel
      Left = 374
      Top = 164
      Width = 131
      Height = 13
      AutoSize = False
      Caption = 'Saque FGTS (TRCT)'
    end
    object Label15: TLabel
      Left = 374
      Top = 207
      Width = 130
      Height = 13
      AutoSize = False
      Caption = 'Vínculo Empregatício'
    end
    object Label16: TLabel
      Left = 374
      Top = 251
      Width = 130
      Height = 13
      AutoSize = False
      Caption = 'Movimento Contratual'
    end
    object Label17: TLabel
      Left = 374
      Top = 296
      Width = 118
      Height = 13
      AutoSize = False
      Caption = 'Afastamento RAIS'
    end
    object lblProcessoTrab: TLabel
      Left = 50
      Top = 563
      Width = 154
      Height = 15
      AutoSize = False
      Caption = 'Nº Processo Trabalhista'
      WordWrap = True
    end
    object lblDtFimQuarentena: TLabel
      Left = 374
      Top = 563
      Width = 111
      Height = 13
      Caption = 'Dt. Fim Quarentena'
    end
    object dbedNome: TwwDBEdit
      Left = 173
      Top = 11
      Width = 351
      Height = 21
      TabStop = False
      Color = clGray
      DataField = 'NOME'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbedCargo: TwwDBEdit
      Left = 173
      Top = 35
      Width = 351
      Height = 21
      TabStop = False
      Color = clGray
      DataField = 'TITULO'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbedSalAtual: TDBRealEdit
      Left = 173
      Top = 64
      Width = 103
      Height = 21
      TabStop = False
      Alignment = taRightJustify
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Lines.Strings = (
        '0,00')
      ParentFont = False
      ReadOnly = True
      TabOrder = 2
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
      DataField = 'SALARIOATUAL'
      DataSource = ds
    end
    object dbrgTipoSalar: TDBRadioGroup
      Left = 285
      Top = 56
      Width = 161
      Height = 36
      Columns = 3
      DataField = 'TIPOPAGAMENTO'
      DataSource = ds
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
    object dbedDtAdmiss: TwwDBEdit
      Left = 173
      Top = 96
      Width = 103
      Height = 21
      TabStop = False
      Color = clGray
      DataField = 'DATAADMISSAO'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbedMat: TwwDBEdit
      Left = 421
      Top = 96
      Width = 103
      Height = 21
      TabStop = False
      Color = clGray
      DataField = 'MATRICULA'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 6
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbrgTipContra: TDBRadioGroup
      Left = 558
      Top = 12
      Width = 131
      Height = 141
      Caption = 'Tipo de Contrato'
      DataField = 'TIPOCONTRATO'
      DataSource = ds
      Items.Strings = (
        'Efetivo'
        'Efetivo Especial'
        'Temporário'
        'Estagiário'
        'Terceiro'
        'Prop/Dir s/ Vinc'
        'Autônomo')
      ReadOnly = True
      TabOrder = 7
      Values.Strings = (
        'E'
        'S'
        'T'
        'G'
        '3'
        'P'
        'A')
    end
    object gbxContrato: TGroupBox
      Left = 30
      Top = 115
      Width = 506
      Height = 38
      TabOrder = 8
      object Label11: TLabel
        Left = 20
        Top = 14
        Width = 98
        Height = 13
        Caption = 'Final do Contrato'
      end
      object Label13: TLabel
        Left = 293
        Top = 14
        Width = 87
        Height = 13
        Caption = 'Dias Restantes'
      end
      object dbedFimContr: TDBEdit
        Left = 143
        Top = 11
        Width = 103
        Height = 21
        TabStop = False
        Color = clGray
        DataField = 'DATAFIMCONTRATO'
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
      object redDiasRest: TRealEdit
        Left = 390
        Top = 11
        Width = 105
        Height = 21
        TabStop = False
        Alignment = taRightJustify
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Lines.Strings = (
          '0')
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        WordWrap = False
        IntDigits = 10
        DecDigits = 0
        NumberFormat = iNumber
        Signal = False
      end
    end
    object dbedDatSaida: TCMDateTimePicker
      Left = 50
      Top = 180
      Width = 110
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      ButtonStyle = cbsCustom
      DataField = 'DATADESLIGAMENTO'
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
      TabOrder = 9
      UnboundDataType = wwDTEdtDate
      OnChange = dblckSitFuncChange
    end
    object edDataHomol: TCMDateTimePicker
      Left = 240
      Top = 180
      Width = 110
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
      TabOrder = 10
      UnboundDataType = wwDTEdtDate
    end
    object dblckSitFunc: TwwDBLookupCombo
      Left = 50
      Top = 222
      Width = 300
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'50'#9'DESCRICAO')
      DataField = 'IDSITFUNC'
      DataSource = ds
      LookupTable = CdsSitFunc
      LookupField = 'IDSITFUNC'
      Style = csDropDownList
      TabOrder = 11
      AutoDropDown = True
      ShowButton = True
      UseTFields = False
      AllowClearKey = True
      OnChange = dblckSitFuncChange
    end
    object dblckMotivo1: TwwDBLookupCombo
      Left = 50
      Top = 267
      Width = 300
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'50'#9'DESCRICAO')
      DataField = 'IDMOTIVODESLIGRAIS'
      DataSource = ds
      LookupTable = CdsMotivo
      LookupField = 'IDMOTIVO'
      Style = csDropDownList
      TabOrder = 12
      AutoDropDown = True
      ShowButton = True
      UseTFields = False
      AllowClearKey = True
      OnChange = dblckSitFuncChange
    end
    object dblckMotivo2: TwwDBLookupCombo
      Left = 50
      Top = 311
      Width = 300
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'50'#9'DESCRICAO')
      DataField = 'IDMOTIVODESLIGGERENCIAL'
      DataSource = ds
      LookupTable = CdsMotivoGer
      LookupField = 'IDMOTIVO'
      Style = csDropDownList
      TabOrder = 13
      AutoDropDown = True
      ShowButton = True
      UseTFields = False
      AllowClearKey = True
      OnChange = dblckSitFuncChange
    end
    object dblckRescFGTS: TwwDBLookupCombo
      Left = 374
      Top = 180
      Width = 300
      Height = 21
      DropDownAlignment = taRightJustify
      Selected.Strings = (
        'DESCRICAO'#9'50'#9'DESCRICAO')
      DataField = 'IDFORMARESC'
      DataSource = ds
      LookupTable = CdsFormFGTS
      LookupField = 'IDFORMARESC'
      Style = csDropDownList
      TabOrder = 14
      AutoDropDown = True
      ShowButton = True
      UseTFields = False
      AllowClearKey = True
    end
    object dblckVinculo: TwwDBLookupCombo
      Left = 374
      Top = 222
      Width = 300
      Height = 21
      DropDownAlignment = taRightJustify
      Selected.Strings = (
        'DESCRICAO'#9'50'#9'DESCRICAO')
      DataField = 'IDVINCEMPREG'
      DataSource = ds
      LookupTable = CdsVinculo
      LookupField = 'IDVINCEMPREG'
      Style = csDropDownList
      TabOrder = 15
      AutoDropDown = True
      ShowButton = True
      UseTFields = False
      AllowClearKey = True
    end
    object dblckMovContr: TwwDBLookupCombo
      Left = 374
      Top = 267
      Width = 300
      Height = 21
      DropDownAlignment = taRightJustify
      Selected.Strings = (
        'DESCRICAO'#9'50'#9'DESCRICAO')
      DataField = 'IDMOVCONTRCAGED'
      DataSource = ds
      LookupTable = CdsMovContr
      LookupField = 'IDMOVCONTRCAGED'
      Style = csDropDownList
      TabOrder = 16
      AutoDropDown = True
      ShowButton = True
      UseTFields = False
      AllowClearKey = True
    end
    object dblckAfastRAIS: TwwDBLookupCombo
      Left = 374
      Top = 311
      Width = 300
      Height = 21
      DropDownAlignment = taRightJustify
      Selected.Strings = (
        'DESCRICAO'#9'50'#9'DESCRICAO')
      DataField = 'IDAFASTRAIS'
      DataSource = ds
      LookupTable = CdsAfastRAIS
      LookupField = 'IDAFASTRAIS'
      Style = csDropDownList
      TabOrder = 17
      AutoDropDown = True
      ShowButton = True
      UseTFields = False
      AllowClearKey = True
    end
    object gbxNivel: TGroupBox
      Left = 456
      Top = 56
      Width = 78
      Height = 36
      TabOrder = 5
      object Label18: TLabel
        Left = 6
        Top = 14
        Width = 32
        Height = 13
        Caption = 'Nível'
      end
      object dbredNivel: TDBRealEdit
        Left = 44
        Top = 10
        Width = 23
        Height = 21
        TabStop = False
        Alignment = taRightJustify
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Lines.Strings = (
          '0')
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        WordWrap = False
        IntDigits = 10
        DecDigits = 0
        NumberFormat = iNumber
        Signal = False
        DataField = 'NIVELINDIV1'
        DataSource = ds
      end
    end
    object dbeProcessoTrab: TDBEdit
      Left = 50
      Top = 578
      Width = 241
      Height = 21
      DataField = 'PROCESSOTRAB'
      DataSource = ds
      MaxLength = 20
      TabOrder = 20
    end
    object dtpDtFimQuarentena: TCMDateTimePicker
      Left = 374
      Top = 578
      Width = 110
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      ButtonStyle = cbsCustom
      DataField = 'DTFIMQUAR'
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
      TabOrder = 21
      UnboundDataType = wwDTEdtDate
    end
    object grpAvisoPrevio: TGroupBox
      Left = 50
      Top = 343
      Width = 624
      Height = 153
      Caption = 'Aviso Prévio'
      TabOrder = 18
      TabStop = True
      object lblTipoAviso: TLabel
        Left = 16
        Top = 64
        Width = 115
        Height = 13
        Caption = 'Tipo Aviso - eSocial'
      end
      object lblDtCancelamento: TLabel
        Left = 16
        Top = 104
        Width = 112
        Height = 13
        Caption = 'Data Cancelamento'
      end
      object lblMotivCancelamento: TLabel
        Left = 136
        Top = 104
        Width = 141
        Height = 13
        Caption = 'Motivo do Cancelamento'
      end
      object Label7: TLabel
        Left = 16
        Top = 22
        Width = 63
        Height = 13
        Caption = 'Data Aviso'
      end
      object Label20: TLabel
        Left = 136
        Top = 22
        Width = 119
        Height = 13
        AutoSize = False
        Caption = 'Tipo Aviso'
      end
      object lblTerminoAviso: TLabel
        Left = 395
        Top = 33
        Width = 119
        Height = 31
        AutoSize = False
        Caption = 'Dt. Término Aviso Prévio Indenizado'
        WordWrap = True
      end
      object dbcmbTipoAviso: TwwDBComboBox
        Left = 16
        Top = 79
        Width = 592
        Height = 21
        ShowButton = True
        Style = csDropDownList
        MapList = True
        AllowClearKey = True
        AutoDropDown = True
        DataField = 'TIPOAVISOPREV'
        DataSource = ds
        DropDownCount = 8
        DropDownWidth = 850
        ItemHeight = 0
        Items.Strings = (
          
            'Aviso prévio trabalhado dado pelo empregador ao empregado, que o' +
            'ptou pela redução de duas horas diárias [caput do art. 488 da CL' +
            'T]'#9'1'
          
            'Aviso prévio trabalhado dado pelo empregador ao empregado, que o' +
            'ptou pela redução de dias corridos [parágrafo único do art. 488 ' +
            'da CLT]'#9'2'
          
            'Aviso prévio dado pelo empregado (pedido de demissão), não dispe' +
            'nsado de seu cumprimento, sob pena de desconto, pelo empregador,' +
            ' dos salários correspondentes ao prazo respectivo (§2º do art. 4' +
            '87 da CLT)'#9'4'
          
            'Aviso prévio trabalhado dado pelo empregador rural ao empregado,' +
            ' com redução de um dia por semana ( art. 15 da Lei nº 5889/73)'#9'5'
          
            'Aviso prévio trabalhado decorrente de acordo entre empregado e e' +
            'mpregador (art. 484-A, "caput", da CLT)'#9'6')
        Sorted = False
        TabOrder = 3
        UnboundDataType = wwDefault
      end
      object dtpDtCancelamento: TCMDateTimePicker
        Left = 16
        Top = 119
        Width = 115
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATACANCEL_AVISOPREV'
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
        TabOrder = 4
        OnExit = dtpDtCancelamentoExit
      end
      object dbcmbMotivCancelamento: TwwDBComboBox
        Left = 138
        Top = 119
        Width = 471
        Height = 21
        ShowButton = True
        Style = csDropDownList
        MapList = True
        AllowClearKey = True
        AutoDropDown = True
        DataField = 'MOTIVOCANCEL_AVISOPREV'
        DataSource = ds
        DropDownCount = 8
        ItemHeight = 0
        Items.Strings = (
          'Reconsideração prevista no artigo 489 da CLT'#9'1'
          'Determinação Judicial'#9'2'
          'Cumprimento de norma legal'#9'3'
          'Outros'#9'9')
        Sorted = False
        TabOrder = 5
        UnboundDataType = wwDefault
      end
      object dbedDatAviso: TCMDateTimePicker
        Left = 16
        Top = 37
        Width = 115
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATAAVISO'
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
        UnboundDataType = wwDTEdtDate
      end
      object cboAvisoTrab: TComboBox
        Tag = 2
        Left = 138
        Top = 37
        Width = 247
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
        OnChange = cboAvisoTrabChange
        OnKeyDown = cboAvisoTrabKeyDown
        Items.Strings = (
          'Indenizado'
          'Trabalhado'
          'Ausência/dispensa')
      end
      object tmpDtTerminoAviso: TCMDateTimePicker
        Left = 508
        Top = 37
        Width = 100
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATATERMINOAVISO'
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
        TabOrder = 2
        UnboundDataType = wwDTEdtDate
      end
    end
    object grpPensaoAlimenticia: TGroupBox
      Left = 50
      Top = 498
      Width = 624
      Height = 56
      Caption = 'Pensão Alimentícia para fins de retenção de FGTS '
      TabOrder = 19
      TabStop = True
      object lblPercPensaoResc: TLabel
        Left = 444
        Top = 11
        Width = 31
        Height = 13
        Caption = 'Perc.'
      end
      object lblValorPensaoResc: TLabel
        Left = 444
        Top = 33
        Width = 30
        Height = 13
        Caption = 'Valor'
      end
      object dbRgpPensaoVerbResc: TDBRadioGroup
        Left = 6
        Top = 13
        Width = 420
        Height = 35
        Columns = 4
        DataField = 'FLGPENSAORESC'
        DataSource = ds
        Items.Strings = (
          'Percentual'
          'Valor'
          'Ambos'
          'Não se aplica')
        TabOrder = 0
        TabStop = True
        Values.Strings = (
          'P'
          'V'
          'A'
          'N')
        OnClick = dbRgpPensaoVerbRescClick
      end
      object dbEdtPercPensaoResc: TDBRealEdit
        Left = 477
        Top = 9
        Width = 103
        Height = 21
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Lines.Strings = (
          '0,00')
        ParentFont = False
        TabOrder = 1
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'PERCPENSAORESC'
        DataSource = ds
      end
      object dbEdtValorPensaoResc: TDBRealEdit
        Left = 477
        Top = 31
        Width = 103
        Height = 21
        Alignment = taRightJustify
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Lines.Strings = (
          '0,00')
        ParentFont = False
        TabOrder = 2
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'VLRPENSAORESC'
        DataSource = ds
      end
    end
  end
  inherited Dock972: TDock97
    Width = 729
    object Bevel2: TBevel [0]
      Left = 448
      Top = 3
      Width = 268
      Height = 38
    end
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Left = 60
        Enabled = False
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Left = 0
      end
      inherited sbtnApagar: TToolbarButton97
        Enabled = False
        Visible = False
      end
    end
    object cbxEnviaMensagem: TCheckBox
      Left = 459
      Top = 23
      Width = 250
      Height = 17
      Caption = 'Envia Mensagem Sobre a Homologação'
      TabOrder = 2
    end
    object chkLOG: TCheckBox
      Left = 459
      Top = 5
      Width = 78
      Height = 17
      Caption = 'Gerar Log'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
  end
  inherited Dock971: TDock97
    Top = 657
    Width = 729
    inherited tb97Fundo: TToolbar97
      Left = 557
      DockPos = 585
      TabOrder = 2
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 388
      DockPos = 416
      TabOrder = 1
    end
    object sbtnCalcular: TBitBtn
      Left = 0
      Top = 0
      Width = 82
      Height = 37
      Hint = 'Calcular a Rescisão'
      Caption = ' Ca&lcular'
      Default = True
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnClick = sbtnCalcularClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00337000000000
        73333337777777773F333308888888880333337F3F3F3FFF7F33330808089998
        0333337F737377737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3F3F3F3F7F33330808080808
        0333337F737373737F333308888888880333337F3FFFFFFF7F33330800000008
        0333337F7777777F7F333308000E0E080333337F7FFFFF7F7F33330800000008
        0333337F777777737F333308888888880333337F333333337F33330888888888
        03333373FFFFFFFF733333700000000073333337777777773333}
      NumGlyphs = 2
      Spacing = 2
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 683
    Top = 95
    TargetsData = (
      1
      2
      (
        'TRealEdit'
        'Text'
        0)
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 118
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 395
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    ApplyEdit = CmeCadastroApplyEdit
    Left = 333
    Top = 1
  end
  inherited Cds: TCMClientDataSet
    BeforePost = CdsBeforePost
    Left = 90
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Empregados'
    Colunas.Strings = (
      'PESSOA.NOME'
      'FUNCIONARIO.MATRICULA'
      'PESSOA.NUMDOCUMENTO'
      'CARGO.TITULO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nome da Pessoa'
      'Matrícula'
      'CPF (ou equivalente)'
      'Cargo')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'FUNCIONARIO'
      'CARGO')
    CamposChave.Strings = (
      'FUNCIONARIO.IDPESSOA')
    Filtro.Strings = (
      'CARGO.IDCARGO        = FUNCIONARIO.IDCARGO'
      'FUNCIONARIO.IDPESSOA = PESSOA.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '22'
      '22'
      '40')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1')
    ApenasLetraENum.Strings = (
      'N'
      'N'
      'N'
      'N')
    ComparaMaiuscula.Strings = (
      ''
      ''
      ''
      '')
    LookupSQL.Strings = (
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      '')
    Left = 264
    Top = 1
  end
  object CdsSitFunc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 46
    Top = 99
  end
  object CdsMotivo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 30
    Top = 89
  end
  object CdsVinculo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 126
    Top = 91
  end
  object CdsFormFGTS: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 126
    Top = 79
  end
  object CdsMovContr: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 24
    Top = 39
  end
  object CdsAfastRAIS: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 20
    Top = 25
  end
  object CdsMotivoGer: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 130
    Top = 131
  end
  object cdsAuxETL: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 37
    Top = 293
  end
end
