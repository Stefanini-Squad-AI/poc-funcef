inherited frmParamRelBenefRetido: TfrmParamRelBenefRetido
  Left = 156
  Top = 281
  HelpContext = 180070
  Caption = 'Benefícios Retidos'
  ClientHeight = 97
  ClientWidth = 437
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 437
    Height = 58
    object GroupBox2: TGroupBox
      Left = 24
      Top = 7
      Width = 389
      Height = 43
      Caption = ' Patrocinadora '
      TabOrder = 0
      object dbcmbPatrocinadora: TwwDBLookupCombo
        Left = 10
        Top = 14
        Width = 368
        Height = 21
        AutoSize = False
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'30'#9'Patrocinadora'#9'F')
        LookupTable = qryPatrocinadora
        LookupField = 'IDPESSOA'
        DropDownCount = 4
        DropDownWidth = 80
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 58
    Width = 437
    inherited tb97Fundo: TToolbar97
      Left = 265
      DockPos = 288
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 96
      DockPos = 119
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 19
    Top = 56
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
      'SELECT'
      '  PE.IDPESSOA,'
      '  PE.NOME'
      ''
      'FROM'
      '  PESSOA PE,'
      '  PATRO PA'
      ''
      'WHERE'
      '  PE.IDPESSOA = PA.IDPESSOA'
      ''
      'ORDER BY'
      '  PE.NOME'
      ' '
      ''
      ' ')
    ValidateWithMask = True
    Left = 88
    Top = 45
  end
end
