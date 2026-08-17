inherited frmCadIndicadorXUnidAutMT: TfrmCadIndicadorXUnidAutMT
  Left = 23
  Top = 170
  HelpContext = 640057
  Caption = 'Indicadores Apurados por Unidade Autônoma'
  ClientHeight = 324
  ClientWidth = 613
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 613
    Height = 238
    inherited dbGrd: TwwDBGrid [0]
      Top = 93
      Width = 611
      Height = 144
    end
    inherited pnlControles: TPanel [1]
      Top = 93
      Width = 611
      Height = 144
      object Label22: TLabel
        Left = 16
        Top = 10
        Width = 101
        Height = 13
        Caption = 'Tipo de Indicador'
      end
      object Label24: TLabel
        Left = 472
        Top = 10
        Width = 104
        Height = 13
        Caption = 'Data de Apuração'
      end
      object Label25: TLabel
        Left = 232
        Top = 50
        Width = 30
        Height = 13
        Caption = 'Valor'
      end
      object Label1: TLabel
        Left = 16
        Top = 50
        Width = 74
        Height = 13
        Caption = 'Competência'
      end
      object DBcboIndicador: TwwDBLookupCombo
        Left = 16
        Top = 24
        Width = 441
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'INMDESCRICAO'#9'60'#9'Indicador'#9'F')
        DataField = 'IDINDICADORIMOVEL'
        DataSource = ds
        LookupTable = CdsIndicador
        LookupField = 'IDINDICADORIMOVEL'
        Style = csDropDownList
        DropDownWidth = 8
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
      end
      object DBedtDataApuracao: TCMDateTimePicker
        Left = 472
        Top = 24
        Width = 113
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'DATAAPURADO'
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
      object DBrdgPrevReal: TDBRadioGroup
        Left = 352
        Top = 49
        Width = 233
        Height = 36
        Columns = 2
        DataField = 'FLGPREVREAL'
        DataSource = ds
        Items.Strings = (
          'Previsto'
          'Realizado')
        TabOrder = 2
        TabStop = True
        Values.Strings = (
          'P'
          'R')
      end
      object DBedtVlr: TDBEdit
        Left = 232
        Top = 64
        Width = 113
        Height = 21
        DataField = 'VLRAPURADO'
        DataSource = ds
        TabOrder = 3
      end
      object DBspnAnoCompetencia: TwwDBSpinEdit
        Left = 152
        Top = 64
        Width = 65
        Height = 21
        Increment = 1
        MaxValue = 2050
        MinValue = 1980
        Value = 1980
        DataField = 'ANOCOMPETENCIA'
        DataSource = ds
        TabOrder = 4
        UnboundDataType = wwDefault
      end
      object cboMesCompetencia: TwwDBComboBox
        Left = 16
        Top = 64
        Width = 137
        Height = 21
        ShowButton = True
        Style = csDropDownList
        MapList = True
        AllowClearKey = False
        DataField = 'MESCOMPETENCIA'
        DataSource = ds
        DropDownCount = 8
        ItemHeight = 13
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
        TabOrder = 5
        UnboundDataType = wwDefault
      end
      object DBrdgTipo: TDBRadioGroup
        Left = 16
        Top = 89
        Width = 401
        Height = 36
        Columns = 3
        DataField = 'RECPAG'
        DataSource = dsIndicador
        Items.Strings = (
          'Receita'
          'Despesa'
          'Desempenho')
        ReadOnly = True
        TabOrder = 6
        Values.Strings = (
          'R'
          'D'
          'E')
      end
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 611
      Height = 92
      Align = alTop
      TabOrder = 2
      inline molUnidAutonoma1: TmolUnidAutonoma
        Left = 8
        Top = 3
        Width = 609
        Height = 86
        inherited edtUnidaut: TEdit [2]
          Width = 545
        end
        inherited edtImovel: TEdit [3]
          Width = 569
        end
        inherited btnBuscaUnidaut: TBitBtn [4]
          Left = 552
          OnClick = molUnidAutonoma1btnBuscaUnidautClick
        end
        inherited btnLimpaUnidaut: TBitBtn [5]
          Left = 448
          Enabled = False
          Visible = False
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 613
  end
  inherited Dock971: TDock97
    Top = 285
    Width = 613
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyEdit
  end
  inherited Cds: TCMClientDataSet
    object CdsINMDESCRICAO: TStringField
      DisplayLabel = 'Indicador'
      DisplayWidth = 47
      FieldName = 'INMDESCRICAO'
      Size = 60
    end
    object CdsMESCOMPETENCIA: TFloatField
      DisplayLabel = 'Mês Comp'
      DisplayWidth = 10
      FieldName = 'MESCOMPETENCIA'
    end
    object CdsANOCOMPETENCIA: TFloatField
      DisplayLabel = 'Ano Comp'
      DisplayWidth = 9
      FieldName = 'ANOCOMPETENCIA'
    end
    object CdsVLRAPURADO: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 13
      FieldName = 'VLRAPURADO'
      DisplayFormat = '#,##0.00'
    end
    object CdsIDINDICADORXAPUR: TFloatField
      DisplayWidth = 17
      FieldName = 'IDINDICADORXAPUR'
      Visible = False
    end
    object CdsIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
      Visible = False
    end
    object CdsIDUNIDAUT: TFloatField
      FieldName = 'IDUNIDAUT'
      Visible = False
    end
    object CdsDATAAPURADO: TDateTimeField
      FieldName = 'DATAAPURADO'
      Visible = False
    end
    object CdsFLGPREVREAL: TStringField
      FieldName = 'FLGPREVREAL'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object CdsIDINDICADORIMOVEL: TFloatField
      FieldName = 'IDINDICADORIMOVEL'
      Visible = False
    end
    object CdsFLGTIPOVALOR: TStringField
      FieldName = 'FLGTIPOVALOR'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object CdsRECPAG: TStringField
      FieldName = 'RECPAG'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'IM.IMONOME'
      'I.IMONOME'
      'U.UNANOME'
      'II.INMDESCRICAO'
      'IA.MESCOMPETENCIA'
      'IA.ANOCOMPETENCIA'
      'IA.VLRAPURADO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'N'
      'N'
      'N')
    Descricao.Strings = (
      'Imóvel Mestre'
      'Imóvel'
      'Unidade Autônoma'
      'Indicador'
      'Mês Competência'
      'Ano Competência'
      'Valor Indicador')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'INDICADORXAPUR IA'
      'INDICADORIMOVEL II'
      'IMOVEL I'
      'IMOVEL IM'
      'UNIDAUT U')
    CamposChave.Strings = (
      'IA.IDINDICADORXAPUR'
      'IA.IDUNIDAUT'
      'IA.IDINDICADORIMOVEL'
      'IM.IMONOME'
      'I.IMONOME'
      'U.UNANOME')
    Filtro.Strings = (
      'IA.IDINDICADORIMOVEL = II.IDINDICADORIMOVEL'
      'IM.IDIMOVEL = I.IDIMOVELMESTRE'
      'IA.IDUNIDAUT = U.IDUNIDAUT'
      'U.IDIMOVEL = I.IDIMOVEL')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '40'
      '60'
      '60'
      '60'
      '10'
      '10'
      '10')
    Left = 376
  end
  object dsIndicador: TwwDataSource
    DataSet = CdsIndicador
    Left = 325
    Top = 168
  end
  object CdsIndicador: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 397
    Top = 160
    object CdsIndicadorINMDESCRICAO: TStringField
      DisplayLabel = 'Indicador'
      DisplayWidth = 60
      FieldName = 'INMDESCRICAO'
      Size = 60
    end
    object CdsIndicadorIDINDICADORIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINDICADORIMOVEL'
      Visible = False
    end
    object CdsIndicadorFLGTIPOVALOR: TStringField
      DisplayWidth = 1
      FieldName = 'FLGTIPOVALOR'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object CdsIndicadorRECPAG: TStringField
      DisplayWidth = 1
      FieldName = 'RECPAG'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object CdsIndicadorFLGUNIDAUT: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGUNIDAUT'
      Visible = False
    end
  end
end
