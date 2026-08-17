inherited FrmParamPlanProd: TFrmParamPlanProd
  Left = 193
  Top = 136
  Caption = 'Planilha de Produtos'
  ClientHeight = 325
  ClientWidth = 373
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 373
    Height = 286
    object pln: TPanel
      Left = 24
      Top = 24
      Width = 321
      Height = 113
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object Label5: TLabel
        Left = 14
        Top = 57
        Width = 201
        Height = 13
        Caption = 'Grupo de Produtos (caso desejado)'
      end
      object Label3: TLabel
        Left = 14
        Top = 13
        Width = 73
        Height = 13
        Caption = 'Almoxarifado'
      end
      object dblcGrpProd: TwwDBLookupCombo
        Left = 14
        Top = 73
        Width = 291
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
      object dblcAlmox: TwwDBLookupCombo
        Left = 14
        Top = 28
        Width = 291
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
    end
    object RgOedem: TRadioGroup
      Left = 24
      Top = 144
      Width = 321
      Height = 53
      Caption = ' Ordem '
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'Alfabética'
        'Código'
        'Localização')
      TabOrder = 1
    end
    object chkEstoque: TCheckBox
      Left = 22
      Top = 213
      Width = 210
      Height = 18
      Caption = 'Só imprirmir itens estocáveis'
      TabOrder = 2
    end
    object chkSaldoZero: TCheckBox
      Left = 22
      Top = 237
      Width = 323
      Height = 18
      Caption = 'Só imprirmir itens com saldo diferente de zero'
      TabOrder = 3
    end
  end
  inherited Dock971: TDock97
    Top = 286
    Width = 373
    inherited tb97Fundo: TToolbar97
      Left = 201
      DockPos = 201
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 33
      DockPos = 33
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 771
    Top = 11
  end
  object qryGrpProd: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DESCGRUPOPROD, CODGRUPOPROD'
      'FROM GRUPPROD'
      'ORDER BY DESCGRUPOPROD')
    ValidateWithMask = True
    Left = 345
    Top = 8
  end
  object qryAlmox: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODALMOXARIFADO, DESCALMOX FROM ALMOX'
      'WHERE'
      '       (IDPESSOA = :pIDPESS)'
      'ORDER BY DESCALMOX')
    ValidateWithMask = True
    Left = 344
    Top = 68
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDPESS'
        ParamType = ptUnknown
      end>
  end
end
