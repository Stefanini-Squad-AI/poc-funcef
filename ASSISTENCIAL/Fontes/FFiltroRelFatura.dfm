inherited FrmFiltroRelFatura: TFrmFiltroRelFatura
  Left = 122
  Top = 197
  Caption = 'Fatura Mensal de Prêmios'
  ClientHeight = 173
  ClientWidth = 402
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 402
    Height = 134
    object Label1: TLabel
      Left = 145
      Top = 46
      Width = 100
      Height = 13
      Caption = 'Mês de Cobrança'
    end
    object dblkMesCoranca: TwwDBLookupCombo
      Left = 145
      Top = 62
      Width = 105
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'MESCOBRANCA'#9'7'#9'MESCOBRANCA'#9'F')
      LookupTable = qryMeses
      LookupField = 'MESCOBRANCA'
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
    end
  end
  inherited Dock971: TDock97
    Top = 134
    Width = 402
    inherited tb97Fundo: TToolbar97
      Left = 232
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 65
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  object qryMeses: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT MESCOBRANCA '
      'FROM HSTCONTRIBASS ORDER BY MESCOBRANCA DESC')
    ValidateWithMask = True
    Left = 80
    Top = 80
  end
end
