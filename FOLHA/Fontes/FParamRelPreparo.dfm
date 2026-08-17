inherited frmParamRelPreparo: TfrmParamRelPreparo
  Top = 194
  HelpContext = 180084
  Caption = 'Relatório de Benefícios Preparados'
  ClientHeight = 230
  ClientWidth = 410
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 410
    Height = 191
    object GroupBox1: TGroupBox
      Left = 9
      Top = 7
      Width = 389
      Height = 43
      Caption = ' Patrocinadora '
      TabOrder = 0
      object dbcmbPatrocinadora: TwwDBLookupCombo
        Left = 10
        Top = 14
        Width = 368
        Height = 21
        AutoSize = False
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'NOME')
        LookupTable = qryPatrocinadora
        LookupField = 'IDPESSOA'
        DropDownCount = 4
        DropDownWidth = 80
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
    end
    object GroupBox2: TGroupBox
      Left = 9
      Top = 51
      Width = 389
      Height = 43
      Caption = ' Plano '
      TabOrder = 1
      object dbcmbPlano: TwwDBLookupCombo
        Left = 10
        Top = 14
        Width = 368
        Height = 21
        AutoSize = False
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'50'#9'NOME')
        LookupTable = qryPlano
        LookupField = 'IDPLANOPREV'
        DropDownCount = 4
        DropDownWidth = 80
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
    end
    object grpMesRef: TGroupBox
      Left = 9
      Top = 94
      Width = 389
      Height = 43
      Caption = ' Mês e Ano de Cobrança '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      object cmbMes: TComboBox
        Left = 11
        Top = 15
        Width = 171
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        TabOrder = 0
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
      object spnedAno: TSpinEdit
        Left = 205
        Top = 15
        Width = 55
        Height = 22
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxValue = 0
        MinValue = 0
        ParentFont = False
        TabOrder = 1
        Value = 2000
      end
      object chkbxAbono: TCheckBox
        Left = 307
        Top = 18
        Width = 63
        Height = 17
        Caption = 'Abono'
        TabOrder = 2
      end
    end
    object GroupBox3: TGroupBox
      Left = 9
      Top = 137
      Width = 389
      Height = 43
      Caption = ' Ordenação do Relatório '
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      object cmbxOrdem: TComboBox
        Left = 11
        Top = 15
        Width = 254
        Height = 21
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        TabOrder = 0
        Items.Strings = (
          'Titular por ordem de cadastro.'
          'Matrícula.'
          'Inscrição.')
      end
    end
  end
  inherited Dock971: TDock97
    Top = 191
    Width = 410
    inherited tb97Fundo: TToolbar97
      Left = 213
      DockPos = 213
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 44
      DockPos = 44
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 43
    Top = 235
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryPatrocinadora: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.IDPESSOA, P.NOME'
      'FROM PESSOA P, PATRO'
      'WHERE (P.IDPESSOA = PATRO.IDPESSOA)'
      'ORDER BY P.NOME')
    ValidateWithMask = True
    Left = 225
    Top = 16
  end
  object qryPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPLANOPREV, NOME'
      'FROM PLANPREV'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 297
    Top = 63
  end
end
