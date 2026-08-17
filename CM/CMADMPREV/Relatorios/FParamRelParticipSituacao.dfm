inherited FrmParamRelParticipSituacao: TFrmParamRelParticipSituacao
  Left = 407
  Top = 171
  Caption = 'Participantes por Situação'
  ClientHeight = 336
  ClientWidth = 369
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 369
    Height = 297
    object rgrpDataBase: TRadioGroup
      Left = 21
      Top = 6
      Width = 311
      Height = 79
      Caption = ' Data Base '
      ItemIndex = 0
      Items.Strings = (
        'Posição Atual'
        'Posição em')
      TabOrder = 2
    end
    object GroupBox3: TGroupBox
      Left = 21
      Top = 92
      Width = 311
      Height = 57
      Caption = ' Patrocinadora ( opcional )'
      TabOrder = 0
      object dblookupPatrocinadora: TwwDBLookupCombo
        Left = 14
        Top = 24
        Width = 280
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'NOME'#9'F')
        LookupTable = qryPatro
        LookupField = 'IDPESSOA'
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = True
        OnChange = dblookupPatrocinadoraChange
      end
    end
    object GroupBox2: TGroupBox
      Left = 21
      Top = 151
      Width = 311
      Height = 57
      Caption = ' Plano ( opcional )'
      TabOrder = 1
      object dblookupPlano: TwwDBLookupCombo
        Left = 13
        Top = 24
        Width = 281
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'50'#9'NOME'#9'F')
        LookupTable = qryPlano
        LookupField = 'IDPLANOPREV'
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = True
      end
    end
    object cboxMes: TComboBox
      Left = 125
      Top = 59
      Width = 128
      Height = 21
      ItemHeight = 13
      TabOrder = 3
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
    object seAno: TSpinEdit
      Left = 255
      Top = 58
      Width = 67
      Height = 22
      MaxValue = 3000
      MinValue = 1900
      TabOrder = 4
      Value = 2003
    end
    object GroupBox1: TGroupBox
      Left = 21
      Top = 211
      Width = 311
      Height = 57
      Caption = ' Situação na Fundação da Categoria ( opcional ) '
      TabOrder = 5
      object cmbSitPart: TComboBox
        Left = 13
        Top = 24
        Width = 281
        Height = 21
        ItemHeight = 13
        TabOrder = 0
        Items.Strings = (
          '< Todas >'
          'Ativo'
          'Mantido'
          'Mantido Parcial'
          'Assistido'
          'Manutenção de Saldo de Conta'
          'Cancelado'
          'Ativo Especial'
          'Pendente')
      end
    end
  end
  inherited Dock971: TDock97
    Top = 297
    Width = 369
    inherited tb97Fundo: TToolbar97
      Left = 197
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 28
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 155
    Top = 283
  end
  object dsPatro: TwwDataSource
    Left = 291
    Top = 65533
  end
  object qryPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'#9'P.IDPESSOA, P.NOME'
      'FROM'#9'PESSOA P,'
      #9'   PATRO PT'
      'WHERE'#9'(PT.IDPESSOA'#9'= P.IDPESSOA)'
      'AND   (PT.IDFUNDACAO = :IDFUNDACAO)'
      'ORDER'#9'BY P.NOME'
      ' ')
    ValidateWithMask = True
    Left = 335
    Top = 65533
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object dsPlano: TwwDataSource
    Left = 291
    Top = 41
  end
  object qryPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'#9'PPREVPATRO.IDPLANOPREV,'
      #9'PPREVPATRO.IDPESSJUR,'
      #9'PPREV.NOME'
      #9
      'FROM'#9'PLANPREV'#9'PPREV,'
      #9'PLANPREVPATRO'#9'PPREVPATRO'
      ''
      'WHERE'#9'(PPREV.IDPLANOPREV'#9'= PPREVPATRO.IDPLANOPREV)'
      'AND     (PPREVPATRO.IDPESSJUR = :IDPESSJUR)'
      ''
      'ORDER'#9'BY PPREV.NOME'
      ' '
      ''
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 332
    Top = 41
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end>
  end
end
