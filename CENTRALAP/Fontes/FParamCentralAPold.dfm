inherited frmParamCentralAP: TfrmParamCentralAP
  Left = 211
  Top = 158
  Caption = 'Tela de Parâmetros'
  ClientHeight = 239
  ClientWidth = 417
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 417
    Height = 200
    object Label1: TLabel
      Left = 34
      Top = 26
      Width = 171
      Height = 13
      Caption = 'Forma de Atendimento Padrão'
    end
    object wwDBLookupCombo1: TwwDBLookupCombo
      Left = 32
      Top = 40
      Width = 345
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'60'#9'Descrição'#9'F')
      LookupTable = qryFormaAtend
      LookupField = 'IDTIPOATEND'
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
  end
  inherited Dock971: TDock97
    Top = 200
    Width = 417
    inherited tb97Fundo: TToolbar97
      Left = 247
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 80
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 331
    Top = 163
  end
  object dsParam: TwwDataSource
    DataSet = qryParam
    Left = 368
    Top = 96
  end
  object qryFormaAtend: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDTIPOATEND, NOME, FLGEMITERUBS'
      'FROM TIPOATEND'
      'ORDER BY NOME'
      ' ')
    ValidateWithMask = True
    Left = 232
    Top = 96
  end
  object qryParam: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDCARTAPADRAO, IDETIQPADRAO, IDPESSOA,'
      '               IDTIPOATENDPADRAO'
      'FROM PARAMCENTRALAP'
      ' ')
    ValidateWithMask = True
    Left = 320
    Top = 96
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDTIPOATEND, NOME, FLGEMITERUBS'
      'FROM TIPOATEND'
      'ORDER BY NOME'
      ' ')
    ValidateWithMask = True
    Left = 280
    Top = 96
  end
end
