inherited frmCadCtFolha: TfrmCadCtFolha
  Left = 31
  Top = 62
  Caption = 
    'Critérios de Contabilização e Contas a Pagar da Folha por Rubric' +
    'a'
  ClientHeight = 477
  ClientWidth = 743
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 743
    Height = 391
    BorderWidth = 2
    inherited pnlMestre: TPanel
      Left = 4
      Top = 4
      Width = 735
      Height = 56
      object Label2: TLabel
        Left = 10
        Top = 5
        Width = 45
        Height = 13
        Caption = 'Rubrica'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbedDescricao: TwwDBEdit
        Left = 10
        Top = 19
        Width = 455
        Height = 21
        TabStop = False
        DataField = 'DESCRPROVDESC'
        DataSource = ds
        ReadOnly = True
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbrgrpDesconto: TDBRadioGroup
        Left = 479
        Top = 7
        Width = 244
        Height = 41
        Caption = 'Tipo da Rubrica'
        Columns = 3
        DataField = 'FLGDESCONTO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clGray
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Items.Strings = (
          'Provento'
          'Desconto'
          'Outro')
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
        Values.Strings = (
          '0'
          '1'
          '2')
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Left = 4
      Top = 60
      Width = 735
      Height = 327
      Tabs.Strings = (
        'Parametrização')
      inherited pgctrlDetalhe: TPageControl
        Width = 637
        Height = 268
        inherited tbsDet: TTabSheet
          Caption = 'Parametrização'
          inherited dbgrdDet: TwwDBGrid
            Width = 629
            Height = 240
            Selected.Strings = (
              'CONTADEBITO'#9'18'#9'Conta a Débito'
              'CONTACREDITO'#9'19'#9'Conta a Crédito'
              'CODCENTROCUSTO'#9'15'#9'Centro de Custo'
              'CODCENTRORESPON'#9'15'#9'Centro Respons.'
              'UNIDNEGOC'#9'12'#9'Ativ./Projeto')
          end
          inherited pnlControlesDet: TPanel
            Width = 629
            Height = 240
            object pgParams: TPageControl
              Left = 0
              Top = 0
              Width = 629
              Height = 240
              ActivePage = tbshContab
              Align = alClient
              TabOrder = 0
              object tbshContab: TTabSheet
                Caption = 'Contábil'
                object Label4: TLabel
                  Left = 315
                  Top = 98
                  Width = 115
                  Height = 13
                  Caption = 'Sub-Conta a Crédito'
                end
                object Label1: TLabel
                  Left = 60
                  Top = 178
                  Width = 152
                  Height = 13
                  Caption = 'Centro de Custo (opcional)'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label6: TLabel
                  Left = 4
                  Top = 99
                  Width = 112
                  Height = 13
                  Caption = 'Sub-Conta a Débito'
                end
                object CMProcuraMaskContabilDebito: TCMProcuraMaskContabil
                  Left = 4
                  Top = 15
                  Width = 300
                  Height = 75
                  Caption = 'Conta Contábil a Débito'
                  TabOrder = 0
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
                object CMProcuraMaskContabilCredito: TCMProcuraMaskContabil
                  Left = 315
                  Top = 15
                  Width = 300
                  Height = 75
                  Caption = 'Conta Contábil a Crédito'
                  TabOrder = 1
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
                object cmbSubContaD: TwwDBLookupCombo
                  Left = 4
                  Top = 113
                  Width = 300
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOMESUBCONTA'#9'60'#9'NOMESUBCONTA'#9'F')
                  DataField = 'CODSUBDEBITO'
                  DataSource = dsDet
                  LookupTable = qrySubConta
                  LookupField = 'CODSUBCONTA'
                  TabOrder = 2
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                end
                object cmbSubContaC: TwwDBLookupCombo
                  Left = 315
                  Top = 113
                  Width = 300
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOMESUBCONTA'#9'60'#9'Descrição')
                  DataField = 'CODSUBCREDITO'
                  DataSource = dsDet
                  LookupTable = qrySubConta
                  LookupField = 'CODSUBCONTA'
                  TabOrder = 3
                  AutoDropDown = True
                  ShowButton = True
                  UseTFields = False
                  AllowClearKey = True
                end
                object cmbCCusto: TwwDBLookupCombo
                  Left = 232
                  Top = 174
                  Width = 313
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOME'#9'30'#9'NOME'#9'F')
                  DataField = 'CODCENTROCUSTO'
                  DataSource = dsDet
                  LookupTable = qryCCusto
                  LookupField = 'CODCENTROCUSTO'
                  TabOrder = 4
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                end
              end
              object tbshCAP: TTabSheet
                Caption = 'Contas a Pagar'
                ImageIndex = 1
                object CmProcTipDesemb: TCMProcuraMask
                  Left = 3
                  Top = 11
                  Width = 300
                  Height = 80
                  Caption = ' Tipo de Desembolso '
                  TabOrder = 0
                  MostraMensagens = True
                  MostraDescricao = True
                  DataSource = dsDet
                  DataField = 'CODTIPRECDES'
                  Mensagens.EmBranco = 'Tipo de Desembolso não pode estar em branco'
                  Mensagens.NaoExiste = 'Tipo de Desembolso não existe'
                  Mensagens.Sintetica = 'Tipo de Desembolso não pode ser sintética'
                  Mensagens.Analitica = 'Tipo de Desembolso não pode ser analítico'
                  PermiteChaveInvalida = False
                  PermiteChaveEmBranco = True
                  AceitaTipoConta = Indiferente
                  MontaSelect = msTipoDesemb
                  LookupQuery = qryTipoDesemb
                  LookupParam = 'CODTIPRECDES'
                  LookupChave = 'CODTIPRECDES'
                  LookupTipo = 'ANASINT'
                  LookupDescricao = 'DESCRICAO'
                end
                object ProcuraFavorecido: TCMProcuraForCli
                  Left = 318
                  Top = 11
                  Width = 300
                  Height = 80
                  Caption = 'Favorecido'
                  TabOrder = 1
                  CampoEdit = ceRazaoSocial
                  MostraMensagens = False
                  DataSource = dsDet
                  DataField = 'IDFAVORECIDO'
                  Mensagens.EmBranco = 'Favorecido não pode estar em branco'
                  Mensagens.NaoExiste = 'Favorecido não existe'
                  PermiteChaveInvalida = False
                  PermiteChaveEmBranco = True
                  ForCli = fcFornecedor
                  MostraEndereco = False
                  StatusForCli = fcAll
                end
                object CmpCentRespon: TCMProcuraMask
                  Left = 2
                  Top = 119
                  Width = 300
                  Height = 80
                  Caption = ' Centro de Responsabilidade '
                  TabOrder = 2
                  MostraMensagens = True
                  MostraDescricao = True
                  DataSource = dsDet
                  DataField = 'CODCENTRORESPON'
                  Mensagens.EmBranco = 'Centro de Responsabilidade não pode estar em branco'
                  Mensagens.NaoExiste = 'Centro de Responsabilidade não existe'
                  Mensagens.Sintetica = 'Centro de Responsabilidade não pode ser sintética'
                  Mensagens.Analitica = 'Centro de Responsabilidade não pode ser analítico'
                  PermiteChaveInvalida = False
                  PermiteChaveEmBranco = True
                  AceitaTipoConta = SoAnalitica
                  MontaSelect = msCentRespon
                  LookupQuery = qryCentRespon
                  LookupParam = 'CODCENTRORESPON'
                  LookupChave = 'CODCENTRORESPON'
                  LookupTipo = 'ANALITICOSINTET'
                  LookupDescricao = 'NOME'
                end
                object CmpABC: TCMProcuraMask
                  Left = 317
                  Top = 119
                  Width = 300
                  Height = 80
                  Caption = 'Atividade / Projeto'
                  TabOrder = 3
                  MostraMensagens = True
                  MostraDescricao = True
                  DataSource = dsDet
                  DataField = 'UNIDNEGOC'
                  Mensagens.EmBranco = 'Centro de Responsabilidade não pode estar em branco'
                  Mensagens.NaoExiste = 'Centro de Responsabilidade não existe'
                  Mensagens.Sintetica = 'Centro de Responsabilidade não pode ser sintética'
                  Mensagens.Analitica = 'Centro de Responsabilidade não pode ser analítico'
                  PermiteChaveInvalida = False
                  PermiteChaveEmBranco = True
                  AceitaTipoConta = SoAnalitica
                  MontaSelect = msABC
                  LookupQuery = qryABC
                  LookupParam = 'UNIDNEGOC'
                  LookupChave = 'UNIDNEGOC'
                  LookupTipo = 'UNETIPO'
                  LookupDescricao = 'NOME'
                end
              end
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 727
      end
      inherited Dock974: TDock97
        Left = 641
        Height = 268
      end
    end
  end
  inherited Dock972: TDock97
    Width = 743
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
    Top = 438
    Width = 743
    inherited tb97Fundo: TToolbar97
      Left = 574
      DockPos = 581
      inherited sep1: TToolbarSep97
        SizeHorz = 2
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 407
      DockPos = 408
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      
        '  RP.CODPROVDESC, RP.DESCRPROVDESC, PD.FLGDESCONTO, PD.IDPROVENT' +
        'O'
      'FROM'
      '  RUBRICAXPESS RP, PROVDESC PD'
      'WHERE'
      '  (PD.IDPROVENTO = :IDPROVENTO) AND'
      '  (PD.IDPROVENTO = RP.IDRUBRICA)')
    Left = 270
    Top = 1
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPROVENTO'
        ParamType = ptUnknown
      end>
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 404
    Top = 1
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 80
    Top = 2
    TargetsData = (
      1
      1
      (
        ''
        'Items'
        0))
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PROVDESC'
      'set'
      '  FLGDESCONTO = :FLGDESCONTO'
      'where'
      '  IDPROVENTO = :OLD_IDPROVENTO')
    InsertSQL.Strings = (
      'insert into PROVDESC'
      '  (FLGDESCONTO)'
      'values'
      '  (:FLGDESCONTO)')
    DeleteSQL.Strings = (
      'delete from PROVDESC'
      'where'
      '  IDPROVENTO = :OLD_IDPROVENTO')
    Left = 242
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Rubrica'
    Colunas.Strings = (
      'PROVDESC.DESCRICAO'
      'PROVDESC.IDPROVENTO'
      'RUBRICAXPESS.CODPROVDESC')
    TipodeDado.Strings = (
      'C'
      'N'
      'C')
    Descricao.Strings = (
      'Nome da Rubrica'
      'Cód. Interno'
      'Seu Código ')
    Tabelas.Strings = (
      'RUBRICAXPESS'
      'PROVDESC')
    CamposChave.Strings = (
      'PROVDESC.IDPROVENTO')
    Filtro.Strings = (
      'PROVDESC.FLGTPRUBRICA LIKE ('#39'%F%'#39')'
      'PROVDESC.IDPROVENTO = RUBRICAXPESS.IDRUBRICA(+)')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '55'
      '12'
      '12')
    Left = 483
    Top = 1
  end
  inherited ds: TwwDataSource
    Left = 298
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 121
    Top = 2
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 592
    Top = 14
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 592
    Top = 1
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    AfterInsert = qryDetAfterInsert
    BeforePost = qryDetBeforePost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM CONTABFOLHA'
      'WHERE IDPROVENTO = :IDPROVENTO'
      'ORDER BY IDCONTABFOLHA')
    UpdateObject = updDet
    ValidateWithMask = True
    Left = 371
    Top = 1
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPROVENTO'
        ParamType = ptUnknown
      end>
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update CONTABFOLHA'
      'set'
      '  IDEMPRESAPROP = :IDEMPRESAPROP,'
      '  CONTACREDITO = :CONTACREDITO,'
      '  IDPESSDEBITO = :IDPESSDEBITO,'
      '  RECPAG = :RECPAG,'
      '  CODTIPRECDES = :CODTIPRECDES,'
      '  CODSUBCREDITO = :CODSUBCREDITO,'
      '  CODCENTRORESPON = :CODCENTRORESPON,'
      '  IDPLANO1 = :IDPLANO1,'
      '  CONTADEBITO = :CONTADEBITO,'
      '  UNIDNEGOC = :UNIDNEGOC,'
      '  IDPESSCREDITO = :IDPESSCREDITO,'
      '  IDEMPRESA = :IDEMPRESA,'
      '  CODCENTROCUSTO = :CODCENTROCUSTO,'
      '  IDPROVENTO = :IDPROVENTO,'
      '  IDPLANO2 = :IDPLANO2,'
      '  CODSUBDEBITO = :CODSUBDEBITO,'
      '  IDFAVORECIDO = :IDFAVORECIDO'
      'where'
      '  IDCONTABFOLHA = :OLD_IDCONTABFOLHA')
    InsertSQL.Strings = (
      'insert into CONTABFOLHA'
      '  (IDCONTABFOLHA, IDEMPRESAPROP, CONTACREDITO, IDPESSDEBITO, '
      'RECPAG, CODTIPRECDES, '
      '   CODSUBCREDITO, CODCENTRORESPON, IDPLANO1, CONTADEBITO, '
      'UNIDNEGOC, IDPESSCREDITO, '
      '   IDEMPRESA, CODCENTROCUSTO, IDPROVENTO, IDPLANO2, '
      'CODSUBDEBITO, IDFAVORECIDO)'
      'values'
      
        '  (:IDCONTABFOLHA, :IDEMPRESAPROP, :CONTACREDITO, :IDPESSDEBITO,' +
        ' '
      ':RECPAG, '
      '   :CODTIPRECDES, :CODSUBCREDITO, :CODCENTRORESPON, :IDPLANO1, '
      ':CONTADEBITO, '
      '   :UNIDNEGOC, :IDPESSCREDITO, :IDEMPRESA, :CODCENTROCUSTO, '
      ':IDPROVENTO, '
      '   :IDPLANO2, :CODSUBDEBITO, :IDFAVORECIDO)')
    DeleteSQL.Strings = (
      'delete from CONTABFOLHA'
      'where'
      '  IDCONTABFOLHA = :OLD_IDCONTABFOLHA')
    Left = 336
    Top = 1
  end
  object qryPlano: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 686
    Top = 49
  end
  object qryParam: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 686
    Top = 36
    object qryParamPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'PARAMCONTAB.PLANO'
    end
  end
  object dsSubContaD: TwwDataSource
    DataSet = qrySubContaD
    Left = 687
    Top = 384
  end
  object qrySubContaD: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select * from subconta')
    ValidateWithMask = True
    Left = 687
    Top = 370
  end
  object qrySubConta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select * from subconta')
    ValidateWithMask = True
    Left = 618
    Top = 383
  end
  object dsSubConta: TwwDataSource
    DataSet = qrySubConta
    Left = 618
    Top = 370
  end
  object qryCCusto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT NOME, CODCENTROCUSTO '
      'FROM CENTCUST'
      'WHERE IDEMPRESA = 1')
    ValidateWithMask = True
    Left = 686
    Top = 23
  end
  object qryTipoDesemb: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '   TIPORECEBDESEMB.DESCRICAO,'
      '   TIPORECEBDESEMB.ANASINT,'
      '   TIPORECEBDESEMB.CODTIPRECDES,'
      '   TIPORECEBDESEMB.RECPAG,'
      '   TIPORECEBDESEMB.IDPESSOA'
      'FROM'
      '   TIPORECEBDESEMB'
      'WHERE'
      
        '   RTRIM(TIPORECEBDESEMB.CODTIPRECDES) = RTRIM(:CODTIPRECDES) AN' +
        'D  '
      '   TIPORECEBDESEMB.IDPESSOA = :IDPESSOA AND'
      '   TIPORECEBDESEMB.RECPAG = :RECPAG')
    ValidateWithMask = True
    Left = 676
    Top = 319
    ParamData = <
      item
        DataType = ftString
        Name = 'CODTIPRECDES'
        ParamType = ptUnknown
        Value = ''
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'RECPAG'
        ParamType = ptUnknown
      end>
    object qryTipoDesembDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 35
    end
    object qryTipoDesembANASINT: TStringField
      FieldName = 'ANASINT'
      Size = 1
    end
    object qryTipoDesembCODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      Size = 15
    end
    object qryTipoDesembRECPAG: TStringField
      FieldName = 'RECPAG'
      Size = 1
    end
    object qryTipoDesembIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
  end
  object msTipoDesemb: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'TIPORECEBDESEMB.DESCRICAO'
      'TIPORECEBDESEMB.ANASINT')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Descrição'
      'Anal/Sint.')
    Tabelas.Strings = (
      'TIPORECEBDESEMB')
    CamposChave.Strings = (
      'TIPORECEBDESEMB.CODTIPRECDES'
      'TIPORECEBDESEMB.RECPAG'
      'TIPORECEBDESEMB.IDPESSOA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '35'
      '1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 676
    Top = 306
  end
  object qryCentRespon: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CENTRESPON.NOME,'
      '   CENTRESPON.ANALITICOSINTET,'
      '   CENTRESPON.CODCENTRORESPON,'
      '   CENTRESPON.IDPESSOA'
      'FROM'
      '   CENTRESPON'
      'WHERE'
      
        '   RTRIM(CENTRESPON.CODCENTRORESPON) = RTRIM(:CODCENTRORESPON) A' +
        'ND'
      '   CENTRESPON.IDPESSOA = :IDPESSOA')
    ValidateWithMask = True
    Left = 649
    Top = 261
    ParamData = <
      item
        DataType = ftString
        Name = 'CODCENTRORESPON'
        ParamType = ptUnknown
        Value = ''
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryCentResponNOME: TStringField
      FieldName = 'NOME'
      Size = 30
    end
    object qryCentResponANALITICOSINTET: TStringField
      FieldName = 'ANALITICOSINTET'
      Size = 1
    end
    object qryCentResponCODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      Size = 10
    end
    object qryCentResponIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
  end
  object msCentRespon: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'CENTRESPON.NOME'
      'CENTRESPON.ANALITICOSINTET')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Nome do C.Resp.'
      'Anal/Sint.')
    Tabelas.Strings = (
      'CENTRESPON')
    CamposChave.Strings = (
      'CENTRESPON.CODCENTRORESPON'
      'CENTRESPON.IDPESSOA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '30'
      '1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 649
    Top = 248
  end
  object qryABC: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   UNIDNEGOCIO.NOME,'
      '   UNIDNEGOCIO.UNIDNEGOC,'
      '   UNIDNEGOCIO.UNECODIGO,'
      '   UNIDNEGOCIO.IDPESSOA,'
      '   UNIDNEGOCIO.UNETIPO'
      'FROM'
      '   UNIDNEGOCIO'
      'WHERE'
      '   UNIDNEGOCIO.UNIDNEGOC = :UNIDNEGOC AND'
      '   UNIDNEGOCIO.IDPESSOA = :IDPESSOA')
    ValidateWithMask = True
    Left = 709
    Top = 260
    ParamData = <
      item
        DataType = ftInteger
        Name = 'UNIDNEGOC'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryABCNOME: TStringField
      FieldName = 'NOME'
      Size = 25
    end
    object qryABCUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
    end
    object qryABCUNECODIGO: TStringField
      FieldName = 'UNECODIGO'
      Size = 10
    end
    object qryABCIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryABCUNETIPO: TStringField
      FieldName = 'UNETIPO'
      Size = 1
    end
  end
  object msABC: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'UNIDNEGOCIO.NOME'
      'UNIDNEGOCIO.UNECODIGO'
      'UNIDNEGOCIO.UNETIPO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nome da Ativ/Projeto'
      'Código'
      'Tipo')
    Tabelas.Strings = (
      'UNIDNEGOCIO')
    CamposChave.Strings = (
      'UNIDNEGOCIO.UNIDNEGOC'
      'UNIDNEGOCIO.IDPESSOA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '55'
      '12'
      '12')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 709
    Top = 248
  end
  object qryParamGlobal: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  USACRESPON, USAABC, MASCCENTRORESPON, '
      '  MASCUNIDNEGOC '
      'FROM'
      '   PARAMGLOBAL'
      'WHERE '
      '   ( IDPESSOA = :IDPESSOA)')
    ValidateWithMask = True
    Left = 686
    Top = 10
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
end
