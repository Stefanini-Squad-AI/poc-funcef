inherited frmCadSegregaCotacao: TfrmCadSegregaCotacao
  Left = 212
  Top = 116
  HelpContext = 10134
  Caption = 'Cotação de Critérios para Segregação'
  ClientHeight = 454
  ClientWidth = 603
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 603
    Height = 368
    inherited pnlMestre: TPanel
      Width = 601
      Height = 113
      object Label1: TLabel
        Left = 16
        Top = 8
        Width = 142
        Height = 13
        Caption = 'Critério para Segregação'
      end
      object Label2: TLabel
        Left = 16
        Top = 56
        Width = 213
        Height = 13
        Caption = 'Vigência do Critério para Segregação'
      end
      object dbCboCriterio: TwwDBLookupCombo
        Left = 16
        Top = 24
        Width = 353
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'60'#9'Descrição'#9'F'
          'ORDEM'#9'10'#9'Ordem'#9'F')
        DataField = 'IDSEGREGACRITER'
        DataSource = ds
        LookupTable = cdsSegregaCriter
        LookupField = 'IDSEGREGACRITER'
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnCloseUp = dbCboCriterioCloseUp
      end
      object edtDataIni: TCMDateTimePicker
        Left = 16
        Top = 72
        Width = 105
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATAINI'
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
      object edtDataFim: TCMDateTimePicker
        Left = 128
        Top = 71
        Width = 105
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATAFIM'
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
      end
      object rdgTipoSegrega: TDBRadioGroup
        Left = 373
        Top = 17
        Width = 212
        Height = 34
        Columns = 2
        DataField = 'FLGTIPOSEGREGA'
        DataSource = ds
        Enabled = False
        Items.Strings = (
          'Administrativo'
          'Investimento')
        TabOrder = 3
        Values.Strings = (
          'A'
          'I')
      end
      object DBRadioGroup2: TDBRadioGroup
        Left = 373
        Top = 64
        Width = 212
        Height = 34
        Columns = 2
        DataField = 'FLGTIPOCOTACAO'
        DataSource = ds
        Enabled = False
        Items.Strings = (
          'Percentual'
          'Cota')
        TabOrder = 4
        Values.Strings = (
          'P'
          'C')
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 114
      Width = 601
      Height = 253
      Tabs.Strings = (
        'Percentuais para Rateio')
      inherited pgctrlDetalhe: TPageControl
        Width = 503
        Height = 194
        inherited tbsDet: TTabSheet
          Caption = 'Percentuais para Rateio'
          inherited pnlControlesDet: TPanel
            Width = 495
            Height = 166
            object Label4: TLabel
              Left = 13
              Top = 63
              Width = 33
              Height = 13
              Caption = 'Plano'
            end
            object Label3: TLabel
              Left = 13
              Top = 10
              Width = 80
              Height = 13
              Caption = 'Patrocinadora'
            end
            object Label5: TLabel
              Left = 13
              Top = 117
              Width = 30
              Height = 13
              Caption = 'Valor'
            end
            object dblcPlanoPrevC: TwwDBLookupCombo
              Left = 13
              Top = 79
              Width = 369
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'30'#9'Nome')
              DataField = 'IDPLANOPREV'
              DataSource = dsDet
              LookupTable = CdsPlanoPrev
              LookupField = 'IDPLANOPREV'
              Options = [loColLines]
              DropDownCount = 5
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object dblcPatroC: TwwDBLookupCombo
              Left = 13
              Top = 26
              Width = 369
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'30'#9'Nome')
              DataField = 'IDPATRO'
              DataSource = dsDet
              LookupTable = CdsPatro
              LookupField = 'IDPESSOA'
              Options = [loColLines]
              DropDownCount = 5
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object dbEdtValor: TDBRealEdit
              Left = 13
              Top = 133
              Width = 145
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '50,000000000000')
              TabOrder = 2
              WordWrap = False
              IntDigits = 10
              DecDigits = 12
              NumberFormat = fNumber
              Signal = False
              DataField = 'COTACAO'
              DataSource = dsDet
            end
          end
          inherited dbgrdDet: TwwDBGrid
            Width = 495
            Height = 166
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgWordWrap, dgShowFooter]
            OnTitleButtonClick = dbgrdDetTitleButtonClick
            OnUpdateFooter = dbgrdDetUpdateFooter
            FooterHeight = 23
          end
        end
      end
      inherited Dock973: TDock97
        Width = 593
      end
      inherited Dock974: TDock97
        Left = 507
        Height = 194
      end
    end
  end
  inherited Dock972: TDock97
    Width = 603
  end
  inherited Dock971: TDock97
    Top = 415
    Width = 603
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
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
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyEdit = CmeCadastroApplyInsert
    ApplyDelete = CmeCadastroApplyDelete
    Left = 384
  end
  inherited Cds: TCMClientDataSet
    object CdsIDSEGREGACRITER: TFloatField
      FieldName = 'IDSEGREGACRITER'
    end
    object CdsDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object CdsORDEM: TFloatField
      FieldName = 'ORDEM'
    end
    object CdsFLGTIPOSEGREGA: TStringField
      FieldName = 'FLGTIPOSEGREGA'
      FixedChar = True
      Size = 1
    end
    object CdsFLGTIPOCOTACAO: TStringField
      FieldName = 'FLGTIPOCOTACAO'
      FixedChar = True
      Size = 1
    end
    object CdsIDSEGREGADATA: TFloatField
      FieldName = 'IDSEGREGADATA'
    end
    object CdsDATAINI: TDateTimeField
      FieldName = 'DATAINI'
    end
    object CdsDATAFIM: TDateTimeField
      FieldName = 'DATAFIM'
    end
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'CR.DESCRICAO'
      'CR.FLGTIPOSEGREGA'
      'DT.DATAINI'
      'DT.DATAFIM')
    TipodeDado.Strings = (
      'C'
      'C'
      'D'
      'D')
    Descricao.Strings = (
      'Descrição'
      'Administrativo / Investimento'
      'Data Inicial'
      'Data Final')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'SEGREGACRITER CR'
      'SEGREGADATA DT')
    CamposChave.Strings = (
      'DT.IDSEGREGADATA')
    Filtro.Strings = (
      'CR.IDSEGREGACRITER = DT.IDSEGREGACRITER')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '1'
      '18'
      '18')
    Left = 512
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 452
  end
  inherited dsDet: TwwDataSource
    AutoEdit = True
    DataSet = CdsDet
  end
  object cdsSegregaCriter: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 149
    Top = 52
    object cdsSegregaCriterDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object cdsSegregaCriterORDEM: TFloatField
      DisplayLabel = 'Ordem'
      DisplayWidth = 10
      FieldName = 'ORDEM'
    end
    object cdsSegregaCriterIDSEGREGACRITER: TFloatField
      FieldName = 'IDSEGREGACRITER'
      Visible = False
    end
    object cdsSegregaCriterFLGTIPOSEGREGA: TStringField
      FieldName = 'FLGTIPOSEGREGA'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsSegregaCriterFLGTIPOCOTACAO: TStringField
      FieldName = 'FLGTIPOCOTACAO'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object CdsPlanoPrev: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 168
    Top = 256
  end
  object CdsPatro: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 216
    Top = 304
  end
  object CdsDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 340
    Top = 65535
    object CdsDetIDSEGREGADATA: TFloatField
      FieldName = 'IDSEGREGADATA'
      Visible = False
    end
    object CdsDetIDSEGREGACOTACAO: TFloatField
      FieldName = 'IDSEGREGACOTACAO'
      Visible = False
    end
    object CdsDetIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
    object CdsDetIDPATRO: TFloatField
      FieldName = 'IDPATRO'
      Visible = False
    end
    object CdsDetCOTACAO: TFloatField
      DisplayLabel = 'Cotação'
      DisplayWidth = 17
      FieldName = 'COTACAO'
    end
    object CdsDetPATRO: TStringField
      DisplayLabel = 'Patrocinadora'
      DisplayWidth = 40
      FieldName = 'PATRO'
      Size = 60
    end
    object CdsDetPLANPREVCONTABIL: TStringField
      DisplayLabel = 'Plano Previdenciário'
      DisplayWidth = 40
      FieldName = 'PLANPREVCONTABIL'
      Size = 50
    end
  end
  object Query1: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CT.IDSEGREGADATA, CT.IDSEGREGACOTACAO,'
      '   CT.IDPLANOPREV, CT.IDPATRO, CT.COTACAO,'
      '   P.NOME AS PATRO, PC.NOME AS PLANPREVCONTABIL'
      'FROM'
      '   PESSOA P, PATRO PA, PLANPREVCONTABIL PC,'
      '   SEGREGACOTACAO CT'
      'WHERE'
      '   ( P.IDPESSOA = PA.IDPESSOA )'
      '   AND ( PA.IDPESSOA = CT.IDPATRO )'
      '   AND ( CT.IDPLANOPREV = PC.IDPLANOPREV )'
      'ORDER BY PATRO, PLANPREVCONTABIL'
      ''
      ' ')
    Left = 437
    Top = 60
  end
  object DataSetProvider1: TDataSetProvider
    DataSet = Query1
    Constraints = True
    Left = 501
    Top = 68
  end
  object _CdsLocal: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 253
    Top = 116
  end
end
