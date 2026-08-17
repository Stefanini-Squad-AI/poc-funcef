inherited frmCadCtFolha: TfrmCadCtFolha
  Left = 201
  Top = 114
  HelpContext = 210025
  Caption = 
    'Critérios de Contabilização e Contas a Pagar da Folha por Rubric' +
    'a'
  ClientHeight = 489
  ClientWidth = 784
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 784
    Height = 403
    BorderWidth = 2
    inherited pnlMestre: TPanel
      Left = 2
      Top = 2
      Width = 780
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
        Color = clGray
        DataField = 'DESCRPROVDESC'
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
      Left = 2
      Top = 58
      Width = 780
      Height = 343
      Tabs.Strings = (
        'Parametrização')
      inherited pgctrlDetalhe: TPageControl
        Width = 682
        Height = 284
        inherited tbsDet: TTabSheet
          Caption = 'tbsDet'
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 674
            Height = 256
            Selected.Strings = (
              'CONTADEBITO'#9'18'#9'Conta a Débito'
              'CONTACREDITO'#9'19'#9'Conta a Crédito'
              'CODCENTROCUSTO'#9'15'#9'Centro de Custo'
              'NOME'#9'20'#9'Nome Centro Custo'
              'NOME_CODCENTRORESPON'#9'18'#9'Centro Respons.'
              'NOME_UNIDNEGOC'#9'20'#9'Ativ./Projeto')
            Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect]
            TitleButtons = True
            OnTitleButtonClick = dbgrdDetTitleButtonClick
            OnCalcTitleImage = dbgrdDetCalcTitleImage
            TitleImageList = ImlTitle
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 674
            Height = 256
            object pgParams: TPageControl
              Left = 0
              Top = 0
              Width = 674
              Height = 256
              ActivePage = tbshContab
              Align = alClient
              TabOrder = 0
              object tbshContab: TTabSheet
                Caption = 'Contábil'
                object Label4: TLabel
                  Left = 315
                  Top = 94
                  Width = 115
                  Height = 13
                  Caption = 'Sub-Conta a Crédito'
                end
                object Label1: TLabel
                  Left = 60
                  Top = 173
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
                  Top = 94
                  Width = 112
                  Height = 13
                  Caption = 'Sub-Conta a Débito'
                end
                object Label3: TLabel
                  Left = 60
                  Top = 146
                  Width = 155
                  Height = 13
                  Caption = 'Histórico Padrão (opcional)'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object CMProcuraMaskContabilDebito: TCMProcuraMaskContabil
                  Left = 4
                  Top = 15
                  Width = 300
                  Height = 75
                  Caption = ' Conta Contábil a Débito '
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
                  Caption = ' Conta Contábil a Crédito '
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
                object dblckSubContaD: TwwDBLookupCombo
                  Left = 4
                  Top = 109
                  Width = 300
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOMESUBCONTA'#9'60'#9'NOMESUBCONTA'#9'F')
                  DataField = 'CODSUBDEBITO'
                  DataSource = dsDet
                  LookupTable = CdsSubConta
                  LookupField = 'CODSUBCONTA'
                  Style = csDropDownList
                  TabOrder = 2
                  AutoDropDown = True
                  ShowButton = True
                  UseTFields = False
                  AllowClearKey = True
                  OnChange = dblckSubContaDChange
                end
                object dblckSubContaC: TwwDBLookupCombo
                  Left = 315
                  Top = 109
                  Width = 300
                  Height = 21
                  Cursor = crDrag
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOMESUBCONTA'#9'60'#9'Descrição')
                  DataField = 'CODSUBCREDITO'
                  DataSource = dsDet
                  LookupTable = CdsSubConta
                  LookupField = 'CODSUBCONTA'
                  Style = csDropDownList
                  TabOrder = 3
                  AutoDropDown = True
                  ShowButton = True
                  UseTFields = False
                  AllowClearKey = True
                  OnChange = dblckSubContaCChange
                end
                object dblckCCusto: TwwDBLookupCombo
                  Left = 232
                  Top = 169
                  Width = 384
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOME'#9'30'#9'Centro de Custo'#9'F'
                    'STATUSGRUPOCDC'#9'1'#9'Analítico/Sintético'#9'F')
                  DataField = 'CODCENTROCUSTO'
                  DataSource = dsDet
                  LookupTable = CdsCCusto
                  LookupField = 'CODCENTROCUSTO'
                  Options = [loColLines, loTitles]
                  Style = csDropDownList
                  TabOrder = 4
                  AutoDropDown = True
                  ShowButton = True
                  UseTFields = False
                  AllowClearKey = True
                end
                object dblckHistoricoPadraoCredito: TwwDBLookupCombo
                  Left = 232
                  Top = 138
                  Width = 384
                  Height = 21
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'HITDESCR1'#9'200'#9'HITDESCR1'#9'F')
                  DataField = 'HITCODHISTDEBITO'
                  DataSource = dsDet
                  LookupTable = CdsHistoricoPadrao
                  LookupField = 'HITCODHIST'
                  Style = csDropDownList
                  TabOrder = 5
                  AutoDropDown = True
                  ShowButton = True
                  UseTFields = False
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
                  LookupQuery = CdsTipoDesemb
                  LookupSQLParams = sqlTipoDesemb
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
                  Caption = ' Favorecido '
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
                  MostraStatusCredito = False
                end
                object CmpCentRespon: TCMProcuraMask
                  Left = 2
                  Top = 111
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
                  PermiteChaveInvalida = True
                  PermiteChaveEmBranco = True
                  AceitaTipoConta = SoAnalitica
                  MontaSelect = msCentRespon
                  LookupQuery = CdsCentRespon
                  LookupSQLParams = sqlCentRespon
                  LookupParam = 'CODCENTRORESPON'
                  LookupChave = 'CODCENTRORESPON'
                  LookupTipo = 'ANALITICOSINTET'
                  LookupDescricao = 'NOME'
                end
                object CmpABC: TCMProcuraMask
                  Left = 317
                  Top = 107
                  Width = 300
                  Height = 80
                  Caption = ' Atividade / Projeto '
                  TabOrder = 3
                  MostraMensagens = True
                  MostraDescricao = True
                  DataSource = dsDet
                  DataField = 'UNIDNEGOC'
                  Mensagens.EmBranco = 'Centro de Responsabilidade não pode estar em branco'
                  Mensagens.NaoExiste = 'Centro de Responsabilidade não existe'
                  Mensagens.Sintetica = 'Centro de Responsabilidade não pode ser sintética'
                  Mensagens.Analitica = 'Centro de Responsabilidade não pode ser analítico'
                  PermiteChaveInvalida = True
                  PermiteChaveEmBranco = True
                  AceitaTipoConta = SoAnalitica
                  Mascara = '#####'
                  MontaSelect = msABC
                  LookupQuery = CdsABC
                  LookupSQLParams = sqlABC
                  LookupParam = 'UNIDNEGOC'
                  LookupChave = 'UNIDNEGOC'
                  LookupTipo = 'UNETIPO'
                  LookupDescricao = 'CODNOME'
                end
              end
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 772
      end
      inherited Dock974: TDock97
        Left = 686
        Height = 284
      end
    end
  end
  inherited Dock972: TDock97
    Width = 784
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Enabled = False
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Enabled = False
        Visible = False
      end
      object sbtnProcurarCAP: TToolbarButton97
        Left = 351
        Top = 0
        Width = 90
        Height = 41
        Hint = 'Procurar Rubricas de acordo com sua parametrização CAP'
        AllowAllUp = True
        GroupIndex = 1
        Caption = '&Procurar CAP'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333CCCCC33
          33333FFFF77777FFFFFFCCCCCC808CCCCCC3777777F7F777777F008888070888
          8003777777777777777F0F0770F7F0770F0373F33337F333337370FFFFF7FFFF
          F07337F33337F33337F370FFFB99FBFFF07337F33377F33337F330FFBF99BFBF
          F033373F337733333733370BFBF7FBFB0733337F333FF3337F33370FBF98BFBF
          0733337F3377FF337F333B0BFB990BFB03333373FF777FFF73333FB000B99000
          B33333377737777733333BFBFBFB99FBF33333333FF377F333333FBF99BF99BF
          B333333377F377F3333333FB99FB99FB3333333377FF77333333333FB9999FB3
          333333333777733333333333FBFBFB3333333333333333333333}
        ImageIndex = 3
        Images = ImlPadrao
        Layout = blGlyphTop
        Opaque = False
        ParentShowHint = False
        ShowHint = True
        Spacing = 0
        OnClick = sbtnProcurarClick
      end
      object sbtnProcurarContab: TToolbarButton97
        Left = 240
        Top = 0
        Width = 111
        Height = 41
        Hint = 'Procurar Rubricas de acordo com sua parametrização Contábil'
        AllowAllUp = True
        GroupIndex = 1
        Caption = '&Procurar Contábil'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333CCCCC33
          33333FFFF77777FFFFFFCCCCCC808CCCCCC3777777F7F777777F008888070888
          8003777777777777777F0F0770F7F0770F0373F33337F333337370FFFFF7FFFF
          F07337F33337F33337F370FFFB99FBFFF07337F33377F33337F330FFBF99BFBF
          F033373F337733333733370BFBF7FBFB0733337F333FF3337F33370FBF98BFBF
          0733337F3377FF337F333B0BFB990BFB03333373FF777FFF73333FB000B99000
          B33333377737777733333BFBFBFB99FBF33333333FF377F333333FBF99BF99BF
          B333333377F377F3333333FB99FB99FB3333333377FF77333333333FB9999FB3
          333333333777733333333333FBFBFB3333333333333333333333}
        ImageIndex = 3
        Images = ImlPadrao
        Layout = blGlyphTop
        Opaque = False
        ParentShowHint = False
        ShowHint = True
        Spacing = 0
        OnClick = sbtnProcurarClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 450
    Width = 784
    inherited tb97Fundo: TToolbar97
      Left = 581
      DockPos = 581
      inherited sep1: TToolbarSep97
        SizeHorz = 2
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 408
      DockPos = 408
    end
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
  inherited ds: TwwDataSource
    Left = 286
    Top = 57
  end
  inherited ImlPadrao: TImageList
    Left = 121
    Top = 2
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyEdit = CmeCadastroApplyEdit
    Left = 680
    Top = 14
  end
  inherited Cds: TCMClientDataSet
    Left = 242
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Rubrica'
    Colunas.Strings = (
      'RUBRICAXPESS.DESCRPROVDESC'
      'RUBRICAXPESS.IDRUBRICA'
      'RUBRICAXPESS.CODPROVDESC')
    TipodeDado.Strings = (
      'C'
      'N'
      'C')
    Descricao.Strings = (
      'Nome da Rubrica'
      'Cód. Interno'
      'Seu Código ')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'RUBRICAXPESS'
      'PROVDESC')
    CamposChave.Strings = (
      'RUBRICAXPESS.IDRUBRICA')
    Filtro.Strings = (
      'PROVDESC.FLGTPRUBRICA LIKE ('#39'%F%'#39')'
      'PROVDESC.IDPROVENTO = RUBRICAXPESS.IDRUBRICA')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '55'
      '12'
      '12')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1')
    LookupSQL.Strings = (
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      '')
    Left = 459
    Top = 264
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 712
    Top = 65533
  end
  inherited dsDet: TwwDataSource
    DataSet = CdsDet
    OnStateChange = dsDetStateChange
    Left = 392
    Top = 9
  end
  object dsSubContaD: TwwDataSource
    AutoEdit = False
    DataSet = CdsSubContaD
    Left = 536
    Top = 15
  end
  object dsSubConta: TwwDataSource
    AutoEdit = False
    DataSet = CdsSubConta
    Left = 610
    Top = 15
  end
  object msTipoDesemb: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'TIPORECEBDESEMB.DESCRICAO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'TIPORECEBDESEMB'
      'TRDXCRESPON')
    CamposChave.Strings = (
      'TIPORECEBDESEMB.CODTIPRECDES'
      'TIPORECEBDESEMB.RECPAG'
      'TIPORECEBDESEMB.IDPESSOA')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '35')
    OperComparador.Strings = (
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      '')
    LookupCampoChave.Strings = (
      '')
    LookupCampoExibe.Strings = (
      '')
    Left = 669
    Top = 210
  end
  object msCentRespon: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Centro de Responsabilidade'
    Colunas.Strings = (
      'CENTRESPON.CODCENTRORESPON'
      'CENTRESPON.NOME'
      
        'DECODE(CENTRESPON.ANALITICOSINTET, '#39'A'#39', '#39'ANALÍTICO'#39', '#39'SINTÉTICO'#39 +
        ')')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Nome'
      'Anal. / Sint.')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CENTRESPON')
    CamposChave.Strings = (
      'CENTRESPON.CODCENTRORESPON'
      'CENTRESPON.IDPESSOA')
    Filtro.Strings = (
      'CENTRESPON.ATIVO = '#39'S'#39)
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '30'
      '30')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      '')
    Left = 661
    Top = 365
  end
  object msABC: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'UNIDNEGOCIO.NOME'
      'UNIDNEGOCIO.UNECODIGO')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Nome da Ativ/Projeto'
      'Código')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'UNIDNEGOCIO')
    CamposChave.Strings = (
      'UNIDNEGOCIO.UNIDNEGOC'
      'UNIDNEGOCIO.IDPESSOA')
    Filtro.Strings = (
      'UNIDNEGOCIO.UNETIPO = '#39'A'#39
      'UNIDNEGOCIO.ATIVO = '#39'S'#39)
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '55'
      '12')
    OperComparador.Strings = (
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      '')
    Left = 741
    Top = 287
  end
  object msContab: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Rubrica com Parametrização Contábil'
    Colunas.Strings = (
      'RUBRICAXPESS.DESCRPROVDESC'
      'RUBRICAXPESS.IDRUBRICA'
      'RUBRICAXPESS.CODPROVDESC'
      'CONTABFOLHA.CONTADEBITO'
      'CONTA_D.PLANOME'
      'SUBCONTA_D.NOMESUBCONTA'
      'CONTABFOLHA.CONTACREDITO'
      'CONTA_C.PLANOME'
      'SUBCONTA_C.NOMESUBCONTA'
      'CENTCUST.CODCENTROCUSTO'
      'CENTCUST.NOME')
    TipodeDado.Strings = (
      'C'
      'N'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nome da Rubrica'
      'Cód. Interno'
      'Seu Código'
      'Código Conta Débito'
      'Nome Conta Débito'
      'Sub-Conta Débito'
      'Código Conta Crédito'
      'Nome Conta Crédito'
      'Sub-Conta a Crédito'
      'Código C. Custo'
      'Nome  C. Custo')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    CamposChave.Strings = (
      'RUBRICAXPESS.IDRUBRICA')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '55'
      '12'
      '15'
      '18'
      '30'
      '35'
      '18'
      '30'
      '35'
      '10'
      '30')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 717
    Top = 188
  end
  object msCAP: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Rubrica com Parametrização CAP'
    Colunas.Strings = (
      'RUBRICAXPESS.DESCRPROVDESC'
      'RUBRICAXPESS.IDRUBRICA'
      'RUBRICAXPESS.CODPROVDESC'
      'TIPORECEBDESEMB.CODTIPRECDES'
      'TIPORECEBDESEMB.DESCRICAO'
      'PESSOA.RAZAOSOCIAL'
      'CENTRESPON.CODCENTRORESPON'
      'CENTRESPON.NOME'
      'UNIDNEGOCIO.UNECODIGO'
      'UNIDNEGOCIO.NOME')
    TipodeDado.Strings = (
      'C'
      'N'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nome da Rubrica'
      'Cód. Interno'
      'Seu Código'
      'Código Tipo de Desemb.'
      'Nome Tipo de Desemb.'
      'Favorecido (Razão Soc.)'
      'Código Centro Respon.'
      'Nome do Centro Respon.'
      'Código da Ativ./Projeto'
      'Nome da Ativ./Projeto')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'RUBRICAXPESS'
      'CONTABFOLHA'
      'PROVDESC'
      'TIPORECEBDESEMB')
    CamposChave.Strings = (
      'RUBRICAXPESS.IDRUBRICA')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '55'
      '12'
      '15'
      '15'
      '35'
      '60'
      '10'
      '30'
      '15'
      '25')
    OperComparador.Strings = (
      '1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 677
    Top = 162
  end
  object CdsDet: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'CdsDetIndex'
        Fields = 'IDCONTABFOLHA'
      end>
    Params = <>
    StoreDefs = True
    BeforePost = CdsDetBeforePost
    Left = 314
    Top = 1
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
    Left = 458
    Top = 1
  end
  object CdsSubConta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 610
    Top = 1
  end
  object CdsSubContaD: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 536
    Top = 1
  end
  object CdsParamGlobal: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 618
    Top = 265
  end
  object CdsABC: TCMClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    Left = 573
    Top = 202
  end
  object CdsTipoDesemb: TCMClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftString
        Name = 'RECPAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    Left = 250
    Top = 81
  end
  object CdsCentRespon: TCMClientDataSet
    Aggregates = <>
    Params = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    Left = 344
    Top = 72
  end
  object sqlABC: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   NOME, UNIDNEGOC, UNECODIGO, IDPESSOA, UNETIPO,'
      ' UNECODIGO ||'#39' - '#39'|| NOME CODNOME'
      'FROM'
      '   UNIDNEGOCIO'
      'WHERE'
      '   (TO_CHAR(UNIDNEGOC) = :UNIDNEGOC)'
      '   AND'
      '   (IDPESSOA = :IDPESSOA)'
      '   AND UNETIPO = '#39'A'#39
      '   AND ATIVO = '#39'S'#39
      ' '
      ''
      ''
      ' ')
    ClientDataSet = CdsABC
    Left = 493
    Top = 156
  end
  object sqlCentRespon: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  NOME, ANALITICOSINTET, CODCENTRORESPON, IDPESSOA'
      'FROM'
      '  CENTRESPON'
      'WHERE'
      '  (RTRIM(CODCENTRORESPON) = RTRIM(:CODCENTRORESPON)) AND'
      '  (IDPESSOA               = :IDPESSOA)'
      '  AND ATIVO = '#39'S'#39)
    ClientDataSet = CdsCentRespon
    Left = 376
    Top = 178
  end
  object sqlTipoDesemb: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '  DESCRICAO, ANASINT, CODTIPRECDES, RECPAG, IDPESSOA'
      'FROM'
      '  TIPORECEBDESEMB'
      'WHERE'
      '  (RTRIM(CODTIPRECDES) = RTRIM(:CODTIPRECDES)) AND'
      '  (IDPESSOA            = :IDPESSOA) AND'
      '  (RECPAG              = :RECPAG)')
    ClientDataSet = CdsTipoDesemb
    Left = 178
    Top = 51
  end
  object CdsHistoricoPadrao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 602
    Top = 144
  end
  object CdsCtaCusto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 402
    Top = 89
  end
  object cdsAux: TCMClientDataSet
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
    Left = 210
    Top = 153
  end
  object ImlTitle: TImageList
    Left = 428
    Top = 176
    Bitmap = {
      494C010102000400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000FFFFFF00FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000008484840084848400FFFFFF00FFFFFF000000
      0000000000000000000000000000000000000000000000000000848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400FFFFFF000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000084848400848484008484840084848400FFFFFF00FFFF
      FF00000000000000000000000000000000000000000000000000000000008484
      840084848400848484008484840084848400848484008484840084848400FFFF
      FF00000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000008484840084848400848484008484840084848400848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484008484840084848400848484008484840084848400FFFFFF000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000848484008484840084848400848484008484840084848400848484008484
      8400000000000000000000000000000000000000000000000000000000000000
      00000000000084848400848484008484840084848400FFFFFF00000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484000000000000000000000000000000000000000000000000000000
      000000000000000000008484840084848400FFFFFF0000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF00FFFFFFFF00000000FFFFFFFF00000000
      FFFFFFFF00000000FFFFFFFF00000000FFFFFFFF00000000FF3FFFFF00000000
      FE1FC00700000000FC0FE00F00000000F81FF01F00000000F00FF83F00000000
      E007FC7F00000000FFFFFFFF00000000FFFFFFFF00000000FFFFFFFF00000000
      FFFFFFFF00000000FFFFFFFF0000000000000000000000000000000000000000
      000000000000}
  end
end
