inherited frmConsPendenciaBolsa: TfrmConsPendenciaBolsa
  Left = 118
  Top = 133
  HelpContext = 790541
  Caption = 'Consulta Operações Pendentes'
  ClientHeight = 463
  ClientWidth = 788
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 788
    Height = 424
    object DBGrid1: TwwDBGrid
      Left = 1
      Top = 26
      Width = 786
      Height = 397
      Selected.Strings = (
        'DATAOPERACAO'#9'11'#9'Operação'#9'F'
        'SGLCORRETVALORES'#9'12'#9'Corretora'#9'F'
        'DESCINVESTIMENTO'#9'14'#9'Investimento'#9'F'
        'CODTIPOACAO'#9'4'#9'Tipo '#9'F'
        'DESCTIPOOPERACAO'#9'9'#9'Operação'#9'F'
        'DATAVENCOPER'#9'10'#9'Liquidação'#9'F'
        'QTDEOPERACAO'#9'15'#9'Quantidade'#9'F'
        'PRECOUNITOPERACAO'#9'10'#9'PU'#9'F'
        'VLROPERACAO'#9'16'#9'Valor da Operação'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
      Align = alClient
      Color = clWhite
      DataSource = DsConsulta
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap]
      ParentFont = False
      TabOrder = 0
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clMaroon
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 2
      TitleButtons = False
      OnDblClick = DBGrid1DblClick
      IndicatorColor = icYellow
    end
    object Panel11: TPanel
      Left = 1
      Top = 1
      Width = 786
      Height = 25
      Align = alTop
      BevelInner = bvLowered
      BevelOuter = bvNone
      Caption = 'Consulta Operações Pendentes'
      Color = clNavy
      Enabled = False
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
  end
  inherited Dock971: TDock97
    Top = 424
    Width = 788
    inherited tb97Fundo: TToolbar97
      Left = 362
      DockPos = 362
      inherited sep1: TToolbarSep97
        Left = 84
      end
      inherited sep3: TToolbarSep97
        Left = 171
      end
      inherited bbtnSair: TBitBtn
        Width = 84
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 87
        Width = 84
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited ToolbarSep971: TToolbarSep97
        Left = 84
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 84
        Caption = '&Visualizar'
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 87
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 554
    Top = 179
  end
  object QryConsulta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '      BV.SGLBOLSAVALORES, OI.DATAOPERACAO, OI.DATAVENCOPER,     ' +
        '         '
      
        '      OP.QTDEPENDENTE AS QTDEOPERACAO, OI.IDOPERACAOINVEST,     ' +
        '         '
      '      OI.PRECOUNITOPERACAO, AB.QTDELOTE, CV.SGLCORRETVALORES,'
      
        '      ROUND(((OP.QTDEPENDENTE/NVL(AB.QTDELOTE,1))*OI.PRECOUNITOP' +
        'ERACAO)-0.0049,2) AS VLROPERACAO, '
      
        '      SUBSTR(ME.DESCMERCADO,1,10) AS DESCMERCADO,               ' +
        '         '
      
        '      PS.NOME, SUBSTR(IV.DESCINVESTIMENTO,1,15) AS DESCINVESTIME' +
        'NTO,     '
      
        '      SIGLATIPOOPER AS DESCTIPOOPERACAO, OI.NUMDOCUMENTO,       ' +
        '         '
      
        '      TI.NATUREZAOPERACAO, OI.IDTIPOOPERACAO, TI.IDTIPOINVEST,  ' +
        '         '
      
        '      OI.IDTIPOOPERACAO, OI.IDFORCLI, OI.IDCARTEIRAINVEST,      ' +
        '         '
      
        '      AC.CODTIPOACAO, OI.MOECODIGO, OI.IDINVESTIMENTO, OI.IDLOTE' +
        ',        '
      '      OI.IDCORRETVALORES, OI.EMPRESAPROP, OI.IDOPERACAOORIGEM'
      '           '
      
        'FROM PESSOA PS, CM.OPERACAOPENDENTE OP, CM.ACOESXBOLSA AB,      ' +
        '         '
      '     CM.OPERACAOINVEST OI, CM.OPRACAO OA, BOLSAVALORES BV,   '
      
        '     CM.INVESTIMENTO IV, CM.TIPOOPERACAO TI, CM.MERCADO ME, CM.A' +
        'CAO AC,'
      '     CORRETVALORES CV'
      ''
      
        'WHERE (OP.IDOPERACAOINVEST = OI.IDOPERACAOINVEST)    AND        ' +
        '         '
      
        '      (OI.IDOPERACAOINVEST = OA.IDOPERACAOINVEST)    AND        ' +
        '         '
      
        '      (OI.IDCORRETVALORES  = PS.IDPESSOA(+)) '#9'     AND          ' +
        '       '
      
        '      (OA.IDBOLSAVALORES   = BV.IDBOLSAVALORES)'#9'     AND        ' +
        '         '
      '      (OA.IDACAO '#9'   = IV.IDINVESTIMENTO)      AND'
      '      (TI.IDMERCADO        = ME.IDMERCADO)'#9'     AND'
      '      (OI.IDTIPOOPERACAO   = TI.IDTIPOOPERACAO)      AND'
      '      (OI.IDINVESTIMENTO   = AC.IDACAO)              AND'
      '      (AB.IDACAO           = AC.IDACAO)              AND'
      '      (AB.IDBOLSAVALORES   = BV.IDBOLSAVALORES)      AND'
      '      (CV.IDCORRETVALORES  = OI.IDCORRETVALORES)'
      ''
      ' ')
    ValidateWithMask = True
    Left = 613
    Top = 180
    object QryConsultaDATAOPERACAO: TDateTimeField
      DisplayLabel = 'Operação'
      DisplayWidth = 11
      FieldName = 'DATAOPERACAO'
    end
    object QryConsultaSGLCORRETVALORES: TStringField
      DisplayLabel = 'Corretora'
      DisplayWidth = 12
      FieldName = 'SGLCORRETVALORES'
      Size = 10
    end
    object p: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 14
      FieldName = 'DESCINVESTIMENTO'
      Size = 15
    end
    object QryConsultaCODTIPOACAO: TStringField
      DisplayLabel = 'Tipo '
      DisplayWidth = 4
      FieldName = 'CODTIPOACAO'
      Size = 5
    end
    object t: TStringField
      DisplayLabel = 'Operação'
      DisplayWidth = 9
      FieldName = 'DESCTIPOOPERACAO'
      Size = 4
    end
    object QryConsultaDATAVENCOPER: TDateTimeField
      DisplayLabel = 'Liquidação'
      DisplayWidth = 10
      FieldName = 'DATAVENCOPER'
    end
    object QryConsultaQTDEOPERACAO: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 15
      FieldName = 'QTDEOPERACAO'
      DisplayFormat = '###,###,###,###,###0'
    end
    object QryConsultaPRECOUNITOPERACAO: TFloatField
      DisplayLabel = 'PU'
      DisplayWidth = 10
      FieldName = 'PRECOUNITOPERACAO'
      DisplayFormat = '###,###,###0.000'
    end
    object QryConsultaVLROPERACAO: TFloatField
      DisplayLabel = 'Valor da Operação'
      DisplayWidth = 16
      FieldName = 'VLROPERACAO'
      DisplayFormat = '###,###,###,###0.00'
    end
    object i: TStringField
      DisplayLabel = 'Bolsa'
      DisplayWidth = 8
      FieldName = 'SGLBOLSAVALORES'
      Visible = False
      Size = 10
    end
    object QryConsultaDESCMERCADO: TStringField
      DisplayLabel = 'Mercado'
      DisplayWidth = 7
      FieldName = 'DESCMERCADO'
      Visible = False
      Size = 10
    end
    object QryConsultaIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
      Visible = False
    end
    object QryConsultaNOME: TStringField
      FieldName = 'NOME'
      Visible = False
      Size = 60
    end
    object QryConsultaNUMDOCUMENTO: TStringField
      FieldName = 'NUMDOCUMENTO'
      Visible = False
      Size = 30
    end
    object QryConsultaNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      Visible = False
      Size = 1
    end
    object QryConsultaIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Visible = False
    end
    object QryConsultaIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Visible = False
    end
    object s: TFloatField
      FieldName = 'IDTIPOOPERACAO_1'
      Visible = False
    end
    object QryConsultaIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Visible = False
    end
    object QryConsultaIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object QryConsultaMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Visible = False
    end
    object QryConsultaIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
    object QryConsultaIDLOTE: TStringField
      FieldName = 'IDLOTE'
      Visible = False
      Size = 10
    end
    object QryConsultaIDCORRETVALORES: TFloatField
      FieldName = 'IDCORRETVALORES'
      Visible = False
    end
    object QryConsultaQTDELOTE: TFloatField
      FieldName = 'QTDELOTE'
      Visible = False
    end
    object QryConsultaEMPRESAPROP: TFloatField
      FieldName = 'EMPRESAPROP'
      Visible = False
    end
    object QryConsultaIDOPERACAOORIGEM: TFloatField
      FieldName = 'IDOPERACAOORIGEM'
      Visible = False
    end
  end
  object DsConsulta: TwwDataSource
    AutoEdit = False
    DataSet = QryConsulta
    Left = 661
    Top = 179
  end
end
