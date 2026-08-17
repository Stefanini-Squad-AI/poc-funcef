inherited FrmMtCadCustAgregado: TFrmMtCadCustAgregado
  Left = 73
  Top = 68
  HelpContext = 50059
  Caption = 'Cadastro de Custos Agregados'
  ClientHeight = 433
  ClientWidth = 668
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 668
    Height = 347
    inherited pnlMestre: TPanel
      Width = 666
      Height = 147
      object Label1: TLabel
        Left = 16
        Top = 8
        Width = 58
        Height = 13
        Caption = 'Descrição'
        FocusControl = edDesc
      end
      object Label2: TLabel
        Left = 16
        Top = 48
        Width = 102
        Height = 13
        Caption = 'Tratamento Fiscal'
      end
      object edDesc: TDBEdit
        Left = 16
        Top = 24
        Width = 332
        Height = 21
        DataField = 'DESCCUSTAGREG'
        DataSource = ds
        TabOrder = 0
      end
      object dbrgrpPercValor: TDBRadioGroup
        Left = 16
        Top = 88
        Width = 177
        Height = 41
        Caption = ' Valor a informar '
        Columns = 2
        DataField = 'PERCVALOR'
        DataSource = ds
        Items.Strings = (
          'Percentual'
          'Valor')
        TabOrder = 1
        Values.Strings = (
          'P'
          'V')
      end
      object dblkpcmbTratFiscE: TwwDBLookupCombo
        Left = 16
        Top = 64
        Width = 333
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCTRATFISC'#9'50'#9'Desrição'
          'CODTRATFISC'#9'1'#9'Código')
        DataField = 'CODTRATFISCE'
        DataSource = ds
        LookupTable = cdsTratFisc
        LookupField = 'CODTRATFISC'
        Options = [loColLines, loTitles]
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        OnCloseUp = dblkpcmbTratFiscECloseUp
      end
      object dbrgrpTotalItem: TDBRadioGroup
        Left = 200
        Top = 88
        Width = 150
        Height = 41
        Caption = ' Aplicar Imposto a '
        Columns = 2
        DataField = 'TOTALITEM'
        DataSource = ds
        Items.Strings = (
          'Nota'
          'Item')
        TabOrder = 3
        Values.Strings = (
          'T'
          'I')
      end
      object GrpIncide: TGroupBox
        Left = 360
        Top = 8
        Width = 281
        Height = 121
        TabOrder = 4
        object chkBase: TDBCheckBox
          Left = 16
          Top = 94
          Width = 201
          Height = 17
          Caption = 'Incide sobre a base de Cáculo'
          DataField = 'FLGBASE'
          DataSource = ds
          TabOrder = 4
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object dbchkReceb: TDBCheckBox
          Left = 16
          Top = 14
          Width = 178
          Height = 17
          Caption = 'Incide no Recebimento'
          DataField = 'FLGINCIDERECEB'
          DataSource = ds
          TabOrder = 0
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object dbchkCompra: TDBCheckBox
          Left = 16
          Top = 34
          Width = 178
          Height = 17
          Caption = 'Incide na Compra '
          DataField = 'FLGINCIDECOMPRA'
          DataSource = ds
          TabOrder = 1
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object dbchkNFCompl: TDBCheckBox
          Left = 16
          Top = 54
          Width = 187
          Height = 17
          Caption = 'Incide na Nota Complementar '
          DataField = 'FLGINCIDENFCOMPL'
          DataSource = ds
          TabOrder = 2
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object DBCHKTOTAL: TDBCheckBox
          Left = 16
          Top = 74
          Width = 187
          Height = 17
          Caption = 'Checa Valor Total '
          DataField = 'FLGCHECATOTAL'
          DataSource = ds
          TabOrder = 3
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 148
      Width = 666
      Height = 198
      Tabs.Strings = (
        'Contabilização')
      inherited pgctrlDetalhe: TPageControl
        Width = 568
        Height = 139
        inherited tbsDet: TTabSheet
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 560
            Height = 111
            Selected.Strings = (
              'PLACONTA'#9'18'#9'Conta'#9'F'
              'CODSUBCONTA'#9'10'#9'Sub Conta'#9'F'
              'CENTCUST'#9'30'#9'Centro de Custo'#9'F'
              'DESUNIDNEGOC'#9'25'#9'Atividade/Projeto'#9'F')
            UseTFields = False
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 560
            Height = 111
            object LbSubConta: TLabel
              Left = 8
              Top = 80
              Width = 60
              Height = 13
              Caption = 'Sub Conta'
            end
            object LbUn: TLabel
              Left = 296
              Top = 8
              Width = 100
              Height = 13
              Caption = 'Atividade/Projeto'
            end
            object LbCCusto: TLabel
              Left = 296
              Top = 56
              Width = 92
              Height = 13
              Caption = 'Centro de Custo'
            end
            object cmpConta: TCMProcuraMaskContabil
              Left = 8
              Top = 8
              Width = 273
              Height = 71
              Caption = ' Conta Contábil '
              TabOrder = 0
              MostraMensagens = True
              MostraDescricao = True
              DataSource = dsDet
              DataField = 'PLACONTA'
              Mensagens.EmBranco = 'Conta não pode estar em branco'
              Mensagens.NaoExiste = 'Conta não existe'
              Mensagens.Sintetica = 'Conta não pode ser sintética'
              Mensagens.Analitica = 'Conta não pode ser analítica'
              PermiteChaveInvalida = False
              PermiteChaveEmBranco = False
              AceitaTipoConta = SoAnalitica
              Plano = 0
              Status = scSoAtiva
            end
            object DblkSubConta: TwwDBLookupCombo
              Left = 8
              Top = 96
              Width = 236
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMESUBCONTA'#9'30'#9'Nome da Sub-Conta'
                'CODSUBCONTA'#9'10'#9'Código')
              DataField = 'CODSUBCONTA'
              DataSource = dsDet
              LookupTable = CdsSubConta
              LookupField = 'CODSUBCONTA'
              Options = [loTitles]
              TabOrder = 1
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
            end
            object dblcUN: TwwDBLookupCombo
              Left = 296
              Top = 24
              Width = 249
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'25'#9'Descrição'
                'UNIDNEGOC'#9'10'#9'Código')
              DataField = 'UNIDNEGOC'
              DataSource = dsDet
              LookupTable = CdsUnidNegoc
              LookupField = 'UNIDNEGOC'
              Options = [loTitles]
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
              ShowMatchText = True
            end
            object dblcCCusto: TwwDBLookupCombo
              Left = 296
              Top = 72
              Width = 249
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'30'#9'Descrição'
                'CODCENTROCUSTO'#9'10'#9'Código')
              DataField = 'CODCENTROCUSTO'
              DataSource = dsDet
              LookupTable = CdsCCusto
              LookupField = 'CODCENTROCUSTO'
              Options = [loTitles]
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 658
      end
      inherited Dock974: TDock97
        Left = 572
        Height = 139
      end
    end
  end
  inherited Dock972: TDock97
    Width = 668
  end
  inherited Dock971: TDock97
    Top = 394
    Width = 668
    inherited tb97Fundo: TToolbar97
      Left = 496
      DockPos = 551
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 50059
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 327
      DockPos = 382
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 762
    Top = 65535
  end
  inherited ds: TwwDataSource
    Left = 390
    Top = 3
  end
  inherited ImlPadrao: TImageList
    Left = 744
    Top = 65531
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 264
    Top = 3
  end
  inherited Cds: TCMClientDataSet
    Left = 332
    Top = 3
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TIPOAGRE.DESCCUSTAGREG')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição')
    Tabelas.Strings = (
      'TIPOAGRE')
    CamposChave.Strings = (
      'TIPOAGRE.CODTIPOCUSTAGREG')
    Filtro.Strings = (
      'CODTRATFISCE in ('#39'1'#39','#39'2'#39','#39'3'#39','#39'4'#39','#39'5'#39','#39'6'#39','#39'7'#39') ')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '25')
    Left = 564
    Top = 4
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 132
    Top = 218
  end
  inherited dsDet: TwwDataSource
    DataSet = cdsDet
    Left = 198
    Top = 218
  end
  object cdsDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 258
    Top = 219
  end
  object spTratFisc: TCMSqlParams
    SQL.Strings = (
      'SELECT CODTRATFISC,DESCTRATFISC'
      'FROM TRATFISC'
      'WHERE  ( CODTRATFISC in ('#39'1'#39','#39'2'#39','#39'3'#39','#39'4'#39','#39'5'#39','#39'6'#39','#39'7'#39') )'
      'ORDER BY CODTRATFISC'
      ' '
      ' ')
    ClientDataSet = cdsTratFisc
    Left = 365
    Top = 180
  end
  object cdsTratFisc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 365
    Top = 156
  end
  object CdsCCusto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 437
    Top = 180
  end
  object CdsUnidNegoc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 493
    Top = 180
  end
  object CdsSubConta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 573
    Top = 188
  end
  object cdsParamGlobal: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 501
    Top = 85
  end
end
