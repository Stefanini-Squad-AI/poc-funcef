inherited FrmParamRelLancNaoProcecssados: TFrmParamRelLancNaoProcecssados
  Left = 42
  Top = 128
  HelpContext = 180106
  Caption = 'Lançamentos Não Processados'
  ClientHeight = 341
  ClientWidth = 608
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 608
    Height = 302
    object GroupBox3: TGroupBox
      Left = 8
      Top = 9
      Width = 594
      Height = 280
      Caption = 'Parâmetros para a Emissão do Relatório :'
      TabOrder = 0
      object GroupBox2: TGroupBox
        Left = 5
        Top = 15
        Width = 584
        Height = 43
        Caption = ' Patrocinadora '
        TabOrder = 0
        object dbcmbPatrocinadora: TwwDBLookupCombo
          Left = 10
          Top = 14
          Width = 477
          Height = 21
          AutoSize = False
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'30'#9'Patrocinadora'#9'F')
          LookupTable = qryPatrocinadora
          LookupField = 'IDPESSOA'
          DropDownCount = 4
          DropDownWidth = 80
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
        end
        object cbxPatros: TCheckBox
          Left = 520
          Top = 16
          Width = 58
          Height = 17
          Caption = 'Todas'
          TabOrder = 1
        end
      end
      object GroupBox1: TGroupBox
        Left = 5
        Top = 61
        Width = 584
        Height = 43
        Caption = 'Plano'
        TabOrder = 1
        object dbCmbPlano: TwwDBLookupCombo
          Left = 10
          Top = 14
          Width = 477
          Height = 21
          AutoSize = False
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'30'#9'Patrocinadora'#9'F')
          LookupTable = qryPlano
          LookupField = 'IDPLANOPREV'
          DropDownCount = 4
          DropDownWidth = 80
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
        end
        object cbxPlanos: TCheckBox
          Left = 520
          Top = 16
          Width = 57
          Height = 17
          Caption = 'Todos'
          TabOrder = 1
        end
      end
      object GroupBox4: TGroupBox
        Left = 6
        Top = 106
        Width = 251
        Height = 58
        Caption = 'Mês de Cobrança'
        TabOrder = 2
        object Label1: TLabel
          Left = 7
          Top = 12
          Width = 24
          Height = 13
          Caption = 'Mês'
        end
        object Label2: TLabel
          Left = 153
          Top = 11
          Width = 23
          Height = 13
          Caption = 'Ano'
        end
        object cboxMesCob: TComboBox
          Left = 7
          Top = 25
          Width = 128
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
        object EditAnoCob: TEdit
          Left = 152
          Top = 25
          Width = 75
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Text = '1999'
        end
        object UpDown1: TUpDown
          Left = 227
          Top = 25
          Width = 15
          Height = 21
          Associate = EditAnoCob
          Min = 1999
          Max = 4000
          Position = 1999
          TabOrder = 2
          Thousands = False
          Wrap = False
        end
      end
      object GroupBox5: TGroupBox
        Left = 338
        Top = 106
        Width = 251
        Height = 58
        Caption = 'Mês de Referência'
        TabOrder = 3
        object Label3: TLabel
          Left = 7
          Top = 12
          Width = 24
          Height = 13
          Caption = 'Mês'
        end
        object Label4: TLabel
          Left = 156
          Top = 11
          Width = 23
          Height = 13
          Caption = 'Ano'
        end
        object cboxMesRef: TComboBox
          Left = 7
          Top = 25
          Width = 128
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
        object EditAnoRef: TEdit
          Left = 154
          Top = 25
          Width = 75
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
          Text = '1999'
        end
        object UpDown2: TUpDown
          Left = 229
          Top = 25
          Width = 15
          Height = 21
          Associate = EditAnoRef
          Min = 1999
          Max = 4000
          Position = 1999
          TabOrder = 2
          Thousands = False
          Wrap = False
        end
      end
      object GroupBox6: TGroupBox
        Left = 5
        Top = 165
        Width = 584
        Height = 43
        Caption = 'Rubrica'
        TabOrder = 4
        object dbCmbRubrica: TwwDBLookupCombo
          Left = 10
          Top = 14
          Width = 477
          Height = 21
          AutoSize = False
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'JUNCAO'#9'173'#9'JUNCAO'#9'F')
          LookupTable = qryRubrica
          LookupField = 'IDPROVENTO'
          DropDownCount = 4
          DropDownWidth = 80
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
        end
        object cbxRubricas: TCheckBox
          Left = 520
          Top = 16
          Width = 57
          Height = 17
          Caption = 'Todas'
          TabOrder = 1
        end
      end
      object GroupBox7: TGroupBox
        Left = 5
        Top = 212
        Width = 584
        Height = 46
        Caption = 'Tipo de Lançamento :'
        TabOrder = 5
        object cbxLancamentos: TCheckBox
          Left = 521
          Top = 16
          Width = 57
          Height = 17
          Caption = 'Todos'
          TabOrder = 0
        end
        object cbbTipoLanc: TComboBox
          Left = 8
          Top = 18
          Width = 480
          Height = 21
          ItemHeight = 13
          TabOrder = 1
          Items.Strings = (
            'Assistencial'
            'Convênios'
            'Empréstimo'
            'Previdenciário')
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 302
    Width = 608
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
    Left = 563
    Top = 259
  end
  object qryPatrocinadora: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  PE.IDPESSOA,'
      '  PE.NOME'
      ''
      'FROM'
      '  PESSOA PE,'
      '  PATRO PA'
      ''
      'WHERE'
      '  PE.IDPESSOA = PA.IDPESSOA'
      ''
      'ORDER BY'
      '  PE.NOME'
      ' '
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 27
    Top = 269
  end
  object qryPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      #9'PPT.NOME,'
      '                PPT.IDPLANOPREV'
      'FROM'
      #9'PLANPREV PPT'
      'ORDER BY PPT.IDPLANOPREV')
    ValidateWithMask = True
    Left = 76
    Top = 269
  end
  object qryRubrica: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '  TMP.IDPROVENTO,'
      ' '#9'PRV.DESCRICAO,'
      '  TMP.IDPROVENTO||'#39' - '#39'||PRV.DESCRICAO AS JUNCAO'
      'FROM'
      ' '#9'TMPDESC TMP,'
      #9' PROVDESC PRV'
      'WHERE'
      '   '#9'TMP.FLGDESCFOLHA = '#39'B'#39
      'AND (TMP.SITENVIO = '#39'0'#39' OR TMP.SITENVIO IS NULL)'
      'AND PRV.IDPROVENTO = TMP.IDPROVENTO'
      ' ')
    ValidateWithMask = True
    Left = 140
    Top = 265
  end
end
