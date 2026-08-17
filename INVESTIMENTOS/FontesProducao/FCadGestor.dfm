inherited frmCadGestor: TfrmCadGestor
  Left = 4
  Top = 53
  HelpContext = 790100
  Caption = 'Gestor de carteira'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited tbcDetalhe: TTabControlDetalhe
      Tabs.Strings = (
        'Documentação'
        'Endereços'
        'Telefones'
        'Contatos'
        'Subcontas')
      detdbGrids.Strings = (
        ''
        'dbGrdDet'
        'dbgTelefone'
        'dbgContato'
        '')
      inherited pgctrlDetalhe: TPageControl
        ActivePage = tbsSubConta
        TabOrder = 2
        inherited tbsDocumento: TTabSheet
          inherited PnlDocumentos_Padrao: TPanel
            inherited pnlItemsDoc: TPanel
              inherited pnlNomeDoc: TPanel
                Caption = 'pnlNomeDoc'
              end
              inherited pnlOrgao: TPanel
                Caption = 'pnlOrgao'
              end
              inherited pnlEmissao: TPanel
                Caption = 'pnlEmissao'
              end
            end
            inherited pnlFoto: TPanel
              Visible = False
            end
          end
        end
        inherited tbsDet: TTabSheet
          inherited pnlControlesDet: TPanel
            Caption = 'pnlControlesDet'
          end
        end
        inherited tbsTelefone: TTabSheet
          inherited Panel1: TPanel
            Caption = 'Panel1'
          end
        end
        inherited tbsContato: TTabSheet
          inherited dbgContato: TwwDBGrid [0]
          end
          inherited Panel2: TPanel [1]
            Caption = 'Panel2'
          end
        end
        object tbsSubConta: TTabSheet
          Caption = 'Subcontas'
          ImageIndex = 4
          object Panel3: TPanel
            Left = 0
            Top = 0
            Width = 696
            Height = 251
            Align = alClient
            Caption = #39
            TabOrder = 0
            object lblSubContaD: TLabel
              Left = 14
              Top = 5
              Width = 107
              Height = 13
              Caption = 'Subconta à Débito'
            end
            object lblSubContaC: TLabel
              Left = 14
              Top = 51
              Width = 110
              Height = 13
              Caption = 'Subconta à Crédito'
            end
            object dblkSubContaD: TwwDBLookupCombo
              Left = 14
              Top = 20
              Width = 354
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMESUBCONTA'#9'60'#9'Sub-Conta à Débito'#9'F')
              DataField = 'SUBCONTAD'
              DataSource = dsSubTipo
              LookupTable = qrySubConta
              LookupField = 'CODSUBCONTA'
              Options = [loColLines, loRowLines, loTitles]
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object dblkSubContaC: TwwDBLookupCombo
              Left = 14
              Top = 65
              Width = 354
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMESUBCONTA'#9'60'#9'Sub-Conta à Crédito'#9'F')
              DataField = 'SUBCONTAC'
              DataSource = dsSubTipo
              LookupTable = qrySubConta
              LookupField = 'CODSUBCONTA'
              Options = [loColLines, loRowLines, loTitles]
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
          end
        end
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
  inherited ivTradutor: TIvExtendedTranslator
    Left = 17
    Top = 6
  end
  inherited dsDet: TwwDataSource
    Left = 647
    Top = 323
  end
  inherited ds: TwwDataSource
    Left = 500
    Top = 55
  end
  inherited upd: TUpdateSQL
    Left = 553
    Top = 55
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'RAZAOSOCIAL')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Razão Social')
    Tabelas.Strings = (
      'GESTORCARTEIRA'
      'PESSOA')
    CamposChave.Strings = (
      'IDGESTORCARTEIRA')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    Left = 360
  end
  inherited ImlPadrao: TImageList
    Left = 721
    Top = 0
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 606
    Top = 2
  end
  inherited qry: TwwQuery
    Left = 437
    Top = 55
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 548
    Top = 2
  end
  inherited updSubTipo: TUpdateSQL
    ModifySQL.Strings = (
      'update GESTORCARTEIRA'
      'set'
      '  IDGESTORCARTEIRA = :IDGESTORCARTEIRA,'
      '  SUBCONTAD = :SUBCONTAD,'
      '  SUBCONTAC = :SUBCONTAC'
      'where'
      '  IDGESTORCARTEIRA = :OLD_IDGESTORCARTEIRA')
    InsertSQL.Strings = (
      'insert into GESTORCARTEIRA'
      '  (IDGESTORCARTEIRA, SUBCONTAD, SUBCONTAC)'
      'values'
      '  (:IDGESTORCARTEIRA, :SUBCONTAD, :SUBCONTAC)')
    DeleteSQL.Strings = (
      'delete from GESTORCARTEIRA'
      'where'
      '  IDGESTORCARTEIRA = :OLD_IDGESTORCARTEIRA')
    Left = 337
    Top = 304
  end
  inherited qrySubTipo: TwwQuery
    SQL.Strings = (
      'SELECT       G.IDGESTORCARTEIRA,G.SUBCONTAD,G.SUBCONTAC'
      ''
      'FROM          GESTORCARTEIRA G'
      ''
      'WHERE ( G.IDGESTORCARTEIRA =:IdPessoa )'
      ' ')
    Left = 193
    Top = 304
  end
  inherited dsSubTipo: TwwDataSource
    Left = 265
    Top = 304
  end
  inherited dsPessoaFisica: TwwDataSource
    Left = 505
    Top = 154
  end
  inherited updPessoaFisica: TUpdateSQL
    Left = 569
    Top = 154
  end
  inherited qryPessoaFisica: TwwQuery
    Left = 441
    Top = 154
  end
  inherited ImageList1: TImageList
    Left = 312
    Top = 0
  end
  inherited qryTelefone: TwwQuery
    Left = 193
    Top = 409
  end
  inherited updTelefone: TUpdateSQL
    Left = 337
    Top = 409
  end
  inherited dsTelefone: TwwDataSource
    Left = 265
    Top = 409
  end
  inherited dsEndereco: TwwDataSource
    Left = 265
    Top = 104
  end
  inherited updEndereco: TUpdateSQL
    Left = 337
    Top = 104
  end
  inherited qryEndereco: TwwQuery
    Left = 193
    Top = 104
  end
  inherited qryContato: TwwQuery
    Left = 438
    Top = 104
  end
  inherited updContato: TUpdateSQL
    Left = 561
    Top = 104
  end
  inherited dsContato: TwwDataSource
    Left = 505
    Top = 104
  end
  inherited qryRamal: TwwQuery
    Left = 193
    Top = 355
  end
  inherited updRamal: TUpdateSQL
    Left = 337
    Top = 355
  end
  inherited dsRamal: TwwDataSource
    Left = 265
    Top = 355
  end
  inherited qryDocumento: TwwQuery
    Left = 193
    Top = 258
  end
  inherited dsDocumento: TwwDataSource
    Left = 265
    Top = 258
  end
  inherited updDocumento: TUpdateSQL
    Left = 337
    Top = 258
  end
  inherited qryEscolhePessoa: TwwQuery
    Left = 53
    Top = 258
  end
  inherited dsEscolhePessoa: TwwDataSource
    Left = 285
  end
  inherited Pessoa: TPessoa
    TipoPessoa = tpOpcional
    SubTipo = stGestorCarteira
    MostraFoto = False
    Left = 669
  end
  inherited OpenPictureDialog1: TOpenPictureDialog
    Left = 254
    Top = 0
  end
  inherited qryImagem: TwwQuery
    Left = 193
    Top = 154
  end
  inherited updImagem: TUpdateSQL
    Left = 337
    Top = 154
  end
  inherited updImagensDoc: TUpdateSQL
    Left = 337
    Top = 207
  end
  inherited qryImagensDoc: TwwQuery
    Left = 193
    Top = 207
  end
  inherited dsImagem: TwwDataSource
    Left = 265
    Top = 154
  end
  inherited dsImagensDoc: TwwDataSource
    Left = 265
    Top = 207
  end
  inherited qryTipoDoc: TwwQuery
    Left = 53
    Top = 304
  end
  inherited MSGrupo: TMontaSelect
    Left = 417
    Top = 5
  end
  inherited qryEstado: TwwQuery
    Left = 53
    Top = 104
  end
  inherited qryCidade: TwwQuery
    Left = 193
    Top = 55
  end
  inherited dsCidade: TwwDataSource
    Left = 265
    Top = 55
  end
  inherited qryNaturalidade_Padrao: TwwQuery
    Left = 441
    Top = 207
  end
  inherited DsNaturalidade_Padrao: TwwDataSource
    Left = 513
    Top = 207
  end
  object qryAux: TwwQuery
    DatabaseName = 'basedados'
    ValidateWithMask = True
    Left = 53
    Top = 55
  end
  object qrySubConta: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT   '
      '       CODSUBCONTA,'
      '       NOMESUBCONTA'
      'FROM'
      '       SUBCONTA')
    ValidateWithMask = True
    Left = 53
    Top = 207
    object qrySubContaNOMESUBCONTA: TStringField
      DisplayLabel = 'Sub-Conta à Crédito'
      DisplayWidth = 60
      FieldName = 'NOMESUBCONTA'
      Origin = 'BASEDADOS.SUBCONTA.NOMESUBCONTA'
      Size = 60
    end
    object qrySubContaCODSUBCONTA: TFloatField
      DisplayWidth = 10
      FieldName = 'CODSUBCONTA'
      Origin = 'BASEDADOS.SUBCONTA.CODSUBCONTA'
      Visible = False
    end
  end
  object QryBuscaStrSubConta: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT   '
      '       CODSUBCONTA,'
      '       NOMESUBCONTA'
      'FROM'
      '       SUBCONTA'
      'WHERE'
      '       NOMESUBCONTA = :NOMESUBCONTA')
    ValidateWithMask = True
    Left = 53
    Top = 154
    ParamData = <
      item
        DataType = ftString
        Name = 'NOMESUBCONTA'
        ParamType = ptUnknown
      end>
    object QryBuscaStrSubContaNOMESUBCONTA: TStringField
      FieldName = 'NOMESUBCONTA'
      Origin = 'BASEDADOS.SUBCONTA.NOMESUBCONTA'
      Size = 60
    end
    object QryBuscaStrSubContaCODSUBCONTA: TFloatField
      FieldName = 'CODSUBCONTA'
      Origin = 'BASEDADOS.SUBCONTA.CODSUBCONTA'
    end
  end
  object QryInsSubConta: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO SUBCONTA'
      '(CODSUBCONTA,IDPESSOA,NOMESUBCONTA)'
      'VALUES'
      '(:CODSUBCONTA,:IDPESSOA,:NOMESUBCONTA)')
    ValidateWithMask = True
    Left = 643
    Top = 256
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODSUBCONTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'NOMESUBCONTA'
        ParamType = ptUnknown
      end>
  end
end
