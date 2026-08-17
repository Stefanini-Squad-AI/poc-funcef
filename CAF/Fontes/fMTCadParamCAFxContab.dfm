inherited frmMTCadParamCAFxContab: TfrmMTCadParamCAFxContab
  Left = 336
  Top = 195
  Caption = 'Parametrização Contábil'
  ClientHeight = 420
  ClientWidth = 730
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Top = 34
    Width = 730
    Height = 347
    inherited pnlMestre: TPanel
      Width = 728
      Height = 88
      object lblGrupo: TLabel
        Left = 16
        Top = 8
        Width = 35
        Height = 13
        Caption = 'Grupo'
      end
      object lblTipoMov: TLabel
        Left = 368
        Top = 8
        Width = 83
        Height = 13
        Caption = 'Movimentação'
      end
      object Label5: TLabel
        Left = 368
        Top = 48
        Width = 217
        Height = 13
        Caption = 'Tipos Específicos de Movimentações '
      end
      object dblcGrupo: TwwDBLookupCombo
        Left = 16
        Top = 24
        Width = 342
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'30'#9'NOME'#9'No'
          'CLASSE'#9'15'#9'CLASSE'#9'No')
        DataField = 'IDGRUPO'
        DataSource = ds
        LookupTable = cdsGrupo
        LookupField = 'IDGRUPO'
        Options = [loTitles]
        DropDownCount = 12
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
      end
      object dblcTipoMovimento: TwwDBLookupCombo
        Left = 368
        Top = 24
        Width = 337
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCTIPOMOVIMENTACAO'#9'40'#9'DESCTIPOMOVIMENTACAO'#9'F')
        DataField = 'IDTIPOMOVIMENTACAO'
        DataSource = ds
        LookupTable = cdsMovimento
        LookupField = 'IDTIPOMOVIMENTACAO'
        Options = [loTitles]
        DropDownCount = 12
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        OnCloseUp = dblcTipoMovimentoCloseUp
      end
      object GroupBox4: TGroupBox
        Left = 16
        Top = 49
        Width = 233
        Height = 31
        TabOrder = 3
        TabStop = True
        object cbUsaDepreciacao: TDBCheckBox
          Left = 5
          Top = 9
          Width = 169
          Height = 17
          Caption = 'Usar Depreciação?'
          DataField = 'FLGUSADEPRECIACAO'
          DataSource = ds
          TabOrder = 0
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
      end
      object dblcTipoDespesa: TwwDBLookupCombo
        Left = 368
        Top = 64
        Width = 337
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESTIPODESPESA'#9'50'#9'DESTIPODESPESA'#9'F')
        DataField = 'IDTIPODESPESA'
        DataSource = ds
        LookupTable = cdsTipoDespesaAV
        LookupField = 'IDTIPODESPESA'
        Options = [loTitles]
        DropDownCount = 12
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 89
      Width = 728
      Height = 257
      Tabs.Strings = (
        'Contas Contábeis')
      inherited Dock973: TDock97 [0]
        Width = 720
      end
      inherited Dock974: TDock97 [1]
        Left = 634
        Height = 198
      end
      inherited pgctrlDetalhe: TPageControl [2]
        Width = 630
        Height = 198
        inherited tbsDet: TTabSheet
          Caption = 'Contas Contábeis'
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 622
            Height = 170
            Selected.Strings = (
              'TIPOLANCAMENTO'#9'1'#9'Lançamento'#9'F'
              'PLANO'#9'10'#9'Plano de Contas'#9'F'
              'PLACONTA'#9'18'#9'Conta Contábil'#9'F'
              'PLANOME'#9'42'#9'Descrição'#9'F'
              'CODCENTROCUSTO'#9'12'#9'Centro de Custo'#9'F')
            ParentFont = False
            TitleAlignment = taCenter
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 622
            Height = 170
            object Label2: TLabel
              Left = 192
              Top = 3
              Width = 88
              Height = 13
              Caption = 'Plano de Conta'
            end
            object Label1: TLabel
              Left = 8
              Top = 48
              Width = 84
              Height = 13
              Caption = 'Conta Contábil'
            end
            object spdContaContabil: TSpeedButton
              Left = 160
              Top = 64
              Width = 24
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -24
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
                777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
                77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
                77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
                077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
                FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
                F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
                7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
                777777787FFF8777777777770000777777777777888877777777}
              NumGlyphs = 2
              ParentFont = False
              OnClick = spdContaContabilClick
            end
            object Label3: TLabel
              Left = 192
              Top = 48
              Width = 58
              Height = 13
              Caption = 'Descrição'
            end
            object lblTitCentroCusto: TLabel
              Left = 8
              Top = 112
              Width = 92
              Height = 13
              Caption = 'Centro de Custo'
            end
            object bbtnSelCentroCusto: TSpeedButton
              Left = 160
              Top = 128
              Width = 24
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -24
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
                777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
                77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
                77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
                077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
                FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
                F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
                7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
                777777787FFF8777777777770000777777777777888877777777}
              NumGlyphs = 2
              ParentFont = False
              OnClick = bbtnSelCentroCustoClick
            end
            object Label4: TLabel
              Left = 192
              Top = 112
              Width = 58
              Height = 13
              Caption = 'Descrição'
            end
            object edCentroCusto: TEdit
              Left = 192
              Top = 128
              Width = 415
              Height = 21
              TabOrder = 7
            end
            object dbTipoLanc: TDBRadioGroup
              Left = 8
              Top = 0
              Width = 175
              Height = 41
              Caption = ' Lançamento a '
              Columns = 2
              DataField = 'TIPOLANCAMENTO'
              DataSource = dsDet
              Items.Strings = (
                'Débito'
                'Crédito')
              TabOrder = 0
              Values.Strings = (
                'D'
                'C')
            end
            object edPlanoConta: TEdit
              Left = 192
              Top = 19
              Width = 415
              Height = 21
              Enabled = False
              TabOrder = 3
            end
            object dbeContaContabil: TwwDBEdit
              Left = 8
              Top = 64
              Width = 153
              Height = 21
              DataField = 'PLACONTA'
              DataSource = dsDet
              TabOrder = 1
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
              OnExit = dbeContaContabilExit
            end
            object edPlaNome: TEdit
              Left = 192
              Top = 64
              Width = 415
              Height = 21
              TabOrder = 5
            end
            object dbeCentroCusto: TwwDBEdit
              Left = 8
              Top = 128
              Width = 152
              Height = 21
              DataField = 'CODCENTROCUSTO'
              DataSource = dsDet
              TabOrder = 4
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
              OnExit = dbeCentroCustoExit
            end
            object dbCkbSegrega: TDBCheckBox
              Left = 8
              Top = 88
              Width = 273
              Height = 17
              Caption = 'Conta padrão para o Critério de Segregação'
              DataField = 'FLGSEGREGA'
              DataSource = dsDet
              TabOrder = 2
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object treeContaContabil: TCMTreeViewMT
              Left = 192
              Top = 0
              Width = 422
              Height = 161
              PodeNavegar = True
              DataSource = dsContaContabil
              CampoChave = 'PLACONTA'
              CampoDescricao = 'PLANOME'
              CampoTipo = 'PLATIPO'
              OnDblClick = treeContaContabilDblClick
              OnExit = treeContaContabilExit
              Visible = False
            end
          end
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 730
    Height = 34
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Width = 86
        Height = 28
        Layout = blGlyphLeft
        Spacing = 4
      end
      inherited sbtnAlterar: TToolbarButton97
        Left = 86
        Width = 86
        Height = 28
        Layout = blGlyphLeft
        Spacing = 4
      end
      inherited sbtnProcurar: TToolbarButton97
        Left = 258
        Width = 86
        Height = 28
        Layout = blGlyphLeft
        Spacing = 4
      end
      inherited sbtnApagar: TToolbarButton97
        Left = 172
        Width = 86
        Height = 28
        Layout = blGlyphLeft
        Spacing = 4
      end
    end
  end
  inherited Dock971: TDock97
    Top = 381
    Width = 730
    inherited tb97Fundo: TToolbar97
      Left = 558
      DockPos = 623
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 389
      DockPos = 454
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 682
    Top = 495
  end
  inherited ds: TwwDataSource
    Left = 400
    Top = 0
  end
  inherited ImlPadrao: TImageList
    Left = 744
    Top = 512
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 528
    Top = 0
  end
  inherited Cds: TCMClientDataSet
    Left = 360
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Parâmetro Contábil'
    Colunas.Strings = (
      'GRUPO.CLASSE'
      'GRUPO.NOME'
      'TIPOMOVIMENTACAO.DESCTIPOMOVIMENTACAO'
      'TIPOMOVIMENTACAO.IDTIPOMOVIMENTACAO'
      'TIPODESPESAAV.IDTIPODESPESA'
      'TIPODESPESAAV.DESTIPODESPESA')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'N'
      'N'
      'C')
    Descricao.Strings = (
      'Código Grupo'
      'Nome Grupo'
      'Nome Movimentação'
      'Código Movimentação'
      'Código Tipo da Despesa'
      'Nome da Despesa')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'GRUPO'
      'TIPOMOVIMENTACAO'
      'TIPOSMOVIMENTOGRUPOS'
      'TIPODESPESAAV')
    CamposChave.Strings = (
      'TIPOSMOVIMENTOGRUPOS.IDPESSOA'
      'TIPOSMOVIMENTOGRUPOS.IDGRUPO'
      'TIPOSMOVIMENTOGRUPOS.IDTIPOMOVIMENTACAO'
      'TIPODESPESAAV.IDTIPODESPESA')
    Filtro.Strings = (
      'GRUPO.IDGRUPO = TIPOSMOVIMENTOGRUPOS.IDGRUPO'
      
        'TIPOMOVIMENTACAO.IDTIPOMOVIMENTACAO = TIPOSMOVIMENTOGRUPOS.IDTIP' +
        'OMOVIMENTACAO'
      
        'TIPODESPESAAV.IDTIPODESPESA (+) = TIPOSMOVIMENTOGRUPOS.IDTIPODES' +
        'PESA ')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '15'
      '30'
      '40'
      '10'
      '10'
      '50')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 456
    Top = 0
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 280
    Top = 104
  end
  inherited dsDet: TwwDataSource
    DataSet = cdsDet
    Left = 592
    Top = 46
  end
  object dsContaContabil: TwwDataSource
    DataSet = cdsContaContabil
    Left = 368
    Top = 117
  end
  object cdsDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    AfterScroll = cdsDetAfterScroll
    Left = 576
    Top = 40
  end
  object cdsGrupo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 112
    Top = 40
  end
  object cdsMovimento: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 664
    Top = 32
  end
  object cdsContaContabil: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 208
    Top = 144
  end
  object cdsPlano: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 369
    Top = 123
  end
  object cdsParamCAF: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 160
    Top = 101
  end
  object cdsTestaC: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 544
    Top = 104
  end
  object MSCentroCusto: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Centro de Custo'
    Colunas.Strings = (
      'CENTCUST.CODCENTROCUSTO'
      'CENTCUST.NOME'
      'CENTCUST.CODREDUZIDO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código Centro de Custo'
      'Descrição'
      'Código Reduzido')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CENTCUST')
    CamposChave.Strings = (
      'CENTCUST.CODCENTROCUSTO'
      'CENTCUST.IDEMPRESA'
      'CENTCUST.NOME')
    Filtro.Strings = (
      'CENTCUST.STATUSGRUPOCDC = '#39'A'#39
      'CENTCUST.ATIVO = '#39'S'#39)
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '30'
      '3')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      '')
    Left = 464
    Top = 112
  end
  object cdsCentroCusto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 624
    Top = 117
  end
  object dsCentroCusto: TwwDataSource
    AutoEdit = False
    DataSet = cdsCentroCusto
    Left = 624
    Top = 104
  end
  object cdsParamGlobal: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 160
    Top = 104
  end
  object cdsVerExistParam: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 225
    Top = 52
  end
  object sqlVerExistParam: TCMSqlParams
    SQL.Strings = (
      'SELECT TMG.IDPESSOA, TMG.IDGRUPO, TMG.IDTIPOMOVIMENTACAO, '
      'TMG.IDTIPODESPESA'
      'FROM TIPOSMOVIMENTOGRUPOS TMG'
      'WHERE (TMG.IDPESSOA = :IDPESSOA)'
      '  AND (TMG.IDGRUPO = :IDGRUPO)'
      '  AND (TMG.IDTIPOMOVIMENTACAO = :IDTIPOMOVIMENTACAO)'
      '  AND (TMG.IDTIPODESPESA = :IDTIPODESPESA)'
      '')
    ClientDataSet = cdsVerExistParam
    Left = 226
    Top = 38
  end
  object cdsTipoDespesaAV: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 672
    Top = 88
  end
end
