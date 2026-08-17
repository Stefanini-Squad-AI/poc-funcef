inherited frmAssinaturaContrato: TfrmAssinaturaContrato
  Left = 94
  Top = 193
  HelpContext = 150031
  Caption = 'Assinatura de Contrato Padrão'
  ClientHeight = 316
  ClientWidth = 561
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 561
    Height = 248
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
      Left = 24
      Top = 224
      Width = 521
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
  end
  inherited Dock972: TDock97
    Width = 561
  end
  inherited Dock971: TDock97
    Top = 283
    Width = 561
    inherited tb97Fundo: TToolbar97
      inherited bbtnAjuda: TmaHelpBitBtn
        ClickHelpContext = 150025
      end
    end
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
      '  IDCONTRATOPADRAO = :IDCONTRATOPADRAO,'
      '  ACPDATAASSINAT = :ACPDATAASSINAT,'
      '  OBS = :OBS,'
      '  FLGBLOQUEIO = :FLGBLOQUEIO'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDCONTRATOPADRAO = :OLD_IDCONTRATOPADRAO and'
      '  ACPDATAASSINAT = :OLD_ACPDATAASSINAT')
    InsertSQL.Strings = (
      'insert into ASSINCONTRPADRAO'
      '  (IDPESSOA, IDCONTRATOPADRAO, ACPDATAASSINAT, OBS, FLGBLOQUEIO)'
      'values'
      
        '  (:IDPESSOA, :IDCONTRATOPADRAO, :ACPDATAASSINAT, :OBS, :FLGBLOQ' +
        'UEIO)')
    DeleteSQL.Strings = (
      'delete from ASSINCONTRPADRAO'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDCONTRATOPADRAO = :OLD_IDCONTRATOPADRAO and'
      '  ACPDATAASSINAT = :OLD_ACPDATAASSINAT')
    Left = 136
    Top = 51
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'DEP.MATRICULA'
      'PES.NOME'
      'CTP.CTPDESCRICAO'
      'ACP.ACPDATAASSINAT')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'D')
    Descricao.Strings = (
      'Matrícula'
      'Nome'
      'Descrição'
      'Data Assinatura')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'ASSINCONTRPADRAO ACP'
      'PESSOA PES'
      'CONTRATOPADRAO CTP'
      'DEPENTIT DEP')
    CamposChave.Strings = (
      'ACP.IDPESSOA'
      'ACP.IDCONTRATOPADRAO'
      'ACP.ACPDATAASSINAT'
      'PES.NOME')
    Filtro.Strings = (
      'ACP.IDPESSOA         = PES.IDPESSOA'
      'ACP.IDCONTRATOPADRAO = CTP.IDCONTRATOPADRAO'
      'DEP.IDPESSOA         = PES.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '15'
      '60'
      '60'
      '18')
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
      '   ACP.IDCONTRATOPADRAO,'
      '   ACP.ACPDATAASSINAT,'
      '   ACP.OBS,'
      '   NVL(ACP.FLGBLOQUEIO, 0) AS FLGBLOQUEIO,'
      
        '   DECODE(SIP.FLGINTERNO,'#39'CA'#39', '#39'PENSIONISTA'#39',SIP.DESCRICAO) AS D' +
        'ESCRICAO,'
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
      '       ACP.IDPESSOA         = :PIDPESSOA'
      '   AND ACP.IDCONTRATOPADRAO = :PIDCONTRATOPADRAO'
      '   AND ACP.ACPDATAASSINAT   = :PACPDATAASSINAT'
      '   AND DEP.IDPESSOA         = ACP.IDPESSOA'
      '   AND ELP.IDPESSOA         = PEP.IDPESSOA'
      '   AND ELP.IDPESSJUR        = PPA.IDPESSOA'
      '   AND ELP.IDPESSJUR        = PPP.IDPESSJUR'
      '   AND ELP.IDPESSOA         = PPP.IDPESSOA'
      '   AND ELP.IDPESSOA         = DEP.IDTITULAR'
      '   AND DEP.IDPESSOA         = PDP.IDPESSOA'
      '   AND PPP.IDPLANOPREV      = PLP.IDPLANOPREV'
      '   AND PPP.IDSITPART        = SIP.IDSITPART'
      '   AND PPP.IDSITPLANOPREV   = SPP.IDSITPLANOPREV'
      '   AND PPP.FLGDESATIVADO    = 0'
      '')
    Left = 72
    Top = 51
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
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
  end
  object qryContratoPadrao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CTP.IDCONTRATOPADRAO, CTP.CTPDESCRICAO'
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
      '                             AND    CTPDATAINICIO <= SYSDATE)'
      ''
      ' ')
    ValidateWithMask = True
    Left = 320
    Top = 128
    ParamData = <
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
    Top = 144
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
      'SELECT COUNT(*) AS QUANT'
      'FROM'
      '   ASSINCONTRPADRAO ACP'
      'WHERE'
      '       IDPESSOA         =:PIDPESSOA'
      '   AND IDCONTRATOPADRAO =:PIDCONTRATOPADRAO')
    ValidateWithMask = True
    Left = 464
    Top = 208
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
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
end
