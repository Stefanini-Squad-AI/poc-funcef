inherited frmCadSindi: TfrmCadSindi
  Left = 0
  Top = 46
  Caption = 'Cadastro de Sindicatos'
  ClientWidth = 793
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 793
    inherited tbcDetalhe: TTabControlDetalhe
      Width = 783
      Tabs.Strings = (
        'Documentação'
        'Endereços'
        'Telefones'
        'Contatos'
        'Contas Bancárias'
        'Dados do Sindicato'
        'Alíquotas')
      detdbGrids.Strings = (
        ''
        'dbGrdDet'
        'dbgTelefone'
        'dbgContato'
        'GrdContaBancaria_Padrao'
        ''
        'dbgAliquotas')
      inherited pgctrlDetalhe: TPageControl
        Width = 685
        ActivePage = tbsSindi
        inherited tbsDocumento: TTabSheet
          Caption = 'tbsDocumento'
          inherited PgCtrlPesFisica_Padrao: TPageControl
            Width = 677
          end
          inherited PnlDocumentos_Padrao: TPanel
            Width = 677
            inherited pnlFoto: TPanel
              Width = 187
              Visible = False
              inherited PnlAssociaFoto_Padrao: TPanel
                Width = 187
              end
              inherited SbImagePessoa_Padrao: TScrollBox
                Width = 185
              end
            end
          end
        end
        inherited tbsDet: TTabSheet
          Caption = 'tbsDet'
          inherited pnlControlesDet: TPanel
            Width = 677
            inherited grpTipoEnd: TGroupBox
              Left = 480
            end
          end
          inherited dbgrdDet: TwwDBGrid
            Width = 677
          end
        end
        inherited tbsTelefone: TTabSheet
          Caption = 'tbsTelefone'
          inherited SplContatos_Padrao: TSplitter
            Left = 448
          end
          inherited Panel1: TPanel
            Width = 448
          end
          inherited dbgTelefone: TwwDBGrid
            Width = 448
          end
          inherited PnlContatol_Padrao: TPanel
            Left = 451
          end
        end
        inherited tbsContato: TTabSheet
          Caption = 'tbsContato'
          inherited SplTelefones_Padrao: TSplitter
            Left = 475
          end
          inherited Panel2: TPanel
            Width = 475
          end
          inherited dbgContato: TwwDBGrid
            Width = 475
          end
          inherited PnlTelefones_Padrao: TPanel
            Left = 478
          end
        end
        inherited tbsDadosBancarios: TTabSheet
          Caption = 'tbsDadosBancarios'
          inherited PnlDadosBancarios_Padrao: TPanel
            Width = 677
          end
          inherited GrdContaBancaria_Padrao: TwwDBGrid
            Width = 677
          end
        end
        object tbsSindi: TTabSheet
          Caption = 'tbsSindi'
          ImageIndex = 4
          object Label2: TLabel
            Left = 125
            Top = 15
            Width = 132
            Height = 13
            Caption = 'Mês Base da Categoria'
          end
          object Label13: TLabel
            Left = 125
            Top = 81
            Width = 174
            Height = 13
            Caption = 'Registro Ministério doTrabalho'
          end
          object Label15: TLabel
            Left = 125
            Top = 114
            Width = 186
            Height = 13
            Caption = 'Mês da Contribuição Empresarial'
          end
          object Label17: TLabel
            Left = 125
            Top = 147
            Width = 198
            Height = 13
            Caption = 'Índice da Contribuição Empresarial'
          end
          object Label3: TLabel
            Left = 125
            Top = 48
            Width = 147
            Height = 13
            Caption = 'Piso Salarial da Categoria'
          end
          object speMes: TwwDBSpinEdit
            Left = 335
            Top = 12
            Width = 50
            Height = 21
            Increment = 1
            MaxValue = 12
            MinValue = 1
            DataField = 'MESBASE'
            DataSource = dsSubTipo
            TabOrder = 0
            UnboundDataType = wwDefault
            OnChange = speMesChange
          end
          object dbedMT: TwwDBEdit
            Left = 335
            Top = 78
            Width = 166
            Height = 21
            DataField = 'REGISTROMT'
            DataSource = dsSubTipo
            TabOrder = 3
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object edNomeMes: TEdit
            Left = 392
            Top = 12
            Width = 109
            Height = 21
            TabStop = False
            Color = clGray
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 1
          end
          object speMesContr: TwwDBSpinEdit
            Left = 335
            Top = 111
            Width = 50
            Height = 21
            Increment = 1
            MaxValue = 12
            MinValue = 1
            DataField = 'MESCONTRIBUICAO'
            DataSource = dsSubTipo
            TabOrder = 4
            UnboundDataType = wwDefault
            OnChange = speMesContrChange
          end
          object edNomeMes2: TEdit
            Left = 392
            Top = 111
            Width = 109
            Height = 21
            TabStop = False
            Color = clGray
            Enabled = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 5
          end
          object wwDBLookupCombo1: TwwDBLookupCombo
            Left = 335
            Top = 144
            Width = 166
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'MOEDESC'#9'20'#9'MOEDESC')
            DataField = 'MOECODIGO'
            DataSource = dsSubTipo
            LookupTable = CdsMoeda
            LookupField = 'MOECODIGO'
            TabOrder = 6
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
          end
          object DBRealEdit1: TDBRealEdit
            Left = 335
            Top = 45
            Width = 166
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '      0,00')
            TabOrder = 2
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'PISOSALARIAL'
            DataSource = dsSubTipo
          end
        end
        object tbshAliquotas: TTabSheet
          Caption = 'tbshAliquotas'
          ImageIndex = 5
          object dbgAliquotas: TwwDBGrid
            Left = 0
            Top = 0
            Width = 677
            Height = 181
            Selected.Strings = (
              'IDFAIXAALIQSIND'#9'10'#9'Número da Faixa'
              'VALLIMITEFAIXA'#9'10'#9'Valor Limite da Faixa'
              'TAXADAFAIXA'#9'10'#9'Alíquota Desta Faixa')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsAliquota
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            IndicatorColor = icBlack
          end
        end
      end
      inherited Dock973: TDock97
        Width = 775
      end
      inherited Dock974: TDock97
        Left = 689
      end
    end
    inherited pnlMestre: TPanel
      Width = 783
    end
  end
  inherited Dock972: TDock97
    Width = 793
  end
  inherited Dock971: TDock97
    Width = 793
    inherited tb97Fundo: TToolbar97
      Left = 623
      DockPos = 631
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 456
      DockPos = 464
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 739
    Top = 1
  end
  inherited ds: TwwDataSource
    Left = 372
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 739
    Top = 14
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 517
    Top = 0
  end
  inherited Cds: TCMClientDataSet
    Left = 344
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Sindicato'
    Colunas.Strings = (
      'PESSOA.NOME'
      'SINDICATO.IDPESSOA')
    TipodeDado.Strings = (
      'C'
      'N')
    Descricao.Strings = (
      'Nome'
      'Código')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'SINDICATO')
    CamposChave.Strings = (
      'SINDICATO.IDPESSOA')
    Filtro.Strings = (
      'SINDICATO.IDPESSOA = PESSOA.IDPESSOA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '60'
      '22')
    Left = 666
    Top = 1
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 517
    Top = 13
  end
  inherited dsDet: TwwDataSource
    Left = 407
    Top = 1
  end
  inherited dsSubTipo: TwwDataSource
    Left = 453
    Top = 1
  end
  inherited dsPessoaFisica: TwwDataSource
    Left = 729
    Top = 383
  end
  inherited ImlDocumentos: TImageList
    Left = 739
    Top = 26
  end
  inherited dsTelefone: TwwDataSource
    Left = 164
    Top = 411
  end
  inherited dsEndereco: TwwDataSource
    Left = 97
    Top = 411
  end
  inherited dsContato: TwwDataSource
    Left = 226
    Top = 410
  end
  inherited dsTelContato: TwwDataSource
    Left = 295
    Top = 411
  end
  inherited dsDocumento: TwwDataSource
    Left = 24
    Top = 411
  end
  inherited dsEscolhePessoa: TwwDataSource
    Left = 727
    Top = 269
  end
  inherited dsImagem: TwwDataSource
    Left = 540
    Top = 410
  end
  inherited dsImagensDoc: TwwDataSource
    Left = 374
    Top = 411
  end
  inherited MSGrupo: TMontaSelect
    Left = 666
    Top = 14
  end
  inherited DsNaturalidade: TwwDataSource
    Left = 729
    Top = 324
  end
  inherited CdsDocumento: TCMClientDataSet
    Left = 24
    Top = 425
  end
  inherited CdsTipoDoc: TCMClientDataSet
    Left = 729
    Top = 181
  end
  inherited CdsEndereco: TCMClientDataSet
    Left = 97
    Top = 424
  end
  inherited CdsTelefone: TCMClientDataSet
    Left = 164
    Top = 424
  end
  inherited CdsContato: TCMClientDataSet
    Left = 226
    Top = 424
  end
  inherited CdsTelContato: TCMClientDataSet
    Left = 295
    Top = 424
  end
  inherited CdsImagem: TCMClientDataSet
    Left = 540
    Top = 423
  end
  inherited CdsEscolhePessoa: TCMClientDataSet
    Left = 727
    Top = 282
  end
  inherited CdsImagensDoc: TCMClientDataSet
    Left = 374
    Top = 424
  end
  inherited CdsSubTipo: TCMClientDataSet
    AfterScroll = CdsSubTipoAfterScroll
    Left = 453
    Top = 15
  end
  inherited CdsPessoaFisica: TCMClientDataSet
    Left = 729
    Top = 396
  end
  inherited CdsCidade: TCMClientDataSet
    Left = 729
    Top = 195
  end
  inherited CdsNaturalidade: TCMClientDataSet
    Left = 729
    Top = 337
  end
  inherited CdsEstado: TCMClientDataSet
    Left = 729
    Top = 209
  end
  inherited MsCidades: TMontaSelect
    Left = 666
    Top = 26
  end
  inherited DsContaBancaria: TwwDataSource
    Left = 464
    Top = 409
  end
  inherited CdsContaBancaria: TCMClientDataSet
    Left = 464
    Top = 423
  end
  inherited MsBanco: TMontaSelect
    Left = 666
    Top = 39
  end
  inherited CdsBanco: TCMClientDataSet
    Left = 729
    Top = 222
  end
  inherited ppmCaixa: TPopupMenu
    Left = 739
    Top = 39
  end
  object dsAliquota: TwwDataSource
    DataSet = CdsAliquota
    Left = 635
    Top = 305
  end
  object CdsAliquota: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    AfterInsert = CdsAliquotaAfterInsert
    Left = 635
    Top = 318
  end
  object CdsMoeda: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 640
    Top = 257
  end
end
