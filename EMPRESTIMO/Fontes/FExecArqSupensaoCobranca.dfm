inherited frmExecArqSupensaoCobranca: TfrmExecArqSupensaoCobranca
  Left = 194
  Top = 164
  Caption = 'Importação de Arquivo de Suspensões'
  ClientHeight = 361
  ClientWidth = 719
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 719
    Height = 322
    object Label1: TLabel
      Left = 16
      Top = 10
      Width = 98
      Height = 13
      Caption = 'Nome do Arquivo'
    end
    object SpeedButton1: TSpeedButton
      Left = 489
      Top = 24
      Width = 23
      Height = 22
      Flat = True
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000130B0000130B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
        333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
        0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
        07333337F3FF3FFF7F333330F00F000F07333337F77377737F333330FFFFFFFF
        07333FF7F3FFFF3F7FFFBBB0F0000F0F0BB37777F7777373777F3BB0FFFFFFFF
        0BBB3777F3FF3FFF77773330F00F000003333337F773777773333330FFFF0FF0
        33333337F3FF7F37F3333330F08F0F0B33333337F7737F77FF333330FFFF003B
        B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
        3BB33773333773333773B333333B3333333B7333333733333337}
      NumGlyphs = 2
      OnClick = SpeedButton1Click
    end
    object Label2: TLabel
      Left = 16
      Top = 50
      Width = 58
      Height = 13
      Caption = 'Resultado'
    end
    object edtNomeArquivo: TEdit
      Left = 16
      Top = 24
      Width = 473
      Height = 21
      TabOrder = 0
    end
    object memResult: TwwDBRichEdit
      Left = 16
      Top = 64
      Width = 689
      Height = 241
      ScrollBars = ssBoth
      AutoURLDetect = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'Courier New'
      Font.Style = []
      ParentFont = False
      PopupMenu = ppmMemResult
      PrintJobName = 'Crítica de Processo'
      TabOrder = 1
      WordWrap = False
      PopupOptions = []
      EditorCaption = 'Resultado do Processo'
      EditorPosition.Left = 0
      EditorPosition.Top = 0
      EditorPosition.Width = 0
      EditorPosition.Height = 0
      MeasurementUnits = muInches
      PrintMargins.Top = 1
      PrintMargins.Bottom = 1
      PrintMargins.Left = 1
      PrintMargins.Right = 1
      RichEditVersion = 2
      Data = {
        7B0000007B5C727466315C616E73695C616E7369637067313235325C64656666
        305C6465666C616E67313034367B5C666F6E7474626C7B5C66305C666E696C5C
        66636861727365743020436F7572696572204E65773B7D7D0D0A5C766965776B
        696E64345C7563315C706172645C66305C667332305C7061720D0A7D0D0A00}
    end
  end
  inherited Dock971: TDock97
    Top = 322
    Width = 719
    inherited tb97Fundo: TToolbar97
      Left = 367
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 230101
        ClickHelpContext = 230101
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 763
    Top = 3
    TargetsData = (
      1
      1
      (
        'TwwDBRichEdit'
        'Text'
        0))
  end
  object OpenDialog: TOpenDialog
    DefaultExt = 'txt'
    FileName = '*.txt'
    Filter = 'Arquivos de Texto|*.txt|Todos os Arquivos|*.*'
    Left = 376
    Top = 16
  end
  object SaveDialog: TSaveDialog
    DefaultExt = 'txt'
    FileName = 'Import*.txt'
    Filter = 'Arquivo Texto|Import*.txt'
    Left = 440
    Top = 16
  end
  object ppmMemResult: TPopupMenu
    Left = 456
    Top = 72
    object Imprimir: TMenuItem
      Caption = 'Imprimir'
      OnClick = ImprimirClick
    end
    object Salvar: TMenuItem
      Caption = 'Salvar'
      OnClick = SalvarClick
    end
  end
  object qryLookTipoSusp: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   TSE.IDTIPOSUSPEMPTMO,'
      '   TCS.IDTIPOCONTREMPTMO,'
      '   TSE.IDREGRAENVIOPARC,'
      '   TSE.IDREGRARECALCIOF,'
      '   TSE.IDREGRARECALCSEG,'
      '   TSE.IDREGRAVALIDSUSP,'
      '   TSE.TSEDESCRICAO,'
      '   TSE.TSEMESES,'
      '   TSE.TSEINICIOSUSP,'
      '   TSE.TSEFINALSUSP,'
      '   TSE.IDRUBRICAADFERIAS,'
      '   TSE.FLGGERAPARCELAS,'
      '   TSE.FLGATUALSALDOPARC,'
      '   TSE.FLGSUSPCONCESSAO,'
      '   TSE.FLGCOBRAENCARGOS,'
      '   TSE.FLGDEDUZPARCREST,'
      '   TSE.FLGATUALSALDOENV,'
      '   TSE.FLGFERIAS,'
      '   TSE.FLGCOBRJUDICIAL'
      'FROM'
      '   TIPOSUSPEMPTMO TSE,'
      '   TIPOCONTRXSUSP TCS'
      'WHERE'
      '       TSE.FLGFERIAS         = 1'
      
        '   AND ((:PIDTIPOCONTREMPTMO IS NULL) OR (TCS.IDTIPOCONTREMPTMO ' +
        '= :PIDTIPOCONTREMPTMO))'
      '   AND TSE.IDTIPOSUSPEMPTMO  = TCS.IDTIPOSUSPEMPTMO')
    ValidateWithMask = True
    Left = 64
    Top = 120
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end>
    object qryLookTipoSuspIDTIPOSUSPEMPTMO: TFloatField
      FieldName = 'IDTIPOSUSPEMPTMO'
      Origin = 'BASEDADOS.TIPOSUSPEMPTMO.IDTIPOSUSPEMPTMO'
    end
    object qryLookTipoSuspIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
      Origin = 'BASEDADOS.TIPOCONTRXSUSP.IDTIPOCONTREMPTMO'
    end
    object qryLookTipoSuspIDREGRAENVIOPARC: TFloatField
      FieldName = 'IDREGRAENVIOPARC'
      Origin = 'BASEDADOS.TIPOSUSPEMPTMO.IDREGRAENVIOPARC'
    end
    object qryLookTipoSuspIDREGRARECALCIOF: TFloatField
      FieldName = 'IDREGRARECALCIOF'
      Origin = 'BASEDADOS.TIPOSUSPEMPTMO.IDREGRARECALCIOF'
    end
    object qryLookTipoSuspIDREGRARECALCSEG: TFloatField
      FieldName = 'IDREGRARECALCSEG'
      Origin = 'BASEDADOS.TIPOSUSPEMPTMO.IDREGRARECALCSEG'
    end
    object qryLookTipoSuspIDREGRAVALIDSUSP: TFloatField
      FieldName = 'IDREGRAVALIDSUSP'
      Origin = 'BASEDADOS.TIPOSUSPEMPTMO.IDREGRAVALIDSUSP'
    end
    object qryLookTipoSuspTSEDESCRICAO: TStringField
      FieldName = 'TSEDESCRICAO'
      Origin = 'BASEDADOS.TIPOSUSPEMPTMO.TSEDESCRICAO'
      Size = 60
    end
    object qryLookTipoSuspTSEMESES: TFloatField
      FieldName = 'TSEMESES'
      Origin = 'BASEDADOS.TIPOSUSPEMPTMO.TSEMESES'
    end
    object qryLookTipoSuspTSEINICIOSUSP: TDateTimeField
      FieldName = 'TSEINICIOSUSP'
      Origin = 'BASEDADOS.TIPOSUSPEMPTMO.TSEINICIOSUSP'
    end
    object qryLookTipoSuspTSEFINALSUSP: TDateTimeField
      FieldName = 'TSEFINALSUSP'
      Origin = 'BASEDADOS.TIPOSUSPEMPTMO.TSEFINALSUSP'
    end
    object qryLookTipoSuspIDRUBRICAADFERIAS: TFloatField
      FieldName = 'IDRUBRICAADFERIAS'
      Origin = 'BASEDADOS.TIPOSUSPEMPTMO.IDRUBRICAADFERIAS'
    end
    object qryLookTipoSuspFLGGERAPARCELAS: TFloatField
      FieldName = 'FLGGERAPARCELAS'
      Origin = 'BASEDADOS.TIPOSUSPEMPTMO.FLGGERAPARCELAS'
    end
    object qryLookTipoSuspFLGATUALSALDOPARC: TFloatField
      FieldName = 'FLGATUALSALDOPARC'
      Origin = 'BASEDADOS.TIPOSUSPEMPTMO.FLGATUALSALDOPARC'
    end
    object qryLookTipoSuspFLGSUSPCONCESSAO: TFloatField
      FieldName = 'FLGSUSPCONCESSAO'
      Origin = 'BASEDADOS.TIPOSUSPEMPTMO.FLGSUSPCONCESSAO'
    end
    object qryLookTipoSuspFLGCOBRAENCARGOS: TFloatField
      FieldName = 'FLGCOBRAENCARGOS'
      Origin = 'BASEDADOS.TIPOSUSPEMPTMO.FLGCOBRAENCARGOS'
    end
    object qryLookTipoSuspFLGDEDUZPARCREST: TFloatField
      FieldName = 'FLGDEDUZPARCREST'
      Origin = 'BASEDADOS.TIPOSUSPEMPTMO.FLGDEDUZPARCREST'
    end
    object qryLookTipoSuspFLGATUALSALDOENV: TFloatField
      FieldName = 'FLGATUALSALDOENV'
      Origin = 'BASEDADOS.TIPOSUSPEMPTMO.FLGATUALSALDOENV'
    end
    object qryLookTipoSuspFLGFERIAS: TFloatField
      FieldName = 'FLGFERIAS'
      Origin = 'BASEDADOS.TIPOSUSPEMPTMO.FLGFERIAS'
    end
    object qryLookTipoSuspFLGCOBRJUDICIAL: TFloatField
      FieldName = 'FLGCOBRJUDICIAL'
      Origin = 'BASEDADOS.TIPOSUSPEMPTMO.FLGCOBRJUDICIAL'
    end
  end
  object qryBuscaContrato: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CON.IDCONTRATOEMPTMO,'
      '   CON.IDTIPOCONTREMPTMO,'
      '   CON.IDPESSOA, CON.IDBENEF'
      'FROM'
      '   CONTRATOEMPTMO CON,'
      '   DEPENTIT       DEP'
      'WHERE'
      '       DEP.MATRICULA     =:PMATRICULA'
      '   AND CON.FLGSITUACAO   = '#39'A'#39
      '   AND IDTIPOCONTREMPTMO IN'
      '       ('
      '       SELECT'
      '          TCS.IDTIPOCONTREMPTMO'
      '       FROM'
      '          TIPOSUSPEMPTMO TSE,'
      '          TIPOCONTRXSUSP TCS'
      '       WHERE'
      '              TSE.FLGFERIAS         = 1'
      '          AND TSE.IDTIPOSUSPEMPTMO  = TCS.IDTIPOSUSPEMPTMO'
      '       )'
      '   AND CON.IDPESSOA      = DEP.IDTITULAR'
      '   AND CON.IDBENEF       = DEP.IDPESSOA')
    ValidateWithMask = True
    Left = 192
    Top = 72
    ParamData = <
      item
        DataType = ftString
        Name = 'PMATRICULA'
        ParamType = ptInput
      end>
    object qryBuscaContratoIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryBuscaContratoIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryBuscaContratoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryBuscaContratoIDBENEF: TFloatField
      FieldName = 'IDBENEF'
    end
  end
  object qryExistePrestacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   HME.HMEDATAPREVISTA,'
      '   HME.HMEVLRPREVISTO'
      'FROM'
      '   HISTMOVEMPTMO HME'
      'WHERE'
      '       HME.IDCONTRATOEMPTMO      =:PIDCONTRATOEMPTMO'
      '   AND HME.HMETIPOMOV            = 1'
      '   AND NVL(HME.FLGESTORNADO, 0)  = 0'
      '   AND HME.HMEDATAPREVISTA       >:HMEDATAPREVISTA')
    ValidateWithMask = True
    Left = 192
    Top = 120
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'HMEDATAPREVISTA'
        ParamType = ptInput
      end>
    object qryExistePrestacaoHMEDATAPREVISTA: TDateTimeField
      FieldName = 'HMEDATAPREVISTA'
    end
    object qryExistePrestacaoHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
    end
  end
  object qryParcelasEmAberto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   COUNT(HMEPARCELA) AS TOTAL'
      ''
      'FROM'
      '   HISTMOVEMPTMO HME'
      ''
      'WHERE'
      '       HME.IDCONTRATOEMPTMO      =:PIDCONTRATOEMPTMO'
      '   AND HME.FLGBAIXADO            = 0'
      '   AND HME.HMEDATAEFETIVA        IS NULL'
      '   AND HME.HMEVLREFETIVO         IS NULL'
      '   AND HME.HMEDATAPREVISTA      <=:PHMEDATAPREVISTA'
      '   AND HME.HMETIPOMOV            NOT IN (0, 5, 8)'
      '   AND HMe.HMEVLRPREVISTO        > 0'
      '   AND ( HME.HMECENTRALIZA       = 1 OR HME.HMEDESTACADO = 1 )'
      '   AND NVL(HME.FLGESTORNADO, 0)  = 0'
      '   AND NVL(HME.FLGQUITADO, 0)    = 0'
      '   AND NVL(HME.FLGABONADO, 0)    = 0'
      '   AND NVL(HME.FLGSUSPENSAO, 0)  = 0'
      ''
      'GROUP BY'
      '   HME.IDCONTRATOEMPTMO')
    ValidateWithMask = True
    Left = 64
    Top = 168
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAPREVISTA'
        ParamType = ptInput
      end>
    object qryParcelasEmAbertoTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
  end
  object qryParcelasPagas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   COUNT(HMEPARCELA) AS TOTAL'
      ''
      'FROM'
      '   HISTMOVEMPTMO HME'
      ''
      'WHERE'
      '       ( HME.IDCONTRATOEMPTMO =:PIDCONTRATOEMPTMO )'
      '   AND ( HME.FLGBAIXADO       = 0 )'
      '   AND ( HME.HMEDATAEFETIVA   IS NOT NULL )'
      '   AND ( HME.HMEVLREFETIVO    IS NOT NULL )'
      '   AND ( HME.HMEDATAEFETIVA   > (SELECT MAX(HSCDATALIBER)'
      '                                 FROM   HISTSUSPCOBEP'
      
        '                                 WHERE  IDCONTRATOEMPTMO =:PIDCO' +
        'NTRATOEMPTMO'
      '                                 AND    FLGFERIAS = 1'
      
        '                                 AND    HSCDATALIBER IS NOT NULL' +
        '  ) )'
      '   AND ( HME.HMETIPOMOV       NOT IN (0, 5, 8) )'
      '   AND ( (HME.HMECENTRALIZA   = 1) OR (HME.HMEDESTACADO = 1) )'
      
        '   AND ( (HME.FLGESTORNADO    = 0) OR (HME.FLGESTORNADO IS NULL)' +
        ' )'
      
        '   AND ( (HME.FLGQUITADO      = 0) OR (HME.FLGQUITADO   IS NULL)' +
        ' )'
      
        '   AND ( (HME.FLGABONADO      = 0) OR (HME.FLGABONADO   IS NULL)' +
        ' )'
      ''
      'GROUP BY'
      '   HME.IDCONTRATOEMPTMO'
      ''
      '')
    ValidateWithMask = True
    Left = 328
    Top = 120
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
    object qryParcelasPagasTOTAL: TFloatField
      FieldName = 'TOTAL'
    end
  end
  object qryUltimaSuspensaoEncerrada: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   MAX(HSCINICIOSUSP) AS HSCINICIOSUSP ,'
      '   MAX(HSCFINALSUSP)  AS HSCFINALSUSP'
      'FROM'
      '   HISTSUSPCOBEP HSC'
      ''
      'WHERE'
      '    ( HSC.IDCONTRATOEMPTMO =:PIDCONTRATOEMPTMO )'
      'AND ( HSC.HSCDATALIBER IS NOT NULL )'
      
        'AND ( HSC.HSCDATALIBER = (SELECT MAX(HSC.HSCDATALIBER) FROM HIST' +
        'SUSPCOBEP'
      
        '                          WHERE  IDCONTRATOEMPTMO =:PIDCONTRATOE' +
        'MPTMO) )'
      ''
      ''
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 328
    Top = 168
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
    object qryUltimaSuspensaoEncerradaHSCINICIOSUSP: TDateTimeField
      FieldName = 'HSCINICIOSUSP'
    end
    object qryUltimaSuspensaoEncerradaHSCFINALSUSP: TDateTimeField
      FieldName = 'HSCFINALSUSP'
    end
  end
  object qryInsert: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO HISTSUSPCOBEP HSC'
      '('
      'HSC.IDHISTSUSPCOBEP,'
      'HSC.IDTIPOSUSPEMPTMO,'
      'HSC.IDCONTRATOEMPTMO,'
      'HSC.FLGSTATUS,'
      'HSC.FLGFERIAS,'
      'HSC.HSCINICIOSUSP,'
      'HSC.HSCFINALSUSP,'
      'HSC.HSCMESES,'
      'HSC.HSCUSUATEND'
      ')'
      'VALUES'
      '('
      'SEQHISTSUSPCOBEP.NEXTVAL,'
      ':PIDTIPOSUSPEMPTMO,'
      ':PIDCONTRATOEMPTMO,'
      ':PFLGSTATUS,'
      ':PFLGFERIAS,'
      ':PHSCINICIOSUSP,'
      ':PHSCFINALSUSP,'
      ':PHSCMESES,'
      ':PHSCUSUATEND'
      ')')
    ValidateWithMask = True
    Left = 64
    Top = 72
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PIDTIPOSUSPEMPTMO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PFLGSTATUS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PFLGFERIAS'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PHSCINICIOSUSP'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PHSCFINALSUSP'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PHSCMESES'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PHSCUSUATEND'
        ParamType = ptUnknown
      end>
  end
  object qryUpdateContrato: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   CONTRATOEMPTMO'
      'SET'
      '   IDTIPOSUSPEMPTMO  = :PIDTIPOSUSPEMPTMO,'
      '   DATAINICIOSUSP    = :PDATAINICIOSUSP,'
      '   DATAFIMSUSP       = :PDATAFIMSUSP,'
      '   ANOSUSPENSAO      = :PANOSUSPENSAO,'
      '   MESSUSPENSAO      = :PMESSUSPENSAO'
      'WHERE'
      '   IDCONTRATOEMPTMO  = :PIDCONTRATOEMPTMO')
    ValidateWithMask = True
    Left = 192
    Top = 168
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDTIPOSUSPEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAINICIOSUSP'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATAFIMSUSP'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PANOSUSPENSAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PMESSUSPENSAO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
  end
  object qryContrato: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   INS.IDINSCRICAOEMPTMO AS INSCRICAO,'
      '   INS.FLGINTERNET,'
      ''
      '   PPP.INSCRICAONUMERO,'
      ''
      '   DECODE(CON.FLGSITUACAO,'#39'A'#39', '#39'Contrato Ativo'#39','
      '                          '#39'C'#39', '#39'Contrato Cancelado'#39','
      '                          '#39'E'#39', '#39'Contrato Encerrado'#39','
      '                          '#39'Q'#39', '#39'Contrato Quitado'#39','
      '                          '#39'R'#39', '#39'Contrato Refinanciado'#39','
      '                          '#39'S'#39', '#39'Contrato Suspenso'#39','
      '                          '#39'P'#39', '#39'Contrato Pendente de Liberação'#39','
      
        '                          '#39'K'#39', '#39'Contrato Pendente de Quitação'#39') ' +
        'AS DESCSITCONTRATO,'
      ''
      '   DECODE(CON.FLGFORMAPAG,'#39'C'#39', '#39'Contas a Pagar'#39','
      
        '                          '#39'F'#39', '#39'Folha de Pagamento'#39') AS DESCFLGF' +
        'ORMAPAG,'
      ''
      '   DECODE(CON.FLGFORMAREC,'#39'C'#39', '#39'Contas a Receber'#39','
      
        '                          '#39'F'#39', '#39'Folha de Pagamento'#39') AS DESCFLGF' +
        'ORMAREC,'
      ''
      '   FRP.DESCRICAO AS DESCCODFORMAPAG,'
      '   PFP.DESCRICAO AS DESCPORTFORMAPAG,'
      '   PFR.DESCRICAO AS DESCPORTFORMAREC,'
      ''
      '   SIT.FLGINTERNO,'
      ''
      '   PLV.NOME      AS PLANOPREV,'
      '   PPC.NOME      AS PLANOORIGEM,'
      '   JUR.NOME      AS PATRO,'
      ''
      '   NVL(DEP.MATRICULA, ELP.MATRICULA) AS MATRICULA,'
      '   ELP.IDPESSJURCEDIDO,'
      ''
      '   TIT.NOME      AS TITULAR,'
      '   BEN.NOME      AS BENEFICIARIO,'
      ''
      '   TCE.TCEDESCRICAO, TCE.IDTIPOEMPTMO,'
      '   TCE.TCELEGENDAEXIBE, TCE.TCELEGENDACALC,'
      ''
      '   TEP.DESCTIPOEMPTMO,'
      '   INS.DATAINSC,'
      '   BAN.NOME AS BANCO,'
      '   CTB.CONTACORRENTE, AGB.NUMAGENCIA,'
      ''
      
        '   CON.IDCONTRATOEMPTMO , CON.IDCONTRQUITACAO, CON.IDPESSOA     ' +
        '  , CON.IDVERBA     ,'
      
        '   CON.IDTIPOCONTREMPTMO, CON.IDPLANOPREV    , CON.IDPATRO      ' +
        '  , CON.NUMPARCELAS ,'
      
        '   CON.IDINSCRICAOEMPTMO, CON.IDBENEF        , CON.IDCBANCARIA  ' +
        '  , CON.IDCBANCARIADEB,'
      
        '   CON.CODFORMAPAG      , CON.PORTFORMAPAG   , CON.PORTFORMAREC ' +
        '  , CON.DATACANC    ,'
      
        '   CON.DATACREDITO      , CON.DATASITUACAO   , CON.DATAASSINATUR' +
        'A , CON.DATAPRIMPARC,'
      
        '   CON.VLRCONTRATO      , CON.VLRPARCELA     , CON.TXJUROS      ' +
        '  , CON.FLGSITUACAO ,'
      
        '   CON.FLGFORMAREC      , CON.FLGFORMAPAG    , CON.VLRSALBASE   ' +
        '  , CON.VLRMARGEM   , CON.VLRMAXPERMIT,'
      ''
      
        '   CON.MOECODIGO        , CON.IDTIPOSUSPEMPTMO, CON.DATAINICIOSU' +
        'SP, CON.DATAFIMSUSP,'
      
        '   CON.ANOSUSPENSAO     , CON.MESSUSPENSAO    , CON.IDPLANOORIGE' +
        'M ,'
      '   MOE.MOESIGLA         ,'
      '   TSE.TSEDESCRICAO     ,'
      '   RES.NOME AS NOMERESPONSAVEL,'
      ''
      '   BDB.NOME AS BANCODEB,'
      
        '   CTD.CONTACORRENTE AS CONTACORRENTEDEB, AGD.NUMAGENCIA AS NUMA' +
        'GENCIADEB,'
      
        '   DECODE(CON.NUMPARCDESCONTO, NULL, 0, CON.NUMPARCDESCONTO) AS ' +
        'NUMPARCDESCONTO,'
      ''
      '   SIT.IDSITPART,'
      ''
      '   SIT.FLGINTERNO AS SITUACAO_INT,'
      '   SPP.FLGINTERNO AS SITUACAO_INT_PLANO,'
      '   SFU.TIPOSIT    AS SITUACAO_INT_FUNC,'
      ''
      '   SIT.DESCRICAO AS SITUACAO,'
      '   SPP.DESCRICAO AS SITUACAO_PLANO,'
      '   SFU.DESCRICAO AS SITUACAO_FUNC'
      ''
      'FROM'
      '    PESSOA             JUR,'
      '    PESSOA             TIT,'
      '    PESSOA             BEN,'
      '    PESSOA             BAN,'
      '    PESSOA             BDB,'
      '    INSCRICAOEMPTMO    INS,'
      '    CONTRATOEMPTMO     CON,'
      '    PARTPREVPLAN       PPP,'
      '    ELEGPATRO          ELP,'
      '    MOEDA              MOE,'
      '    AGENCIABANCARIA    AGB,'
      '    CONTABANCARIA      CTB,'
      '    AGENCIABANCARIA    AGD,'
      '    CONTABANCARIA      CTD,'
      '    TIPOCONTREMPTMO    TCE,'
      '    TIPOEMPTMO         TEP,'
      '    SITPART            SIT,'
      '    SITPLANOPREV       SPP,'
      '    SITFUNC            SFU,'
      '    PLANPREV           PLV,'
      '    PLANPREVCONTABIL   PPC,'
      '    FORMARECPAG        FRP,'
      '    PORTADORFORMA      PFP,'
      '    PORTADORFORMA      PFR,'
      '    TIPOSUSPEMPTMO     TSE,'
      '    PESSOA             RES,'
      '    DEPENTIT           DEP'
      ''
      'WHERE'
      '       CON.IDCONTRATOEMPTMO   =:PIDCONTRATOEMPTMO'
      '   AND CON.IDPESSOA           = PPP.IDPESSOA'
      '   AND CON.IDPLANOPREV        = PLV.IDPLANOPREV'
      '   AND CON.IDPLANOORIGEM      = PPC.IDPLANOPREV'
      '   AND CON.IDPATRO            = JUR.IDPESSOA'
      '   AND CON.IDPESSOA           = ELP.IDPESSOA'
      '   AND CON.IDPATRO            = ELP.IDPESSJUR'
      '   AND CON.IDPESSOA           = TIT.IDPESSOA'
      '   AND CON.IDBENEF            = BEN.IDPESSOA'
      '   AND CON.IDTIPOCONTREMPTMO  = TCE.IDTIPOCONTREMPTMO'
      '   AND TCE.IDTIPOEMPTMO       = TEP.IDTIPOEMPTMO'
      '   AND CON.IDINSCRICAOEMPTMO  = INS.IDINSCRICAOEMPTMO(+)'
      ''
      '   AND DEP.IDPESSOA           = BEN.IDPESSOA(+)'
      '   AND DEP.IDTITULAR          = CON.IDPESSOA'
      ''
      '   AND CON.IDCBANCARIA        = CTB.IDCBANCARIA(+)'
      '   AND AGB.IDBANCO            = BAN.IDPESSOA(+)'
      '   AND CTB.IDAGENCIA          = AGB.IDPESSOA(+)'
      '   AND AGB.IDBANCO            = BAN.IDPESSOA(+)'
      ''
      '   AND CON.IDCBANCARIADEB     = CTD.IDCBANCARIA(+)'
      '   AND AGD.IDBANCO            = BDB.IDPESSOA(+)'
      '   AND CTD.IDAGENCIA          = AGD.IDPESSOA(+)'
      '   AND AGD.IDBANCO            = BDB.IDPESSOA(+)'
      ''
      '   AND CON.CODFORMAPAG        = FRP.CODFORMA(+)'
      '   AND CON.PORTFORMAPAG       = PFP.CODPORTFORMA(+)'
      '   AND CON.PORTFORMAREC       = PFR.CODPORTFORMA(+)'
      '   AND CON.MOECODIGO          = MOE.MOECODIGO(+)'
      '   AND CON.IDTIPOSUSPEMPTMO   = TSE.IDTIPOSUSPEMPTMO(+)'
      '   AND CON.IDRESPONSAVEL      = RES.IDPESSOA(+)'
      ''
      '   AND PPP.IDSITPART          = SIT.IDSITPART'
      '   AND PPP.IDSITPLANOPREV     = SPP.IDSITPLANOPREV'
      '   AND ELP.IDSITFUNC          = SFU.IDSITFUNC'
      ''
      '   AND PPP.FLGDESATIVADO      = 0')
    ValidateWithMask = True
    Left = 328
    Top = 72
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
    object qryContratoINSCRICAO: TFloatField
      FieldName = 'INSCRICAO'
    end
    object qryContratoFLGINTERNET: TFloatField
      FieldName = 'FLGINTERNET'
    end
    object qryContratoINSCRICAONUMERO: TFloatField
      FieldName = 'INSCRICAONUMERO'
    end
    object qryContratoDESCSITCONTRATO: TStringField
      FieldName = 'DESCSITCONTRATO'
      Size = 30
    end
    object qryContratoDESCFLGFORMAPAG: TStringField
      FieldName = 'DESCFLGFORMAPAG'
      Size = 18
    end
    object qryContratoDESCFLGFORMAREC: TStringField
      FieldName = 'DESCFLGFORMAREC'
      Size = 18
    end
    object qryContratoDESCCODFORMAPAG: TStringField
      FieldName = 'DESCCODFORMAPAG'
      Size = 30
    end
    object qryContratoDESCPORTFORMAPAG: TStringField
      FieldName = 'DESCPORTFORMAPAG'
      Size = 50
    end
    object qryContratoDESCPORTFORMAREC: TStringField
      FieldName = 'DESCPORTFORMAREC'
      Size = 50
    end
    object qryContratoFLGINTERNO: TStringField
      FieldName = 'FLGINTERNO'
      FixedChar = True
      Size = 2
    end
    object qryContratoPLANOPREV: TStringField
      FieldName = 'PLANOPREV'
      Size = 50
    end
    object qryContratoPLANOORIGEM: TStringField
      FieldName = 'PLANOORIGEM'
      Size = 50
    end
    object qryContratoPATRO: TStringField
      FieldName = 'PATRO'
      Size = 60
    end
    object qryContratoMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 15
    end
    object qryContratoIDPESSJURCEDIDO: TFloatField
      FieldName = 'IDPESSJURCEDIDO'
    end
    object qryContratoTITULAR: TStringField
      FieldName = 'TITULAR'
      Size = 60
    end
    object qryContratoBENEFICIARIO: TStringField
      FieldName = 'BENEFICIARIO'
      Size = 60
    end
    object qryContratoTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      Size = 60
    end
    object qryContratoIDTIPOEMPTMO: TFloatField
      FieldName = 'IDTIPOEMPTMO'
    end
    object qryContratoTCELEGENDAEXIBE: TStringField
      FieldName = 'TCELEGENDAEXIBE'
      Size = 10
    end
    object qryContratoTCELEGENDACALC: TStringField
      FieldName = 'TCELEGENDACALC'
      Size = 10
    end
    object qryContratoDESCTIPOEMPTMO: TStringField
      FieldName = 'DESCTIPOEMPTMO'
      Size = 60
    end
    object qryContratoDATAINSC: TDateTimeField
      FieldName = 'DATAINSC'
    end
    object qryContratoBANCO: TStringField
      FieldName = 'BANCO'
      Size = 60
    end
    object qryContratoCONTACORRENTE: TStringField
      FieldName = 'CONTACORRENTE'
      Size = 15
    end
    object qryContratoNUMAGENCIA: TStringField
      FieldName = 'NUMAGENCIA'
      FixedChar = True
      Size = 15
    end
    object qryContratoIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryContratoIDCONTRQUITACAO: TFloatField
      FieldName = 'IDCONTRQUITACAO'
    end
    object qryContratoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryContratoIDVERBA: TFloatField
      FieldName = 'IDVERBA'
    end
    object qryContratoIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryContratoIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryContratoIDPATRO: TFloatField
      FieldName = 'IDPATRO'
    end
    object qryContratoNUMPARCELAS: TFloatField
      FieldName = 'NUMPARCELAS'
    end
    object qryContratoIDINSCRICAOEMPTMO: TFloatField
      FieldName = 'IDINSCRICAOEMPTMO'
    end
    object qryContratoIDBENEF: TFloatField
      FieldName = 'IDBENEF'
    end
    object qryContratoIDCBANCARIA: TFloatField
      FieldName = 'IDCBANCARIA'
    end
    object qryContratoIDCBANCARIADEB: TFloatField
      FieldName = 'IDCBANCARIADEB'
    end
    object qryContratoCODFORMAPAG: TFloatField
      FieldName = 'CODFORMAPAG'
    end
    object qryContratoPORTFORMAPAG: TFloatField
      FieldName = 'PORTFORMAPAG'
    end
    object qryContratoPORTFORMAREC: TFloatField
      FieldName = 'PORTFORMAREC'
    end
    object qryContratoDATACANC: TDateTimeField
      FieldName = 'DATACANC'
    end
    object qryContratoDATACREDITO: TDateTimeField
      FieldName = 'DATACREDITO'
    end
    object qryContratoDATASITUACAO: TDateTimeField
      FieldName = 'DATASITUACAO'
    end
    object qryContratoDATAASSINATURA: TDateTimeField
      FieldName = 'DATAASSINATURA'
    end
    object qryContratoDATAPRIMPARC: TDateTimeField
      FieldName = 'DATAPRIMPARC'
    end
    object qryContratoVLRCONTRATO: TFloatField
      FieldName = 'VLRCONTRATO'
    end
    object qryContratoVLRPARCELA: TFloatField
      FieldName = 'VLRPARCELA'
    end
    object qryContratoTXJUROS: TFloatField
      FieldName = 'TXJUROS'
    end
    object qryContratoFLGSITUACAO: TStringField
      FieldName = 'FLGSITUACAO'
      FixedChar = True
      Size = 1
    end
    object qryContratoFLGFORMAREC: TStringField
      FieldName = 'FLGFORMAREC'
      FixedChar = True
      Size = 1
    end
    object qryContratoFLGFORMAPAG: TStringField
      FieldName = 'FLGFORMAPAG'
      FixedChar = True
      Size = 1
    end
    object qryContratoVLRSALBASE: TFloatField
      FieldName = 'VLRSALBASE'
    end
    object qryContratoVLRMARGEM: TFloatField
      FieldName = 'VLRMARGEM'
    end
    object qryContratoVLRMAXPERMIT: TFloatField
      FieldName = 'VLRMAXPERMIT'
    end
    object qryContratoMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
    end
    object qryContratoIDTIPOSUSPEMPTMO: TFloatField
      FieldName = 'IDTIPOSUSPEMPTMO'
    end
    object qryContratoDATAINICIOSUSP: TDateTimeField
      FieldName = 'DATAINICIOSUSP'
    end
    object qryContratoDATAFIMSUSP: TDateTimeField
      FieldName = 'DATAFIMSUSP'
    end
    object qryContratoANOSUSPENSAO: TFloatField
      FieldName = 'ANOSUSPENSAO'
    end
    object qryContratoMESSUSPENSAO: TFloatField
      FieldName = 'MESSUSPENSAO'
    end
    object qryContratoIDPLANOORIGEM: TFloatField
      FieldName = 'IDPLANOORIGEM'
    end
    object qryContratoMOESIGLA: TStringField
      FieldName = 'MOESIGLA'
      Size = 10
    end
    object qryContratoTSEDESCRICAO: TStringField
      FieldName = 'TSEDESCRICAO'
      Size = 60
    end
    object qryContratoNOMERESPONSAVEL: TStringField
      FieldName = 'NOMERESPONSAVEL'
      Size = 60
    end
    object qryContratoBANCODEB: TStringField
      FieldName = 'BANCODEB'
      Size = 60
    end
    object qryContratoCONTACORRENTEDEB: TStringField
      FieldName = 'CONTACORRENTEDEB'
      Size = 15
    end
    object qryContratoNUMAGENCIADEB: TStringField
      FieldName = 'NUMAGENCIADEB'
      FixedChar = True
      Size = 15
    end
    object qryContratoNUMPARCDESCONTO: TFloatField
      FieldName = 'NUMPARCDESCONTO'
    end
    object qryContratoIDSITPART: TFloatField
      FieldName = 'IDSITPART'
    end
    object qryContratoSITUACAO_INT: TStringField
      FieldName = 'SITUACAO_INT'
      FixedChar = True
      Size = 2
    end
    object qryContratoSITUACAO_INT_PLANO: TStringField
      FieldName = 'SITUACAO_INT_PLANO'
      FixedChar = True
      Size = 2
    end
    object qryContratoSITUACAO_INT_FUNC: TStringField
      FieldName = 'SITUACAO_INT_FUNC'
      FixedChar = True
      Size = 1
    end
    object qryContratoSITUACAO: TStringField
      FieldName = 'SITUACAO'
      Size = 50
    end
    object qryContratoSITUACAO_PLANO: TStringField
      FieldName = 'SITUACAO_PLANO'
      Size = 50
    end
    object qryContratoSITUACAO_FUNC: TStringField
      FieldName = 'SITUACAO_FUNC'
      Size = 60
    end
  end
  object qryEncerraSuspensoes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   HISTSUSPCOBEP HSC'
      'SET'
      '   HSC.FLGSTATUS = '#39'E'#39
      'WHERE'
      '       HSC.HSCFINALSUSP IS NOT NULL'
      '   AND HSC.HSCFINALSUSP <:PHSCFINALSUSP')
    ValidateWithMask = True
    Left = 472
    Top = 168
    ParamData = <
      item
        DataType = ftDate
        Name = 'PHSCFINALSUSP'
        ParamType = ptInput
      end>
    object DateTimeField1: TDateTimeField
      FieldName = 'HSCINICIOSUSP'
    end
  end
end
