inherited frmCadIntegracaoPREVAux: TfrmCadIntegracaoPREVAux
  Left = 326
  Top = 172
  Caption = 'Informe os Dados Abaixo ...'
  ClientHeight = 136
  ClientWidth = 424
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 424
    Height = 97
    object lblDescricao: TLabel
      Left = 26
      Top = 21
      Width = 71
      Height = 13
      Caption = 'lblDescricao'
    end
    object dblkpcmbNivelIntegracao: TwwDBLookupCombo
      Left = 26
      Top = 36
      Width = 376
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'50'#9'NOME'#9'F')
      LookupTable = qryLista
      LookupField = 'NOME'
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
    end
  end
  inherited Dock971: TDock97
    Top = 97
    Width = 424
    inherited tb97Fundo: TToolbar97
      Left = 252
      inherited bbtnSair: TBitBtn
        Visible = False
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Visible = False
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 83
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 12
    Top = 250
  end
  object qryLista: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPLANOPREV, NOME FROM PLANPREV ORDER BY NOME'
      ' ')
    ValidateWithMask = True
    Left = 30
    Top = 83
  end
end
