inherited FrmHabilitacaoBenefINSS: TFrmHabilitacaoBenefINSS
  Left = 296
  Top = 260
  Caption = 'Habilitação de Benefícios do INSS'
  ClientHeight = 224
  ClientWidth = 488
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock971: TDock97 [0]
    Top = 185
    Width = 488
    inherited tb97Fundo: TToolbar97
      Left = 316
      inherited bbtnAjuda: TmaHelpBitBtn
        Visible = False
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 147
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited pnlFundo: TPanel [1]
    Width = 488
    Height = 138
    object Label1: TLabel
      Left = 8
      Top = 16
      Width = 72
      Height = 13
      Caption = 'Identificador'
    end
    object Label2: TLabel
      Left = 104
      Top = 16
      Width = 361
      Height = 13
      Caption = 'Descrição da Situação para Habilitação de Benefícios do INSS'
    end
    object DbrBenefIdentificado: TDBRadioGroup
      Left = 9
      Top = 65
      Width = 472
      Height = 52
      BiDiMode = bdLeftToRight
      Caption = 'Benefício Identificado '
      DataField = 'FLGHABILITACAOINSS'
      DataSource = dsHabitaBenef
      Items.Strings = (
        'Não'
        'Sim')
      ParentBiDiMode = False
      TabOrder = 0
      Values.Strings = (
        '0'
        '1')
    end
    object EdtIdentificador: TDBEdit
      Left = 8
      Top = 32
      Width = 73
      Height = 21
      Color = clActiveBorder
      DataField = 'IDSITHABILITACAO'
      DataSource = dsHabitaBenef
      Enabled = False
      TabOrder = 1
    end
    object EdtDescSitHabINSS: TDBEdit
      Left = 104
      Top = 32
      Width = 377
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = dsHabitaBenef
      TabOrder = 2
    end
  end
  inherited Dock972: TDock97 [2]
    Width = 488
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        OnClick = sbtnInserirClick
      end
      inherited sbtnAlterar: TToolbarButton97
        Enabled = False
        OnClick = sbtnAlterarClick
      end
      inherited sbtnProcurar: TToolbarButton97
        OnClick = sbtnProcurarClick
      end
      inherited sbtnApagar: TToolbarButton97
        Enabled = False
        OnClick = sbtnApagarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 552
    Top = 62
  end
  inherited ds: TwwDataSource
    Left = 376
    Top = 4
  end
  inherited ImlPadrao: TImageList
    Left = 536
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 552
    Top = 131
  end
  object MS: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'SITHABILITACAOINSS.IDSITHABILITACAO'
      'SITHABILITACAOINSS.DESCRICAO')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'SITHABILITACAOINSS')
    CamposChave.Strings = (
      'SITHABILITACAOINSS.IDSITHABILITACAO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '40')
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
    Left = 416
    Top = 7
  end
  object qryHabitaBenef: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT * FROM SITHABILITACAOINSS WHERE IDSITHABILITACAO =:IDSITH' +
        'AB AND FLGHABILITACAOINSS IN (0,1)')
    UpdateObject = updHabitaBenef
    ValidateWithMask = False
    Left = 400
    Top = 135
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDSITHAB'
        ParamType = ptInput
      end>
  end
  object dsHabitaBenef: TwwDataSource
    DataSet = qryHabitaBenef
    Left = 280
    Top = 135
  end
  object qry: TUpdateSQL
    ModifySQL.Strings = (
      'update BENEFPLANPREV'
      'set'
      '       IDPLANOPREV = :IDPLANOPREV,'
      '       IDBENEFICIO = :IDBENEFICIO,'
      '       FLGABONOFINALBEN = :FLGABONOFINALBEN,'
      '       FLGACEITAOPCAO = :FLGACEITAOPCAO,'
      '       FLGCALCTODOMES = :FLGCALCTODOMES,'
      '       FLGCORRECAOATRASO = :FLGCORRECAOATRASO,'
      '       FLGCORRECAODEVOL = :FLGCORRECAODEVOL,'
      '       FLGEDITAOP1 = :FLGEDITAOP1,'
      '       FLGEDITAOP2 = :FLGEDITAOP2,'
      '       FLGEDITAOP3 = :FLGEDITAOP3,'
      '       FLGOBRIGANPROC = :FLGOBRIGANPROC,'
      '       FLGOBRIGAOP1 = :FLGOBRIGAOP1,'
      '       FLGOBRIGAOP2 = :FLGOBRIGAOP2,'
      '       FLGOBRIGAOP3 = :FLGOBRIGAOP3,'
      '       FLGPOSSUIABONO = :FLGPOSSUIABONO,'
      '       FLGQUITAASSISTEN = :FLGQUITAASSISTEN,'
      '       FLGQUITAEMPRESTI = :FLGQUITAEMPRESTI,'
      '       FLGQUITAPREVIDEN = :FLGQUITAPREVIDEN,'
      '       FLGRECALCULAFIM = :FLGRECALCULAFIM,'
      '       FLGREFERENCIA = :FLGREFERENCIA,'
      '       IDBENEFREF = :IDBENEFREF,'
      '       IDPLANOBENEFREF = :IDPLANOBENEFREF,'
      '       IDREGRABENEFICIA = :IDREGRABENEFICIA,'
      '       CODALTERADORCORR = :CODALTERADORCORR,'
      '       IDREGRACALCABONO = :IDREGRACALCABONO,'
      '       IDREGRACALCINSS = :IDREGRACALCINSS,'
      '       IDREGRACALCOP1 = :IDREGRACALCOP1,'
      '       IDREGRACALCOP2 = :IDREGRACALCOP2,'
      '       IDREGRACALCOP3 = :IDREGRACALCOP3,'
      '       IDREGRACALCULO = :IDREGRACALCULO,'
      '       IDREGRAELEGIBILI = :IDREGRAELEGIBILI,'
      '       IDREGRAFIM = :IDREGRAFIM,'
      '       IDREGRAINICIO = :IDREGRAINICIO,'
      '       IDREGRAPAGAATRASO = :IDREGRAPAGAATRASO,'
      '       IDREGRAPAGAMENTO = :IDREGRAPAGAMENTO,'
      '       IDREGRAPRIMPAGTO = :IDREGRAPRIMPAGTO,'
      '       IDREGRASIMULA = :IDREGRASIMULA,'
      '       IDREGRAULTPAGTO = :IDREGRAULTPAGTO,'
      '       IDREGRAVALIDAOP1 = :IDREGRAVALIDAOP1,'
      '       IDREGRAVALIDAOP2 = :IDREGRAVALIDAOP2,'
      '       IDREGRAVALIDAOP3 = :IDREGRAVALIDAOP3,'
      '       IDRGVALORTOTAL = :IDRGVALORTOTAL,'
      '       IDRUBABONO = :IDRUBABONO,'
      '       IDRUBANTECABONO = :IDRUBANTECABONO,'
      '       IDRUBDESCANTECAB = :IDRUBDESCANTECAB,'
      '       IDRUBDEVOLUCAO = :IDRUBDEVOLUCAO,'
      '       IDRUBRICA = :IDRUBRICA,'
      '       IDRUBRICACORRECAO = :IDRUBRICACORRECAO,'
      '       IDRUBRICADIF = :IDRUBRICADIF,'
      '       INDICEREAJBENEF = :INDICEREAJBENEF,'
      '       NOMEVALORBASE1 = :NOMEVALORBASE1,'
      '       NOMEVALORBASE2 = :NOMEVALORBASE2,'
      '       NOMEVALORBASE3 = :NOMEVALORBASE3,'
      '       NUMOPCOES = :NUMOPCOES,'
      '       PRAZOCONCESSAO = :PRAZOCONCESSAO,'
      '       TPMODALIDADE = :TPMODALIDADE,'
      '       FLGBENEFINF = :FLGBENEFINF,'
      '       IDRUBRICAATRASO = :IDRUBRICAATRASO,'
      '       IDRUBRICAREVISAO = :IDRUBRICAREVISAO,'
      '       FLGDATAINDICERES = :FLGDATAINDICERES,'
      '       FLGUSAEVOLFUNC = :FLGUSAEVOLFUNC,'
      '       FLGPAGAINSS = :FLGPAGAINSS,'
      '       FLGPAGAINTEG = :FLGPAGAINTEG,'
      '       IDRELATBENEFICIO = :IDRELATBENEFICIO,'
      '       ORIGEMCMBENEFICIO = :ORIGEMCMBENEFICIO,'
      '       IDREGRABENEFMIN = :IDREGRABENEFMIN,'
      '       IDREGRASRB = :IDREGRASRB,'
      '       FLGACEITAACERTO = :FLGACEITAACERTO,'
      '       IDRUBDEVOLABONO = :IDRUBDEVOLABONO,'
      '       IDRUBADIANT = :IDRUBADIANT,'
      '       IDRUBDEVOLADIANT = :IDRUBDEVOLADIANT,'
      '       IDRUBADIANT13 = :IDRUBADIANT13,'
      '       IDRUBDEVADIANT13 = :IDRUBDEVADIANT13,'
      '       FLGACEITAZERO = :FLGACEITAZERO,'
      '       IDRUBACJUD = :IDRUBACJUD,'
      '       IDRUBATRACJUD = :IDRUBATRACJUD,'
      '       IDRUBDEVACJUD = :IDRUBDEVACJUD,'
      '       IDRUBREVACJUD = :IDRUBREVACJUD,'
      '       IDRUBADTACJUD = :IDRUBADTACJUD,'
      '       IDRUBDADACJUD = :IDRUBDADACJUD,'
      '       IDRUB13ACJUD = :IDRUB13ACJUD,'
      '       IDRUB13DESACJUD = :IDRUB13DESACJUD,'
      '       IDRUB13PGAN1ACJUD = :IDRUB13PGAN1ACJUD,'
      '       IDRUB13DVANACJUD = :IDRUB13DVANACJUD,'
      '       IDRUB13ADTACJUD = :IDRUB13ADTACJUD,'
      '       IDRUB13DADACJUD = :IDRUB13DADACJUD,'
      '       IDREGRADTINDRES = :IDREGRADTINDRES,'
      '       IDRGDATAELEG = :IDRGDATAELEG,'
      '       IDRGVALORPREV = :IDRGVALORPREV,'
      '       FLGACTVLRSRB = :FLGACTVLRSRB,'
      '       FLGACTVLRATUAL = :FLGACTVLRATUAL,'
      '       FLGACTVLRTOTBEN = :FLGACTVLRTOTBEN,'
      '       FLGTPBUSCAVALOR = :FLGTPBUSCAVALOR,'
      '       FLGMOVRESAPOSCONC = :FLGMOVRESAPOSCONC,'
      '       IDRGPLANPREVCONT = :IDRGPLANPREVCONT,'
      '       LIMITEALT = :LIMITEALT,'
      '       PERCENTUALALT = :PERCENTUALALT,'
      '       USUARIOALT     = :USUARIOALT,'
      '       NUMDIASBENEFANT = :NUMDIASBENEFANT,'
      '       IDRUBACERTOABONO = :IDRUBACERTOABONO,'
      '       IDRUBDEVANTABONO = :IDRUBDEVANTABONO,'
      '       IDRUBATRASOABONO = :IDRUBATRASOABONO  ,'
      '       IDRUBATR13ACJUD = :IDRUBATR13ACJUD  ,  '
      '       IDRUBDEV13ACJUD = :IDRUBDEV13ACJUD   , '
      '       IDRUBATRREVACJUD =  :IDRUBATRREVACJUD   ,  '
      '       IDRUBDEVREVACJUD =  :IDRUBDEVREVACJUD   ,   '
      '       IDRUBATRREVISAO =   :IDRUBATRREVISAO  ,  '
      '       IDRUBDEVREVISAO  =  :IDRUBDEVREVISAO ,'
      '       IDREGRAQUITANT   = :IDREGRAQUITANT,'
      '       IDRUBRICAQUITANT = :IDRUBRICAQUITANT,'
      '       FLGDESINDRES     = :FLGDESINDRES,'
      '       IDRUBNORADICJUD  = :IDRUBNORADICJUD,'
      '       IDRUBATRADICJUD  = :IDRUBATRADICJUD,'
      '       IDRUBDEVADICJUD  = :IDRUBDEVADICJUD,'
      '       FLGHABILITAINSS =: FLGHABILITAINSS'
      'where'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO'
      '')
    InsertSQL.Strings = (
      'insert into BENEFPLANPREV ('
      
        '       IDPLANOPREV,          IDBENEFICIO,             FLGABONOFI' +
        'NALBEN,'
      '       FLGACEITAOPCAO,       FLGCALCTODOMES,'
      
        '       FLGCORRECAOATRASO,    FLGCORRECAODEVOL,        FLGEDITAOP' +
        '1,'
      
        '       FLGEDITAOP2,          FLGEDITAOP3,             FLGOBRIGAN' +
        'PROC,'
      
        '       FLGOBRIGAOP1,         FLGOBRIGAOP2,            FLGOBRIGAO' +
        'P3,'
      
        '       FLGPOSSUIABONO,       FLGQUITAASSISTEN,        FLGQUITAEM' +
        'PRESTI,'
      
        '       FLGQUITAPREVIDEN,     FLGRECALCULAFIM,         FLGREFEREN' +
        'CIA,'
      '       IDBENEFREF,           IDPLANOBENEFREF,'
      '       IDREGRABENEFICIA,     CODALTERADORCORR,'
      
        '       IDREGRACALCABONO,     IDREGRACALCINSS,         IDREGRACAL' +
        'COP1,'
      
        '       IDREGRACALCOP2,       IDREGRACALCOP3,          IDREGRACAL' +
        'CULO,'
      
        '       IDREGRAELEGIBILI,     IDREGRAFIM,              IDREGRAINI' +
        'CIO,'
      '       IDREGRAPAGAATRASO,    IDREGRAPAGAMENTO,'
      '       IDREGRAPRIMPAGTO,     IDREGRASIMULA,'
      '       IDREGRAULTPAGTO,      IDREGRAVALIDAOP1,'
      '       IDREGRAVALIDAOP2,     IDREGRAVALIDAOP3,'
      
        '       IDRGVALORTOTAL,       IDRUBABONO,              IDRUBANTEC' +
        'ABONO,'
      '       IDRUBDESCANTECAB,     IDRUBDEVOLUCAO,          IDRUBRICA,'
      '       IDRUBRICACORRECAO,    IDRUBRICADIF,'
      '       INDICEREAJBENEF,      NOMEVALORBASE1,'
      '       NOMEVALORBASE2,       NOMEVALORBASE3,          NUMOPCOES,'
      
        '       PRAZOCONCESSAO,       TPMODALIDADE,            FLGBENEFIN' +
        'F,'
      
        '       IDRUBRICAATRASO,      IDRUBRICAREVISAO,        FLGDATAIND' +
        'ICERES,'
      
        '       FLGUSAEVOLFUNC,       FLGPAGAINSS,             FLGPAGAINT' +
        'EG,'
      
        '       IDRELATBENEFICIO,     ORIGEMCMBENEFICIO,       IDREGRABEN' +
        'EFMIN,'
      
        '       IDREGRASRB,           FLGACEITAACERTO,         IDRUBDEVOL' +
        'ABONO,'
      
        '       IDRUBADIANT,          IDRUBDEVOLADIANT,        IDRUBADIAN' +
        'T13,'
      '       IDRUBDEVADIANT13,     FLGACEITAZERO,'
      
        '       IDRUBACJUD,           IDRUBATRACJUD,           IDRUBDEVAC' +
        'JUD,'
      
        '       IDRUBREVACJUD,        IDRUBADTACJUD,           IDRUBDADAC' +
        'JUD,'
      
        '       IDRUB13ACJUD,         IDRUB13DESACJUD,         IDRUB13PGA' +
        'N1ACJUD,'
      
        '       IDRUB13DVANACJUD,     IDRUB13ADTACJUD,         IDRUB13DAD' +
        'ACJUD,'
      
        '       IDREGRADTINDRES,      IDRGDATAELEG,            IDRGVALORP' +
        'REV,'
      
        '       FLGACTVLRSRB,         FLGACTVLRATUAL,          FLGACTVLRT' +
        'OTBEN,'
      '       FLGTPBUSCAVALOR,      FLGMOVRESAPOSCONC,'
      
        '       IDRGPLANPREVCONT,     LIMITEALT, PERCENTUALALT, USUARIOAL' +
        'T,'
      
        '       NUMDIASBENEFANT,      IDRUBACERTOABONO,        IDRUBDEVAN' +
        'TABONO,'
      '       IDRUBATRASOABONO,  IDRUBATR13ACJUD,  IDRUBDEV13ACJUD,'
      '       IDRUBATRREVACJUD,  IDRUBDEVREVACJUD,   IDRUBATRREVISAO,'
      '       IDRUBDEVREVISAO,   FLGDESINDRES,'
      
        '       IDRUBNORADICJUD, IDRUBATRADICJUD, IDRUBDEVADICJUD, FLGHAB' +
        'ILITAINSS)'
      'VALUES ('
      
        '       :IDPLANOPREV,          :IDBENEFICIO,             :FLGABON' +
        'OFINALBEN,'
      '       :FLGACEITAOPCAO,       :FLGCALCTODOMES,'
      
        '       :FLGCORRECAOATRASO,    :FLGCORRECAODEVOL,        :FLGEDIT' +
        'AOP1,'
      
        '       :FLGEDITAOP2,          :FLGEDITAOP3,             :FLGOBRI' +
        'GANPROC,'
      
        '       :FLGOBRIGAOP1,         :FLGOBRIGAOP2,            :FLGOBRI' +
        'GAOP3,'
      
        '       :FLGPOSSUIABONO,       :FLGQUITAASSISTEN,        :FLGQUIT' +
        'AEMPRESTI,'
      
        '       :FLGQUITAPREVIDEN,     :FLGRECALCULAFIM,         :FLGREFE' +
        'RENCIA,'
      '       :IDBENEFREF,           :IDPLANOBENEFREF,'
      '       :IDREGRABENEFICIA,     :CODALTERADORCORR,'
      
        '       :IDREGRACALCABONO,     :IDREGRACALCINSS,         :IDREGRA' +
        'CALCOP1,'
      
        '       :IDREGRACALCOP2,       :IDREGRACALCOP3,          :IDREGRA' +
        'CALCULO,'
      
        '       :IDREGRAELEGIBILI,     :IDREGRAFIM,              :IDREGRA' +
        'INICIO,'
      '       :IDREGRAPAGAATRASO,    :IDREGRAPAGAMENTO,'
      '       :IDREGRAPRIMPAGTO,     :IDREGRASIMULA,'
      '       :IDREGRAULTPAGTO,      :IDREGRAVALIDAOP1,'
      '       :IDREGRAVALIDAOP2,     :IDREGRAVALIDAOP3,'
      
        '       :IDRGVALORTOTAL,       :IDRUBABONO,              :IDRUBAN' +
        'TECABONO,'
      
        '       :IDRUBDESCANTECAB,     :IDRUBDEVOLUCAO,          :IDRUBRI' +
        'CA,'
      '       :IDRUBRICACORRECAO,    :IDRUBRICADIF,'
      '       :INDICEREAJBENEF,      :NOMEVALORBASE1,'
      
        '       :NOMEVALORBASE2,       :NOMEVALORBASE3,          :NUMOPCO' +
        'ES,'
      
        '       :PRAZOCONCESSAO,       :TPMODALIDADE,            :FLGBENE' +
        'FINF,'
      
        '       :IDRUBRICAATRASO,      :IDRUBRICAREVISAO,        :FLGDATA' +
        'INDICERES,'
      
        '       :FLGUSAEVOLFUNC,       :FLGPAGAINSS,             :FLGPAGA' +
        'INTEG,'
      
        '       :IDRELATBENEFICIO,     :ORIGEMCMBENEFICIO,       :IDREGRA' +
        'BENEFMIN,'
      
        '       :IDREGRASRB,           :FLGACEITAACERTO,         :IDRUBDE' +
        'VOLABONO,'
      
        '       :IDRUBADIANT,          :IDRUBDEVOLADIANT,        :IDRUBAD' +
        'IANT13,'
      '       :IDRUBDEVADIANT13,     :FLGACEITAZERO,'
      
        '       :IDRUBACJUD,           :IDRUBATRACJUD,           :IDRUBDE' +
        'VACJUD,'
      
        '       :IDRUBREVACJUD,        :IDRUBADTACJUD,           :IDRUBDA' +
        'DACJUD,'
      
        '       :IDRUB13ACJUD,         :IDRUB13DESACJUD,         :IDRUB13' +
        'PGAN1ACJUD,'
      
        '       :IDRUB13DVANACJUD,     :IDRUB13ADTACJUD,         :IDRUB13' +
        'DADACJUD,'
      
        '       :IDREGRADTINDRES,      :IDRGDATAELEG,            :IDRGVAL' +
        'ORPREV,'
      
        '       :FLGACTVLRSRB,         :FLGACTVLRATUAL,          :FLGACTV' +
        'LRTOTBEN,'
      '       :FLGTPBUSCAVALOR,      :FLGMOVRESAPOSCONC,'
      
        '       :IDRGPLANPREVCONT,     :LIMITEALT, :PERCENTUALALT, :USUAR' +
        'IOALT,'
      
        '       :NUMDIASBENEFANT,      :IDRUBACERTOABONO,        :IDRUBDE' +
        'VANTABONO,'
      '       :IDRUBATRASOABONO,  :IDRUBATR13ACJUD,  :IDRUBDEV13ACJUD,'
      
        '       :IDRUBATRREVACJUD,  :IDRUBDEVREVACJUD,   :IDRUBATRREVISAO' +
        ','
      '       :IDRUBDEVREVISAO,   :FLGDESINDRES,'
      
        '       :IDRUBNORADICJUD,   :IDRUBATRADICJUD,  :IDRUBDEVADICJUD, ' +
        ':FLGHABILITAINSS )'
      '')
    DeleteSQL.Strings = (
      'delete from BENEFPLANPREV'
      'where'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDBENEFICIO = :OLD_IDBENEFICIO')
    Left = 333
    Top = 5
  end
  object updHabitaBenef: TUpdateSQL
    ModifySQL.Strings = (
      'UPDATE SITHABILITACAOINSS'
      'SET'
      ' DESCRICAO = :DESCRICAO,'
      ' FLGHABILITACAOINSS = :FLGHABILITACAOINSS'
      'WHERE'
      ' IDSITHABILITACAO = :OLD_IDSITHABILITACAO')
    InsertSQL.Strings = (
      'insert into SITHABILITACAOINSS ( '
      'IDSITHABILITACAO, DESCRICAO, FLGHABILITACAOINSS'
      ')'
      'VALUES ( '
      'SEQSITHABILITACAOINSS.nextval, :DESCRICAO, :FLGHABILITACAOINSS '
      ')')
    DeleteSQL.Strings = (
      'DELETE FROM SITHABILITACAOINSS '
      'WHERE'
      'IDSITHABILITACAO = :OLD_IDSITHABILITACAO')
    Left = 336
    Top = 119
  end
  object qryAux: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 208
    Top = 135
  end
end
