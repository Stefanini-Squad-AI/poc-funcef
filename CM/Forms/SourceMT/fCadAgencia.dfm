inherited frmCadAgencia: TfrmCadAgencia
  Left = 8
  Top = 44
  HelpContext = 230057
  Caption = 'Cadastro de Agências'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited tbcDetalhe: TTabControlDetalhe
      Tabs.Strings = (
        'Documentação'
        'Endereços'
        'Telefones'
        'Contatos'
        'Contas Bancárias'
        'Dados da Agência')
      detdbGrids.Strings = (
        ''
        'dbGrdDet'
        'dbgTelefone'
        'dbgContato'
        'GrdContaBancaria_Padrao'
        ''
        '')
      inherited pgctrlDetalhe: TPageControl
        object TbsDadosAgencia: TTabSheet
          Caption = 'Dados da Agência'
          ImageIndex = 5
          object Bevel2: TBevel
            Left = 9
            Top = 94
            Width = 120
            Height = 32
          end
          object Label2: TLabel
            Left = 9
            Top = 5
            Width = 37
            Height = 13
            Caption = 'Banco'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label13: TLabel
            Left = 9
            Top = 46
            Width = 80
            Height = 13
            Caption = 'Num Agência:'
          end
          object Label3: TLabel
            Left = 134
            Top = 48
            Width = 135
            Height = 13
            Caption = 'Praça de Compensação'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DbLookupBancoAgencia: TwwDBLookupCombo
            Left = 9
            Top = 21
            Width = 280
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'60'#9'Nome'
              'NUMBANCO'#9'10'#9'Número')
            DataField = 'IDBANCO'
            DataSource = dsSubTipo
            LookupTable = CdsBancoSubTipo
            LookupField = 'IDPESSOA'
            Options = [loTitles]
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            OrderByDisplay = False
            AllowClearKey = True
            ShowMatchText = True
            OnCloseUp = DbLookupBancoAgenciaCloseUp
          end
          object dbedNumAgencia: TwwDBEdit
            Left = 9
            Top = 64
            Width = 120
            Height = 21
            DataField = 'NUMAGENCIA'
            DataSource = dsSubTipo
            TabOrder = 1
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object CkbAtivo: TDBCheckBox
            Left = 43
            Top = 101
            Width = 54
            Height = 17
            Caption = 'Ativo'
            DataField = 'FLGATIVO'
            DataSource = dsSubTipo
            TabOrder = 3
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object RgTipo: TDBRadioGroup
            Left = 135
            Top = 89
            Width = 155
            Height = 38
            Caption = ' Tipo '
            Columns = 2
            DataField = 'FLGTIPO'
            DataSource = dsSubTipo
            Items.Strings = (
              '&Interior'
              '&Capital')
            TabOrder = 4
            Values.Strings = (
              'I'
              'C')
          end
          object CmbPracaComp: TwwDBLookupCombo
            Left = 134
            Top = 64
            Width = 156
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'CODIGO'#9'6'#9'Número'#9'F'
              'DESCRICAO'#9'30'#9'Descrição'#9'F')
            DataField = 'IDPRACACOMP'
            DataSource = dsSubTipo
            LookupTable = CdsPracaComp
            LookupField = 'IDPRACACOMP'
            Options = [loTitles]
            TabOrder = 2
            AutoDropDown = True
            ShowButton = True
            OrderByDisplay = False
            UseTFields = False
            AllowClearKey = True
            ShowMatchText = True
            OnCloseUp = DbLookupBancoAgenciaCloseUp
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    inherited tb97Fundo: TToolbar97
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 230057
      end
    end
  end
  inherited CmeCadastro: TCmEventosCadastro
    Top = 43
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'AGENCIABANCARIA.NUMAGENCIA'
      'PESSOA.RAZAOSOCIAL'
      'AGENCIABANCARIA.IDPESSOA'
      'BANCO.NUMBANCO'
      'PESSBANCO.RAZAOSOCIAL'
      'AGENCIABANCARIA.FLGATIVO'
      'AGENCIABANCARIA.FLGTIPO')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nº da Agência'
      'Nome'
      'Identificador'
      'Nº Banco'
      'Nome do Banco'
      'Ativo'
      'Tipo da Agência')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'PESSOA PESSBANCO'
      'AGENCIABANCARIA'
      'BANCO')
    CamposChave.Strings = (
      'AGENCIABANCARIA.IDPESSOA')
    Filtro.Strings = (
      'AGENCIABANCARIA.IDPESSOA=PESSOA.IDPESSOA'
      'AGENCIABANCARIA.IDBANCO=BANCO.IDPESSOA'
      'PESSBANCO.IDPESSOA=BANCO.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '15'
      '60'
      '10'
      '10'
      '35'
      '1'
      '1')
    Left = 505
    Top = 1
  end
  object CdsBancoSubTipo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 258
    Top = 370
  end
  object SQLPracaComp: TCMSqlParams
    SQL.Strings = (
      
        'SELECT IDPRACACOMP, CODIGO, DESCRICAO FROM PRACACOMP ORDER BY CO' +
        'DIGO')
    ClientDataSet = CdsPracaComp
    Left = 437
    Top = 372
  end
  object CdsPracaComp: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 437
    Top = 316
  end
end
