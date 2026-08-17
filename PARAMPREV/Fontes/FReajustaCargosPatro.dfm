inherited frmReajustaCargosPatro: TfrmReajustaCargosPatro
  Left = 281
  Top = 107
  HelpContext = 160150
  Caption = 'Reajuste de Cargos e Funções'
  ClientHeight = 443
  ClientWidth = 612
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 612
    Height = 404
    object Label2: TLabel
      Left = 15
      Top = 57
      Width = 5
      Height = 13
    end
    object lblProgresso: TLabel
      Left = 24
      Top = 364
      Width = 138
      Height = 13
      Caption = 'Reajustando o Código : '
    end
    object lblTotalFeito: TLabel
      Left = 24
      Top = 346
      Width = 253
      Height = 13
      Caption = 'Total de Cargos / Funções Reajustadas : 00'
    end
    object GroupBox1: TGroupBox
      Left = 18
      Top = 12
      Width = 577
      Height = 49
      Caption = ' Selecione a Patrocinadora '
      TabOrder = 0
      object dblkpcmbPatroPlano: TwwDBLookupCombo
        Left = 12
        Top = 18
        Width = 391
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'PATROCINADORA'#9'60'#9'PATROCINADORA'#9'F')
        LookupTable = qryPatro
        LookupField = 'IDPESSJUR'
        Options = [loTitles]
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        OnCloseUp = dblkpcmbPatroPlanoCloseUp
      end
    end
    object GroupBox2: TGroupBox
      Left = 18
      Top = 74
      Width = 577
      Height = 49
      Caption = ' Selecione o Mês de Reajuste '
      TabOrder = 1
      object Label1: TLabel
        Left = 485
        Top = 20
        Width = 10
        Height = 13
        Caption = '%'
      end
      object dblkpcmbMesReajuste: TwwDBLookupCombo
        Left = 12
        Top = 18
        Width = 109
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'MESREAJ'#9'7'#9'Ano/Mês de Reajuste'#9'F'
          'PERCENTUAL'#9'10'#9'Percentual'#9'F'
          'IDRGREAJ'#9'10'#9'Regra'#9'F')
        LookupTable = qryReajuste
        LookupField = 'MESREAJ'
        Options = [loTitles]
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        OnCloseUp = dblkpcmbMesReajusteCloseUp
      end
      object dbedReajuste: TDBEdit
        Left = 126
        Top = 18
        Width = 274
        Height = 21
        Color = clInactiveBorder
        DataField = 'DESCREAJUSTE'
        DataSource = dsReajuste
        TabOrder = 1
      end
      object DBEdit2: TDBEdit
        Left = 406
        Top = 18
        Width = 75
        Height = 21
        Color = clInactiveBorder
        DataField = 'PERCENTUAL'
        DataSource = dsReajuste
        TabOrder = 2
      end
    end
    object GroupBox3: TGroupBox
      Left = 18
      Top = 185
      Width = 288
      Height = 49
      Caption = ' Informe a Data Base para o Reajuste'
      TabOrder = 3
      object dtBase: TCMDateTimePicker
        Left = 12
        Top = 18
        Width = 121
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
    end
    object rgrpOpcaoArred: TRadioGroup
      Left = 18
      Top = 242
      Width = 577
      Height = 99
      Caption = ' Opções de Arredondamento '
      ItemIndex = 0
      Items.Strings = (
        'Utilizar EXATAMENTE o valor calculado'
        
          'TRUNCAR o valor calculado sem decimais ( apenas parte inteiro. E' +
          'x. 123,04 -> 123,00 )'
        'ARREDONDAR o valor calculado em 2 decimais'
        
          'ARREDONDAR o valor calculado sem decimais ( próximo número intei' +
          'ro. Ex. 123,04 -> 124,00 )')
      TabOrder = 4
    end
    object GroupBox4: TGroupBox
      Left = 18
      Top = 129
      Width = 577
      Height = 49
      Caption = ' Selecione a Regra de Reajuste (opcional)'
      TabOrder = 2
      object dblkpcmbRegra: TwwDBLookupCombo
        Left = 12
        Top = 18
        Width = 109
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'IDREGRA'#9'10'#9'Código'#9'F'
          'NOMEREGRA'#9'60'#9'Regra'#9'F')
        LookupTable = qryRegra
        LookupField = 'IDREGRA'
        Options = [loTitles]
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
      object dbedNomeRegra: TDBEdit
        Left = 126
        Top = 18
        Width = 355
        Height = 21
        Color = clInactiveBorder
        DataField = 'NOMEREGRA'
        DataSource = dsRegra
        TabOrder = 1
      end
    end
    object rgrpTipoReajuste: TRadioGroup
      Left = 315
      Top = 184
      Width = 280
      Height = 49
      Caption = ' Reajustar ... '
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Cargos E Funções'
        'Apenas Cargos'
        'Apenas Funções')
      TabOrder = 5
    end
  end
  inherited Dock971: TDock97
    Top = 404
    Width = 612
    inherited tb97Fundo: TToolbar97
      Left = 377
      DockPos = 377
      inherited sep1: TToolbarSep97
        Left = 183
      end
      inherited sep3: TToolbarSep97
        Left = 90
      end
      inherited bbtnSair: TBitBtn
        Width = 90
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 93
        Width = 90
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited ToolbarSep971: TToolbarSep97
        Left = 90
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 90
        Caption = '&Processar'
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 93
        Width = 90
        Caption = '&Desfazer'
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 61
    Top = 421
  end
  object qryPatro: TwwQuery
    AfterScroll = qryPatroAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PT.IDPESSOA AS IDPESSJUR, P.NOME AS PATROCINADORA'
      'FROM   PESSOA P, PATRO PT'
      'WHERE  PT.IDFUNDACAO = :IDFUNDACAO'
      'AND    P.IDPESSOA    = PT.IDPESSOA'
      'ORDER BY P.NOME'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 4
    Top = 394
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object qryReajuste: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT MESREAJ, IDRGREAJ, PERCENTUAL,'
      
        '       DECODE(PERCENTUAL, NULL, '#39'Reajustar pela Regra '#39'||TO_CHAR' +
        '(IDRGREAJ),'
      
        '                             0, '#39'Reajustar pela Regra '#39'||TO_CHAR' +
        '(IDRGREAJ),'
      
        '                                '#39'Reajustar aplicando o percentua' +
        'l de '#39'||TO_CHAR(PERCENTUAL)) AS DESCREAJUSTE'
      'FROM   REAJSALPATRO'
      'WHERE  IDPESSJUR = :IDPESSJUR'
      'AND    FLGTPREAJUSTE = 1'
      'ORDER BY MESREAJ DESC'
      '')
    ValidateWithMask = True
    Left = 82
    Top = 408
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end>
  end
  object dsPatroPlano: TwwDataSource
    AutoEdit = False
    DataSet = qryPatro
    Left = 9
    Top = 414
  end
  object dsReajuste: TwwDataSource
    AutoEdit = False
    DataSet = qryReajuste
    Left = 65532
    Top = 412
  end
  object qry: TwwQuery
    AfterScroll = qryPatroAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT PLP.IDPESSJUR, PLP.IDPLANOPREV, P.NOME AS PATROCINADORA, ' +
        'PL.NOME AS PLANO'
      'FROM   PESSOA P, PLANPREVPATRO PLP, PLANPREV PL, PATRO PT'
      'WHERE  PT.IDFUNDACAO = :IDFUNDACAO'
      'AND    PLP.IDPESSJUR = PT.IDPESSOA'
      'AND    P.IDPESSOA    = PLP.IDPESSJUR'
      'AND    PL.IDPLANOPREV = PLP.IDPLANOPREV'
      'ORDER BY P.NOME, PL.NOME')
    ValidateWithMask = True
    Left = 35
    Top = 406
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object qryIns: TwwQuery
    AfterScroll = qryPatroAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT PLP.IDPESSJUR, PLP.IDPLANOPREV, P.NOME AS PATROCINADORA, ' +
        'PL.NOME AS PLANO'
      'FROM   PESSOA P, PLANPREVPATRO PLP, PLANPREV PL, PATRO PT'
      'WHERE  PT.IDFUNDACAO = :IDFUNDACAO'
      'AND    PLP.IDPESSJUR = PT.IDPESSOA'
      'AND    P.IDPESSOA    = PLP.IDPESSJUR'
      'AND    PL.IDPLANOPREV = PLP.IDPLANOPREV'
      'ORDER BY P.NOME, PL.NOME')
    ValidateWithMask = True
    Left = 42
    Top = 403
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object qryRegra: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDREGRA, NOMEREGRA'
      'FROM REGRA'
      'ORDER BY IDREGRA')
    ValidateWithMask = True
    Left = 62
    Top = 403
  end
  object dsRegra: TwwDataSource
    AutoEdit = False
    DataSet = qryRegra
    Left = 61
    Top = 422
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT MESREAJ, IDRGREAJ, PERCENTUAL,'
      
        '       DECODE(PERCENTUAL, NULL, '#39'Reajustar pela Regra '#39'||TO_CHAR' +
        '(IDRGREAJ),'
      
        '                             0, '#39'Reajustar pela Regra '#39'||TO_CHAR' +
        '(IDRGREAJ),'
      
        '                                '#39'Reajustar aplicando o percentua' +
        'l de '#39'||TO_CHAR(PERCENTUAL)) AS DESCREAJUSTE'
      'FROM   REAJSALPATRO'
      'WHERE  IDPESSJUR = :IDPESSJUR'
      'AND    FLGTPREAJUSTE = 1'
      'ORDER BY MESREAJ DESC'
      '')
    ValidateWithMask = True
    Left = 67
    Top = 368
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end>
  end
end
