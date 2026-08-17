inherited frmCadInstituicaoEnsino: TfrmCadInstituicaoEnsino
  Left = 289
  Top = 67
  Caption = 'Cadastro de Instituição de Ensino'
  ClientWidth = 1021
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 1021
    inherited tbcDetalhe: TTabControlDetalhe
      Width = 1019
      Tabs.Strings = (
        'Documentação'
        'Endereços'
        'Telefones'
        'Contatos')
      inherited pgctrlDetalhe: TPageControl
        Width = 921
        inherited tbsDocumento: TTabSheet
          inherited PgCtrlPesFisica_Padrao: TPageControl
            Width = 913
          end
          inherited PnlDocumentos_Padrao: TPanel
            Width = 913
            inherited pnlFoto: TPanel
              Width = 423
              inherited PnlAssociaFoto_Padrao: TPanel
                Width = 423
              end
              inherited SbImagePessoa_Padrao: TScrollBox
                Width = 421
              end
            end
          end
        end
        inherited tbsDet: TTabSheet
          inherited dbgrdDet: TwwDBGrid
            Width = 913
          end
          inherited pnlControlesDet: TPanel
            Width = 913
            inherited lblPdLogradouro: TLabel
              Left = 147
            end
            inherited lblPdEstado: TLabel
              Left = 373
            end
            inherited lblPdNumero: TLabel
              Left = 602
            end
            inherited lblPdCEP: TLabel
              Left = 553
              Top = 88
            end
            inherited lblBairro: TLabel
              Left = 335
            end
            inherited lblPdPais: TLabel
              Left = 605
              Top = 128
            end
            object lblUF: TLabel [9]
              Left = 527
              Top = 128
              Width = 17
              Height = 13
              Caption = 'UF'
            end
            object lblTpLogradouro: TLabel [10]
              Left = 15
              Top = 44
              Width = 112
              Height = 13
              Caption = 'Tipo de Logradouro'
            end
            object lblCodMunicipio: TLabel [11]
              Left = 232
              Top = 130
              Width = 118
              Height = 13
              Caption = 'Código do Município'
            end
            inherited dbedNomeEndereco: TDBEdit
              Width = 659
            end
            inherited dbedLogradouro: TDBEdit
              Left = 147
              Width = 444
              TabOrder = 2
            end
            inherited DBEDCOMPLEMENTO: TwwDBEdit
              Width = 307
              TabOrder = 4
            end
            inherited dbedEstado: TwwDBEdit
              Left = 371
              Width = 146
              Enabled = False
              TabOrder = 8
            end
            inherited dbedBairro: TwwDBEdit
              Left = 334
              Width = 210
              TabOrder = 5
            end
            inherited DBNUMERO: TDBEdit
              Left = 602
              TabOrder = 3
              OnKeyPress = DBNUMEROKeyPress
            end
            inherited dbedCEP: TwwDBEdit
              Left = 554
              Width = 119
              TabOrder = 6
              OnKeyPress = DBNUMEROKeyPress
            end
            inherited dbedPais: TwwDBEdit
              Left = 605
              Enabled = False
              TabOrder = 10
            end
            inherited grpTipoEnd: TGroupBox
              Left = 716
              TabOrder = 11
            end
            object dbedUF: TwwDBEdit
              Left = 527
              Top = 148
              Width = 69
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'CODESTADO'
              DataSource = dsEndereco
              Enabled = False
              ReadOnly = True
              TabOrder = 9
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dblkpTpLogradouro: TwwDBLookupCombo
              Left = 16
              Top = 60
              Width = 121
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'15'#9'Nome')
              DataField = 'IDTIPO_LOGRADOURO'
              DataSource = dsEndereco
              LookupTable = cdsTpLogradouro
              LookupField = 'IDTIPO_LOGRADOURO'
              Style = csDropDownList
              TabOrder = 1
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
            end
            object dbedCodMunicipio: TwwDBEdit
              Left = 232
              Top = 148
              Width = 123
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'CODMUNICIPIO'
              DataSource = dsEndereco
              Enabled = False
              ReadOnly = True
              TabOrder = 7
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
          end
        end
        inherited tbsTelefone: TTabSheet
          inherited SplContatos_Padrao: TSplitter
            Left = 684
          end
          inherited dbgTelefone: TwwDBGrid
            Width = 684
          end
          inherited Panel1: TPanel
            Width = 684
            inherited DBEDDDI: TDBEdit
              OnKeyPress = DBNUMEROKeyPress
            end
            inherited DBEDDDD: TDBEdit
              OnKeyPress = DBNUMEROKeyPress
            end
            inherited DBEDNUMERO: TwwDBEdit
              OnKeyPress = DBNUMEROKeyPress
            end
          end
          inherited PnlContatol_Padrao: TPanel
            Left = 687
          end
        end
        inherited tbsContato: TTabSheet
          inherited SplTelefones_Padrao: TSplitter
            Left = 711
          end
          inherited dbgContato: TwwDBGrid [1]
            Width = 711
          end
          inherited Panel2: TPanel [2]
            Width = 711
          end
          inherited PnlTelefones_Padrao: TPanel
            Left = 714
            inherited GrdTelefones_Padrao: TwwDBGrid
              Height = 331
            end
          end
        end
        inherited tbsDadosBancarios: TTabSheet
          inherited GrdContaBancaria_Padrao: TwwDBGrid
            Width = 913
          end
          inherited PnlDadosBancarios_Padrao: TPanel
            Width = 913
          end
        end
      end
      inherited Dock973: TDock97
        Width = 1011
      end
      inherited Dock974: TDock97
        Left = 925
      end
    end
    inherited pnlMestre: TPanel
      Width = 1019
      inherited dbedRazaoSocial: TDBEdit
        TabOrder = 5
      end
    end
  end
  inherited Dock972: TDock97
    Width = 1021
  end
  inherited Dock971: TDock97
    Width = 1021
    inherited tb97Fundo: TToolbar97
      Left = 610
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 730113
        ClickHelpContext = 730002
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 441
    end
  end
  inherited CmeCadastro: TCmEventosCadastro
    Top = 35
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Instituição de Ensino'
    Colunas.Strings = (
      'PESSOA.NOME'
      'PESSOA.NUMDOCUMENTO')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Nome da Instituição'
      'CNPJ')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'INSTITUICAOENSINO IE')
    CamposChave.Strings = (
      'PESSOA.IDPESSOA')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = IE.IDPESSOA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '60'
      '18')
    OperComparador.Strings = (
      '-1'
      '-1')
    LookupSQL.Strings = (
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      '')
  end
  inherited CdsDocumento: TCMClientDataSet
    Left = 650
    Top = 407
  end
  inherited CdsTipoDoc: TCMClientDataSet
    Left = 633
    Top = 207
  end
  inherited CdsContato: TCMClientDataSet
    Left = 588
    Top = 215
  end
  inherited CdsEstado: TCMClientDataSet
    Left = 565
    Top = 191
  end
  inherited MsCidades: TMontaSelect
    Colunas.Strings = (
      'CIDADES.NOME'
      'ESTADO.CODESTADO'
      'ESTADO.NOMEESTADO'
      'PAIS.NOMEPAIS')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Cidade'
      'UF'
      'Nome Estado'
      'País')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '30'
      '3'
      '20'
      '20')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1')
    LookupSQL.Strings = (
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      '')
  end
  object cdsTpLogradouro: TCMClientDataSet [43]
    Aggregates = <>
    Params = <>
    Left = 312
    Top = 368
  end
  inherited CdsEndereco: TCMClientDataSet
    inherited CdsEnderecoTIPOLOGRADOURO: TStringField
      Visible = True
    end
    inherited CdsEnderecoCODMUNICIPIO: TStringField
      Visible = True
    end
    inherited CdsEnderecoCODESTADO: TStringField
      Visible = True
    end
  end
end
