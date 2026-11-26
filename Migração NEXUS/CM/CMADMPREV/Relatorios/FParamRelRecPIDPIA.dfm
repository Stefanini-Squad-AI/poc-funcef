inherited frmParamRelRecPIDPIA: TfrmParamRelRecPIDPIA
  Left = 188
  Top = 133
  Caption = 
    'Parâmetro do Relatório de Recebimentos Mantidos Incentivo PID/PI' +
    'A'
  ClientHeight = 302
  ClientWidth = 478
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 478
    Height = 263
    object GroupBox1: TGroupBox
      Left = 39
      Top = 8
      Width = 181
      Height = 49
      Caption = 'Mês e Ano de Cobrança'
      TabOrder = 0
      object dbseano: TwwDBSpinEdit
        Left = 119
        Top = 18
        Width = 52
        Height = 21
        Increment = 1
        TabOrder = 1
        UnboundDataType = wwDefault
      end
      object cbmes: TComboBox
        Left = 9
        Top = 18
        Width = 97
        Height = 21
        ItemHeight = 13
        TabOrder = 0
        Text = 'cbmes'
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
          'Outubro'
          'Novembro'
          'Dezembro')
      end
    end
    object GroupBox2: TGroupBox
      Left = 38
      Top = 64
      Width = 400
      Height = 185
      Caption = 'Patrocinadora'
      TabOrder = 1
      object chklstPatro: TCheckListBox
        Left = 6
        Top = 21
        Width = 387
        Height = 147
        Columns = 2
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        IntegralHeight = True
        ItemHeight = 13
        ParentFont = False
        TabOrder = 0
      end
    end
    object GroupBox3: TGroupBox
      Left = 232
      Top = 8
      Width = 206
      Height = 49
      Caption = 'Tipo de Incentivo'
      TabOrder = 2
      object dbcmbSitFunc: TwwDBLookupCombo
        Left = 12
        Top = 19
        Width = 179
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'30'#9'Descrição'
          'IDSITFUNC'#9'10'#9'IDSITFUNC')
        LookupTable = qrySitFunc
        LookupField = 'IDSITFUNC'
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 263
    Width = 478
    inherited tb97Fundo: TToolbar97
      Left = 250
      DockPos = 250
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 82
      DockPos = 82
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 435
    Top = 259
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qrypatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PJ.IDPESSOA, PJ.NOME'
      'FROM PESSOA PJ'
      'WHERE (PJ.IDPESSOA  IN (SELECT IDPESSOA FROM PATRO))'
      'ORDER BY PJ.NOME')
    ValidateWithMask = True
    Left = 201
    Top = 117
  end
  object dsSitFunc: TwwDataSource
    DataSet = qrySitFunc
    Left = 289
    Top = 48
  end
  object qrySitFunc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  IDSITFUNC , DESCRICAO'
      'FROM SITFUNC '
      'WHERE TIPOSIT = '#39'P'#39
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 337
    Top = 48
  end
end
