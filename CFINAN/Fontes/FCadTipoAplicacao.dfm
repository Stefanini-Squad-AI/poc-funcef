inherited frmCadTipoAplicacao: TfrmCadTipoAplicacao
  Left = 118
  Top = 175
  Caption = 'Cadastro de Tipos de Aplicação'
  ClientHeight = 503
  ClientWidth = 752
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 752
    Height = 417
    inherited pnlMestre: TPanel
      Width = 750
      Height = 164
      object Label1: TLabel
        Left = 12
        Top = 8
        Width = 133
        Height = 13
        Caption = 'Código Correspondente'
      end
      object lblDescricao: TLabel
        Left = 12
        Top = 48
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object dbeCodigoCorrespondente: TwwDBEdit
        Left = 12
        Top = 24
        Width = 316
        Height = 21
        DataField = 'CODCORRESP'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbeDescricao: TwwDBEdit
        Left = 12
        Top = 64
        Width = 316
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbrTipoResgate: TDBRadioGroup
        Left = 9
        Top = 89
        Width = 128
        Height = 72
        Caption = 'Tipo de Resgate'
        DataField = 'TIPORESGATE'
        DataSource = ds
        Items.Strings = (
          '&Único'
          '&Múltiplos')
        TabOrder = 2
        Values.Strings = (
          'U'
          'M')
      end
      object dbrFixaVariavel: TDBRadioGroup
        Left = 144
        Top = 89
        Width = 185
        Height = 72
        Caption = 'Tipo de Aplicação'
        DataField = 'FIXAVARIAVEL'
        DataSource = ds
        Items.Strings = (
          'Renda &Fixa'
          'Renda &Variável')
        TabOrder = 3
        Values.Strings = (
          'F'
          'V')
      end
      object gbDadosBasicos: TGroupBox
        Left = 337
        Top = 3
        Width = 400
        Height = 158
        Caption = ' Integração com o Fluxo Orçado '
        TabOrder = 4
        object lblUnidNegoc: TLabel
          Left = 9
          Top = 21
          Width = 108
          Height = 13
          Caption = 'Atividade / Projeto'
        end
        object lblTipoRD: TLabel
          Left = 9
          Top = 66
          Width = 122
          Height = 13
          Caption = 'Tipo de Recebimento'
        end
        object lblCentroRespon: TLabel
          Left = 204
          Top = 21
          Width = 160
          Height = 13
          Caption = 'Centro de Responsabilidade'
        end
        object lblCentCusto: TLabel
          Left = 204
          Top = 66
          Width = 92
          Height = 13
          Caption = 'Centro de Custo'
        end
        object lblContaOrcRec: TLabel
          Left = 9
          Top = 110
          Width = 179
          Height = 13
          Caption = 'Conta Orçamentária de Receita'
        end
        object lblContaOrcCus: TLabel
          Left = 204
          Top = 109
          Width = 184
          Height = 13
          Caption = 'Conta Orçamentária de Despesa'
        end
        object dblcUnidNegoc: TwwDBLookupCombo
          Left = 9
          Top = 37
          Width = 191
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'25'#9'Nome'
            'UNECODIGO'#9'10'#9'Código')
          DataField = 'UNIDNEGOC'
          DataSource = ds
          LookupTable = qryUnidNegocio
          LookupField = 'UNIDNEGOC'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object dblcTipoRD: TwwDBLookupCombo
          Left = 9
          Top = 82
          Width = 191
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'35'#9'Descrição'
            'CODTIPRECDES'#9'15'#9'Código')
          DataField = 'CODTIPRECDES'
          DataSource = ds
          LookupTable = qryTipoRD
          LookupField = 'CODTIPRECDES'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 2
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object dblcCentroRespon: TwwDBLookupCombo
          Left = 204
          Top = 37
          Width = 191
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'30'#9'Descrição'
            'CODCENTRORESPON'#9'10'#9'Código')
          DataField = 'CODCENTRORESPON'
          DataSource = ds
          LookupTable = qryCentroRespon
          LookupField = 'CODCENTRORESPON'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object dblcCentCusto: TwwDBLookupCombo
          Left = 204
          Top = 82
          Width = 191
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'30'#9'Descrição'
            'CODCENTROCUSTO'#9'10'#9'Código')
          DataField = 'CODCENTROCUSTO'
          DataSource = ds
          LookupTable = qryCentCust
          LookupField = 'CODCENTROCUSTO'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 3
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object cmpContaOrcRec: TCMProcura
          Left = 9
          Top = 125
          Width = 191
          Height = 27
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MostraMensagens = True
          Mensagens.EmBranco = 'Chave não pode estar em branco'
          Mensagens.NaoExiste = 'Chave não existe'
          PermiteChaveInvalida = False
          PermiteChaveEmBranco = False
          DataSource = ds
          DataField = 'IDCONTAORCREC'
          LookupChave = 'IDCONTAORCAMEN'
          LookupDescricao = 'IDCONTAORCAMEN'
          MontaSelect = msContaOrcamen
          LookupTabela = 'CONTASORCAMEN'
          DataBaseName = 'BaseDados'
          ReadOnly = False
        end
        object cmpContaOrcCus: TCMProcura
          Left = 204
          Top = 125
          Width = 191
          Height = 27
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MostraMensagens = True
          Mensagens.EmBranco = 'Chave não pode estar em branco'
          Mensagens.NaoExiste = 'Chave não existe'
          PermiteChaveInvalida = False
          PermiteChaveEmBranco = False
          DataSource = ds
          DataField = 'IDCONTAORCCUS'
          LookupChave = 'IDCONTAORCAMEN'
          LookupDescricao = 'IDCONTAORCAMEN'
          MontaSelect = msContaOrcamen
          LookupTabela = 'CONTASORCAMEN'
          DataBaseName = 'BaseDados'
          ReadOnly = False
        end
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 165
      Width = 750
      Height = 251
      Tabs.Strings = (
        'Valores')
      inherited pgctrlDetalhe: TPageControl
        Width = 652
        Height = 192
        inherited tbsDet: TTabSheet
          Caption = 'Valores'
          inherited dbgrdDet: TwwDBGrid
            Width = 644
            Height = 164
            Selected.Strings = (
              'MOEDESC'#9'32'#9'Moeda'#9'F'
              'NOMECENARIO'#9'41'#9'Cenário'#9'F'
              'FLGREAPLICA'#9'10'#9'Reaplicação'#9'F')
          end
          inherited pnlControlesDet: TPanel
            Width = 644
            Height = 164
            object gbReaplicacao: TGroupBox
              Left = 4
              Top = 3
              Width = 629
              Height = 150
              Caption = ' Informações Padrões para Aplicação e Reaplicação '
              TabOrder = 0
              object lblMoedaCota: TLabel
                Left = 9
                Top = 15
                Width = 87
                Height = 13
                Caption = 'Moeda da Cota'
              end
              object lblTipoAplic: TLabel
                Left = 9
                Top = 103
                Width = 273
                Height = 13
                Caption = 'Reaplicação (Tipo) em outro Tipo de Aplicação '
              end
              object lblPrazoResg: TLabel
                Left = 321
                Top = 103
                Width = 84
                Height = 13
                Caption = 'Prazo Resgate'
              end
              object lblTxPrev: TLabel
                Left = 414
                Top = 103
                Width = 103
                Height = 13
                Caption = 'Tx. Juros Prevista'
              end
              object Label2: TLabel
                Left = 9
                Top = 58
                Width = 122
                Height = 13
                Caption = 'Cenário de Aplicação'
              end
              object dblcMoeda: TCMDBLookupCombo
                Left = 9
                Top = 28
                Width = 297
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'MOEDESC'#9'20'#9'Descrição'
                  'MOESIGLA'#9'10'#9'Sigla')
                DataField = 'MOECODIGO'
                DataSource = dsDet
                LookupTable = qryMoeda
                LookupField = 'MOECODIGO'
                Options = [loTitles]
                Style = csDropDownList
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                OrderByDisplay = False
                AllowClearKey = True
                ShowMatchText = True
              end
              object dblcTipoAplic: TCMDBLookupCombo
                Left = 9
                Top = 118
                Width = 297
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCRICAO'#9'60'#9'Descrição')
                DataField = 'TIPOAPLICSUBST'
                DataSource = dsDet
                LookupTable = qryTipoAplic
                LookupField = 'TIPOAPLICACAO'
                Options = [loTitles]
                Style = csDropDownList
                TabOrder = 2
                AutoDropDown = True
                ShowButton = True
                OrderByDisplay = False
                AllowClearKey = True
                ShowMatchText = True
              end
              object dbrePrazoResgate: TDBRealEdit
                Left = 321
                Top = 118
                Width = 81
                Height = 21
                Alignment = taRightJustify
                Lines.Strings = (
                  '0')
                TabOrder = 4
                WordWrap = False
                IntDigits = 4
                DecDigits = 0
                NumberFormat = iNumber
                Signal = False
                DataField = 'PRAZORESGATEPREV'
                DataSource = dsDet
              end
              object dbreJurosPrev: TDBRealEdit
                Left = 414
                Top = 118
                Width = 105
                Height = 21
                Alignment = taRightJustify
                Lines.Strings = (
                  '0,00000000')
                TabOrder = 5
                WordWrap = False
                IntDigits = 10
                DecDigits = 8
                NumberFormat = fNumber
                Signal = False
                DataField = 'TXJUROSPREV'
                DataSource = dsDet
              end
              object dbcbReaplica: TDBCheckBox
                Left = 543
                Top = 120
                Width = 74
                Height = 17
                Caption = 'Reaplica'
                DataField = 'FLGREAPLICA'
                DataSource = dsDet
                TabOrder = 6
                ValueChecked = 'S'
                ValueUnchecked = 'N'
              end
              object gbDespesa: TGroupBox
                Left = 320
                Top = 11
                Width = 300
                Height = 78
                Caption = ' Percentual de Despesa '
                TabOrder = 3
                object lblPercCusto: TLabel
                  Left = 18
                  Top = 22
                  Width = 73
                  Height = 13
                  Caption = 's/ Aplicação'
                end
                object lblDespRend: TLabel
                  Left = 170
                  Top = 22
                  Width = 84
                  Height = 13
                  Caption = 's/ Rendimento'
                end
                object dbrePercCusto: TDBRealEdit
                  Left = 18
                  Top = 36
                  Width = 103
                  Height = 21
                  Alignment = taRightJustify
                  Lines.Strings = (
                    '0,00000000')
                  TabOrder = 0
                  WordWrap = False
                  IntDigits = 10
                  DecDigits = 8
                  NumberFormat = fNumber
                  Signal = False
                  DataField = 'PERCUSTO'
                  DataSource = dsDet
                end
                object dbrePercDescRend: TDBRealEdit
                  Left = 170
                  Top = 36
                  Width = 103
                  Height = 21
                  Alignment = taRightJustify
                  Lines.Strings = (
                    '0,00000000')
                  TabOrder = 1
                  WordWrap = False
                  IntDigits = 10
                  DecDigits = 8
                  NumberFormat = fNumber
                  Signal = False
                  DataField = 'PERCUSTOREND'
                  DataSource = dsDet
                end
              end
              object dblcCenario: TCMDBLookupCombo
                Left = 9
                Top = 71
                Width = 297
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'NOMECENARIO'#9'60'#9'Cenário'#9'F')
                DataField = 'IDCENARIO'
                DataSource = dsDet
                Options = [loTitles]
                Style = csDropDownList
                TabOrder = 1
                AutoDropDown = True
                ShowButton = True
                OrderByDisplay = False
                AllowClearKey = True
                ShowMatchText = True
              end
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 742
      end
      inherited Dock974: TDock97
        Left = 656
        Height = 192
      end
    end
  end
  inherited Dock972: TDock97
    Width = 752
  end
  inherited Dock971: TDock97
    Top = 464
    Width = 752
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 504
    Top = 2
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 664
    Top = 224
  end
  inherited ds: TwwDataSource
    Left = 586
    Top = 2
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TIPOAPLICACAO'
      'set'
      '  TIPOAPLICACAO = :TIPOAPLICACAO,'
      '  DESCRICAO = :DESCRICAO,'
      '  FIXAVARIAVEL = :FIXAVARIAVEL,'
      '  TIPORESGATE = :TIPORESGATE,'
      '  MOECODIGO = :MOECODIGO,'
      '  TXJUROSPREV = :TXJUROSPREV,'
      '  PRAZORESGATEPREV = :PRAZORESGATEPREV,'
      '  TIPOAPLICSUBST = :TIPOAPLICSUBST,'
      '  UNIDNEGOC = :UNIDNEGOC,'
      '  IDPESSOA = :IDPESSOA,'
      '  CODCENTRORESPON = :CODCENTRORESPON,'
      '  IDEMPRESA = :IDEMPRESA,'
      '  CODCENTROCUSTO = :CODCENTROCUSTO,'
      '  RECPAG = :RECPAG,'
      '  CODTIPRECDES = :CODTIPRECDES,'
      '  PERCUSTO = :PERCUSTO,'
      '  IDCONTAORCREC = :IDCONTAORCREC,'
      '  IDCONTAORCCUS = :IDCONTAORCCUS,'
      '  IDPLANOORCAMEN = :IDPLANOORCAMEN,'
      '  PERCUSTOREND = :PERCUSTOREND,'
      '  FLGREAPLICA = :FLGREAPLICA,'
      '  CODCORRESP = :CODCORRESP'
      'where'
      '  TIPOAPLICACAO = :OLD_TIPOAPLICACAO')
    InsertSQL.Strings = (
      'insert into TIPOAPLICACAO'
      
        '  (TIPOAPLICACAO, DESCRICAO, FIXAVARIAVEL, TIPORESGATE, MOECODIG' +
        'O, TXJUROSPREV, '
      
        '   PRAZORESGATEPREV, TIPOAPLICSUBST, UNIDNEGOC, IDPESSOA, CODCEN' +
        'TRORESPON, '
      
        '   IDEMPRESA, CODCENTROCUSTO, RECPAG, CODTIPRECDES, PERCUSTO, ID' +
        'CONTAORCREC, '
      
        '   IDCONTAORCCUS, IDPLANOORCAMEN, PERCUSTOREND, FLGREAPLICA, COD' +
        'CORRESP)'
      'values'
      
        '  (:TIPOAPLICACAO, :DESCRICAO, :FIXAVARIAVEL, :TIPORESGATE, :MOE' +
        'CODIGO, '
      
        '   :TXJUROSPREV, :PRAZORESGATEPREV, :TIPOAPLICSUBST, :UNIDNEGOC,' +
        ' :IDPESSOA, '
      
        '   :CODCENTRORESPON, :IDEMPRESA, :CODCENTROCUSTO, :RECPAG, :CODT' +
        'IPRECDES, '
      
        '   :PERCUSTO, :IDCONTAORCREC, :IDCONTAORCCUS, :IDPLANOORCAMEN, :' +
        'PERCUSTOREND, '
      '   :FLGREAPLICA, :CODCORRESP)')
    DeleteSQL.Strings = (
      'delete from TIPOAPLICACAO'
      'where'
      '  TIPOAPLICACAO = :OLD_TIPOAPLICACAO')
    Left = 618
    Top = 2
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TIPOAPLICACAO.DESCRICAO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      '')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'TIPOAPLICACAO')
    CamposChave.Strings = (
      'TIPOAPLICACAO.TIPOAPLICACAO')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    Left = 315
    Top = 2
  end
  inherited ImlPadrao: TImageList
    Left = 249
    Top = 2
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 380
    Top = 2
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '   TIPOAPLICACAO,'
      '   DESCRICAO,'
      '   FIXAVARIAVEL,'
      '   TIPORESGATE,'
      '   MOECODIGO,'
      '   TXJUROSPREV,'
      '   PRAZORESGATEPREV,'
      '   TIPOAPLICSUBST,'
      '   UNIDNEGOC,'
      '   IDPESSOA,'
      '   CODCENTRORESPON,'
      '   IDEMPRESA,'
      '   CODCENTROCUSTO,'
      '   RECPAG,'
      '   CODTIPRECDES,'
      '   PERCUSTO,'
      '   IDCONTAORCREC,'
      '   IDCONTAORCCUS,'
      '   IDPLANOORCAMEN,'
      '   PERCUSTOREND,'
      '   FLGREAPLICA,'
      '   CODCORRESP'
      'FROM'
      '   TIPOAPLICACAO'
      'WHERE'
      '   (TIPOAPLICACAO = :TIPOAPLICACAO)')
    Left = 553
    Top = 2
    ParamData = <
      item
        DataType = ftFloat
        Name = 'TIPOAPLICACAO'
        ParamType = ptInput
      end>
    object qryTIPOAPLICACAO: TFloatField
      FieldName = 'TIPOAPLICACAO'
      Origin = 'BASEDADOS.TIPOAPLICACAO.TIPOAPLICACAO'
    end
    object qryDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.TIPOAPLICACAO.DESCRICAO'
      Size = 60
    end
    object qryFIXAVARIAVEL: TStringField
      FieldName = 'FIXAVARIAVEL'
      Origin = 'BASEDADOS.TIPOAPLICACAO.FIXAVARIAVEL'
      FixedChar = True
      Size = 1
    end
    object qryTIPORESGATE: TStringField
      FieldName = 'TIPORESGATE'
      Origin = 'BASEDADOS.TIPOAPLICACAO.TIPORESGATE'
      FixedChar = True
      Size = 1
    end
    object qryMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'BASEDADOS.TIPOAPLICACAO.MOECODIGO'
    end
    object qryTXJUROSPREV: TFloatField
      FieldName = 'TXJUROSPREV'
      Origin = 'BASEDADOS.TIPOAPLICACAO.TXJUROSPREV'
    end
    object qryPRAZORESGATEPREV: TFloatField
      FieldName = 'PRAZORESGATEPREV'
      Origin = 'BASEDADOS.TIPOAPLICACAO.PRAZORESGATEPREV'
    end
    object qryTIPOAPLICSUBST: TFloatField
      FieldName = 'TIPOAPLICSUBST'
      Origin = 'BASEDADOS.TIPOAPLICACAO.TIPOAPLICSUBST'
    end
    object qryUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Origin = 'BASEDADOS.TIPOAPLICACAO.UNIDNEGOC'
    end
    object qryIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.TIPOAPLICACAO.IDPESSOA'
    end
    object qryCODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      Origin = 'BASEDADOS.TIPOAPLICACAO.CODCENTRORESPON'
      FixedChar = True
      Size = 10
    end
    object qryIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Origin = 'BASEDADOS.TIPOAPLICACAO.IDEMPRESA'
    end
    object qryCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Origin = 'BASEDADOS.TIPOAPLICACAO.CODCENTROCUSTO'
      FixedChar = True
      Size = 10
    end
    object qryRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'BASEDADOS.TIPOAPLICACAO.RECPAG'
      FixedChar = True
      Size = 1
    end
    object qryCODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      Origin = 'BASEDADOS.TIPOAPLICACAO.CODTIPRECDES'
      FixedChar = True
      Size = 15
    end
    object qryPERCUSTO: TFloatField
      FieldName = 'PERCUSTO'
      Origin = 'BASEDADOS.TIPOAPLICACAO.PERCUSTO'
    end
    object qryIDCONTAORCREC: TStringField
      FieldName = 'IDCONTAORCREC'
      Origin = 'BASEDADOS.TIPOAPLICACAO.IDCONTAORCREC'
      Size = 25
    end
    object qryIDCONTAORCCUS: TStringField
      FieldName = 'IDCONTAORCCUS'
      Origin = 'BASEDADOS.TIPOAPLICACAO.IDCONTAORCCUS'
      Size = 25
    end
    object qryIDPLANOORCAMEN: TFloatField
      FieldName = 'IDPLANOORCAMEN'
      Origin = 'BASEDADOS.TIPOAPLICACAO.IDPLANOORCAMEN'
    end
    object qryPERCUSTOREND: TFloatField
      FieldName = 'PERCUSTOREND'
      Origin = 'BASEDADOS.TIPOAPLICACAO.PERCUSTOREND'
    end
    object qryFLGREAPLICA: TStringField
      FieldName = 'FLGREAPLICA'
      Origin = 'BASEDADOS.TIPOAPLICACAO.FLGREAPLICA'
      FixedChar = True
      Size = 1
    end
    object qryCODCORRESP: TStringField
      FieldName = 'CODCORRESP'
      Origin = 'BASEDADOS.TIPOAPLICACAO.CODCORRESP'
    end
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 444
    Top = 2
  end
  object qryUnidNegocio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT UNIDNEGOC, NOME, UNECODIGO'
      'FROM UNIDNEGOCIO'
      'WHERE (IDPESSOA = :IDPESSOA) AND'
      '      (UNETIPO = '#39'A'#39')'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 472
    Top = 72
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryUnidNegocioNOME: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 25
      FieldName = 'NOME'
      Origin = 'UNIDNEGOCIO.NOME'
      Size = 25
    end
    object qryUnidNegocioUNECODIGO: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'UNECODIGO'
      Origin = 'UNIDNEGOCIO.UNECODIGO'
      Size = 10
    end
    object qryUnidNegocioUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Origin = 'UNIDNEGOCIO.UNIDNEGOC'
      Visible = False
    end
  end
  object qryTipoRD: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODTIPRECDES, DESCRICAO'
      'FROM TIPORECEBDESEMB'
      'WHERE (RECPAG = '#39'R'#39') AND'
      '      (ANASINT = '#39'A'#39') AND'
      '      (IDPESSOA = :IDPESSOA)'
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 472
    Top = 120
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryTipoRDDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 35
      FieldName = 'DESCRICAO'
      Origin = 'TIPORECEBDESEMB.DESCRICAO'
      Size = 35
    end
    object qryTipoRDCODTIPRECDES: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 15
      FieldName = 'CODTIPRECDES'
      Origin = 'TIPORECEBDESEMB.CODTIPRECDES'
      Size = 15
    end
  end
  object qryCentroRespon: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODCENTRORESPON, NOME'
      'FROM CENTRESPON'
      'WHERE (IDPESSOA = :IDPESSOA) AND'
      '      (ANALITICOSINTET = '#39'A'#39') AND'
      '      ((ATIVO = '#39'S'#39') OR (ATIVO IS NULL))'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 656
    Top = 72
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryCentroResponNOME: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 30
      FieldName = 'NOME'
      Origin = 'CENTRESPON.NOME'
      Size = 30
    end
    object qryCentroResponCODCENTRORESPON: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'CODCENTRORESPON'
      Origin = 'CENTRESPON.CODCENTRORESPON'
      Size = 10
    end
  end
  object qryCentCust: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODCENTROCUSTO, NOME'
      'FROM CENTCUST'
      'WHERE (IDEMPRESA = :IDPESSOA) AND'
      '      (STATUSGRUPOCDC = '#39'A'#39') AND'
      '      ((ATIVO = '#39'S'#39') OR (ATIVO IS NULL))'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 656
    Top = 120
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryCentCustNOME: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 30
      FieldName = 'NOME'
      Origin = 'CENTCUST.NOME'
      Size = 30
    end
    object qryCentCustCODCENTROCUSTO: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'CODCENTROCUSTO'
      Origin = 'CENTCUST.CODCENTROCUSTO'
      Size = 10
    end
  end
  object qryMoeda: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MOEDESC, MOECODIGO, MOESIGLA '
      'FROM MOEDA'
      'WHERE (MOEINATIVO <> '#39'I'#39')'
      'ORDER BY MOEDESC')
    ValidateWithMask = True
    Left = 264
    Top = 304
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   TA.*,'
      '   MD.MOEDESC,'
      '   CO.NOMECENARIO'
      'FROM'
      '   TipoAplicXCenario TA,'
      '   Moeda MD,'
      '   CenarioOrcamen CO'
      'WHERE'
      '   (TA.IDAplicacao=:IDAplicacao) AND'
      '   (TA.MOECODIGO=MD.MOECODIGO) AND'
      '   (TA.IDCENARIO=CO.IDCENARIOORCAMEN)'
      ''
      ' '
      ' ')
    UpdateObject = upDet
    ValidateWithMask = True
    Left = 629
    Top = 224
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDAplicacao'
        ParamType = ptInput
      end>
    object qryDetMOEDESC: TStringField
      DisplayLabel = 'Moeda'
      DisplayWidth = 32
      FieldName = 'MOEDESC'
      Origin = 'BASEDADOS.MOEDA.MOEDESC'
    end
    object qryDetNOMECENARIO: TStringField
      DisplayLabel = 'Cenário'
      DisplayWidth = 41
      FieldName = 'NOMECENARIO'
      Origin = 'BASEDADOS.CENARIOORCAMEN.NOMECENARIO'
      Size = 60
    end
    object qryDetFLGREAPLICA: TStringField
      DisplayLabel = 'Reaplicação'
      DisplayWidth = 10
      FieldName = 'FLGREAPLICA'
      Origin = 'BASEDADOS.TIPOAPLICXCENARIO.FLGREAPLICA'
      FixedChar = True
      Size = 1
    end
    object qryDetIDAPLICACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDAPLICACAO'
      Origin = 'BASEDADOS.TIPOAPLICXCENARIO.IDAPLICACAO'
      Visible = False
    end
    object qryDetIDCENARIO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCENARIO'
      Origin = 'BASEDADOS.TIPOAPLICXCENARIO.IDCENARIO'
      Visible = False
    end
    object qryDetMOECODIGO: TFloatField
      DisplayWidth = 10
      FieldName = 'MOECODIGO'
      Origin = 'BASEDADOS.TIPOAPLICXCENARIO.MOECODIGO'
      Visible = False
    end
    object qryDetPRAZORESGATEPREV: TFloatField
      DisplayWidth = 10
      FieldName = 'PRAZORESGATEPREV'
      Origin = 'BASEDADOS.TIPOAPLICXCENARIO.PRAZORESGATEPREV'
      Visible = False
    end
    object qryDetTXJUROSPREV: TFloatField
      DisplayWidth = 10
      FieldName = 'TXJUROSPREV'
      Origin = 'BASEDADOS.TIPOAPLICXCENARIO.TXJUROSPREV'
      Visible = False
    end
    object qryDetPERCUSTO: TFloatField
      DisplayWidth = 10
      FieldName = 'PERCUSTO'
      Origin = 'BASEDADOS.TIPOAPLICXCENARIO.PERCUSTO'
      Visible = False
    end
    object qryDetPERCUSTOREND: TFloatField
      DisplayWidth = 10
      FieldName = 'PERCUSTOREND'
      Origin = 'BASEDADOS.TIPOAPLICXCENARIO.PERCUSTOREND'
      Visible = False
    end
    object qryDetTIPOAPLICSUBST: TFloatField
      DisplayWidth = 10
      FieldName = 'TIPOAPLICSUBST'
      Origin = 'BASEDADOS.TIPOAPLICXCENARIO.TIPOAPLICSUBST'
      Visible = False
    end
  end
  object upDet: TUpdateSQL
    ModifySQL.Strings = (
      'update TipoAplicXCenario'
      'set'
      '  IDAPLICACAO = :IDAPLICACAO,'
      '  IDCENARIO = :IDCENARIO,'
      '  MOECODIGO = :MOECODIGO,'
      '  PRAZORESGATEPREV = :PRAZORESGATEPREV,'
      '  TXJUROSPREV = :TXJUROSPREV,'
      '  FLGREAPLICA = :FLGREAPLICA,'
      '  PERCUSTO = :PERCUSTO,'
      '  PERCUSTOREND = :PERCUSTOREND,'
      '  TIPOAPLICSUBST = :TIPOAPLICSUBST'
      'where'
      '  IDAPLICACAO = :OLD_IDAPLICACAO and'
      '  IDCENARIO = :OLD_IDCENARIO')
    InsertSQL.Strings = (
      'insert into TipoAplicXCenario'
      
        '  (IDAPLICACAO, IDCENARIO, MOECODIGO, PRAZORESGATEPREV, TXJUROSP' +
        'REV, FLGREAPLICA, '
      '   PERCUSTO, PERCUSTOREND, TIPOAPLICSUBST)'
      'values'
      
        '  (:IDAPLICACAO, :IDCENARIO, :MOECODIGO, :PRAZORESGATEPREV, :TXJ' +
        'UROSPREV, '
      '   :FLGREAPLICA, :PERCUSTO, :PERCUSTOREND, :TIPOAPLICSUBST)')
    DeleteSQL.Strings = (
      'delete from TipoAplicXCenario'
      'where'
      '  IDAPLICACAO = :OLD_IDAPLICACAO and'
      '  IDCENARIO = :OLD_IDCENARIO')
    Left = 701
    Top = 224
  end
  object qryTipoAplic: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT TIPOAPLICACAO, DESCRICAO'
      'FROM TIPOAPLICACAO'
      'ORDER BY DESCRICAO'
      ' ')
    ValidateWithMask = True
    Left = 173
    Top = 392
    object qryTipoAplicTIPOAPLICACAO: TFloatField
      FieldName = 'TIPOAPLICACAO'
      Origin = 'TIPOAPLICACAO.TIPOAPLICACAO'
    end
    object qryTipoAplicDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TIPOAPLICACAO.DESCRICAO'
      Size = 60
    end
  end
  object qryParamOrc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPLANOORCAMEN'
      'FROM PARAMORCAMENTO'
      'WHERE (IDPESSOA = :IDPESSOA)'
      '')
    ValidateWithMask = True
    Left = 288
    Top = 160
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryParamOrcIDPLANOORCAMEN: TFloatField
      FieldName = 'IDPLANOORCAMEN'
      Origin = 'PARAMORCAMENTO.IDPLANOORCAMEN'
    end
  end
  object qryCenarios: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDCENARIOORCAMEN,'
      '   NOMECENARIO'
      'FROM'
      '   CenarioOrcamen')
    ValidateWithMask = True
    Left = 217
    Top = 346
  end
  object msContaOrcamen: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'CONTASORCAMEN.IDCONTAORCAMEN'
      'CONTASORCAMEN.NOMECONTAORCAMEN'
      'CONTASORCAMEN.TIPOCALCREALIZADO'
      'CONTASORCAMEN.TIPOCALCORCADO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Conta Orçamentária'
      'Descrição'
      'Tipo Calc. Real.'
      'Tipo Calc. Orc.')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CONTASORCAMEN')
    CamposChave.Strings = (
      'CONTASORCAMEN.IDCONTAORCAMEN')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '25'
      '60'
      '1'
      '1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 688
  end
end
