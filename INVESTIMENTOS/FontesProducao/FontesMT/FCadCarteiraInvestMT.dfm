inherited FrmCadCarteiraInvestMT: TFrmCadCarteiraInvestMT
  Left = 220
  Top = 215
  HelpContext = 790101
  Caption = 'Cadastro'
  ClientHeight = 425
  ClientWidth = 744
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 744
    Height = 308
    inherited dbGrd: TwwDBGrid [0]
      Width = 742
      Height = 306
      Selected.Strings = (
        'DESCCARTINVEST'#9'79'#9'Carteira')
    end
    inherited pnlControles: TPanel [1]
      Width = 742
      Height = 306
      object Label2: TLabel
        Left = 16
        Top = 17
        Width = 33
        Height = 13
        Caption = 'Nome'
      end
      object Label7: TLabel
        Left = 16
        Top = 58
        Width = 124
        Height = 13
        Caption = 'Tipo de Investimento '
      end
      object Label9: TLabel
        Left = 385
        Top = 58
        Width = 97
        Height = 13
        Caption = 'Tipo de Mercado'
      end
      object lblConselheiro: TLabel
        Left = 16
        Top = 138
        Width = 67
        Height = 13
        Caption = 'Conselheiro'
      end
      object Label6: TLabel
        Left = 16
        Top = 97
        Width = 33
        Height = 13
        Caption = 'Plano'
      end
      object Label1: TLabel
        Left = 385
        Top = 19
        Width = 38
        Height = 13
        Caption = 'Gestor'
      end
      object Label3: TLabel
        Left = 385
        Top = 139
        Width = 66
        Height = 13
        Caption = 'Data Inicial'
      end
      object Label5: TLabel
        Left = 385
        Top = 98
        Width = 80
        Height = 13
        Caption = 'Patrocinadora'
      end
      object DBENomeCarteira: TwwDBEdit
        Left = 16
        Top = 32
        Width = 351
        Height = 21
        DataField = 'DESCCARTINVEST'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object DbLkTipoInvestimento: TwwDBLookupCombo
        Left = 16
        Top = 73
        Width = 351
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCTIPOINVEST'#9'40'#9'Tipo de Investimento ')
        DataField = 'IDTIPOINVEST'
        DataSource = ds
        LookupField = 'IDTIPOINVEST'
        Options = [loRowLines, loTitles]
        Style = csDropDownList
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object DbLkTipoMercado: TwwDBLookupCombo
        Left = 385
        Top = 73
        Width = 351
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCMERCADO'#9'40'#9'Mercado'#9'F')
        DataField = 'IDMERCADO'
        DataSource = ds
        LookupField = 'IDMERCADO'
        Options = [loRowLines, loTitles]
        Style = csDropDownList
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dblkConselheiro: TwwDBLookupCombo
        Left = 16
        Top = 153
        Width = 351
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCONSELINVEST'#9'40'#9'Nome'#9'F')
        DataField = 'IDCONSELHINVEST'
        DataSource = ds
        LookupField = 'IDCONSELHINVEST'
        Options = [loRowLines, loTitles]
        Style = csDropDownList
        TabOrder = 6
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object DBLkPatro: TwwDBLookupCombo
        Left = 385
        Top = 113
        Width = 351
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'Patrocinadora')
        DataField = 'IDPATROCINADORA'
        DataSource = ds
        LookupField = 'IDPESSOA'
        Options = [loRowLines, loTitles]
        Style = csDropDownList
        TabOrder = 5
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object DBLkPlano: TwwDBLookupCombo
        Left = 16
        Top = 112
        Width = 351
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'40'#9'Plano')
        DataField = 'IDPLANOPREV'
        DataSource = ds
        LookupField = 'IDPLANOPREV'
        Options = [loRowLines, loTitles]
        Style = csDropDownList
        TabOrder = 4
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object DBLkGestor: TwwDBLookupCombo
        Left = 385
        Top = 33
        Width = 351
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'40'#9'Gestores')
        DataField = 'IDGESTORCARTEIRA'
        DataSource = ds
        LookupField = 'IDGESTORCARTEIRA'
        Options = [loRowLines, loTitles]
        Style = csDropDownList
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dbdtDataInicio: TCMDateTimePicker
        Left = 385
        Top = 153
        Width = 111
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATAINICIO'
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
        TabOrder = 7
      end
      object DBCkBCartProp: TDBCheckBox
        Left = 385
        Top = 189
        Width = 109
        Height = 16
        Caption = 'Carteira Própria '
        DataField = 'FLGCARTPROP'
        DataSource = ds
        TabOrder = 9
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBCkBFLGCARTTERC: TDBCheckBox
        Left = 385
        Top = 207
        Width = 146
        Height = 18
        Caption = 'Carteira Terceirizada'
        DataField = 'FLGCARTTERC'
        DataSource = ds
        TabOrder = 10
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object dbckCartLastro: TDBCheckBox
        Left = 385
        Top = 225
        Width = 125
        Height = 18
        Caption = 'Carteira de Lastro'
        DataField = 'FLGCARTLASTRO'
        DataSource = ds
        TabOrder = 11
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object DBCkBOrdemMov: TDBCheckBox
        Left = 385
        Top = 243
        Width = 204
        Height = 18
        Caption = 'Exige Ordem de Movimentação'
        DataField = 'FLGORDMOVINV'
        DataSource = ds
        TabOrder = 12
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object DbRdAtualiza: TDBRadioGroup
        Left = 16
        Top = 184
        Width = 351
        Height = 49
        Caption = ' Atualização '
        Columns = 3
        DataField = 'FLGCALCDIARIO'
        DataSource = ds
        Items.Strings = (
          '&Diário'
          '&Mensal'
          '&Não Atualiza')
        TabOrder = 8
        Values.Strings = (
          'D'
          'M'
          'N')
      end
      object dbckContabiliza: TDBCheckBox
        Left = 385
        Top = 261
        Width = 204
        Height = 18
        Caption = 'Contabiliza pela carteira'
        DataField = 'FLGCONTABILIZA'
        DataSource = ds
        TabOrder = 13
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
    end
  end
  inherited Dock972: TDock97
    Width = 744
  end
  inherited Dock971: TDock97
    Top = 386
    Width = 744
    inherited tb97Fundo: TToolbar97
      Left = 407
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 238
    end
  end
  inherited pnlTitulo: TPanel
    Width = 744
    inherited lbNomItem: TfcLabel
      Width = 271
      Caption = 'Carteiras de Investimentos'
    end
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyEdit = CmeCadastroApplyInsert
    ApplyDelete = CmeCadastroApplyInsert
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'CARTEIRAINVEST.DESCCARTINVEST')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Carteira')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'CARTEIRAINVEST')
    CamposChave.Strings = (
      'CARTEIRAINVEST.IDCARTEIRAINVEST')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '50')
    OperComparador.Strings = (
      '-1')
    LookupSQL.Strings = (
      '')
    LookupCampoChave.Strings = (
      '')
    LookupCampoExibe.Strings = (
      '')
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      'SELECT *'
      'FROM CARTEIRAINVEST'
      ' ')
    ClientDataSet = Cds
    Left = 216
    Top = 191
  end
end
