inherited frmParamRelResRubRec: TfrmParamRelResRubRec
  Left = 194
  Top = 159
  Caption = 'Parâmetro de Relatório de Rubricas Recebidas'
  ClientHeight = 280
  ClientWidth = 364
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 364
    Height = 241
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
      Width = 337
      Height = 145
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
      Left = 25
      Top = 99
      Width = 320
      Height = 118
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
    Top = 241
    Width = 364
    inherited tb97Fundo: TToolbar97
      Left = 194
      DockPos = 194
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 26
      DockPos = 26
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 251
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
    Left = 152
    Top = 144
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
end
