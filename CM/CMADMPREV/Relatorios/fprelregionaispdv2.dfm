inherited FrmParamRelPdvReg2: TFrmParamRelPdvReg2
  Left = 154
  Top = 206
  Caption = 'Valores por Regionais - PDV'
  ClientHeight = 171
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 132
    object Label1: TLabel
      Left = 40
      Top = 39
      Width = 84
      Height = 13
      Caption = 'Patrocinadora:'
    end
    object Label2: TLabel
      Left = 40
      Top = 79
      Width = 86
      Height = 13
      Caption = 'Mês Cobrança:'
    end
    object dblckPatro: TwwDBLookupCombo
      Left = 134
      Top = 35
      Width = 328
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'60'#9'Patrocinadora')
      LookupTable = qryPatro
      LookupField = 'NOME'
      Options = [loTitles]
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
    end
    object sMesCob: TMaskEdit
      Left = 134
      Top = 74
      Width = 85
      Height = 21
      EditMask = '99/9999;1;_'
      MaxLength = 7
      TabOrder = 1
      Text = '  /    '
    end
  end
  inherited Dock971: TDock97
    Top = 132
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.IDPESSOA, P.NOME'
      'FROM   PESSOA P, PATRO PT'
      'WHERE  PT.IDPESSOA = P.IDPESSOA'
      'AND    PT.IDFUNDACAO = :IDFUNDACAO'
      'ORDER BY P.NOME'
      ' ')
    ValidateWithMask = True
    Left = 409
    Top = 77
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
end
