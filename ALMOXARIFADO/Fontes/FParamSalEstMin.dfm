inherited FrmParamSalEstMin: TFrmParamSalEstMin
  Left = 201
  Top = 178
  Caption = 'Saldo acima do Estoque Máximo'
  ClientHeight = 240
  ClientWidth = 380
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 380
    Height = 201
    object Label3: TLabel
      Left = 24
      Top = 21
      Width = 73
      Height = 13
      Caption = 'Almoxarifado'
    end
    object Label5: TLabel
      Left = 24
      Top = 71
      Width = 201
      Height = 13
      Caption = 'Grupo de Produtos (caso desejado)'
    end
    object dblcAlmox: TwwDBLookupCombo
      Left = 24
      Top = 36
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
      Left = 24
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
    object RgOrdem: TRadioGroup
      Left = 24
      Top = 120
      Width = 331
      Height = 57
      Caption = ' Ordem '
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'Alfabética'
        'Código'
        'Valor')
      TabOrder = 2
    end
  end
  inherited Dock971: TDock97
    Top = 201
    Width = 380
    inherited tb97Fundo: TToolbar97
      Left = 182
      DockPos = 182
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 14
      DockPos = 14
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 763
    Top = 11
  end
  object qryGrpProd: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DESCGRUPOPROD, CODGRUPOPROD'
      'FROM GRUPPROD'
      'WHERE STATUSGRUPO = '#39'A'#39
      'ORDER BY DESCGRUPOPROD')
    ValidateWithMask = True
    Left = 17
    Top = 200
  end
  object qryAlmox: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '           CodAlmoxarifado,'
      '           DescAlmox '
      'FROM '
      '          ALMOX '
      'WHERE '
      '         (IDPESSOA = :pIDPESS)'
      'ORDER BY 2')
    Params.Data = {01000100077049445045535300030400000000000100}
    ValidateWithMask = True
    Left = 57
    Top = 200
  end
end
sDropDownList
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
  end
  inherited Dock971: TDock97
    Top = 271
    Width = 380
    inherited tb97Fundo: TToolbar97
      Left = 200
      DockPos = 200
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 32
      DockPos = 32
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 787
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  
