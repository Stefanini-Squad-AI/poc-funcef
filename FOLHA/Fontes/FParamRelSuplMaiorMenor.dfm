inherited frmParamRelSuplMaiorMenor: TfrmParamRelSuplMaiorMenor
  Left = 152
  Top = 217
  HelpContext = 180110
  Caption = 'Suplementação Maior / Menor'
  ClientHeight = 199
  ClientWidth = 497
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 497
    Height = 160
    object grpMesRef: TGroupBox
      Left = 310
      Top = 6
      Width = 174
      Height = 45
      Caption = 'Mês e Ano'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object cmbMes: TComboBox
        Left = 7
        Top = 15
        Width = 106
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
      object spedAno: TSpinEdit
        Left = 115
        Top = 15
        Width = 52
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
    object GroupBox2: TGroupBox
      Left = 10
      Top = 6
      Width = 297
      Height = 46
      Caption = 'Histórico'
      TabOrder = 0
      object cmbxFolha: TwwDBLookupCombo
        Left = 5
        Top = 16
        Width = 287
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'HISTORICO'#9'50'#9'Histórico'#9'F')
        LookupTable = qryFolha
        LookupField = 'IDHSTFOLHABENEF'
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = True
      end
    end
    object GroupBox3: TGroupBox
      Left = 10
      Top = 104
      Width = 473
      Height = 45
      Caption = 'Ordenação'
      TabOrder = 2
      object cmbxOrdem: TComboBox
        Left = 9
        Top = 16
        Width = 332
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        TabOrder = 0
        Text = 'Valor Suplementação (Crescente)'
        Items.Strings = (
          'Valor Suplementação (Crescente)'
          'Valor Suplementação (Decrescente)'
          'Beneficiário (Crescente)'
          'Beneficiário (Decrescente)'
          'Inscrição (Crescente)'
          'Inscrição (Decrescente)')
      end
    end
    object GroupBox1: TGroupBox
      Left = 46
      Top = 57
      Width = 389
      Height = 43
      Caption = ' Patrocinadora '
      TabOrder = 3
      object dbcmbPatrocinadora: TwwDBLookupCombo
        Left = 10
        Top = 14
        Width = 368
        Height = 21
        AutoSize = False
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'NOME')
        LookupTable = qryPatrocinadora
        LookupField = 'IDPESSOA'
        DropDownCount = 4
        DropDownWidth = 80
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 160
    Width = 497
    inherited tb97Fundo: TToolbar97
      Left = 319
      DockPos = 319
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 150
      DockPos = 150
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 35
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
      'SELECT PE.IDPESSOA, PE.NOME'
      'FROM PESSOA PE, PATRO PA'
      'WHERE  PE.IDPESSOA = PA.IDPESSOA'
      'ORDER BY PE.NOME'
      ' '
      '')
    ValidateWithMask = True
    Left = 266
    Top = 70
  end
  object dsFolha: TwwDataSource
    DataSet = qryFolha
    Left = 10
    Top = 64
  end
  object qryFolha: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDHSTFOLHABENEF,'
      '  IDHSTFOLHABENEF||'#39' - '#39'||HISTORICO AS HISTORICO'
      ''
      'FROM'
      '  HSTFOLHABENEF'
      ''
      'WHERE'
      '  FLGESTADO <> 2'
      ''
      'ORDER BY'
      '  IDHSTFOLHABENEF DESC'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 154
    Top = 16
  end
end
