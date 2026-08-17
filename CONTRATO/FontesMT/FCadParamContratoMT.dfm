inherited frmCadParamContratoMT: TfrmCadParamContratoMT
  Left = 424
  Top = 221
  HelpContext = 230005
  Caption = 'Parâmetros do Sistema'
  ClientHeight = 292
  ClientWidth = 532
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 532
    Height = 206
    object pcParametros: TPageControl
      Left = 1
      Top = 1
      Width = 530
      Height = 204
      ActivePage = tsParametrosMedicao
      Align = alClient
      TabOrder = 0
      object tsParametrosGerais: TTabSheet
        Caption = 'Geral'
        object Label1: TLabel
          Left = 8
          Top = 104
          Width = 226
          Height = 13
          Caption = 'Número de dias para Aviso de Correção'
        end
        object dbcbUtilizaTRD: TDBCheckBox
          Left = 8
          Top = 44
          Width = 393
          Height = 17
          Caption = 'Utilizar a Conta Contábil do Tipo de Desembolso / Recebimento'
          DataField = 'FLGTIPODESEMB'
          DataSource = ds
          TabOrder = 0
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object dbcbEngItens: TDBCheckBox
          Left = 8
          Top = 20
          Width = 305
          Height = 17
          Caption = 'Englobar itens contratuais ao efetuar lançamento'
          DataField = 'FLGENGLOBA'
          DataSource = ds
          TabOrder = 1
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object edrNumDiasAvisoCorr: TDBRealEdit
          Left = 241
          Top = 101
          Width = 56
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0')
          TabOrder = 2
          WordWrap = False
          IntDigits = 10
          DecDigits = 0
          NumberFormat = fNumber
          Signal = False
          DataField = 'NUMDIASAVISOCORR'
          DataSource = ds
        end
        object dbcbImpNFImpFis: TDBCheckBox
          Left = 464
          Top = 4
          Width = 241
          Height = 17
          Caption = 'Imprime Fatura em Impressora Fiscal'
          DataField = 'FLGNFIMPFISCAL'
          DataSource = ds
          Enabled = False
          TabOrder = 3
          ValueChecked = 'S'
          ValueUnchecked = 'N'
          Visible = False
        end
        object dbcbIntegraOrca: TDBCheckBox
          Left = 8
          Top = 68
          Width = 165
          Height = 17
          Caption = 'Integrar com o orçamento'
          DataField = 'FLGINTEGRAORCA'
          DataSource = ds
          TabOrder = 4
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
      end
      object tbsImpostosNF: TTabSheet
        Caption = 'Impostos para Impressão de Fatura/NF'
        ImageIndex = 1
        TabVisible = False
        object pnlDisponiveis: TPanel
          Left = 0
          Top = 0
          Width = 217
          Height = 168
          Align = alLeft
          TabOrder = 0
          object pnlTitDisponiveis: TPanel
            Left = 1
            Top = 1
            Width = 215
            Height = 24
            Align = alTop
            Caption = 'Disponíveis'
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
          object dbgDisponiveis: TwwDBGrid
            Left = 1
            Top = 25
            Width = 215
            Height = 142
            Selected.Strings = (
              'DESCRICAO'#9'35'#9'Descrição'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsDisponiveis
            ReadOnly = True
            TabOrder = 1
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            UseTFields = False
            IndicatorColor = icBlack
          end
        end
        object Panel2: TPanel
          Left = 217
          Top = 0
          Width = 56
          Height = 168
          Align = alLeft
          TabOrder = 1
          object btnAdiciona: TSpeedButton
            Left = 8
            Top = 58
            Width = 40
            Height = 34
            Hint = 'Adiciona'
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF888888006666600
              88888887788888778F88887666666666088888788888888878F887E666666666
              608887F8888F888887F887E666F66666608887888878F888878F7E6666FF6666
              66087F8888778F88887F7E6666FFF66666087F88887778F8887F7E6666FFFF66
              66087F8888777788887F7E6666FFF66666087F8888777888887F7E6666FF6666
              660878F888778888887887E666F66666608887F88878888887F887E666666666
              6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
              8888888778FFFF77888888888777778888888888877777888888}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
          end
          object BtnRemove: TSpeedButton
            Left = 8
            Top = 102
            Width = 40
            Height = 34
            Hint = 'Remove'
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888FFFFF8888888888000008888888888F777778FF888888006666600
              88888887788888778F88887666666666088888788888888878F887E666666666
              608887F888888F8887F887E66666F6666088878888887F88878F7E66666FF666
              66087F8888877F88887F7E6666FFF66666087F8888777F88887F7E666FFFF666
              66087F8887777F88887F7E6666FFF66666087F8888777F88887F7E66666FF666
              660878F888877F88887887E66666F666608887F88888788887F887E666666666
              6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
              8888888778FFFF77888888888777778888888888877777888888}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
          end
        end
        object pnlSelecionados: TPanel
          Left = 273
          Top = 0
          Width = 241
          Height = 168
          Align = alClient
          TabOrder = 2
          object pnlTitSelecionados: TPanel
            Left = 1
            Top = 1
            Width = 239
            Height = 24
            Align = alTop
            Caption = 'Selecionados'
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
          object dbgSelecionados: TwwDBGrid
            Left = 1
            Top = 25
            Width = 239
            Height = 142
            Selected.Strings = (
              'DESCRICAO'#9'35'#9'Descrição'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsSelecionados
            ReadOnly = True
            TabOrder = 1
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            UseTFields = False
            IndicatorColor = icBlack
          end
        end
      end
      object tsParametrosMedicao: TTabSheet
        Caption = 'Medição'
        ImageIndex = 2
        object DBCheckBox1: TDBCheckBox
          Left = 8
          Top = 20
          Width = 433
          Height = 17
          Caption = 
            'Considerar data de lançamento contábil o 1º dia do mês de vencim' +
            'ento'
          DataField = 'FLGDTLANCTO'
          DataSource = ds
          TabOrder = 0
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object DBCheckBox2: TDBCheckBox
          Left = 8
          Top = 44
          Width = 497
          Height = 17
          Caption = 
            'Permite medições após o término da quantidade de parcelas previs' +
            'tas no contrato'
          DataField = 'FLGPERMITEMED'
          DataSource = ds
          TabOrder = 1
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object gbPlanoPatro: TGroupBox
          Left = 8
          Top = 68
          Width = 505
          Height = 103
          Caption = ' Plano e Patrocinadora '
          TabOrder = 2
          object Label11: TLabel
            Left = 12
            Top = 23
            Width = 118
            Height = 13
            Caption = 'Plano Previdenciário'
          end
          object Label12: TLabel
            Left = 12
            Top = 63
            Width = 80
            Height = 13
            Caption = 'Patrocinadora'
          end
          object CmbPlano: TCMDBLookupCombo
            Left = 11
            Top = 36
            Width = 486
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'50'#9'Plano Previdenciário')
            DataField = 'IDPLANOPREV'
            DataSource = ds
            LookupTable = cdsPlano
            LookupField = 'IDPLANOPREV'
            Options = [loTitles]
            Style = csDropDownList
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            OrderByDisplay = False
            AllowClearKey = True
            ShowMatchText = True
          end
          object CmbPatro: TCMDBLookupCombo
            Left = 11
            Top = 76
            Width = 486
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'60'#9'Nome')
            DataField = 'IDPATRO'
            DataSource = ds
            LookupTable = cdsPatro
            LookupField = 'IDPATRO'
            Options = [loTitles]
            Style = csDropDownList
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            OrderByDisplay = False
            AllowClearKey = True
            ShowMatchText = True
          end
        end
      end
      object tsAlcadas: TTabSheet
        Caption = 'Alçadas'
        ImageIndex = 3
        object Label2: TLabel
          Left = 8
          Top = 20
          Width = 274
          Height = 13
          Caption = 'Quantidade de Dias parametrizados para Alçada'
        end
        object dbQntDiasAlcada: TwwDBEdit
          Left = 8
          Top = 48
          Width = 121
          Height = 21
          DataField = 'QNTDIASALCADAS'
          DataSource = ds
          TabOrder = 0
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 532
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Width = 33
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Left = 33
      end
      inherited sbtnProcurar: TToolbarButton97
        Left = 121
        Width = 16
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Left = 93
        Width = 28
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 253
    Width = 532
    inherited tb97Fundo: TToolbar97
      Left = 360
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 82
    Top = 247
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 302
    Top = 65535
  end
  inherited ImlPadrao: TImageList
    Left = 16
    Top = 247
  end
  inherited CmeCadastro: TCmEventosCadastro
    RepetirInsert = False
    Left = 360
    Top = 65535
  end
  inherited Cds: TCMClientDataSet
    FieldDefs = <
      item
        Name = 'IDPARAMCONTRATO'
        DataType = ftFloat
      end
      item
        Name = 'FLGTIPODESEMB'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'DATAINI'
        DataType = ftDateTime
      end
      item
        Name = 'DATAFIM'
        DataType = ftDateTime
      end
      item
        Name = 'AVISO'
        DataType = ftFloat
      end
      item
        Name = 'FLGENGLOBA'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end
      item
        Name = 'NUMDIASAVISOCORR'
        DataType = ftFloat
      end
      item
        Name = 'IDPESSOA'
        DataType = ftFloat
      end
      item
        Name = 'FLGNFIMPFISCAL'
        Attributes = [faFixed]
        DataType = ftString
        Size = 1
      end>
    StoreDefs = True
    Left = 260
    Top = 65535
  end
  inherited MontaSelect: TMontaSelect
    Tabelas.Strings = (
      'PARAMCONTRATO')
    Left = 432
    Top = 65535
  end
  object dsDisponiveis: TwwDataSource
    DataSet = cdsDisponiveis
    Left = 120
    Top = 192
  end
  object dsSelecionados: TwwDataSource
    DataSet = cdsSelecionados
    Left = 464
    Top = 192
  end
  object spTeste: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '   TA.*'
      'FROM'
      '   TIPOALTERADOR TA'
      'WHERE'
      '   (TA.IDPESSOA = 1) AND'
      '   (TA.RECPAG = '#39'R'#39') AND'
      '   (NOT EXISTS(SELECT I.CODALTERADOR'
      '               FROM IMPOSTOIMPNF I'
      #9#9#9'   WHERE (I.IDPESSOA = TA.IDPESSOA) AND'
      #9#9#9'         (I.CODALTERADOR = TA.CODALTERADOR)))'
      'ORDER BY TA.DESCRICAO')
    ClientDataSet = cdsSelecionados
    Left = 496
  end
  object cdsDisponiveis: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 40
    Top = 192
  end
  object cdsSelecionados: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 376
    Top = 192
    Data = {
      790400009619E0BD01000000180000001900000000000300000079040C434F44
      414C54455241444F520800040000000000084944504553534F41080004000000
      00000B434F44535542434F4E54410800040000000000094944454D5052455341
      080004000000000005504C414E4F08000400000000000E434F4443454E54524F
      435553544F01004900000002000753554254595045020049000A004669786564
      4368617200055749445448020002000A0008504C41434F4E5441010049000000
      02000753554254595045020049000A0046697865644368617200055749445448
      0200020012000652454350414701004900000002000753554254595045020049
      000A004669786564436861720005574944544802000200010009444553435249
      43414F01004900000001000557494454480200020023000B4143524553444543
      52455301004900000002000753554254595045020049000A0046697865644368
      61720005574944544802000200010008434F4E56455254450100490000000200
      0753554254595045020049000A00466978656443686172000557494454480200
      020001001149445553554152494F494E434C5553414F08000400000000000D54
      52474454494E434C5553414F08000800000000000F54524755534552494E434C
      5553414F0100490000000100055749445448020002001E0011464C4743414C43
      554C41494D504F53544F01004900000002000753554254595045020049000A00
      466978656443686172000557494454480200020001000E464C47414752454741
      424149584101004900000002000753554254595045020049000A004669786564
      43686172000557494454480200020001000E464C4741475245474153414C444F
      01004900000002000753554254595045020049000A0046697865644368617200
      0557494454480200020001000A434F44434F5252455350010049000000010005
      57494454480200020006000B434F444E41545552455A41010049000000020007
      53554254595045020049000A0046697865644368617200055749445448020002
      00040010464C47434F4E5441424E414241495841010049000000020007535542
      54595045020049000A0046697865644368617200055749445448020002000100
      0F464C4755534143435553544F444F4301004900000002000753554254595045
      020049000A00466978656443686172000557494454480200020001000C434F44
      54495052454344455301004900000002000753554254595045020049000A0046
      697865644368617200055749445448020002000F000852454350414752440100
      4900000002000753554254595045020049000A00466978656443686172000557
      494454480200020001000D464C47494E43494445495252460100490000000200
      0753554254595045020049000A00466978656443686172000557494454480200
      020001000A4F42534552564143414F04004B0000000200075355425459504502
      0049000500546578740005574944544802000200F40102000D44454641554C54
      5F4F5244455202008200010000000900044C4349440400010009080000}
  end
  object cdsPlano: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 176
    Top = 136
  end
  object dsPlano: TwwDataSource
    DataSet = cdsPlano
    Left = 232
    Top = 136
  end
  object cdsPatro: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 296
    Top = 136
  end
  object dsPatro: TwwDataSource
    DataSet = cdsPatro
    Left = 352
    Top = 136
  end
end
