inherited frmMTCadParamCAFxContab: TfrmMTCadParamCAFxContab
  Left = 23
  Top = 92
  Caption = 'Parametrização Contábil'
  ClientHeight = 427
  ClientWidth = 730
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Top = 34
    Width = 730
    Height = 354
    inherited pnlMestre: TPanel
      Width = 720
      Height = 59
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
          'DESCTIPOMOVIMENTACAO'#9'40'#9'Descrição')
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
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 64
      Width = 720
      Height = 285
      Tabs.Strings = (
        'Contas Contábeis')
      inherited pgctrlDetalhe: TPageControl
        Width = 622
        Height = 226
        inherited tbsDet: TTabSheet
          Caption = 'Contas Contábeis'
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 614
            Height = 198
            Selected.Strings = (
              'PLANO'#9'10'#9'Plano de Contas'#9'F'
              'PLACONTA'#9'18'#9'Conta Contábil'#9'F'
              'PLANOME'#9'42'#9'Descrição'#9'F'
              'TIPOLANCAMENTO'#9'1'#9'Lançamento'#9'F')
            Font.Height = -13
            ParentFont = False
            UseTFields = False
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 614
            Height = 198
            object Label2: TLabel
              Left = 8
              Top = 48
              Width = 88
              Height = 13
              Caption = 'Plano de Conta'
            end
            object Label1: TLabel
              Left = 8
              Top = 104
              Width = 84
              Height = 13
              Caption = 'Conta Contábil'
            end
            object spdContaContabil: TSpeedButton
              Left = 160
              Top = 120
              Width = 24
              Height = 22
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
              Top = 104
              Width = 58
              Height = 13
              Caption = 'Descrição'
            end
            object dbTipoLanc: TDBRadioGroup
              Left = 8
              Top = 0
              Width = 175
              Height = 41
              Caption = 'Lançamento à'
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
              Left = 8
              Top = 64
              Width = 599
              Height = 21
              Enabled = False
              TabOrder = 1
            end
            object dbeContaContabil: TwwDBEdit
              Left = 8
              Top = 120
              Width = 153
              Height = 21
              DataField = 'PLACONTA'
              DataSource = dsDet
              TabOrder = 2
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
              OnExit = dbeContaContabilExit
            end
            object edPlaNome: TEdit
              Left = 192
              Top = 120
              Width = 414
              Height = 21
              TabOrder = 4
            end
            object treeContaContabil: TCMTreeViewMT
              Left = 188
              Top = 1
              Width = 426
              Height = 212
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
      inherited Dock973: TDock97
        Width = 712
      end
      inherited Dock974: TDock97
        Left = 626
        Height = 226
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
    Top = 388
    Width = 730
    inherited tb97Fundo: TToolbar97
      Left = 560
      DockPos = 621
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 393
      DockPos = 454
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 672
    Top = 496
    TargetsData = (
      1
      1
      (
        ''
        'Items'
        0))
  end
  inherited ds: TwwDataSource
    Left = 552
    Top = 0
  end
  inherited ImlPadrao: TImageList
    Left = 736
    Top = 496
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 392
    Top = 0
  end
  inherited Cds: TCMClientDataSet
    Left = 520
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'GRUPO.CLASSE'
      'GRUPO.NOME'
      'TIPOMOVIMENTACAO.DESCTIPOMOVIMENTACAO'
      'TIPOMOVIMENTACAO.IDTIPOMOVIMENTACAO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Código do Grupo'
      'Nome do Grupo'
      'Descrição da Movimentação'
      'Código da Movimentação')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'GRUPO'
      'TIPOMOVIMENTACAO'
      'TIPOSMOVIMENTOGRUPOS')
    CamposChave.Strings = (
      'TIPOSMOVIMENTOGRUPOS.IDPESSOA'
      'TIPOSMOVIMENTOGRUPOS.IDGRUPO'
      'TIPOSMOVIMENTOGRUPOS.IDTIPOMOVIMENTACAO')
    Filtro.Strings = (
      'GRUPO.IDGRUPO = TIPOSMOVIMENTOGRUPOS.IDGRUPO'
      
        'TIPOMOVIMENTACAO.IDTIPOMOVIMENTACAO = TIPOSMOVIMENTOGRUPOS.IDTIP' +
        'OMOVIMENTACAO')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '15'
      '30'
      '40'
      '10')
    Left = 608
    Top = 0
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 464
    Top = 0
  end
  inherited dsDet: TwwDataSource
    DataSet = cdsDet
    Left = 336
    Top = 286
  end
  object dsContaContabil: TwwDataSource
    DataSet = cdsContaContabil
    Left = 536
    Top = 296
  end
  object cdsDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    AfterScroll = cdsDetAfterScroll
    Left = 336
    Top = 272
  end
  object cdsGrupo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 280
    Top = 40
  end
  object cdsMovimento: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 632
    Top = 40
  end
  object cdsContaContabil: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 537
    Top = 282
  end
  object cdsPlano: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 537
    Top = 268
  end
  object cdsParamCAF: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 600
    Top = 112
  end
  object cdsTestaC: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 432
    Top = 272
  end
end
