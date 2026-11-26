inherited FrmPRelHistBen: TFrmPRelHistBen
  Left = 58
  Top = 167
  HelpContext = 180079
  Caption = 'Parametros para o Relatorio de Beneficios Pagos'
  ClientHeight = 259
  ClientWidth = 700
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 700
    Height = 220
    object Panel1: TPanel
      Left = 10
      Top = 168
      Width = 330
      Height = 39
      BevelInner = bvLowered
      TabOrder = 0
      object Label2: TLabel
        Left = 6
        Top = 13
        Width = 61
        Height = 13
        Caption = 'Mês e Ano'
      end
      object cmbMes: TComboBox
        Left = 76
        Top = 8
        Width = 151
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        TabOrder = 0
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
      object spenedAno: TSpinEdit
        Left = 233
        Top = 7
        Width = 50
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxValue = 0
        MinValue = 0
        ParentFont = False
        TabOrder = 1
        Value = 1999
      end
    end
    object Panel2: TPanel
      Left = 349
      Top = 164
      Width = 343
      Height = 49
      BevelOuter = bvNone
      Enabled = False
      TabOrder = 1
      object grpTipoRelat: TRadioGroup
        Left = 10
        Top = 3
        Width = 330
        Height = 39
        Caption = ' Tipo do Relatorio '
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Sintetico'
          'Analitico')
        TabOrder = 0
      end
    end
    object GroupBox2: TGroupBox
      Left = 9
      Top = 5
      Width = 680
      Height = 158
      Caption = 'Selecione o(s) Beneficio(s) :'
      TabOrder = 2
      object chklstBenef: TCheckListBox
        Left = 2
        Top = 15
        Width = 676
        Height = 141
        Hint = 'Benefícios disponiveis para o Preparo'
        Align = alClient
        Columns = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
    end
  end
  inherited Dock971: TDock97
    Top = 220
    Width = 700
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 43
    Top = 235
  end
  object qryBenef: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT'
      '             NOME'
      'FROM'
      '     BENEFICIO'
      'ORDER BY NOME'
      ''
      ' ')
    ValidateWithMask = True
    Left = 566
    Top = 49
  end
  object qrybenefplano: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT'
      '       IDRUBRICA'
      'FROM'
      '     BENEFPLANPREV'
      'WHERE'
      '        IDBENEFICIO = :BENEFICIO'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 638
    Top = 49
    ParamData = <
      item
        DataType = ftInteger
        Name = 'BENEFICIO'
        ParamType = ptUnknown
      end>
  end
  object qryAux: TwwQuery
    DatabaseName = 'Basedados'
    SQL.Strings = (
      'SELECT'
      '              IDBENEFICIO'
      'FROM'
      '             BENEFICIO'
      'WHERE'
      '             NOME = :NOMEBENEF')
    ValidateWithMask = True
    Left = 502
    Top = 49
    ParamData = <
      item
        DataType = ftString
        Name = 'NOMEBENEF'
        ParamType = ptUnknown
      end>
  end
end
