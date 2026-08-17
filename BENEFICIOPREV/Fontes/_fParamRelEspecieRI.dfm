inherited frmparamrelEspecieRI: TfrmparamrelEspecieRI
  Left = 409
  Top = 190
  Caption = 'Beneficiários por Espécie'
  ClientHeight = 424
  ClientWidth = 406
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 406
    Height = 385
    object Label1: TLabel
      Left = 16
      Top = 8
      Width = 117
      Height = 13
      Caption = 'Espécie / Descrição'
    end
    object Label2: TLabel
      Left = 16
      Top = 192
      Width = 116
      Height = 13
      Caption = 'Rubrica / Descrição'
    end
    object chkListEspecie: TCheckListBox
      Left = 14
      Top = 23
      Width = 377
      Height = 161
      ItemHeight = 13
      TabOrder = 0
    end
    object chkListRubrica: TCheckListBox
      Left = 14
      Top = 209
      Width = 377
      Height = 161
      ItemHeight = 13
      TabOrder = 1
    end
  end
  inherited Dock971: TDock97
    Top = 385
    Width = 406
    inherited tb97Fundo: TToolbar97
      Left = 234
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 65
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 971
    Top = 11
  end
  object dsBeneficio: TDataSource
    DataSet = qryBeneficio
    Left = 336
    Top = 64
  end
  object qryBeneficio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      CODBENEFICIO || '#39' - '#39' || NOME DESCRICAO,'
      '      CODBENEFICIO, NOME'
      'FROM BENEFICIO'
      'WHERE CODBENEFICIO IS NOT NULL'
      '  AND NOME LIKE '#39'%INSS%'#39
      'ORDER BY DESCRICAO'
      ''
      ' ')
    ValidateWithMask = True
    Left = 280
    Top = 64
  end
  object qryRubrica: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   SUBSTR(RXI.RUBRICAINSS || '#39' - '#39' ||PD.DESCRICAO, 1, 40) DESCRI' +
        'CAO,'
      '   RXI.RUBRICAINSS'
      ''
      'FROM'
      '    RUBRICAXINSS RXI,'
      '    PROVDESC     PD'
      ''
      'WHERE'
      '       RXI.IDRUBRICA     = PD.IDPROVENTO'
      '   AND RXI.FLGRUBCENTRAL = 1'
      ''
      'ORDER BY'
      '   RXI.RUBRICAINSS'
      ' ')
    ValidateWithMask = True
    Left = 280
    Top = 256
  end
  object dsRubrica: TDataSource
    DataSet = qryRubrica
    Left = 336
    Top = 256
  end
end
