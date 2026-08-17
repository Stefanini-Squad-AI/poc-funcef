inherited frmCadContJurid: TfrmCadContJurid
  Left = 62
  Top = 98
  HelpContext = 1100011
  Caption = 'Critérios de Contabilização do Sistema Jurídico'
  ClientHeight = 596
  ClientWidth = 661
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 661
    Height = 510
    BorderWidth = 2
    inherited pnlMestre: TPanel
      Left = 2
      Top = 2
      Width = 657
      Height = 35
      object Label2: TLabel
        Left = 10
        Top = 11
        Width = 152
        Height = 13
        Caption = 'Tipo de Objeto Reclamado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbedDescricao: TwwDBEdit
        Left = 167
        Top = 8
        Width = 477
        Height = 21
        TabStop = False
        Color = clGray
        DataField = 'DESCRICAO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Left = 2
      Top = 37
      Width = 657
      Height = 471
      Tabs.Strings = (
        'Contas Contábeis e Demais Parametrizações')
      inherited pgctrlDetalhe: TPageControl
        Width = 559
        Height = 412
        inherited tbsDet: TTabSheet
          Caption = 'tbsDet'
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 551
            Height = 384
            Selected.Strings = (
              'CONTADEBITO'#9'19'#9'Conta a Débito'
              'CONTACREDITO'#9'20'#9'Conta a Crédito'
              'MATERIA'#9'23'#9'         Matéria'#9'F')
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgWordWrap]
            ParentFont = False
            UseTFields = False
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 551
            Height = 384
            object CMProcuraMaskContabilCredito: TCMProcuraMaskContabil
              Left = 8
              Top = 3
              Width = 265
              Height = 100
              Caption = 'Conta Contábil a Crédito'
              TabOrder = 0
              MostraMensagens = True
              MostraDescricao = True
              DataSource = dsDet
              DataField = 'CONTACREDITO'
              Mensagens.EmBranco = 'Chave não pode estar em branco'
              Mensagens.NaoExiste = 'Chave não existe'
              Mensagens.Sintetica = 'Chave não pode ser sintética'
              Mensagens.Analitica = 'Chave não pode ser analítica'
              PermiteChaveInvalida = False
              PermiteChaveEmBranco = True
              AceitaTipoConta = SoAnalitica
              Plano = 0
              Status = scSoAtiva
            end
            object CMProcuraMaskContabilDebito: TCMProcuraMaskContabil
              Left = 8
              Top = 113
              Width = 265
              Height = 100
              Caption = 'Conta Contábil a Débito'
              TabOrder = 1
              MostraMensagens = True
              MostraDescricao = True
              DataSource = dsDet
              DataField = 'CONTADEBITO'
              Mensagens.EmBranco = 'Chave não pode estar em branco'
              Mensagens.NaoExiste = 'Chave não existe'
              Mensagens.Sintetica = 'Chave não pode ser sintética'
              Mensagens.Analitica = 'Chave não pode ser analítica'
              PermiteChaveInvalida = False
              PermiteChaveEmBranco = True
              AceitaTipoConta = SoAnalitica
              Plano = 0
              Status = scSoAtiva
            end
            object dbrgIndPrincipal: TDBRadioGroup
              Left = 282
              Top = 3
              Width = 257
              Height = 100
              Caption = 'Aplica-se a'
              DataField = 'INDPRINCIPAL'
              DataSource = dsDet
              Items.Strings = (
                'Principal'
                'Correção Monetária'
                'Juros')
              TabOrder = 2
              Values.Strings = (
                '0'
                '1'
                '2')
            end
            object dbrgMateria: TDBRadioGroup
              Left = 282
              Top = 113
              Width = 257
              Height = 100
              Caption = 'Matéria'
              Columns = 2
              DataField = 'INDMATERIA'
              DataSource = dsDet
              Items.Strings = (
                'Qualquer'
                'Trabalhista'
                'Previdenciária'
                'Prev./Trabalhista'
                'Civil'
                'Comercial'
                'Tributária'
                'Penal')
              TabOrder = 3
              Values.Strings = (
                '0'
                '1'
                '2'
                '3'
                '4'
                '5'
                '6'
                '7')
            end
            object gbxTipoProc: TGroupBox
              Left = 8
              Top = 220
              Width = 265
              Height = 105
              Caption = 'Tipos de Processo'
              TabOrder = 4
              object Label1: TLabel
                Left = 8
                Top = 21
                Width = 17
                Height = 13
                Caption = 'De'
              end
              object Label3: TLabel
                Left = 8
                Top = 63
                Width = 27
                Height = 13
                Caption = 'Para'
              end
              object dblckTipProc: TwwDBLookupCombo
                Left = 8
                Top = 33
                Width = 250
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOMETIPOPROC'#9'60'#9'Tipo de Processo')
                DataField = 'IDTIPOPROC_DE'
                DataSource = dsDet
                LookupTable = CdsTipoProc
                LookupField = 'IDTIPOPROC'
                Style = csDropDownList
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                UseTFields = False
                AllowClearKey = True
              end
              object wwDBLookupCombo1: TwwDBLookupCombo
                Left = 8
                Top = 75
                Width = 250
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOMETIPOPROC'#9'60'#9'Tipo de Processo')
                DataField = 'IDTIPOPROC_PARA'
                DataSource = dsDet
                LookupTable = CdsTipoProc
                LookupField = 'IDTIPOPROC'
                Style = csDropDownList
                TabOrder = 1
                AutoDropDown = True
                ShowButton = True
                UseTFields = False
                AllowClearKey = True
              end
            end
            object dbrgUsaPadrao: TDBRadioGroup
              Left = 282
              Top = 220
              Width = 257
              Height = 45
              Caption = 'Usa Plano/Patro Padrão ?'
              Columns = 2
              DataField = 'FLGUSAPADRAO'
              DataSource = dsDet
              Items.Strings = (
                'Sim'
                'Não')
              TabOrder = 5
              Values.Strings = (
                '1'
                '0')
            end
            object gbxCentroCusto: TGroupBox
              Left = 282
              Top = 272
              Width = 257
              Height = 53
              Caption = 'Centro de Custo (opcional)'
              TabOrder = 6
              object dblckCCusto: TwwDBLookupCombo
                Left = 7
                Top = 20
                Width = 242
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOME'#9'30'#9'NOME'#9'F')
                DataField = 'CODCENTROCUSTO'
                DataSource = dsDet
                LookupTable = CdsCCusto
                LookupField = 'CODCENTROCUSTO'
                Style = csDropDownList
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                UseTFields = False
                AllowClearKey = True
              end
            end
            object dbrgTipoOper: TDBRadioGroup
              Left = 8
              Top = 332
              Width = 531
              Height = 45
              Caption = 'Tipo de Operação no Processo'
              Columns = 4
              DataField = 'INDOPERACAO'
              DataSource = dsDet
              Items.Strings = (
                'Qualquer'
                'Inserção'
                'Alteração'
                'Encerramento')
              TabOrder = 7
              Values.Strings = (
                '0'
                '1'
                '2'
                '3')
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 649
      end
      inherited Dock974: TDock97
        Left = 563
        Height = 412
      end
    end
  end
  inherited Dock972: TDock97
    Width = 661
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 557
    Width = 661
    inherited tb97Fundo: TToolbar97
      Left = 490
      DockPos = 582
      inherited sep1: TToolbarSep97
        SizeHorz = 2
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 322
      DockPos = 414
      inherited ToolbarSep971: TToolbarSep97
        SizeHorz = 2
      end
      inherited bbtnCancelar: TBitBtn
        Left = 83
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 516
    Top = 1
  end
  inherited ds: TwwDataSource
    Left = 270
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 459
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyEdit = CmeCadastroApplyEdit
    Left = 606
    Top = 14
  end
  inherited Cds: TCMClientDataSet
    Left = 242
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Tipo de Objeto Reclamado'
    Colunas.Strings = (
      'TIPOOBJPROCTRAB.CODTIPOOBJETO'
      'TIPOOBJPROCTRAB.DESCRICAO')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição')
    Tabelas.Strings = (
      'TIPOOBJPROCTRAB')
    CamposChave.Strings = (
      'TIPOOBJPROCTRAB.CODTIPOOBJETO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '20'
      '50')
    Left = 395
    Top = 1
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 606
    Top = 1
  end
  inherited dsDet: TwwDataSource
    DataSet = CdsDet
    OnStateChange = dsDetStateChange
    Left = 343
    Top = 1
  end
  object CdsDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    BeforePost = CdsDetBeforePost
    Left = 308
    Top = 1
  end
  object CdsTipoProc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 258
    Top = 384
  end
  object CdsCCusto: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'CdsCCustoIndex'
        CaseInsFields = 'NOME'
        Fields = 'NOME'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'CdsCCustoIndex'
    Params = <>
    StoreDefs = True
    Left = 530
    Top = 433
  end
end
