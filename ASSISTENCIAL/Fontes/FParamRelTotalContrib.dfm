inherited frmParamRelTotalContrib: TfrmParamRelTotalContrib
  Left = 216
  Top = 161
  Caption = 'Demonstrativo do Total de Contribuições'
  ClientHeight = 151
  ClientWidth = 340
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  object Label2: TLabel [0]
    Left = 18
    Top = 133
    Width = 45
    Height = 13
    Caption = 'Produto'
  end
  inherited pnlFundo: TPanel
    Width = 340
    Height = 112
    object GroupBox1: TGroupBox
      Left = 85
      Top = 31
      Width = 169
      Height = 49
      Caption = 'Mês de Referência'
      TabOrder = 0
      object dbsAno: TwwDBSpinEdit
        Left = 108
        Top = 18
        Width = 50
        Height = 21
        Increment = 1
        Value = 2001
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        UnboundDataType = wwDefault
      end
      object cbmes: TComboBox
        Left = 9
        Top = 18
        Width = 94
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 13
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
        ParentFont = False
        TabOrder = 0
      end
    end
  end
  inherited Dock971: TDock97
    Top = 112
    Width = 340
    inherited tb97Fundo: TToolbar97
      Left = 168
      DockPos = 168
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      DockPos = 0
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 300
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qrymes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '               H.MES AS MESREFERENCIA'
      'FROM'
      '              HSTCONTRIBASS  H'
      'ORDER BY'
      '              H.MES')
    ValidateWithMask = True
    Left = 45
    Top = 42
  end
end
 
