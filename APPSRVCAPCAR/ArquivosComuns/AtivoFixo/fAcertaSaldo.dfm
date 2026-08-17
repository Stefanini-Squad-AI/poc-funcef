inherited frmAcertaSaldo: TfrmAcertaSaldo
  Left = 285
  Top = 157
  HelpContext = 70001
  Caption = 'Reconstroi Saldo Contábil dos Bens'
  ClientHeight = 303
  ClientWidth = 452
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 452
    Height = 264
    object Label26: TLabel
      Left = 24
      Top = 128
      Width = 127
      Height = 13
      Caption = 'Placa de Tombamento'
    end
    object Label1: TLabel
      Left = 192
      Top = 128
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object Label3: TLabel
      Left = 24
      Top = 80
      Width = 35
      Height = 13
      Caption = 'Grupo'
    end
    object pnlStatus: TPanel
      Left = 5
      Top = 216
      Width = 442
      Height = 43
      Align = alBottom
      TabOrder = 6
      Visible = False
      object lblStatus: TLabel
        Left = 7
        Top = 3
        Width = 53
        Height = 13
        Caption = 'Processo'
      end
      object lblBem: TLabel
        Left = 270
        Top = 3
        Width = 13
        Height = 13
        Caption = '...'
      end
      object pnlprgBar: TPanel
        Left = 8
        Top = 18
        Width = 425
        Height = 17
        BevelOuter = bvLowered
        Caption = 'pnlprgBar'
        TabOrder = 0
        object prgBar: TGauge
          Left = 1
          Top = 1
          Width = 423
          Height = 15
          Align = alClient
          BackColor = clSilver
          BorderStyle = bsNone
          Color = clGray
          ForeColor = clBlue
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          Progress = 0
        end
      end
    end
    object rdgTipoBem: TRadioGroup
      Left = 24
      Top = 8
      Width = 217
      Height = 65
      Caption = ' Bens '
      Enabled = False
      ItemIndex = 1
      Items.Strings = (
        'Patrimoniais'
        'Investimentos Imobiliários')
      TabOrder = 0
    end
    object spdPesquisa: TBitBtn
      Left = 152
      Top = 144
      Width = 21
      Height = 21
      TabOrder = 4
      OnClick = spdPesquisaClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
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
      NumGlyphs = 2
    end
    object ePlaca: TEdit
      Left = 24
      Top = 144
      Width = 129
      Height = 21
      TabOrder = 3
      OnExit = ePlacaExit
    end
    object rdgRemover: TRadioGroup
      Left = 256
      Top = 8
      Width = 177
      Height = 65
      Caption = ' Processar por '
      ItemIndex = 0
      Items.Strings = (
        'Grupo Contábil'
        'Imóvel')
      TabOrder = 1
    end
    object edDesBem: TMemo
      Left = 192
      Top = 144
      Width = 241
      Height = 62
      Lines.Strings = (
        'edDesBem')
      ReadOnly = True
      TabOrder = 5
    end
    object cmbGrupoIni: TwwDBLookupCombo
      Left = 24
      Top = 96
      Width = 411
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'30'#9'NOME'
        'CLASSE'#9'15'#9'CÓDIGO')
      LookupTable = qryGrupoIni
      LookupField = 'IDGRUPO'
      Options = [loTitles]
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
    end
  end
  inherited Dock971: TDock97
    Top = 264
    Width = 452
    inherited tb97Fundo: TToolbar97
      Left = 273
      DockPos = 273
      inherited sep1: TToolbarSep97
        Visible = False
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 70001
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 106
      DockPos = 106
      inherited ToolbarSep971: TToolbarSep97
        Visible = False
      end
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Enabled = False
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 763
    Top = 507
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryMovContabBem: TwwQuery
    DatabaseName = 'Basedados'
    SQL.Strings = (
      'SELECT /*+ RULE */'
      '   VBEM.IDBEM, VBEM.IDPESSOA, VBEM.DATAMOVIMENTACAO,'
      ''
      '   SUM(VBEM.VALBEMACUM + VBEM.VALACRESACUM -'
      
        '       VBEM.BXVALBEMACUM - VBEM.BXVALACRESACUM)                 ' +
        '        AS VALORG,'
      '   SUM(VBEM.VALCMBEMACUM + VBEM.VALCMACRESACUM  -'
      
        '       VBEM.BXVALCMBEMACUM - VBEM.BXVALCMACRESACUM)             ' +
        '        AS CMBEM,'
      '   SUM(VBEM.VALDEPBEMACUM + VBEM.VALDEPACRESACUM -'
      
        '       VBEM.BXVALDEPBEMACUM - VBEM.BXVALDEPACRESACUM)           ' +
        '        AS DEPLANC,'
      '   SUM(VBEM.VALCMDEPBEMACUM + VBEM.VALCMDEPACRESACUM -'
      
        '       VBEM.BXVALCMDEPBEMACUM - VBEM.BXVALCMDEPACRESACUM)       ' +
        '        AS CMDEP,'
      ''
      
        '   SUM(VBEM.VALREAVACUM - VBEM.BXVALREAVACUM)                   ' +
        '        AS REAVVALORG,'
      
        '   SUM(VBEM.VALCMREAVACUM - VBEM.BXVALCMREAVACUM)               ' +
        '        AS REAVCMBEM,'
      
        '   SUM(VBEM.VALDEPREAVACUM - VBEM.BXVALDEPREAVACUM)             ' +
        '        AS REAVDEPLANC,'
      
        '   SUM(VBEM.VALCMDEPREAVACUM - VBEM.BXVALCMDEPREAVACUM)         ' +
        '        AS REAVCMDEP,'
      ''
      
        '   SUM(VBEM.VALULTREAVACUM - VBEM.BXVALULTREAVACUM)             ' +
        '        AS ULTREAVVALORG,'
      
        '   SUM(VBEM.VALULTCMREAVACUM - VBEM.BXVALULTCMREAVACUM)         ' +
        '        AS ULTREAVCMBEM,'
      
        '   SUM(VBEM.VALULTDEPREAVACUM - VBEM.BXVALULTDEPREAVACUM)       ' +
        '        AS ULTREAVDEPLANC,'
      
        '   SUM(VBEM.VALULTCMDEPREAVACUM - VBEM.BXVALULTCMDEPREAVACUM)   ' +
        '        AS ULTREAVCMDEP'
      ''
      'FROM'
      '  ((SELECT'
      '           HM.IDBEM,'
      '           HM.IDPESSOA,'
      '           HM.DATAMOVIMENTACAO,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,01,NVL(HM.VALOFI,0),'
      '                                            41,NVL(HM.VALOFI,0),'
      
        '                                            07,NVL(HM.VALOFI,0),' +
        '0)) AS  VALBEMACUM,'
      
        '           (0)                                                  ' +
        '    AS  VALREAVACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,09,NVL(HM.VALOFI,0),'
      
        '                                            49,NVL(HM.VALOFI,0),' +
        '0)) AS  VALACRESACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,15,NVL(HM.VALOFI,0),'
      
        '                                            42,NVL(HM.VALOFI,0),' +
        '0)) AS  VALCMBEMACUM,'
      
        '           (0)                                                  ' +
        '    AS  VALCMREAVACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,34,NVL(HM.VALOFI,0),'
      
        '                                            50,NVL(HM.VALOFI,0),' +
        '0)) AS  VALCMACRESACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,14,NVL(HM.VALOFI,0),'
      '                                            17,NVL(HM.VALOFI,0),'
      
        '                                            43,NVL(HM.VALOFI,0),' +
        '0)) AS  VALDEPBEMACUM,'
      
        '           (0)                                                  ' +
        '    AS  VALDEPREAVACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,35,NVL(HM.VALOFI,0),'
      
        '                                            51,NVL(HM.VALOFI,0),' +
        '0)) AS  VALDEPACRESACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,21,NVL(HM.VALOFI,0),'
      
        '                                            44,NVL(HM.VALOFI,0),' +
        '0)) AS  VALCMDEPBEMACUM,'
      
        '           (0)                                                  ' +
        '    AS  VALCMDEPREAVACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,36,NVL(HM.VALOFI,0),'
      
        '                                            52,NVL(HM.VALOFI,0),' +
        '0)) AS  VALCMDEPACRESACUM,'
      '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,06,NVL(HM.VALOFI,0),'
      
        '                                            13,NVL(HM.VALOFI,0),' +
        '0)) AS  BXVALBEMACUM,'
      
        '           (0)                                                  ' +
        '    AS  BXVALREAVACUM,'
      
        '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,37,NVL(HM.VALOFI,0),' +
        '0)) AS  BXVALACRESACUM,'
      
        '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,25,NVL(HM.VALOFI,0),' +
        '0)) AS  BXVALCMBEMACUM,'
      
        '           (0)                                                  ' +
        '    AS  BXVALCMREAVACUM,'
      
        '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,38,NVL(HM.VALOFI,0),' +
        '0)) AS  BXVALCMACRESACUM,'
      
        '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,24,NVL(HM.VALOFI,0),' +
        '0)) AS  BXVALDEPBEMACUM,'
      
        '           (0)                                                  ' +
        '    AS  BXVALDEPREAVACUM,'
      
        '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,39,NVL(HM.VALOFI,0),' +
        '0)) AS  BXVALDEPACRESACUM,'
      
        '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,26,NVL(HM.VALOFI,0),' +
        '0)) AS  BXVALCMDEPBEMACUM,'
      
        '           (0)                                                  ' +
        '    AS  BXVALCMDEPREAVACUM,'
      
        '           SUM(DECODE(HM.IDTIPOMOVIMENTACAO,40,NVL(HM.VALOFI,0),' +
        '0)) AS  BXVALCMDEPACRESACUM,'
      
        '           (0)                                                  ' +
        '    AS  VALULTREAVACUM,'
      
        '           (0)                                                  ' +
        '    AS  VALULTCMREAVACUM,'
      
        '           (0)                                                  ' +
        '    AS  VALULTDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '    AS  VALULTCMDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '    AS  BXVALULTREAVACUM,'
      
        '           (0)                                                  ' +
        '    AS  BXVALULTCMREAVACUM,'
      
        '           (0)                                                  ' +
        '    AS  BXVALULTDEPREAVACUM,'
      
        '           (0)                                                  ' +
        '    AS  BXVALULTCMDEPREAVACUM'
      '    FROM HISTORICOMOVIMENTACAO HM'
      '    WHERE (HM.IDBEM = :PIDBEM)'
      '      AND (HM.IDPESSOA = :PIDPESSOA)'
      '    GROUP BY HM.IDBEM,HM.IDPESSOA,HM.DATAMOVIMENTACAO) UNION'
      ''
      '   ((SELECT'
      '            HM.IDBEM,'
      '            HM.IDPESSOA,'
      '            HM.DATAMOVIMENTACAO,'
      
        '            (0)                                                 ' +
        '     AS  VALBEMACUM,'
      
        '            SUM(DECODE(HM.IDTIPOMOVIMENTACAO,08,NVL(HM.VALOFI,0)' +
        ','
      
        '                                             32,NVL(HM.VALOFI,0)' +
        ','
      
        '                                             45,NVL(HM.VALOFI,0)' +
        ',0)) AS  VALREAVACUM,'
      
        '            (0)                                                 ' +
        '     AS  VALACRESACUM,'
      
        '            (0)                                                 ' +
        '     AS  VALCMBEMACUM,'
      
        '            SUM(DECODE(HM.IDTIPOMOVIMENTACAO,22,NVL(HM.VALOFI,0)' +
        ','
      
        '                                             46,NVL(HM.VALOFI,0)' +
        ',0)) AS  VALCMREAVACUM,'
      
        '            (0)                                                 ' +
        '     AS  VALCMACRESACUM,'
      
        '            (0)                                                 ' +
        '     AS  VALDEPBEMACUM,'
      
        '            SUM(DECODE(HM.IDTIPOMOVIMENTACAO,18,NVL(HM.VALOFI,0)' +
        ','
      
        '                                             33,NVL(HM.VALOFI,0)' +
        ','
      
        '                                             47,NVL(HM.VALOFI,0)' +
        ',0)) AS  VALDEPREAVACUM,'
      
        '            (0)                                                 ' +
        '     AS  VALDEPACRESACUM,'
      
        '            (0)                                                 ' +
        '     AS  VALCMDEPBEMACUM,'
      
        '            SUM(DECODE(HM.IDTIPOMOVIMENTACAO,19,NVL(HM.VALOFI,0)' +
        ','
      
        '                                             48,NVL(HM.VALOFI,0)' +
        ',0)) AS  VALCMDEPREAVACUM,'
      
        '            (0)                                                 ' +
        '     AS  VALCMDEPACRESACUM,'
      
        '            (0)                                                 ' +
        '     AS  BXVALBEMACUM,'
      
        '            SUM(DECODE(HM.IDTIPOMOVIMENTACAO,20,NVL(HM.VALOFI,0)' +
        ',0)) AS  BXVALREAVACUM,'
      
        '            (0)                                                 ' +
        '     AS  BXVALACRESACUM,'
      
        '            (0)                                                 ' +
        '     AS  BXVALCMBEMACUM,'
      
        '            SUM(DECODE(HM.IDTIPOMOVIMENTACAO,28,NVL(HM.VALOFI,0)' +
        ',0)) AS  BXVALCMREAVACUM,'
      
        '            (0)                                                 ' +
        '     AS  BXVALCMACRESACUM,'
      
        '            (0)                                                 ' +
        '     AS  BXVALDEPBEMACUM,'
      
        '            SUM(DECODE(HM.IDTIPOMOVIMENTACAO,27,NVL(HM.VALOFI,0)' +
        ',0)) AS  BXVALDEPREAVACUM,'
      
        '            (0)                                                 ' +
        '     AS  BXVALDEPACRESACUM,'
      
        '            (0)                                                 ' +
        '     AS  BXVALCMDEPBEMACUM,'
      
        '            SUM(DECODE(HM.IDTIPOMOVIMENTACAO,29,NVL(HM.VALOFI,0)' +
        ',0)) AS  BXVALCMDEPREAVACUM,'
      
        '            (0)                                                 ' +
        '     AS  BXVALCMDEPACRESACUM,'
      
        '            (0)                                                 ' +
        '     AS  VALULTREAVACUM,'
      
        '            (0)                                                 ' +
        '     AS  VALULTCMREAVACUM,'
      
        '            (0)                                                 ' +
        '     AS  VALULTDEPREAVACUM,'
      
        '            (0)                                                 ' +
        '     AS  VALULTCMDEPREAVACUM,'
      
        '            (0)                                                 ' +
        '     AS  BXVALULTREAVACUM,'
      
        '            (0)                                                 ' +
        '     AS  BXVALULTCMREAVACUM,'
      
        '            (0)                                                 ' +
        '     AS  BXVALULTDEPREAVACUM,'
      
        '            (0)                                                 ' +
        '     AS  BXVALULTCMDEPREAVACUM'
      '     FROM HISTORICOMOVIMENTACAO HM, REAVALIACAO R'
      '     WHERE (HM.IDBEM = :PIDBEM)'
      '       AND (HM.IDPESSOA = :PIDPESSOA)'
      '       AND (R.FLGULTREAVAL = 0)'
      '       AND (HM.IDREAVALACRESC = R.IDREAVALIACAO(+))'
      '     GROUP BY HM.IDBEM,HM.IDPESSOA,HM.DATAMOVIMENTACAO) UNION'
      ''
      '    (SELECT'
      '            HM.IDBEM,'
      '            HM.IDPESSOA,'
      '            HM.DATAMOVIMENTACAO,'
      
        '            (0)                                                 ' +
        '     AS  VALBEMACUM,'
      
        '            (0)                                                 ' +
        '     AS  VALREAVACUM,'
      
        '            (0)                                                 ' +
        '     AS  VALACRESACUM,'
      
        '            (0)                                                 ' +
        '     AS  VALCMBEMACUM,'
      
        '            (0)                                                 ' +
        '     AS  VALCMREAVACUM,'
      
        '            (0)                                                 ' +
        '     AS  VALCMACRESACUM,'
      
        '            (0)                                                 ' +
        '     AS  VALDEPBEMACUM,'
      
        '            (0)                                                 ' +
        '     AS  VALDEPREAVACUM,'
      
        '            (0)                                                 ' +
        '     AS  VALDEPACRESACUM,'
      
        '            (0)                                                 ' +
        '     AS  VALCMDEPBEMACUM,'
      
        '            (0)                                                 ' +
        '     AS  VALCMDEPREAVACUM,'
      
        '            (0)                                                 ' +
        '     AS  VALCMDEPACRESACUM,'
      
        '            (0)                                                 ' +
        '     AS  BXVALBEMACUM,'
      
        '            (0)                                                 ' +
        '     AS  BXVALREAVACUM,'
      
        '            (0)                                                 ' +
        '     AS  BXVALACRESACUM,'
      
        '            (0)                                                 ' +
        '     AS  BXVALCMBEMACUM,'
      
        '            (0)                                                 ' +
        '     AS  BXVALCMREAVACUM,'
      
        '            (0)                                                 ' +
        '     AS  BXVALCMACRESACUM,'
      
        '            (0)                                                 ' +
        '     AS  BXVALDEPBEMACUM,'
      
        '            (0)                                                 ' +
        '     AS  BXVALDEPREAVACUM,'
      
        '            (0)                                                 ' +
        '     AS  BXVALDEPACRESACUM,'
      
        '            (0)                                                 ' +
        '     AS  BXVALCMDEPBEMACUM,'
      
        '            (0)                                                 ' +
        '     AS  BXVALCMDEPREAVACUM,'
      
        '            (0)                                                 ' +
        '     AS  BXVALCMDEPACRESACUM,'
      
        '            SUM(DECODE(HM.IDTIPOMOVIMENTACAO,08,NVL(HM.VALOFI,0)' +
        ','
      
        '                                             32,NVL(HM.VALOFI,0)' +
        ','
      
        '                                             45,NVL(HM.VALOFI,0)' +
        ',0)) AS  VALULTREAVACUM,'
      
        '            SUM(DECODE(HM.IDTIPOMOVIMENTACAO,22,NVL(HM.VALOFI,0)' +
        ','
      
        '                                             46,NVL(HM.VALOFI,0)' +
        ',0)) AS  VALULTCMREAVACUM,'
      
        '            SUM(DECODE(HM.IDTIPOMOVIMENTACAO,18,NVL(HM.VALOFI,0)' +
        ','
      
        '                                             33,NVL(HM.VALOFI,0)' +
        ','
      
        '                                             47,NVL(HM.VALOFI,0)' +
        ',0)) AS  VALULTDEPREAVACUM,'
      
        '            SUM(DECODE(HM.IDTIPOMOVIMENTACAO,19,NVL(HM.VALOFI,0)' +
        ','
      
        '                                             48,NVL(HM.VALOFI,0)' +
        ',0)) AS  VALULTCMDEPREAVACUM,'
      
        '            SUM(DECODE(HM.IDTIPOMOVIMENTACAO,20,NVL(HM.VALOFI,0)' +
        ',0)) AS  BXVALULTREAVACUM,'
      
        '            SUM(DECODE(HM.IDTIPOMOVIMENTACAO,28,NVL(HM.VALOFI,0)' +
        ',0)) AS  BXVALULTCMREAVACUM,'
      
        '            SUM(DECODE(HM.IDTIPOMOVIMENTACAO,27,NVL(HM.VALOFI,0)' +
        ',0)) AS  BXVALULTDEPREAVACUM,'
      
        '            SUM(DECODE(HM.IDTIPOMOVIMENTACAO,29,NVL(HM.VALOFI,0)' +
        ',0)) AS  BXVALULTCMDEPREAVACUM'
      '     FROM HISTORICOMOVIMENTACAO HM, REAVALIACAO R'
      '     WHERE (HM.IDBEM = :PIDBEM)'
      '       AND (HM.IDPESSOA = :PIDPESSOA)'
      '       AND (R.FLGULTREAVAL = 1)'
      '       AND (HM.IDREAVALACRESC = R.IDREAVALIACAO(+))'
      '     GROUP BY HM.IDBEM,HM.IDPESSOA,HM.DATAMOVIMENTACAO))'
      '  )  VBEM'
      ''
      'GROUP BY VBEM.IDBEM, VBEM.IDPESSOA, VBEM.DATAMOVIMENTACAO'
      ''
      ''
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 528
    Top = 294
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qrySaldoContabBem: TwwQuery
    DatabaseName = 'Basedados'
    SQL.Strings = (
      'SELECT IDBEM,IDPESSOA,'
      '       DATASLDBEM,'
      '       VALORG,'
      '       CMBEM,'
      '       DEPLANC,'
      '       CMDEP,'
      '       REAVVALORG,'
      '       REAVCMBEM,'
      '       REAVDEPLANC,'
      '       REAVCMDEP,'
      '       ULTREAVVALORG,'
      '       ULTREAVCMBEM,'
      '       ULTREAVDEPLANC,'
      '       ULTREAVCMDEP,'
      '       IDGRUPO,'
      '       IDLOCALIZACAO,'
      '       IDRESPONSAVEL'
      'FROM SALDOCONTABBEM'
      'WHERE (IDBEM = :PIDBEM)'
      '  AND (IDPESSOA = :PIDPESSOA)'
      'ORDER BY DATASLDBEM  '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 528
    Top = 280
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryInsSaldoContabBem: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'insert into SALDOCONTABBEM'
      
        '  (IDBEM, IDPESSOA, DATASLDBEM, VALORG, CMBEM, DEPLANC, CMDEP, R' +
        'EAVVALORG, '
      
        '   REAVCMBEM, REAVDEPLANC, REAVCMDEP, ULTREAVVALORG, ULTREAVCMBE' +
        'M, ULTREAVDEPLANC, '
      '   ULTREAVCMDEP, IDGRUPO, IDLOCALIZACAO, IDRESPONSAVEL)'
      'values'
      
        '  (:IDBEM, :IDPESSOA, :DATASLDBEM, :VALORG, :CMBEM, :DEPLANC, :C' +
        'MDEP, :REAVVALORG,'
      
        '   :REAVCMBEM, :REAVDEPLANC, :REAVCMDEP, :ULTREAVVALORG, :ULTREA' +
        'VCMBEM,'
      
        '   :ULTREAVDEPLANC, :ULTREAVCMDEP, :IDGRUPO, :IDLOCALIZACAO, :ID' +
        'RESPONSAVEL)'
      ''
      ' ')
    ValidateWithMask = True
    Left = 678
    Top = 117
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATASLDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VALORG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CMBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'DEPLANC'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CMDEP'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'REAVVALORG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'REAVCMBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'REAVDEPLANC'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'REAVCMDEP'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ULTREAVVALORG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ULTREAVCMBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ULTREAVDEPLANC'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ULTREAVCMDEP'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDGRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDLOCALIZACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDRESPONSAVEL'
        ParamType = ptUnknown
      end>
  end
  object qryUpdSaldoContabBem: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'update SALDOCONTABBEM'
      'set'
      '  VALORG = :VALORG,'
      '  CMBEM = :CMBEM,'
      '  DEPLANC = :DEPLANC,'
      '  CMDEP = :CMDEP,'
      '  REAVVALORG = :REAVVALORG,'
      '  REAVCMBEM = :REAVCMBEM,'
      '  REAVDEPLANC = :REAVDEPLANC,'
      '  REAVCMDEP = :REAVCMDEP,'
      '  ULTREAVVALORG = :ULTREAVVALORG,'
      '  ULTREAVCMBEM = :ULTREAVCMBEM,'
      '  ULTREAVDEPLANC = :ULTREAVDEPLANC,'
      '  ULTREAVCMDEP = :ULTREAVCMDEP,'
      '  IDGRUPO = :IDGRUPO,'
      '  IDLOCALIZACAO = :IDLOCALIZACAO,'
      '  IDRESPONSAVEL = :IDRESPONSAVEL'
      'where'
      '  IDBEM = :IDBEM and'
      '  IDPESSOA = :IDPESSOA and'
      '  DATASLDBEM = :DATASLDBEM'
      ''
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 678
    Top = 103
    ParamData = <
      item
        DataType = ftFloat
        Name = 'VALORG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CMBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'DEPLANC'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CMDEP'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'REAVVALORG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'REAVCMBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'REAVDEPLANC'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'REAVCMDEP'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ULTREAVVALORG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ULTREAVCMBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ULTREAVDEPLANC'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'ULTREAVCMDEP'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDGRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDLOCALIZACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDRESPONSAVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATASLDBEM'
        ParamType = ptUnknown
      end>
  end
  object qryDelSaldoContabBem: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'delete from SALDOCONTABBEM'
      'where'
      '  IDBEM = :IDBEM and'
      '  IDPESSOA = :IDPESSOA and'
      '  DATASLDBEM = :DATASLDBEM'
      ' ')
    ValidateWithMask = True
    Left = 678
    Top = 89
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATASLDBEM'
        ParamType = ptUnknown
      end>
  end
  object qryRemSaldoContabBem: TwwQuery
    DatabaseName = 'Basedados'
    SQL.Strings = (
      'DELETE FROM SALDOCONTABBEM SCB'
      'WHERE (EXISTS (SELECT B.IDBEM'
      '               FROM BEM B,'
      '                    GRUPO G,'
      '                    PLANOGRUPO PG'
      '               WHERE (G.FLGIMOVEL = :PFLGIMOVEL)'
      ''
      ''
      '                 AND (B.IDPESSOA   = :IDPESSOA)'
      '                 AND (PG.IDPESSOA  = :IDPESSOA)'
      '                 AND (B.IDGRUPO    = G.IDGRUPO)'
      '                 AND (G.IDGRUPO    = PG.IDGRUPO)'
      '                 AND (SCB.IDBEM    = B.IDBEM(+))'
      '                 AND (SCB.IDPESSOA = B.IDPESSOA(+)) ))'
      ''
      ''
      ''
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 528
    Top = 115
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PFLGIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object updAtuBem: TUpdateSQL
    ModifySQL.Strings = (
      'update BEM'
      'set'
      '  VALORG = :VALORG,'
      '  CMBEM = :CMBEM,'
      '  DEPLANC = :DEPLANC,'
      '  CMDEP = :CMDEP'
      'where'
      '  IDBEM = :OLD_IDBEM')
    InsertSQL.Strings = (
      'insert into BEM'
      '  (VALORG, CMBEM, DEPLANC, CMDEP)'
      'values'
      '  (:VALORG, :CMBEM, :DEPLANC, :CMDEP)')
    DeleteSQL.Strings = (
      'delete from BEM'
      'where'
      '  IDBEM = :OLD_IDBEM')
    Left = 528
    Top = 30
  end
  object qryBem: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT B.IDBEM, B.PLACA, B.IDPESSOA, B.VALORG, B.CMBEM, B.DEPLAN' +
        'C, B.CMDEP, B.BAIXATOTAL'
      'FROM BEM B,'
      '     GRUPO G,'
      '     PLANOGRUPO PG'
      'WHERE (G.FLGIMOVEL = :PFLGIMOVEL)'
      '  AND (B.IDPESSOA  = :IDPESSOA)'
      '  AND (PG.IDPESSOA = :IDPESSOA)'
      ''
      '  '
      '  AND (B.IDGRUPO = G.IDGRUPO)'
      '  AND (G.IDGRUPO = PG.IDGRUPO)'
      'ORDER BY B.IDBEM'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 528
    Top = 352
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PFLGIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object updAtuReavaliacao: TUpdateSQL
    ModifySQL.Strings = (
      'update REAVALIACAO'
      'set'
      '  VALORG = :VALORG,'
      '  CMBEM = :CMBEM,'
      '  DEPLANC = :DEPLANC,'
      '  CMDEP = :CMDEP'
      'where'
      '  IDBEM = :OLD_IDBEM and'
      '  IDREAVALIACAO = :OLD_IDREAVALIACAO')
    InsertSQL.Strings = (
      'insert into REAVALIACAO'
      '  (VALORG, CMBEM, DEPLANC, CMDEP)'
      'values'
      '  (:VALORG, :CMBEM, :DEPLANC, :CMDEP)')
    DeleteSQL.Strings = (
      'delete from REAVALIACAO'
      'where'
      '  IDBEM = :OLD_IDBEM and'
      '  IDREAVALIACAO = :OLD_IDREAVALIACAO')
    Left = 608
    Top = 30
  end
  object updAtuAcrescimo: TUpdateSQL
    ModifySQL.Strings = (
      'update ACRESCIMOVALOR'
      'set'
      '  VALORG = :VALORG,'
      '  CMBEM = :CMBEM,'
      '  DEPLANC = :DEPLANC,'
      '  CMDEP = :CMDEP'
      'where'
      '  IDBEM = :OLD_IDBEM and'
      '  IDACRESCIMO = :OLD_IDACRESCIMO')
    InsertSQL.Strings = (
      'insert into ACRESCIMOVALOR'
      '  (IDBEM, IDACRESCIMO, VALORG, CMBEM, DEPLANC, CMDEP)'
      'values'
      '  (:IDBEM, :IDACRESCIMO, :VALORG, :CMBEM, :DEPLANC, :CMDEP)')
    DeleteSQL.Strings = (
      'delete from ACRESCIMOVALOR'
      'where'
      '  IDBEM = :OLD_IDBEM and'
      '  IDACRESCIMO = :OLD_IDACRESCIMO')
    Left = 704
    Top = 29
  end
  object qryAtuAcrescimo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT /*+ RULE */ A.IDPESSOA, A.IDBEM, A.IDACRESCIMO, A.VALORG,' +
        ' A.CMBEM, A.DEPLANC, A.CMDEP, B.PLACA,'
      ''
      
        '       (NVL(ACRESACUM.VALACRESACUM,0) - NVL(BXACRESACUM.BXVALACR' +
        'ESACUM,0)) AS VALORG0,'
      
        '       (NVL(CMACRESACUM.VALCMACRESACUM,0) - NVL(BXCMACRESACUM.BX' +
        'VALCMACRESACUM,0)) AS CMBEM0,'
      
        '       (NVL(DEPACRESACUM.VALDEPACRESACUM,0) - NVL(BXDEPACRESACUM' +
        '.BXVALDEPACRESACUM,0)) AS DEPLANC0,'
      
        '       (NVL(CMDEPACRESACUM.VALCMDEPACRESACUM,0) - NVL(BXCMDEPACR' +
        'ESACUM.BXVALCMDEPACRESACUM,0)) AS CMDEP0'
      ''
      'FROM ACRESCIMOVALOR A, BEM B, GRUPO G, PLANOGRUPO PG,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, HM.IDMOVIMENTACAO, SUM(HM.VALO' +
        'FI) AS VALACRESACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (09,49))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      
        '    GROUP BY HM.IDPESSOA, HM.IDBEM, HM.IDMOVIMENTACAO) ACRESACUM' +
        ','
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC, SUM(HM.VALO' +
        'FI) AS VALCMACRESACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (34,50))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      
        '    GROUP BY HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC) CMACRESAC' +
        'UM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC, SUM(HM.VALO' +
        'FI) AS VALDEPACRESACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (35,51))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      
        '    GROUP BY HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC) DEPACRESA' +
        'CUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC, SUM(HM.VALO' +
        'FI) AS VALCMDEPACRESACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (36,52))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      
        '    GROUP BY HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC) CMDEPACRE' +
        'SACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC, SUM(HM.VALO' +
        'FI) AS BXVALACRESACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 37)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      
        '    GROUP BY HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC) BXACRESAC' +
        'UM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC, SUM(HM.VALO' +
        'FI) AS BXVALCMACRESACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 38)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      
        '    GROUP BY HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC) BXCMACRES' +
        'ACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC, SUM(HM.VALO' +
        'FI) AS BXVALDEPACRESACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 39)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      
        '    GROUP BY HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC) BXDEPACRE' +
        'SACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC, SUM(HM.VALO' +
        'FI) AS BXVALCMDEPACRESACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 40)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      
        '    GROUP BY HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC) BXCMDEPAC' +
        'RESACUM'
      ''
      
        'WHERE ((A.DATAACRESCIMO <= :PDATAMOV) OR (A.DATAACRESCIMO IS NUL' +
        'L))'
      '  AND (A.IDPESSOA = :IDPESSOA)'
      '  AND (PG.IDPESSOA = :IDPESSOA)'
      '  AND (G.FLGIMOVEL = :PFLGIMOVEL)'
      ''
      ''
      '  AND (A.IDBEM = B.IDBEM)'
      '  AND (B.IDGRUPO = G.IDGRUPO)'
      '  AND (G.IDGRUPO = PG.IDGRUPO)'
      '  AND (A.IDBEM = ACRESACUM.IDBEM(+))'
      '  AND (A.IDMOVIMENTACAO = ACRESACUM.IDMOVIMENTACAO(+))'
      '  AND (A.IDBEM = CMACRESACUM.IDBEM(+))'
      '  AND (A.IDACRESCIMO = CMACRESACUM.IDREAVALACRESC(+))'
      '  AND (A.IDBEM = DEPACRESACUM.IDBEM(+))'
      '  AND (A.IDACRESCIMO = DEPACRESACUM.IDREAVALACRESC(+))'
      '  AND (A.IDBEM = CMDEPACRESACUM.IDBEM(+))'
      '  AND (A.IDACRESCIMO = CMDEPACRESACUM.IDREAVALACRESC(+))'
      '  AND (A.IDBEM = BXACRESACUM.IDBEM(+))'
      '  AND (A.IDACRESCIMO = BXACRESACUM.IDREAVALACRESC(+))'
      '  AND (A.IDBEM = BXCMACRESACUM.IDBEM(+))'
      '  AND (A.IDACRESCIMO = BXCMACRESACUM.IDREAVALACRESC(+))'
      '  AND (A.IDBEM = BXDEPACRESACUM.IDBEM(+))'
      '  AND (A.IDACRESCIMO = BXDEPACRESACUM.IDREAVALACRESC(+))'
      '  AND (A.IDBEM = BXCMDEPACRESACUM.IDBEM(+))'
      '  AND (A.IDACRESCIMO = BXCMDEPACRESACUM.IDREAVALACRESC(+))'
      ' '
      ' ')
    UpdateObject = updAtuAcrescimo
    ValidateWithMask = True
    Left = 704
    Top = 16
    ParamData = <
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGIMOVEL'
        ParamType = ptUnknown
      end>
  end
  object qryAtuBem: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT /*+ RULE */ B.IDPESSOA, B.IDBEM, B.VALORG, B.CMBEM, B.DEP' +
        'LANC, B.CMDEP, B.PLACA,'
      ''
      
        '       (NVL(BEMACUM.VALBEMACUM,0) - NVL(BXBEMACUM.BXVALBEMACUM,0' +
        ')) AS VALORG0,'
      
        '       (NVL(CMBEMACUM.VALCMBEMACUM,0) - NVL(BXCMBEMACUM.BXVALCMB' +
        'EMACUM,0)) AS CMBEM0,'
      
        '       (NVL(DEPBEMACUM.VALDEPBEMACUM,0) - NVL(BXDEPBEMACUM.BXVAL' +
        'DEPBEMACUM,0)) AS DEPLANC0,'
      
        '       (NVL(CMDEPBEMACUM.VALCMDEPBEMACUM,0) - NVL(BXCMDEPBEMACUM' +
        '.BXVALCMDEPBEMACUM,0)) AS CMDEP0'
      ''
      'FROM BEM B, GRUPO G, PLANOGRUPO PG,'
      ''
      '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(HM.VALOFI) AS VALBEMACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (01,41,07))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BEMACUM,'
      ''
      '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(HM.VALOFI) AS VALCMBEMACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (15,42))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) CMBEMACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(HM.VALOFI) AS VALDEPBEMACU' +
        'M'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (14,17,43))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) DEPBEMACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(HM.VALOFI) AS VALCMDEPBEMA' +
        'CUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (21,44))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) CMDEPBEMACUM,'
      ''
      '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(HM.VALOFI) AS BXVALBEMACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (06,13))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXBEMACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(HM.VALOFI) AS BXVALCMBEMAC' +
        'UM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 25)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXCMBEMACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(HM.VALOFI) AS BXVALDEPBEMA' +
        'CUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 24)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXDEPBEMACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, SUM(HM.VALOFI) AS BXVALCMDEPBE' +
        'MACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 26)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM) BXCMDEPBEMACUM'
      ''
      
        'WHERE ((B.DATAINICIODEP <= :PDATAMOV) OR (B.DATAINICIODEP IS NUL' +
        'L))'
      '  AND (B.IDPESSOA = :IDPESSOA)'
      '  AND (PG.IDPESSOA = :IDPESSOA)'
      '  AND (G.FLGIMOVEL = :PFLGIMOVEL)'
      ''
      ''
      '  AND (B.IDGRUPO = G.IDGRUPO)'
      '  AND (G.IDGRUPO = PG.IDGRUPO)'
      '  AND (B.IDBEM = BEMACUM.IDBEM(+))'
      '  AND (B.IDBEM = CMBEMACUM.IDBEM(+))'
      '  AND (B.IDBEM = DEPBEMACUM.IDBEM(+))'
      '  AND (B.IDBEM = CMDEPBEMACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXBEMACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXCMBEMACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXDEPBEMACUM.IDBEM(+))'
      '  AND (B.IDBEM = BXCMDEPBEMACUM.IDBEM(+))'
      ''
      ' '
      ' ')
    UpdateObject = updAtuBem
    ValidateWithMask = True
    Left = 528
    Top = 16
    ParamData = <
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGIMOVEL'
        ParamType = ptUnknown
      end>
  end
  object qryAtuReavaliacao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT /*+ RULE */ R.IDPESSOA, R.IDBEM, R.IDREAVALIACAO, R.VALOR' +
        'G, R.CMBEM, R.DEPLANC, R.CMDEP, B.PLACA,'
      ''
      
        '       (NVL(REAVACUM.VALREAVACUM,0) - NVL(BXREAVACUM.BXVALREAVAC' +
        'UM,0)) AS VALORG0,'
      
        '       (NVL(CMREAVACUM.VALCMREAVACUM,0) - NVL(BXCMREAVACUM.BXVAL' +
        'CMREAVACUM,0)) AS CMBEM0,'
      
        '       (NVL(DEPREAVACUM.VALDEPREAVACUM,0) - NVL(BXDEPREAVACUM.BX' +
        'VALDEPREAVACUM,0)) AS DEPLANC0,'
      
        '       (NVL(CMDEPREAVACUM.VALCMDEPREAVACUM,0) - NVL(BXCMDEPREAVA' +
        'CUM.BXVALCMDEPREAVACUM,0)) AS CMDEP0'
      ''
      'FROM REAVALIACAO R, BEM B, GRUPO G, PLANOGRUPO PG,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC, SUM(HM.VALO' +
        'FI) AS VALREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (08,32,45))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      '    GROUP BY HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC) REAVACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC, SUM(HM.VALO' +
        'FI) AS VALCMREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (22,46))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      
        '    GROUP BY HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC) CMREAVACU' +
        'M,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC, SUM(HM.VALO' +
        'FI) AS VALDEPREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (18,33,47))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      
        '    GROUP BY HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC) DEPREAVAC' +
        'UM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC, SUM(HM.VALO' +
        'FI) AS VALCMDEPREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO IN (19,48))'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      
        '    GROUP BY HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC) CMDEPREAV' +
        'ACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC, SUM(HM.VALO' +
        'FI) AS BXVALREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 20)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      
        '    GROUP BY HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC) BXREAVACU' +
        'M,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC, SUM(HM.VALO' +
        'FI) AS BXVALCMREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 28)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      
        '    GROUP BY HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC) BXCMREAVA' +
        'CUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC, SUM(HM.VALO' +
        'FI) AS BXVALDEPREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 27)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      
        '    GROUP BY HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC) BXDEPREAV' +
        'ACUM,'
      ''
      
        '   (SELECT HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC, SUM(HM.VALO' +
        'FI) AS BXVALCMDEPREAVACUM'
      '    FROM   HISTORICOMOVIMENTACAO HM'
      '    WHERE  (HM.IDTIPOMOVIMENTACAO = 29)'
      '      AND  (HM.DATAMOVIMENTACAO <= :PDATAMOV)'
      '      AND  (HM.IDPESSOA = :IDPESSOA)'
      
        '    GROUP BY HM.IDPESSOA, HM.IDBEM, HM.IDREAVALACRESC) BXCMDEPRE' +
        'AVACUM'
      ''
      
        'WHERE ((R.DATAREAVALIACAO <= :PDATAMOV) OR (R.DATAREAVALIACAO IS' +
        ' NULL))'
      '  AND (R.IDPESSOA = :IDPESSOA)'
      '  AND (PG.IDPESSOA = :IDPESSOA)'
      '  AND (G.FLGIMOVEL = :PFLGIMOVEL)'
      ''
      ''
      '  AND (R.IDBEM = B.IDBEM)'
      '  AND (B.IDGRUPO = G.IDGRUPO)'
      '  AND (G.IDGRUPO = PG.IDGRUPO)'
      '  AND (R.IDBEM = REAVACUM.IDBEM(+))'
      '  AND (R.IDREAVALIACAO = REAVACUM.IDREAVALACRESC(+))'
      '  AND (R.IDBEM = CMREAVACUM.IDBEM(+))'
      '  AND (R.IDREAVALIACAO = CMREAVACUM.IDREAVALACRESC(+))'
      '  AND (R.IDBEM = DEPREAVACUM.IDBEM(+))'
      '  AND (R.IDREAVALIACAO = DEPREAVACUM.IDREAVALACRESC(+))'
      '  AND (R.IDBEM = CMDEPREAVACUM.IDBEM(+))'
      '  AND (R.IDREAVALIACAO = CMDEPREAVACUM.IDREAVALACRESC(+))'
      '  AND (R.IDBEM = BXREAVACUM.IDBEM(+))'
      '  AND (R.IDREAVALIACAO = BXREAVACUM.IDREAVALACRESC(+))'
      '  AND (R.IDBEM = BXCMREAVACUM.IDBEM(+))'
      '  AND (R.IDREAVALIACAO = BXCMREAVACUM.IDREAVALACRESC(+))'
      '  AND (R.IDBEM = BXDEPREAVACUM.IDBEM(+))'
      '  AND (R.IDREAVALIACAO = BXDEPREAVACUM.IDREAVALACRESC(+))'
      '  AND (R.IDBEM = BXCMDEPREAVACUM.IDBEM(+))'
      '  AND (R.IDREAVALIACAO = BXCMDEPREAVACUM.IDREAVALACRESC(+))'
      ''
      ''
      ' ')
    UpdateObject = updAtuReavaliacao
    ValidateWithMask = True
    Left = 608
    Top = 16
    ParamData = <
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAMOV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGIMOVEL'
        ParamType = ptUnknown
      end>
  end
  object qryPlaca: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDBEM, IDPESSOA, PLACA, DESBEM'
      'FROM BEM'
      'WHERE (PLACA = :PPLACA)'
      '  AND (IDPESSOA = :IDPESSOA)')
    ValidateWithMask = True
    Left = 656
    Top = 352
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PPLACA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryRemSaldoContabGrupo: TwwQuery
    DatabaseName = 'Basedados'
    SQL.Strings = (
      'DELETE FROM SALDOCONTABBEM SCB'
      'WHERE (EXISTS (SELECT B.IDBEM'
      '               FROM BEM B,'
      '                    GRUPO G,'
      '                    PLANOGRUPO PG'
      '               WHERE (G.FLGIMOVEL  = :PFLGIMOVEL)'
      '                 AND (B.IDGRUPO    = :PIDGRUPO)'
      '                 AND (B.IDPESSOA   = :IDPESSOA)'
      '                 AND (PG.IDPESSOA  = :IDPESSOA)'
      '                 AND (B.IDGRUPO    = G.IDGRUPO)'
      '                 AND (G.IDGRUPO    = PG.IDGRUPO)'
      '                 AND (SCB.IDBEM    = B.IDBEM(+))'
      '                 AND (SCB.IDPESSOA = B.IDPESSOA(+)) ))'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 528
    Top = 102
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PFLGIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDGRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryGrupos: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT B.IDGRUPO, B.IDPESSOA'
      'FROM BEM B,'
      '     GRUPO G,'
      '     PLANOGRUPO PG'
      'WHERE (G.FLGIMOVEL = :PFLGIMOVEL)'
      '  AND (PG.IDPESSOA = :IDPESSOA)'
      '  AND (B.IDGRUPO = G.IDGRUPO)'
      '  AND (G.IDGRUPO = PG.IDGRUPO)'
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 696
    Top = 280
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PFLGIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryGrupoIni: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT G.CLASSE, G.NOME, G.IDGRUPO, PG.IDPESSOA'
      'FROM GRUPO G,'
      '     PLANOGRUPO PG'
      'WHERE (G.TIPO = '#39'A'#39')'
      '  AND (PG.IDPESSOA = :IDPESSOA)'
      '  AND (G.IDGRUPO = PG.IDGRUPO)'
      'ORDER BY G.CLASSE'
      ' ')
    ValidateWithMask = True
    Left = 272
    Top = 136
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryMovTransf: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDBEM, IDPESSOA, DATAMOVIMENTACAO, IDMOVIMENTACAO, IDTIPO' +
        'MOVIMENTACAO,'
      '       IDGRUPANT, IDLOCALANT, IDRESPANT'
      'FROM HISTORICOMOVIMENTACAO'
      'WHERE (IDBEM    = :IDBEM)'
      '  AND (IDPESSOA = :IDPESSOA)'
      '  AND ((IDTIPOMOVIMENTACAO = 05) OR'
      '       (IDTIPOMOVIMENTACAO = 11) OR'
      '       (IDTIPOMOVIMENTACAO = 12))'
      'ORDER BY DATAMOVIMENTACAO DESC, IDMOVIMENTACAO DESC'
      ''
      ''
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 128
    Top = 365
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qrySCBTransf: TwwQuery
    DatabaseName = 'Basedados'
    SQL.Strings = (
      
        'SELECT SC.IDBEM, SC.IDPESSOA, SC.DATASLDBEM, SC.IDGRUPO, SC.IDLO' +
        'CALIZACAO, SC.IDRESPONSAVEL'
      'FROM SALDOCONTABBEM SC,'
      '     BEM B,'
      '     GRUPO G'
      'WHERE (G.FLGIMOVEL = :PFLGIMOVEL)'
      ''
      ''
      '  AND (SC.IDPESSOA = :IDPESSOA)'
      '  AND (SC.IDBEM    = B.IDBEM)'
      '  AND (SC.IDPESSOA = B.IDPESSOA)'
      '  AND (B.IDGRUPO = G.IDGRUPO)'
      'ORDER BY IDBEM, IDPESSOA, DATASLDBEM DESC'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 216
    Top = 365
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PFLGIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryBemAtual: TwwQuery
    DatabaseName = 'Basedados'
    SQL.Strings = (
      'SELECT B.IDGRUPO, C.IDLOCALIZACAO, C.IDRESPONSAVEL'
      'FROM BEM B,'
      '     CONJUNTO C'
      'WHERE (B.IDBEM = :IDBEM)'
      '  AND (B.IDPESSOA = :IDPESSOA)'
      '  AND (B.IDCONJUNTO = C.IDCONJUNTO)'
      ' ')
    ValidateWithMask = True
    Left = 128
    Top = 352
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryUpdSCBTransf: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'update SALDOCONTABBEM'
      'set'
      '  IDGRUPO = :IDGRUPO,'
      '  IDLOCALIZACAO = :IDLOCALIZACAO,'
      '  IDRESPONSAVEL = :IDRESPONSAVEL'
      'where'
      '  IDBEM = :IDBEM and'
      '  IDPESSOA = :IDPESSOA and'
      '  DATASLDBEM = :DATASLDBEM'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 216
    Top = 352
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDGRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDLOCALIZACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDRESPONSAVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'DATASLDBEM'
        ParamType = ptUnknown
      end>
  end
  object qryMovBaixa: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDBEM, IDPESSOA, DATAMOVIMENTACAO, IDMOVIMENTACAO, IDTIPO' +
        'MOVIMENTACAO'
      'FROM HISTORICOMOVIMENTACAO'
      'WHERE (IDBEM    = :IDBEM)'
      '  AND (IDPESSOA = :IDPESSOA)'
      '  AND (IDTIPOMOVIMENTACAO = 06)'
      'ORDER BY DATAMOVIMENTACAO DESC, IDMOVIMENTACAO DESC'
      ''
      ''
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 592
    Top = 352
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDBEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryRemSaldoContabConj: TwwQuery
    DatabaseName = 'Basedados'
    SQL.Strings = (
      'DELETE FROM SALDOCONTABBEM SCB'
      'WHERE (EXISTS (SELECT B.IDBEM'
      '               FROM BEM B,'
      '                    GRUPO G,'
      '                    PLANOGRUPO PG'
      '               WHERE (G.FLGIMOVEL  = :PFLGIMOVEL)'
      '                 AND (B.IDCONJUNTO = :PIDCONJUNTO)'
      '                 AND (B.IDPESSOA   = :IDPESSOA)'
      '                 AND (PG.IDPESSOA  = :IDPESSOA)'
      '                 AND (B.IDGRUPO    = G.IDGRUPO)'
      '                 AND (G.IDGRUPO    = PG.IDGRUPO)'
      '                 AND (SCB.IDBEM    = B.IDBEM(+))'
      '                 AND (SCB.IDPESSOA = B.IDPESSOA(+)) ))'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 528
    Top = 88
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PFLGIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDCONJUNTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryConjuntos: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT B.IDCONJUNTO, B.IDPESSOA'
      'FROM BEM B,'
      '     GRUPO G,'
      '     PLANOGRUPO G'
      'WHERE (G.FLGIMOVEL = :PFLGIMOVEL)'
      '  AND (PG.IDPESSOA = :IDPESSOA)'
      '  AND (B.IDPESSOA  = :IDPESSOA)'
      '  AND (B.IDGRUPO   = G.IDGRUPO)'
      '  AND (G.IDGRUPO   = PG.IDGRUPO)')
    ValidateWithMask = True
    Left = 624
    Top = 280
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PFLGIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryRespExiste: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT R.IDRESPONSAVEL'
      'FROM RESPONSAVEL R,'
      '     PESSOA P'
      'WHERE (R.IDRESPONSAVEL = :IDRESPONSAVEL)'
      '  AND (R.IDRESPONSAVEL = P.IDPESSOA)     ')
    ValidateWithMask = True
    Left = 376
    Top = 330
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDRESPONSAVEL'
        ParamType = ptUnknown
      end>
  end
  object qryLocalExiste: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDLOCALIZACAO'
      'FROM LOCALIZACAO'
      'WHERE (IDLOCALIZACAO = :IDLOCALIZACAO)'
      '  AND (IDPESSOA      = :IDPESSOA)'
      '')
    ValidateWithMask = True
    Left = 376
    Top = 317
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDLOCALIZACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryGrupoExiste: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT G.IDGRUPO'
      'FROM GRUPO G,'
      '     PLANOGRUPO PG'
      'WHERE (G.IDGRUPO = :IDGRUPO)'
      '  AND (PG.IDPESSOA = :IDPESSOA)'
      '  AND (G.TIPO = '#39'A'#39')'
      '  AND (G.IDGRUPO = PG.IDGRUPO)'
      '')
    ValidateWithMask = True
    Left = 376
    Top = 304
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDGRUPO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
end
