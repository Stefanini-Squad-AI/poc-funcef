inherited FrmParamInventFF: TFrmParamInventFF
  Left = 197
  Top = 126
  Caption = 'Inventário Fisico e Financeiro'
  ClientHeight = 305
  ClientWidth = 373
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 373
    Height = 266
    object Label3: TLabel
      Left = 21
      Top = 15
      Width = 73
      Height = 13
      Caption = 'Almoxarifado'
    end
    object Label5: TLabel
      Left = 21
      Top = 70
      Width = 201
      Height = 13
      Caption = 'Grupo de Produtos (caso desejado)'
    end
    object dblcAlmox: TwwDBLookupCombo
      Left = 21
      Top = 30
      Width = 331
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCALMOX'#9'40'#9'Nome'
        'CODALMOXARIFADO'#9'10'#9'Código')
      LookupTable = qryAlmox
      LookupField = 'CODALMOXARIFADO'
      Options = [loTitles]
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object dblcGrpProd: TwwDBLookupCombo
      Left = 21
      Top = 87
      Width = 331
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCGRUPOPROD'#9'30'#9'Nome'
        'CODGRUPOPROD'#9'10'#9'Código')
      LookupTable = qryGrpProd
      LookupField = 'CODGRUPOPROD'
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object GroupBox1: TGroupBox
      Left = 21
      Top = 114
      Width = 331
      Height = 71
      TabOrder = 2
      object chkimp: TCheckBox
        Left = 14
        Top = 21
        Width = 210
        Height = 18
        Caption = 'Imprimir itens com saldo zero'
        TabOrder = 0
      end
      object chkEstoque: TCheckBox
        Left = 14
        Top = 45
        Width = 210
        Height = 18
        Caption = 'Só imprirmir itens estocáveis'
        TabOrder = 1
      end
    end
    object RgOrdem: TRadioGroup
      Left = 21
      Top = 196
      Width = 331
      Height = 53
      Caption = ' Ordernado por '
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Alfabetica'
        'Código')
      TabOrder = 3
    end
  end
  inherited Dock971: TDock97
    Top = 266
    Width = 373
    inherited tb97Fundo: TToolbar97
      Left = 198
      DockPos = 198
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 30
      DockPos = 30
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 603
    Top = 27
  end
  object qryAlmox: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODALMOXARIFADO, DESCALMOX FROM ALMOX'
      'ORDER BY DESCALMOX')
    ValidateWithMask = True
    Left = 288
    Top = 17
  end
  object qryGrpProd: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '           DESCGRUPOPROD, '
      '           CODGRUPOPROD'
      'FROM '
      '            GRUPPROD'
      'ORDER BY DESCGRUPOPROD')
    ValidateWithMask = True
    Left = 326
    Top = 85
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODALMOXARIFADO, DESCALMOX FROM ALMOX'
      'ORDER BY DESCALMOX')
    ValidateWithMask = True
    Left = 291
    Top = 68
  end
end
