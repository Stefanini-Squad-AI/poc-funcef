inherited frmParamRelParticipManutencao: TfrmParamRelParticipManutencao
  Left = 155
  Top = 141
  Caption = 
    'Parametros do relatório de participantes em manutenção de salári' +
    'o'
  FormStyle = fsNormal
  Visible = False
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    object Label1: TLabel
      Left = 77
      Top = 42
      Width = 80
      Height = 13
      Caption = 'Patrocinadora'
    end
    object Label5: TLabel
      Left = 77
      Top = 83
      Width = 84
      Height = 13
      Caption = 'Mês/Ano Base'
    end
    object Label7: TLabel
      Left = 167
      Top = 97
      Width = 6
      Height = 20
      Caption = '/'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object dblkcmbPatrocinadora: TwwDBLookupCombo
      Left = 77
      Top = 56
      Width = 350
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'PATROCINADORA'#9'60'#9'Patrocinadora')
      LookupTable = qryPatro
      LookupField = 'IDPESSOA'
      Options = [loTitles]
      Style = csDropDownList
      ParentFont = False
      TabOrder = 0
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
    object cbxMes: TComboBox
      Left = 77
      Top = 97
      Width = 86
      Height = 21
      Style = csDropDownList
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 1
      Items.Strings = (
        '01'
        '02'
        '03'
        '04'
        '05'
        '06'
        '07'
        '08'
        '09'
        '10'
        '11'
        '12'
        '13º Salário')
    end
    object medAno: TMaskEdit
      Left = 176
      Top = 97
      Width = 45
      Height = 21
      AutoSize = False
      EditMask = '9999;1; '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 4
      ParentFont = False
      TabOrder = 2
      Text = '    '
    end
    object rgrTipoCobranca: TRadioGroup
      Left = 77
      Top = 129
      Width = 350
      Height = 64
      Caption = 'Participantes com Contribuições'
      Columns = 2
      ItemIndex = 2
      Items.Strings = (
        'Em Atraso'
        'A Devolver/Devolvidas'
        'Todos')
      TabOrder = 3
      TabStop = True
    end
  end
  inherited Dock971: TDock97
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
      'Select'
      '  ptr.IDPESSOA,'
      '  pss.NOME PATROCINADORA'
      'From'
      '  Patro  ptr,'
      '  Pessoa pss'
      'Where (ptr.IDPESSOA = pss.IDPESSOA)'
      'and ptr.idfundacao = :idfundacao'
      'Order by pss.NOME'
      ''
      ' ')
    ValidateWithMask = True
    Left = 417
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idfundacao'
        ParamType = ptUnknown
      end>
  end
  object dsPatro: TwwDataSource
    DataSet = qryPatro
    Left = 465
    Top = 28
  end
end
