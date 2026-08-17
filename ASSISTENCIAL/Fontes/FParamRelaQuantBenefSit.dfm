inherited frmParamRelaQuantBenefSit: TfrmParamRelaQuantBenefSit
  Left = 274
  Top = 152
  Caption = 'Quantitativo de Beneficiários por Situação'
  ClientHeight = 211
  ClientWidth = 337
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 337
    Height = 172
    object Label1: TLabel
      Left = 9
      Top = 117
      Width = 45
      Height = 13
      Caption = 'Produto'
    end
    object Label2: TLabel
      Left = 9
      Top = 72
      Width = 80
      Height = 13
      Caption = 'Patrocinadora'
    end
    object GroupBox1: TGroupBox
      Left = 9
      Top = 9
      Width = 247
      Height = 55
      Caption = 'Mês de Referência'
      TabOrder = 0
      object dbseano: TwwDBSpinEdit
        Left = 168
        Top = 21
        Width = 61
        Height = 21
        Increment = 1
        Value = 1999
        TabOrder = 1
        UnboundDataType = wwDefault
      end
      object CbMes: TComboBox
        Left = 15
        Top = 21
        Width = 145
        Height = 21
        ItemHeight = 13
        Items.Strings = (
          'Janeiro'
          'Fevereiro'
          'Março'
          'Abril'
          'Maio'
          'Junho'
          'Julho'
          'Agosto'
          'Setembro'
          'Outubro '
          'Novembro'
          'Dezembro')
        TabOrder = 0
      end
    end
    object dblcpatro: TCMDBLookupCombo
      Left = 9
      Top = 87
      Width = 319
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'40'#9'Patrocinadora')
      LookupTable = qrypatro
      LookupField = 'IDPESSOA'
      Options = [loColLines, loRowLines, loTitles]
      Style = csDropDownList
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object dblcproduto: TCMDBLookupCombo
      Left = 9
      Top = 132
      Width = 319
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'40'#9'NOME')
      LookupTable = qryproduto
      LookupField = 'IDPLANASS'
      Options = [loColLines, loRowLines, loTitles]
      Style = csDropDownList
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
  end
  inherited Dock971: TDock97
    Top = 172
    Width = 337
    inherited tb97Fundo: TToolbar97
      Left = 168
      DockPos = 168
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      DockPos = 0
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 495
    Top = 6
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryproduto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PA.NOME, PA.IDPLANASS'
      'FROM BENEFASS BA, PLANASS PA'
      'WHERE (BA.IDPLANASS = PA.IDPLANASS)'
      'ORDER BY PA.NOME')
    ValidateWithMask = True
    Left = 228
    Top = 120
  end
  object qrypatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT P.NOME, P.IDPESSOA  '
      'FROM PESSOA P, BENEFASS BA'
      'WHERE (P.FLGPATROCINADORA = 1) '
      'AND       (P.IDPESSOA= BA.IDPESSJUR)'
      'ORDER BY P.NOME ')
    ValidateWithMask = True
    Left = 225
    Top = 69
    object qrypatroNOME: TStringField
      DisplayLabel = 'Patrocinadora'
      DisplayWidth = 40
      FieldName = 'NOME'
      Origin = 'PESSOA.NOME'
      Size = 60
    end
    object qrypatroIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'PESSOA.IDPESSOA'
      Visible = False
    end
  end
end
A
