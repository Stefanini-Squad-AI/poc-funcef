inherited FrmpRelEnquadramento: TFrmpRelEnquadramento
  Left = 345
  Top = 228
  Caption = 'Relatório de Enquadramento'
  ClientHeight = 268
  ClientWidth = 337
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 337
    Height = 229
    object Label14: TLabel
      Left = 52
      Top = 15
      Width = 141
      Height = 13
      Caption = 'Tabela de Classificação '
    end
    object Label1: TLabel
      Left = 52
      Top = 128
      Width = 120
      Height = 13
      Caption = 'Tipo de Investimento'
    end
    object DbLkcTabClassif: TwwDBLookupCombo
      Left = 52
      Top = 31
      Width = 233
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCTABCLASSINV'#9'40'#9'Tabela de Classificação')
      LookupTable = QryTabClassif
      LookupField = 'CODTABCLASSINV'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
    object GroupBox1: TGroupBox
      Left = 52
      Top = 69
      Width = 233
      Height = 49
      Caption = ' Indique o Mês / Ano '
      TabOrder = 1
      object CbMes: TComboBox
        Left = 12
        Top = 18
        Width = 145
        Height = 21
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
      object SpinMes: TSpinEdit
        Left = 164
        Top = 18
        Width = 57
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 1
        Value = 2000
      end
    end
    object ChBxTipoInvest: TCheckListBox
      Left = 52
      Top = 144
      Width = 233
      Height = 57
      ItemHeight = 13
      Items.Strings = (
        'Renda Variável'
        'Renda Fixa'
        'Imobiliário'
        'Empréstimos')
      TabOrder = 2
    end
    object PnlAguarde: TPanel
      Left = 1
      Top = 209
      Width = 335
      Height = 19
      Align = alBottom
      BevelOuter = bvNone
      BorderStyle = bsSingle
      TabOrder = 3
      Visible = False
    end
  end
  inherited Dock971: TDock97
    Top = 229
    Width = 337
    inherited tb97Fundo: TToolbar97
      Left = 169
      DockPos = 169
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      DockPos = 0
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 11
    Top = 11
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object QryTabClassif: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODTABCLASSINV, DESCTABCLASSINV'
      ''
      'FROM TABCLASSIFINVEST')
    ValidateWithMask = True
    Left = 298
    Top = 40
  end
  object QryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 298
    Top = 9
  end
end
