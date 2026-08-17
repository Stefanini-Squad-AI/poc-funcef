inherited frmParamRelResEnvio: TfrmParamRelResEnvio
  Left = 138
  Top = 36
  Caption = 'Parâmetro de Relatório do Resumo de Envio'
  ClientHeight = 456
  ClientWidth = 451
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 451
    Height = 417
    object grpMesRef: TGroupBox
      Left = 17
      Top = 17
      Width = 171
      Height = 60
      Caption = 'Mês e Ano de Cobrança '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object cbMes: TComboBox
        Left = 7
        Top = 27
        Width = 100
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        TabOrder = 0
        Text = 'cbMes'
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
      object dbseAno: TSpinEdit
        Left = 114
        Top = 27
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
        Value = 0
      end
    end
    object GroupBox1: TGroupBox
      Left = 16
      Top = 80
      Width = 417
      Height = 153
      Caption = 'Patrocinadora'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object chklstPatro: TCheckListBox
      Left = 22
      Top = 99
      Width = 403
      Height = 126
      Columns = 2
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 2
    end
  end
  inherited Dock971: TDock97
    Top = 417
    Width = 451
    inherited tb97Fundo: TToolbar97
      Left = 277
      DockPos = 277
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 109
      DockPos = 109
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  object GroupBox2: TGroupBox [2]
    Left = 16
    Top = 244
    Width = 417
    Height = 157
    Caption = 'Plano'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
  end
  object chklstPlano: TCheckListBox [3]
    Left = 22
    Top = 260
    Width = 403
    Height = 133
    Columns = 2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ItemHeight = 13
    ParentFont = False
    TabOrder = 3
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 67
    Top = 443
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPESSOA, NOME'
      'FROM PESSOA'
      
        'WHERE IDPESSOA IN (SELECT IDPESSOA FROM PATRO WHERE IDFUNDACAO =' +
        ' :IDFUNDACAO)'
      'ORDER BY NOME'
      ' ')
    ValidateWithMask = True
    Left = 200
    Top = 144
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
      'SELECT IDPLANOPREV, NOME'
      'FROM PLANPREV'
      'WHERE IDPLANOPREV IN (SELECT PLP.IDPLANOPREV '
      '                      FROM   PLANPREVPATRO PLP, PATRO PT'
      '                      WHERE  PT.IDFUNDACAO = :IDFUNDACAO'
      '                      AND    PLP.IDPESSJUR = PT.IDPESSOA )'
      'ORDER BY NOME'
      ' ')
    ValidateWithMask = True
    Left = 200
    Top = 288
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
end
