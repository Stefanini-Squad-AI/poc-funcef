inherited frmCadOperacao: TfrmCadOperacao
  Left = 122
  Top = 33
  Caption = 'Cadastro de Operação Financeira'
  ClientHeight = 439
  ClientWidth = 496
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 496
    Height = 353
    inherited pnlMestre: TPanel
      Width = 494
      Height = 143
      object Label2: TLabel
        Left = 16
        Top = 6
        Width = 139
        Height = 13
        Caption = 'Descrição da Operação '
      end
      object dbedDescricao: TwwDBEdit
        Left = 16
        Top = 20
        Width = 457
        Height = 21
        DataField = 'DESCTIPOOPERACAO'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object GroupBox1: TGroupBox
        Left = 16
        Top = 48
        Width = 337
        Height = 86
        Caption = 'Nível de Integração'
        TabOrder = 1
        object DBchkGeraCAPCAR: TDBCheckBox
          Left = 32
          Top = 20
          Width = 297
          Height = 17
          Caption = 'Gerar documento de Contas a Pagar / Receber'
          DataField = 'FLGGERACAPCAR'
          DataSource = ds
          TabOrder = 0
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBchkGeraCAF: TDBCheckBox
          Left = 32
          Top = 40
          Width = 273
          Height = 17
          Caption = 'Agregar valor / contabilizar pelo Ativo Fixo'
          DataField = 'FLGGERACAF'
          DataSource = ds
          TabOrder = 1
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBchkGeraContab: TDBCheckBox
          Left = 32
          Top = 60
          Width = 185
          Height = 17
          Caption = 'Contabilizar Operação'
          DataField = 'FLGGERACONTAB'
          DataSource = ds
          TabOrder = 2
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
      end
      object DBrdgCustoRec: TDBRadioGroup
        Left = 366
        Top = 48
        Width = 107
        Height = 86
        Caption = 'Tipo'
        DataField = 'RECPAG'
        DataSource = ds
        Items.Strings = (
          'a Pagar'
          'a Receber')
        TabOrder = 2
        TabStop = True
        Values.Strings = (
          'P'
          'R')
        OnClick = DBrdgCustoRecClick
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 144
      Width = 494
      Height = 208
      Tabs.Strings = (
        'Geral'
        'Débito'
        'Crédito'
        'CAP / CAR')
      detdbGrids.Strings = (
        ''
        ''
        ''
        ''
        '')
      inherited pgctrlDetalhe: TPageControl
        Width = 396
        Height = 149
        OnChange = bbtnCancelarClick
        inherited tbsDet: TTabSheet
          Caption = 'Geral'
          inherited dbgrdDet: TwwDBGrid
            Width = 388
            Height = 121
          end
          inherited pnlControlesDet: TPanel
            Width = 388
            Height = 121
            object Label15: TLabel
              Left = 28
              Top = 13
              Width = 142
              Height = 13
              Caption = 'Histórico do Lançamento'
            end
            object Label12: TLabel
              Left = 28
              Top = 57
              Width = 108
              Height = 13
              Caption = 'Atividade / Projeto'
            end
            object DBedtHistorico: TDBEdit
              Left = 28
              Top = 27
              Width = 321
              Height = 21
              DataField = 'HISTLANCINVEST'
              DataSource = dsDet
              TabOrder = 0
            end
            object DBcboUnidNegoc: TwwDBLookupCombo
              Left = 28
              Top = 71
              Width = 322
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'25'#9'NOME')
              DataField = 'UNIDNEGOC'
              DataSource = dsDet
              LookupTable = qryLookUnidNegocio
              LookupField = 'UNIDNEGOC'
              Style = csDropDownList
              DropDownCount = 4
              DropDownWidth = 8
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
            end
          end
        end
        object tbsDebito: TTabSheet
          Caption = 'Débito'
          ImageIndex = 1
          object Label8: TLabel
            Left = 16
            Top = 6
            Width = 84
            Height = 13
            Caption = 'Conta Contábil'
          end
          object lblContaDebito: TLabel
            Left = 176
            Top = 24
            Width = 209
            Height = 13
            AutoSize = False
            Caption = 'Conta Contábil'
          end
          object Label9: TLabel
            Left = 16
            Top = 44
            Width = 55
            Height = 13
            Caption = 'Subconta'
          end
          object Label11: TLabel
            Left = 16
            Top = 81
            Width = 92
            Height = 13
            Caption = 'Centro de Custo'
          end
          object Label3: TLabel
            Left = 16
            Top = 118
            Width = 161
            Height = 13
            Caption = 'Tipo de Operação (Contábil)'
          end
          object mskContaDebito: TMaskEdit
            Left = 16
            Top = 20
            Width = 129
            Height = 21
            TabOrder = 0
            OnExit = mskContaDebitoExit
          end
          object btnBuscaContaDebito: TBitBtn
            Left = 144
            Top = 19
            Width = 23
            Height = 22
            Hint = 'Busca um Locatário'
            TabOrder = 1
            OnClick = btnBuscaContaDebitoClick
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
          object DBcboSubContaD: TwwDBLookupCombo
            Left = 16
            Top = 57
            Width = 322
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMESUBCONTA'#9'20'#9'NOMESUBCONTA')
            DataField = 'CODSUBCONTAD'
            DataSource = dsDet
            LookupTable = qryLookSubConta
            LookupField = 'CODSUBCONTA'
            Style = csDropDownList
            DropDownWidth = 8
            Enabled = False
            TabOrder = 2
            AutoDropDown = True
            ShowButton = True
            UseTFields = False
            AllowClearKey = False
          end
          object DBcboCentroCustoD: TwwDBLookupCombo
            Left = 16
            Top = 94
            Width = 322
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'30'#9'NOME')
            DataField = 'CENCUSTDINVEST'
            DataSource = dsDet
            LookupTable = qryLookCentroCusto
            LookupField = 'CODCENTROCUSTO'
            Style = csDropDownList
            DropDownWidth = 8
            Enabled = False
            TabOrder = 3
            AutoDropDown = True
            ShowButton = True
            UseTFields = False
            AllowClearKey = False
          end
          object DBcboTipOperD: TwwDBLookupCombo
            Left = 16
            Top = 131
            Width = 321
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'TIPDESCRICAO'#9'25'#9'TIPDESCRICAO')
            DataField = 'TIPCODIGO'
            DataSource = dsDet
            LookupTable = qryLookTipOper
            LookupField = 'TIPCODIGO'
            Style = csDropDownList
            DropDownCount = 4
            DropDownWidth = 8
            TabOrder = 4
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
          end
        end
        object tbsCredito: TTabSheet
          Caption = 'Crédito'
          ImageIndex = 2
          object Label5: TLabel
            Left = 16
            Top = 6
            Width = 84
            Height = 13
            Caption = 'Conta Contábil'
          end
          object lblContaCredito: TLabel
            Left = 176
            Top = 24
            Width = 201
            Height = 13
            AutoSize = False
            Caption = 'Conta Contábil'
          end
          object Label7: TLabel
            Left = 16
            Top = 44
            Width = 56
            Height = 13
            Caption = 'SubConta'
          end
          object Label10: TLabel
            Left = 16
            Top = 81
            Width = 92
            Height = 13
            Caption = 'Centro de Custo'
          end
          object Label13: TLabel
            Left = 16
            Top = 118
            Width = 161
            Height = 13
            Caption = 'Tipo de Operação (Contábil)'
          end
          object mskContaCredito: TMaskEdit
            Left = 16
            Top = 20
            Width = 129
            Height = 21
            TabOrder = 0
            OnExit = mskContaCreditoExit
          end
          object btnBuscaContaCredito: TBitBtn
            Left = 144
            Top = 19
            Width = 23
            Height = 22
            Hint = 'Busca um Locatário'
            TabOrder = 1
            OnClick = btnBuscaContaCreditoClick
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
          object DBcboSubContaC: TwwDBLookupCombo
            Left = 16
            Top = 57
            Width = 322
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMESUBCONTA'#9'20'#9'NOMESUBCONTA')
            DataField = 'CODSUBCONTAC'
            DataSource = dsDet
            LookupTable = qryLookSubConta
            LookupField = 'CODSUBCONTA'
            Style = csDropDownList
            DropDownWidth = 8
            Enabled = False
            TabOrder = 2
            AutoDropDown = True
            ShowButton = True
            UseTFields = False
            AllowClearKey = False
          end
          object DBcboCentroCustoC: TwwDBLookupCombo
            Left = 16
            Top = 94
            Width = 322
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'30'#9'NOME')
            DataField = 'CENCUSTCINVEST'
            DataSource = dsDet
            LookupTable = qryLookCentroCusto
            LookupField = 'CODCENTROCUSTO'
            Style = csDropDownList
            DropDownWidth = 8
            Enabled = False
            TabOrder = 3
            AutoDropDown = True
            ShowButton = True
            UseTFields = False
            AllowClearKey = False
          end
          object DBcboTipOperC: TwwDBLookupCombo
            Left = 16
            Top = 131
            Width = 321
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'TIPDESCRICAO'#9'25'#9'TIPDESCRICAO'#9'F')
            DataField = 'TIPCODIGO'
            DataSource = dsDet
            LookupTable = qryLookTipOper
            LookupField = 'TIPCODIGO'
            Style = csDropDownList
            DropDownCount = 4
            DropDownWidth = 8
            TabOrder = 4
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
          end
        end
        object tbsCAP: TTabSheet
          Caption = 'CAP / CAR'
          ImageIndex = 3
          object Label19: TLabel
            Left = 16
            Top = 57
            Width = 204
            Height = 13
            Caption = 'Tipo do Recebimento / Desembolso'
          end
          object Label26: TLabel
            Left = 16
            Top = 100
            Width = 160
            Height = 13
            Caption = 'Centro de Responsabilidade'
          end
          object Label1: TLabel
            Left = 16
            Top = 14
            Width = 112
            Height = 13
            Caption = 'Tipo de Documento'
          end
          object DBcboTipoRecDes: TwwDBLookupCombo
            Left = 16
            Top = 71
            Width = 321
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'26'#9'DESCRICAO'
              'CODTIPRECDES'#9'11'#9'CODTIPRECDES')
            DataField = 'CODTIPRECDES'
            DataSource = dsDet
            LookupTable = qryLookTipoRecDes
            LookupField = 'CODTIPRECDES'
            Style = csDropDownList
            DropDownCount = 4
            DropDownWidth = 8
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
          end
          object DBcboCentroRespon: TwwDBLookupCombo
            Left = 16
            Top = 114
            Width = 321
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'30'#9'NOME')
            DataField = 'CODCENTRORESPON'
            DataSource = dsDet
            LookupTable = qryLookCentroRespon
            LookupField = 'CODCENTRORESPON'
            Style = csDropDownList
            DropDownCount = 6
            DropDownWidth = 8
            TabOrder = 2
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
          end
          object dblcTipoDoc: TwwDBLookupCombo
            Left = 16
            Top = 28
            Width = 321
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'35'#9'DESCRICAO'#9'F')
            DataField = 'CODTIPDOC'
            DataSource = ds
            LookupTable = qryLookTipoDoc
            LookupField = 'CODTIPDOC'
            Style = csDropDownList
            DropDownCount = 4
            DropDownWidth = 8
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
          end
        end
      end
      inherited Dock973: TDock97
        Width = 486
      end
      inherited Dock974: TDock97
        Left = 400
        Height = 149
      end
    end
  end
  inherited Dock972: TDock97
    Width = 496
  end
  inherited Dock971: TDock97
    Top = 400
    Width = 496
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 248
    Top = 2
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 443
    Top = 114
  end
  inherited ds: TwwDataSource
    Left = 410
    Top = 2
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TIPOOPERACAO'
      'set'
      '  IDTIPOINVEST = :IDTIPOINVEST,'
      '  IDTIPOOPERACAO = :IDTIPOOPERACAO,'
      '  DESCTIPOOPERACAO = :DESCTIPOOPERACAO,'
      '  NATUREZAOPERACAO = :NATUREZAOPERACAO,'
      '  FLGGERACONTAB = :FLGGERACONTAB,'
      '  FLGGERACAPCAR = :FLGGERACAPCAR,'
      '  RECPAG = :RECPAG,'
      '  CODTIPDOC = :CODTIPDOC,'
      '  TIPCREDOR = :TIPCREDOR,'
      '  FLGGERACAF = :FLGGERACAF'
      'where'
      '  IDTIPOINVEST = :OLD_IDTIPOINVEST and'
      '  IDTIPOOPERACAO = :OLD_IDTIPOOPERACAO')
    InsertSQL.Strings = (
      'insert into TIPOOPERACAO'
      
        '  (IDTIPOINVEST, IDTIPOOPERACAO, DESCTIPOOPERACAO, NATUREZAOPERA' +
        'CAO, FLGGERACONTAB, '
      '   FLGGERACAPCAR, RECPAG, CODTIPDOC, TIPCREDOR, FLGGERACAF)'
      'values'
      
        '  (:IDTIPOINVEST, :IDTIPOOPERACAO, :DESCTIPOOPERACAO, :NATUREZAO' +
        'PERACAO, '
      
        '   :FLGGERACONTAB, :FLGGERACAPCAR, :RECPAG, :CODTIPDOC, :TIPCRED' +
        'OR, :FLGGERACAF)')
    DeleteSQL.Strings = (
      'delete from TIPOOPERACAO'
      'where'
      '  IDTIPOINVEST = :OLD_IDTIPOINVEST and'
      '  IDTIPOOPERACAO = :OLD_IDTIPOOPERACAO')
    Left = 370
    Top = 2
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TIPOOPERACAO.DESCTIPOOPERACAO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Tipo de Operação')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'TIPOOPERACAO')
    CamposChave.Strings = (
      'TIPOOPERACAO.IDTIPOOPERACAO')
    Filtro.Strings = (
      'IDTIPOINVEST = 3')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    Left = 451
    Top = 2
  end
  inherited ImlPadrao: TImageList
    Left = 289
    Top = 2
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 436
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '   IDTIPOINVEST, IDTIPOOPERACAO, DESCTIPOOPERACAO,'
      '   NATUREZAOPERACAO, FLGGERACONTAB, FLGGERACAPCAR,'
      '   RECPAG, CODTIPDOC, TIPCREDOR, FLGGERACAF'
      ''
      'FROM'
      '   TIPOOPERACAO'
      ''
      'WHERE'
      '            (IDTIPOINVEST = 3)'
      '   AND (IDTIPOOPERACAO = :pIDTIPOOPERACAO)'
      ''
      'ORDER BY'
      '   DESCTIPOOPERACAO')
    Left = 329
    Top = 2
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pIDTIPOOPERACAO'
        ParamType = ptUnknown
      end>
    object qryIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'BASEDADOS.TIPOOPERACAO.IDTIPOINVEST'
    end
    object qryIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.IDTIPOOPERACAO'
    end
    object qryDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.DESCTIPOOPERACAO'
      Size = 60
    end
    object qryNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.NATUREZAOPERACAO'
      FixedChar = True
      Size = 1
    end
    object qryFLGGERACONTAB: TFloatField
      FieldName = 'FLGGERACONTAB'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGGERACONTAB'
    end
    object qryFLGGERACAPCAR: TFloatField
      FieldName = 'FLGGERACAPCAR'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGGERACAPCAR'
    end
    object qryRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'BASEDADOS.TIPOOPERACAO.RECPAG'
      FixedChar = True
      Size = 1
    end
    object qryCODTIPDOC: TFloatField
      FieldName = 'CODTIPDOC'
      Origin = 'BASEDADOS.TIPOOPERACAO.CODTIPDOC'
    end
    object qryTIPCREDOR: TStringField
      FieldName = 'TIPCREDOR'
      Origin = 'BASEDADOS.TIPOOPERACAO.TIPCREDOR'
      Size = 2
    end
    object qryFLGGERACAF: TFloatField
      FieldName = 'FLGGERACAF'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGGERACAF'
    end
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 348
    Top = 58
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDPADRLANCCONT,'
      '   IDTIPOINVEST, IDTIPOOPERACAO, IDTIPODESPINVEST,'
      '   IDCARTEIRAINVEST, CODTIPTITULO, IDFORCLI,'
      '   TIPLANCINVEST, TIPMOVCARTINV, RECPAG, IDPESSOA,'
      '   CODTIPRECDES, HISTLANCINVEST, FLGPAGRECNAO, '
      '   PLANO, CONTADOPERFIN, CONTACOPERFIN, IDEMPRESA,'
      '   CENCUSTDINVEST, CENCUSTCINVEST, CODSUBCONTAD,'
      '   CODSUBCONTAC,'
      '   CODCENTRORESPON, UNIDNEGOC, '
      '   TIPCODIGO'
      'FROM'
      '   PADRLANCCONTINV'
      'WHERE'
      '   ( IDTIPOINVEST = 3 ) AND'
      '   ( IDTIPOOPERACAO =:pIDTIPOOPERACAO )'
      'ORDER BY'
      '   HISTLANCINVEST')
    UpdateObject = updDet
    ValidateWithMask = True
    Left = 443
    Top = 176
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pIDTIPOOPERACAO'
        ParamType = ptUnknown
      end>
    object qryDetIDPADRLANCCONT: TFloatField
      FieldName = 'IDPADRLANCCONT'
      Origin = 'BASEDADOS.PADRLANCCONTINV.IDPADRLANCCONT'
    end
    object qryDetIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'BASEDADOS.PADRLANCCONTINV.IDTIPOINVEST'
    end
    object qryDetIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'BASEDADOS.PADRLANCCONTINV.IDTIPOOPERACAO'
    end
    object qryDetIDTIPODESPINVEST: TFloatField
      FieldName = 'IDTIPODESPINVEST'
      Origin = 'BASEDADOS.PADRLANCCONTINV.IDTIPODESPINVEST'
    end
    object qryDetIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'BASEDADOS.PADRLANCCONTINV.IDCARTEIRAINVEST'
    end
    object qryDetCODTIPTITULO: TStringField
      FieldName = 'CODTIPTITULO'
      Origin = 'BASEDADOS.PADRLANCCONTINV.CODTIPTITULO'
      Size = 5
    end
    object qryDetIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'BASEDADOS.PADRLANCCONTINV.IDFORCLI'
    end
    object qryDetTIPLANCINVEST: TStringField
      FieldName = 'TIPLANCINVEST'
      Origin = 'BASEDADOS.PADRLANCCONTINV.TIPLANCINVEST'
      FixedChar = True
      Size = 1
    end
    object qryDetTIPMOVCARTINV: TStringField
      FieldName = 'TIPMOVCARTINV'
      Origin = 'BASEDADOS.PADRLANCCONTINV.TIPMOVCARTINV'
      Size = 3
    end
    object qryDetRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'BASEDADOS.PADRLANCCONTINV.RECPAG'
      FixedChar = True
      Size = 1
    end
    object qryDetIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.PADRLANCCONTINV.IDPESSOA'
    end
    object qryDetCODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      Origin = 'BASEDADOS.PADRLANCCONTINV.CODTIPRECDES'
      FixedChar = True
      Size = 15
    end
    object qryDetHISTLANCINVEST: TStringField
      FieldName = 'HISTLANCINVEST'
      Origin = 'BASEDADOS.PADRLANCCONTINV.HISTLANCINVEST'
      Size = 60
    end
    object qryDetFLGPAGRECNAO: TStringField
      FieldName = 'FLGPAGRECNAO'
      Origin = 'BASEDADOS.PADRLANCCONTINV.FLGPAGRECNAO'
      FixedChar = True
      Size = 1
    end
    object qryDetPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'BASEDADOS.PADRLANCCONTINV.PLANO'
    end
    object qryDetCONTADOPERFIN: TStringField
      FieldName = 'CONTADOPERFIN'
      Origin = 'BASEDADOS.PADRLANCCONTINV.CONTADOPERFIN'
      FixedChar = True
      Size = 18
    end
    object qryDetCONTACOPERFIN: TStringField
      FieldName = 'CONTACOPERFIN'
      Origin = 'BASEDADOS.PADRLANCCONTINV.CONTACOPERFIN'
      FixedChar = True
      Size = 18
    end
    object qryDetIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Origin = 'BASEDADOS.PADRLANCCONTINV.IDEMPRESA'
    end
    object qryDetCENCUSTDINVEST: TStringField
      FieldName = 'CENCUSTDINVEST'
      Origin = 'BASEDADOS.PADRLANCCONTINV.CENCUSTDINVEST'
      FixedChar = True
      Size = 10
    end
    object qryDetCENCUSTCINVEST: TStringField
      FieldName = 'CENCUSTCINVEST'
      Origin = 'BASEDADOS.PADRLANCCONTINV.CENCUSTCINVEST'
      FixedChar = True
      Size = 10
    end
    object qryDetCODSUBCONTAD: TFloatField
      FieldName = 'CODSUBCONTAD'
      Origin = 'BASEDADOS.PADRLANCCONTINV.CODSUBCONTAD'
    end
    object qryDetCODSUBCONTAC: TFloatField
      FieldName = 'CODSUBCONTAC'
      Origin = 'BASEDADOS.PADRLANCCONTINV.CODSUBCONTAC'
    end
    object qryDetCODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      Origin = 'BASEDADOS.PADRLANCCONTINV.CODCENTRORESPON'
      FixedChar = True
      Size = 10
    end
    object qryDetUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Origin = 'BASEDADOS.PADRLANCCONTINV.UNIDNEGOC'
    end
    object qryDetTIPCODIGO: TStringField
      FieldName = 'TIPCODIGO'
      Origin = 'BASEDADOS.PADRLANCCONTINV.TIPCODIGO'
      FixedChar = True
      Size = 2
    end
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update PADRLANCCONTINV'
      'set'
      '  IDTIPOINVEST = :IDTIPOINVEST,'
      '  IDTIPOOPERACAO = :IDTIPOOPERACAO,'
      '  IDTIPODESPINVEST = :IDTIPODESPINVEST,'
      '  IDCARTEIRAINVEST = :IDCARTEIRAINVEST,'
      '  CODTIPTITULO = :CODTIPTITULO,'
      '  IDFORCLI = :IDFORCLI,'
      '  TIPLANCINVEST = :TIPLANCINVEST,'
      '  TIPMOVCARTINV = :TIPMOVCARTINV,'
      '  RECPAG = :RECPAG,'
      '  IDPESSOA = :IDPESSOA,'
      '  CODTIPRECDES = :CODTIPRECDES,'
      '  HISTLANCINVEST = :HISTLANCINVEST,'
      '  FLGPAGRECNAO = :FLGPAGRECNAO,'
      '  PLANO = :PLANO,'
      '  CONTADOPERFIN = :CONTADOPERFIN,'
      '  CONTACOPERFIN = :CONTACOPERFIN,'
      '  IDEMPRESA = :IDEMPRESA,'
      '  CENCUSTDINVEST = :CENCUSTDINVEST,'
      '  CENCUSTCINVEST = :CENCUSTCINVEST,'
      '  CODSUBCONTAD = :CODSUBCONTAD,'
      '  CODSUBCONTAC = :CODSUBCONTAC,'
      '  CODCENTRORESPON = :CODCENTRORESPON,'
      '  UNIDNEGOC = :UNIDNEGOC,'
      '  TIPCODIGO = :TIPCODIGO'
      'where'
      '  IDPADRLANCCONT = :OLD_IDPADRLANCCONT')
    InsertSQL.Strings = (
      'insert into PADRLANCCONTINV'
      
        '  (IDPADRLANCCONT, IDTIPOINVEST, IDTIPOOPERACAO, IDTIPODESPINVES' +
        'T, IDCARTEIRAINVEST, '
      
        '   CODTIPTITULO, IDFORCLI, TIPLANCINVEST, TIPMOVCARTINV, RECPAG,' +
        ' IDPESSOA, '
      
        '   CODTIPRECDES, HISTLANCINVEST, FLGPAGRECNAO, PLANO, CONTADOPER' +
        'FIN, CONTACOPERFIN, '
      
        '   IDEMPRESA, CENCUSTDINVEST, CENCUSTCINVEST, CODSUBCONTAD, CODS' +
        'UBCONTAC, '
      '   CODCENTRORESPON, UNIDNEGOC, TIPCODIGO)'
      'values'
      
        '  (:IDPADRLANCCONT, :IDTIPOINVEST, :IDTIPOOPERACAO, :IDTIPODESPI' +
        'NVEST, '
      
        '   :IDCARTEIRAINVEST, :CODTIPTITULO, :IDFORCLI, :TIPLANCINVEST, ' +
        ':TIPMOVCARTINV, '
      
        '   :RECPAG, :IDPESSOA, :CODTIPRECDES, :HISTLANCINVEST, :FLGPAGRE' +
        'CNAO, :PLANO, '
      
        '   :CONTADOPERFIN, :CONTACOPERFIN, :IDEMPRESA, :CENCUSTDINVEST, ' +
        ':CENCUSTCINVEST, '
      
        '   :CODSUBCONTAD, :CODSUBCONTAC, :CODCENTRORESPON, :UNIDNEGOC, :' +
        'TIPCODIGO)')
    DeleteSQL.Strings = (
      'delete from PADRLANCCONTINV'
      'where'
      '  IDPADRLANCCONT = :OLD_IDPADRLANCCONT')
    Left = 442
    Top = 128
  end
  object qryLookUnidNegocio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   UNIDNEGOC, NOME'
      'FROM'
      '   UNIDNEGOCIO'
      'WHERE'
      '   ( IDPESSOA =:EMPRESAPROP ) AND'
      '   ( UNETIPO = '#39'A'#39' )'
      'ORDER BY'
      '  NOME')
    ValidateWithMask = True
    Left = 312
    Top = 128
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end>
    object qryLookUnidNegocioNOME: TStringField
      DisplayWidth = 25
      FieldName = 'NOME'
      Origin = 'UNIDNEGOCIO.NOME'
      Size = 25
    end
    object qryLookUnidNegocioUNIDNEGOC: TFloatField
      DisplayWidth = 10
      FieldName = 'UNIDNEGOC'
      Origin = 'UNIDNEGOCIO.UNIDNEGOC'
      Visible = False
    end
  end
  object MontaSelectConta: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PLANOCONTA.PLACONTA'
      'PLANOCONTA.PLANOME'
      'PLANOCONTA.PLAREDUZ')
    TipodeDado.Strings = (
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Código'
      'Nome'
      'Código Reduzido')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PLANOCONTA')
    CamposChave.Strings = (
      'PLANOCONTA.PLACONTA'
      'PLANOCONTA.PLANOME'
      'PLANOCONTA.PLASUBCONTA'
      'PLANOCONTA.PLACCUST')
    Filtro.Strings = (
      'PLANOCONTA.PLATIPO = '#39'A'#39)
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '18'
      '40'
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 344
    Top = 242
  end
  object qryLookSubConta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CODSUBCONTA, NOMESUBCONTA'
      'FROM'
      '   SUBCONTA'
      'WHERE'
      '   IDPESSOA =:EMPRESAPROP'
      'ORDER BY'
      '   NOMESUBCONTA')
    ValidateWithMask = True
    Left = 312
    Top = 140
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end>
  end
  object qryLookCentroCusto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   X.CODCENTROCUSTO, C.NOME'
      'FROM'
      '   CONTASXCC X, CENTCUST C'
      'WHERE'
      '   ('
      '   ( X.PLANO =:PLANO ) AND'
      '   ( RTRIM(X.PLACONTA) =:CONTA ) AND'
      '   ( X.IDEMPRESA =:EMPRESAPROP )'
      '   )'
      '   AND'
      '   ('
      '   ( C.CODCENTROCUSTO = X.CODCENTROCUSTO )'
      '   )'
      'ORDER BY'
      '   C.NOME')
    ValidateWithMask = True
    Left = 312
    Top = 152
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CONTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end>
    object StringField6: TStringField
      DisplayWidth = 30
      FieldName = 'NOME'
      Origin = 'CENTCUST.NOME'
      Size = 30
    end
    object StringField7: TStringField
      DisplayWidth = 10
      FieldName = 'CODCENTROCUSTO'
      Origin = 'CENTCUST.CODCENTROCUSTO'
      Visible = False
      Size = 10
    end
  end
  object qryLookTipOper: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   TIPCODIGO, TIPDESCRICAO'
      'FROM'
      '   TIPOPER'
      'ORDER BY'
      '   TIPDESCRICAO')
    ValidateWithMask = True
    Left = 200
    Top = 112
    object qryLookTipOperTIPDESCRICAO: TStringField
      DisplayWidth = 25
      FieldName = 'TIPDESCRICAO'
      Origin = 'TIPOPER.TIPDESCRICAO'
      Size = 25
    end
    object qryLookTipOperTIPCODIGO: TStringField
      DisplayWidth = 2
      FieldName = 'TIPCODIGO'
      Origin = 'TIPOPER.TIPCODIGO'
      Visible = False
      Size = 2
    end
  end
  object qryVerificaConta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PLACONTA, PLANOME, PLASUBCONTA, PLACCUST'
      'FROM'
      '  PLANOCONTA'
      'WHERE'
      '  ( PLANO =:PLANO ) AND'
      '  ( RTRIM(PLACONTA) =:CONTA ) AND'
      '  ( PLATIPO = '#39'A'#39')'
      '')
    ValidateWithMask = True
    Left = 224
    Top = 64
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CONTA'
        ParamType = ptUnknown
      end>
  end
  object qryLookTipoRecDes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CODTIPRECDES, RECPAG, DESCRICAO'
      'FROM'
      '   TIPORECEBDESEMB'
      'WHERE'
      '   ( IDPESSOA =:EMPRESAPROP ) AND'
      '   ( RECPAG =:RECPAG ) AND'
      '   ( ANASINT = '#39'A'#39' )'
      'ORDER BY'
      '   DESCRICAO')
    ValidateWithMask = True
    Left = 200
    Top = 140
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'RECPAG'
        ParamType = ptUnknown
      end>
    object StringField1: TStringField
      DisplayWidth = 26
      FieldName = 'DESCRICAO'
      Origin = 'TIPORECEBDESEMB.DESCRICAO'
      Size = 35
    end
    object StringField2: TStringField
      DisplayWidth = 11
      FieldName = 'CODTIPRECDES'
      Origin = 'TIPORECEBDESEMB.CODTIPRECDES'
      Size = 15
    end
    object StringField3: TStringField
      DisplayWidth = 1
      FieldName = 'RECPAG'
      Origin = 'TIPORECEBDESEMB.RECPAG'
      Visible = False
      Size = 1
    end
  end
  object qryLookCentroRespon: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CODCENTRORESPON, NOME'
      'FROM'
      '   CENTRESPON'
      'WHERE'
      '   ( IDPESSOA =:EMPRESAPROP ) AND'
      '   ( ANALITICOSINTET = '#39'A'#39' )'
      'ORDER BY'
      '   NOME')
    ValidateWithMask = True
    Left = 200
    Top = 128
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end>
    object qryLookCentroResponNOME: TStringField
      DisplayWidth = 30
      FieldName = 'NOME'
      Origin = 'CENTRESPON.NOME'
      Size = 30
    end
    object qryLookCentroResponCODCENTRORESPON: TStringField
      DisplayWidth = 10
      FieldName = 'CODCENTRORESPON'
      Origin = 'CENTRESPON.CODCENTRORESPON'
      Visible = False
      Size = 10
    end
  end
  object qryLookTipoDoc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  CODTIPDOC, RECPAG, DESCRICAO, DEBCRE'
      'FROM'
      '  TIPODOCRECPAG'
      'WHERE'
      '  ( RECPAG =:RECPAG ) AND'
      '  ( DEBCRE =:DEBCRE )'
      'ORDER BY'
      '  DESCRICAO')
    ValidateWithMask = True
    Left = 392
    Top = 172
    ParamData = <
      item
        DataType = ftString
        Name = 'RECPAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DEBCRE'
        ParamType = ptUnknown
      end>
    object qryLookTipoDocDESCRICAO: TStringField
      DisplayWidth = 35
      FieldName = 'DESCRICAO'
      Origin = 'TIPODOCRECPAG.DESCRICAO'
      Size = 35
    end
    object qryLookTipoDocCODTIPDOC: TFloatField
      DisplayWidth = 10
      FieldName = 'CODTIPDOC'
      Origin = 'TIPODOCRECPAG.CODTIPDOC'
      Visible = False
    end
    object qryLookTipoDocRECPAG: TStringField
      DisplayWidth = 1
      FieldName = 'RECPAG'
      Origin = 'TIPODOCRECPAG.RECPAG'
      Visible = False
      Size = 1
    end
    object qryLookTipoDocDEBCRE: TStringField
      DisplayWidth = 1
      FieldName = 'DEBCRE'
      Origin = 'TIPODOCRECPAG.DEBCRE'
      Visible = False
      Size = 1
    end
  end
end
