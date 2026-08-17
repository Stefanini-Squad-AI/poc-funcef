inherited FrmRelRubSalariais: TFrmRelRubSalariais
  Left = 353
  Top = 291
  HelpContext = 180074
  Caption = 'Relatório de Rubricas Salariais'
  ClientHeight = 169
  ClientWidth = 421
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 421
    Height = 130
    object grbGrupo: TGroupBox
      Left = 1
      Top = 1
      Width = 419
      Height = 45
      Align = alTop
      Caption = 'Escolha o Grupo de Rubricas Salariais'
      TabOrder = 0
      object dblkGrupoRubrica: TwwDBLookupCombo
        Left = 8
        Top = 17
        Width = 393
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'30'#9'Grupo de Rubrica'#9'F')
        LookupTable = qryGrupoRubrica
        LookupField = 'IDGRUPORUBRICA'
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
    end
    object rdoTipoRub: TRadioGroup
      Left = 1
      Top = 46
      Width = 419
      Height = 39
      Align = alTop
      Caption = 'Tipo da Rubrica'
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'Provento'
        'Desconto'
        'Outros')
      TabOrder = 1
    end
    object grbCompoeIRRF: TGroupBox
      Left = 1
      Top = 85
      Width = 208
      Height = 44
      Align = alLeft
      TabOrder = 2
      object chkCompoeIR: TCheckBox
        Left = 10
        Top = 13
        Width = 183
        Height = 17
        Caption = 'Compõe Imposto de Renda'
        TabOrder = 0
      end
    end
    object grbCompoePensAlim: TGroupBox
      Left = 219
      Top = 85
      Width = 201
      Height = 44
      Align = alRight
      TabOrder = 3
      object chkCompoePensAlim: TCheckBox
        Left = 10
        Top = 13
        Width = 187
        Height = 17
        Caption = 'Compõe Pensão Alimentícia'
        TabOrder = 0
      end
    end
  end
  inherited Dock971: TDock97
    Top = 130
    Width = 421
    inherited tb97Fundo: TToolbar97
      Left = 249
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 80
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 35
    Top = 131
  end
  object qryGrupoRubrica: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDGRUPORUBRICA,'
      '  DESCRICAO'
      ''
      'FROM'
      '  GRUPORUBRICA')
    ValidateWithMask = True
    Left = 280
    Top = 8
  end
end
