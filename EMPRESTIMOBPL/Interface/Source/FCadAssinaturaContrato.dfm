inherited frmAssinaturaContrato: TfrmAssinaturaContrato
  Left = 270
  Top = 161
  HelpContext = 150033
  Caption = 'Assinatura de Contrato Padrão'
  ClientHeight = 337
  ClientWidth = 561
  FormStyle = fsNormal
  Visible = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 561
    Height = 269
    object Label4: TLabel
      Left = 16
      Top = 10
      Width = 50
      Height = 13
      Caption = 'Mutuário'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label50: TLabel
      Left = 16
      Top = 50
      Width = 51
      Height = 13
      Caption = 'Situação'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label3: TLabel
      Left = 320
      Top = 50
      Width = 33
      Height = 13
      Caption = 'Plano'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 440
      Top = 50
      Width = 80
      Height = 13
      Caption = 'Patrocinadora'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 16
      Top = 146
      Width = 69
      Height = 13
      Caption = 'Observação'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblNumComprova: TLabel
      Left = 192
      Top = 224
      Width = 122
      Height = 13
      Caption = 'Número do Comprova'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object edtNome: TEdit
      Left = 16
      Top = 24
      Width = 529
      Height = 21
      Color = clInactiveBorder
      ReadOnly = True
      TabOrder = 0
    end
    object edtSituacao: TEdit
      Left = 16
      Top = 64
      Width = 289
      Height = 21
      Color = clInactiveBorder
      ReadOnly = True
      TabOrder = 1
    end
    object edtPlano: TEdit
      Left = 320
      Top = 64
      Width = 105
      Height = 21
      Color = clInactiveBorder
      ReadOnly = True
      TabOrder = 2
    end
    object edtPatro: TEdit
      Left = 440
      Top = 64
      Width = 105
      Height = 21
      Color = clInactiveBorder
      ReadOnly = True
      TabOrder = 3
    end
    object pnlSelecao: TPanel
      Left = 8
      Top = 88
      Width = 545
      Height = 49
      BevelOuter = bvNone
      TabOrder = 4
      object Label1: TLabel
        Left = 8
        Top = 10
        Width = 93
        Height = 13
        Caption = 'Contrato Padrão'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label2: TLabel
        Left = 432
        Top = 10
        Width = 91
        Height = 13
        Alignment = taRightJustify
        Caption = 'Data Assinatura'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBcboContratoPadrao: TwwDBLookupCombo
        Left = 8
        Top = 24
        Width = 409
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'CTPDESCRICAO'#9'60'#9'Descrição'#9'F')
        DataField = 'IDCONTRATOPADRAO'
        DataSource = ds
        LookupTable = qryContratoPadrao
        LookupField = 'IDCONTRATOPADRAO'
        Options = [loTitles]
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnCloseUp = DBcboContratoPadraoCloseUp
      end
      object edtDataInicio: TwwDBDateTimePicker
        Left = 432
        Top = 24
        Width = 105
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'ACPDATAASSINAT'
        DataSource = ds
        Epoch = 1950
        ButtonWidth = 20
        ButtonGlyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          88888888888888888888800000000000000880FFFFFFFFFFFF0880F878787978
          7F0880F7878797978F0880F8787879787F0880F7878787878F0880F878787878
          7F0880F7878787878F0880FFFFFFFFFFFF0880F4C4C4C7777F0880FC4C4C4777
          7F0880FFFFFFFFFFFF0880000000000000088888888888888888}
        ShowButton = True
        TabOrder = 1
        DisplayFormat = 'dd/mm/yyyy'
      end
    end
    object DBMemo1: TDBMemo
      Left = 16
      Top = 160
      Width = 529
      Height = 57
      DataField = 'OBS'
      DataSource = ds
      TabOrder = 5
    end
    object DBchkBloqueio: TDBCheckBox
      Left = 16
      Top = 224
      Width = 153
      Height = 17
      Caption = 'Bloquear Concessão'
      DataField = 'FLGBLOQUEIO'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object edtNumComprova: TDBEdit
      Left = 192
      Top = 238
      Width = 353
      Height = 21
      Color = clInactiveBorder
      DataField = 'NUMCOMPROVA'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 7
      Visible = False
    end
  end
  inherited Dock972: TDock97
    Width = 561
  end
  inherited Dock971: TDock97
    Top = 304
    Width = 561
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        'TDBMemo'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 104
    Top = 51
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update ASSINCONTRPADRAO'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  IDBENEF = :IDBENEF,'
      '  IDCONTRATOPADRAO = :IDCONTRATOPADRAO,'
      '  ACPDATAASSINAT = :ACPDATAASSINAT,'
      '  OBS = :OBS,'
      '  FLGBLOQUEIO = :FLGBLOQUEIO'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDBENEF = :OLD_IDBENEF and'
      '  IDCONTRATOPADRAO = :OLD_IDCONTRATOPADRAO and'
      '  ACPDATAASSINAT = :OLD_ACPDATAASSINAT')
    InsertSQL.Strings = (
      'insert into ASSINCONTRPADRAO'
      '  (IDPESSOA, IDBENEF, IDCONTRATOPADRAO, ACPDATAASSINAT, OBS, '
      'FLGBLOQUEIO)'
      'values'
      
        '  (:IDPESSOA, :IDBENEF, :IDCONTRATOPADRAO, :ACPDATAASSINAT, :OBS' +
        ', '
      ':FLGBLOQUEIO)')
    DeleteSQL.Strings = (
      'delete from ASSINCONTRPADRAO'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDBENEF = :OLD_IDBENEF and'
      '  IDCONTRATOPADRAO = :OLD_IDCONTRATOPADRAO and'
      '  ACPDATAASSINAT = :OLD_ACPDATAASSINAT')
    Left = 136
    Top = 51
  end
  inherited MontaSelect: TMontaSelect
    Caption = ''
    Colunas.Strings = (
      'ACP.ACPDATAASSINAT'
      'CTP.CTPDESCRICAO'
      'DEP.MATRICULA'
      'PES.NOME')
    TipodeDado.Strings = (
      'D'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Data'
      'Descrição'
      'Matrícula'
      'Mutuario')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'S')
    Tabelas.Strings = (
      'ASSINCONTRPADRAO ACP'
      'PESSOA PES'
      'CONTRATOPADRAO CTP'
      'DEPENTIT DEP')
    CamposChave.Strings = (
      'ACP.IDPESSOA'
      'ACP.IDCONTRATOPADRAO'
      'ACP.ACPDATAASSINAT'
      'PES.NOME'
      'ACP.IDBENEF')
    Filtro.Strings = (
      'ACP.IDPESSOA         = DEP.IDTITULAR'
      'ACP.IDBENEF          = DEP.IDPESSOA'
      'ACP.IDCONTRATOPADRAO = CTP.IDCONTRATOPADRAO'
      'DEP.IDPESSOA         = PES.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '12'
      '50'
      '13'
      '60')
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
    Left = 192
    Top = 51
  end
  inherited CmeCadastro: TCmEventosCadastro
    RepetirInsert = False
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 264
    Top = 51
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '   ACP.IDPESSOA,'
      '   ACP.IDBENEF,'
      '   ACP.IDCONTRATOPADRAO,'
      '   ACP.ACPDATAASSINAT,'
      '   ACP.OBS,'
      '   ACP.NUMCOMPROVA,'
      '   NVL(ACP.FLGBLOQUEIO, 0) AS FLGBLOQUEIO,'
      ''
      '   DECODE(SIP.FLGINTERNO, '#39'CA'#39','
      
        '                          DECODE(ACP.IDBENEF, ACP.IDPESSOA, SIP.' +
        'DESCRICAO, '#39'PENSIONISTA'#39'),'
      '                          SIP.DESCRICAO'
      '         ) AS DESCRICAO,'
      ''
      '   PPA.NOME AS NOME_PATRO,'
      '   PLP.NOME AS NOME_PLANO,'
      '   PPP.IDPLANOPREV'
      ''
      'FROM'
      '   ASSINCONTRPADRAO  ACP,'
      '   PESSOA            PDP,'
      '   PESSOA            PEP,'
      '   PESSOA            PPA,'
      '   DEPENTIT          DEP,'
      '   ELEGPATRO         ELP,'
      '   PARTPREVPLAN      PPP,'
      '   PLANPREV          PLP,'
      '   SITPART           SIP,'
      '   SITPLANOPREV      SPP'
      ''
      'WHERE'
      '       ACP.IDPESSOA         =:PIDPESSOA'
      '   AND ACP.IDBENEF          =:PIDBENEF'
      '   AND ACP.IDCONTRATOPADRAO =:PIDCONTRATOPADRAO'
      '   AND ACP.ACPDATAASSINAT   =:PACPDATAASSINAT'
      ''
      '   AND ACP.IDPESSOA         = DEP.IDTITULAR'
      '   AND ACP.IDBENEF          = DEP.IDPESSOA'
      ''
      '   AND ACP.IDPESSOA         = ELP.IDPESSOA'
      '   AND ACP.IDPESSOA         = PPP.IDPESSOA'
      '   AND ACP.IDPESSOA         = PEP.IDPESSOA'
      ''
      '   AND ELP.IDPESSJUR        = PPA.IDPESSOA'
      ''
      '   AND DEP.IDPESSOA         = PDP.IDPESSOA'
      '   AND PPP.IDPLANOPREV      = PLP.IDPLANOPREV'
      '   AND PPP.IDSITPART        = SIP.IDSITPART'
      '   AND PPP.IDSITPLANOPREV   = SPP.IDSITPLANOPREV'
      '   AND PPP.FLGDESATIVADO    = 0')
    Left = 72
    Top = 51
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDBENEF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOPADRAO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PACPDATAASSINAT'
        ParamType = ptInput
      end>
    object qryIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.ASSINCONTRPADRAO.IDPESSOA'
    end
    object qryIDCONTRATOPADRAO: TFloatField
      FieldName = 'IDCONTRATOPADRAO'
      Origin = 'BASEDADOS.ASSINCONTRPADRAO.IDCONTRATOPADRAO'
    end
    object qryACPDATAASSINAT: TDateTimeField
      FieldName = 'ACPDATAASSINAT'
      Origin = 'BASEDADOS.ASSINCONTRPADRAO.ACPDATAASSINAT'
    end
    object qryDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object qryNOME_PATRO: TStringField
      FieldName = 'NOME_PATRO'
      Size = 60
    end
    object qryNOME_PLANO: TStringField
      FieldName = 'NOME_PLANO'
      Size = 50
    end
    object qryIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1000
    end
    object qryFLGBLOQUEIO: TFloatField
      FieldName = 'FLGBLOQUEIO'
    end
    object qryIDBENEF: TFloatField
      FieldName = 'IDBENEF'
    end
    object qryNUMCOMPROVA: TStringField
      FieldName = 'NUMCOMPROVA'
      Size = 40
    end
  end
  object qryContratoPadrao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '   CTP.IDCONTRATOPADRAO, CTP.CTPDESCRICAO'
      'FROM'
      '   CONTRATOPADRAO      CTP,'
      '   CONTRPADRXTIPOCONTR PXT,'
      '   TIPOCONTREMPTMO     TCE'
      'WHERE'
      '       (TCE.IDPLANOPREV      = :PIDPLANOPREV'
      '   OR   TCE.IDPLANOPREV      IS NULL)'
      ''
      '   AND TCE.FLGSITUACAO       = '#39'A'#39
      ''
      '   AND CTP.IDCONTRATOPADRAO  = PXT.IDCONTRATOPADRAO'
      '   AND PXT.IDTIPOCONTREMPTMO = TCE.IDTIPOCONTREMPTMO'
      ''
      '   AND CTP.CTPDATAINICIO     ='
      '       ('
      '       SELECT'
      '          MAX(CP.CTPDATAINICIO) AS CTPDATAINICIO'
      '       FROM'
      '          CONTRATOPADRAO CP'
      '       WHERE'
      '              PXT.IDTIPOCONTREMPTMO  = TCE.IDTIPOCONTREMPTMO'
      '          AND CP.IDCONTRATOPADRAO  = PXT.IDCONTRATOPADRAO'
      '          AND CP.CTPDATAINICIO     <= SYSDATE'
      '       )'
      ''
      'MINUS'
      ''
      'SELECT DISTINCT'
      '   CTP.IDCONTRATOPADRAO, CTP.CTPDESCRICAO'
      'FROM'
      '   CONTRATOPADRAO      CTP,'
      '   CONTRPADRXTIPOCONTR PXT,'
      '   TIPOCONTREMPTMO     TCE'
      'WHERE'
      '       (TCE.IDPLANOPREV      <>:PIDPLANOPREV)'
      ''
      '   AND CTP.IDCONTRATOPADRAO  = PXT.IDCONTRATOPADRAO'
      '   AND PXT.IDTIPOCONTREMPTMO = TCE.IDTIPOCONTREMPTMO'
      ''
      '   AND ('
      '       SELECT COUNT(PXT1.IDCONTRATOPADRAO)'
      '       FROM   CONTRPADRXTIPOCONTR PXT1'
      '       WHERE  PXT1.IDTIPOCONTREMPTMO = TCE.IDTIPOCONTREMPTMO'
      '       ) = 1'
      ' ')
    ValidateWithMask = True
    Left = 320
    Top = 144
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end>
    object qryContratoPadraoCTPDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'CTPDESCRICAO'
      Origin = 'BASEDADOS.CONTRATOPADRAO.CTPDESCRICAO'
      Size = 60
    end
    object qryContratoPadraoIDCONTRATOPADRAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONTRATOPADRAO'
      Origin = 'BASEDADOS.CONTRATOPADRAO.IDCONTRATOPADRAO'
      Visible = False
    end
  end
  object dsContratoPadrao: TwwDataSource
    DataSet = qryContratoPadrao
    Left = 320
    Top = 132
  end
  object qryMaxContratoObrig: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CTP.IDCONTRATOPADRAO, CTP.CTPDATAINICIO'
      'FROM'
      '   CONTRATOPADRAO CTP, TIPOCONTREMPTMO TCE'
      'WHERE'
      '    TCE.IDPLANOPREV       = :PIDPLANOPREV'
      'AND CTP.IDTIPOCONTREMPTMO = TCE.IDTIPOCONTREMPTMO'
      
        'AND CTP.CTPDATAINICIO     = (SELECT MAX(CTPDATAINICIO) AS CTPDAT' +
        'AINICIO'
      '                             FROM   CONTRATOPADRAO'
      
        '                             WHERE  IDTIPOCONTREMPTMO = TCE.IDTI' +
        'POCONTREMPTMO'
      '                             AND    CTPDATAINICIO <= SYSDATE'
      '                             AND    CTPOBRIGATORIO = 1)'
      '')
    ValidateWithMask = True
    Left = 208
    Top = 144
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end>
    object qryMaxContratoObrigIDCONTRATOPADRAO: TFloatField
      FieldName = 'IDCONTRATOPADRAO'
    end
    object qryMaxContratoObrigCTPDATAINICIO: TDateTimeField
      FieldName = 'CTPDATAINICIO'
    end
  end
  object qryExisteAssinatura: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   COUNT(*) AS QUANT'
      'FROM'
      '   ASSINCONTRPADRAO ACP'
      'WHERE'
      '       IDPESSOA         =:PIDPESSOA'
      '   AND IDBENEF          =:PIDBENEF'
      '   AND IDCONTRATOPADRAO =:PIDCONTRATOPADRAO')
    ValidateWithMask = True
    Left = 464
    Top = 208
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDBENEF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOPADRAO'
        ParamType = ptInput
      end>
    object qryExisteAssinaturaQUANT: TFloatField
      FieldName = 'QUANT'
    end
  end
  object dsContrato: TwwDataSource
    DataSet = qryContrato
    Left = 80
    Top = 187
  end
  object qryContrato: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT COUNT(*) AS QUANT'
      'FROM CONTRATOEMPTMO CON, CONTRPADRXTIPOCONTR CPD '
      'WHERE CON.IDTIPOCONTREMPTMO = CPD.IDTIPOCONTREMPTMO '
      '  AND CPD.IDCONTRATOPADRAO  = :PIDCONTRATOPADRAO'
      '  AND CON.IDBENEF           = :PIDBENEF'
      '  AND CON.IDPESSOA        = :PIDPESSOA'
      '  AND CON.FLGSITUACAO      <> '#39'C'#39' '
      '  AND CON.DATACREDITO      >= :PACPDATAASSINAT')
    ValidateWithMask = True
    Left = 80
    Top = 203
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOPADRAO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDBENEF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PACPDATAASSINAT'
        ParamType = ptInput
      end>
    object qryContratoQUANT: TFloatField
      FieldName = 'QUANT'
    end
  end
end
