inherited frmParamBalPatClas: TfrmParamBalPatClas
  Left = 270
  Top = 197
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Balancete Patrimonial por Classe'
  ClientHeight = 271
  ClientWidth = 442
  FormStyle = fsNormal
  Visible = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 442
    Height = 232
    object Label1: TLabel
      Left = 16
      Top = 16
      Width = 129
      Height = 13
      Caption = 'Periodo Atualizado até'
    end
    object Label3: TLabel
      Left = 16
      Top = 64
      Width = 38
      Height = 13
      Caption = 'Classe'
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
    object dblckCmbClasseIni: TwwDBLookupCombo
      Left = 16
      Top = 80
      Width = 409
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'50'#9'DESCRIÇÃO'
        'CODHIERARQ'#9'15'#9'CÓDIGO')
      LookupTable = qryClasseIni
      LookupField = 'IDCLASSEBEM'
      Options = [loTitles]
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      OnExit = dblckCmbClasseIniExit
    end
    object pnlStatus: TPanel
      Left = 5
      Top = 186
      Width = 432
      Height = 41
      Align = alBottom
      TabOrder = 2
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
        Width = 415
        Height = 16
        Min = 0
        Max = 100
        TabOrder = 0
      end
    end
    object GroupBox1: TGroupBox
      Left = 16
      Top = 112
      Width = 409
      Height = 65
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
        Left = 224
        Top = 16
        Width = 173
        Height = 17
        Caption = 'Exibe as Classes sem Valor'
        TabOrder = 1
      end
      object ckbSinteticos: TCheckBox
        Left = 8
        Top = 40
        Width = 184
        Height = 17
        Caption = 'Somente Classes Sintéticas'
        TabOrder = 2
      end
      object ckbBaixados: TCheckBox
        Left = 224
        Top = 40
        Width = 145
        Height = 17
        Caption = 'Incluir Bens Baixados'
        TabOrder = 3
      end
    end
  end
  inherited Dock971: TDock97
    Top = 232
    Width = 442
    inherited tb97Fundo: TToolbar97
      Left = 255
      DockPos = 255
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 82
      DockPos = 82
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
  inherited ivTradutor: TIvExtendedTranslator
    Left = 747
    Top = 507
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryClasAnaliticos: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CB.CODHIERARQ,'
      '       CB.DESCRICAO,'
      '       CB.ANASINT,'
      '       COUNT(*) AS QUANT,'
      
        '       ROUND(SUM(NVL(SB.VALORG,0) + NVL(SB.REAVVALORG,0) + NVL(S' +
        'B.ULTREAVVALORG,0)),2)      AS VALORG0,'
      
        '       ROUND(SUM(NVL(SB.CMBEM,0) + NVL(SB.REAVCMBEM,0) + NVL(SB.' +
        'ULTREAVCMBEM,0)),2)         AS CMBEM0,'
      
        '       ROUND(SUM(NVL(SB.DEPLANC,0) + NVL(SB.REAVDEPLANC,0) + NVL' +
        '(SB.ULTREAVDEPLANC,0)),2)   AS DEPLANC0,'
      
        '       ROUND(SUM(NVL(SB.CMDEP,0) + NVL(SB.REAVCMDEP,0) + NVL(SB.' +
        'ULTREAVCMDEP,0)),2)         AS CMDEP0,'
      
        '       ROUND(SUM(NVL(SB.VALORG,0) + NVL(SB.CMBEM,0) - NVL(SB.DEP' +
        'LANC,0) - NVL(SB.CMDEP,0) +'
      '                 NVL(SB.REAVVALORG,0) + NVL(SB.REAVCMBEM,0) -'
      '                 NVL(SB.REAVDEPLANC,0) - NVL(SB.REAVCMDEP,0) +'
      
        '                 NVL(SB.ULTREAVVALORG,0) + NVL(SB.ULTREAVCMBEM,0' +
        ') -'
      
        '                 NVL(SB.ULTREAVDEPLANC,0) - NVL(SB.ULTREAVCMDEP,' +
        '0)),2)                      AS VALCTB0'
      ''
      
        'FROM (SELECT SCB.IDGRUPO, SCB.IDBEM, SCB.IDPESSOA, SCB.DATASLDBE' +
        'M,'
      '             SCB.VALORG,   SCB.REAVVALORG,  SCB.ULTREAVVALORG,'
      '             SCB.CMBEM,    SCB.REAVCMBEM,   SCB.ULTREAVCMBEM,'
      '             SCB.DEPLANC,  SCB.REAVDEPLANC, SCB.ULTREAVDEPLANC,'
      '             SCB.CMDEP,    SCB.REAVCMDEP,   SCB.ULTREAVCMDEP'
      '      FROM SALDOCONTABBEM SCB,'
      '           (SELECT IDBEM, IDPESSOA, MAX(DATASLDBEM) AS DATA'
      '            FROM SALDOCONTABBEM'
      '            WHERE (DATASLDBEM <= :PDATASLD)'
      '            GROUP BY IDBEM, IDPESSOA) DTAMAX'
      '      WHERE (SCB.DATASLDBEM = DTAMAX.DATA)'
      
        '        AND (SCB.IDBEM = DTAMAX.IDBEM) AND (SCB.IDPESSOA = DTAMA' +
        'X.IDPESSOA) ) SB,'
      ''
      '     BEM B, CLASSEDEBEM CB, GRUPO G'
      ''
      'WHERE (B.IDPESSOA = :PIDPESSOA)'
      '  AND (B.DATAINICIODEP <= :PDATASLD)'
      '  AND (G.FLGIMOVEL = 0)'
      ''
      ''
      ''
      '  AND (SB.IDGRUPO  = G.IDGRUPO)'
      '  AND (SB.IDBEM    = B.IDBEM)'
      '  AND (SB.IDPESSOA = B.IDPESSOA)'
      '  AND (B.IDCLASSEBEM = CB.IDCLASSEBEM)'
      'GROUP BY CB.CODHIERARQ, CB.DESCRICAO, CB.ANASINT'
      ''
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 216
    Top = 8
    ParamData = <
      item
        DataType = ftDate
        Name = 'PDATASLD'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftDate
        Name = 'PDATASLD'
        ParamType = ptUnknown
      end>
    object qryClasAnaliticosCODHIERARQ: TStringField
      FieldName = 'CODHIERARQ'
      Origin = 'BASEDADOS.VWMOVCONTABBEM.CODCLASSEBEM'
      FixedChar = True
      Size = 15
    end
    object qryClasAnaliticosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.VWMOVCONTABBEM.DESCCLASSEBEM'
      Size = 60
    end
    object qryClasAnaliticosANASINT: TStringField
      FieldName = 'ANASINT'
      Origin = 'BASEDADOS.VWMOVCONTABBEM.TIPOCLASSEBEM'
      FixedChar = True
      Size = 1
    end
    object qryClasAnaliticosVALORG0: TFloatField
      FieldName = 'VALORG0'
      Origin = 'BASEDADOS.VWMOVCONTABBEM.VALORG'
    end
    object qryClasAnaliticosCMBEM0: TFloatField
      FieldName = 'CMBEM0'
      Origin = 'BASEDADOS.VWMOVCONTABBEM.CMBEM'
    end
    object qryClasAnaliticosDEPLANC0: TFloatField
      FieldName = 'DEPLANC0'
      Origin = 'BASEDADOS.VWMOVCONTABBEM.DEPLANC'
    end
    object qryClasAnaliticosCMDEP0: TFloatField
      FieldName = 'CMDEP0'
      Origin = 'BASEDADOS.VWMOVCONTABBEM.CMDEP'
    end
    object qryClasAnaliticosVALCTB0: TFloatField
      FieldName = 'VALCTB0'
      Origin = 'BASEDADOS.VWMOVCONTABBEM.VALCTB'
    end
    object qryClasAnaliticosQUANT: TFloatField
      FieldName = 'QUANT'
    end
  end
  object qryClasseIni: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODHIERARQ,DESCRICAO,IDCLASSEBEM'
      'FROM CLASSEDEBEM'
      'WHERE ANASINT = '#39'A'#39
      'ORDER BY CODHIERARQ')
    ValidateWithMask = True
    Left = 328
    Top = 72
    object qryClasseIniCODHIERARQ: TStringField
      FieldName = 'CODHIERARQ'
      Origin = '"CM.CLASSEDEBEM".CODHIERARQ'
      Size = 15
    end
    object qryClasseIniDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = '"CM.CLASSEDEBEM".DESCRICAO'
      Size = 60
    end
    object qryClasseIniIDCLASSEBEM: TFloatField
      FieldName = 'IDCLASSEBEM'
      Origin = '"CM.CLASSEDEBEM".IDCLASSEBEM'
    end
  end
  object qryParamCaf: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MASCARACLASSE, IDPESSOA'
      'FROM    PARAMETROSCAFMANUT'
      'WHERE (IDPESSOA = :PIDPESSOA)')
    ValidateWithMask = True
    Left = 256
    Top = 72
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryParamCafMASCARACLASSE: TStringField
      FieldName = 'MASCARACLASSE'
      Origin = 'PARAMETROSCAFMANUT.MASCARACLASSE'
      Size = 15
    end
    object qryParamCafIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'PARAMETROSCAFMANUT.IDPESSOA'
    end
  end
  object qryClasSinteticos: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODHIERARQ, DESCRICAO'
      'FROM CLASSEDEBEM'
      'WHERE (ANASINT = '#39'S'#39')'
      'ORDER BY CODHIERARQ'
      ''
      '')
    ValidateWithMask = True
    Left = 312
    Top = 8
    object qryClasSinteticosCODHIERARQ: TStringField
      FieldName = 'CODHIERARQ'
      Origin = '"CM.CLASSEDEBEM".CODHIERARQ'
      Size = 15
    end
    object qryClasSinteticosDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = '"CM.CLASSEDEBEM".DESCRICAO'
      Size = 60
    end
  end
  object qryBalPatClas: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODHIERARQ,'
      '       DESCRICAO,'
      '       ANASINT AS S_A,'
      '       (0)  AS QUANT, '
      '       (0)  AS VALORG,'
      '       (0)  AS CMBEM,'
      '       (0)  AS DEPLANC,'
      '       (0)  AS CMDEP,'
      '       (0)  AS VALCTB'
      'FROM CLASSEDEBEM'
      'ORDER BY CODHIERARQ'
      '')
    UpdateObject = updBalPatClas
    ValidateWithMask = True
    Left = 80
    Top = 80
    object qryBalPatClasCODHIERARQ: TStringField
      FieldName = 'CODHIERARQ'
      Size = 15
    end
    object qryBalPatClasDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object qryBalPatClasS_A: TStringField
      FieldName = 'S_A'
      Size = 1
    end
    object qryBalPatClasQUANT: TFloatField
      FieldName = 'QUANT'
    end
    object qryBalPatClasVALORG: TFloatField
      FieldName = 'VALORG'
    end
    object qryBalPatClasCMBEM: TFloatField
      FieldName = 'CMBEM'
    end
    object qryBalPatClasDEPLANC: TFloatField
      FieldName = 'DEPLANC'
    end
    object qryBalPatClasCMDEP: TFloatField
      FieldName = 'CMDEP'
    end
    object qryBalPatClasVALCTB: TFloatField
      FieldName = 'VALCTB'
    end
  end
  object updBalPatClas: TUpdateSQL
    ModifySQL.Strings = (
      'update CLASSEDEBEM'
      'set'
      '  CODHIERARQ = :CODHIERARQ,'
      '  DESCRICAO = :DESCRICAO,'
      '  S_A = :S_A,'
      '  QUANT = :QUANT,'
      '  VALORG = :VALORG,'
      '  CMBEM = :CMBEM,'
      '  DEPLANC = :DEPLANC,'
      '  CMDEP = :CMDEP,'
      '  VALCTB = :VALCTB'
      'where'
      '  CODHIERARQ = :OLD_CODHIERARQ')
    InsertSQL.Strings = (
      'insert into CLASSEDEBEM'
      
        '  (CODHIERARQ, DESCRICAO, S_A, QUANT, VALORG, CMBEM, DEPLANC, CM' +
        'DEP, VALCTB)'
      'values'
      
        '  (:CODHIERARQ, :DESCRICAO, :S_A, :QUANT, :VALORG, :CMBEM, :DEPL' +
        'ANC, :CMDEP, '
      '   :VALCTB)')
    DeleteSQL.Strings = (
      'delete from CLASSEDEBEM'
      'where'
      '  CODHIERARQ = :OLD_CODHIERARQ')
    Left = 168
    Top = 80
  end
end
