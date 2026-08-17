inherited FrmParamTipoEtapa: TFrmParamTipoEtapa
  Left = 124
  Top = 218
  Caption = 'Tipo de Etapa'
  ClientHeight = 117
  ClientWidth = 540
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 540
    Height = 78
    object Label3: TLabel
      Left = 24
      Top = 16
      Width = 34
      Height = 13
      Caption = 'Etapa'
    end
    object dblcEtapa: TCMDBLookupCombo
      Left = 24
      Top = 32
      Width = 492
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'30'#9'Descrição')
      DataField = 'IDTIPOETAPA'
      LookupTable = qryEtapa
      LookupField = 'IDTIPOETAPA'
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
    Top = 78
    Width = 540
    inherited tb97Fundo: TToolbar97
      Left = 370
      DockPos = 370
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 202
      DockPos = 202
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 779
    Top = 65523
  end
  object qryEtapa: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '            IDTIPOETAPA,'
      '            NOME'
      'FROM'
      '           RADTIPOETAPA'
      'ORDER BY 2')
    ValidateWithMask = True
    Left = 13
    Top = 72
  end
end
