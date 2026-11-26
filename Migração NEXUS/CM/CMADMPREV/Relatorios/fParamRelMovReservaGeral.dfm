inherited frmParamRelMovReservaGeral: TfrmParamRelMovReservaGeral
  Left = 174
  Top = 141
  Caption = 'Relatório de Consulta ao Extrato de Reservas Geral'
  ClientHeight = 256
  ClientWidth = 442
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 442
    Height = 217
  end
  inherited Dock971: TDock97
    Top = 217
    Width = 442
    inherited tb97Fundo: TToolbar97
      Left = 272
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 105
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  object GroupBox2: TGroupBox [2]
    Left = 16
    Top = 13
    Width = 412
    Height = 132
    TabOrder = 2
    object Label6: TLabel
      Left = 9
      Top = 19
      Width = 80
      Height = 13
      Caption = 'Patrocinadora'
    end
    object Label7: TLabel
      Left = 9
      Top = 72
      Width = 33
      Height = 13
      Caption = 'Plano'
    end
    object dblkpcmbPatro: TwwDBLookupCombo
      Left = 9
      Top = 36
      Width = 392
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'60'#9'Patrocinadora')
      DataField = 'IDPESSJUR'
      LookupTable = qryPatro
      LookupField = 'IDPESSOA'
      Options = [loTitles]
      ParentFont = False
      TabOrder = 0
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
    end
    object dblkpcmbPlano: TwwDBLookupCombo
      Left = 9
      Top = 86
      Width = 392
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'60'#9'Nome do Plano'#9'F')
      LookupTable = qryPlanos
      LookupField = 'IDPLANOPREV'
      Options = [loTitles]
      ParentFont = False
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      OnClick = dblkpcmbPlanoClick
    end
  end
  object GroupBox7: TGroupBox [3]
    Left = 16
    Top = 152
    Width = 412
    Height = 49
    TabOrder = 3
    object Label15: TLabel
      Left = 8
      Top = 18
      Width = 141
      Height = 13
      Caption = 'Mês de Referência entre'
    end
    object Label16: TLabel
      Left = 244
      Top = 18
      Width = 8
      Height = 13
      Caption = 'e'
    end
    object edMesCobIni: TMaskEdit
      Left = 153
      Top = 14
      Width = 82
      Height = 21
      EditMask = '!9999/99;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 7
      ParentFont = False
      TabOrder = 0
      Text = '    /  '
    end
    object edMesCobFim: TMaskEdit
      Left = 261
      Top = 14
      Width = 82
      Height = 21
      EditMask = '!9999/99;1;_'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 7
      ParentFont = False
      TabOrder = 1
      Text = '    /  '
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 643
    Top = 515
  end
  object qryPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PA.IDPESSOA, PE.NOME'
      'FROM PESSOA PE, PATRO PA'
      'WHERE PA.IDPESSOA = PE.IDPESSOA')
    ValidateWithMask = True
    Left = 120
    Top = 5
  end
  object qryPlanos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPLANOPREV, NOME FROM PLANPREV ')
    ValidateWithMask = True
    Left = 194
    Top = 5
  end
  object qryparamglobal: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MOEDACORRENTE '
      'FROM PARAMGLOBAL '
      'WHERE IDPESSOA = :IDEMPRESA')
    ValidateWithMask = True
    Left = 278
    Top = 5
    ParamData = <
      item
        DataType = ftString
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end>
  end
end
