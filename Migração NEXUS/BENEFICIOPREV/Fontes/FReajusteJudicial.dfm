inherited frmReajusteJudicial: TfrmReajusteJudicial
  Left = 10
  Top = 112
  Caption = 'Reajuste Judicial'
  ClientHeight = 403
  ClientWidth = 760
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 760
    Height = 364
    object stxtProcesso: TStaticText
      Left = 1
      Top = 1
      Width = 758
      Height = 31
      Align = alTop
      Alignment = taCenter
      Caption = 'Benefícios a Reajustar'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -24
      Font.Name = 'Times New Roman'
      Font.Style = []
      ParentColor = False
      ParentFont = False
      TabOrder = 0
    end
    object dbgrdReajustes: TwwDBGrid
      Left = 1
      Top = 32
      Width = 758
      Height = 331
      Selected.Strings = (
        'MATRICULA'#9'13'#9'Matrícula'
        'INSCRICAONUMERO'#9'10'#9'Inscrição Nº'
        'NOME'#9'30'#9'Participante Titular'
        'VALORANTERIOR'#9'10'#9'Valor ~Atual'
        'FLGDESREAJUSTE'#9'10'#9'Redução de~Reajuste'
        'DATAREFERENCIA'#9'10'#9'Referente à'
        'FATOR'#9'10'#9'Perc. de ~Reajuste ~(%)'
        'NOVOVALOR'#9'10'#9'Novo ~Valor'
        'NOMEBENEFICIO'#9'31'#9'Benefício')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = dsReajustes
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgEditing, dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      ParentFont = False
      TabOrder = 1
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 3
      TitleButtons = False
      OnColExit = dbgrdReajustesColExit
      IndicatorColor = icBlack
    end
  end
  inherited Dock971: TDock97
    Top = 364
    Width = 760
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 19
    Top = 371
  end
  object qryReajustes: TwwQuery
    CachedUpdates = True
    AfterInsert = qryReajustesAfterInsert
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT PP.IDPESSJUR, PP.IDPLANOPREV, PP.IDPESSOA AS IDTITULAR, P' +
        'P.SEQPROPOSTA,'
      '       PP.INSCRICAONUMERO,'
      
        '       EL.MATRICULA, P.NOME, 0 AS FATOR, 0 AS NOVOVALOR, 0 AS VA' +
        'LORANTERIOR,'
      '       0 AS FLGDESREAJUSTE,'
      '       '#39'                               '#39' AS NOMEBENEFICIO,'
      '       SYSDATE AS DATAREFERENCIA,'
      '       -1 AS NUMEROPROCESSO, -1 AS IDBENEFICIO, -1 AS IDPESSOA '
      'FROM   PARTPREVPLAN  PP, ELEGPATRO EL, PESSOA P'
      'WHERE  EL.IDPESSOA = -1'
      'AND    EL.IDPESSOA = P.IDPESSOA'
      'AND    PP.IDPESSJUR = EL.IDPESSJUR'
      'AND    PP.IDPESSOA = EL.IDPESSOA'
      'AND    PP.FLGDESATIVADO = 0')
    UpdateObject = updReajustes
    ControlType.Strings = (
      'FLGDESREAJUSTE;CheckBox;1;0')
    ValidateWithMask = True
    Left = 576
    Top = 296
  end
  object dsReajustes: TwwDataSource
    DataSet = qryReajustes
    Left = 584
    Top = 232
  end
  object updReajustes: TUpdateSQL
    ModifySQL.Strings = (
      'update PARTPREVPLAN'
      'set'
      '  IDPESSJUR = :IDPESSJUR,'
      '  IDPESSOA = :IDPESSOA,'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  SEQPROPOSTA = :SEQPROPOSTA'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA')
    InsertSQL.Strings = (
      'insert into PARTPREVPLAN'
      '  (IDPESSJUR, IDPESSOA, IDPLANOPREV, SEQPROPOSTA)'
      'values'
      '  (:IDPESSJUR, :IDPESSOA, :IDPLANOPREV, :SEQPROPOSTA)')
    DeleteSQL.Strings = (
      'delete from PARTPREVPLAN'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  SEQPROPOSTA = :OLD_SEQPROPOSTA')
    Left = 584
    Top = 168
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 688
    Top = 136
  end
  object qryBenefBfciario: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT BF.DATAFINAL,BF.DATAINICIO,BF.DATAINICIOFUND,'
      '       BF.DATAINICIOINSS, BF.IDBENEFICIO,'
      '       BF.IDPESSJUR,BF.IDPESSOA,BF.IDPLANOPREV,'
      '       BF.IDTITULAR, BF.NUMEROPROCESSO,BF.SEQPROPOSTA,'
      '       BF.IDSITBENEFICIO,'
      '       BF.VALORTOTAL,BF.VLRCALCINSS,BF.VLRINFINSS,'
      
        '       BP.IDREGRACALCULO, PP.IDSITPART, PP.IDSITPLANOPREV, EL.ID' +
        'SITFUNC,'
      
        '       BPP.VALORBASE1, BPP.VALORBASE2, BPP.VALORBASE3,BF.VALORAT' +
        'UAL,BF.VALORCOTAS,'
      '       P.DTEVENTO'
      
        'FROM   DEPENTIT DP, BFCIARIOTITPLAN BTIT, PROCESSOBENEF P, BENEF' +
        'BFCIARIO BF,'
      '       BENEFPLANPREV BP, PARTPREVPLAN PP, ELEGPATRO EL,'
      '       BENEFPLANOPART BPP'
      'WHERE  (BF.NUMEROPROCESSO = :NUMEROPROCESSO)'
      'AND    (BF.IDPESSJUR      = :IDPESSJUR     )'
      'AND    (BF.IDPLANOPREV    = :IDPLANOPREV   )'
      'AND    (BF.IDTITULAR      = :IDTITULAR     )'
      'AND    (BF.IDBENEFICIO    = :IDBENEFICIO   )'
      'AND    (BF.NUMEROPROCESSO = P.NUMEROPROCESSO)'
      'AND    (BF.IDPLANOPREV    = BP.IDPLANOPREV )'
      'AND    (BF.IDBENEFICIO    = BP.IDBENEFICIO )'
      'AND    (BF.IDPESSJUR      = PP.IDPESSJUR   )'
      'AND    (BF.IDPLANOPREV    = PP.IDPLANOPREV )'
      'AND    (BF.IDTITULAR      = PP.IDPESSOA    )'
      'AND    (BF.SEQPROPOSTA    = PP.SEQPROPOSTA )'
      'AND    (PP.IDPESSJUR      = EL.IDPESSJUR   )'
      'AND    (PP.IDPESSOA       = EL.IDPESSOA    )'
      'AND    (BF.IDPESSJUR      = BPP.IDPESSJUR(+)   )'
      'AND    (BF.SEQPROPOSTA    = BPP.SEQPROPOSTA(+) )'
      'AND    (BF.IDPLANOPREV    = BPP.IDPLANOPREV(+) )'
      'AND    (BF.IDPESSOA       = BPP.IDPESSOA(+)    )'
      'AND    (BF.IDBENEFICIO    = BPP.IDBENEFICIO(+) )'
      'AND    (BF.IDTITULAR      = DP.IDTITULAR)'
      'AND    (BF.IDPESSOA       = DP.IDPESSOA)'
      'AND    (BF.IDPESSJUR      = BTIT.IDPESSJUR)'
      'AND    (BF.IDPLANOPREV    = BTIT.IDPLANOPREV)'
      'AND    (BF.IDTITULAR      = BTIT.IDTITULAR)'
      'AND    (BF.SEQPROPOSTA    = BTIT.SEQPROPOSTA)'
      'AND    (BF.IDPESSOA       = BTIT.IDPESSOA)'
      'AND    (BF.IDBENEFICIO    = BTIT.IDBENEFICIO)')
    ValidateWithMask = True
    Left = 480
    Top = 64
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMEROPROCESSO'
        ParamType = ptUnknown
      end
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
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDBENEFICIO'
        ParamType = ptUnknown
      end>
  end
  object qryAux1: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 688
    Top = 184
  end
end
