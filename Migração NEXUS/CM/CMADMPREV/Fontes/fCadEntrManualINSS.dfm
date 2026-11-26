inherited frmCadEntrManualINSS: TfrmCadEntrManualINSS
  Left = 265
  Top = 148
  HelpContext = 160095
  Caption = 'Reembolso do INSS - Entrada Manual de Rubricas'
  ClientHeight = 433
  ClientWidth = 726
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 726
    Height = 347
    object pgcFundo: TPageControl
      Left = 1
      Top = 1
      Width = 724
      Height = 345
      ActivePage = tbsInsert
      Align = alClient
      TabOrder = 0
      object tbsInsert: TTabSheet
        Caption = 'Inclusão'
        object Label4: TLabel
          Left = 8
          Top = 10
          Width = 92
          Height = 13
          Caption = 'Nº do Benefício'
        end
        object Label7: TLabel
          Left = 8
          Top = 242
          Width = 75
          Height = 13
          Caption = 'Observações'
        end
        object lblMes: TLabel
          Left = 8
          Top = 202
          Width = 128
          Height = 13
          Caption = 'Mês/Ano de Cobrança'
        end
        object Label8: TLabel
          Left = 8
          Top = 162
          Width = 75
          Height = 13
          Caption = 'Mantenedora'
        end
        object Label9: TLabel
          Left = 208
          Top = 202
          Width = 136
          Height = 13
          Caption = 'Mês/Ano de Referência'
        end
        object Label10: TLabel
          Left = 408
          Top = 202
          Width = 30
          Height = 13
          Caption = 'Valor'
        end
        object Label11: TLabel
          Left = 432
          Top = 162
          Width = 45
          Height = 13
          Caption = 'Rubrica'
        end
        object Bevel1: TBevel
          Left = 8
          Top = 56
          Width = 697
          Height = 2
          Shape = bsTopLine
        end
        object Label1: TLabel
          Left = 8
          Top = 62
          Width = 33
          Height = 13
          Caption = 'Nome'
        end
        object Label2: TLabel
          Left = 448
          Top = 62
          Width = 55
          Height = 13
          Caption = 'Matrícula'
        end
        object Bevel2: TBevel
          Left = 8
          Top = 152
          Width = 697
          Height = 2
          Shape = bsTopLine
        end
        object Label12: TLabel
          Left = 8
          Top = 106
          Width = 56
          Height = 13
          Caption = 'Benefício'
        end
        object Label13: TLabel
          Left = 512
          Top = 202
          Width = 51
          Height = 13
          Caption = 'RMREAJ'
        end
        object Label14: TLabel
          Left = 616
          Top = 202
          Width = 48
          Height = 13
          Caption = 'APREAJ'
        end
        object Label15: TLabel
          Left = 153
          Top = 10
          Width = 116
          Height = 13
          Caption = 'Data de Início (DIB)'
        end
        object Label16: TLabel
          Left = 296
          Top = 162
          Width = 78
          Height = 13
          Caption = 'Rubrica INSS'
        end
        object Label5: TLabel
          Left = 278
          Top = 10
          Width = 101
          Height = 13
          Caption = 'Entidade Contábil'
        end
        object Label6: TLabel
          Left = 497
          Top = 10
          Width = 118
          Height = 13
          Caption = 'Plano Previdenciário'
        end
        object Label17: TLabel
          Left = 578
          Top = 106
          Width = 95
          Height = 13
          Caption = 'Código Sinônimo'
        end
        object rdgIdentificado: TRadioGroup
          Left = 576
          Top = 57
          Width = 129
          Height = 45
          Items.Strings = (
            'Identificado'
            'Não Identificado')
          TabOrder = 0
          OnClick = rdgIdentificadoClick
          OnExit = rdgIdentificadoExit
        end
        object EdBeneficio: TEdit
          Left = 8
          Top = 120
          Width = 185
          Height = 21
          TabOrder = 1
          OnExit = edtRubricaINSSExit
        end
        object edtNumProcINSS: TEdit
          Left = 8
          Top = 24
          Width = 131
          Height = 21
          TabOrder = 2
          OnExit = edtNumProcINSSExit
        end
        object memObs: TRichEdit
          Left = 8
          Top = 256
          Width = 497
          Height = 49
          TabOrder = 3
        end
        object cboMesCobranca: TComboBox
          Left = 8
          Top = 216
          Width = 129
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 4
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
        object DBspnAnoReferencia: TwwDBSpinEdit
          Left = 336
          Top = 216
          Width = 57
          Height = 21
          Increment = 1
          MaxValue = 3000
          MinValue = 1980
          TabOrder = 5
          UnboundDataType = wwDefault
        end
        object cboMesReferencia: TComboBox
          Left = 208
          Top = 216
          Width = 129
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 6
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
        object DBspnAnoCobranca: TwwDBSpinEdit
          Left = 136
          Top = 216
          Width = 57
          Height = 21
          Increment = 1
          MaxValue = 3000
          MinValue = 1980
          TabOrder = 7
          UnboundDataType = wwDefault
        end
        object edtValor: TDBRealEdit
          Left = 408
          Top = 216
          Width = 89
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          TabOrder = 8
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object edtRubricaINSS: TEdit
          Left = 296
          Top = 176
          Width = 121
          Height = 21
          TabOrder = 9
          OnExit = edtRubricaINSSExit
        end
        object edtNome: TEdit
          Left = 8
          Top = 76
          Width = 425
          Height = 21
          TabOrder = 10
        end
        object lblBeneficio: TStaticText
          Left = 200
          Top = 120
          Width = 359
          Height = 21
          AutoSize = False
          BorderStyle = sbsSunken
          TabOrder = 11
        end
        object edtDIB: TCMDateTimePicker
          Left = 153
          Top = 24
          Width = 113
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          ButtonStyle = cbsCustom
          Epoch = 1950
          ButtonGlyph.Data = {
            06050000424D06050000000000003604000028000000100000000D0000000100
            080000000000D000000000000000000000000001000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
            A6000020400000206000002080000020A0000020C0000020E000004000000040
            20000040400000406000004080000040A0000040C0000040E000006000000060
            20000060400000606000006080000060A0000060C0000060E000008000000080
            20000080400000806000008080000080A0000080C0000080E00000A0000000A0
            200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
            200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
            200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
            20004000400040006000400080004000A0004000C0004000E000402000004020
            20004020400040206000402080004020A0004020C0004020E000404000004040
            20004040400040406000404080004040A0004040C0004040E000406000004060
            20004060400040606000406080004060A0004060C0004060E000408000004080
            20004080400040806000408080004080A0004080C0004080E00040A0000040A0
            200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
            200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
            200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
            20008000400080006000800080008000A0008000C0008000E000802000008020
            20008020400080206000802080008020A0008020C0008020E000804000008040
            20008040400080406000804080008040A0008040C0008040E000806000008060
            20008060400080606000806080008060A0008060C0008060E000808000008080
            20008080400080806000808080008080A0008080C0008080E00080A0000080A0
            200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
            200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
            200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
            2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
            2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
            2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
            2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
            2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
            2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
            2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
            000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
            A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
            A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
            A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
            FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
            04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
            000000000000000000FF}
          ShowButton = True
          TabOrder = 12
        end
        object edtMatricula: TEdit
          Left = 448
          Top = 76
          Width = 113
          Height = 21
          TabOrder = 13
        end
        object edtRMREAJ: TDBRealEdit
          Left = 512
          Top = 216
          Width = 89
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          TabOrder = 14
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object edtAPREAJ: TDBRealEdit
          Left = 616
          Top = 216
          Width = 89
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          TabOrder = 15
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object lblRubrica: TStaticText
          Left = 488
          Top = 160
          Width = 217
          Height = 37
          AutoSize = False
          BorderStyle = sbsSunken
          TabOrder = 16
        end
        object lblIDRubrica: TStaticText
          Left = 432
          Top = 176
          Width = 49
          Height = 21
          AutoSize = False
          BorderStyle = sbsSunken
          TabOrder = 17
        end
        object rdgEntradaManual: TRadioGroup
          Left = 520
          Top = 248
          Width = 185
          Height = 57
          ItemIndex = 0
          Items.Strings = (
            'Informado pelo INSS'
            'Não Informado pelo INSS')
          TabOrder = 18
        end
        object DBcboBeneficio: TwwDBLookupCombo
          Left = 8
          Top = 120
          Width = 185
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'CODBENEFICIO'#9'6'#9'Código'#9'F'
            'NOME'#9'60'#9'Descrição'#9'F')
          LookupTable = qryLookBeneficio
          LookupField = 'IDBENEFICIO'
          Style = csDropDownList
          TabOrder = 19
          AutoDropDown = True
          ShowButton = True
          UseTFields = False
          AllowClearKey = True
          ShowMatchText = True
          OnChange = DBcboBeneficioChange
        end
        object DBcboMantenedor: TwwDBLookupCombo
          Left = 8
          Top = 176
          Width = 270
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'60'#9'Nome'#9'F'
            'CODMANTENEDORA'#9'10'#9'Código'#9'F')
          LookupTable = qryLookMantenedora
          LookupField = 'CODMANTENEDORA'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 20
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object DBcboEntidadeContabil: TwwDBLookupCombo
          Left = 278
          Top = 24
          Width = 207
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'50'#9'Nome'#9'F'
            'IDPLANOPREV'#9'10'#9'Código'#9'F')
          LookupTable = qryLookEntidadeContabil
          LookupField = 'IDPLANOPREV'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 21
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object LkcPlanoPrevidenciario: TwwDBLookupCombo
          Left = 497
          Top = 24
          Width = 209
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'50'#9'Nome'#9'F'
            'IDPLANOPREV'#9'10'#9'Código'#9'F')
          LookupTable = qryLookPLANO
          LookupField = 'IDPLANOPREV'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 22
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object edtCodSinonimo: TEdit
          Left = 578
          Top = 120
          Width = 124
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 10
          ParentFont = False
          TabOrder = 23
        end
      end
      object tbsDelete: TTabSheet
        Caption = 'Exclusão'
        ImageIndex = 1
        object Label3: TLabel
          Left = 8
          Top = 10
          Width = 122
          Height = 13
          Caption = 'Nº do Processo INSS'
        end
        object DBgrdTempConc: TwwDBGrid
          Left = 8
          Top = 212
          Width = 697
          Height = 93
          Selected.Strings = (
            'MESPROCESSAMENTO'#9'8'#9'Mês Cob.'
            'MESREFERENCIA'#9'8'#9'Mês Ref.'
            'VLRRUBRICA1'#9'12'#9'Valor'
            'CODRUBRICA1'#9'10'#9'Rub. INSS'
            'NOME'#9'22'#9'Nome'
            'OBS'#9'16'#9'Obs'
            'CODSINONIMO'#9'13'#9'Código Sinônimo')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dtsTempConc
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          ReadOnly = True
          TabOrder = 5
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          IndicatorColor = icBlack
        end
        object edtNumProcessoBusca: TEdit
          Left = 8
          Top = 24
          Width = 131
          Height = 21
          TabOrder = 0
          OnExit = edtNumProcINSSExit
        end
        object btnProcurar: TBitBtn
          Left = 139
          Top = 23
          Width = 24
          Height = 24
          TabOrder = 1
          OnClick = btnProcurarClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
            777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
            77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
            77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
            077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
            FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
            F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
            7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
            777777787FFF8777777777770000777777777777888877777777}
          NumGlyphs = 2
        end
        object Panel1: TPanel
          Left = 8
          Top = 62
          Width = 697
          Height = 22
          BevelOuter = bvNone
          BorderWidth = 1
          Caption = 'Registros Identificados (DetConc)'
          Color = clNavy
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindow
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          object btnExcluiDetConc: TBitBtn
            Left = 673
            Top = 0
            Width = 24
            Height = 23
            TabOrder = 0
            OnClick = btnExcluiDetConcClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              88888888888888FF8888888888888778888888888888F77F8888888888800F08
              8888888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0
              88888887788888F7F8888887FFFFFCF088888887FFF887878F888811111CCFFF
              08888877777F788F7F8881999991FFCF088887777777F87878F8999999991CFF
              F088777777777F88F78F998F9FF91FFCFF0877FF78877F8788789998FF991CCF
              FFF0777F88777F7888F7999FF8991FFFF77877788F777F88F778998F9FF91FF7
              788877FF7FF778F7788889999991777888888777777787788888889999988888
              8888887777788888888888888888888888888888888888888888}
            NumGlyphs = 2
          end
        end
        object Panel2: TPanel
          Left = 8
          Top = 190
          Width = 697
          Height = 22
          BevelOuter = bvNone
          BorderWidth = 1
          Caption = 'Registros NÃO Identificados (TempConc)'
          Color = clNavy
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindow
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          object btnExcluiTempConc: TBitBtn
            Left = 673
            Top = 0
            Width = 24
            Height = 23
            TabOrder = 0
            OnClick = btnExcluiTempConcClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              88888888888888FF8888888888888778888888888888F77F8888888888800F08
              8888888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0
              88888887788888F7F8888887FFFFFCF088888887FFF887878F888811111CCFFF
              08888877777F788F7F8881999991FFCF088887777777F87878F8999999991CFF
              F088777777777F88F78F998F9FF91FFCFF0877FF78877F8788789998FF991CCF
              FFF0777F88777F7888F7999FF8991FFFF77877788F777F88F778998F9FF91FF7
              788877FF7FF778F7788889999991777888888777777787788888889999988888
              8888887777788888888888888888888888888888888888888888}
            NumGlyphs = 2
          end
        end
        object DBgrdDetConc: TwwDBGrid
          Left = 8
          Top = 84
          Width = 697
          Height = 93
          Selected.Strings = (
            'MESCOBRANCA'#9'8'#9'Mês Cob.'
            'MESREFERENCIA'#9'8'#9'Mês Ref.'
            'VALORINSS'#9'13'#9'Valor'
            'NOME'#9'26'#9'Nome'
            'OBSERVACAO'#9'21'#9'Obs.'
            'CODSINONIMO'#9'14'#9'Código Sinônimo')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dtsDetConc
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          ReadOnly = True
          TabOrder = 3
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          IndicatorColor = icBlack
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 726
    inherited Toolbar971: TToolbar97
      inherited sbtnAlterar: TToolbarButton97
        Width = 25
        Enabled = False
        Visible = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Left = 110
        Width = 25
        Enabled = False
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Left = 85
        Width = 25
        Enabled = False
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 394
    Width = 726
    inherited tb97Fundo: TToolbar97
      Left = 554
      DockPos = 610
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 385
      DockPos = 441
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 984
    Top = 0
    TargetsData = (
      1
      2
      (
        'TRichEdit'
        'Text'
        0)
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 176
    Top = 0
  end
  inherited upd: TUpdateSQL
    Left = 208
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Left = 896
    Top = 0
  end
  inherited ImlPadrao: TImageList
    Left = 952
    Top = 0
  end
  inherited CmeCadastro: TCmEventosCadastro
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 256
    Top = 0
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT *'
      'FROM'
      '   DETCONCINSS'
      'WHERE'
      '       (:PIDPESSOA IS NULL ) OR (IDPESSOA =:PIDPESSOA)'
      '   AND ROWNUM = 1')
    Left = 144
    Top = 0
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryRubricaXINSS: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   RXI.IDRUBRICA,'
      '   RXI.RUBRICAINSS,'
      '   RXI.FLGRUBCENTRAL,'
      '   PVD.CODPROVDESC,'
      '   PVD.DESCRPROVDESC,'
      '   PVD.DESCRICAO'
      'FROM'
      '   RUBRICAXINSS RXI,'
      '   PROVDESC     PVD'
      'WHERE'
      '       RXI.RUBRICAINSS =:PRUBRICAINSS'
      '   and RXI.idrubrica   = PVD.IDPROVENTO(+)')
    ValidateWithMask = True
    Left = 208
    Top = 388
    ParamData = <
      item
        DataType = ftString
        Name = 'PRUBRICAINSS'
        ParamType = ptInput
      end>
    object qryRubricaXINSSIDRUBRICA: TFloatField
      FieldName = 'IDRUBRICA'
      Origin = 'BASEDADOS.RUBRICAXINSS.IDRUBRICA'
    end
    object qryRubricaXINSSRUBRICAINSS: TFloatField
      FieldName = 'RUBRICAINSS'
      Origin = 'BASEDADOS.RUBRICAXINSS.RUBRICAINSS'
    end
    object qryRubricaXINSSFLGRUBCENTRAL: TFloatField
      FieldName = 'FLGRUBCENTRAL'
      Origin = 'BASEDADOS.RUBRICAXINSS.FLGRUBCENTRAL'
    end
    object qryRubricaXINSSCODPROVDESC: TStringField
      FieldName = 'CODPROVDESC'
      Size = 15
    end
    object qryRubricaXINSSDESCRPROVDESC: TStringField
      FieldName = 'DESCRPROVDESC'
      Size = 130
    end
    object qryRubricaXINSSDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 130
    end
  end
  object qryLookMantenedora: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CODMANTENEDORA,'
      '   NOME,'
      '   FLGFUNDACAO,'
      '   IDPLANOPREV'
      'FROM'
      '   MANTENEDORA'
      'ORDER BY'
      '   NOME')
    ValidateWithMask = True
    Left = 208
    Top = 376
    object qryLookMantenedoraNOME: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 60
      FieldName = 'NOME'
      Origin = 'BASEDADOS.MANTENEDORA.NOME'
      Size = 60
    end
    object qryLookMantenedoraCODMANTENEDORA: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'CODMANTENEDORA'
      Origin = 'BASEDADOS.MANTENEDORA.CODMANTENEDORA'
      FixedChar = True
      Size = 10
    end
    object qryLookMantenedoraFLGFUNDACAO: TFloatField
      FieldName = 'FLGFUNDACAO'
      Origin = 'BASEDADOS.MANTENEDORA.FLGFUNDACAO'
      Visible = False
    end
    object qryLookMantenedoraIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.MANTENEDORA.IDPLANOPREV'
      Visible = False
    end
  end
  object qryBenefbfciario: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   P.NOME            AS NOME_PARTICIPANTE,'
      '   B.NOME            AS NOME_BENEFICIO,'
      '   PPC.NOME          AS PLAN_PREV_CONTABIL,'
      '   B.CODBENEFICIO,'
      '   BF.IDPESSOA,'
      '   BF.IDPLANOPREV,'
      '   BF.IDPLANPREVCONTAB,'
      '   BF.IDBENEFICIO,'
      '   BF.DATAINICIOINSS,'
      '   EL.MATRICULA,'
      '   PP.NOME AS NOMEPLANOPREV'
      'FROM'
      '   PESSOA            P,'
      '   BENEFBFCIARIO     BF,'
      '   ELEGPATRO         EL,'
      '   BENEFPLANPREV     BPP,'
      '   BENEFICIO         B,'
      '   PLANPREVCONTABIL  PPC,'
      '   PLANPREV PP'
      'WHERE'
      '       BF.NUMPROCINSS      =:PNUMPROCINSS'
      '   AND BPP.IDBENEFICIO     = BF.IDBENEFICIO'
      '   AND BPP.IDPLANOPREV     = BF.IDPLANOPREV'
      '   AND BPP.FLGREFERENCIA   = 1'
      '   AND P.IDPESSOA          = BF.IDPESSOA'
      '   AND EL.IDPESSOA         = BF.IDPESSOA'
      '   AND EL.IDPESSJUR        = BF.IDPESSJUR'
      '   AND B.IDBENEFICIO       = BF.IDBENEFICIO'
      '   AND BF.IDPLANPREVCONTAB = PPC.IDPLANOPREV(+)'
      '   AND BF.IDPLANOPREV      = PP.IDPLANOPREV(+)'
      ''
      ' ')
    ValidateWithMask = True
    Left = 120
    Top = 388
    ParamData = <
      item
        DataType = ftString
        Name = 'PNUMPROCINSS'
        ParamType = ptInput
      end>
    object qryBenefbfciarioIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS."CM.BENEFBFCIARIO".IDPESSOA'
      Visible = False
    end
    object qryBenefbfciarioIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS."CM.BENEFBFCIARIO".IDPLANOPREV'
      Visible = False
    end
    object qryBenefbfciarioIDBENEFICIO: TFloatField
      FieldName = 'IDBENEFICIO'
      Origin = 'BASEDADOS."CM.BENEFBFCIARIO".IDBENEFICIO'
      Visible = False
    end
    object qryBenefbfciarioNOME_PARTICIPANTE: TStringField
      FieldName = 'NOME_PARTICIPANTE'
      Origin = 'BASEDADOS."CM.PESSOA".NOME'
      Visible = False
      Size = 60
    end
    object qryBenefbfciarioNOME_BENEFICIO: TStringField
      FieldName = 'NOME_BENEFICIO'
      Origin = 'BASEDADOS."CM.BENEFICIO".NOME'
      Visible = False
      Size = 60
    end
    object qryBenefbfciarioMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Origin = 'BASEDADOS."CM.ELEGPATRO".MATRICULA'
      Visible = False
      Size = 13
    end
    object qryBenefbfciarioDATAINICIOINSS: TDateTimeField
      FieldName = 'DATAINICIOINSS'
      Origin = 'BASEDADOS."CM.BENEFBFCIARIO".DATAINICIOINSS'
      Visible = False
    end
    object qryBenefbfciarioCODBENEFICIO: TStringField
      FieldName = 'CODBENEFICIO'
      Origin = 'BASEDADOS."CM.BENEFICIO".CODBENEFICIO'
      Visible = False
      Size = 6
    end
    object qryBenefbfciarioPLAN_PREV_CONTABIL: TStringField
      FieldName = 'PLAN_PREV_CONTABIL'
      Size = 50
    end
    object qryBenefbfciarioNOMEPLANOPREV: TStringField
      FieldName = 'NOMEPLANOPREV'
      Size = 50
    end
    object qryBenefbfciarioIDPLANPREVCONTAB: TFloatField
      FieldName = 'IDPLANPREVCONTAB'
    end
  end
  object qryInsertTempConc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO TEMPCONCINSS'
      '('
      'IDPESSOA,'
      'NOME,'
      'CODRUBRICA1,'
      'CODRUBRICA2,'
      'CODRUBRICA3,'
      'CODRUBRICA4,'
      'VLRRUBRICA1,'
      'VLRRUBRICA2,'
      'VLRRUBRICA3,'
      'VLRRUBRICA4,'
      'DATALEITURA,'
      'OBS,'
      'MOTIVO,'
      'MESPROCESSAMENTO,'
      'MESREFERENCIA,'
      'NUMPROCINSS,'
      'ESPECIE,'
      'CODCONCESSORINSS,'
      'CODMANTENEDORINSS,'
      'MATRICULA,'
      'RMREAJ,'
      'APREAJ,'
      'FLGMANUAL,'
      'DIB,'
      'CODSINONIMO'
      ')'
      'VALUES'
      '('
      ':PIDPESSOA,'
      ':PNOME,'
      ':PCODRUBRICA1,'
      ':PCODRUBRICA2,'
      ':PCODRUBRICA3,'
      ':PCODRUBRICA4,'
      ':PVLRRUBRICA1,'
      ':PVLRRUBRICA2,'
      ':PVLRRUBRICA3,'
      ':PVLRRUBRICA4,'
      ':PDATALEITURA,'
      ':POBS,'
      ':PMOTIVO,'
      ':PMESPROCESSAMENTO,'
      ':PMESREFERENCIA,'
      ':PNUMPROCINSS,'
      ':PESPECIE,'
      ':PCODCONCESSORINSS,'
      ':PCODMANTENEDORINSS,'
      ':PMATRICULA,'
      ':PRMREAJ,'
      ':PAPREAJ,'
      ':PFLGMANUAL,'
      ':PDIB,'
      ':PCODSINONIMO'
      ')')
    ValidateWithMask = True
    Left = 328
    Top = 24
    ParamData = <
      item
        DataType = ftString
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PNOME'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PCODRUBRICA1'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PCODRUBRICA2'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PCODRUBRICA3'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PCODRUBRICA4'
        ParamType = ptInput
      end
      item
        DataType = ftCurrency
        Name = 'PVLRRUBRICA1'
        ParamType = ptInput
      end
      item
        DataType = ftCurrency
        Name = 'PVLRRUBRICA2'
        ParamType = ptInput
      end
      item
        DataType = ftCurrency
        Name = 'PVLRRUBRICA3'
        ParamType = ptInput
      end
      item
        DataType = ftCurrency
        Name = 'PVLRRUBRICA4'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDATALEITURA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'POBS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PMOTIVO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PMESPROCESSAMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PMESREFERENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PNUMPROCINSS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PESPECIE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PCODCONCESSORINSS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PCODMANTENEDORINSS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PMATRICULA'
        ParamType = ptInput
      end
      item
        DataType = ftCurrency
        Name = 'PRMREAJ'
        ParamType = ptInput
      end
      item
        DataType = ftCurrency
        Name = 'PAPREAJ'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFLGMANUAL'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PDIB'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PCODSINONIMO'
        ParamType = ptUnknown
      end>
  end
  object qryInsertDetConc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO DETCONCINSS'
      '('
      'FLGGLOSA,'
      'FLGTRATADO,'
      'NUMPROCINSS_AUX,'
      'OBSERVACAO,'
      'RUBRICAINSS,'
      'CODMANTENEDORA,'
      'MATRICULA,'
      'FLGMANUAL,'
      'RMREAJ,'
      'APREAJ,'
      'ESPECIE,'
      'IDRUBRICA,'
      'MESREFERENCIA,'
      'NUMPROCINSS,'
      'IDPESSOA,'
      'SEQUENCIAL,'
      'IDBENEFICIO,'
      'NOME,'
      'MESCOBRANCA,'
      'SINONIMO,'
      'IDPLANOPREV,'
      'VALORINSS,'
      'VALORMANT,'
      'CODCONCESSORINSS,'
      'CODMANTENEDORINSS,'
      'FLGATIVO,'
      'DIB,'
      'IDPLANOPREVPREV,'
      'CODSINONIMO'
      ')'
      'VALUES'
      '('
      ':PFLGGLOSA,'
      ':PFLGTRATADO,'
      ':PNUMPROCINSS_AUX,'
      ':POBSERVACAO,'
      ':PRUBRICAINSS,'
      ':PCODMANTENEDORA,'
      ':PMATRICULA,'
      ':PFLGMANUAL,'
      ':PRMREAJ,'
      ':PAPREAJ,'
      ':PESPECIE,'
      ':PIDRUBRICA,'
      ':PMESREFERENCIA,'
      ':PNUMPROCINSS,'
      ':PIDPESSOA,'
      ':PSEQUENCIAL,'
      ':PIDBENEFICIO,'
      ':PNOME,'
      ':PMESCOBRANCA,'
      ':PSINONIMO,'
      ':PIDPLANOPREV,'
      ':PVALORINSS,'
      ':PVALORMANT,'
      ':PCODCONCESSORINSS,'
      ':PCODMANTENEDORINSS,'
      ':PFLGATIVO,'
      ':PDIB,'
      ':PIDPLANOPREVPREV,'
      ':PCODSINONIMO'
      ')')
    ValidateWithMask = True
    Left = 328
    ParamData = <
      item
        DataType = ftString
        Name = 'PFLGGLOSA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PFLGTRATADO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PNUMPROCINSS_AUX'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'POBSERVACAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PRUBRICAINSS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PCODMANTENEDORA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PMATRICULA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PFLGMANUAL'
        ParamType = ptInput
      end
      item
        DataType = ftCurrency
        Name = 'PRMREAJ'
        ParamType = ptInput
      end
      item
        DataType = ftCurrency
        Name = 'PAPREAJ'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PESPECIE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PIDRUBRICA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PMESREFERENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PNUMPROCINSS'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PSEQUENCIAL'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PIDBENEFICIO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PNOME'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PMESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PSINONIMO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftCurrency
        Name = 'PVALORINSS'
        ParamType = ptInput
      end
      item
        DataType = ftCurrency
        Name = 'PVALORMANT'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PCODCONCESSORINSS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PCODMANTENEDORINSS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PFLGATIVO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'PDIB'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PIDPLANOPREVPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PCODSINONIMO'
        ParamType = ptUnknown
      end>
  end
  object qryDIB: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   D.MATRICULA,'
      '   D.IDPESSOA ,'
      '   NVL(D.NOME,PS.NOME) AS NOME,'
      '   D.CODMANTENEDORA,'
      '   D.DIB,'
      '   D.IDBENEFICIO,'
      '   D.IDPLANOPREV,'
      '   D.IDPLANOPREVPREV,'
      '   PP.NOME AS NOMEPLANOPREV,'
      ''
      '   M.NOME            AS NOME_MANTENEDORA,'
      ''
      '   P.NOME            AS PLAN_PREV_CONTABIL,'
      ''
      '   B.CODBENEFICIO,'
      '   B.NOME            AS NOME_BENEFICIO'
      'FROM'
      '   DETCONCINSS      D,'
      '   BENEFICIO        B,'
      '   MANTENEDORA      M,'
      '   PLANPREVCONTABIL P,'
      '   PLANPREV PP,'
      '   PESSOA           PS,'
      '   ('
      '   SELECT'
      '      MAX(MESCOBRANCA) MESCOB'
      '   FROM'
      '      DETCONCINSS'
      '   WHERE'
      '      NUMPROCINSS =:PNUMPROCINSS'
      '   ) MAXDET'
      'WHERE'
      '       D.NUMPROCINSS    =:PNUMPROCINSS'
      '   AND D.MESCOBRANCA    = MAXDET.MESCOB'
      '   AND D.IDBENEFICIO    = B.IDBENEFICIO(+)'
      '   AND D.CODMANTENEDORA = M.CODMANTENEDORA(+)'
      '   AND D.IDPLANOPREV    = P.IDPLANOPREV(+)'
      '   AND D.IDPESSOA       = PS.IDPESSOA(+)'
      '   AND D.IDPLANOPREVPREV = PP.IDPLANOPREV(+)'
      ''
      '')
    ValidateWithMask = True
    Left = 120
    Top = 376
    ParamData = <
      item
        DataType = ftString
        Name = 'PNUMPROCINSS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PNUMPROCINSS'
        ParamType = ptInput
      end>
    object qryDIBMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 13
    end
    object qryDIBIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryDIBNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryDIBCODMANTENEDORA: TStringField
      FieldName = 'CODMANTENEDORA'
      FixedChar = True
      Size = 10
    end
    object qryDIBDIB: TDateTimeField
      FieldName = 'DIB'
    end
    object qryDIBIDBENEFICIO: TFloatField
      FieldName = 'IDBENEFICIO'
    end
    object qryDIBIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryDIBNOME_MANTENEDORA: TStringField
      FieldName = 'NOME_MANTENEDORA'
      Size = 60
    end
    object qryDIBPLAN_PREV_CONTABIL: TStringField
      FieldName = 'PLAN_PREV_CONTABIL'
      Size = 50
    end
    object qryDIBCODBENEFICIO: TStringField
      FieldName = 'CODBENEFICIO'
      Size = 6
    end
    object qryDIBNOME_BENEFICIO: TStringField
      FieldName = 'NOME_BENEFICIO'
      Size = 60
    end
    object qryDIBIDPLANOPREVPREV: TFloatField
      FieldName = 'IDPLANOPREVPREV'
    end
    object qryDIBNOMEPLANOPREV: TStringField
      FieldName = 'NOMEPLANOPREV'
      Size = 50
    end
  end
  object qrySequencial: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   MAX(SEQUENCIAL) AS SEQUENCIAL'
      'FROM'
      '   DETCONCINSS'
      'WHERE'
      '       MESCOBRANCA =:PMESCOBRANCA'
      '   AND IDPESSOA    =:PIDPESSOA')
    ValidateWithMask = True
    Left = 32
    Top = 388
    ParamData = <
      item
        DataType = ftString
        Name = 'PMESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end>
    object qrySequencialSEQUENCIAL: TFloatField
      FieldName = 'SEQUENCIAL'
      Origin = 'BASEDADOS."CM.DETCONCINSS".SEQUENCIAL'
    end
  end
  object qryLookEntidadeContabil: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM   PLANPREVCONTABIL'
      'WHERE  NVL(ATIVO,'#39'S'#39') = '#39'S'#39
      'ORDER BY NOME'
      '')
    ValidateWithMask = True
    Left = 320
    Top = 388
    object qryLookEntidadeContabilNOME: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 50
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PLANPREVCONTABIL.NOME'
      Size = 50
    end
    object qryLookEntidadeContabilIDPLANOPREV: TFloatField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.PLANPREVCONTABIL.IDPLANOPREV'
    end
    object qryLookEntidadeContabilCODORCAMENTO: TStringField
      FieldName = 'CODORCAMENTO'
      Origin = 'BASEDADOS.PLANPREVCONTABIL.CODORCAMENTO'
      Visible = False
      Size = 2
    end
    object qryLookEntidadeContabilSIGLAORCAMENTO: TStringField
      FieldName = 'SIGLAORCAMENTO'
      Origin = 'BASEDADOS.PLANPREVCONTABIL.SIGLAORCAMENTO'
      Visible = False
      Size = 10
    end
    object qryLookEntidadeContabilCODSPC: TStringField
      FieldName = 'CODSPC'
      Origin = 'BASEDADOS.PLANPREVCONTABIL.CODSPC'
      Visible = False
      Size = 10
    end
  end
  object qryEntidadeContabil: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDPARAM'
      'FROM'
      '   PESSOAPARAM'
      'WHERE'
      '       IDPESSOA =:PIDPESSOA'
      '   AND IDPARAM  IN (1, 9)'
      '   AND VALOR    = '#39'S'#39)
    ValidateWithMask = True
    Left = 32
    Top = 376
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end>
    object qryEntidadeContabilIDPARAM: TFloatField
      FieldName = 'IDPARAM'
    end
  end
  object qryLookBeneficio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   B.IDBENEFICIO,'
      '   B.CODBENEFICIO,'
      '   B.NOME'
      'FROM'
      '   BENEFICIO B'
      'ORDER BY B.CODBENEFICIO')
    ValidateWithMask = True
    Left = 120
    Top = 364
    object qryLookBeneficioCODBENEFICIO: TStringField
      DisplayLabel = 'Código'
      DisplayWidth = 6
      FieldName = 'CODBENEFICIO'
      Origin = 'BASEDADOS.BENEFICIO.CODBENEFICIO'
      Size = 6
    end
    object qryLookBeneficioNOME: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'NOME'
      Origin = 'BASEDADOS.BENEFICIO.NOME'
      Size = 60
    end
    object qryLookBeneficioIDBENEFICIO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDBENEFICIO'
      Origin = 'BASEDADOS.BENEFICIO.IDBENEFICIO'
      Visible = False
    end
  end
  object qryLookPLANO: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM   PLANPREV'
      'ORDER BY NOME'
      '')
    ValidateWithMask = True
    Left = 320
    Top = 376
    object StringField1: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 50
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PLANPREVCONTABIL.NOME'
      Size = 50
    end
    object FloatField1: TFloatField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.PLANPREVCONTABIL.IDPLANOPREV'
    end
  end
  object qryDeleteTempConc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM TEMPCONCINSS TCI'
      'WHERE'
      '      TCI.NUMPROCINSS       = :PNUMPROCINSS'
      '  AND TCI.CODRUBRICA1       = :PCODRUBRICA1'
      '  AND TCI.MESPROCESSAMENTO  = :PMESPROCESSAMENTO'
      '  AND TCI.MESREFERENCIA     = :PMESREFERENCIA'
      '  AND TCI.VLRRUBRICA1       = :PVLRRUBRICA1'
      '  AND TCI.FLGMANUAL         IN (1, 2)')
    ValidateWithMask = True
    Left = 448
    Top = 20
    ParamData = <
      item
        DataType = ftString
        Name = 'PNUMPROCINSS'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PCODRUBRICA1'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PMESPROCESSAMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PMESREFERENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftCurrency
        Name = 'PVLRRUBRICA1'
        ParamType = ptInput
      end>
  end
  object qryDeleteDetConc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM DETCONCINSS DCI'
      'WHERE'
      '      DCI.NUMPROCINSS   =:PNUMPROCINSS'
      '  AND DCI.IDPESSOA      =:PIDPESSOA'
      '  AND DCI.IDRUBRICA     =:PIDRUBRICA'
      '  AND DCI.MESCOBRANCA   =:PMESCOBRANCA'
      '  AND DCI.MESREFERENCIA =:PMESREFERENCIA'
      '  AND DCI.VALORINSS     =:PVALOR'
      '  AND DCI.FLGMANUAL     IN (1, 2)')
    ValidateWithMask = True
    Left = 448
    ParamData = <
      item
        DataType = ftString
        Name = 'PNUMPROCINSS'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDRUBRICA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PMESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PMESREFERENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftCurrency
        Name = 'PVALOR'
        ParamType = ptInput
      end>
  end
  object qryTempConc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  TCI.NUMPROCINSS,'
      '  TCI.NOME,'
      ''
      '  TCI.CODRUBRICA1,'
      '  TCI.VLRRUBRICA1,'
      ''
      '  TCI.MESPROCESSAMENTO,'
      '  TCI.MESREFERENCIA,'
      ''
      '  TCI.ESPECIE,'
      ''
      '  TCI.MATRICULA,'
      ''
      '  TCI.RMREAJ,'
      '  TCI.APREAJ,'
      ''
      '  TCI.OBS,'
      ''
      '  TCI.FLGMANUAL,'
      '  TCI.CODSINONIMO, TCI.DTINICIOCRED, TCI.DTFIMCRED'
      ''
      'FROM'
      '  TEMPCONCINSS TCI'
      ''
      'WHERE'
      '      TCI.NUMPROCINSS =:PNUMPROCINSS'
      '  AND TCI.FLGMANUAL   IN (1, 2)'
      ''
      'ORDER BY'
      
        '  TCI.NOME, TCI.MESPROCESSAMENTO, TCI.MESREFERENCIA, TCI.CODRUBR' +
        'ICA1, TCI.VLRRUBRICA1')
    ValidateWithMask = True
    Left = 544
    Top = 16
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PNUMPROCINSS'
        ParamType = ptInput
      end>
    object qryTempConcMESPROCESSAMENTO: TStringField
      DisplayLabel = 'Mês Cob.'
      DisplayWidth = 8
      FieldName = 'MESPROCESSAMENTO'
      Origin = 'BASEDADOS.TEMPCONCINSS.MESPROCESSAMENTO'
      FixedChar = True
      Size = 7
    end
    object qryTempConcMESREFERENCIA: TStringField
      DisplayLabel = 'Mês Ref.'
      DisplayWidth = 8
      FieldName = 'MESREFERENCIA'
      Origin = 'BASEDADOS.TEMPCONCINSS.MESREFERENCIA'
      FixedChar = True
      Size = 7
    end
    object qryTempConcVLRRUBRICA1: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 12
      FieldName = 'VLRRUBRICA1'
      Origin = 'BASEDADOS.TEMPCONCINSS.VLRRUBRICA1'
    end
    object qryTempConcCODRUBRICA1: TFloatField
      DisplayLabel = 'Rub. INSS'
      DisplayWidth = 10
      FieldName = 'CODRUBRICA1'
      Origin = 'BASEDADOS.TEMPCONCINSS.CODRUBRICA1'
    end
    object qryTempConcNOME: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 22
      FieldName = 'NOME'
      Origin = 'BASEDADOS.TEMPCONCINSS.NOME'
      Size = 60
    end
    object qryTempConcOBS: TStringField
      DisplayLabel = 'Obs'
      DisplayWidth = 16
      FieldName = 'OBS'
      Origin = 'BASEDADOS.TEMPCONCINSS.OBS'
      Size = 200
    end
    object qryTempConcCODSINONIMO: TFloatField
      DisplayLabel = 'Código Sinônimo'
      DisplayWidth = 13
      FieldName = 'CODSINONIMO'
    end
    object qryTempConcNUMPROCINSS: TStringField
      FieldName = 'NUMPROCINSS'
      Origin = 'BASEDADOS.TEMPCONCINSS.NUMPROCINSS'
      Visible = False
      Size = 15
    end
    object qryTempConcESPECIE: TStringField
      DisplayLabel = 'Espécie'
      DisplayWidth = 10
      FieldName = 'ESPECIE'
      Origin = 'BASEDADOS.TEMPCONCINSS.ESPECIE'
      Visible = False
      Size = 6
    end
    object qryTempConcMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Origin = 'BASEDADOS.TEMPCONCINSS.MATRICULA'
      Visible = False
      Size = 13
    end
    object qryTempConcRMREAJ: TFloatField
      FieldName = 'RMREAJ'
      Origin = 'BASEDADOS.TEMPCONCINSS.RMREAJ'
      Visible = False
    end
    object qryTempConcAPREAJ: TFloatField
      FieldName = 'APREAJ'
      Origin = 'BASEDADOS.TEMPCONCINSS.APREAJ'
      Visible = False
    end
    object qryTempConcFLGMANUAL: TFloatField
      FieldName = 'FLGMANUAL'
      Origin = 'BASEDADOS.TEMPCONCINSS.FLGMANUAL'
      Visible = False
    end
    object qryTempConcDTINICIOCRED: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DTINICIOCRED'
      Visible = False
    end
    object qryTempConcDTFIMCRED: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DTFIMCRED'
      Visible = False
    end
  end
  object qryDetConc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  DCI.IDPESSOA,'
      '  DCI.MESREFERENCIA, DCI.MESCOBRANCA,'
      '  DCI.NUMPROCINSS, DCI.DIB,'
      '  DCI.IDRUBRICA, DCI.VALORINSS,'
      '  DCI.RMREAJ, DCI.APREAJ,'
      '  DCI.FLGMANUAL, DCI.FLGTRATADO,'
      '  DCI.ESPECIE,'
      '  DCI.OBSERVACAO,'
      ''
      '  DCI.CODCONCESSORINSS, DCI.CODMANTENEDORINSS, DCI.RUBRICAINSS,'
      ''
      '  PES.NOME,'
      ''
      '  PVD.CODPROVDESC,'
      ' DCI.CODSINONIMO, DCI.DTINICIOCRED, DCI.DTFIMCRED'
      ''
      'FROM'
      '  DETCONCINSS DCI,'
      '  PESSOA      PES,'
      '  PROVDESC    PVD'
      ''
      'WHERE'
      '      DCI.NUMPROCINSS =:PNUMPROCINSS'
      '--  AND DCI.IDPESSOA    = PES.IDPESSOA --SIG90818'
      '    AND DCI.IDPESSOA    = PES.IDPESSOA(+) --SIG90818'
      '  AND DCI.IDRUBRICA   = PVD.IDPROVENTO'
      '  AND DCI.FLGMANUAL   IN (1, 2)'
      ''
      'ORDER BY'
      '  PES.NOME, DCI.MESCOBRANCA, DCI.MESREFERENCIA, DCI.IDRUBRICA')
    ValidateWithMask = True
    Left = 544
    Top = 72
    ParamData = <
      item
        DataType = ftString
        Name = 'PNUMPROCINSS'
        ParamType = ptInput
      end>
    object qryDetConcMESCOBRANCA: TStringField
      DisplayLabel = 'Mês Cob.'
      DisplayWidth = 8
      FieldName = 'MESCOBRANCA'
      Origin = 'BASEDADOS.DETCONCINSS.MESCOBRANCA'
      FixedChar = True
      Size = 7
    end
    object qryDetConcMESREFERENCIA: TStringField
      DisplayLabel = 'Mês Ref.'
      DisplayWidth = 8
      FieldName = 'MESREFERENCIA'
      Origin = 'BASEDADOS.DETCONCINSS.MESREFERENCIA'
      FixedChar = True
      Size = 7
    end
    object qryDetConcVALORINSS: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 13
      FieldName = 'VALORINSS'
      Origin = 'BASEDADOS.DETCONCINSS.VALORINSS'
    end
    object qryDetConcNOME: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 26
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PESSOA.NOME'
      Size = 60
    end
    object qryDetConcOBSERVACAO: TStringField
      DisplayLabel = 'Obs.'
      DisplayWidth = 21
      FieldName = 'OBSERVACAO'
      Origin = 'BASEDADOS.DETCONCINSS.OBSERVACAO'
      Size = 200
    end
    object qryDetConcCODSINONIMO: TFloatField
      DisplayLabel = 'Código Sinônimo'
      DisplayWidth = 14
      FieldName = 'CODSINONIMO'
    end
    object qryDetConcNUMPROCINSS: TStringField
      DisplayLabel = 'Nº Processo'
      DisplayWidth = 15
      FieldName = 'NUMPROCINSS'
      Origin = 'BASEDADOS.DETCONCINSS.NUMPROCINSS'
      Visible = False
      Size = 15
    end
    object qryDetConcDIB: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DIB'
      Origin = 'BASEDADOS.DETCONCINSS.DIB'
      Visible = False
    end
    object qryDetConcIDRUBRICA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDRUBRICA'
      Origin = 'BASEDADOS.DETCONCINSS.IDRUBRICA'
      Visible = False
    end
    object qryDetConcRMREAJ: TFloatField
      DisplayWidth = 10
      FieldName = 'RMREAJ'
      Origin = 'BASEDADOS.DETCONCINSS.RMREAJ'
      Visible = False
    end
    object qryDetConcAPREAJ: TFloatField
      DisplayWidth = 10
      FieldName = 'APREAJ'
      Origin = 'BASEDADOS.DETCONCINSS.APREAJ'
      Visible = False
    end
    object qryDetConcFLGMANUAL: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGMANUAL'
      Origin = 'BASEDADOS.DETCONCINSS.FLGMANUAL'
      Visible = False
    end
    object qryDetConcFLGTRATADO: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGTRATADO'
      Origin = 'BASEDADOS.DETCONCINSS.FLGTRATADO'
      Visible = False
    end
    object qryDetConcESPECIE: TStringField
      DisplayWidth = 6
      FieldName = 'ESPECIE'
      Origin = 'BASEDADOS.DETCONCINSS.ESPECIE'
      Visible = False
      FixedChar = True
      Size = 6
    end
    object qryDetConcCODCONCESSORINSS: TStringField
      DisplayWidth = 10
      FieldName = 'CODCONCESSORINSS'
      Origin = 'BASEDADOS.DETCONCINSS.CODCONCESSORINSS'
      Visible = False
      Size = 10
    end
    object qryDetConcCODMANTENEDORINSS: TStringField
      DisplayWidth = 10
      FieldName = 'CODMANTENEDORINSS'
      Origin = 'BASEDADOS.DETCONCINSS.CODMANTENEDORINSS'
      Visible = False
      Size = 10
    end
    object qryDetConcRUBRICAINSS: TFloatField
      DisplayWidth = 10
      FieldName = 'RUBRICAINSS'
      Origin = 'BASEDADOS.DETCONCINSS.RUBRICAINSS'
      Visible = False
    end
    object qryDetConcCODPROVDESC: TStringField
      DisplayWidth = 15
      FieldName = 'CODPROVDESC'
      Origin = 'BASEDADOS.PROVDESC.CODPROVDESC'
      Visible = False
      Size = 15
    end
    object qryDetConcIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.DETCONCINSS.IDPESSOA'
      Visible = False
    end
    object qryDetConcDTINICIOCRED: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DTINICIOCRED'
      Visible = False
    end
    object qryDetConcDTFIMCRED: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DTFIMCRED'
      Visible = False
    end
  end
  object dtsTempConc: TwwDataSource
    DataSet = qryTempConc
    Left = 624
    Top = 16
  end
  object dtsDetConc: TwwDataSource
    DataSet = qryDetConc
    Left = 624
    Top = 72
  end
end
