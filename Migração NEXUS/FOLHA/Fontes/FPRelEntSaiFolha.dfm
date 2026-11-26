inherited FrmPRelEntSaiFolha: TFrmPRelEntSaiFolha
  Left = 255
  Top = 253
  HelpContext = 180071
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Parâmetros do Relatório de Entrada e Saída da Folha'
  ClientHeight = 379
  ClientWidth = 719
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 719
    Height = 340
    object Label1: TLabel
      Left = 360
      Top = 291
      Width = 56
      Height = 13
      Caption = 'Benefício'
    end
    object lblCor: TLabel
      Left = 638
      Top = 308
      Width = 36
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Cor:   '
    end
    object RdoTipoOrdem: TRadioGroup
      Left = 16
      Top = 288
      Width = 329
      Height = 38
      Caption = ' Ordenação do Recebedor '
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'Matrícula'
        'Inscrição'
        'Recebedor')
      TabOrder = 3
    end
    object rdoEntSaiAmb: TRadioGroup
      Left = 16
      Top = 250
      Width = 329
      Height = 35
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'Entrada'
        'Saída'
        'Ambos')
      TabOrder = 2
    end
    object grbMesEnt: TGroupBox
      Left = 16
      Top = 8
      Width = 329
      Height = 239
      Caption = ' Mês e Ano Base para Comparação '
      TabOrder = 0
      object lbVersaoEntrada: TLabel
        Left = 16
        Top = 50
        Width = 175
        Height = 13
        Caption = 'Versão Base para Comparação'
      end
      object cmbMesEnt: TComboBox
        Left = 16
        Top = 24
        Width = 177
        Height = 21
        ItemHeight = 13
        TabOrder = 0
        OnChange = cmbMesEntChange
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
      object speAnoEnt: TSpinEdit
        Left = 192
        Top = 24
        Width = 65
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 1
        Value = 0
        OnChange = speAnoEntChange
      end
      object chklstVersaoEntrada: TCheckListBox
        Left = 16
        Top = 64
        Width = 297
        Height = 161
        ItemHeight = 13
        TabOrder = 2
      end
    end
    object grbMesSai: TGroupBox
      Left = 360
      Top = 8
      Width = 345
      Height = 239
      Caption = ' Mês e Ano de Pagamento '
      TabOrder = 1
      object lbVersaoSaida: TLabel
        Left = 16
        Top = 66
        Width = 131
        Height = 13
        Caption = 'Versões de Pagamento'
      end
      object rdoEscolheTabela: TRadioGroup
        Left = 160
        Top = 49
        Width = 169
        Height = 33
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Prévia'
          'Efetivada')
        TabOrder = 2
        OnClick = rdoEscolheTabelaClick
      end
      object cmbMesSai: TComboBox
        Left = 16
        Top = 24
        Width = 177
        Height = 21
        ItemHeight = 13
        TabOrder = 0
        OnChange = cmbMesSaiChange
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
      object speAnoSai: TSpinEdit
        Left = 192
        Top = 24
        Width = 65
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 1
        Value = 0
        OnChange = speAnoSaiChange
      end
      object chklstVersaoSaida: TCheckListBox
        Left = 16
        Top = 80
        Width = 313
        Height = 145
        ItemHeight = 13
        TabOrder = 3
      end
    end
    object DBcboBeneficio: TwwDBLookupCombo
      Left = 360
      Top = 305
      Width = 265
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'30'#9'Benefício'#9'F')
      LookupTable = qryBeneficio
      LookupField = 'IDBENEFICIO'
      Enabled = False
      TabOrder = 5
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
    object ccbEscolheCor: TfcColorCombo
      Left = 667
      Top = 305
      Width = 38
      Height = 21
      Anchors = [akTop, akRight]
      AutoDropDown = True
      ButtonStyle = cbsEllipsis
      Color = clWhite
      ColorDialog = dlgColor
      ColorListOptions.Font.Charset = DEFAULT_CHARSET
      ColorListOptions.Font.Color = clWindowText
      ColorListOptions.Font.Height = -11
      ColorListOptions.Font.Name = 'MS Sans Serif'
      ColorListOptions.Font.Style = []
      DropDownCount = 8
      ReadOnly = False
      SelectedColor = clWhite
      TabOrder = 6
    end
    object rdgTratamento: TRadioGroup
      Left = 360
      Top = 250
      Width = 345
      Height = 35
      Caption = ' Tratamento '
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'por Contracheque'
        'por Benefício')
      TabOrder = 4
      OnClick = rdgTratamentoClick
    end
  end
  inherited Dock971: TDock97
    Top = 340
    Width = 719
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 987
    Top = 3
  end
  object qryVersaoEntrada: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDHSTFOLHABENEF,'
      '  IDHSTFOLHABENEF||'#39' - '#39'||HISTORICO AS HISTORICO'
      ''
      'FROM'
      '  HSTFOLHABENEF'
      ''
      'WHERE'
      '  MESREFERENCIA = :PMESREF'
      '  AND FLGESTADO <> 2'
      ''
      'ORDER BY'
      '  IDHSTFOLHABENEF DESC'
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 520
    Top = 112
    ParamData = <
      item
        DataType = ftString
        Name = 'PMESREF'
        ParamType = ptUnknown
      end>
  end
  object qryVersaoSaida: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDHSTFOLHABENEF,'
      '  HISTORICO'
      ''
      'FROM'
      '  HSTFOLHABENEF'
      ''
      'WHERE  FLGESTADO <> 2'
      ''
      'ORDER BY'
      '  IDHSTFOLHABENEF DESC'
      '')
    ValidateWithMask = True
    Left = 432
    Top = 112
  end
  object qryBeneficio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  BE.IDBENEFICIO,'
      '  BE.NOME '
      ''
      'FROM'
      '  BENEFICIO BE'
      ''
      'ORDER BY'
      '  NOME')
    ValidateWithMask = True
    Left = 432
    Top = 168
  end
  object dlgColor: TColorDialog
    Ctl3D = True
    Left = 520
    Top = 168
  end
end
