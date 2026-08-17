inherited frmCadPlanilRateioMT: TfrmCadPlanilRateioMT
  Left = 167
  Top = 33
  Caption = 'Cadastro de Planilhas de Rateio'
  ClientHeight = 421
  ClientWidth = 535
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 535
    Height = 335
    inherited pnlMestre: TPanel
      Width = 533
      Height = 60
      object lblPrePronta: TLabel
        Left = 16
        Top = 10
        Width = 184
        Height = 13
        Caption = 'Descrição da Planilha de Rateio'
      end
      object edDescRateio: TDBEdit
        Left = 16
        Top = 26
        Width = 321
        Height = 21
        DataField = 'PANDESCRICAO'
        DataSource = ds
        TabOrder = 0
      end
      object grpContaperc: TDBRadioGroup
        Left = 376
        Top = 8
        Width = 99
        Height = 49
        DataField = 'PANCONTAPERC'
        DataSource = ds
        Items.Strings = (
          'Conta'
          'Percentual')
        TabOrder = 1
        Values.Strings = (
          'C'
          'P')
        OnClick = grpContapercClick
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 61
      Width = 533
      Height = 273
      inherited pgctrlDetalhe: TPageControl
        Width = 435
        Height = 214
        inherited tbsDet: TTabSheet
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 427
            Height = 186
            Selected.Strings = (
              'PLACONTA'#9'11'#9'Conta'#9'F'
              'PANCONTABASE'#9'11'#9'Conta Base'#9'F'
              'CODCENTROCUSTO'#9'10'#9'C.Custo'#9'F'
              'PANCCUSTOBASE'#9'10'#9'C.Custo Base'#9'F'
              'PANPERC'#9'6'#9'Perc.'#9'F')
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 427
            Height = 186
            object Label9: TLabel
              Left = 240
              Top = 10
              Width = 100
              Height = 13
              Caption = 'Atividade/Projeto'
            end
            object Label11: TLabel
              Left = 239
              Top = 60
              Width = 92
              Height = 13
              Caption = 'Centro de Custo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label12: TLabel
              Left = 241
              Top = 111
              Width = 124
              Height = 13
              Caption = 'Centro de Custo Base'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label5: TLabel
              Left = 106
              Top = 156
              Width = 103
              Height = 13
              Caption = 'Tipo de Operação'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label7: TLabel
              Left = 9
              Top = 156
              Width = 62
              Height = 13
              Caption = 'Percentual'
            end
            object Label2: TLabel
              Left = 9
              Top = 60
              Width = 60
              Height = 13
              Caption = 'Sub-Conta'
            end
            object mskAtivProj: TMaskEdit
              Left = 240
              Top = 24
              Width = 139
              Height = 21
              TabOrder = 0
              OnExit = mskAtivProjExit
            end
            object edtUnidNegoc: TEdit
              Left = 288
              Top = 24
              Width = 17
              Height = 21
              Color = clAqua
              TabOrder = 1
              Visible = False
            end
            object btnAtivProj: TBitBtn
              Left = 380
              Top = 24
              Width = 25
              Height = 21
              TabOrder = 2
              OnClick = btnAtivProjClick
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
            end
            object dblkCCustoBase: TwwDBLookupCombo
              Left = 240
              Top = 125
              Width = 165
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'30'#9'NOME')
              DataField = 'PANCCUSTOBASE'
              DataSource = dsDet
              LookupTable = CdsCentroCustoBase
              LookupField = 'CODCENTROCUSTO'
              Options = [loColLines]
              Style = csDropDownList
              DropDownWidth = 350
              ParentFont = False
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
            end
            object dblkTipoOper: TwwDBLookupCombo
              Left = 107
              Top = 170
              Width = 300
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              DropDownAlignment = taRightJustify
              Selected.Strings = (
                'TIPDESCRICAO'#9'25'#9'TIPDESCRICAO')
              DataField = 'TIPCODIGO'
              DataSource = dsDet
              LookupTable = CdsTipoOper
              LookupField = 'TIPCODIGO'
              ParentFont = False
              TabOrder = 4
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object dbePercent: TDBRealEdit
              Left = 9
              Top = 170
              Width = 73
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '      0,00')
              TabOrder = 5
              WordWrap = False
              IntDigits = 3
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'PANPERC'
              DataSource = dsDet
            end
            object cmpContaBase: TCMProcuraMaskContabil
              Left = 8
              Top = 104
              Width = 217
              Height = 48
              Caption = 'Conta Base'
              TabOrder = 6
              OnExit = cmpContaBaseExit
              MostraMensagens = True
              MostraDescricao = False
              DataSource = dsDet
              DataField = 'PANCONTABASE'
              Mensagens.EmBranco = 'Conta não pode estar em branco'
              Mensagens.NaoExiste = 'Conta não existe'
              Mensagens.Sintetica = 'Conta não pode ser sintética'
              Mensagens.Analitica = 'Conta não pode ser analítica'
              PermiteChaveInvalida = False
              PermiteChaveEmBranco = False
              AceitaTipoConta = Indiferente
              Plano = 0
              Status = scAmbas
            end
            object mskSubConta: TMaskEdit
              Left = 9
              Top = 74
              Width = 187
              Height = 21
              TabOrder = 7
              OnExit = mskSubContaExit
            end
            object cmpConta: TCMProcuraMaskContabil
              Left = 7
              Top = 6
              Width = 217
              Height = 48
              Caption = 'Conta'
              TabOrder = 8
              OnExit = cmpContaExit
              MostraMensagens = True
              MostraDescricao = False
              DataSource = dsDet
              DataField = 'PLACONTA'
              Mensagens.EmBranco = 'Conta não pode estar em branco'
              Mensagens.NaoExiste = 'Conta não existe'
              Mensagens.Sintetica = 'Conta não pode ser sintética'
              Mensagens.Analitica = 'Conta não pode ser analítica'
              PermiteChaveInvalida = False
              PermiteChaveEmBranco = False
              AceitaTipoConta = Indiferente
              Plano = 0
              Status = scAmbas
            end
            object dblkCCusto: TwwDBLookupCombo
              Left = 240
              Top = 74
              Width = 165
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'30'#9'NOME')
              DataField = 'CODCENTROCUSTO'
              DataSource = dsDet
              LookupTable = CdsCentroCusto
              LookupField = 'CODCENTROCUSTO'
              Options = [loColLines]
              Style = csDropDownList
              DropDownWidth = 350
              ParentFont = False
              TabOrder = 9
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
            end
            object btnSubConta: TBitBtn
              Left = 197
              Top = 74
              Width = 25
              Height = 21
              TabOrder = 10
              OnClick = btnSubContaClick
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
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 525
      end
      inherited Dock974: TDock97
        Left = 439
        Height = 214
        inherited tb97Detalhe: TToolbar97
          inherited bbtnCancelarDet: TBitBtn
            Tag = 999
          end
          inherited bbtnVoltarDet: TBitBtn
            Tag = 999
          end
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 535
  end
  inherited Dock971: TDock97
    Top = 382
    Width = 535
    inherited tb97Fundo: TToolbar97
      Left = 363
      inherited bbtnSair: TBitBtn
        Tag = 999
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        Tag = 999
      end
      inherited bbtnCancelar: TBitBtn
        Tag = 999
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 50
    Top = 431
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 350
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 8
    Top = 455
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 264
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Left = 316
    Top = 7
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PREPLANILHA.PANDESCRICAO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'PREPLANILHA')
    CamposChave.Strings = (
      'PREPLANILHA.PANCODIGO'
      'PREPLANILHA.PANIDENTIFICACAO')
    Filtro.Strings = (
      'PREPLANILHA.PANIDENTIFICACAO = '#39'R'#39)
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    Left = 400
    Top = 7
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 164
    Top = 146
  end
  inherited dsDet: TwwDataSource
    DataSet = CdsPreDetalhe
    Left = 222
    Top = 146
  end
  object CdsSubConta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 101
    Top = 247
  end
  object CdsTipoOper: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 242
    Top = 367
  end
  object CdsCentroCustoBase: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 357
    Top = 295
  end
  object CdsCentroCusto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 317
    Top = 247
  end
  object CdsAtivProj: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 325
    Top = 207
  end
  object MontaSelectAtivProj: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'UNIDNEGOCIO.UNECODIGO'
      'UNIDNEGOCIO.NOME')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Nome')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'UNIDNEGOCIO')
    CamposChave.Strings = (
      'UNIDNEGOCIO.UNECODIGO'
      'UNIDNEGOCIO.UNIDNEGOC')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '25')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 336
    Top = 112
  end
  object MontaSelectSubConta: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'SUBCONTA.CODSUBCONTA'
      'SUBCONTA.NOMESUBCONTA')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Código'
      'Nome da Sub-Conta')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'SUBCONTA')
    CamposChave.Strings = (
      'SUBCONTA.IDPESSOA'
      'SUBCONTA.CODSUBCONTA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 184
    Top = 112
  end
  object CdsPreDetalhe: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 274
    Top = 151
  end
end
