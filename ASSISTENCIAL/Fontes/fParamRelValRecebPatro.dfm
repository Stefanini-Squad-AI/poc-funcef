inherited frmParamRelValRecebPatro: TfrmParamRelValRecebPatro
  Left = 131
  Top = 171
  Caption = 
    'Parâmetros do Relatório de Valores Esperados e Recebidos por Pat' +
    'rocinadora'
  ClientHeight = 212
  ClientWidth = 519
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 519
    Height = 173
    object Label1: TLabel
      Left = 141
      Top = 33
      Width = 80
      Height = 13
      Caption = 'Patrocinadora'
    end
    object Label2: TLabel
      Left = 141
      Top = 91
      Width = 100
      Height = 13
      Caption = 'Mês de Cobrança'
    end
    object DblkPatro: TwwDBLookupCombo
      Left = 139
      Top = 48
      Width = 222
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'60'#9'NOME'#9'F')
      LookupTable = qryPatro
      LookupField = 'IDPESSOA'
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
    end
    object DblkMesCob: TwwDBLookupCombo
      Left = 139
      Top = 105
      Width = 110
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'MESCOBRANCA'#9'7'#9'MESCOBRANCA'#9'F')
      LookupTable = qryMesCob
      LookupField = 'MESCOBRANCA'
      TabOrder = 1
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
    end
  end
  inherited Dock971: TDock97
    Top = 173
    Width = 519
    inherited tb97Fundo: TToolbar97
      Left = 349
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 182
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  object qryPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  P.IDPESSOA, '
      '  P.NOME '
      'FROM PATRO, PESSOA P'
      'WHERE PATRO.IDPESSOA = P.IDPESSOA'
      'ORDER BY P.NOME ASC')
    ValidateWithMask = True
    Left = 368
    Top = 40
  end
  object qryMesCob: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  DISTINCT MESCOBRANCA '
      'FROM HSTCONTRIBASS'
      'ORDER BY MESCOBRANCA DESC')
    ValidateWithMask = True
    Left = 264
    Top = 96
  end
end
