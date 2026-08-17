inherited frmapurainscritos: Tfrmapurainscritos
  Left = 237
  Top = 106
  Caption = 'Apuração de Inscritos no Plano'
  ClientHeight = 384
  ClientWidth = 336
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 336
    Height = 345
    object PageControl1: TPageControl
      Left = 5
      Top = 187
      Width = 326
      Height = 153
      ActivePage = TabSheet1
      Align = alBottom
      TabOrder = 0
      object TabSheet1: TTabSheet
        Caption = 'Planos'
        object chkplano: TCheckListBox
          Left = 0
          Top = 0
          Width = 318
          Height = 125
          Align = alClient
          ItemHeight = 13
          TabOrder = 0
        end
      end
    end
  end
  object GroupBox12: TGroupBox [1]
    Left = 11
    Top = 16
    Width = 307
    Height = 49
    Caption = 'Intervalo'
    TabOrder = 3
    object radiomensal: TRadioButton
      Left = 48
      Top = 24
      Width = 65
      Height = 17
      Caption = 'Mensal'
      TabOrder = 0
      OnClick = radiomensalClick
    end
    object radioanual: TRadioButton
      Left = 192
      Top = 24
      Width = 65
      Height = 17
      Caption = 'Anual'
      TabOrder = 1
      OnClick = radioanualClick
    end
  end
  inherited Dock971: TDock97
    Top = 345
    Width = 336
    inherited tb97Fundo: TToolbar97
      Left = 167
      DockPos = 168
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      DockPos = 0
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  object GroupBox3: TGroupBox [3]
    Left = 12
    Top = 88
    Width = 309
    Height = 89
    Caption = 'Período'
    TabOrder = 2
    object Label6: TLabel
      Left = 23
      Top = 32
      Width = 34
      Height = 13
      Caption = 'Início'
    end
    object Label7: TLabel
      Left = 24
      Top = 64
      Width = 20
      Height = 13
      Caption = 'Fim'
    end
    object cmbiniciomes: TComboBox
      Left = 77
      Top = 24
      Width = 100
      Height = 21
      ItemHeight = 13
      TabOrder = 0
      Text = 'cmbiniciomes'
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
    object cmbfimmes: TComboBox
      Left = 77
      Top = 56
      Width = 100
      Height = 21
      ItemHeight = 13
      TabOrder = 1
      Text = 'cmbfimmes'
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
    object inicioano: TSpinEdit
      Left = 200
      Top = 24
      Width = 81
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 2
      Value = 0
    end
    object fimano: TSpinEdit
      Left = 200
      Top = 56
      Width = 81
      Height = 22
      MaxValue = 0
      MinValue = 0
      TabOrder = 3
      Value = 0
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 195
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object dsplano: TwwDataSource
    DataSet = qryplano
    Left = 264
  end
  object qryplano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPLANASS,NOME '
      'FROM   PLANASS'
      'ORDER  BY IDPLANASS')
    ValidateWithMask = True
    Left = 232
  end
  object qryfaixas: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dsplano
    SQL.Strings = (
      'SELECT  0  AS IDFAIXAS ,0 AS MESANO , 0  AS  IDPLANASS'
      'FROM     FAIXAS2')
    ValidateWithMask = True
    Left = 235
    Top = 64
  end
end
