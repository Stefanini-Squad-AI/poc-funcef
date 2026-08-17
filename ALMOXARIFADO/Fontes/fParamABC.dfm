inherited frmParamABC: TfrmParamABC
  Left = 218
  Top = 149
  Caption = 'Curva ABC do Estoque'
  ClientHeight = 284
  ClientWidth = 375
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 375
    Height = 245
    object Label4: TLabel
      Left = 24
      Top = 16
      Width = 73
      Height = 13
      Caption = 'Almoxarifado'
    end
    object Label5: TLabel
      Left = 24
      Top = 184
      Width = 201
      Height = 13
      Caption = 'Grupo de Produtos (caso desejado)'
    end
    object dblcAlmox: TwwDBLookupCombo
      Left = 24
      Top = 32
      Width = 329
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCALMOX'#9'40'#9'Nome'
        'CODALMOXARIFADO'#9'10'#9'Código')
      LookupTable = qryAlmox
      LookupField = 'CODALMOXARIFADO'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object Grp: TGroupBox
      Left = 24
      Top = 64
      Width = 329
      Height = 111
      TabOrder = 1
      TabStop = True
      object Label1: TLabel
        Left = 10
        Top = 19
        Width = 103
        Height = 13
        Caption = 'Percentual para A'
      end
      object Label2: TLabel
        Left = 10
        Top = 53
        Width = 103
        Height = 13
        Caption = 'Percentual para B'
      end
      object Label3: TLabel
        Left = 10
        Top = 85
        Width = 103
        Height = 13
        Caption = 'Percentual para C'
      end
      object dbedPercA: TRealEdit
        Left = 122
        Top = 16
        Width = 57
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 0
        WordWrap = False
        IntDigits = 2
        DecDigits = 1
        NumberFormat = fNumber
        Signal = False
      end
      object dbedPercB: TRealEdit
        Left = 122
        Top = 48
        Width = 57
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 1
        WordWrap = False
        IntDigits = 2
        DecDigits = 1
        NumberFormat = fNumber
        Signal = False
      end
      object dbedPercC: TRealEdit
        Left = 122
        Top = 80
        Width = 57
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 2
        WordWrap = False
        IntDigits = 2
        DecDigits = 1
        NumberFormat = fNumber
        Signal = False
      end
      object rgImprimir: TRadioGroup
        Left = 192
        Top = 11
        Width = 121
        Height = 90
        Caption = ' Imprimir '
        ItemIndex = 0
        Items.Strings = (
          '&Todos'
          'Somente &A'
          'A e &B'
          'A, B e &C')
        TabOrder = 3
      end
    end
    object dblcGrpProd: TwwDBLookupCombo
      Left = 24
      Top = 200
      Width = 329
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCGRUPOPROD'#9'30'#9'Nome'
        'CODGRUPOPROD'#9'10'#9'Código')
      LookupTable = qryGrpProd
      LookupField = 'CODGRUPOPROD'
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
  end
  inherited Dock971: TDock97
    Top = 245
    Width = 375
    inherited tb97Fundo: TToolbar97
      Left = 168
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
  inherited ivTradutor: TIvExtendedTranslator
    Left = 747
  end
  object qryGrpProd: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DESCGRUPOPROD, CODGRUPOPROD'
      'FROM GRUPPROD'
      ''
      'ORDER BY DESCGRUPOPROD')
    ValidateWithMask = True
    Left = 81
    Top = 8
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
    ValidateWithMask = True
    Left = 169
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDPESS'
        ParamType = ptUnknown
      end>
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 248
    Top = 8
  end
end
