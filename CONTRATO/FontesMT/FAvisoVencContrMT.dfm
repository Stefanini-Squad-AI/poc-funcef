inherited frmAvisoVencMT: TfrmAvisoVencMT
  Left = 83
  Top = 189
  HelpContext = 120017
  Caption = 'Aviso de Vencimento de Contratos'
  ClientHeight = 375
  ClientWidth = 1176
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 1176
    Height = 336
    object dbgContrato: TwwDBGrid
      Left = 1
      Top = 1
      Width = 1174
      Height = 334
      ControlType.Strings = (
        'MARCADO;CheckBox;S;N')
      Selected.Strings = (
        'NOMECONTRATO'#9'75'#9'Contrato'#9'F'
        'DATAPREVENCERRA'#9'34'#9'Data Prevista Vencimento / Encerramento'#9'F'
        'DIASFALTAM'#9'20'#9'Dias para Encerramento'#9'F'
        'DATAAVISO'#9'14'#9'Data Aviso'#9'F'
        'STATUS'#9'16'#9'Status'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = dsContrato
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      TabOrder = 0
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = True
      UseTFields = False
      OnCalcCellColors = dbgContratoCalcCellColors
      OnTitleButtonClick = dbgContratoTitleButtonClick
      OnDrawDataCell = dbgContratoDrawDataCell
      IndicatorColor = icBlack
    end
  end
  inherited Dock971: TDock97
    Top = 336
    Width = 1176
    inherited tb97Fundo: TToolbar97
      Left = 155
      DockPos = 155
      inherited sep1: TToolbarSep97
        Left = 435
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 352
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      object ToolbarSep972: TToolbarSep97 [2]
        Left = 161
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 354
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 437
      end
      object bbtnIniciarRenovacao: TBitBtn
        Left = 0
        Top = 0
        Width = 161
        Height = 33
        Caption = '&Iniciar Renovação'
        TabOrder = 2
        OnClick = bbtnIniciarRenovacaoClick
        Kind = bkRetry
      end
      object bbtnProcessoRenovacao: TmaHelpBitBtn
        Left = 163
        Top = 0
        Width = 189
        Height = 33
        Caption = '&Histórico de Renovação'
        TabOrder = 3
        OnClick = bbtnProcessoRenovacaoClick
        Glyph.Data = {
          42020000424D4202000000000000420000002800000010000000100000000100
          1000030000000002000000000000000000000000000000000000007C0000E003
          00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C104210421F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000FF7F00001F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000FF7FFF7FFF7F00001F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C00000000FF7FFF7FFF7FFF7FFF7FFF7F00001F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1042FF7FFF7FFF7FFF7FFF7F1F00FF7F00001F7C
          1F7C1F7C1F7C00401F7C1F7C1042FF7FFF7F1F001F001F00FF7FFF7FFF7F0000
          1F7C1F7C1F7C004000401F7C1F7C1042FF7FFF7FFF7FFF7FFF7F1F00FF7F0000
          1F7C1F7C1F7C0040004000401F7C1042FF7FFF7F1F001F001F00FF7FFF7FFF7F
          00001F7C1F7C1F7C0040004000400000000000000000FF7FFF7FFF7F1F00FF7F
          FF7F00001F7C1F7C1F7C00400000FF031F7CFF031F7C000010021F00FF7FFF7F
          FF7FFF7F00001F7C1F7C0000FF031F7CFF031F7CFF031F7C0000FF7FFF7FFF7F
          104210421F7C1F7C1F7C00001F7CFF031F7CFF031F7CFF030000FF7F10421042
          1F7C1F7C1F7C1F7C1F7C0000FF031F7CFF031F7CFF031F7C000010421F7C1F7C
          1F7C1F7C1F7C1F7C1F7C00001F7CFF031F7CFF031F7CFF0300001F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C00001F7CFF031F7CFF0300001F7C1F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000000000001F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C}
        ClickHelpContext = 0
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 720
    Top = 344
  end
  object spContratos: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   '#39'Vigente'#39' AS STATUS,'
      '   '#39'N'#39' AS MARCADO,'
      '   C.IDCONTRATO,'
      '   C.NOMECONTRATO,'
      '   C.DATAPREVENCERRA,'
      '   C.AVISO,'
      '   (TO_DATE(DATAPREVENCERRA,'#39'dd/mm/yy'#39')-AVISO) DATAAVISO,'
      
        '   (ROUND(TO_DATE(DATAPREVENCERRA,'#39'dd/mm/yy'#39')-TO_DATE(SYSDATE,'#39'd' +
        'd/mm/yy'#39'))) DIASFALTAM,'
      '   C.FLGFIMCONTRATO,'
      '   C.IDTIPOPROCESSORAD,'
      '   C.CODCENTRORESPON,'
      '   C.UNIDNEGOC,'
      '   ADT.IDPROCESSO,'
      '   RI.FLGOK,'
      '   RI.OBS,'
      '   C.FLGRENOVACAO,'
      '   C.RESPRENOVACAO,'
      '   HST.DTANDAMENTO, '#9#9'        '
      '   HST.DESCANDAMENTO'
      'FROM'
      '   CONTRATOCONTR C,'
      '   (SELECT'
      '       AD1.IDCONTRATO,'
      '       AD1.IDPROCESSO'
      '    FROM'
      '       ADITAMENTO AD1'
      '    WHERE'
      '       (AD1.IDADITAMENTO = (SELECT Max(IDADITAMENTO)'
      '                            FROM ADITAMENTO AD2'
      
        '                            WHERE (AD2.IDCONTRATO=AD1.IDCONTRATO' +
        ')))) ADT,'
      '       (SELECT IDPROCESSO,'
      '               FLGOK,'
      '               OBS'
      '        FROM RADINSTPROCESSO'
      '        WHERE (IDPESSOA=1)) RI,'
      #9#9
      #9#9'(SELECT DTANDAMENTO, '
      #9#9'        DESCANDAMENTO'
      #9#9'   FROM HSTRENOVACONTRATO'
      #9#9'  WHERE IDCONTRATO = 1'
      '            AND ROWNUM = 1'
      '          ORDER BY IDHSTRENOVACONTRATO DESC) HST'
      #9#9'  '
      'WHERE (C.IDCONTRATO=ADT.IDCONTRATO(+)) AND'
      '      (ADT.IDPROCESSO=RI.IDPROCESSO(+)) AND'
      '      ((C.DATAPREVENCERRA-C.AVISO)<=SYSDATE) AND'
      '      (C.FLGFIMCONTRATO = '#39'S'#39') AND'
      '      (C.IDPESSOA = 1) AND'
      '      (C.IDCONTRATO IN (SELECT CUS.IDCONTRATO'
      '                        FROM CONTRATOUSUARIO CUS'
      '                        WHERE  (CUS.IDUSUARIO = 1)))'
      'ORDER BY DATAPREVENCERRA'
      ''
      ' '
      ' '
      ' '
      ' '
      ''
      ' '
      ' '
      ' ')
    ClientDataSet = cdsContrato
    Left = 466
    Top = 58
  end
  object dsContrato: TwwDataSource
    DataSet = cdsContrato
    OnStateChange = dsContratoStateChange
    Left = 380
    Top = 56
  end
  object cdsContrato: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    AfterScroll = cdsContratoAfterScroll
    Left = 284
    Top = 55
    Data = {
      B10200009619E0BD010000001800000013000000000003000000B10206535441
      54555301004900000002000753554254595045020049000A0046697865644368
      617200055749445448020002000700074D41524341444F010049000000020007
      53554254595045020049000A0046697865644368617200055749445448020002
      0001000A4944434F4E545241544F08000400000000000C4E4F4D45434F4E5452
      41544F0100490000000100055749445448020002003C000F4441544150524556
      454E4345525241080008000000000005415649534F0800040000000000094441
      5441415649534F08000800000000000A4449415346414C54414D080004000000
      00000E464C4746494D434F4E545241544F010049000000020007535542545950
      45020049000A0046697865644368617200055749445448020002000100114944
      5449504F50524F434553534F52414408000400000000000F434F4443454E5452
      4F524553504F4E01004900000002000753554254595045020049000A00466978
      65644368617200055749445448020002000A0009554E49444E45474F43080004
      00000000000A494450524F434553534F080004000000000005464C474F4B0100
      4900000002000753554254595045020049000A00466978656443686172000557
      49445448020002000100034F4253010049000000010005574944544802000200
      C8000C464C4752454E4F564143414F0100490000000200075355425459504502
      0049000A00466978656443686172000557494454480200020001000D52455350
      52454E4F564143414F0100490000000100055749445448020002003C000B4454
      414E44414D454E544F08000800000000000D44455343414E44414D454E544F04
      004B000000020007535542545950450200490005005465787400055749445448
      020002002C010100044C4349440400010009080000}
  end
end
