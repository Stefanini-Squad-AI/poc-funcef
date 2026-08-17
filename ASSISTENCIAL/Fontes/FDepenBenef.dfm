inherited frmDepenBenef: TfrmDepenBenef
  Left = 66
  Top = 157
  BorderIcons = [biSystemMenu]
  Caption = 'Beneficiários / Dependente'
  FormStyle = fsNormal
  Visible = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    object wwDBGrid1: TwwDBGrid
      Left = 5
      Top = 5
      Width = 578
      Height = 224
      Selected.Strings = (
        'NOME'#9'68'#9'Dependente'
        'BENEF'#9'21'#9'É beneficiário ?')
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = dsdepen
      TabOrder = 0
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      IndicatorColor = icBlack
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 459
    Top = 27
  end
  object dsdepen: TwwDataSource
    DataSet = qrydepen
    Left = 256
    Top = 88
  end
  object qrydepen: TwwQuery
    OnCalcFields = qrydepenCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT NOME , IDPESSOA '
      'FROM PESSOA '
      'WHERE IDPESSOA IN'
      '( SELECT IDPESSOA '
      'FROM DEPENTIT'
      'WHERE IDTITULAR = :IDPESSOA ) '
      '')
    Params.Data = {01000100084944504553534F4100030400000000000000}
    ValidateWithMask = True
    Left = 184
    Top = 88
    object qrydepenNOME: TStringField
      DisplayLabel = 'Dependente'
      DisplayWidth = 68
      FieldName = 'NOME'
      Size = 60
    end
    object qrydepenBENEF: TStringField
      DisplayLabel = 'É beneficiário ?'
      DisplayWidth = 21
      FieldName = 'BENEF'
      Calculated = True
    end
  end
  object qryaux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 312
    Top = 64
  end
end
