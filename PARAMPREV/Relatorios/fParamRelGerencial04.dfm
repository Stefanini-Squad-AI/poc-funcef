inherited frmParamRelGerencial04: TfrmParamRelGerencial04
  Left = 125
  Top = 84
  Caption = 'Relatório Gerencial de Administração Previdenciária 04'
  ClientHeight = 269
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 230
    object GroupBox1: TGroupBox
      Left = 8
      Top = 6
      Width = 508
      Height = 40
      Caption = ' Patrocinadora '
      TabOrder = 0
      object cmbPatrocinadora: TwwDBLookupCombo
        Left = 11
        Top = 13
        Width = 483
        Height = 21
        Hint = 'Escolha a Patrocinadora a ser processada.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'NOME')
        LookupTable = qryPatrocinadora
        LookupField = 'IDPESSOA'
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
    end
    object GroupBox4: TGroupBox
      Left = 8
      Top = 46
      Width = 508
      Height = 40
      Caption = ' Plano Previdenciário '
      TabOrder = 1
      object cmbPlano: TwwDBLookupCombo
        Left = 11
        Top = 13
        Width = 483
        Height = 21
        Hint = 'Escolha o Plano a ser processado.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'50'#9'NOME')
        LookupTable = qryPlano
        LookupField = 'IDPLANOPREV'
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
    end
    object GroupBox3: TGroupBox
      Left = 8
      Top = 86
      Width = 507
      Height = 40
      Caption = ' Meses de Referência '
      TabOrder = 2
      object cmbMes01: TComboBox
        Left = 13
        Top = 14
        Width = 145
        Height = 21
        Hint = 'Mês a se Processado.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Text = 'Janeiro'
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
      object spnAno01: TSpinEdit
        Left = 220
        Top = 14
        Width = 70
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxValue = 0
        MinValue = 0
        ParentFont = False
        TabOrder = 1
        Value = 2000
      end
      object chkbcTempo: TCheckBox
        Left = 350
        Top = 16
        Width = 147
        Height = 17
        Hint = 
          'Mostra, ao final do relatório, quanto tempo este demorou para se' +
          'r processado.'
        Caption = 'Tempo de Processamento.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
      end
    end
    object GroupBox5: TGroupBox
      Left = 8
      Top = 167
      Width = 507
      Height = 56
      Caption = ' Relatórios '
      TabOrder = 4
      object Memo1: TMemo
        Left = 14
        Top = 14
        Width = 483
        Height = 34
        Color = clBlack
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Lines.Strings = (
          
            '09 - Contribribuição Média Patrocinadora X Participante e Saldo ' +
            'de Reserva de Poup. por Regional;'
          '10 - Movimentação do Cadastro Anual.')
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
    end
    object GroupBox2: TGroupBox
      Left = 8
      Top = 126
      Width = 507
      Height = 40
      Caption = ' Indice para Atualização da Reserva '
      TabOrder = 3
      object cmbxMoeda: TwwDBLookupCombo
        Left = 11
        Top = 13
        Width = 483
        Height = 21
        Hint = 'Escolha o Plano a ser processado.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'MOESIGLA'#9'10'#9'Sigla')
        LookupTable = qryMoeda
        LookupField = 'MOECODIGO'
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 230
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 11
    Top = 235
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryPatrocinadora: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.IDPESSOA, P.NOME'
      'FROM PESSOA P,PATRO PT'
      'WHERE P.IDPESSOA = PT.IDPESSOA'
      'AND   PT.IDFUNDACAO = :IDFUNDACAO'
      'ORDER BY P.NOME'
      ' ')
    ValidateWithMask = True
    Left = 506
    Top = 186
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object qryPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT 1 AS CONSIDERA, IDPLANOPREV, NOME'
      'FROM PLANPREV'
      'WHERE IDPLANOPREV IN (SELECT PLP.IDPLANOPREV'
      '                      FROM PLANPREVPATRO PLP, PATRO PT'
      '                      WHERE PT.IDFUNDACAO = :IDFUNDACAO'
      '                      AND     PLP.IDPESSJUR = PT.IDPESSOA )'
      'ORDER BY NOME'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 371
    Top = 201
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object qryMoeda: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MOECODIGO, MOESIGLA'
      'FROM MOEDA'
      'ORDER BY MOESIGLA')
    ValidateWithMask = True
    Left = 439
    Top = 192
  end
  object qryTmp: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 86
    Top = 221
  end
  object qryDetalhe: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsTmp
    SQL.Strings = (
      
        'SELECT SUM(DECODE(RP.FLGENTRADA, 1, RP.SALDOCOTAS, -RP.SALDOCOTA' +
        'S)) AS VLRCOTA,'
      
        '       (SUM(DECODE(RP.FLGENTRADA, 1, RP.SALDOCOTAS, -RP.SALDOCOT' +
        'AS)) /COT.COTACAO ) AS VLRREAL,'
      '       COT.DATA, COT.COTACAO'
      'FROM   HISTMOVRESERVA RP, ELEGPATRO EP, PESSOA RG,'
      '       (SELECT C.COTVALOR AS COTACAO, C.COTDATA AS DATA'
      '        FROM COTACAOMOEDA C,'
      '             (SELECT MAX(COTDATA) AS DATA'
      '              FROM   COTACAOMOEDA C'
      '              WHERE   C.MOECODIGO = :MOECODIGO) AUX'
      '        WHERE (C.MOECODIGO = :MOECODIGO)'
      '        AND   (C.COTDATA   = AUX.DATA) ) COT'
      'WHERE  RP.IDPESSJUR        = :IDPESSJUR'
      'AND    RP.IDPLANOPREV      = :IDPLANOPREV'
      'AND    RP.MESREFERENCIA    = :MESREFERENCIA'
      'AND    RG.IDPESSOA         = :IDESTAB'
      'AND    EP.IDPESSJUR        = RP.IDPESSJUR'
      'AND    EP.IDPESSOA         = RP.IDPESSOA'
      'AND    RG.IDPESSOA         = EP.IDESTAB(+)'
      'GROUP BY COT.DATA, COT.COTACAO')
    ValidateWithMask = True
    Left = 123
    Top = 225
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'MOECODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'MOECODIGO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MESREFERENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDESTAB'
        ParamType = ptUnknown
      end>
  end
  object dsTmp: TwwDataSource
    DataSet = qryTmp
    Left = 55
    Top = 220
  end
end
