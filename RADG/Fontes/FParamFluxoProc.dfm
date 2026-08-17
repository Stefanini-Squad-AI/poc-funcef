inherited FrmParamFluxoProc: TFrmParamFluxoProc
  Left = 130
  Top = 181
  Caption = 'Fluxo dos Processos'
  ClientHeight = 125
  ClientWidth = 493
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 493
    Height = 86
    object Label1: TLabel
      Left = 24
      Top = 24
      Width = 100
      Height = 13
      Caption = 'Tipo de Processo'
    end
    object dblcProc: TCMDBLookupCombo
      Left = 24
      Top = 40
      Width = 449
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'60'#9'Descrição')
      LookupTable = qryProc
      LookupField = 'IDTIPOPROCESSO'
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
    Top = 86
    Width = 493
    inherited tb97Fundo: TToolbar97
      Left = 323
      DockPos = 323
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 155
      DockPos = 155
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 779
  end
  object qryProc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDTIPOPROCESSO, NOME'
      ' FROM  RADTIPOPROCESSO'
      'ORDER BY 2')
    ValidateWithMask = True
    Left = 8
    Top = 84
  end
end
