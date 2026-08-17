inherited frmConsCartRendVarCCI: TfrmConsCartRendVarCCI
  Left = 270
  Top = 265
  HelpContext = 790539
  Caption = 'Consulta'
  ClientHeight = 533
  ClientWidth = 801
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel [0]
    Left = 503
    Top = 29
    Width = 45
    Height = 13
    Caption = 'Carteira'
  end
  inherited pnlFundo: TPanel
    Width = 801
    Height = 494
    inherited bvlSepTit: TBevel
      Width = 799
    end
    inherited pnlTitulo: TPanel
      Width = 799
      TabOrder = 2
      inherited lbNomDescricao: TfcLabel
        Width = 456
        Caption = 'Quantidades nas Carteiras de Renda Variável'
      end
    end
    object pnlConsulta: TPanel
      Left = 1
      Top = 45
      Width = 799
      Height = 136
      Align = alTop
      TabOrder = 0
      object Label2: TLabel
        Left = 3
        Top = 7
        Width = 93
        Height = 13
        Caption = 'Data Movimento'
      end
      object Label4: TLabel
        Left = 549
        Top = 7
        Width = 44
        Height = 13
        Caption = 'Emissor'
      end
      object Label5: TLabel
        Left = 120
        Top = 7
        Width = 126
        Height = 13
        Caption = 'Plano / Patrocinadora'
      end
      object lblCarteira: TLabel
        Left = 3
        Top = 48
        Width = 145
        Height = 13
        Caption = 'Carteira de Investimentos'
      end
      object edData: TCMDateTimePicker
        Left = 3
        Top = 22
        Width = 95
        Height = 21
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
        ShowButton = True
        TabOrder = 0
        OnEnter = edDataEnter
      end
      object dblConsEmissor: TwwDBLookupCombo
        Left = 549
        Top = 22
        Width = 224
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'SIGLAEMISSOR'#9'15'#9'Descrisão'#9'F')
        LookupTable = qryEmissor
        LookupField = 'IDEMISSOR'
        Options = [loRowLines, loTitles]
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnChange = dblConsEmissorChange
        OnEnter = dblConsEmissorEnter
      end
      object dblPlanoPrev: TwwDBLookupCombo
        Left = 118
        Top = 22
        Width = 413
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'PLANPRVCONTABPATRO'#9'60'#9'Descrição'#9'F')
        LookupTable = qryPlanoPrev
        LookupField = 'IDPLANPREVCTBPATR'
        Options = [loRowLines, loTitles]
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnChange = dblPlanoPrevChange
        OnCloseUp = dblPlanoPrevCloseUp
        OnEnter = dblPlanoPrevEnter
        OnExit = dblPlanoPrevExit
      end
      object CkLstCart: TCheckListBox
        Left = 3
        Top = 63
        Width = 784
        Height = 70
        Columns = 3
        Flat = False
        ItemHeight = 13
        TabOrder = 2
        OnEnter = CkLstCartEnter
      end
    end
    object dbGConsRVariavel: TwwDBGrid
      Left = 1
      Top = 181
      Width = 799
      Height = 312
      Selected.Strings = (
        'PLANPRVCONTABPATRO'#9'30'#9'Plano / Patrocinadora'#9'F'
        'DESCINVESTIMENTO'#9'30'#9'Investimento'#9'F'
        'QTDECC'#9'15'#9'Quantidade~Antiga'#9'F'
        'QTDECCI'#9'15'#9'Quantidade~Nova'#9'F'
        'QTDE'#9'16'#9'Quantidade~ Total'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = DmRelConsCartRenVarCCI.dsConsCartRenVarCCI
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -8
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      ParentFont = False
      TabOrder = 1
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clMaroon
      TitleFont.Height = -8
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 2
      TitleButtons = False
      IndicatorColor = icBlack
    end
  end
  inherited Dock971: TDock97
    Top = 494
    Width = 801
    inherited tb97Fundo: TToolbar97
      Left = 545
      DockPos = 951
      inherited sep1: TToolbarSep97
        Left = 249
        Visible = False
      end
      object ToolbarSep973: TToolbarSep97 [2]
        Left = 165
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      inherited bbtnSair: TBitBtn
        Left = 84
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 168
      end
      object bt_Imprime: TBitBtn
        Left = 0
        Top = 0
        Width = 81
        Height = 33
        Caption = '&Imprimir'
        TabOrder = 2
        OnClick = bt_ImprimeClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          0003377777777777777308888888888888807F33333333333337088888888888
          88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
          8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
          8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
        NumGlyphs = 2
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 373
      DockPos = 700
      inherited ToolbarSep971: TToolbarSep97
        Left = 0
      end
      object ToolbarSep972: TToolbarSep97 [1]
        Left = 84
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      inherited bbtnConfirmar: TBitBtn
        Left = 3
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 87
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 873
    Top = 15
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryConsCarteira: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   (0) AS ID, IDCARTEIRAINVEST, '
      '   (0) AS IDCARTEIRAGERENC, FLGCARTPROP, '
      '   DESCCARTINVEST '
      'FROM'
      '    CARTEIRAINVEST'
      'WHERE'
      '    IDTIPOINVEST = 2'
      'ORDER BY DESCCARTINVEST')
    ValidateWithMask = True
    Left = 674
    Top = 307
    object qryConsCarteiraID: TFloatField
      FieldName = 'ID'
    end
    object qryConsCarteiraIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object qryConsCarteiraIDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
    end
    object qryConsCarteiraFLGCARTPROP: TFloatField
      FieldName = 'FLGCARTPROP'
    end
    object qryConsCarteiraDESCCARTINVEST: TStringField
      FieldName = 'DESCCARTINVEST'
      Size = 60
    end
  end
  object qryEmissor: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT EM.IDEMISSOR, EM.SIGLAEMISSOR'
      'FROM EMISSOR EM'
      'ORDER BY EM.SIGLAEMISSOR'
      ''
      ' ')
    ValidateWithMask = True
    Left = 671
    Top = 251
    object qryEmissorSIGLAEMISSOR: TStringField
      DisplayLabel = 'Descrisão'
      DisplayWidth = 15
      FieldName = 'SIGLAEMISSOR'
      Origin = 'EMISSOR.SIGLAEMISSOR'
      Size = 15
    end
    object qryEmissorIDEMISSOR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDEMISSOR'
      Origin = 'EMISSOR.IDEMISSOR'
      Visible = False
    end
  end
  object QryUltDataMov: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MAX(HA2.DATAMOVCARTINV) AS DATAMOVCARTINV'
      'FROM HISTCARTINV HA2'
      'WHERE (HA2.IDTIPOINVEST = 2)'
      
        '  AND ((:IDPLANPREVCTBPATR IS NULL) OR (HA2.IDPLANPREVCTBPATR = ' +
        ':IDPLANPREVCTBPATR))'
      
        '  AND ((:IDCARTEIRAINVEST IS NULL) OR (HA2.IDCARTEIRAINVEST = :I' +
        'DCARTEIRAINVEST))'
      
        '  AND (((:IDCARTEIRAGERENC IS NOT NULL) AND (HA2.IDCARTEIRAGEREN' +
        'C = :IDCARTEIRAGERENC)) OR'
      
        '       ((:IDCARTEIRAGERENC IS NULL) AND (HA2.IDCARTEIRAGERENC IS' +
        ' NULL) ) )'
      '  AND (HA2.DATAMOVCARTINV || HA2.IDINVESTIMENTO) IN'
      
        '            (SELECT (MAX(HA3.DATAMOVCARTINV) || HA3.IDINVESTIMEN' +
        'TO)'
      '             FROM HISTCARTINV HA3'
      '             WHERE (HA3.IDTIPOINVEST = 2)'
      
        '               AND ((:IDPLANPREVCTBPATR IS NULL) OR (HA3.IDPLANP' +
        'REVCTBPATR = :IDPLANPREVCTBPATR))'
      
        '               AND ((:IDCARTEIRAINVEST IS NULL) OR (HA3.IDCARTEI' +
        'RAINVEST = :IDCARTEIRAINVEST))'
      
        '               AND (((:IDCARTEIRAGERENC IS NOT NULL) AND (HA3.ID' +
        'CARTEIRAGERENC = :IDCARTEIRAGERENC))    OR'
      
        '                    ((:IDCARTEIRAGERENC IS NULL)     AND (HA3.ID' +
        'CARTEIRAGERENC IS NULL)) )'
      
        '               AND (HA3.DATAMOVCARTINV <= TO_DATE(:DATAMOVCARTIN' +
        'V,'#39'DD/MM/YYYY'#39'))'
      '             GROUP BY HA3.IDINVESTIMENTO)'
      ' ')
    ValidateWithMask = True
    Left = 662
    Top = 123
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAGERENC'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'DATAMOVCARTINV'
        ParamType = ptInput
      end>
  end
  object qryPlanoPrev: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM VWPLANPREVCTBPATR ')
    ValidateWithMask = True
    Left = 670
    Top = 203
    object qryPlanoPrevPLANPRVCONTABPATRO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'PLANPRVCONTABPATRO'
      Origin = 'BASEDADOS."CM.VWPLANPREVCTBPATR".IDPLANPREVCTBPATR'
      Size = 113
    end
    object qryPlanoPrevPLANOCONTABIL: TStringField
      DisplayWidth = 50
      FieldName = 'PLANOCONTABIL'
      Origin = 'BASEDADOS."CM.VWPLANPREVCTBPATR".IDPLANOPREV'
      Visible = False
      Size = 50
    end
    object qryPlanoPrevPATROCINADORA: TStringField
      DisplayWidth = 60
      FieldName = 'PATROCINADORA'
      Origin = 'BASEDADOS."CM.VWPLANPREVCTBPATR".IDPATRO'
      Visible = False
      Size = 60
    end
    object qryPlanoPrevIDPLANPREVCTBPATR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANPREVCTBPATR'
      Origin = 'BASEDADOS."CM.VWPLANPREVCTBPATR".PLANPRVCONTABPATRO'
      Visible = False
    end
    object qryPlanoPrevIDPLANOPREV: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS."CM.VWPLANPREVCTBPATR".PLANPRVCONTABPATRO'
      Visible = False
    end
    object qryPlanoPrevIDPATRO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPATRO'
      Origin = 'BASEDADOS."CM.VWPLANPREVCTBPATR".PLANPRVCONTABPATRO'
      Visible = False
    end
  end
end
