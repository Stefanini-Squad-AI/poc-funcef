inherited FrmParamGrpAut: TFrmParamGrpAut
  Left = 156
  Top = 183
  Caption = 'Grupo de Autorização'
  ClientHeight = 115
  ClientWidth = 415
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 415
    Height = 76
    object Label2: TLabel
      Left = 24
      Top = 16
      Width = 124
      Height = 13
      Caption = 'Grupo de Autorização'
    end
    object dblcGrpAut: TCMDBLookupCombo
      Left = 24
      Top = 32
      Width = 369
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOMEGRUPOAUT'#9'30'#9'Descrição')
      DataField = 'IDGRPRESPON'
      LookupTable = qryGrpAut
      LookupField = 'IDGRUPOAUTORIZA'
      Options = [loTitles]
      Style = csDropDownList
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
  end
  inherited Dock971: TDock97
    Top = 76
    Width = 415
    inherited tb97Fundo: TToolbar97
      Left = 245
      DockPos = 245
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 77
      DockPos = 77
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 787
    Top = 65523
  end
  object qryGrpAut: TwwQuery
    AutoCalcFields = False
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      IDGRUPOAUTORIZA,'
      '      NOMEGRUPOAUT'
      'FROM'
      '      RADGRUPOAUTORIZA'
      'ORDER BY 2           ')
    ValidateWithMask = True
    Left = 15
    Top = 64
    object qryGrpAutIDGRUPOAUTORIZA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDGRUPOAUTORIZA'
      Origin = 'RADGRUPOAUTORIZA.IDGRUPOAUTORIZA'
      Visible = False
    end
    object qryGrpAutNOMEGRUPOAUT: TStringField
      FieldName = 'NOMEGRUPOAUT'
      Origin = '"CM.RADGRUPOAUTORIZA".NOMEGRUPOAUT'
      Size = 60
    end
  end
end
