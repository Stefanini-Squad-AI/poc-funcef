inherited FrmAcertaParamContabilFinanc: TFrmAcertaParamContabilFinanc
  Left = 1
  Top = 112
  HelpContext = 180005
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  Caption = 
    'Acerta Parâmetro Contábil e Financeiro dos Lançamentos para Folh' +
    'a de Benefícios'
  ClientHeight = 398
  ClientWidth = 784
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 784
    Height = 312
    inherited pnlControles: TPanel
      Width = 782
      Height = 310
      object Label3: TLabel
        Left = 400
        Top = 218
        Width = 160
        Height = 13
        Caption = 'Centro de Responsabilidade'
      end
      object Label1: TLabel
        Left = 400
        Top = 261
        Width = 55
        Height = 13
        Caption = 'Subconta'
      end
      object lblPatro: TLabel
        Left = 8
        Top = 8
        Width = 80
        Height = 13
        Caption = 'Patrocinadora'
      end
      object lblPlano: TLabel
        Left = 329
        Top = 8
        Width = 118
        Height = 13
        Caption = 'Plano Previdenciário'
      end
      object lblCodRubrica: TLabel
        Left = 8
        Top = 52
        Width = 45
        Height = 13
        Caption = 'Rubrica'
      end
      object lblDescrRubrica: TLabel
        Left = 151
        Top = 52
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object btnBuscaDados: TBitBtn
        Left = 644
        Top = 20
        Width = 122
        Height = 65
        Caption = 'Busca Integração'
        ModalResult = 3
        TabOrder = 1
        OnClick = btnBuscaDadosClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
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
        Layout = blGlyphTop
        NumGlyphs = 2
      end
      object dbEdtDescrRubrica: TwwDBEdit
        Left = 151
        Top = 64
        Width = 466
        Height = 21
        Color = clMenu
        DataField = 'DESCRICAO'
        DataSource = ds
        Enabled = False
        TabOrder = 8
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dblkCentRespon: TwwDBLookupCombo
        Left = 400
        Top = 230
        Width = 363
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'Centro de Responsabilidade'#9'F')
        LookupTable = qryCentRespon
        LookupField = 'CODCENTRORESPON'
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
      object dblkSubConta: TwwDBLookupCombo
        Left = 400
        Top = 274
        Width = 363
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMESUBCONTA'#9'60'#9'Subconta'#9'F')
        LookupTable = qrySubConta
        LookupField = 'CODSUBCONTA'
        TabOrder = 2
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
      object cmpmTipoDesDesc: TCMProcuraMask
        Left = 0
        Top = 212
        Width = 395
        Height = 83
        Caption = ' Tipo de Desembolso para desconto no Contas a Pagar da Folha '
        TabOrder = 3
        MostraMensagens = True
        MostraDescricao = True
        DataSource = ds
        DataField = 'CODTIPRECDES'
        Mensagens.EmBranco = 'Tipo de Desembolso não pode estar em branco'
        Mensagens.NaoExiste = 'Tipo de Desembolso não existe'
        Mensagens.Sintetica = 'Tipo de Desembolso não pode ser sintético'
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
      object grpContaAssoc: TGroupBox
        Left = 0
        Top = 97
        Width = 790
        Height = 107
        Caption = 'Conta Contábil Associada'
        TabOrder = 4
        object Label2: TLabel
          Left = 367
          Top = 16
          Width = 92
          Height = 13
          Caption = 'Centro de Custo'
        end
        object cmbCCusto: TwwDBLookupCombo
          Left = 367
          Top = 32
          Width = 316
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'CODCENTROCUSTO'#9'10'#9'CODCENTROCUSTO'
            'NOME'#9'30'#9'NOME')
          LookupTable = qryCCusto
          LookupField = 'NOME'
          Enabled = False
          ParentFont = False
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
        end
        object GroupBox3: TGroupBox
          Left = 367
          Top = 58
          Width = 316
          Height = 39
          Caption = 'Descrição do Centro de Custo'
          TabOrder = 1
          object lbDescricaoCCusto: TLabel
            Left = 6
            Top = 17
            Width = 298
            Height = 13
            AutoSize = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
        end
        object cmContaAssoc: TCMProcuraMaskContabil
          Left = 4
          Top = 15
          Width = 345
          Height = 82
          Caption = ' Conta Contábil '
          TabOrder = 2
          OnExit = cmContaAssocExit
          MostraMensagens = True
          MostraDescricao = True
          DataSource = ds
          DataField = 'PLACONTAC'
          Mensagens.EmBranco = 'Conta não pode estar em branco'
          Mensagens.NaoExiste = 'Conta não existe'
          Mensagens.Sintetica = 'Conta não pode ser sintética'
          Mensagens.Analitica = 'Conta não pode ser analítica'
          PermiteChaveInvalida = False
          PermiteChaveEmBranco = True
          AceitaTipoConta = SoAnalitica
          Plano = 0
          Status = scSoAtiva
          OnChange = cmContaAssocChange
        end
      end
      object dbEdtPatro: TwwDBEdit
        Left = 8
        Top = 20
        Width = 289
        Height = 21
        Color = clMenu
        DataField = 'PATRO'
        DataSource = ds
        Enabled = False
        TabOrder = 5
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbEdtPlano: TwwDBEdit
        Left = 329
        Top = 20
        Width = 289
        Height = 21
        Color = clMenu
        DataField = 'NOMEPLANO'
        DataSource = ds
        Enabled = False
        TabOrder = 6
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbEdtCodRub: TwwDBEdit
        Left = 8
        Top = 64
        Width = 121
        Height = 21
        Color = clMenu
        DataField = 'IDPROVENTO'
        DataSource = ds
        Enabled = False
        TabOrder = 7
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    inherited dbGrd: TwwDBGrid
      Width = 782
      Height = 310
      MemoAttributes = []
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgWordWrap, dgTrailingEllipsis, dgShowCellHint]
      TitleAlignment = taCenter
      TitleLines = 2
    end
  end
  inherited Dock972: TDock97
    Width = 784
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
    Top = 359
    Width = 784
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 56
    Top = 278
  end
  inherited ds: TwwDataSource
    Left = 299
    Top = 6
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TMPDESC'
      'set'
      '  CODTIPRECDES = :CODTIPRECDES,'
      '  CODSUBCONTA = :CODSUBCONTA,'
      '  PLACONTAD = :PLACONTAD,'
      '  PLACONTAC = :PLACONTAC,'
      '  CODCENTRORESPON = :CODCENTRORESPON,'
      '  CODCENTROCUSTOD = :CODCENTROCUSTOD,'
      '  CODCENTROCUSTOC = :CODCENTROCUSTOC'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPROVENTO = :OLD_IDPROVENTO and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDLOTE = :OLD_IDLOTE'
      ' ')
    InsertSQL.Strings = (
      'insert into TMPDESC'
      '  (CODTIPRECDES, CODSUBCONTA, PLACONTAD, PLACONTAC, '
      'CODCENTRORESPON, CODCENTROCUSTOD, '
      '   CODCENTROCUSTOC)'
      'values'
      '  (:CODTIPRECDES, :CODSUBCONTA, :PLACONTAD, :PLACONTAC, '
      ':CODCENTRORESPON, '
      '   :CODCENTROCUSTOD, :CODCENTROCUSTOC)')
    DeleteSQL.Strings = (
      'delete from TMPDESC'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPROVENTO = :OLD_IDPROVENTO and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDLOTE = :OLD_IDLOTE')
    Left = 339
    Top = 6
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'C.IDLOTE'
      'C.MESREFERENCIA'
      'C.DESCRICAO')
    TipodeDado.Strings = (
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Lote de Pagamento'
      'Mês de Referência'
      'Descrição do Lote')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CTRLINTERFACE C')
    CamposChave.Strings = (
      'C.IDLOTE')
    Filtro.Strings = (
      'C.FLGVOLTATMP = 0 OR C.FLGVOLTATMP IS NULL'
      'C.FLGIDATMP = 1'
      'C.TIPO = '#39'B'#39
      'C.FLGTIPOFOLHA <> 1 AND FLGTIPOFOLHA <> 2')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '7'
      '50')
    Left = 421
    Top = 6
  end
  inherited ImlPadrao: TImageList
    Left = 113
    Top = 278
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 380
    Top = 6
  end
  inherited qry: TwwQuery
    AfterScroll = qryAfterScroll
    SQL.Strings = (
      'SELECT DISTINCT'
      '  T.IDPLANOPREV,'
      '  T.IDPESSJUR,'
      '  PT.NOME AS PATRO,'
      '  P.NOME AS NOMEPLANO,'
      '  TR.CODTIPRECDES,'
      '  T.IDPROVENTO,'
      '  PR.DESCRICAO,'
      '  TR.DESCRICAO AS TIPRECDES,'
      '  PC.PLACONTA AS PLACONTAC,'
      '  PD.PLACONTA AS PLACONTAD,'
      '  PC.PLANOME AS DESCRPLACONTAC,'
      '  PD.PLANOME AS DESCRPLACONTAD,'
      '  S.CODSUBCONTA,'
      '  S.NOMESUBCONTA,'
      '  CR.CODCENTRORESPON,'
      '  CR.NOME AS CENTRO_DE_RESPONSABILIDADE,'
      '  CC.CODCENTROCUSTO AS CODCENTROC,'
      '  CD.CODCENTROCUSTO AS CODCENTROD,'
      '  CC.NOME AS CENTRO_CUSTOC,'
      '  CD.NOME AS CENTRO_CUSTOD'
      ''
      'FROM'
      '  TMPDESC T,'
      '  PLANPREV P,'
      '  PESSOA PT,'
      '  TIPORECEBDESEMB TR,'
      '  PLANOCONTA PC,'
      '  PLANOCONTA PD,'
      '  SUBCONTA S,'
      '  CENTRESPON CR,'
      '  CENTCUST CC,'
      '  CENTCUST CD,'
      '  PROVDESC PR'
      ''
      'WHERE'
      '  T.IDLOTE          = :PIDLOTE              AND'
      '  T.IDPLANOPREV     = P.IDPLANOPREV         AND'
      '  T.IDPESSJUR       = PT.IDPESSOA           AND'
      '  T.CODTIPRECDES    = TR.CODTIPRECDES(+)    AND'
      '  T.RECPAG          = TR.RECPAG(+)          AND'
      '  T.PLANO           = PC.PLANO(+)           AND'
      '  T.PLACONTAC       = PC.PLACONTA(+)        AND'
      '  T.PLANO           = PD.PLANO(+)           AND'
      '  T.PLACONTAD       = PD.PLACONTA(+)        AND'
      '  T.CODSUBCONTA     = S.CODSUBCONTA(+)      AND'
      '  T.CODCENTRORESPON = CR.CODCENTRORESPON(+) AND'
      '  T.CODCENTROCUSTOC = CC.CODCENTROCUSTO(+)  AND'
      '  T.CODCENTROCUSTOD = CD.CODCENTROCUSTO(+)  AND'
      '  T.IDPROVENTO      = PR.IDPROVENTO         AND'
      ' (T.FLGTIPODESC     = '#39'P'#39' OR T.FLGTIPODESC = '#39'C'#39')'
      ''
      'ORDER BY'
      '  PT.NOME '
      ' '
      ' '
      ' '
      ' ')
    Left = 258
    Top = 6
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDLOTE'
        ParamType = ptUnknown
      end>
  end
  object qryCCusto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  C.IDEMPRESA,'
      '  C.CODCENTROCUSTO,'
      '  C.NOME '
      ''
      'FROM '
      '  CENTCUST C, '
      '  CONTASxCC CC'
      ''
      'WHERE '
      '  CC.IDEMPRESA      = :PIDPESSOA       AND '
      '  CC.PLANO          = :PPLANO          AND'
      '  CC.PLACONTA       = :PPLACONTA       AND '
      '  CC.CODCENTROCUSTO = C.CODCENTROCUSTO AND '
      '  CC.IDEMPRESA      = C.IDEMPRESA'
      ' ')
    ValidateWithMask = True
    Left = 504
    Top = 112
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PPLANO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PPLACONTA'
        ParamType = ptUnknown
      end>
  end
  object qryCentRespon: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  CODCENTRORESPON,'
      '  IDPESSOA,'
      '  NOME,'
      '  ANALITICOSINTET,'
      '  IDUSUARIOINCLUSAO,'
      '  RESPONSAVEL,'
      '  ATIVO'
      ''
      'FROM   '
      '  CENTRESPON'
      ''
      'WHERE  '
      '  ATIVO = '#39'S'#39)
    ValidateWithMask = True
    Left = 597
    Top = 164
  end
  object qrySubConta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  CODSUBCONTA,'
      '  IDPESSOA,'
      '  NOMESUBCONTA'
      ''
      'FROM'
      '  SUBCONTA'
      ''
      'ORDER BY'
      '  NOMESUBCONTA')
    ValidateWithMask = True
    Left = 629
    Top = 212
  end
  object qryTipoDesemb: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  CODTIPRECDES,'
      '  IDPESSOA,'
      '  RECPAG,'
      '  DESCRICAO,'
      '  ANASINT'
      ''
      'FROM'
      '  TIPORECEBDESEMB'
      ''
      'WHERE'
      ' (RTRIM(CODTIPRECDES) = :CODTIPRECDES) AND'
      ' (RECPAG              =  '#39'P'#39')'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 263
    Top = 183
    ParamData = <
      item
        DataType = ftString
        Name = 'CODTIPRECDES'
        ParamType = ptUnknown
      end>
  end
  object msTipoDesemb: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'T.CODTIPRECDES'
      'T.DESCRICAO'
      'T.ANASINT')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição'
      'Tipo (A/S)')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'TIPORECEBDESEMB T')
    CamposChave.Strings = (
      'T.CODTIPRECDES'
      'T.RECPAG'
      'T.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '15'
      '35'
      '1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 351
    Top = 183
  end
  object qryRub: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDPROVENTO,'
      '  DESCRICAO,'
      '  FLGDESCONTO,'
      '  FLGOBRIGAFAVOREC'
      ''
      'FROM'
      '  PROVDESC'
      ''
      'WHERE'
      '  IDPROVENTO = :PIDPROVENTO'
      ' ')
    ValidateWithMask = True
    Left = 167
    Top = 186
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPROVENTO'
        ParamType = ptUnknown
      end>
  end
  object qryAtualiza: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 192
    Top = 95
  end
  object qryTmp: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  RPL.CODSUBCONTA,'
      '  RPL.IDPESSJUR,'
      '  RPL.IDRUBRICA,'
      '  RPL.IDPLANOPREV,'
      '  RPL.CODCENTROCUSTOD,'
      '  RPL.UNIDNEGOC,'
      '  RPL.IDEMPRESAPROP,'
      '  RPL.IDEMPRESA,'
      '  RPL.CODTIPRECDES,'
      '  RPL.IDPESSOA,'
      '  RPL.CODCENTROCUSTOC,'
      '  RPL.RECPAG,'
      '  RPL.PLACONTAD,'
      '  RPL.PLANO,'
      '  RPL.PLACONTAC,'
      '  RPL.CODPORTFORMA,'
      '  RPL.CODCENTRORESPON,'
      '  P.DESCRICAO,'
      '  P.FLGDESCONTO,'
      '  RPL.CODTIPRECDESFAV,'
      '  RPL.CODTIPRECDESCAR,'
      '  RPL.CODTIPRECDESFAVCAR'
      ''
      'FROM'
      '  RUBRICAXPLANO RPL,'
      '  PROVDESC P'
      ''
      'WHERE'
      '  RPL.IDPESSJUR   = :IDPESSJUR   AND'
      '  RPL.IDPLANOPREV = :IDPLANOPREV AND'
      '  RPL.IDRUBRICA   = :IDRUBRICA   AND'
      '  P.IDPROVENTO    = RPL.IDRUBRICA'
      ''
      'ORDER BY'
      '  P.DESCRICAO'
      ' '
      ' '
      ' ')
    UpdateObject = updTmp
    ValidateWithMask = True
    Left = 272
    Top = 111
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDRUBRICA'
        ParamType = ptUnknown
      end>
  end
  object dsTmp: TwwDataSource
    DataSet = qryTmp
    Left = 320
    Top = 111
  end
  object updTmp: TUpdateSQL
    InsertSQL.Strings = (
      'insert into RUBRICAXPLANO'
      
        '  (IDPESSJUR, IDRUBRICA, IDPLANOPREV, CODCENTROCUSTOD, UNIDNEGOC' +
        ', '
      'CODSUBCONTA, '
      '   IDEMPRESAPROP, IDPESSOA, IDEMPRESA, RECPAG, CODTIPRECDESFAV, '
      'CODTIPRECDES, '
      '   CODCENTROCUSTOC, PLACONTAD, PLANO, PLACONTAC, CODPORTFORMA, '
      'CODCENTRORESPON, '
      '   CODTIPRECDESCAR, CODTIPRECDESFAVCAR)'
      'values'
      '  (:IDPESSJUR, :IDRUBRICA, :IDPLANOPREV, :CODCENTROCUSTOD, '
      ':UNIDNEGOC, '
      
        '   :CODSUBCONTA, :IDEMPRESAPROP, :IDPESSOA, :IDEMPRESA, :RECPAG,' +
        ' '
      ':CODTIPRECDESFAV, '
      '   :CODTIPRECDES, :CODCENTROCUSTOC, :PLACONTAD, :PLANO, '
      ':PLACONTAC, :CODPORTFORMA, '
      '   :CODCENTRORESPON, :CODTIPRECDESCAR, :CODTIPRECDESFAVCAR)')
    DeleteSQL.Strings = (
      'delete from RUBRICAXPLANO'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDRUBRICA = :OLD_IDRUBRICA and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  CODCENTROCUSTOD = :OLD_CODCENTROCUSTOD and'
      '  UNIDNEGOC = :OLD_UNIDNEGOC and'
      '  CODSUBCONTA = :OLD_CODSUBCONTA and'
      '  IDEMPRESAPROP = :OLD_IDEMPRESAPROP and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDEMPRESA = :OLD_IDEMPRESA and'
      '  RECPAG = :OLD_RECPAG and'
      '  CODTIPRECDESFAV = :OLD_CODTIPRECDESFAV and'
      '  CODTIPRECDES = :OLD_CODTIPRECDES and'
      '  CODCENTROCUSTOC = :OLD_CODCENTROCUSTOC and'
      '  PLACONTAD = :OLD_PLACONTAD and'
      '  PLANO = :OLD_PLANO and'
      '  PLACONTAC = :OLD_PLACONTAC and'
      '  CODPORTFORMA = :OLD_CODPORTFORMA and'
      '  CODCENTRORESPON = :OLD_CODCENTRORESPON and'
      '  CODTIPRECDESCAR = :OLD_CODTIPRECDESCAR and'
      '  CODTIPRECDESFAVCAR = :OLD_CODTIPRECDESFAVCAR')
    Left = 373
    Top = 116
  end
end
