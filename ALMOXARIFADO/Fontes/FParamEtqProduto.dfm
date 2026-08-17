inherited FrmParamEtqProduto: TFrmParamEtqProduto
  Left = 205
  Top = 154
  Caption = 'Etiqueta dos Produtos'
  ClientHeight = 271
  ClientWidth = 376
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 376
    Height = 232
    object Label4: TLabel
      Left = 24
      Top = 61
      Width = 119
      Height = 13
      Caption = 'Item (caso desejado)'
    end
    object Label5: TLabel
      Left = 24
      Top = 108
      Width = 201
      Height = 13
      Caption = 'Grupo de Produtos (caso desejado)'
    end
    object Label1: TLabel
      Left = 24
      Top = 16
      Width = 73
      Height = 13
      Caption = 'Almoxarifado'
    end
    object dblcItem: TwwDBLookupCombo
      Left = 24
      Top = 76
      Width = 331
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'45'#9'Descrição'
        'CODARTIGO'#9'14'#9'Código')
      LookupTable = qryArtigo
      LookupField = 'CODARTIGO'
      Options = [loTitles]
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object dblcGrpProd: TwwDBLookupCombo
      Left = 24
      Top = 124
      Width = 331
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
    object RgOrdem: TRadioGroup
      Left = 24
      Top = 160
      Width = 329
      Height = 49
      Caption = ' Ordenação '
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Alfabética'
        'Código')
      TabOrder = 3
    end
    object dblcAlmox: TwwDBLookupCombo
      Left = 24
      Top = 32
      Width = 329
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCALMOX'#9'40'#9'Descrição')
      LookupTable = qryAlmox
      LookupField = 'CODALMOXARIFADO'
      Options = [loTitles]
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      UseTFields = False
      AllowClearKey = False
      ShowMatchText = True
    end
  end
  inherited Dock971: TDock97
    Top = 232
    Width = 376
    inherited tb97Fundo: TToolbar97
      Left = 206
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 39
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 795
    Top = 3
  end
  object qryArtigo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        ' SELECT (P.DESCPROD || '#39' '#39' || T.DESCTAMANHO || '#39' '#39' || C.DESCCOR)' +
        ' AS DESCRICAO,'
      '       A.CODARTIGO '
      'FROM    ARTIGO A, TAMANHO T, PRODUTO P, COR C'
      
        'WHERE P.CODPRODUTO = A.CODPRODUTO AND A.CODCOR = C.CODCOR(+) AND' +
        ' '
      'A.CODTAMANHO = T.CODTAMANHO(+) '
      'Order By DESCRICAO')
    ValidateWithMask = True
    Left = 305
    Top = 67
  end
  object qryGrpProd: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DESCGRUPOPROD, CODGRUPOPROD'
      'FROM GRUPPROD'
      'WHERE STATUSGRUPO = '#39'A'#39
      'ORDER BY DESCGRUPOPROD')
    ValidateWithMask = True
    Left = 305
    Top = 112
  end
  object qryAlmox: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODALMOXARIFADO,DESCALMOX'
      'FROM ALMOX'
      'WHERE (IDPESSOA = :IDPESSOA)'
      'ORDER BY DESCALMOX ')
    ValidateWithMask = True
    Left = 306
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
end
