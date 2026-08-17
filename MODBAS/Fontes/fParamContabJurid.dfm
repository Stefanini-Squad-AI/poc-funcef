inherited frmParamContabJurid: TfrmParamContabJurid
  Left = 235
  Top = 151
  Caption = 'Contabilização do Sistema Jurídico'
  ClientHeight = 334
  ClientWidth = 479
  Font.Style = []
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 479
    Height = 295
    BorderWidth = 2
    object gbxTipoPag: TGroupBox
      Left = 11
      Top = 8
      Width = 457
      Height = 49
      Caption = 'Tipo de Operação'
      TabOrder = 0
      object dblcTipOper: TwwDBLookupCombo
        Left = 9
        Top = 16
        Width = 432
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'TIPDESCRICAO'#9'25'#9'Descrição')
        LookupTable = qryTipoOper
        LookupField = 'TIPCODIGO'
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
        AllowClearKey = True
      end
    end
    object gbxMesAnoRef: TGroupBox
      Left = 11
      Top = 57
      Width = 250
      Height = 51
      Caption = 'Mês e Ano de Referência'
      TabOrder = 1
      object cmbMes: TComboBox
        Left = 8
        Top = 19
        Width = 145
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
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
      object speAno: TSpinEdit
        Left = 158
        Top = 19
        Width = 79
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 1
        Value = 0
      end
    end
    object gbxMotivo: TGroupBox
      Left = 11
      Top = 120
      Width = 457
      Height = 161
      Caption = 'Matéria(s) a Considerar'
      TabOrder = 2
      object cbx1: TCheckBox
        Left = 148
        Top = 37
        Width = 76
        Height = 12
        Caption = 'Trabalhista'
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object cbx2: TCheckBox
        Left = 148
        Top = 53
        Width = 91
        Height = 12
        Caption = 'Previdenciária'
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
      object cbx3: TCheckBox
        Left = 148
        Top = 69
        Width = 160
        Height = 12
        Caption = 'Previdenciária e Trabalhista'
        Checked = True
        State = cbChecked
        TabOrder = 2
      end
      object cbx4: TCheckBox
        Left = 148
        Top = 86
        Width = 91
        Height = 12
        Caption = 'Civil'
        Checked = True
        State = cbChecked
        TabOrder = 3
      end
      object cbx5: TCheckBox
        Left = 148
        Top = 103
        Width = 100
        Height = 12
        Caption = 'Comercial'
        Checked = True
        State = cbChecked
        TabOrder = 4
      end
      object cbx6: TCheckBox
        Left = 148
        Top = 120
        Width = 91
        Height = 12
        Caption = 'Tributária'
        Checked = True
        State = cbChecked
        TabOrder = 5
      end
      object cbx7: TCheckBox
        Left = 148
        Top = 137
        Width = 88
        Height = 12
        Caption = 'Penal'
        Checked = True
        State = cbChecked
        TabOrder = 6
      end
      object cbx0: TCheckBox
        Left = 149
        Top = 20
        Width = 116
        Height = 12
        Caption = 'Não Específica'
        Checked = True
        State = cbChecked
        TabOrder = 7
      end
    end
    object rgConsolida: TRadioGroup
      Left = 264
      Top = 57
      Width = 203
      Height = 51
      Caption = 'Consolida Rubricas da Mesma Conta ?'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Sim'
        'Não')
      TabOrder = 3
    end
  end
  inherited Dock971: TDock97
    Top = 295
    Width = 479
    inherited tb97Fundo: TToolbar97
      Left = 310
      DockPos = 317
      inherited sep1: TToolbarSep97
        SizeHorz = 2
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 144
      DockPos = 150
      inherited ToolbarSep971: TToolbarSep97
        SizeHorz = 2
      end
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 82
      end
    end
  end
  object pnlProgresso: TPanel [2]
    Left = 47
    Top = 122
    Width = 385
    Height = 91
    BevelWidth = 2
    Caption = 'Progresso'
    TabOrder = 2
    Visible = False
    object gagProgresso: TGauge
      Left = 35
      Top = 58
      Width = 316
      Height = 22
      ForeColor = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Progress = 0
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 9
    Top = 390
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryTipoOper: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  TIPCODIGO,'
      '  TIPDESCRICAO'
      'FROM TIPOPER'
      'ORDER BY UPPER(TIPDESCRICAO)')
    ValidateWithMask = True
    Left = 235
    Top = 78
  end
  object qryContabJurid: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 64
    Top = 224
  end
  object qryAuxContab: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 198
    Top = 229
  end
  object qryAux2: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 407
    Top = 252
  end
  object qryContas: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 335
    Top = 252
  end
end
