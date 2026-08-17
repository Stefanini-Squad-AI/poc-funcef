inherited frmCadAgenteIntregracao: TfrmCadAgenteIntregracao
  Left = 452
  Top = 35
  Caption = 'Cadastro de Agente de Integração'
  ClientWidth = 871
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 871
    inherited tbcDetalhe: TTabControlDetalhe
      Width = 869
      Tabs.Strings = (
        'Documentação'
        'Endereços'
        'Telefones'
        'Contatos')
      inherited pgctrlDetalhe: TPageControl
        Width = 771
        inherited tbsDocumento: TTabSheet
          inherited PgCtrlPesFisica_Padrao: TPageControl
            Width = 763
          end
          inherited PnlDocumentos_Padrao: TPanel
            Width = 763
            inherited pnlFoto: TPanel
              Width = 273
              inherited PnlAssociaFoto_Padrao: TPanel
                Width = 273
              end
              inherited SbImagePessoa_Padrao: TScrollBox
                Width = 271
              end
            end
          end
        end
        inherited tbsDet: TTabSheet
          inherited dbgrdDet: TwwDBGrid
            Width = 763
          end
          inherited pnlControlesDet: TPanel
            Width = 763
            inherited lblPdLogradouro: TLabel
              Left = 148
            end
            inherited lblPdEstado: TLabel
              Left = 363
            end
            inherited lblPdNumero: TLabel
              Left = 602
            end
            inherited lblPdCEP: TLabel
              Left = 552
            end
            inherited lblBairro: TLabel
              Left = 333
            end
            inherited lblPdPais: TLabel
              Left = 601
              Top = 130
            end
            object lblCodMunicipio: TLabel [9]
              Left = 231
              Top = 130
              Width = 118
              Height = 13
              Caption = 'Código do Município'
            end
            object lblUF: TLabel [10]
              Left = 523
              Top = 130
              Width = 17
              Height = 13
              Caption = 'UF'
            end
            object lblTpLogradouro: TLabel [11]
              Left = 15
              Top = 44
              Width = 112
              Height = 13
              Caption = 'Tipo de Logradouro'
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
              Left = 363
              TabOrder = 8
            end
            inherited dbedBairro: TwwDBEdit
              Left = 332
              Width = 210
              TabOrder = 5
            end
            inherited DBNUMERO: TDBEdit
              Left = 602
              TabOrder = 3
              OnKeyPress = DBEDNUMEROKeyPress
            end
            inherited dbedCEP: TwwDBEdit
              Left = 552
              Width = 119
              TabOrder = 6
              OnKeyPress = DBEDNUMEROKeyPress
            end
            inherited dbedPais: TwwDBEdit
              Left = 601
              TabOrder = 10
            end
            inherited grpTipoEnd: TGroupBox
              Left = 566
              TabOrder = 11
            end
            object dbedCodMunicipio: TwwDBEdit
              Left = 231
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
            object dbedUF: TwwDBEdit
              Left = 523
              Top = 148
              Width = 69
              Height = 21
              TabStop = False
              Color = clBtnFace
              DataField = 'CODESTADO'
              DataSource = dsEndereco
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
              LookupTable = CdsTpLogradouro
              LookupField = 'IDTIPO_LOGRADOURO'
              Style = csDropDownList
              TabOrder = 1
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
            end
          end
        end
        inherited tbsTelefone: TTabSheet
          inherited SplContatos_Padrao: TSplitter
            Left = 534
          end
          inherited dbgTelefone: TwwDBGrid
            Width = 534
          end
          inherited Panel1: TPanel
            Width = 534
            inherited DBEDDDI: TDBEdit
              OnKeyPress = DBEDNUMEROKeyPress
            end
            inherited DBEDDDD: TDBEdit
              OnKeyPress = DBEDNUMEROKeyPress
            end
            inherited DBEDNUMERO: TwwDBEdit
              OnKeyPress = DBEDNUMEROKeyPress
            end
          end
          inherited PnlContatol_Padrao: TPanel
            Left = 537
          end
        end
        inherited tbsContato: TTabSheet
          inherited SplTelefones_Padrao: TSplitter
            Left = 561
          end
          inherited Panel2: TPanel
            Width = 561
          end
          inherited dbgContato: TwwDBGrid
            Width = 561
          end
          inherited PnlTelefones_Padrao: TPanel
            Left = 564
            inherited GrdTelefones_Padrao: TwwDBGrid
              Height = 331
            end
          end
        end
        inherited tbsDadosBancarios: TTabSheet
          inherited GrdContaBancaria_Padrao: TwwDBGrid
            Width = 763
          end
          inherited PnlDadosBancarios_Padrao: TPanel
            Width = 763
          end
        end
      end
      inherited Dock973: TDock97
        Width = 861
      end
      inherited Dock974: TDock97
        Left = 775
      end
    end
    inherited pnlMestre: TPanel
      Width = 869
    end
  end
  inherited Dock972: TDock97
    Width = 871
  end
  inherited Dock971: TDock97
    Width = 871
    inherited tb97Fundo: TToolbar97
      Left = 610
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 730112
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 441
    end
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Agente de Integração'
    Colunas.Strings = (
      'PESSOA.NOME'
      'PESSOA.NUMDOCUMENTO')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Nome do Agente'
      'CNPJ')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'AGENTEINT AI')
    CamposChave.Strings = (
      'PESSOA.IDPESSOA')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = AI.IDPESSOA')
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
  inherited MsCidades: TMontaSelect
    Caption = ''
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
  object CdsTpLogradouro: TCMClientDataSet [44]
    Aggregates = <>
    Params = <>
    Left = 329
    Top = 432
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
