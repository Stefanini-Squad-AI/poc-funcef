inherited FrmParamGrpRespon: TFrmParamGrpRespon
  Left = 223
  Top = 216
  Caption = 'Grupo de  Responsabilidade'
  ClientHeight = 115
  ClientWidth = 390
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 390
    Height = 76
    object Label2: TLabel
      Left = 24
      Top = 16
      Width = 157
      Height = 13
      Caption = 'Grupo de Responsabilidade'
    end
    object dblcGrpResp: TCMDBLookupCombo
      Left = 24
      Top = 32
      Width = 345
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'30'#9'Descrição')
      DataField = 'IDGRPRESPON'
      LookupTable = qryGrpResp
      LookupField = 'IDGRPRESPON'
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
    Width = 390
    inherited tb97Fundo: TToolbar97
      Left = 220
      DockPos = 220
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 52
      DockPos = 52
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 779
    Top = 65523
  end
  object qryGrpResp: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '            IDGRPRESPON,'
      '            NOME'
      'FROM'
      '           RADGRPRESPON'
      'ORDER BY 2  ')
    ValidateWithMask = True
    Left = 16
    Top = 73
  end
end
