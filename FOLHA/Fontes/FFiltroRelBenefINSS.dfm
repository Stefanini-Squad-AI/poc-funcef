inherited FrmFiltroRelBenefINSS: TFrmFiltroRelBenefINSS
  Left = 147
  Top = 146
  HelpContext = 180078
  Caption = 'Filtro do Relatório de Valor Mensal do Benefício de INSS'
  ClientHeight = 284
  ClientWidth = 520
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 520
    Height = 245
    inherited RdoTipoFolha: TRadioGroup
      Left = 40
      Top = 13
      ItemIndex = 1
      Visible = False
    end
    inherited RdoTipoFiltro: TRadioGroup
      Left = 40
      Top = 13
      ItemIndex = 1
      Visible = False
    end
    inherited PnlPreviaouEfetivada: TPanel
      Left = 10
      Top = 8
      Width = 499
      Height = 225
      object Label2: TLabel [0]
        Left = 9
        Top = 5
        Width = 46
        Height = 13
        Caption = 'Período'
      end
      inherited PnlLoteouVersao: TPanel [1]
        Top = 27
        Visible = False
      end
      inherited PnlMesPagto: TPanel [2]
        Left = 6
        Top = 19
        Width = 486
        Height = 60
        inherited LblMesPagto: TLabel
          Left = 10
          Width = 62
          Caption = 'Mês Inicial'
        end
        object Label1: TLabel [1]
          Left = 262
          Top = 8
          Width = 55
          Height = 13
          Caption = 'Mês Final'
        end
        inherited CmbMes: TComboBox
          Left = 259
          Top = 23
        end
        inherited SpnedAno: TSpinEdit
          Left = 412
          Top = 23
        end
        object CbMesIni: TComboBox
          Left = 8
          Top = 23
          Width = 145
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          TabOrder = 2
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
        object spnedAnoIni: TSpinEdit
          Left = 161
          Top = 23
          Width = 66
          Height = 22
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxValue = 0
          MinValue = 0
          ParentFont = False
          TabOrder = 3
          Value = 0
        end
      end
      object Panel1: TPanel
        Left = 6
        Top = 92
        Width = 486
        Height = 123
        TabOrder = 2
        object Label3: TLabel
          Left = 8
          Top = 20
          Width = 80
          Height = 13
          Caption = 'Patrocinadora'
        end
        object Label4: TLabel
          Left = 55
          Top = 54
          Width = 33
          Height = 13
          Caption = 'Plano'
        end
        object Label5: TLabel
          Left = 32
          Top = 92
          Width = 56
          Height = 13
          Caption = 'Benefício'
        end
        object dblkPlano: TwwDBLookupCombo
          Left = 96
          Top = 51
          Width = 380
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'50'#9'NOME'#9'F')
          LookupTable = qryPLano
          LookupField = 'IDPLANOPREV'
          TabOrder = 0
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
        end
        object dblkPatro: TwwDBLookupCombo
          Left = 96
          Top = 15
          Width = 380
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'60'#9'NOME'#9'F')
          LookupTable = qryPatro
          LookupField = 'IDPESSOA'
          TabOrder = 1
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
        end
        object dblkBeneficios: TwwDBLookupCombo
          Left = 96
          Top = 84
          Width = 380
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'45'#9'Benefício'#9'F')
          LookupTable = qryBenef
          LookupField = 'IDBENEFICIO'
          TabOrder = 2
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
          OnChange = dblkBeneficiosChange
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 245
    Width = 520
    inherited tb97Fundo: TToolbar97
      Left = 348
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 179
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited qryPreviaouEfetivada: TwwQuery
    Left = 32
    Top = 213
  end
  inherited dsPreviaouEfetivada: TwwDataSource
    Left = 16
    Top = 253
  end
  object qryPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  PT.IDPESSOA,'
      '  P.NOME'
      'FROM PATRO PT, PESSOA P'
      'WHERE PT.IDPESSOA = P.IDPESSOA'
      'ORDER BY P.NOME')
    ValidateWithMask = True
    Left = 64
    Top = 240
  end
  object qryPLano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      ' IDPLANOPREV,'
      ' NOME '
      'FROM PLANPREV '
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 120
    Top = 240
  end
  object qryBenef: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   DISTINCT'
      '   BN.IDBENEFICIO,'
      '   BN.NOME'
      'FROM BENEFPLANPREV BPP, BENEFICIO BN'
      'WHERE '
      '   BPP.IDBENEFICIO = BN.IDBENEFICIO AND'
      '   BPP.FLGREFERENCIA = 1'
      'ORDER BY BN.NOME ASC')
    ValidateWithMask = True
    Left = 32
    Top = 213
  end
end
