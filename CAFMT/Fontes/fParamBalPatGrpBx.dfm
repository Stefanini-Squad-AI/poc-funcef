inherited frmParamBalPatGrpBx: TfrmParamBalPatGrpBx
  Left = 314
  Top = 212
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Balancete Patrimonial por Grupo - Bens Baixados'
  ClientHeight = 285
  ClientWidth = 443
  FormStyle = fsNormal
  Visible = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel [0]
    Left = 368
    Top = 96
    Width = 66
    Height = 13
    Caption = 'Grupo Final'
  end
  object Label6: TLabel [1]
    Left = 24
    Top = 96
    Width = 73
    Height = 13
    Caption = 'Grupo Inicial'
  end
  inherited pnlFundo: TPanel
    Width = 443
    Height = 246
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 129
      Height = 13
      Caption = 'Periodo Atualizado até'
    end
    object Label3: TLabel
      Left = 16
      Top = 56
      Width = 35
      Height = 13
      Caption = 'Grupo'
    end
    object dtedfim: TCMDateTimePicker
      Left = 16
      Top = 32
      Width = 137
      Height = 21
      Hint = 'Data Programada para Pagamento'
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      ButtonStyle = cbsCustom
      Epoch = 1950
      ButtonGlyph.Data = {
        06050000424D06050000000000003604000028000000100000000D0000000100
        080000000000D000000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A6000020400000206000002080000020A0000020C0000020E000004000000040
        20000040400000406000004080000040A0000040C0000040E000006000000060
        20000060400000606000006080000060A0000060C0000060E000008000000080
        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
        20004000400040006000400080004000A0004000C0004000E000402000004020
        20004020400040206000402080004020A0004020C0004020E000404000004040
        20004040400040406000404080004040A0004040C0004040E000406000004060
        20004060400040606000406080004060A0004060C0004060E000408000004080
        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
        20008000400080006000800080008000A0008000C0008000E000802000008020
        20008020400080206000802080008020A0008020C0008020E000804000008040
        20008040400080406000804080008040A0008040C0008040E000806000008060
        20008060400080606000806080008060A0008060C0008060E000808000008080
        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
        000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
        A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
        A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
        A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
        FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
        04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
        000000000000000000FF}
      ParentShowHint = False
      ShowHint = True
      ShowButton = True
      TabOrder = 0
    end
    object pnlStatus: TPanel
      Left = 5
      Top = 200
      Width = 433
      Height = 41
      Align = alBottom
      TabOrder = 1
      Visible = False
      object lblStatus: TLabel
        Left = 8
        Top = 4
        Width = 53
        Height = 13
        Caption = 'Processo'
      end
      object prgbar: TProgressBar
        Left = 8
        Top = 20
        Width = 375
        Height = 16
        Min = 0
        Max = 100
        TabOrder = 0
      end
      object Animate1: TAnimate
        Left = 388
        Top = 2
        Width = 43
        Height = 37
        Active = False
        AutoSize = False
        CommonAVI = aviFindComputer
        StopFrame = 8
      end
    end
    object GroupBox1: TGroupBox
      Left = 208
      Top = 104
      Width = 221
      Height = 89
      Caption = 'Opções'
      TabOrder = 3
      object ckbCtlFisico: TCheckBox
        Left = 8
        Top = 16
        Width = 206
        Height = 17
        Caption = 'Incluir Bens com Controle Físico'
        TabOrder = 0
      end
      object ckbTodos: TCheckBox
        Left = 8
        Top = 40
        Width = 173
        Height = 17
        Caption = 'Exibe os Grupos sem Valor'
        TabOrder = 1
      end
      object ckbSinteticos: TCheckBox
        Left = 8
        Top = 64
        Width = 173
        Height = 17
        Caption = 'Somente Grupos Sintéticos'
        TabOrder = 2
      end
    end
    object rdgGrupo: TRadioGroup
      Left = 16
      Top = 104
      Width = 185
      Height = 88
      Caption = ' Grupos Contábeis dos Bens '
      ItemIndex = 0
      Items.Strings = (
        'Patrimoniais'
        'Investimentos Imobiliários'
        'Ambos')
      TabOrder = 2
    end
  end
  inherited Dock971: TDock97
    Top = 246
    Width = 443
    inherited tb97Fundo: TToolbar97
      Left = 273
      DockPos = 273
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 105
      DockPos = 105
      inherited ToolbarSep971: TToolbarSep97
        Visible = False
      end
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  object cmbGrupoIni: TwwDBLookupCombo [4]
    Left = 16
    Top = 72
    Width = 413
    Height = 21
    DropDownAlignment = taLeftJustify
    Selected.Strings = (
      'NOME'#9'30'#9'NOME'
      'CLASSE'#9'15'#9'CÓDIGO')
    LookupTable = qryGrupoIni
    LookupField = 'IDGRUPO'
    Options = [loTitles]
    TabOrder = 1
    AutoDropDown = True
    ShowButton = True
    AllowClearKey = True
    OnExit = cmbGrupoIniExit
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 392
    Top = 312
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryGrupoIni: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CLASSE, NOME, IDGRUPO'
      'FROM GRUPO'
      'WHERE TIPO = '#39'A'#39
      'ORDER BY CLASSE')
    ValidateWithMask = True
    Left = 24
    Top = 352
    object qryGrupoIniCLASSE: TStringField
      FieldName = 'CLASSE'
      Origin = 'GRUPO.CLASSE'
      Size = 15
    end
    object qryGrupoIniNOME: TStringField
      FieldName = 'NOME'
      Origin = 'GRUPO.NOME'
      Size = 60
    end
    object qryGrupoIniIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
      Origin = 'GRUPO.IDGRUPO'
    end
  end
  object qryGrpSinteticos: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CLASSE, NOME, IDGRUPO'
      'FROM GRUPO'
      'WHERE (TIPO = '#39'S'#39')'
      'ORDER BY CLASSE'
      ' ')
    ValidateWithMask = True
    Left = 360
    Top = 8
    object qryGrpSinteticosCLASSE: TStringField
      FieldName = 'CLASSE'
      Origin = 'GRUPO.CLASSE'
      Size = 15
    end
    object qryGrpSinteticosNOME: TStringField
      FieldName = 'NOME'
      Origin = 'GRUPO.NOME'
      Size = 60
    end
    object qryGrpSinteticosIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
      Origin = 'GRUPO.IDGRUPO'
    end
  end
  object qryBalPatGrp: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDGRUPO,'
      '       CLASSE,'
      '       NOME AS DESCGRUPO,'
      '       TIPO AS S_A,'
      '       (0)  AS VALORG,'
      '       (0)  AS CMBEM,'
      '       (0)  AS DEPLANC,'
      '       (0)  AS CMDEP,'
      '       (0)  AS VALCTB'
      'FROM GRUPO'
      'ORDER BY CLASSE')
    UpdateObject = updBalPatGrp
    ValidateWithMask = True
    Left = 96
    Top = 296
    object qryBalPatGrpIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
    end
    object qryBalPatGrpCLASSE: TStringField
      FieldName = 'CLASSE'
      Size = 15
    end
    object qryBalPatGrpDESCGRUPO: TStringField
      FieldName = 'DESCGRUPO'
      Size = 60
    end
    object qryBalPatGrpS_A: TStringField
      FieldName = 'S_A'
      Size = 1
    end
    object qryBalPatGrpVALORG: TFloatField
      FieldName = 'VALORG'
    end
    object qryBalPatGrpCMBEM: TFloatField
      FieldName = 'CMBEM'
    end
    object qryBalPatGrpDEPLANC: TFloatField
      FieldName = 'DEPLANC'
    end
    object qryBalPatGrpCMDEP: TFloatField
      FieldName = 'CMDEP'
    end
    object qryBalPatGrpVALCTB: TFloatField
      FieldName = 'VALCTB'
    end
  end
  object updBalPatGrp: TUpdateSQL
    ModifySQL.Strings = (
      'update GRUPO'
      'set'
      '  CLASSE = :CLASSE,'
      '  DESCGRUPO = :DESCGRUPO,'
      '  S_A = :S_A,'
      '  VALORG = :VALORG,'
      '  CMBEM = :CMBEM,'
      '  DEPLANC = :DEPLANC,'
      '  CMDEP = :CMDEP,'
      '  VALCTB = :VALCTB'
      'where'
      '  IDGRUPO = :OLD_IDGRUPO')
    InsertSQL.Strings = (
      'insert into GRUPO'
      
        '  (IDGRUPO, CLASSE, DESCGRUPO, S_A, VALORG, CMBEM, DEPLANC, CMDE' +
        'P, VALCTB)'
      'values'
      
        '  (:IDGRUPO, :CLASSE, :DESCGRUPO, :S_A, :VALORG, :CMBEM, :DEPLAN' +
        'C, :CMDEP, '
      '   :VALCTB)')
    DeleteSQL.Strings = (
      'delete from GRUPO'
      'where'
      '  IDGRUPO = :OLD_IDGRUPO')
    Left = 240
    Top = 296
  end
  object qryParamCaf: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MASCCODGRUPO, IDPESSOA'
      'FROM    PARAMETROSCAFMANUT'
      'WHERE (IDPESSOA = :PIDPESSOA)')
    ValidateWithMask = True
    Left = 24
    Top = 296
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryParamCafMASCCODGRUPO: TStringField
      FieldName = 'MASCCODGRUPO'
      Origin = '"CM.PARAMETROSCAFMANUT".MASCCODGRUPO'
    end
    object qryParamCafIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = '"CM.PARAMETROSCAFMANUT".IDPESSOA'
    end
  end
  object dsBalPatGrp: TwwDataSource
    DataSet = qryBalPatGrp
    Left = 168
    Top = 296
  end
  object qryGrpAnaliticos: TwwQuery
    DatabaseName = 'Basedados'
    SQL.Strings = (
      'SELECT SB.IDGRUPO, G.CLASSE,'
      
        '       SUM(SB.VALORG + SB.REAVVALORG + SB.ULTREAVVALORG)     AS ' +
        'VALORG0,'
      
        '       SUM(SB.CMBEM + SB.REAVCMBEM + SB.ULTREAVCMBEM)        AS ' +
        'CMBEM0,'
      
        '       SUM(SB.DEPLANC + SB.REAVDEPLANC + SB.ULTREAVDEPLANC)  AS ' +
        'DEPLANC0,'
      
        '       SUM(SB.CMDEP + SB.REAVCMDEP + SB.ULTREAVCMDEP)        AS ' +
        'CMDEP0,'
      '       SUM(SB.VALORG + SB.CMBEM - SB.DEPLANC - SB.CMDEP +'
      '           SB.REAVVALORG + SB.REAVCMBEM -'
      '           SB.REAVDEPLANC - SB.REAVCMDEP +'
      '           SB.ULTREAVVALORG + SB.ULTREAVCMBEM -'
      
        '           SB.ULTREAVDEPLANC - SB.ULTREAVCMDEP)              AS ' +
        'VALCTB0'
      ''
      
        'FROM (SELECT SCB.IDGRUPO, SCB.IDBEM,       SCB.IDPESSOA,       S' +
        'CB.DATASLDBEM,'
      '             SCB.VALORG,  SCB.REAVVALORG,  SCB.ULTREAVVALORG,'
      '             SCB.CMBEM,   SCB.REAVCMBEM,   SCB.ULTREAVCMBEM,'
      '             SCB.DEPLANC, SCB.REAVDEPLANC, SCB.ULTREAVDEPLANC,'
      '             SCB.CMDEP,   SCB.REAVCMDEP,   SCB.ULTREAVCMDEP'
      '      FROM SALDOCONTABBEM SCB,'
      '           (SELECT IDBEM, IDPESSOA, MAX(DATASLDBEM) AS DATA'
      '            FROM SALDOCONTABBEM'
      '            WHERE (DATASLDBEM <= :PDATASLD)'
      
        '              AND (NOT ((ABS(VALORG) < 0.01)         AND (ABS(CM' +
        'BEM) < 0.01)          AND'
      
        '                        (ABS(DEPLANC) < 0.01)        AND (ABS(CM' +
        'DEP) < 0.01)          AND'
      
        '                        (ABS(REAVVALORG) < 0.01)     AND (ABS(RE' +
        'AVCMBEM) < 0.01)      AND'
      
        '                        (ABS(REAVDEPLANC) < 0.01)    AND (ABS(RE' +
        'AVCMDEP) < 0.01)      AND'
      
        '                        (ABS(ULTREAVVALORG) < 0.01)  AND (ABS(UL' +
        'TREAVCMBEM) < 0.01)   AND'
      
        '                        (ABS(ULTREAVDEPLANC) < 0.01) AND (ABS(UL' +
        'TREAVCMDEP) < 0.01)))'
      '            GROUP BY IDBEM, IDPESSOA) DTAMAX'
      '      WHERE (SCB.DATASLDBEM = DTAMAX.DATA)'
      
        '        AND (SCB.IDBEM = DTAMAX.IDBEM) AND (SCB.IDPESSOA = DTAMA' +
        'X.IDPESSOA) ) SB,'
      ''
      '     (SELECT DISTINCT HM.IDBEM, HM.IDPESSOA'
      '      FROM HISTORICOMOVIMENTACAO HM'
      
        '      WHERE ((DATAMOVIMENTACAO >= :PDATAINI) AND (DATAMOVIMENTAC' +
        'AO <= :PDATASLD))'
      '        AND (IDTIPOMOVIMENTACAO = 06)) BBX,'
      ''
      '     BEM B, GRUPO G'
      ''
      'WHERE (B.BAIXATOTAL = '#39'S'#39')'
      '  AND (B.DATAINICIODEP <= :PDATASLD)'
      '  AND (B.IDPESSOA = :PIDPESSOA)'
      ''
      ''
      ''
      '  AND (B.IDBEM     = SB.IDBEM)'
      '  AND (B.IDPESSOA  = SB.IDPESSOA)'
      '  AND (SB.IDBEM    = BBX.IDBEM)'
      '  AND (SB.IDPESSOA = BBX.IDPESSOA)'
      '  AND (SB.IDGRUPO  = G.IDGRUPO(+))'
      'GROUP BY SB.IDGRUPO, G.CLASSE'
      ''
      ' ')
    ValidateWithMask = True
    Left = 272
    Top = 8
    ParamData = <
      item
        DataType = ftDate
        Name = 'PDATASLD'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATAINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATASLD'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATASLD'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryGrpAnaliticosIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
    end
    object qryGrpAnaliticosCLASSE: TStringField
      FieldName = 'CLASSE'
      FixedChar = True
      Size = 15
    end
    object qryGrpAnaliticosVALORG0: TFloatField
      FieldName = 'VALORG0'
    end
    object qryGrpAnaliticosCMBEM0: TFloatField
      FieldName = 'CMBEM0'
    end
    object qryGrpAnaliticosDEPLANC0: TFloatField
      FieldName = 'DEPLANC0'
    end
    object qryGrpAnaliticosCMDEP0: TFloatField
      FieldName = 'CMDEP0'
    end
    object qryGrpAnaliticosVALCTB0: TFloatField
      FieldName = 'VALCTB0'
    end
  end
end
