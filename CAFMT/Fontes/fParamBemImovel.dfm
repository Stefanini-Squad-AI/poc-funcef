inherited frmParamBemImovel: TfrmParamBemImovel
  Left = 134
  Top = 175
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Balancete Patrimonial de Bens Imóveis'
  ClientHeight = 332
  ClientWidth = 559
  FormStyle = fsNormal
  Visible = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 559
    Height = 293
    object Label1: TLabel
      Left = 208
      Top = 16
      Width = 129
      Height = 13
      Caption = 'Periodo Atualizado até'
    end
    object Bevel1: TBevel
      Left = 12
      Top = 40
      Width = 188
      Height = 1
      Shape = bsTopLine
    end
    object Bevel2: TBevel
      Left = 346
      Top = 40
      Width = 193
      Height = 1
      Shape = bsTopLine
    end
    object pnlAguarde: TPanel
      Left = 5
      Top = 79
      Width = 549
      Height = 209
      Align = alBottom
      BevelOuter = bvNone
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      object fcLabel1: TfcLabel
        Left = 200
        Top = 72
        Width = 140
        Height = 24
        Caption = 'Processando...'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TextOptions.Alignment = taLeftJustify
        TextOptions.VAlignment = vaTop
      end
    end
    object dbgSelConjunto: TwwDBGrid
      Left = 5
      Top = 79
      Width = 549
      Height = 210
      Selected.Strings = (
        'DESCCONJUNTO'#9'70'#9'Descrição do Conjunto'#9'F'
        'OK'#9'1'#9'OK')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = dsSelConj
      EditCalculated = True
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgMultiSelect]
      ParentFont = False
      TabOrder = 1
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      IndicatorColor = icBlack
    end
    object eDataFim: TCMDateTimePicker
      Left = 208
      Top = 32
      Width = 129
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
      OnExit = eDataFimExit
    end
  end
  inherited Dock971: TDock97
    Top = 293
    Width = 559
    inherited tb97Fundo: TToolbar97
      Left = 380
      DockPos = 380
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 212
      DefaultDock = Dock971
      DockPos = 212
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
  object qrySelConjunto: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT C.DESCCONJUNTO, C.IDCONJUNTO, 0 AS OK'
      'FROM CONJUNTO C,'
      '     BEM B,'
      '     GRUPO G'
      'WHERE (G.FLGIMOVEL = 1)'
      '  AND (C.IDCONJUNTO = B.IDCONJUNTO)'
      '  AND (G.IDGRUPO    = B.IDGRUPO)'
      'ORDER BY C.DESCCONJUNTO')
    UpdateObject = updSelConj
    ControlType.Strings = (
      'OK;CheckBox;1;0')
    ValidateWithMask = True
    Left = 312
    Top = 232
    object qrySelConjuntoDESCCONJUNTO: TStringField
      DisplayLabel = 'Descrição do Conjunto'
      DisplayWidth = 70
      FieldName = 'DESCCONJUNTO'
      Origin = '"CM.CONJUNTO".DESCCONJUNTO'
      Size = 200
    end
    object qrySelConjuntoOK: TFloatField
      DisplayWidth = 1
      FieldName = 'OK'
    end
    object qrySelConjuntoIDCONJUNTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONJUNTO'
      Origin = '"CM.CONJUNTO".IDCONJUNTO'
      Visible = False
    end
  end
  object dsSelConj: TwwDataSource
    DataSet = qrySelConjunto
    Left = 384
    Top = 232
  end
  object updSelConj: TUpdateSQL
    ModifySQL.Strings = (
      'update CONJUNTO'
      'set'
      '  DESCCONJUNTO = :DESCCONJUNTO,'
      '  IDCONJUNTO = :IDCONJUNTO,'
      '  OK = :OK'
      'where'
      '  DESCCONJUNTO = :OLD_DESCCONJUNTO and'
      '  IDCONJUNTO = :OLD_IDCONJUNTO')
    InsertSQL.Strings = (
      'insert into CONJUNTO'
      '  (DESCCONJUNTO, IDCONJUNTO, OK)'
      'values'
      '  (:DESCCONJUNTO, :IDCONJUNTO, :OK)')
    DeleteSQL.Strings = (
      'delete from CONJUNTO'
      'where'
      '  DESCCONJUNTO = :OLD_DESCCONJUNTO and'
      '  IDCONJUNTO = :OLD_IDCONJUNTO')
    Left = 448
    Top = 232
  end
  object qryBemImovel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT B.IDBEM, B.TAXADEP, B.DATAULTDEP, B.PLACA,'
      
        '       SB.VALORG                                            AS V' +
        'ALORG0,'
      
        '       SB.REAVVALORG                                        AS V' +
        'ALREAVACUM0,'
      
        '       (NVL(ATU.VALCMBEM,0) + NVL(ATU.VALCMREAV,0))         AS C' +
        'MBEMATU0,'
      
        '       (SB.CMBEM + SB.REAVCMBEM)                            AS C' +
        'MBEMACUM0,'
      
        '       (NVL(ATU.VALDEPBEM,0) + NVL(ATU.VALDEPREAV,0))       AS D' +
        'EPLANCATU0,'
      
        '       (SB.DEPLANC + SB.REAVDEPLANC)                        AS D' +
        'EPLANCACUM0,'
      
        '       (SB.CMDEP + SB.REAVCMDEP)                            AS C' +
        'MDEPLANCACUM0,'
      '       (SB.VALORG + SB.CMBEM -'
      '        SB.DEPLANC - SB.CMDEP +'
      '        SB.REAVVALORG + SB.REAVCMBEM -'
      
        '        SB.REAVDEPLANC - SB.REAVCMDEP)                      AS V' +
        'ALCTB0,'
      ''
      
        '       SB.ULTREAVVALORG                                     AS V' +
        'ALULTREAVACUM1,'
      
        '       NVL(ATU.VALCMULTREAV,0)                              AS V' +
        'ALULTCMREAVATU,'
      
        '       SB.ULTREAVCMBEM                                      AS V' +
        'ALULTCMREAVACUM1,'
      
        '       NVL(ATU.VALDEPULTREAV,0)                             AS V' +
        'ALULTDEPREAVATU,'
      
        '       SB.ULTREAVDEPLANC                                    AS V' +
        'ALULTDEPREAVACUM1,'
      
        '       SB.ULTREAVCMDEP                                      AS V' +
        'ALULTCMDEPREAVACUM1,'
      '       (SB.ULTREAVVALORG + SB.ULTREAVCMBEM -'
      
        '        SB.ULTREAVDEPLANC - SB.ULTREAVCMDEP)                AS V' +
        'ALCTB1,'
      ''
      
        '       (SB.REAVVALORG + SB.ULTREAVVALORG)                   AS S' +
        'UMPARCREAV,'
      '       (NVL(ATU.VALCMBEM,0) + NVL(ATU.VALCMREAV,0) +'
      
        '        NVL(ATU.VALCMULTREAV,0))                            AS S' +
        'UMCMBEMATU,'
      '       (SB.CMBEM + SB.REAVCMBEM +'
      
        '        SB.ULTREAVCMBEM)                                    AS S' +
        'UMCMBEMACUM,'
      '       (NVL(ATU.VALDEPBEM,0) + NVL(ATU.VALDEPREAV,0) +'
      
        '        NVL(ATU.VALDEPULTREAV,0))                           AS S' +
        'UMDEPATU,'
      '       (SB.DEPLANC + SB.REAVDEPLANC +'
      
        '        SB.ULTREAVDEPLANC)                                  AS S' +
        'UMDEPACUM,'
      '       (SB.CMDEP + SB.REAVCMDEP +'
      
        '        SB.ULTREAVCMDEP)                                    AS S' +
        'UMCMDEPACUM,'
      '       (SB.VALORG + SB.CMBEM -'
      '        SB.DEPLANC - SB.CMDEP +'
      '        SB.REAVVALORG + SB.REAVCMBEM -'
      '        SB.REAVDEPLANC - SB.REAVCMDEP) +'
      '       (SB.ULTREAVVALORG + SB.ULTREAVCMBEM -'
      
        '        SB.ULTREAVDEPLANC - SB.ULTREAVCMDEP)                AS S' +
        'UMVALCTB,'
      ''
      
        '       B.DESBEM, B.IDGRUPO, B.IDCONJUNTO, C.DESCCONJUNTO, G.NOME' +
        ' AS DESCGRUPO'
      ''
      'FROM (SELECT SCB.IDBEM, SCB.DATASLDBEM,'
      '             SCB.VALORG, SCB.REAVVALORG, SCB.ULTREAVVALORG,'
      '             SCB.CMBEM, SCB.REAVCMBEM, SCB.ULTREAVCMBEM,'
      '             SCB.DEPLANC, SCB.REAVDEPLANC, SCB.ULTREAVDEPLANC,'
      '             SCB.CMDEP, SCB.REAVCMDEP, SCB.ULTREAVCMDEP'
      '      FROM SALDOCONTABBEM SCB,'
      '           (SELECT IDBEM, MAX(DATASLDBEM) AS DATA'
      '            FROM SALDOCONTABBEM'
      '            WHERE (DATASLDBEM <= :PDATASLD)'
      '            GROUP BY IDBEM) DTAMAX'
      '      WHERE (SCB.DATASLDBEM = DTAMAX.DATA)'
      '        AND (SCB.IDBEM = DTAMAX.IDBEM) ) SB,'
      ''
      '     (SELECT ATX.IDBEM, ATX.DATAMOVIMENTACAO,'
      
        '             SUM(ATX.VLCMBEM) AS VALCMBEM, SUM(ATX.VLCMREAV) AS ' +
        'VALCMREAV,'
      
        '             SUM(ATX.VLDEPBEM) AS VALDEPBEM, SUM(ATX.VLDEPREAV) ' +
        'AS VALDEPREAV,'
      
        '             SUM(ATX.VLCMULTREAV) AS VALCMULTREAV, SUM(ATX.VLDEP' +
        'ULTREAV) AS VALDEPULTREAV'
      '      FROM ((SELECT /*+ INDEX(HM XIFHISTMOVBEMVW1)*/'
      '                    HM.IDBEM,'
      '                    HM.DATAMOVIMENTACAO,'
      
        '                    SUM(DECODE(HM.IDTIPOMOVIMENTACAO,15,NVL(HM.V' +
        'ALOFI,0),'
      
        '                                                     42,NVL(HM.V' +
        'ALOFI,0),'
      
        '                                                     34,NVL(HM.V' +
        'ALOFI,0),'
      
        '                                                     50,NVL(HM.V' +
        'ALOFI,0),0)) AS  VLCMBEM,'
      
        '                    (0)                                         ' +
        '             AS  VLCMREAV,'
      
        '                    SUM(DECODE(HM.IDTIPOMOVIMENTACAO,14,NVL(HM.V' +
        'ALOFI,0),'
      
        '                                                     17,NVL(HM.V' +
        'ALOFI,0),'
      
        '                                                     43,NVL(HM.V' +
        'ALOFI,0),'
      
        '                                                     35,NVL(HM.V' +
        'ALOFI,0),'
      
        '                                                     51,NVL(HM.V' +
        'ALOFI,0),0)) AS  VLDEPBEM,'
      
        '                    (0)                                         ' +
        '             AS  VLDEPREAV,'
      
        '                    (0)                                         ' +
        '             AS  VLCMULTREAV,'
      
        '                    (0)                                         ' +
        '             AS  VLDEPULTREAV'
      '             FROM HISTORICOMOVIMENTACAO HM'
      '             WHERE (HM.DATAMOVIMENTACAO = :PDATASLD)'
      '             GROUP BY HM.IDBEM,HM.DATAMOVIMENTACAO) UNION'
      ''
      '             ((SELECT /*+ INDEX(HM XIFHISTMOVBEMVW1)*/'
      '                      HM.IDBEM,'
      '                      HM.DATAMOVIMENTACAO,'
      
        '                      (0)                                       ' +
        '               AS  VALCMBEM,'
      
        '                      SUM(DECODE(HM.IDTIPOMOVIMENTACAO,22,NVL(HM' +
        '.VALOFI,0),'
      
        '                                                       46,NVL(HM' +
        '.VALOFI,0),0)) AS  VALCMREAV,'
      
        '                      (0)                                       ' +
        '               AS  VALDEPBEM,'
      
        '                      SUM(DECODE(HM.IDTIPOMOVIMENTACAO,18,NVL(HM' +
        '.VALOFI,0),'
      
        '                                                       33,NVL(HM' +
        '.VALOFI,0),'
      
        '                                                       47,NVL(HM' +
        '.VALOFI,0),0)) AS  VALDEPREAV,'
      
        '                      (0)                                       ' +
        '               AS  VALCMULTREAV,'
      
        '                      (0)                                       ' +
        '               AS  VALDEPULTREAV'
      '               FROM HISTORICOMOVIMENTACAO HM, REAVALIACAO R'
      '               WHERE (HM.DATAMOVIMENTACAO = :PDATASLD)'
      '                 AND (R.FLGULTREAVAL = 0)'
      '                 AND (HM.IDREAVALACRESC = R.IDREAVALIACAO(+))'
      '               GROUP BY HM.IDBEM,HM.DATAMOVIMENTACAO) UNION'
      ''
      '              (SELECT /*+ INDEX(HM XIFHISTMOVBEMVW1)*/'
      '                      HM.IDBEM,'
      '                      HM.DATAMOVIMENTACAO,'
      
        '                      (0)                                       ' +
        '               AS  VALCMBEM,'
      
        '                      (0)                                       ' +
        '               AS  VALCMREAV,'
      
        '                      (0)                                       ' +
        '               AS  VALDEPBEM,'
      
        '                      (0)                                       ' +
        '               AS  VALDEPREAV,'
      
        '                      SUM(DECODE(HM.IDTIPOMOVIMENTACAO,22,NVL(HM' +
        '.VALOFI,0),'
      
        '                                                       46,NVL(HM' +
        '.VALOFI,0),0)) AS  VALCMULTREAV,'
      
        '                      SUM(DECODE(HM.IDTIPOMOVIMENTACAO,18,NVL(HM' +
        '.VALOFI,0),'
      
        '                                                       33,NVL(HM' +
        '.VALOFI,0),'
      
        '                                                       47,NVL(HM' +
        '.VALOFI,0),0)) AS  VALDEPULTREAV'
      '               FROM HISTORICOMOVIMENTACAO HM, REAVALIACAO R'
      '               WHERE (HM.DATAMOVIMENTACAO = :PDATASLD)'
      '                 AND (R.FLGULTREAVAL = 1)'
      '                 AND (HM.IDREAVALACRESC = R.IDREAVALIACAO(+))'
      '               GROUP BY HM.IDBEM,HM.DATAMOVIMENTACAO))) ATX'
      '      GROUP BY ATX.IDBEM, ATX.DATAMOVIMENTACAO) ATU,'
      ''
      '     BEM B, GRUPO G, CONJUNTO C'
      ''
      'WHERE (G.FLGIMOVEL = 1)'
      ''
      ''
      ''
      '  AND (B.DATAINICIODEP <= :PDATASLD)'
      '  AND (B.IDGRUPO = G.IDGRUPO(+))'
      '  AND (B.IDCONJUNTO = C.IDCONJUNTO(+))'
      '  AND (B.IDBEM = ATU.IDBEM(+))'
      'ORDER BY C.DESCCONJUNTO, B.IDGRUPO, B.DESBEM'
      '')
    ValidateWithMask = True
    Left = 394
    Top = 24
    ParamData = <
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
        DataType = ftDate
        Name = 'PDATASLD'
        ParamType = ptUnknown
      end>
    object qryBemImovelIDBEM: TFloatField
      FieldName = 'IDBEM'
    end
    object qryBemImovelTAXADEP: TFloatField
      FieldName = 'TAXADEP'
    end
    object qryBemImovelDATAULTDEP: TDateTimeField
      FieldName = 'DATAULTDEP'
    end
    object qryBemImovelPLACA: TFloatField
      FieldName = 'PLACA'
    end
    object qryBemImovelVALORG0: TFloatField
      FieldName = 'VALORG0'
    end
    object qryBemImovelVALREAVACUM0: TFloatField
      FieldName = 'VALREAVACUM0'
    end
    object qryBemImovelCMBEMATU0: TFloatField
      FieldName = 'CMBEMATU0'
    end
    object qryBemImovelCMBEMACUM0: TFloatField
      FieldName = 'CMBEMACUM0'
    end
    object qryBemImovelDEPLANCATU0: TFloatField
      FieldName = 'DEPLANCATU0'
    end
    object qryBemImovelDEPLANCACUM0: TFloatField
      FieldName = 'DEPLANCACUM0'
    end
    object qryBemImovelCMDEPLANCACUM0: TFloatField
      FieldName = 'CMDEPLANCACUM0'
    end
    object qryBemImovelVALCTB0: TFloatField
      FieldName = 'VALCTB0'
    end
    object qryBemImovelVALULTREAVACUM1: TFloatField
      FieldName = 'VALULTREAVACUM1'
    end
    object qryBemImovelVALULTCMREAVATU: TFloatField
      FieldName = 'VALULTCMREAVATU'
    end
    object qryBemImovelVALULTCMREAVACUM1: TFloatField
      FieldName = 'VALULTCMREAVACUM1'
    end
    object qryBemImovelVALULTDEPREAVATU: TFloatField
      FieldName = 'VALULTDEPREAVATU'
    end
    object qryBemImovelVALULTDEPREAVACUM1: TFloatField
      FieldName = 'VALULTDEPREAVACUM1'
    end
    object qryBemImovelVALULTCMDEPREAVACUM1: TFloatField
      FieldName = 'VALULTCMDEPREAVACUM1'
    end
    object qryBemImovelVALCTB1: TFloatField
      FieldName = 'VALCTB1'
    end
    object qryBemImovelSUMPARCREAV: TFloatField
      FieldName = 'SUMPARCREAV'
    end
    object qryBemImovelSUMCMBEMATU: TFloatField
      FieldName = 'SUMCMBEMATU'
    end
    object qryBemImovelSUMCMBEMACUM: TFloatField
      FieldName = 'SUMCMBEMACUM'
    end
    object qryBemImovelSUMDEPATU: TFloatField
      FieldName = 'SUMDEPATU'
    end
    object qryBemImovelSUMDEPACUM: TFloatField
      FieldName = 'SUMDEPACUM'
    end
    object qryBemImovelSUMCMDEPACUM: TFloatField
      FieldName = 'SUMCMDEPACUM'
    end
    object qryBemImovelSUMVALCTB: TFloatField
      FieldName = 'SUMVALCTB'
    end
    object qryBemImovelDESBEM: TStringField
      FieldName = 'DESBEM'
      Size = 200
    end
    object qryBemImovelIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
    end
    object qryBemImovelIDCONJUNTO: TFloatField
      FieldName = 'IDCONJUNTO'
    end
    object qryBemImovelDESCCONJUNTO: TStringField
      FieldName = 'DESCCONJUNTO'
      Size = 200
    end
    object qryBemImovelDESCGRUPO: TStringField
      FieldName = 'DESCGRUPO'
      Size = 60
    end
  end
end
