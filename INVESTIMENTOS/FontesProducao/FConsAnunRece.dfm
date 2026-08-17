inherited frmConsAnunRece: TfrmConsAnunRece
  Left = 225
  Top = 56
  Caption = 'Diferença Anúncio x Recebimento'
  ClientHeight = 537
  ClientWidth = 790
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 790
    Height = 498
    inherited bvlSepTit: TBevel
      Top = 494
      Width = 788
      Align = alBottom
    end
    object Bevel1: TBevel [1]
      Left = 1
      Top = 169
      Width = 788
      Height = 8
      Align = alTop
      Shape = bsBottomLine
    end
    inherited pnlTitulo: TPanel
      Width = 788
      Height = 40
      inherited lbNomDescricao: TfcLabel
        Width = 343
        Caption = 'Diferença Anúncio x Recebimento'
      end
    end
    object pnlConsulta: TPanel
      Left = 1
      Top = 41
      Width = 788
      Height = 128
      Align = alTop
      TabOrder = 1
      object Label4: TLabel
        Left = 18
        Top = 5
        Width = 66
        Height = 13
        Caption = 'Data Inicial'
      end
      object Label5: TLabel
        Left = 183
        Top = 5
        Width = 59
        Height = 13
        Caption = 'Data Final'
      end
      object Label1: TLabel
        Left = 18
        Top = 44
        Width = 45
        Height = 13
        Caption = 'Carteira'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 341
        Top = 44
        Width = 44
        Height = 13
        Caption = 'Emissor'
      end
      object Label6: TLabel
        Left = 342
        Top = 5
        Width = 126
        Height = 13
        Caption = 'Plano / Patrocinadora'
      end
      object Label7: TLabel
        Left = 18
        Top = 83
        Width = 149
        Height = 13
        Caption = 'Segmentação de Mercado'
        FocusControl = dblSegmentacao
      end
      object DtaINICIO: TCMDateTimePicker
        Left = 18
        Top = 19
        Width = 145
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
      end
      object DtaFIM: TCMDateTimePicker
        Left = 183
        Top = 19
        Width = 146
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
        TabOrder = 1
      end
      object dblkEmissor: TwwDBLookupCombo
        Left = 341
        Top = 59
        Width = 302
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'SIGLAEMISSOR'#9'15'#9'Descrisão'#9'F')
        LookupTable = qryEmissor
        LookupField = 'IDEMISSOR'
        Options = [loRowLines, loTitles]
        TabOrder = 4
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
      end
      object dblkCarteira: TwwDBLookupCombo
        Left = 18
        Top = 59
        Width = 311
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCCARTINVEST'#9'40'#9'Descrição'#9'F')
        LookupTable = qryCarteira
        LookupField = 'IDCARTEIRA'
        Options = [loRowLines, loTitles]
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
      end
      object dblPlanoPrev: TwwDBLookupCombo
        Left = 342
        Top = 20
        Width = 302
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'PLANPRVCONTABPATRO'#9'60'#9'Descrição'#9'F')
        LookupTable = qryPlanoPrev
        LookupField = 'IDPLANPREVCTBPATR'
        Options = [loRowLines, loTitles]
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnExit = dblPlanoPrevExit
      end
      object ChBxConsolidadoInvest: TCheckBox
        Left = 353
        Top = 98
        Width = 193
        Height = 17
        Caption = 'Consolidado por Investimento'
        TabOrder = 5
        OnClick = ChBxConsolidadoInvestClick
      end
      object dblSegmentacao: TwwDBLookupCombo
        Left = 18
        Top = 98
        Width = 311
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCSEGMENTACAO'#9'50'#9'Segmentação'#9'F')
        LookupTable = QrySegmentacao
        LookupField = 'IDSEGMENTACAO'
        Options = [loRowLines, loTitles]
        TabOrder = 6
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
    end
    object dbgExercDireito: TwwDBGrid
      Left = 1
      Top = 177
      Width = 788
      Height = 317
      Selected.Strings = (
        'DATAOPERACAO'#9'18'#9'Data da Operação'
        'PLANOPATRO'#9'50'#9'Plano / Patrocinadora'
        'BOLETA'#9'30'#9'Boleta'
        'DESCINVESTIMENTO'#9'35'#9'Descrição do Investimento'
        'CARTEIRAINVESTIMENTO'#9'40'#9'Carteira'
        'SIGLATIPOOPER'#9'8'#9'Sigla da Operação'
        'DATABASE'#9'18'#9'Data Base'
        'DATAEX'#9'18'#9'Data Ex'
        'ANUNCIO'#9'10'#9'Valor de Anuncio'
        'RECEBIMENTO'#9'10'#9'Valor Recebido'
        'DIFERENCA'#9'10'#9'Diferença')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = DtmRelatorio.DsAnunRece
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clMaroon
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      OnCalcCellColors = dbgExercDireitoCalcCellColors
      IndicatorColor = icBlack
      OnTopRowChanged = dbgExercDireitoTopRowChanged
    end
  end
  inherited Dock971: TDock97
    Top = 498
    Width = 790
    inherited tb97Fundo: TToolbar97
      Left = 367
      inherited sep1: TToolbarSep97
        Left = 245
      end
      inherited sep3: TToolbarSep97
        Left = 161
      end
      inherited bbtnSair: TBitBtn
        Left = 80
        TabOrder = 1
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 164
        TabOrder = 2
      end
      object btnImprimir: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&Imprimir'
        ModalResult = 1
        TabOrder = 0
        OnClick = btnImprimirClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
          8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
          8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
          8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
        NumGlyphs = 2
        Spacing = 2
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 198
      DockPos = 198
      inherited ToolbarSep971: TToolbarSep97
        Left = 162
      end
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 81
        Visible = False
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      2
      (
        ''
        'Filter'
        0)
      (
        ''
        'DisplayLabel'
        0))
  end
  object qryPlanoPrev: TwwQuery
    Tag = 5
    Active = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM VWPLANPREVCTBPATR ')
    ValidateWithMask = True
    Left = 600
    Top = 54
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
  object qryEmissor: TwwQuery
    Active = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '  EM.IDEMISSOR,'
      '  EM.SIGLAEMISSOR'
      'FROM INVESTIMENTO IV, EMISSOR EM'
      'WHERE'
      '   (IV.IDTIPOINVEST = 2) AND'
      '   (IV.IDEMISSOR = EM.IDEMISSOR)'
      'ORDER BY EM.SIGLAEMISSOR'
      '')
    ValidateWithMask = True
    Left = 599
    Top = 93
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
  object qryCarteira: TwwQuery
    Tag = 5
    Active = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDCARTEIRA, DESCCARTINVEST'
      
        'FROM ( SELECT LPAD(IDCARTEIRAINVEST,2,'#39'0'#39')|| NULL AS IDCARTEIRA,' +
        'IDCARTEIRAINVEST,0 AS IDCARTEIRAGERENC,DESCCARTINVEST,IDTIPOINVE' +
        'ST,IDMERCADO FROM CARTEIRAINVEST'
      '       WHERE IDTIPOINVEST = 2'
      '       UNION'
      
        '       SELECT LPAD(CG.IDCARTEIRAINVEST,2,'#39'0'#39') || LPAD(CG.IDCARTE' +
        'IRAGERENC,2,'#39'0'#39') AS IDCARTEIRA, CG.IDCARTEIRAINVEST as DESCCARTI' +
        'NVEST,'
      
        '              CG.IDCARTEIRAGERENC AS IDCARTEIRAGERENC, CG.DESCCA' +
        'RTGERENC, CI.IDTIPOINVEST, CI.IDMERCADO'
      '       FROM CARTEIRAGERENC CG, CARTEIRAINVEST CI, PARAMINVEST PI'
      '       WHERE CG.IDCARTEIRAINVEST = CI.IDCARTEIRAINVEST'
      '             AND (CI.IDTIPOINVEST = 2)'
      '             AND ((PI.FLGCARTGERENC = '#39'S'#39') OR'
      '                  ((NVL(PI.FLGCARTGERENC, '#39'N'#39') = '#39'N'#39') AND'
      
        '                   ((PI.DATAMOVCDBLIB > TO_DATE(:DATAFIM,'#39'DD/MM/' +
        'YYYY'#39')))))'
      ')'
      'ORDER BY DESCCARTINVEST'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 285
    Top = 93
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAFIM'
        ParamType = ptInput
      end>
    object qryCarteiraDESCCARTINVEST: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldName = 'DESCCARTINVEST'
      Origin = 'BASEDADOS.VWCARTEIRASRV.DESCCARTINVEST'
      Size = 60
    end
    object qryCarteiraIDCARTEIRA: TStringField
      DisplayWidth = 4
      FieldName = 'IDCARTEIRA'
      Origin = 'BASEDADOS.VWCARTEIRASRV.IDCARTEIRA'
      Visible = False
      Size = 4
    end
  end
  object QrySegmentacao: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      ' IDSEGMENTACAO, DESCSEGMENTACAO, IDGRUPO '
      'FROM '
      '  SEGMENTACAOMERCADO'
      'WHERE '
      '  IDGRUPO =:GRUPO')
    ValidateWithMask = True
    Left = 275
    Top = 144
    ParamData = <
      item
        DataType = ftInteger
        Name = 'GRUPO'
        ParamType = ptUnknown
      end>
    object QrySegmentacaoIDSEGMENTACAO: TFloatField
      FieldName = 'IDSEGMENTACAO'
      Origin = 'BASEDADOS.SEGMENTACAOMERCADO.IDSEGMENTACAO'
    end
    object QrySegmentacaoDESCSEGMENTACAO: TStringField
      FieldName = 'DESCSEGMENTACAO'
      Origin = 'BASEDADOS.SEGMENTACAOMERCADO.DESCSEGMENTACAO'
      Size = 100
    end
    object QrySegmentacaoIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
      Origin = 'BASEDADOS.SEGMENTACAOMERCADO.IDGRUPO'
    end
  end
end
