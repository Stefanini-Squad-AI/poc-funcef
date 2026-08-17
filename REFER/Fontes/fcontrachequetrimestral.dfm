inherited frmcontrachequetrimestral: Tfrmcontrachequetrimestral
  Left = 162
  Top = 81
  HelpContext = 180001
  BorderStyle = bsDialog
  Caption = 'Geração do Demostrativo de Pagamento'
  ClientHeight = 453
  ClientWidth = 480
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 480
    Height = 414
    object gbMensagem: TGroupBox
      Left = 1
      Top = 242
      Width = 478
      Height = 123
      Align = alBottom
      Caption = ' Mensagem '
      Enabled = False
      TabOrder = 2
      object MaskMENSAGEM1: TMaskEdit
        Left = 13
        Top = 18
        Width = 449
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = []
        MaxLength = 60
        ParentFont = False
        TabOrder = 0
      end
      object MaskMENSAGEM4: TMaskEdit
        Left = 13
        Top = 96
        Width = 449
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = []
        MaxLength = 60
        ParentFont = False
        TabOrder = 3
      end
      object MaskMENSAGEM3: TMaskEdit
        Left = 13
        Top = 69
        Width = 449
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = []
        MaxLength = 60
        ParentFont = False
        TabOrder = 2
      end
      object MaskMENSAGEM2: TMaskEdit
        Left = 13
        Top = 43
        Width = 449
        Height = 23
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Courier New'
        Font.Style = []
        MaxLength = 60
        ParentFont = False
        TabOrder = 1
      end
    end
    object gbVersao: TGroupBox
      Left = 1
      Top = 48
      Width = 478
      Height = 121
      Align = alBottom
      Caption = ' Versões de Pagamento '
      Enabled = False
      TabOrder = 0
      object Label1: TLabel
        Left = 10
        Top = 21
        Width = 46
        Height = 13
        Caption = 'Primeira'
      end
      object Label2: TLabel
        Left = 10
        Top = 47
        Width = 51
        Height = 13
        Caption = 'Segunda'
      end
      object Label3: TLabel
        Left = 10
        Top = 73
        Width = 48
        Height = 13
        Caption = 'Terceira'
      end
      object Label4: TLabel
        Left = 10
        Top = 98
        Width = 39
        Height = 13
        Caption = 'Quarta'
      end
      object dblkprimeiromes: TwwDBLookupCombo
        Left = 71
        Top = 17
        Width = 392
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'HISTORICO'#9'50'#9'HISTORICO')
        LookupTable = qryHist
        LookupField = 'IDHSTFOLHABENEF'
        Options = [loTitles]
        ParentFont = False
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
      object dblksegundomes: TwwDBLookupCombo
        Left = 71
        Top = 43
        Width = 392
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'HISTORICO'#9'50'#9'HISTORICO')
        LookupTable = qryHist1
        LookupField = 'IDHSTFOLHABENEF'
        Options = [loTitles]
        ParentFont = False
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
      object dblkterceiromes: TwwDBLookupCombo
        Left = 71
        Top = 69
        Width = 392
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'HISTORICO'#9'50'#9'HISTORICO')
        LookupTable = qryHist2
        LookupField = 'IDHSTFOLHABENEF'
        Options = [loTitles]
        ParentFont = False
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
      end
      object dblkquartomes: TwwDBLookupCombo
        Left = 71
        Top = 95
        Width = 392
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'HISTORICO'#9'50'#9'HISTORICO'#9'F')
        LookupTable = qryHist3
        LookupField = 'IDHSTFOLHABENEF'
        ParentFont = False
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
      end
    end
    object gbRecebedor: TGroupBox
      Left = 1
      Top = 169
      Width = 478
      Height = 73
      Align = alBottom
      Caption = ' Recebedor '
      Enabled = False
      TabOrder = 1
      object edNome: TEdit
        Left = 6
        Top = 16
        Width = 456
        Height = 21
        Color = clInactiveCaption
        Enabled = False
        TabOrder = 0
      end
      object edTipoPessoa: TEdit
        Left = 6
        Top = 40
        Width = 114
        Height = 23
        AutoSize = False
        Color = clInactiveCaption
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
      end
      object fcsbtnProcurar: TfcShapeBtn
        Left = 293
        Top = 43
        Width = 77
        Height = 18
        Caption = 'Procurar'
        Color = clBtnFace
        DitherColor = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Offsets.TextY = -2
        ParentClipping = True
        ParentFont = False
        RoundRectBias = 25
        ShadeStyle = fbsHighlight
        Shape = bsRoundRect
        TabOrder = 2
        TextOptions.Alignment = taCenter
        TextOptions.LineSpacing = 1
        TextOptions.VAlignment = vaVCenter
        OnClick = fcsbtnProcurarClick
      end
      object fcsbtnLimpa: TfcShapeBtn
        Left = 381
        Top = 43
        Width = 77
        Height = 18
        Caption = 'Limpar'
        Color = clBtnFace
        DitherColor = clWhite
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        NumGlyphs = 0
        Offsets.TextY = -2
        ParentClipping = True
        ParentFont = False
        RoundRectBias = 25
        ShadeStyle = fbsHighlight
        Shape = bsRoundRect
        TabOrder = 3
        TextOptions.Alignment = taCenter
        TextOptions.VAlignment = vaVCenter
        OnClick = fcsbtnLimpaClick
      end
    end
    object gbSalva: TGroupBox
      Left = 1
      Top = 365
      Width = 478
      Height = 48
      Align = alBottom
      Caption = ' Arquivo a ser gerado '
      Enabled = False
      TabOrder = 3
      object Bevel1: TBevel
        Left = 9
        Top = 16
        Width = 380
        Height = 25
      end
      object lblSalvar: TLabel
        Left = 14
        Top = 24
        Width = 369
        Height = 13
        AutoSize = False
        Caption = 'C:\ArqCheque.dat'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object SpeedButton4: TSpeedButton
        Left = 394
        Top = 15
        Width = 72
        Height = 26
        Caption = 'Salvar'
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          555555500000000000005577777777777700557FB8B8B8B8B70057FB8B8B8B8B
          807057F8B8B8B8B870707F8B8B8B8B8B07707FFFFFFFFFF70870777777777777
          7B7057F8B8B8B8B8B87057FB8B8B8FFFFF7057F8B8B8F7777775557FFFFF7555
          5555555777775555555555555555555555555555555555555555}
        OnClick = SpeedButton4Click
      end
    end
    object RdoTipoContraCheque: TRadioGroup
      Left = 1
      Top = 1
      Width = 478
      Height = 36
      Align = alTop
      Caption = 'Tipo de ContraCheque'
      Columns = 2
      Items.Strings = (
        '&Trimestral'
        '&Quadrimestral')
      TabOrder = 4
      OnClick = RdoTipoContraChequeClick
    end
  end
  inherited Dock971: TDock97
    Top = 414
    Width = 480
    inherited tb97Fundo: TToolbar97
      Left = 308
      DockPos = 350
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 139
      DockPos = 146
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 427
    Top = 65531
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryHist: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDHSTFOLHABENEF,'
      '  IDHSTFOLHABENEF||'#39' - '#39'||HISTORICO AS HISTORICO'
      ''
      'FROM'
      '  HSTFOLHABENEF'
      ''
      'ORDER BY'
      '  IDHSTFOLHABENEF DESC'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 92
    Top = 65
    object qryHistHISTORICO: TStringField
      DisplayWidth = 50
      FieldName = 'HISTORICO'
      Origin = 'HSTFOLHABENEF.HISTORICO'
      Size = 50
    end
    object qryHistIDHSTFOLHABENEF: TFloatField
      DisplayWidth = 10
      FieldName = 'IDHSTFOLHABENEF'
      Origin = 'HSTFOLHABENEF.IDHSTFOLHABENEF'
      Visible = False
    end
  end
  object qryHist1: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDHSTFOLHABENEF,'
      '  IDHSTFOLHABENEF||'#39' - '#39'||HISTORICO AS HISTORICO'
      ''
      'FROM'
      '  HSTFOLHABENEF'
      ''
      'ORDER BY'
      '  IDHSTFOLHABENEF DESC'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 144
    Top = 97
    object qryHist1IDHSTFOLHABENEF: TFloatField
      FieldName = 'IDHSTFOLHABENEF'
      Origin = 'HSTFOLHABENEF.IDHSTFOLHABENEF'
    end
    object qryHist1HISTORICO: TStringField
      FieldName = 'HISTORICO'
      Origin = 'HSTFOLHABENEF.HISTORICO'
      Size = 50
    end
  end
  object qryHist2: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDHSTFOLHABENEF,'
      '  IDHSTFOLHABENEF||'#39' - '#39'||HISTORICO AS HISTORICO'
      ''
      'FROM'
      '  HSTFOLHABENEF'
      ''
      'ORDER BY'
      '  IDHSTFOLHABENEF DESC'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 188
    Top = 121
    object qryHist2HISTORICO: TStringField
      DisplayWidth = 50
      FieldName = 'HISTORICO'
      Origin = 'HSTFOLHABENEF.HISTORICO'
      Size = 50
    end
    object qryHist2IDHSTFOLHABENEF: TFloatField
      FieldName = 'IDHSTFOLHABENEF'
      Origin = 'HSTFOLHABENEF.IDHSTFOLHABENEF'
      Visible = False
    end
  end
  object qrycontracheque: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  G.BENEFICIARIO,'
      '  G.MATRICULA,'
      '  G.NUMDOCUMENTO,'
      '  G.BANCO,'
      '  G.AGENCIA,'
      '  G.CONTACORRENTE,'
      '  G.DESCRPROVDESC,'
      '  G.MESREFERENCIA,'
      '  G.VALOR,'
      '  G.FLGDESCONTO,'
      '  G.FLGESPECIAL,'
      '  G.LOGRADOURO,'
      '  G.NUMERO,'
      '  G.COMPLEMENTO,'
      '  G.BAIRRO,'
      '  G.CIDADE,'
      '  G.CODESTADO,'
      '  G.CEP,'
      '  G.IDRESPONSAVEL,'
      '  G.IDHSTFOLHABENEF,'
      '  G.NUMDEPIRRF,'
      '  G.NUMSEQUENCIA,'
      '  G.SEQRUBRICA'
      ''
      'FROM'
      '  (SELECT'
      '     PES.NOME AS BENEFICIARIO,'
      '     ELEG.MATRICULA,'
      '     PES.NUMDOCUMENTO,'
      '     PESB.NOME AS BANCO,'
      '     PESA.NOME AS AGENCIA,'
      '     HIST.CONTACORRENTE,'
      '     RUP.DESCRPROVDESC  ,'
      '     HIST.MES AS MESREFERENCIA,'
      '     HIST.VALORPROVENTO AS VALOR,'
      '     PROV.FLGDESCONTO,'
      '     PROV.FLGESPECIAL,'
      '     ENDP.LOGRADOURO,'
      '     ENDP.NUMERO,'
      '     ENDP.COMPLEMENTO,'
      '     ENDP.BAIRRO,'
      '     CID.NOME AS CIDADE,'
      '     EST.CODESTADO,'
      '     ENDP.CEP,'
      '     HIST.IDRESPONSAVEL,'
      '     HIST.IDHSTFOLHABENEF,'
      '     PF.NUMDEPIRRF,'
      '     NVL(DT.NUMSEQUENCIA-1,0) AS NUMSEQUENCIA,'
      '     HIST.SEQRUBRICA'
      ''
      '   FROM'
      '     HISTRUBSAL HIST,'
      '     PESSOA PES,'
      '     ELEGPATRO ELEG,'
      '     CONTABANCARIA BAN,'
      '     AGENCIABANCARIA AG,'
      '     PESSOA PESB,'
      '     PESSOA PESA,'
      '     RUBRICAXPESS RUP,'
      '     PROVDESC PROV,'
      '     ENDPESS  ENDP,'
      '     PESSOAFISICA PF,'
      '     CIDADES CID,'
      '     ESTADO EST,'
      '     DEPENTIT DT'
      ''
      '   WHERE'
      '     HIST.IDHSTFOLHABENEF = :HIST1               AND'
      '     PES.IDPESSOA         = HIST.IDRESPONSAVEL   AND'
      '     ELEG.IDPESSOA        = HIST.IDTITULAR       AND'
      '     BAN.IDPESSOA (+)     = HIST.IDRESPONSAVEL   AND'
      '     AG.IDPESSOA (+)      = BAN.IDAGENCIA        AND'
      '     PESB.IDPESSOA (+)    = AG.IDBANCO           AND'
      '     PESA.IDPESSOA (+)    = AG.IDPESSOA          AND'
      '     PROV.IDPROVENTO      = HIST.IDRUBRICA       AND'
      '     RUP.IDRUBRICA        = PROV.IDPROVENTO      AND'
      '     RUP.IDPESSOA         = HIST.IDPESSJUR       AND'
      '     ENDP.IDENDERECO      = PES.IDENDRESIDENCIAL AND'
      '     PF.IDPESSOA          = HIST.IDRESPONSAVEL   AND'
      '     CID.IDCIDADES(+)     = ENDP.IDCIDADES       AND'
      '     EST.IDESTADO(+)      = CID.IDESTADO         AND'
      '     DT.IDTITULAR         = HIST.IDTITULAR       AND'
      '     DT.IDPESSOA(+)       = HIST.IDRESPONSAVEL'
      ''
      'UNION'
      ''
      '   SELECT PES.NOME AS BENEFICIARIO,'
      '     ELEG.MATRICULA,'
      '     PES.NUMDOCUMENTO,'
      '     PESB.NOME AS BANCO,'
      '     PESA.NOME AS AGENCIA,'
      '     HIST.CONTACORRENTE,'
      '     RUP.DESCRPROVDESC  ,'
      '     HIST.MES AS MESREFERENCIA,'
      '     HIST.VALORPROVENTO AS VALOR,'
      '     PROV.FLGDESCONTO,'
      '     PROV.FLGESPECIAL,'
      '     ENDP.LOGRADOURO,'
      '     ENDP.NUMERO,'
      '     ENDP.COMPLEMENTO,'
      '     ENDP.BAIRRO,'
      '     CID.NOME AS CIDADE,'
      '     EST.CODESTADO,'
      '     ENDP.CEP ,'
      '     HIST.IDRESPONSAVEL,'
      '     HIST.IDHSTFOLHABENEF,'
      '     PF.NUMDEPIRRF,'
      '     NVL(DT.NUMSEQUENCIA-1,0) AS NUMSEQUENCIA,'
      '     HIST.SEQRUBRICA'
      ''
      '   FROM'
      '     HISTRUBSAL HIST,'
      '     PESSOA PES,'
      '     ELEGPATRO ELEG,'
      '     CONTABANCARIA BAN,'
      '     AGENCIABANCARIA AG,'
      '     PESSOA PESB,'
      '     PESSOA PESA,'
      '     RUBRICAXPESS RUP,'
      '     PROVDESC PROV,'
      '     ENDPESS  ENDP,'
      '     PESSOAFISICA PF,'
      '     CIDADES CID,'
      '     ESTADO EST,'
      '     DEPENTIT DT'
      ''
      '   WHERE'
      '     HIST.IDHSTFOLHABENEF = :HIST2               AND'
      '     PES.IDPESSOA         = HIST.IDRESPONSAVEL   AND'
      '     ELEG.IDPESSOA        = HIST.IDTITULAR       AND'
      '     BAN.IDPESSOA (+)     = HIST.IDRESPONSAVEL   AND'
      '     AG.IDPESSOA (+)      = BAN.IDAGENCIA        AND'
      '     PESB.IDPESSOA (+)    = AG.IDBANCO           AND'
      '     PESA.IDPESSOA (+)    = AG.IDPESSOA          AND'
      '     PROV.IDPROVENTO      = HIST.IDRUBRICA       AND'
      '     RUP.IDRUBRICA        = PROV.IDPROVENTO      AND'
      '     RUP.IDPESSOA         = HIST.IDPESSJUR       AND'
      '     ENDP.IDENDERECO      = PES.IDENDRESIDENCIAL AND'
      '     PF.IDPESSOA          = HIST.IDRESPONSAVEL   AND'
      '     CID.IDCIDADES(+)     = ENDP.IDCIDADES       AND'
      '     EST.IDESTADO(+)      = CID.IDESTADO         AND'
      '     DT.IDTITULAR         = HIST.IDTITULAR       AND'
      '     DT.IDPESSOA(+)       = HIST.IDRESPONSAVEL'
      ''
      'UNION'
      ''
      '   SELECT'
      '     PES.NOME AS BENEFICIARIO,'
      '     ELEG.MATRICULA,'
      '     PES.NUMDOCUMENTO,'
      '     PESB.NOME AS BANCO,'
      '     PESA.NOME AS AGENCIA,'
      '     HIST.CONTACORRENTE,'
      '     RUP.DESCRPROVDESC  ,'
      '     HIST.MES AS MESREFERENCIA,'
      '     HIST.VALORPROVENTO AS VALOR,'
      '     PROV.FLGDESCONTO,'
      '     PROV.FLGESPECIAL,'
      '     ENDP.LOGRADOURO,'
      '     ENDP.NUMERO,'
      '     ENDP.COMPLEMENTO,'
      '     ENDP.BAIRRO,'
      '     CID.NOME AS CIDADE,'
      '     EST.CODESTADO,'
      '     ENDP.CEP ,'
      '     HIST.IDRESPONSAVEL,'
      '     HIST.IDHSTFOLHABENEF,'
      '     PF.NUMDEPIRRF,'
      '     NVL(DT.NUMSEQUENCIA-1,0) AS NUMSEQUENCIA,'
      '     HIST.SEQRUBRICA'
      ''
      '   FROM'
      '     HISTRUBSAL HIST,'
      '     PESSOA PES,'
      '     ELEGPATRO ELEG,'
      '     CONTABANCARIA BAN,'
      '     AGENCIABANCARIA AG,'
      '     PESSOA PESB,'
      '     PESSOA PESA,'
      '     RUBRICAXPESS RUP,'
      '     PROVDESC PROV,'
      '     ENDPESS  ENDP,'
      '     PESSOAFISICA PF,'
      '     CIDADES CID,'
      '     ESTADO EST,'
      '     DEPENTIT DT'
      ''
      '   WHERE'
      '     HIST.IDHSTFOLHABENEF = :HIST3               AND'
      '     PES.IDPESSOA         = HIST.IDRESPONSAVEL   AND'
      '     ELEG.IDPESSOA        = HIST.IDTITULAR       AND'
      '     BAN.IDPESSOA (+)     = HIST.IDRESPONSAVEL   AND'
      '     AG.IDPESSOA (+)      = BAN.IDAGENCIA        AND'
      '     PESB.IDPESSOA (+)    = AG.IDBANCO           AND'
      '     PESA.IDPESSOA (+)    = AG.IDPESSOA          AND'
      '     PROV.IDPROVENTO      = HIST.IDRUBRICA       AND'
      '     RUP.IDRUBRICA        = PROV.IDPROVENTO      AND'
      '     RUP.IDPESSOA         = HIST.IDPESSJUR       AND'
      '     ENDP.IDENDERECO      = PES.IDENDRESIDENCIAL AND'
      '     PF.IDPESSOA          = HIST.IDRESPONSAVEL   AND'
      '     CID.IDCIDADES(+)     = ENDP.IDCIDADES       AND'
      '     EST.IDESTADO(+)      = CID.IDESTADO         AND'
      '     DT.IDTITULAR         = HIST.IDTITULAR       AND'
      '     DT.IDPESSOA(+)       = HIST.IDRESPONSAVEL'
      ''
      'UNION'
      ''
      '   SELECT'
      '     PES.NOME AS BENEFICIARIO,'
      '     ELEG.MATRICULA,'
      '     PES.NUMDOCUMENTO,'
      '     PESB.NOME AS BANCO,'
      '     PESA.NOME AS AGENCIA,'
      '     HIST.CONTACORRENTE,'
      '     RUP.DESCRPROVDESC  ,'
      '     HIST.MES AS MESREFERENCIA,'
      '     HIST.VALORPROVENTO AS VALOR,'
      '     PROV.FLGDESCONTO,'
      '     PROV.FLGESPECIAL,'
      '     ENDP.LOGRADOURO,'
      '     ENDP.NUMERO,'
      '     ENDP.COMPLEMENTO,'
      '     ENDP.BAIRRO,'
      '     CID.NOME AS CIDADE,'
      '     EST.CODESTADO,'
      '     ENDP.CEP ,'
      '     HIST.IDRESPONSAVEL,'
      '     HIST.IDHSTFOLHABENEF,'
      '     PF.NUMDEPIRRF,'
      '     NVL(DT.NUMSEQUENCIA-1,0) AS NUMSEQUENCIA,'
      '     HIST.SEQRUBRICA'
      ''
      '   FROM'
      '     HISTRUBSAL HIST,'
      '     PESSOA PES,'
      '     ELEGPATRO ELEG,'
      '     CONTABANCARIA BAN,'
      '     AGENCIABANCARIA AG,'
      '     PESSOA PESB,'
      '     PESSOA PESA,'
      '     RUBRICAXPESS RUP,'
      '     PROVDESC PROV,'
      '     ENDPESS  ENDP,'
      '     PESSOAFISICA PF,'
      '     CIDADES CID,'
      '     ESTADO EST,'
      '     DEPENTIT DT'
      ''
      '   WHERE'
      '     HIST.IDHSTFOLHABENEF = :HIST4               AND'
      '     PES.IDPESSOA         = HIST.IDRESPONSAVEL   AND'
      '     ELEG.IDPESSOA        = HIST.IDTITULAR       AND'
      '     BAN.IDPESSOA (+)     = HIST.IDRESPONSAVEL   AND'
      '     AG.IDPESSOA (+)      = BAN.IDAGENCIA        AND'
      '     PESB.IDPESSOA (+)    = AG.IDBANCO           AND'
      '     PESA.IDPESSOA (+)    = AG.IDPESSOA          AND'
      '     PROV.IDPROVENTO      = HIST.IDRUBRICA       AND'
      '     RUP.IDRUBRICA        = PROV.IDPROVENTO      AND'
      '     RUP.IDPESSOA         = HIST.IDPESSJUR       AND'
      '     ENDP.IDENDERECO      = PES.IDENDRESIDENCIAL AND'
      '     PF.IDPESSOA          = HIST.IDRESPONSAVEL   AND'
      '     CID.IDCIDADES(+)     = ENDP.IDCIDADES       AND'
      '     EST.IDESTADO(+)      = CID.IDESTADO         AND'
      '     DT.IDTITULAR         = HIST.IDTITULAR       AND'
      '     DT.IDPESSOA(+)       = HIST.IDRESPONSAVEL  ) G'
      ''
      'ORDER BY'
      '  G.CEP,'
      '  G.IDRESPONSAVEL,'
      '  G.IDHSTFOLHABENEF,'
      '  G.FLGDESCONTO,'
      '  G.SEQRUBRICA'
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 376
    Top = 224
    ParamData = <
      item
        DataType = ftFloat
        Name = 'HIST1'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'HIST2'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'HIST3'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'HIST4'
        ParamType = ptUnknown
      end>
    object qrycontrachequeBENEFICIARIO: TStringField
      FieldName = 'BENEFICIARIO'
      Size = 60
    end
    object qrycontrachequeMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 13
    end
    object qrycontrachequeNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Size = 18
    end
    object qrycontrachequeBANCO: TStringField
      FieldName = 'BANCO'
      Size = 60
    end
    object qrycontrachequeAGENCIA: TStringField
      FieldName = 'AGENCIA'
      Size = 60
    end
    object qrycontrachequeCONTACORRENTE: TStringField
      FieldName = 'CONTACORRENTE'
      Size = 15
    end
    object qrycontrachequeDESCRPROVDESC: TStringField
      FieldName = 'DESCRPROVDESC'
      Size = 130
    end
    object qrycontrachequeMESREFERENCIA: TStringField
      FieldName = 'MESREFERENCIA'
      Size = 7
    end
    object qrycontrachequeVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object qrycontrachequeFLGDESCONTO: TFloatField
      FieldName = 'FLGDESCONTO'
    end
    object qrycontrachequeLOGRADOURO: TStringField
      FieldName = 'LOGRADOURO'
      Size = 60
    end
    object qrycontrachequeBAIRRO: TStringField
      FieldName = 'BAIRRO'
    end
    object qrycontrachequeCIDADE: TStringField
      FieldName = 'CIDADE'
    end
    object qrycontrachequeCODESTADO: TStringField
      FieldName = 'CODESTADO'
      Size = 3
    end
    object qrycontrachequeCEP: TStringField
      FieldName = 'CEP'
      Size = 8
    end
    object qrycontrachequeIDRESPONSAVEL: TFloatField
      FieldName = 'IDRESPONSAVEL'
    end
    object qrycontrachequeIDHSTFOLHABENEF: TFloatField
      FieldName = 'IDHSTFOLHABENEF'
    end
    object qrycontrachequeNUMDEPIRRF: TFloatField
      FieldName = 'NUMDEPIRRF'
    end
    object qrycontrachequeNUMSEQUENCIA: TFloatField
      FieldName = 'NUMSEQUENCIA'
    end
    object qrycontrachequeNUMERO: TStringField
      FieldName = 'NUMERO'
      Size = 8
    end
    object qrycontrachequeCOMPLEMENTO: TStringField
      FieldName = 'COMPLEMENTO'
    end
    object qrycontrachequeSEQRUBRICA: TFloatField
      FieldName = 'SEQRUBRICA'
    end
    object qrycontrachequeFLGESPECIAL: TFloatField
      FieldName = 'FLGESPECIAL'
    end
  end
  object msRecebedor: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'E.MATRICULA'
      'PP.INSCRICAONUMERO'
      'PT.NOME'
      'PR.NOME'
      'PV.NOME'
      'PJ.NOME')
    TipodeDado.Strings = (
      'C'
      'N'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula na Patrocinadora'
      'Número de Inscrição'
      'Nome do Titular'
      'Nome do Recebedor'
      'Plano Previdenciário'
      'Patrocinadora')
    SensivelACaixa.Strings = (
      'S'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'HISTRUBSAL H'
      'ELEGPATRO E'
      'PARTPREVPLAN PP'
      'PESSOA PT'
      'PESSOA PR'
      'PESSOA PJ'
      'PLANPREV PV')
    CamposChave.Strings = (
      'PP.INSCRICAONUMERO'
      'E.MATRICULA'
      'PT.NOME'
      'PR.NOME'
      'H.IDTITULAR'
      'H.IDRESPONSAVEL'
      'H.IDPESSJUR'
      'H.MESCOBRANCA'
      'H.IDPATRO'
      'H.IDPLANOPREV'
      'H.IDPESSOA'
      'PV.NOME')
    Filtro.Strings = (
      'H.IDPATRO = PP.IDPESSJUR'
      'H.IDTITULAR = PP.IDPESSOA'
      'H.IDPLANOPREV = PP.IDPLANOPREV'
      'H.IDTITULAR = E.IDPESSOA'
      'H.IDPATRO = E.IDPESSJUR'
      'H.IDTITULAR = PT.IDPESSOA'
      'H.IDRESPONSAVEL = PR.IDPESSOA'
      'NVL(H.FLGESTORNO,0) = 0'
      'H.IDPATRO = PJ.IDPESSOA'
      'H.IDPLANOPREV = PV.IDPLANOPREV')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '13'
      '10'
      '40'
      '40'
      '40'
      '40')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = True
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 369
    Top = 85
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 281
    Top = 61
  end
  object dlgArquivo: TSaveDialog
    DefaultExt = '*.dat'
    Filter = 'Arquivo Dat|*.dat|Arquivo Texto|*.txt|Todos Arquivos|*.*'
    Title = 'Arquivo Contra-Cheque'
    Left = 405
    Top = 141
  end
  object qryHist3: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDHSTFOLHABENEF,'
      '  IDHSTFOLHABENEF||'#39' - '#39'||HISTORICO AS HISTORICO'
      ''
      'FROM'
      '  HSTFOLHABENEF'
      ''
      'ORDER BY'
      '  IDHSTFOLHABENEF DESC'
      ' ')
    ValidateWithMask = True
    Left = 237
    Top = 152
    object qryHist3HISTORICO: TStringField
      DisplayWidth = 50
      FieldName = 'HISTORICO'
      Origin = 'BASEDADOS.HSTFOLHABENEF.HISTORICO'
      Size = 50
    end
    object qryHist3IDHSTFOLHABENEF: TFloatField
      FieldName = 'IDHSTFOLHABENEF'
      Origin = 'BASEDADOS.HSTFOLHABENEF.IDHSTFOLHABENEF'
      Visible = False
    end
  end
end
