inherited FrmParamRelPdvReg: TFrmParamRelPdvReg
  Left = 146
  Top = 198
  Caption = 'Quadro de Valores Cobrados por Regionais'
  ClientHeight = 197
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 158
    object Label1: TLabel
      Left = 24
      Top = 24
      Width = 84
      Height = 13
      Caption = 'Patrocinadora:'
    end
    object Label2: TLabel
      Left = 24
      Top = 64
      Width = 86
      Height = 13
      Caption = 'Mês Cobrança:'
    end
    object Label3: TLabel
      Left = 24
      Top = 96
      Width = 134
      Height = 13
      Caption = 'Programa de Demissão:'
    end
    object dblckPatro: TwwDBLookupCombo
      Left = 118
      Top = 20
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
      Left = 118
      Top = 59
      Width = 85
      Height = 21
      EditMask = '99/9999;1;_'
      MaxLength = 7
      TabOrder = 1
      Text = '  /    '
    end
    object dblkpEvento: TwwDBLookupCombo
      Left = 24
      Top = 111
      Width = 361
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'60'#9'Tipo de Pdv')
      LookupTable = qryEventoPdv
      LookupField = 'NOME'
      Options = [loTitles]
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
    end
  end
  inherited Dock971: TDock97
    Top = 158
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
    Left = 457
    Top = 45
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object qryEventoPdv: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  IDEVENTOGERADOR, NOME  FROM  EVENTOGERADOR'
      'WHERE FLGINTERNO = '#39'PD'#39
      'AND   IDFUNDACAO = :IDFUNDACAO')
    ValidateWithMask = True
    Left = 457
    Top = 101
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
end
