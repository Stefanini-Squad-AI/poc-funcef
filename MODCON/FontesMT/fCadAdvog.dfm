inherited frmCadAdvog: TfrmCadAdvog
  Left = 40
  Top = 316
  Caption = 'Cadastro de Advogados, Assistentes Técnicos e Peritos'
  ClientHeight = 454
  WindowState = wsNormal
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 368
    inherited tbcDetalhe: TTabControlDetalhe
      Height = 261
      Tabs.Strings = (
        'Documentação'
        'Endereços'
        'Telefones'
        'Contatos'
        'Contas Bancárias'
        'Honorário Fixo')
      inherited pgctrlDetalhe: TPageControl
        Height = 202
        inherited tbsDocumento: TTabSheet
          inherited PgCtrlPesFisica_Padrao: TPageControl
            Height = 174
          end
          inherited PnlDocumentos_Padrao: TPanel
            Height = 174
            inherited pnlItemsDoc: TPanel
              Height = 172
            end
            inherited pnlFoto: TPanel
              Height = 172
              Visible = False
              inherited BvlImagem: TBevel
                Height = 141
              end
              inherited PnlAssociaFoto_Padrao: TPanel
                Top = 141
              end
              inherited SbImagePessoa_Padrao: TScrollBox
                Height = 141
              end
            end
            inherited lstDocumentos: TListView
              Height = 172
            end
          end
        end
        inherited tbsDet: TTabSheet
          inherited pnlControlesDet: TPanel
            Height = 174
            inherited grpTipoEnd: TGroupBox
              Height = 174
            end
          end
          inherited dbgrdDet: TwwDBGrid
            Height = 174
          end
        end
        inherited tbsTelefone: TTabSheet
          inherited SplContatos_Padrao: TSplitter
            Height = 174
          end
          inherited Panel1: TPanel
            Height = 174
          end
          inherited dbgTelefone: TwwDBGrid
            Height = 174
          end
          inherited PnlContatol_Padrao: TPanel
            Height = 174
          end
        end
        inherited tbsContato: TTabSheet
          inherited SplTelefones_Padrao: TSplitter
            Height = 174
          end
          inherited Panel2: TPanel
            Height = 174
          end
          inherited dbgContato: TwwDBGrid
            Height = 174
          end
          inherited PnlTelefones_Padrao: TPanel
            Height = 174
          end
        end
        inherited tbsDadosBancarios: TTabSheet
          inherited PnlDadosBancarios_Padrao: TPanel
            Height = 174
          end
          inherited GrdContaBancaria_Padrao: TwwDBGrid
            Height = 174
          end
        end
        object tbsHonor: TTabSheet
          Caption = 'Honorário Fixo'
          ImageIndex = 5
          object Label2: TLabel
            Left = 12
            Top = 72
            Width = 287
            Height = 13
            Caption = 'Fator Multiplicador da Tabela de Honorários Fixos:'
          end
          object Label3: TLabel
            Left = 418
            Top = 72
            Width = 202
            Height = 13
            Caption = '(Zero Significa Sem Honorário Fixo)'
          end
          object dbedFator: TDBRealEdit
            Left = 302
            Top = 69
            Width = 101
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0,0000')
            TabOrder = 0
            WordWrap = False
            IntDigits = 6
            DecDigits = 4
            NumberFormat = fNumber
            Signal = False
            DataField = 'FATORHONORADVOG'
            DataSource = dsSubTipo
          end
        end
      end
      inherited Dock974: TDock97
        Height = 202
      end
    end
    inherited pnlMestre: TPanel
      inherited lblDocumento: TLabel
        Width = 26
        Caption = 'CGC'
      end
      inherited lblPdGrupo: TLabel
        Width = 63
        Caption = 'Pertence a'
      end
    end
  end
  inherited Dock972: TDock97
    inherited Toolbar971: TToolbar97
      inherited sbtnFisJur: TToolbarButton97
        Visible = True
      end
    end
  end
  inherited Dock971: TDock97
    Top = 415
    inherited tb97Fundo: TToolbar97
      Left = 620
      DockPos = 633
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 451
      DockPos = 464
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 741
    Top = 1
  end
  inherited ds: TwwDataSource
    Left = 372
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 741
    Top = 14
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 535
    Top = 1
  end
  inherited Cds: TCMClientDataSet
    Left = 344
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Advogado, Assistente Técnico ou Perito'
    Colunas.Strings = (
      'PESSOA.NOME'
      'ADVOGADO.IDPESSOA')
    TipodeDado.Strings = (
      'C'
      'N')
    Descricao.Strings = (
      'Nome '
      'Código ')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'ADVOGADO')
    CamposChave.Strings = (
      'ADVOGADO.IDPESSOA')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = ADVOGADO.IDPESSOA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '60'
      '22')
    Left = 671
    Top = 1
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 535
    Top = 15
  end
  inherited dsDet: TwwDataSource
    Left = 403
    Top = 1
  end
  inherited dsSubTipo: TwwDataSource
    Left = 452
    Top = 1
  end
  inherited dsPessoaFisica: TwwDataSource
    Left = 726
    Top = 363
  end
  inherited ImlDocumentos: TImageList
    Left = 741
    Top = 26
  end
  inherited dsTelefone: TwwDataSource
    Left = 165
    Top = 411
  end
  inherited dsEndereco: TwwDataSource
    Left = 96
    Top = 411
  end
  inherited dsContato: TwwDataSource
    Left = 229
    Top = 411
  end
  inherited dsTelContato: TwwDataSource
    Left = 295
    Top = 412
  end
  inherited dsDocumento: TwwDataSource
    Left = 23
    Top = 412
  end
  inherited dsEscolhePessoa: TwwDataSource
    Left = 725
    Top = 251
  end
  inherited dsImagem: TwwDataSource
    Left = 540
    Top = 410
  end
  inherited dsImagensDoc: TwwDataSource
    Left = 375
    Top = 412
  end
  inherited MSGrupo: TMontaSelect
    Caption = 'Seleciona Escritório'
    Tabelas.Strings = (
      'PESSOA'
      'ADVOGADO')
    Filtro.Strings = (
      'PESSOA.TIPO = '#39'J'#39
      'PESSOA.IDPESSOA = ADVOGADO.IDPESSOA')
    Larguras.Strings = (
      '40'
      '60')
    Left = 671
    Top = 14
  end
  inherited DsNaturalidade: TwwDataSource
    Left = 725
    Top = 307
  end
  inherited CdsDocumento: TCMClientDataSet
    Left = 23
    Top = 425
  end
  inherited CdsTipoDoc: TCMClientDataSet
    Left = 728
    Top = 166
  end
  inherited CdsEndereco: TCMClientDataSet
    Left = 96
    Top = 425
  end
  inherited CdsTelefone: TCMClientDataSet
    Left = 165
    Top = 425
  end
  inherited CdsContato: TCMClientDataSet
    Left = 229
    Top = 425
  end
  inherited CdsTelContato: TCMClientDataSet
    Left = 295
    Top = 425
  end
  inherited CdsImagem: TCMClientDataSet
    Left = 540
    Top = 424
  end
  inherited CdsEscolhePessoa: TCMClientDataSet
    Left = 725
    Top = 264
  end
  inherited CdsImagensDoc: TCMClientDataSet
    Left = 375
    Top = 425
  end
  inherited CdsSubTipo: TCMClientDataSet
    Left = 452
    Top = 13
  end
  inherited CdsPessoaFisica: TCMClientDataSet
    Left = 726
    Top = 377
  end
  inherited CdsCidade: TCMClientDataSet
    Left = 728
    Top = 181
  end
  inherited CdsNaturalidade: TCMClientDataSet
    Left = 725
    Top = 321
  end
  inherited CdsEstado: TCMClientDataSet
    Left = 728
    Top = 195
  end
  inherited MsCidades: TMontaSelect
    Left = 671
    Top = 27
  end
  inherited DsContaBancaria: TwwDataSource
    Left = 463
    Top = 412
  end
  inherited CdsContaBancaria: TCMClientDataSet
    Left = 462
    Top = 425
  end
  inherited MsBanco: TMontaSelect
    Left = 671
    Top = 39
  end
  inherited CdsBanco: TCMClientDataSet
    Left = 728
    Top = 208
  end
  inherited ppmCaixa: TPopupMenu
    Left = 741
    Top = 38
  end
  object qryTipoDoc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT TIPODOCPESSOA.IDDOCUMENTO , '
      ' TIPODOCPESSOA.NOMEDOCUMENTO , '
      ' TIPODOCPESSOA.IDREGRA , '
      ' TIPODOCPESSOA.FISICAJURIDICA , '
      ' TIPODOCPESSOA.MASCARA , '
      ' TIPODOCPESSOA.DOCCHAVE , '
      ' TIPODOCPESSOA.OBRIGAUF , '
      ' TIPODOCPESSOA.OBRIGAORGAO , '
      ' TIPODOCPESSOA.OBRIGAEMISSAO,'
      ' TIPODOCPESSOA.FLGOBRIGAVALIDADE'
      'FROM TIPODOCPESSOA'
      'WHERE '
      '   ( TIPODOCPESSOA.FISICAJURIDICA =:IdFisicaJuridica ) OR'
      '   ( TIPODOCPESSOA.FISICAJURIDICA = '#39'A'#39')')
    ValidateWithMask = True
    Left = 657
    Top = 161
    ParamData = <
      item
        DataType = ftString
        Name = 'IdFisicaJuridica'
        ParamType = ptUnknown
      end>
    object qryTipoDocIDDOCUMENTO: TFloatField
      FieldName = 'IDDOCUMENTO'
      Origin = 'BASEDADOS.TIPODOCPESSOA.IDDOCUMENTO'
    end
    object qryTipoDocNOMEDOCUMENTO: TStringField
      FieldName = 'NOMEDOCUMENTO'
      Origin = 'BASEDADOS.TIPODOCPESSOA.NOMEDOCUMENTO'
      Size = 30
    end
    object qryTipoDocIDREGRA: TFloatField
      FieldName = 'IDREGRA'
      Origin = 'BASEDADOS.TIPODOCPESSOA.IDREGRA'
    end
    object qryTipoDocFISICAJURIDICA: TStringField
      FieldName = 'FISICAJURIDICA'
      Origin = 'BASEDADOS.TIPODOCPESSOA.FISICAJURIDICA'
      FixedChar = True
      Size = 1
    end
    object qryTipoDocMASCARA: TStringField
      FieldName = 'MASCARA'
      Origin = 'BASEDADOS.TIPODOCPESSOA.MASCARA'
      FixedChar = True
      Size = 30
    end
    object qryTipoDocDOCCHAVE: TStringField
      FieldName = 'DOCCHAVE'
      Origin = 'BASEDADOS.TIPODOCPESSOA.DOCCHAVE'
      FixedChar = True
      Size = 1
    end
    object qryTipoDocOBRIGAUF: TStringField
      FieldName = 'OBRIGAUF'
      Origin = 'BASEDADOS.TIPODOCPESSOA.OBRIGAUF'
      FixedChar = True
      Size = 1
    end
    object qryTipoDocOBRIGAORGAO: TStringField
      FieldName = 'OBRIGAORGAO'
      Origin = 'BASEDADOS.TIPODOCPESSOA.OBRIGAORGAO'
      FixedChar = True
      Size = 1
    end
    object qryTipoDocOBRIGAEMISSAO: TStringField
      FieldName = 'OBRIGAEMISSAO'
      Origin = 'BASEDADOS.TIPODOCPESSOA.OBRIGAEMISSAO'
      FixedChar = True
      Size = 1
    end
    object qryTipoDocFLGOBRIGAVALIDADE: TStringField
      FieldName = 'FLGOBRIGAVALIDADE'
      Origin = 'BASEDADOS.TIPODOCPESSOA.FLGOBRIGAVALIDADE'
      FixedChar = True
      Size = 1
    end
  end
end
