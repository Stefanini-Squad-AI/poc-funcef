inherited cfgRelHistXTmpDesc: TcfgRelHistXTmpDesc
  Left = 286
  Top = 272
  Caption = 'Divergências entre Histórico e TMPDESC'
  ClientHeight = 195
  ClientWidth = 431
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 431
    Height = 162
    object GroupBox1: TGroupBox
      Left = 16
      Top = 80
      Width = 353
      Height = 65
      TabOrder = 0
      object chkCorLinha: TCheckBox
        Left = 16
        Top = 40
        Width = 233
        Height = 17
        Caption = 'Imprimir linhas com cores alternadas: '
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object cboCorLinha: TfcColorCombo
        Left = 250
        Top = 38
        Width = 87
        Height = 21
        AlignmentVertical = fcavCenter
        AutoSelect = False
        ColorDialogOptions = []
        ColorListOptions.ColorWidth = 119
        ColorListOptions.Font.Charset = DEFAULT_CHARSET
        ColorListOptions.Font.Color = clWindowText
        ColorListOptions.Font.Height = -11
        ColorListOptions.Font.Name = 'MS Sans Serif'
        ColorListOptions.Font.Style = []
        ColorListOptions.GreyScaleIncrement = 1
        ColorListOptions.Options = [ccoShowCustomColors]
        CustomColors.Strings = (
          'ColorA=FFFFFF'
          'ColorC=00C0FFFF'
          'ColorD=00C6F9CC'
          'ColorE=00F3E6CD'
          'ColorF=00A0A0A0'
          'ColorG=00BEBEBE'
          'ColorH=00D2D2D2'
          'ColorI=00E3E3E3')
        DropDownCount = 8
        DropDownWidth = 8
        ReadOnly = False
        ShowMatchText = False
        SelectedColor = clWhite
        TabOrder = 1
      end
      object chkLinhas: TCheckBox
        Left = 16
        Top = 16
        Width = 321
        Height = 17
        Caption = 'Imprimir linhas separadoras'
        TabOrder = 2
      end
    end
    object Panel1: TPanel
      Left = 16
      Top = 16
      Width = 289
      Height = 57
      TabOrder = 1
      object Label15: TLabel
        Left = 40
        Top = 10
        Width = 116
        Height = 13
        Caption = 'Cobrança (mês/ano)'
      end
      object DBspnAno: TwwDBSpinEdit
        Left = 192
        Top = 24
        Width = 65
        Height = 21
        Increment = 1
        MaxValue = 2500
        MinValue = 1850
        TabOrder = 1
        UnboundDataType = wwDefault
      end
      object cboMes: TComboBox
        Left = 40
        Top = 24
        Width = 153
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        Items.Strings = (
          'Janeiro'
          'Fevereiro'
          'Março'
          'Abril'
          'Maio'
          'Junho'
          'Julho'
          'Agosto'
          'Setembro'
          'Outubro'
          'Novembro'
          'Dezembro')
      end
    end
  end
  inherited Dock971: TDock97
    Top = 162
    Width = 431
    inherited tb97Fundo: TToolbar97
      Left = 259
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 87
    end
  end
  object qryTmpDesc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT /*+ INDEX(TMP) */'
      '   '#39'Não existe na HISTMOVEMPTMO'#39' AS ERRO,'
      '   TMP.MESREFERENCIA   AS REFERENCIA,'
      '   TMP.IDDESCONTO      AS CONTRATO,'
      '   TMP.MESCOBRANCA     AS COBRANCA,'
      '   TMP.IDPROVENTO      AS RUBRICA,'
      '   TMP.VALORRECEBIDO   AS VALOR'
      'FROM'
      '   TMPDESC TMP, CONTRATOEMPTMO CNT'
      'WHERE'
      '       ( LTRIM(RTRIM(TMP.MESCOBRANCA))   =:PANOMESCOBRANCA )'
      '   AND ( TMP.IDMODULO             = 15 )'
      '   AND ( TMP.SITENVIO IN ('#39'1'#39','#39'2'#39') )'
      '   AND ( TMP.VALORRECEBIDO        > 0 )'
      '   AND ( CNT.IDCONTRATOEMPTMO = TMP.IDDESCONTO )'
      '   AND  TMP.IDPESSJUR  = CNT.IDPATRO'
      '   AND  TMP.IDPESSOA   = CNT.IDPESSOA'
      '   AND  TMP.IDPLANOPREV = CNT.IDPLANOPREV'
      '   AND NOT EXISTS (SELECT'
      '                     *'
      '                   FROM'
      '                        HISTMOVEMPTMO HME, CONTRATOEMPTMO CNT'
      '                   WHERE'
      '                        HME.HMEFORMACOBRANCA = '#39'F'#39
      '                   AND  TMP.IDDESCONTO = HME.IDCONTRATOEMPTMO'
      '                   AND  TMP.IDPROVENTO = HME.IDRUBRICA'
      '                   AND  TMP.IDPESSJUR  = CNT.IDPATRO'
      '                   AND  TMP.IDPESSOA   = CNT.IDPESSOA'
      '                   AND  TMP.IDPLANOPREV = CNT.IDPLANOPREV'
      '                   AND  HME.HMEANOCOBRANCA = :PHMEANOCOBRANCA'
      '                   AND  HME.HMEMESCOBRANCA = :PHMEMESCOBRANCA'
      
        '                   AND  CNT.IDCONTRATOEMPTMO = HME.IDCONTRATOEMP' +
        'TMO)'
      '')
    ValidateWithMask = True
    Left = 328
    Top = 24
    ParamData = <
      item
        DataType = ftString
        Name = 'PANOMESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEANOCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOBRANCA'
        ParamType = ptInput
      end>
    object qryTmpDescERRO: TStringField
      FieldName = 'ERRO'
      FixedChar = True
      Size = 27
    end
    object qryTmpDescREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      FixedChar = True
      Size = 7
    end
    object qryTmpDescCONTRATO: TFloatField
      FieldName = 'CONTRATO'
    end
    object qryTmpDescCOBRANCA: TStringField
      FieldName = 'COBRANCA'
      FixedChar = True
      Size = 7
    end
    object qryTmpDescRUBRICA: TFloatField
      FieldName = 'RUBRICA'
    end
    object qryTmpDescVALOR: TFloatField
      FieldName = 'VALOR'
    end
  end
  object qryHistMov: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   '#39'Não existe na TMPDESC      '#39' AS ERRO,'
      
        '   RTRIM(LTRIM(TO_CHAR(HME.HMEMESCOMPETENCIA,'#39'00'#39'))) || '#39'/'#39' || H' +
        'ME.HMEANOCOMPETENCIA AS REFERENCIA,'
      '   HME.IDCONTRATOEMPTMO AS CONTRATO,'
      
        '   RTRIM(LTRIM(TO_CHAR(HME.HMEMESCOBRANCA,'#39'00'#39'))) || '#39'/'#39' || HME.' +
        'HMEANOCOBRANCA AS COBRANCA,'
      '   HME.IDRUBRICA      AS RUBRICA,'
      '   HME.HMEVLRPREVISTO AS VALOR'
      'FROM'
      '   HISTMOVEMPTMO HME, CONTRATOEMPTMO CNT'
      'WHERE'
      '       ( HME.HMEANOCOBRANCA = :PHMEANOCOBRANCA )'
      '   AND ( HME.HMEMESCOBRANCA = :PHMEMESCOBRANCA )'
      '   AND ( HME.FLGBAIXADO = 0 )'
      '   AND ( HME.HMEFORMACOBRANCA = '#39'F'#39' )'
      '   AND ( HME.HMECENTRALIZA = 1 OR HME.HMEDESTACADO = 1)'
      '   AND  CNT.IDCONTRATOEMPTMO = HME.IDCONTRATOEMPTMO'
      '   AND NOT EXISTS (SELECT'
      '                        *'
      '                   FROM'
      '                        TMPDESC TMP'
      '                   WHERE'
      '                        IDDESCONTO = HME.IDCONTRATOEMPTMO'
      '                   AND  IDPROVENTO = HME.IDRUBRICA'
      
        '                   AND  LTRIM(RTRIM(MESCOBRANCA)) = :PANOMESCOBR' +
        'ANCA'
      '                   AND  TMP.IDPESSJUR  = CNT.IDPATRO'
      '                   AND  TMP.IDPESSOA   = CNT.IDPESSOA'
      '                   AND  TMP.IDPLANOPREV = CNT.IDPLANOPREV'
      '                   AND  IDMODULO = 15 )'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 368
    Top = 96
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PHMEANOCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PANOMESCOBRANCA'
        ParamType = ptInput
      end>
    object qryHistMovERRO: TStringField
      FieldName = 'ERRO'
      FixedChar = True
      Size = 27
    end
    object qryHistMovREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 44
    end
    object qryHistMovCONTRATO: TFloatField
      FieldName = 'CONTRATO'
    end
    object qryHistMovCOBRANCA: TStringField
      FieldName = 'COBRANCA'
      Size = 44
    end
    object qryHistMovRUBRICA: TFloatField
      FieldName = 'RUBRICA'
    end
    object qryHistMovVALOR: TFloatField
      FieldName = 'VALOR'
    end
  end
end
