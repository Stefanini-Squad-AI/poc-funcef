inherited frmCadAlteradoresMT: TfrmCadAlteradoresMT
  Left = 404
  Top = 184
  Caption = 'Cadastro de Alteradores'
  ClientHeight = 451
  ClientWidth = 394
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 394
    Height = 365
    object Label2: TLabel
      Left = 8
      Top = 8
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object dbedDescricao: TDBEdit
      Left = 8
      Top = 22
      Width = 195
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = ds
      TabOrder = 0
    end
    object dbrdConverte: TDBRadioGroup
      Left = 213
      Top = 5
      Width = 171
      Height = 40
      Caption = 'Converte para outra moeda'
      Columns = 2
      DataField = 'CONVERTE'
      DataSource = ds
      Items.Strings = (
        'Sim'
        'Não')
      TabOrder = 1
      Values.Strings = (
        'S'
        'N')
    end
    object pnAcresDecres: TPanel
      Left = 8
      Top = 53
      Width = 375
      Height = 28
      BevelOuter = bvLowered
      TabOrder = 2
      object sbtnAcrescimo: TSpeedButton
        Left = 15
        Top = 3
        Width = 145
        Height = 21
        GroupIndex = 1
        Down = True
        Caption = '&Acréscimo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          DE000000424DDE0000000000000076000000280000000D0000000D0000000100
          0400000000006800000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7000777777777777700077770000077770007777066607777000777706660777
          7000777706660777700070000666000070007706666666077000777066666077
          7000777706660777700077777060777770007777770777777000777777777777
          7000}
        ParentFont = False
        OnClick = sbtnAcrescimoClick
      end
      object sbtnDecrescimo: TSpeedButton
        Left = 213
        Top = 3
        Width = 145
        Height = 21
        GroupIndex = 1
        Caption = '&Decréscimo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          DE000000424DDE0000000000000076000000280000000D0000000D0000000100
          0400000000006800000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7000777777777777700077777707777770007777706077777000777706660777
          7000777066666077700077066666660770007000066600007000777706660777
          7000777706660777700077770666077770007777000007777000777777777777
          7000}
        ParentFont = False
        OnClick = sbtnDecrescimoClick
      end
    end
    object PageControl: TPageControl
      Left = 8
      Top = 80
      Width = 374
      Height = 279
      ActivePage = tabCalc
      TabOrder = 3
      object tabContas: TTabSheet
        Caption = 'Contas/Subcontas'
        object PnlContab: TPanel
          Left = 1
          Top = 0
          Width = 365
          Height = 233
          BevelOuter = bvNone
          TabOrder = 0
          object Label20: TLabel
            Left = 8
            Top = 66
            Width = 55
            Height = 13
            Caption = 'Subconta'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label3: TLabel
            Left = 8
            Top = 106
            Width = 92
            Height = 13
            Caption = 'Centro de Custo'
          end
          object Label1: TLabel
            Left = 8
            Top = 146
            Width = 111
            Height = 13
            Caption = 'Natureza Operação'
          end
          object Label4: TLabel
            Left = 8
            Top = 186
            Width = 296
            Height = 13
            Caption = 'Tipo de Desembolso utilizado na busca para o IRRF'
          end
          object CContabil: TCMProcuraMaskContabil
            Left = 8
            Top = 8
            Width = 346
            Height = 49
            Caption = ' Conta Contábil '
            TabOrder = 0
            OnExit = CContabilExit
            MostraMensagens = True
            MostraDescricao = True
            DataSource = ds
            DataField = 'PLACONTA'
            Mensagens.EmBranco = 'Conta Contábil não pode estar em branco'
            Mensagens.NaoExiste = 'Conta Contábil não existe'
            Mensagens.Sintetica = 'Conta Contábil não pode ser sintética'
            Mensagens.Analitica = 'Conta Contábil não pode ser analítica'
            PermiteChaveInvalida = False
            PermiteChaveEmBranco = False
            AceitaTipoConta = SoAnalitica
            Plano = 0
            Status = scSoAtiva
            OnApertouBotao = CContabilApertouBotao
          end
          object dblkSubconta: TwwDBLookupCombo
            Left = 8
            Top = 80
            Width = 347
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMESUBCONTA'#9'60'#9'Subconta')
            DataField = 'CODSUBCONTA'
            DataSource = ds
            LookupTable = CdsSUBCONTA
            LookupField = 'CODSUBCONTA'
            Style = csDropDownList
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object cmbCCusto: TwwDBLookupCombo
            Left = 8
            Top = 120
            Width = 348
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'30'#9'Descrição'
              'CODEXTERNO'#9'10'#9'Código'#9'F')
            DataField = 'CODCENTROCUSTO'
            DataSource = ds
            LookupTable = CdsCENTCUST
            LookupField = 'CODCENTROCUSTO'
            Options = [loTitles]
            TabOrder = 2
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object wwDBLookupCombo1: TwwDBLookupCombo
            Left = 8
            Top = 160
            Width = 348
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'60'#9'Descrição'#9'F')
            DataField = 'CODNATUREZA'
            DataSource = ds
            LookupTable = CdsNATURENDIMENTO
            LookupField = 'CODNATUREZA'
            TabOrder = 3
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object dblkTipoDesembolso: TwwDBLookupCombo
            Left = 8
            Top = 200
            Width = 348
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'60'#9'Descrição'#9'F')
            DataField = 'CODTIPRECDES'
            DataSource = ds
            LookupTable = CdsTipoDesembolso
            LookupField = 'CODTIPRECDES'
            TabOrder = 4
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
        end
        object ChkObrigaOrc: TDBCheckBox
          Left = 8
          Top = 230
          Width = 305
          Height = 17
          Caption = 'Indica a obrigação de FDO'
          DataField = 'FLGOBRIGARESERVA'
          DataSource = ds
          TabOrder = 1
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
      end
      object tabCalc: TTabSheet
        Caption = 'Cálculos'
        ImageIndex = 1
        object Label5: TLabel
          Left = 8
          Top = 144
          Width = 69
          Height = 13
          Caption = 'Observação'
        end
        object CkbCalcImposto: TDBCheckBox
          Left = 8
          Top = 8
          Width = 305
          Height = 17
          Caption = 'Calcular imposto sobre valor do alterador lançado'
          DataField = 'FLGCALCULAIMPOSTO'
          DataSource = ds
          TabOrder = 0
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object DBCkagregsaldo: TDBCheckBox
          Left = 8
          Top = 25
          Width = 315
          Height = 17
          Caption = 'Agregar o valor no saldo para emissão de relatórios'
          DataField = 'FLGAGREGASALDO'
          DataSource = ds
          TabOrder = 1
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object DBCheckBox1: TDBCheckBox
          Left = 8
          Top = 42
          Width = 287
          Height = 17
          Caption = 'Agregar o valor do alterador ao valor da baixa'
          DataField = 'FLGAGREGABAIXA'
          DataSource = ds
          TabOrder = 2
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object CkbUsaCentroCustoDoc: TDBCheckBox
          Left = 8
          Top = 76
          Width = 286
          Height = 17
          Caption = 'Usa Centro de Custo do Rateio do Documento'
          DataField = 'FLGUSACCUSTODOC'
          DataSource = ds
          TabOrder = 3
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object CkbContabilizaAlteradorNaBaixa: TDBCheckBox
          Left = 8
          Top = 59
          Width = 281
          Height = 17
          Caption = 'Contabiliza Alterador na Baixa do Documento'
          DataField = 'FLGCONTABNABAIXA'
          DataSource = ds
          TabOrder = 4
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object CkbIncideIrrf: TDBCheckBox
          Left = 8
          Top = 93
          Width = 168
          Height = 17
          Caption = 'Incide Imposto de Renda'
          DataField = 'FLGINCIDEIRRF'
          DataSource = ds
          TabOrder = 5
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object dbmmObs: TDBMemo
          Left = 8
          Top = 158
          Width = 345
          Height = 87
          DataField = 'OBSERVACAO'
          DataSource = ds
          TabOrder = 8
        end
        object ckbFLGLANCANFS: TDBCheckBox
          Left = 8
          Top = 110
          Width = 355
          Height = 17
          Caption = 'Indicar dados de Nota Fiscal de Serviço'
          DataField = 'FLGLANCANFS'
          DataSource = ds
          TabOrder = 6
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object dbchkFLGVALORBASE: TDBCheckBox
          Left = 8
          Top = 127
          Width = 355
          Height = 17
          Caption = 'Indicar valor base de retenção de tributos'
          DataField = 'FLGVALORBASE'
          DataSource = ds
          TabOrder = 7
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 394
  end
  inherited Dock971: TDock97
    Top = 412
    Width = 394
    inherited tb97Fundo: TToolbar97
      Left = 222
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 53
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 984
    Top = 0
    TargetsData = (
      1
      1
      (
        'TDBMemo'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 272
    Top = 0
  end
  inherited ImlPadrao: TImageList
    Left = 928
    Top = 0
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 304
    Top = 16
  end
  inherited Cds: TCMClientDataSet
    Left = 240
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TIPOALTERADOR.DESCRICAO'
      'TIPOALTERADOR.ACRESDECRES')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Descrição'
      'Acres \ Decres')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'TIPOALTERADOR')
    CamposChave.Strings = (
      'TIPOALTERADOR.CODALTERADOR')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '35'
      '1')
    Left = 352
    Top = 0
  end
  object CdsSUBCONTA: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 184
    Top = 200
  end
  object CdsCENTCUST: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 300
    Top = 190
  end
  object CdsNATURENDIMENTO: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 120
    Top = 286
  end
  object CdsAux: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 256
    Top = 176
  end
  object CdsParamGlobal: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 168
    Top = 200
  end
  object CdsTipoDesembolso: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 272
    Top = 272
  end
end
