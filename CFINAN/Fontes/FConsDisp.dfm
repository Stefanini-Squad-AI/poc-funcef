inherited frmConsDisp: TfrmConsDisp
  Left = 86
  Top = 141
  Caption = 'Consulta Disponibilidade Financeira por Plano'
  ClientHeight = 415
  ClientWidth = 775
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 775
    Height = 376
    object lblDataDisp: TLabel
      Left = 12
      Top = 9
      Width = 136
      Height = 13
      Caption = 'Data da Disponibilidade'
    end
    object lblStatusDisp: TLabel
      Left = 531
      Top = 22
      Width = 214
      Height = 20
      Caption = 'Disponibilidade Bloqueada'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label14: TLabel
      Left = 338
      Top = 9
      Width = 118
      Height = 13
      Caption = 'Plano Previdenciário'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label15: TLabel
      Left = 158
      Top = 9
      Width = 80
      Height = 13
      Caption = 'Patrocinadora'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object deDataDisp: TCMDateTimePicker
      Left = 12
      Top = 25
      Width = 136
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
    object dbgrLancamentos: TwwDBGrid
      Left = 5
      Top = 56
      Width = 765
      Height = 315
      Selected.Strings = (
        'CODLANCFINANC'#9'20'#9'Código'#9'F'
        'NOMEPATRO'#9'20'#9'Patrocinadora'#9'F'
        'NOMEPLANO'#9'20'#9'Plano'#9'F'
        'ENTRADA'#9'15'#9'Entrada'#9'F'
        'SAIDA'#9'15'#9'Saída'#9'F'
        'VALORAPLIC'#9'15'#9'Valor a Aplicar'#9'F'
        'VALORRESGATE'#9'15'#9'Valor a Resgatar'#9'F'
        'DESCRICAO'#9'50'#9'Conta Bancária'#9'F'
        'DATALANCFINAN'#9'10'#9'Data Lanç.'#9'F'
        'ENTRADASAIDA'#9'1'#9'E/S'#9'F'
        'NUMCHQBORDERO'#9'15'#9'No. Documento'#9'F'
        'HISTORICO'#9'60'#9'Histórico'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alBottom
      DataSource = dsLancamento
      TabOrder = 3
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      OnCalcCellColors = dbgrLancamentosCalcCellColors
      IndicatorColor = icBlack
    end
    object dblcPlanoPrev: TwwDBLookupCombo
      Left = 338
      Top = 25
      Width = 177
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'50'#9'Nome')
      LookupTable = qryPlanoPrev
      LookupField = 'IDPLANOPREV'
      Options = [loColLines]
      Style = csDropDownList
      DropDownWidth = 8
      ParentFont = False
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object dblcPatro: TwwDBLookupCombo
      Left = 158
      Top = 25
      Width = 177
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'60'#9'Nome')
      LookupTable = qryPatro
      LookupField = 'IDPESSOA'
      Options = [loColLines]
      Style = csDropDownList
      DropDownWidth = 8
      ParentFont = False
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
  end
  inherited Dock971: TDock97
    Top = 376
    Width = 775
    inherited tb97Fundo: TToolbar97
      Left = 269
      DockPos = 269
      inherited sep1: TToolbarSep97
        Left = 290
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 452
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      object ToolbarSep972: TToolbarSep97 [2]
        Left = 91
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      object ToolbarSep973: TToolbarSep97 [3]
        Left = 197
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 292
        TabOrder = 1
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 372
        TabOrder = 2
      end
      object btnBusca: TBitBtn
        Left = 199
        Top = 0
        Width = 91
        Height = 33
        Cancel = True
        Caption = '&Seleciona'
        TabOrder = 0
        OnClick = btnBuscaClick
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
      object bbtnImprime: TBitBtn
        Left = 0
        Top = 0
        Width = 91
        Height = 33
        Caption = '&Relatório'
        TabOrder = 3
        TabStop = False
        OnClick = bbtnImprimeClick
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888880008
          8888888888888F7778FF8888000088888800877008888888888F7787F778FF88
          0000888800880007700888888F778F7778F778FF000088008800877007700888
          778F7787F778F778000080880088877770077087FF778887F88778F700008700
          888887777770008777888887FF888777000080888888F77777777087F8888F77
          78FF88870000878888FF888777777087F88F77888778FF8700008788FF888888
          87777087FF778888888778F7000087FF88899888888770877788888888888777
          000087888AA88888808880878FF8888888FFF8F700008877F888888FF0877888
          778FF88FF77787780000888877F87FFFFF08888888778F77788878F800008888
          88777FFFFFF088888888777FF888878F00008888888877FFFFFF008888888877
          8F888F77000088888888887FFF7788888888888878FF77880000888888888887
          7788888888888888877788880000888888888888888888888888888888888888
          0000}
        NumGlyphs = 2
        Spacing = 8
      end
      object bbtnDivergentes: TBitBtn
        Left = 93
        Top = 0
        Width = 104
        Height = 33
        Cancel = True
        Caption = '&Divergentes'
        TabOrder = 4
        OnClick = bbtnDivergentesClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333333333333333333333333FFF33FF333FFF339993370733
          999333777FF37FF377733339993000399933333777F777F77733333399970799
          93333333777F7377733333333999399933333333377737773333333333990993
          3333333333737F73333333333331013333333333333777FF3333333333910193
          333333333337773FF3333333399000993333333337377737FF33333399900099
          93333333773777377FF333399930003999333337773777F777FF339993370733
          9993337773337333777333333333333333333333333333333333333333333333
          3333333333333333333333333333333333333333333333333333}
        NumGlyphs = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 144
    Top = 160
  end
  object qryLancamento: TwwQuery
    Tag = 1
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   U.DATALANCFINAN,'
      '   U.NUMCHQBORDERO,'
      '   U.HISTORICO,'
      '   U.STATUSCONCILIA,'
      '   U.ENTRADASAIDA,'
      '   U.VALORLANCFINAN,'
      '   U.CODPORTADOR,'
      '   U.DESCRICAO,'
      
        '   DECODE(U.CODLANCFINANC,-1,'#39'Total Geral'#39',DECODE(U.CODLANCFINAN' +
        'C,0,'#39'Total por Plano/Patro'#39',TO_CHAR(U.CODLANCFINANC))) AS CODLAN' +
        'CFINANC,'
      '   U.DATADISPFINANC,'
      '   U.ENTRADA,'
      '   U.SAIDA,'
      '   U.VALORAPLIC,'
      '   U.VALORRESGATE,'
      '   U.IDPLANOPREV,'
      '   U.IDPATRO,'
      '   U.NOMEPATRO,'
      '   U.NOMEPLANO'
      'FROM'
      '(('
      'SELECT'
      '   TO_CHAR(M.DATALANCFINAN,'#39'DD/MM/YYYY'#39') AS DATALANCFINAN,'
      '   M.NUMCHQBORDERO,'
      '   M.HISTORICO,'
      '   M.STATUSCONCILIA,'
      '   M.ENTRADASAIDA,'
      '   M.VALORLANCFINAN,'
      '   M.CODPORTADOR,'
      '   P.DESCRICAO,'
      '   M.CODLANCFINANC,'
      '   M.DATADISPFINANC,'
      '   SUM(DECODE(R.RECPAG,'#39'R'#39',R.VALOR,0)) AS ENTRADA,'
      '   SUM(DECODE(R.RECPAG,'#39'P'#39',R.VALOR,0)) AS SAIDA,'
      '   0 AS VALORAPLIC,'
      '   0 AS VALORRESGATE,'
      '   R.IDPLANOPREV,'
      '   R.IDPATRO,'
      '   PE.NOME AS NOMEPATRO,'
      '   PC.NOME AS NOMEPLANO'
      'FROM'
      '   MOVIMFINANC M,PORTADORCONTA P,'
      '   RATEIOFINANC R,PESSOA PE,'
      '   PLANPREVCONTABIL PC'
      'WHERE (R.IDPATRO = PE.IDPESSOA(+))'
      '  AND (R.IDPLANOPREV = PC.IDPLANOPREV(+))'
      '  AND (M.CODPORTADOR = P.CODPORTADOR)'
      '  AND (M.CODLANCFINANC = R.CODLANCFINANC)'
      '  AND (M.DATADISPFINANC = :DATAREF)'
      '  AND (M.IDPESSOA = :IDPESSOA)'
      '  AND (M.STATUSCONCILIA <> '#39'C'#39')'
      
        '  AND ((R.IDPLANOPREV = :IDPlanoPrev) OR ( '#39'S'#39' = :TodosPlanos  )' +
        ')'
      '  AND ((R.IDPATRO = :IDPatro) OR ( '#39'S'#39' = :TodosPatrocinadores ))'
      'GROUP BY'
      
        '       M.DATALANCFINAN, M.NUMCHQBORDERO, M.HISTORICO,  M.STATUSC' +
        'ONCILIA,'
      
        '       M.ENTRADASAIDA, M.VALORLANCFINAN, M.CODPORTADOR, P.DESCRI' +
        'CAO,'
      '       M.CODLANCFINANC,    M.DATADISPFINANC,'
      '       R.IDPLANOPREV, R.IDPATRO, PE.NOME, PC.NOME )'
      ''
      'UNION ALL'
      '('
      'SELECT'
      '   '#39#39' AS DATALANCFINAN,'
      '   '#39#39' AS NUMCHQBORDERO,'
      '   '#39#39' AS HISTORICO,'
      '   '#39#39' AS STATUSCONCILIA,'
      '   '#39#39' AS ENTRADASAIDA,'
      '   0 AS VALORLANCFINAN,'
      '   0  AS CODPORTADOR,'
      '   '#39'-'#39' AS DESCRICAO,'
      '   0 AS CODLANCFINANC,'
      '   M.DATADISPFINANC,'
      '   SUM(DECODE(R.RECPAG,'#39'R'#39',R.VALOR,0)) AS ENTRADA,'
      '   SUM(DECODE(R.RECPAG,'#39'P'#39',R.VALOR,0)) AS SAIDA,'
      
        '   DECODE(SIGN(SUM(DECODE(R.RECPAG,'#39'R'#39',R.VALOR,R.VALOR*-1))),1,S' +
        'UM(DECODE(R.RECPAG,'#39'R'#39',R.VALOR,R.VALOR*-1)),0) AS VALORAPLIC,'
      
        '   DECODE(SIGN(SUM(DECODE(R.RECPAG,'#39'R'#39',R.VALOR,R.VALOR*-1))),-1,' +
        'SUM(DECODE(R.RECPAG,'#39'P'#39',R.VALOR,R.VALOR*-1)),0) AS VALORRESGATE,'
      
        '   R.IDPLANOPREV, R.IDPATRO, PE.NOME AS NOMEPATRO, PC.NOME AS NO' +
        'MEPLANO'
      'FROM'
      '   MOVIMFINANC M,'
      '   PORTADORCONTA P,'
      '   RATEIOFINANC R,'
      '   PESSOA PE,'
      '   PLANPREVCONTABIL PC'
      'WHERE (R.IDPATRO = PE.IDPESSOA(+))'
      '  AND (R.IDPLANOPREV = PC.IDPLANOPREV(+))'
      '  AND (M.CODPORTADOR = P.CODPORTADOR)'
      '  AND (M.CODLANCFINANC = R.CODLANCFINANC)'
      '  AND (M.DATADISPFINANC = :DATAREF)'
      '  AND (M.IDPESSOA = :IDPESSOA)'
      '  AND (M.STATUSCONCILIA <> '#39'C'#39')'
      '  AND ((R.IDPLANOPREV = :IDPlanoPrev) OR ( '#39'S'#39' = :TodosPlanos))'
      '  AND ((R.IDPATRO = :IDPatro) OR ( '#39'S'#39' = :TodosPatrocinadores))'
      
        'GROUP BY M.DATADISPFINANC,R.IDPLANOPREV, R.IDPATRO, PE.NOME, PC.' +
        'NOME)'
      ''
      'UNION ALL'
      '('
      'SELECT'
      '   '#39#39' AS DATALANCFINAN,'
      '   '#39#39' AS NUMCHQBORDERO,'
      '   '#39#39' AS HISTORICO,'
      '   '#39#39' AS STATUSCONCILIA,'
      '   '#39#39' AS ENTRADASAIDA,'
      '   0 AS VALORLANCFINAN,'
      '   0  AS CODPORTADOR,'
      '   '#39'-'#39' AS DESCRICAO,'
      '   -1 AS CODLANCFINANC,'
      '   M.DATADISPFINANC,'
      '   SUM(DECODE(R.RECPAG,'#39'R'#39',R.VALOR,0)) AS ENTRADA,'
      '   SUM(DECODE(R.RECPAG,'#39'P'#39',R.VALOR,0)) AS SAIDA,'
      
        '   DECODE(SIGN(SUM(DECODE(R.RECPAG,'#39'R'#39',R.VALOR,R.VALOR*-1))),1,S' +
        'UM(DECODE(R.RECPAG,'#39'R'#39',R.VALOR,R.VALOR*-1)),0) AS VALORAPLIC,'
      
        '   DECODE(SIGN(SUM(DECODE(R.RECPAG,'#39'R'#39',R.VALOR,R.VALOR*-1))),-1,' +
        'SUM(DECODE(R.RECPAG,'#39'P'#39',R.VALOR,R.VALOR*-1)),0) AS VALORRESGATE,'
      '   0 AS IDPLANOPREV,'
      '   0 AS IDPATRO,'
      '   '#39#39' AS NOMEPATRO,'
      '   '#39#39' AS NOMEPLANO'
      
        'FROM MOVIMFINANC M, PORTADORCONTA P, RATEIOFINANC R, PESSOA PE, ' +
        'PLANPREVCONTABIL PC'
      'WHERE (R.IDPATRO = PE.IDPESSOA(+))'
      '  AND (R.IDPLANOPREV = PC.IDPLANOPREV(+))'
      '  AND (M.CODPORTADOR = P.CODPORTADOR)'
      '  AND (M.CODLANCFINANC = R.CODLANCFINANC)'
      '  AND (M.DATADISPFINANC = :DATAREF)'
      '  AND (M.IDPESSOA = :IDPESSOA)'
      '  AND (M.STATUSCONCILIA <> '#39'C'#39')'
      '  AND ((R.IDPLANOPREV = :IDPlanoPrev) OR ( '#39'S'#39' = :TodosPlanos))'
      '  AND ((R.IDPATRO = :IDPatro) OR ( '#39'S'#39' = :TodosPatrocinadores))'
      'GROUP BY M.DATADISPFINANC)) U'
      
        'ORDER BY U.DATADISPFINANC, U.IDPLANOPREV, U.IDPATRO, U.DESCRICAO' +
        ', U.DATALANCFINAN, U.ENTRADASAIDA')
    ValidateWithMask = True
    Left = 208
    Top = 208
    ParamData = <
      item
        DataType = ftDate
        Name = 'DATAREF'
        ParamType = ptInput
        Value = 37107d
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = '1'
      end
      item
        DataType = ftFloat
        Name = 'IDPlanoPrev'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TodosPlanos'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDPatro'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TodosPatrocinadores'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATAREF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPlanoPrev'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TodosPlanos'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDPatro'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TodosPatrocinadores'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'DATAREF'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPlanoPrev'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TodosPlanos'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDPatro'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TodosPatrocinadores'
        ParamType = ptInput
      end>
    object qryLancamentoCODLANCFINANC: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 20
      FieldName = 'CODLANCFINANC'
      Size = 40
    end
    object qryLancamentoNOMEPATRO: TStringField
      DisplayLabel = 'Patrocinadora'
      DisplayWidth = 20
      FieldName = 'NOMEPATRO'
      Size = 60
    end
    object qryLancamentoNOMEPLANO: TStringField
      DisplayLabel = 'Plano'
      DisplayWidth = 20
      FieldName = 'NOMEPLANO'
      Size = 50
    end
    object qryLancamentoENTRADA: TFloatField
      DisplayLabel = 'Entrada'
      DisplayWidth = 15
      FieldName = 'ENTRADA'
      DisplayFormat = '#,##0.00'
    end
    object qryLancamentoSAIDA: TFloatField
      DisplayLabel = 'Saída'
      DisplayWidth = 15
      FieldName = 'SAIDA'
      DisplayFormat = '#,##0.00'
    end
    object qryLancamentoVALORAPLIC: TFloatField
      DisplayLabel = 'Valor a Aplicar'
      DisplayWidth = 15
      FieldName = 'VALORAPLIC'
      DisplayFormat = '#,##0.00'
    end
    object qryLancamentoVALORRESGATE: TFloatField
      DisplayLabel = 'Valor a Resgatar'
      DisplayWidth = 15
      FieldName = 'VALORRESGATE'
      DisplayFormat = '#,##0.00'
    end
    object qryLancamentoDESCRICAO: TStringField
      DisplayLabel = 'Conta Bancária'
      DisplayWidth = 50
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object qryLancamentoDATALANCFINAN: TStringField
      DisplayLabel = 'Data Lanç.'
      DisplayWidth = 10
      FieldName = 'DATALANCFINAN'
      Size = 10
    end
    object qryLancamentoENTRADASAIDA: TStringField
      DisplayLabel = 'E/S'
      DisplayWidth = 1
      FieldName = 'ENTRADASAIDA'
      Size = 1
    end
    object qryLancamentoNUMCHQBORDERO: TStringField
      DisplayLabel = 'No. Documento'
      DisplayWidth = 15
      FieldName = 'NUMCHQBORDERO'
      Size = 15
    end
    object qryLancamentoHISTORICO: TStringField
      DisplayLabel = 'Histórico'
      DisplayWidth = 60
      FieldName = 'HISTORICO'
      Size = 60
    end
    object qryLancamentoIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
    object qryLancamentoIDPATRO: TFloatField
      FieldName = 'IDPATRO'
      Visible = False
    end
    object qryLancamentoSTATUSCONCILIA: TStringField
      FieldName = 'STATUSCONCILIA'
      Visible = False
      Size = 1
    end
    object qryLancamentoVALORLANCFINAN: TFloatField
      FieldName = 'VALORLANCFINAN'
      Visible = False
    end
    object qryLancamentoCODPORTADOR: TFloatField
      FieldName = 'CODPORTADOR'
      Visible = False
    end
    object qryLancamentoDATADISPFINANC: TDateTimeField
      FieldName = 'DATADISPFINANC'
      Visible = False
    end
  end
  object dsLancamento: TwwDataSource
    DataSet = qryLancamento
    Left = 288
    Top = 208
  end
  object qryParametros: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DATABLOQDISPFINAN'
      'FROM PARAMFINANC'
      'WHERE (IDPESSOA = :IDPESSOA)')
    ValidateWithMask = True
    Left = 208
    Top = 256
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryParametrosDATABLOQDISPFINAN: TDateTimeField
      FieldName = 'DATABLOQDISPFINAN'
      Origin = 'BASEDADOS.PARAMFINANC.DATABLOQDISPFINAN'
    end
  end
  object qryPatro: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   P.NOME, PT.IDPESSOA'
      'FROM'
      '   PESSOA P,'
      '   PATRO PT'
      'WHERE'
      '   (P.IDPESSOA = PT.IDPESSOA)   ')
    ValidateWithMask = True
    Left = 256
    Top = 8
  end
  object qryPlanoPrev: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '   IDPLANOPREV, NOME'
      'FROM'
      '   PLANPREVCONTABIL'
      'ORDER BY NOME ')
    ValidateWithMask = True
    Left = 464
    Top = 8
  end
  object qryRelatDisp: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT TO_CHAR(M.DATALANCFINAN,'#39'DD/MM/YYYY'#39') AS DATALANCFINAN, M' +
        '.NUMCHQBORDERO, M.HISTORICO,  M.STATUSCONCILIA,'
      
        '       M.ENTRADASAIDA, M.VALORLANCFINAN, M.CODPORTADOR, P.DESCRI' +
        'CAO,'
      '       M.CODLANCFINANC,    M.DATADISPFINANC, E.NOMEEMPRESA,'
      '       SUM(DECODE(R.RECPAG,'#39'R'#39',R.VALOR,0)) AS ENTRADA,'
      '       SUM(DECODE(R.RECPAG,'#39'P'#39',R.VALOR,0)) AS SAIDA,'
      
        '       SUM(DECODE(R.RECPAG,'#39'R'#39',R.VALOR,R.VALOR*-1)) AS SALDOAPLI' +
        'CRESTATE,'
      
        '       R.IDPLANOPREV, R.IDPATRO, PE.NOME AS NOMEPATRO, PC.NOME A' +
        'S NOMEPLANO'
      
        'FROM MOVIMFINANC M, PORTADORCONTA P, RATEIOFINANC R,  PESSOA PE,' +
        ' PLANPREVCONTABIL PC, EMPRESAPROP E'
      'WHERE (R.IDPATRO = PE.IDPESSOA(+))'
      '  AND (R.IDPLANOPREV = PC.IDPLANOPREV(+))'
      '  AND (M.CODPORTADOR = P.CODPORTADOR)'
      '  AND (M.DATADISPFINANC = :DATAREF)'
      '  AND (M.IDPESSOA = :IDPESSOA)'
      '  AND (M.STATUSCONCILIA <> '#39'C'#39')'
      '  AND (M.CODLANCFINANC = R.CODLANCFINANC)'
      '  AND ((R.IDPLANOPREV = :IDPlanoPrev) OR ( '#39'S'#39' = :TodosPlanos))'
      '  AND ((R.IDPATRO = :IDPatro) OR ( '#39'S'#39' = :TodosPatrocinadores))'
      '  AND (E.IDPESSOA = M.IDPESSOA)'
      'GROUP BY'
      
        '       M.DATALANCFINAN, M.NUMCHQBORDERO, M.HISTORICO,  M.STATUSC' +
        'ONCILIA,'
      
        '       M.ENTRADASAIDA, M.VALORLANCFINAN, M.CODPORTADOR, P.DESCRI' +
        'CAO,'
      '       M.CODLANCFINANC,    M.DATADISPFINANC, E.NOMEEMPRESA,'
      '       R.IDPLANOPREV, R.IDPATRO, PE.NOME, PC.NOME'
      
        'ORDER BY M.DATADISPFINANC, R.IDPLANOPREV, R.IDPATRO, P.DESCRICAO' +
        ', M.DATALANCFINAN, M.ENTRADASAIDA'
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 208
    Top = 160
    ParamData = <
      item
        DataType = ftDate
        Name = 'DATAREF'
        ParamType = ptInput
        Value = 37107d
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = '1'
      end
      item
        DataType = ftFloat
        Name = 'IDPlanoPrev'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TodosPlanos'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDPatro'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TodosPatrocinadores'
        ParamType = ptInput
      end>
  end
  object dsRelatDisp: TwwDataSource
    DataSet = qryRelatDisp
    Left = 288
    Top = 160
  end
  object pplRelatDisp: TppBDEPipeline
    DataSource = dsRelatDisp
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'lRelatDisp'
    Left = 360
    Top = 160
    object pplRelatDispppField1: TppField
      FieldAlias = 'DATALANCFINAN'
      FieldName = 'DATALANCFINAN'
      FieldLength = 10
      DisplayWidth = 10
      Position = 0
    end
    object pplRelatDispppField2: TppField
      FieldAlias = 'NUMCHQBORDERO'
      FieldName = 'NUMCHQBORDERO'
      FieldLength = 15
      DisplayWidth = 15
      Position = 1
    end
    object pplRelatDispppField3: TppField
      FieldAlias = 'HISTORICO'
      FieldName = 'HISTORICO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 2
    end
    object pplRelatDispppField4: TppField
      FieldAlias = 'STATUSCONCILIA'
      FieldName = 'STATUSCONCILIA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 3
    end
    object pplRelatDispppField5: TppField
      FieldAlias = 'ENTRADASAIDA'
      FieldName = 'ENTRADASAIDA'
      FieldLength = 1
      DisplayWidth = 1
      Position = 4
    end
    object pplRelatDispppField6: TppField
      Alignment = taRightJustify
      FieldAlias = 'VALORLANCFINAN'
      FieldName = 'VALORLANCFINAN'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 5
    end
    object pplRelatDispppField7: TppField
      Alignment = taRightJustify
      FieldAlias = 'CODPORTADOR'
      FieldName = 'CODPORTADOR'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 6
    end
    object pplRelatDispppField8: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 7
    end
    object pplRelatDispppField9: TppField
      Alignment = taRightJustify
      FieldAlias = 'CODLANCFINANC'
      FieldName = 'CODLANCFINANC'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 8
    end
    object pplRelatDispppField10: TppField
      FieldAlias = 'DATADISPFINANC'
      FieldName = 'DATADISPFINANC'
      FieldLength = 0
      DataType = dtDateTime
      DisplayWidth = 18
      Position = 9
    end
    object pplRelatDispppField11: TppField
      FieldAlias = 'NOMEEMPRESA'
      FieldName = 'NOMEEMPRESA'
      FieldLength = 60
      DisplayWidth = 60
      Position = 10
    end
    object pplRelatDispppField12: TppField
      Alignment = taRightJustify
      FieldAlias = 'ENTRADA'
      FieldName = 'ENTRADA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 11
    end
    object pplRelatDispppField13: TppField
      Alignment = taRightJustify
      FieldAlias = 'SAIDA'
      FieldName = 'SAIDA'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 12
    end
    object pplRelatDispppField14: TppField
      Alignment = taRightJustify
      FieldAlias = 'SALDOAPLICRESTATE'
      FieldName = 'SALDOAPLICRESTATE'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 13
    end
    object pplRelatDispppField15: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPLANOPREV'
      FieldName = 'IDPLANOPREV'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 14
    end
    object pplRelatDispppField16: TppField
      Alignment = taRightJustify
      FieldAlias = 'IDPATRO'
      FieldName = 'IDPATRO'
      FieldLength = 0
      DataType = dtDouble
      DisplayWidth = 10
      Position = 15
    end
    object pplRelatDispppField17: TppField
      FieldAlias = 'NOMEPATRO'
      FieldName = 'NOMEPATRO'
      FieldLength = 60
      DisplayWidth = 60
      Position = 16
    end
    object pplRelatDispppField18: TppField
      FieldAlias = 'NOMEPLANO'
      FieldName = 'NOMEPLANO'
      FieldLength = 50
      DisplayWidth = 50
      Position = 17
    end
  end
  object rptRelatDisp: TppReport
    AutoStop = False
    DataPipeline = pplRelatDisp
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'PpModeloReport1'
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 297000
    PrinterSetup.mmPaperWidth = 210000
    PrinterSetup.PaperSize = 9
    Template.SaveTo = stDatabase
    Units = utScreenPixels
    AllowPrintToArchive = True
    AllowPrintToFile = True
    DeviceType = 'Screen'
    Left = 432
    Top = 160
    Version = '5.5'
    mmColumnWidth = 197300
    object ppHeaderBand6: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 27781
      mmPrintPosition = 0
      object ppLabel2: TppLabel
        UserName = 'ppLabel2'
        Caption = 'Disponibilidade Financeira em 04/08/2001'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 56621
        mmTop = 7408
        mmWidth = 83873
        BandType = 0
      end
      object ppLine15: TppLine
        UserName = 'ppLine15'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 1058
        mmLeft = 0
        mmTop = 19315
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel24: TppLabel
        UserName = 'ppLabel24'
        Caption = 'Código'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 794
        mmTop = 23019
        mmWidth = 9525
        BandType = 0
      end
      object ppLine16: TppLine
        UserName = 'ppLine16'
        Pen.Width = 3
        ParentWidth = True
        Weight = 2.25
        mmHeight = 1058
        mmLeft = 0
        mmTop = 27252
        mmWidth = 197300
        BandType = 0
      end
      object ppLabel25: TppLabel
        UserName = 'ppLabel25'
        Caption = 'Data'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 18521
        mmTop = 23019
        mmWidth = 5821
        BandType = 0
      end
      object ppLblTituloContaCC2: TppLabel
        UserName = 'ppLblTituloContaCC2'
        Caption = 'ppLblTitulo2'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3175
        mmLeft = 1588
        mmTop = 14552
        mmWidth = 14817
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Conta Bancária'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 34660
        mmTop = 23019
        mmWidth = 20108
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Histórico'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 73290
        mmTop = 23019
        mmWidth = 11906
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Entrada'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 160338
        mmTop = 23019
        mmWidth = 10319
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Saída'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 188648
        mmTop = 23019
        mmWidth = 7408
        BandType = 0
      end
      object ppDBText8: TppDBText
        UserName = 'DBText3'
        AutoSize = True
        DataField = 'NOMEEMPRESA'
        DataPipeline = pplRelatDisp
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 5821
        mmLeft = 70379
        mmTop = 794
        mmWidth = 56356
        BandType = 0
      end
    end
    object bndDetContaCC: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 4233
      mmPrintPosition = 0
      object dbtxtCCustoCC: TppDBText
        UserName = 'dbtxtCCustoCC'
        DataField = 'CODLANCFINANC'
        DataPipeline = pplRelatDisp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 794
        mmTop = 265
        mmWidth = 17198
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'ppDBText3'
        DataField = 'HISTORICO'
        DataPipeline = pplRelatDisp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 73290
        mmTop = 265
        mmWidth = 71967
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText1'
        DataField = 'ENTRADA'
        DataPipeline = pplRelatDisp
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 146315
        mmTop = 265
        mmWidth = 24342
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'SAIDA'
        DataPipeline = pplRelatDisp
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 171715
        mmTop = 265
        mmWidth = 24342
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'dbtxtCCustoCC1'
        DataField = 'DATALANCFINAN'
        DataPipeline = pplRelatDisp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 18521
        mmTop = 265
        mmWidth = 15346
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'DESCRICAO'
        DataPipeline = pplRelatDisp
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 34660
        mmTop = 265
        mmWidth = 37835
        BandType = 4
      end
    end
    object ppFooterBand6: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 13758
      mmPrintPosition = 0
      object ppLine17: TppLine
        UserName = 'ppLine17'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 265
        mmWidth = 197300
        BandType = 8
      end
      object ppLabel32: TppLabel
        UserName = 'ppLabel32'
        AutoSize = False
        Caption = 'Controle Financeiro'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 0
        mmTop = 1588
        mmWidth = 79375
        BandType = 8
      end
      object rptContaCCLabel2: TppLabel
        UserName = 'rptContaCCLabel2'
        Caption = 'Página'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 87577
        mmTop = 1588
        mmWidth = 9525
        BandType = 8
      end
      object lblContCoCC: TppLabel
        UserName = 'lblContCoCC'
        AutoSize = False
        Caption = 'lblContCoCC'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 98425
        mmTop = 1588
        mmWidth = 11113
        BandType = 8
      end
      object ppCalc12: TppSystemVariable
        UserName = 'Calc12'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 165894
        mmTop = 1588
        mmWidth = 26194
        BandType = 8
      end
      object lblCalcCoCC: TppSystemVariable
        UserName = 'lblCalcCoCC1'
        VarType = vtPageNo
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        Visible = False
        mmHeight = 3704
        mmLeft = 80698
        mmTop = 1588
        mmWidth = 1588
        BandType = 8
      end
    end
    object ppSummaryBand1: TppSummaryBand
      mmBottomOffset = 0
      mmHeight = 13229
      mmPrintPosition = 0
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 0
        mmTop = 6879
        mmWidth = 197300
        BandType = 7
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        AutoSize = False
        Caption = 'Saldo a Aplicar/Resgatar:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1852
        mmTop = 2117
        mmWidth = 36248
        BandType = 7
      end
      object ppDBCalc4: TppDBCalc
        UserName = 'DBCalc4'
        AutoSize = True
        DataField = 'SALDOAPLICRESTATE'
        DataPipeline = pplRelatDisp
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3175
        mmLeft = 39423
        mmTop = 2117
        mmWidth = 41275
        BandType = 7
      end
      object ppDBCalc5: TppDBCalc
        UserName = 'DBCalc5'
        DataField = 'ENTRADA'
        DataPipeline = pplRelatDisp
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 146315
        mmTop = 2117
        mmWidth = 24342
        BandType = 7
      end
      object ppDBCalc6: TppDBCalc
        UserName = 'DBCalc6'
        DataField = 'SAIDA'
        DataPipeline = pplRelatDisp
        DisplayFormat = '#,0.00;-#,0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 171715
        mmTop = 2117
        mmWidth = 24342
        BandType = 7
      end
      object ppLabel11: TppLabel
        UserName = 'Label101'
        AutoSize = False
        Caption = 'Total Geral:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 108744
        mmTop = 2117
        mmWidth = 36248
        BandType = 7
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 0
        mmTop = 0
        mmWidth = 197300
        BandType = 7
      end
    end
    object rptContaCCGroup1: TppGroup
      BreakName = 'DATADISPFINANC'
      DataPipeline = pplRelatDisp
      UserName = 'rptContaCCGroup1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object rptContaCCGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6879
        mmPrintPosition = 0
        object rptContaCCLabel1: TppLabel
          UserName = 'rptContaCCLabel1'
          Caption = 'Data da Disponibilidade:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 6615
          mmTop = 1588
          mmWidth = 32015
          BandType = 3
          GroupNo = 0
        end
        object dbtxtContaCC: TppDBText
          UserName = 'dbtxtContaCC'
          AutoSize = True
          DataField = 'DATADISPFINANC'
          DataPipeline = pplRelatDisp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 42069
          mmTop = 1588
          mmWidth = 13758
          BandType = 3
          GroupNo = 0
        end
        object rptContaCCLine2: TppLine
          UserName = 'rptContaCCLine2'
          ParentWidth = True
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 3
          GroupNo = 0
        end
      end
      object rptContaCCGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
    object ppGroup1: TppGroup
      BreakName = 'IDPLANOPREV'
      DataPipeline = pplRelatDisp
      UserName = 'Group1'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand1: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
      object ppGroupFooterBand1: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 5821
        mmPrintPosition = 0
        object ppDBCalc1: TppDBCalc
          UserName = 'DBCalc1'
          DataField = 'ENTRADA'
          DataPipeline = pplRelatDisp
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 146315
          mmTop = 1058
          mmWidth = 24342
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc2: TppDBCalc
          UserName = 'DBCalc2'
          DataField = 'SAIDA'
          DataPipeline = pplRelatDisp
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 171715
          mmTop = 1058
          mmWidth = 24342
          BandType = 5
          GroupNo = 1
        end
        object ppDBCalc3: TppDBCalc
          UserName = 'DBCalc3'
          AutoSize = True
          DataField = 'SALDOAPLICRESTATE'
          DataPipeline = pplRelatDisp
          DisplayFormat = '#,0.00;-#,0.00'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          ResetGroup = ppGroup1
          Transparent = True
          mmHeight = 3175
          mmLeft = 39423
          mmTop = 1058
          mmWidth = 41275
          BandType = 5
          GroupNo = 1
        end
        object ppLabel4: TppLabel
          UserName = 'Label4'
          AutoSize = False
          Caption = 'Saldo a Aplicar/Resgatar:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 1852
          mmTop = 1058
          mmWidth = 36248
          BandType = 5
          GroupNo = 1
        end
        object ppLabel10: TppLabel
          UserName = 'Label10'
          AutoSize = False
          Caption = 'Total do Plano/Patro:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          TextAlignment = taRightJustified
          Transparent = True
          mmHeight = 3704
          mmLeft = 108744
          mmTop = 1058
          mmWidth = 36248
          BandType = 5
          GroupNo = 1
        end
      end
    end
    object ppGroup2: TppGroup
      BreakName = 'IDPATRO'
      DataPipeline = pplRelatDisp
      UserName = 'Group2'
      mmNewColumnThreshold = 0
      mmNewPageThreshold = 0
      object ppGroupHeaderBand2: TppGroupHeaderBand
        mmBottomOffset = 0
        mmHeight = 6350
        mmPrintPosition = 0
        object rptContaCCLine1: TppLine
          UserName = 'rptContaCCLine1'
          ParentWidth = True
          Style = lsDouble
          Weight = 0.75
          mmHeight = 1058
          mmLeft = 0
          mmTop = 0
          mmWidth = 197300
          BandType = 3
          GroupNo = 2
        end
        object ppLabel1: TppLabel
          UserName = 'Label1'
          Caption = 'Plano Previdenciário:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 2117
          mmTop = 1588
          mmWidth = 28310
          BandType = 3
          GroupNo = 2
        end
        object ppDBText1: TppDBText
          UserName = 'dbtxtContaCC1'
          DataField = 'NOMEPLANO'
          DataPipeline = pplRelatDisp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 33338
          mmTop = 1588
          mmWidth = 69586
          BandType = 3
          GroupNo = 2
        end
        object ppLabel3: TppLabel
          UserName = 'Label3'
          Caption = 'Patrocinadora:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3175
          mmLeft = 103981
          mmTop = 1588
          mmWidth = 19579
          BandType = 3
          GroupNo = 2
        end
        object ppDBText2: TppDBText
          UserName = 'DBText2'
          DataField = 'NOMEPATRO'
          DataPipeline = pplRelatDisp
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Name = 'Arial'
          Font.Size = 8
          Font.Style = [fsBold]
          Transparent = True
          mmHeight = 3704
          mmLeft = 125413
          mmTop = 1588
          mmWidth = 69586
          BandType = 3
          GroupNo = 2
        end
      end
      object ppGroupFooterBand2: TppGroupFooterBand
        mmBottomOffset = 0
        mmHeight = 0
        mmPrintPosition = 0
      end
    end
  end
end
