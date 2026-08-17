inherited frmConsHst: TfrmConsHst
  Left = 7
  Top = 107
  HelpContext = 4170029
  Caption = 'Consulta Históricos da Pessoa'
  ClientHeight = 408
  ClientWidth = 776
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Top = 46
    Width = 776
    Height = 323
    object pnlDataHist: TPanel
      Left = 1
      Top = 1
      Width = 774
      Height = 41
      Align = alTop
      TabOrder = 0
      object Label60: TLabel
        Left = 247
        Top = 12
        Width = 67
        Height = 13
        Caption = 'A Partir De:'
      end
      object dtedHist: TCMDateTimePicker
        Left = 320
        Top = 9
        Width = 100
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
        TabOrder = 0
        OnChange = bbtnConfirmarClick
      end
    end
    object pgctrlHistoricos: TPageControl
      Left = 1
      Top = 42
      Width = 774
      Height = 280
      ActivePage = tbshContraCheque
      Align = alClient
      TabOrder = 1
      object tbshContraCheque: TTabSheet
        Caption = 'Contracheque'
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 766
          Height = 55
          Align = alTop
          TabOrder = 0
          object Label10: TLabel
            Left = 528
            Top = 10
            Width = 61
            Height = 13
            Caption = 'Descontos'
          end
          object Label11: TLabel
            Left = 626
            Top = 10
            Width = 44
            Height = 13
            Caption = 'Líquido'
          end
          object Label3: TLabel
            Left = 430
            Top = 10
            Width = 58
            Height = 13
            Caption = 'Proventos'
          end
          object sbtnImprimirCCheque: TSpeedButton
            Left = 718
            Top = 11
            Width = 25
            Height = 33
            Hint = 'Imprimir Contracheque'
            Glyph.Data = {
              DE010000424DDE01000000000000760000002800000024000000120000000100
              0400000000006801000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888880008
              8888888888888F7778FF8888000088888800877008888888888F7787F778FF88
              0000888800880007700888888F778F7778F778FF000088008800877007700888
              778F7787F778F778000080880088877770077087FF778887F88778F700008700
              888887777770008777888887FF888777000080888888F77777777087F8888F77
              78FF88870000878888FF888777777087F88F77888778FF8700008788FF888888
              87777087FF778888888778F7000087FF88899888888770877788888888888777
              000087888AA88888808880878FF8888888FFF8F700008877F888888FF0877888
              778FF88FF77787780000888877F87FFFFF08888888778F77788878F800008888
              88777FFFFFF088888888777FF888878F00008888888877FFFFFF008888888877
              8F888F77000088888888887FFF7788888888888878FF77880000888888888887
              7788888888888888877788880000888888888888888888888888888888888888
              0000}
            Margin = 0
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = sbtnImprimirCChequeClick
          end
          object grpMesRef: TGroupBox
            Left = 247
            Top = 5
            Width = 175
            Height = 45
            Caption = ' Mês e Ano de Referência '
            TabOrder = 0
            object cmbMes: TComboBox
              Left = 7
              Top = 16
              Width = 100
              Height = 21
              Style = csDropDownList
              ItemHeight = 13
              TabOrder = 0
              OnChange = cmbMesChange
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
              Left = 114
              Top = 16
              Width = 55
              Height = 22
              MaxValue = 0
              MinValue = 0
              TabOrder = 1
              Value = 0
              OnChange = cmbMesChange
            end
          end
          object dblcMotivo: TwwDBLookupCombo
            Left = 7
            Top = 19
            Width = 232
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'50'#9'DESCRICAO'#9'F')
            LookupTable = qryMotivoFolha
            LookupField = 'IDMOTIVO'
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
            AllowClearKey = True
            OnCloseUp = dblcMotivoCloseUp
          end
          object redProvento: TRealEdit
            Left = 430
            Top = 24
            Width = 90
            Height = 21
            Alignment = taRightJustify
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '      0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 2
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object redDesconto: TRealEdit
            Left = 528
            Top = 24
            Width = 90
            Height = 21
            Alignment = taRightJustify
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '      0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 3
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object redLiquido: TRealEdit
            Left = 626
            Top = 24
            Width = 90
            Height = 21
            Alignment = taRightJustify
            Color = clGray
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWhite
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Lines.Strings = (
              '      0,00')
            ParentFont = False
            ReadOnly = True
            TabOrder = 4
            WordWrap = False
            IntDigits = 10
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
          end
          object cbxNumDep: TCheckBox
            Left = 746
            Top = 23
            Width = 16
            Height = 17
            Hint = 'Imprimir Nº Dependentes IR'
            Checked = True
            ParentShowHint = False
            ShowHint = True
            State = cbChecked
            TabOrder = 5
          end
        end
        object dbgrHistRub: TwwDBGrid
          Left = 0
          Top = 55
          Width = 766
          Height = 197
          Selected.Strings = (
            'DESCRICAO'#9'50'#9'Nome da Rubrica'#9'No'
            'REFERENCIA'#9'10'#9'Referência'#9'No'
            'VALORPROVENTO'#9'13'#9'Valor'#9'No'
            'TIPO'#9'8'#9'Tipo'#9'No')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsHistRub
          TabOrder = 1
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
      object tbshCursos: TTabSheet
        Caption = 'Cursos'
        object dbgrCursos: TwwDBGrid
          Left = 0
          Top = 0
          Width = 758
          Height = 244
          Selected.Strings = (
            'DESCRICAO'#9'30'#9'Nome do Curso'
            'DATPLINI'#9'10'#9'Início Plan.'
            'DATREINI'#9'10'#9'Início Real'
            'DATREFIM'#9'10'#9'Término'
            'DUR_TOT'#9'10'#9'Carga Horária'
            'AVTEOR'#9'10'#9'Aval. Teórica'
            'AVPRAT'#9'10'#9'Aval. Prática')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsCursos
          TabOrder = 0
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
      object tbshAvaliacoes: TTabSheet
        Caption = 'Avaliações'
        object dbgrAval: TwwDBGrid
          Left = 0
          Top = 0
          Width = 680
          Height = 276
          Selected.Strings = (
            'DESCRTIPOAVAL'#9'40'#9'Tipo de Avaliação, Teste, Entrevista'
            'DATAPLAN'#9'10'#9'Data Planejada'
            'DATAREAL'#9'10'#9'Data Efetiva'
            'AVALIACAO'#9'10'#9'Pontuação')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsAval
          TabOrder = 0
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
      object tbshEvolucao: TTabSheet
        Caption = 'Evolução'
        object dbgrEvol: TwwDBGrid
          Left = 0
          Top = 33
          Width = 758
          Height = 211
          Selected.Strings = (
            'DATAALTERFUNC'#9'10'#9'Data Efet.'
            'DESCRICAO'#9'30'#9'Tipo de Ação'
            'TITULO'#9'30'#9'Cargo'
            'CCUSTO'#9'10'#9'Centro de Custo'
            'SALARIO'#9'10'#9'Salário'
            'TIPOPAGAMENTO'#9'4'#9'Base'
            'PERC_REAJ'#9'10'#9'Percentual')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsEvol
          TabOrder = 0
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
        object pnlEtiqCTPS: TPanel
          Left = 0
          Top = 0
          Width = 758
          Height = 33
          Align = alTop
          TabOrder = 1
          object spbtnEtiqCTPS: TSpeedButton
            Left = 367
            Top = 3
            Width = 25
            Height = 27
            Hint = 'Imprimir Etiqueta CTPS do Evento Apontado'
            Glyph.Data = {
              DE010000424DDE01000000000000760000002800000024000000120000000100
              0400000000006801000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888880008
              8888888888888F7778FF8888000088888800877008888888888F7787F778FF88
              0000888800880007700888888F778F7778F778FF000088008800877007700888
              778F7787F778F778000080880088877770077087FF778887F88778F700008700
              888887777770008777888887FF888777000080888888F77777777087F8888F77
              78FF88870000878888FF888777777087F88F77888778FF8700008788FF888888
              87777087FF778888888778F7000087FF88899888888770877788888888888777
              000087888AA88888808880878FF8888888FFF8F700008877F888888FF0877888
              778FF88FF77787780000888877F87FFFFF08888888778F77788878F800008888
              88777FFFFFF088888888777FF888878F00008888888877FFFFFF008888888877
              8F888F77000088888888887FFF7788888888888878FF77880000888888888887
              7788888888888888877788880000888888888888888888888888888888888888
              0000}
            Margin = 0
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = spbtnEtiqCTPSClick
          end
        end
      end
      object tbshBeneficios: TTabSheet
        Caption = 'Benefícios'
        object dbgrBenef: TwwDBGrid
          Left = 0
          Top = 0
          Width = 758
          Height = 244
          Selected.Strings = (
            'DESCRICAO'#9'43'#9'Descrição'
            'ANOMESINICIO'#9'7'#9'Mês Ref.'
            'FLGPERMANENTE'#9'10'#9'Permanente?'
            'PARCELAS'#9'10'#9'Parcelas'
            'NUMOCORRENCIAS'#9'10'#9'Ocorrências'
            'VALORRUBRICA'#9'12'#9'        Valor'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsBenef
          TabOrder = 0
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
      object tbshProntuario: TTabSheet
        Caption = 'Prontuário'
        object dbgrMedic: TwwDBGrid
          Left = 0
          Top = 0
          Width = 758
          Height = 244
          Selected.Strings = (
            'DESCRTIPOOCMED'#9'40'#9'Tipo de Ocorrência'
            'DATAPLAN'#9'10'#9'Data Prevista ou Início'
            'DATAREAL'#9'10'#9'Data Real ou Retorno'
            'LICENCA'#9'10'#9'Licença'
            'EXAMINADOR'#9'40'#9'Médico ou Entidade'
            'AVALIACAO'#9'10'#9'Avaliação')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsMedic
          TabOrder = 0
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
      object tbshFerias: TTabSheet
        Caption = 'Férias'
        object dbgrFerais: TwwDBGrid
          Left = 0
          Top = 33
          Width = 758
          Height = 211
          Selected.Strings = (
            'INIPERIODOFERIAS'#9'14'#9'Período Aquis. de'
            'FIMPERIODOFERIAS'#9'11'#9'         a'
            'INIGOZOFERIAS'#9'10'#9'Em Férias de'
            'FIMGOZOFERIAS'#9'10'#9'         a'
            'DIASGOZO'#9'10'#9'Dias de Gozo'
            'FLGABONO'#9'10'#9'Com Abono?'
            'QTDIASABONO'#9'11'#9'Dias de Abono'
            'FLGOCORRIDA'#9'10'#9'Processada?'
            'QTDPARCDEVOL'#9'12'#9'Parcelas Devol.')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsFerias
          TabOrder = 0
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
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 758
          Height = 33
          Align = alTop
          TabOrder = 1
          object sbtnEtiquetaFerias: TSpeedButton
            Left = 367
            Top = 3
            Width = 25
            Height = 27
            Hint = 'Imprimir Etiqueta CTPS das Férias Apontadas'
            Glyph.Data = {
              DE010000424DDE01000000000000760000002800000024000000120000000100
              0400000000006801000000000000000000001000000010000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888880008
              8888888888888F7778FF8888000088888800877008888888888F7787F778FF88
              0000888800880007700888888F778F7778F778FF000088008800877007700888
              778F7787F778F778000080880088877770077087FF778887F88778F700008700
              888887777770008777888887FF888777000080888888F77777777087F8888F77
              78FF88870000878888FF888777777087F88F77888778FF8700008788FF888888
              87777087FF778888888778F7000087FF88899888888770877788888888888777
              000087888AA88888808880878FF8888888FFF8F700008877F888888FF0877888
              778FF88FF77787780000888877F87FFFFF08888888778F77788878F800008888
              88777FFFFFF088888888777FF888878F00008888888877FFFFFF008888888877
              8F888F77000088888888887FFF7788888888888878FF77880000888888888887
              7788888888888888877788880000888888888888888888888888888888888888
              0000}
            Margin = 0
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = sbtnEtiquetaFeriasClick
          end
        end
      end
      object tbshContrSind: TTabSheet
        Caption = 'Contribuições Sindicais'
        ImageIndex = 7
        object dbgrContrSind: TwwDBGrid
          Left = 0
          Top = 0
          Width = 758
          Height = 244
          Selected.Strings = (
            'NOME'#9'72'#9'Sindicato'
            'MES'#9'8'#9'Ano / Mês'
            'VALORPROVENTO'#9'10'#9'     Valor'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsContrSind
          TabOrder = 0
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
  inherited Dock971: TDock97
    Top = 369
    Width = 776
    inherited tb97Fundo: TToolbar97
      Left = 555
      DockPos = 555
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 386
      DockPos = 386
      inherited bbtnConfirmar: TBitBtn
        Visible = False
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
        OnClick = bbtnSairClick
      end
    end
  end
  object Panel2: TPanel [2]
    Left = 0
    Top = 0
    Width = 776
    Height = 46
    Align = alTop
    TabOrder = 1
    object lblSituacao: TLabel
      Left = 511
      Top = 22
      Width = 49
      Height = 13
      Caption = '(Efetivo)'
    end
    object sbtnProcurar: TSpeedButton
      Left = 603
      Top = 7
      Width = 60
      Height = 33
      Hint = 'Procurar por registro|'
      AllowAllUp = True
      GroupIndex = 1
      Caption = '&Procurar'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333CCCCC33
        33333FFFF77777FFFFFFCCCCCC808CCCCCC3777777F7F777777F008888070888
        8003777777777777777F0F0770F7F0770F0373F33337F333337370FFFFF7FFFF
        F07337F33337F33337F370FFFB99FBFFF07337F33377F33337F330FFBF99BFBF
        F033373F337733333733370BFBF7FBFB0733337F333FF3337F33370FBF98BFBF
        0733337F3377FF337F333B0BFB990BFB03333373FF777FFF73333FB000B99000
        B33333377737777733333BFBFBFB99FBF33333333FF377F333333FBF99BF99BF
        B333333377F377F3333333FB99FB99FB3333333377FF77333333333FB9999FB3
        333333333777733333333333FBFBFB3333333333333333333333}
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      Spacing = 0
      OnClick = sbtnProcurarClick
    end
    object Label1: TLabel
      Left = 6
      Top = 3
      Width = 57
      Height = 13
      Caption = 'Id.Pessoa'
    end
    object Label2: TLabel
      Left = 102
      Top = 3
      Width = 33
      Height = 13
      Caption = 'Nome'
    end
    object dbedMatric: TDBEdit
      Left = 6
      Top = 19
      Width = 82
      Height = 21
      DataField = 'MATRICULA'
      DataSource = ds
      TabOrder = 0
    end
    object dbedNome: TDBEdit
      Left = 102
      Top = 19
      Width = 388
      Height = 21
      DataField = 'NOME'
      DataSource = ds
      TabOrder = 1
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        'TRealEdit'
        'Text'
        0))
  end
  object MontaSelectFunc: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PESSOA.NOME'
      'FUNCIONARIO.MATRICULA'
      'PESSOA.NUMDOCUMENTO'
      'CARGO.TITULO'
      'EMPRESAPROP.NOMEEMPRESA')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nome da Pessoa'
      'Matrícula'
      'CPF (ou equivalente)'
      'Cargo'
      'Empresa')
    Tabelas.Strings = (
      'FUNCIONARIO'
      'EMPRESAPROP'
      'PESSOA '
      'CARGO')
    CamposChave.Strings = (
      'FUNCIONARIO.IDPESSOA')
    Filtro.Strings = (
      'FUNCIONARIO.IDEMPRESA = EMPRESAPROP.IDPESSOA'
      'FUNCIONARIO.IDPESSOA = PESSOA.IDPESSOA'
      'FUNCIONARIO.IDCARGO = CARGO.IDCARGO')
    Larguras.Strings = (
      '60'
      '22'
      '22'
      '40'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 342
    Top = 135
  end
  object qryPessoa: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 179
    Top = 134
  end
  object ds: TwwDataSource
    DataSet = qryPessoa
    Left = 64
    Top = 136
  end
  object dsCursos: TwwDataSource
    DataSet = qryCursos
    Left = 603
    Top = 62
  end
  object qryCursos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select C.DESCRICAO, '
      '    decode(H.DATREINI,'#39#39',H.DATPLINI,'
      '           H.DATREINI) as DATAINI, H.DATPLINI, H.DATREINI,'
      '    H.DATREFIM, H.DUR_TOT, '
      '    decode(H.FLGAVALTEOR,1,H.AVALTEOR,'#39#39') as AVTEOR, '
      '    decode(H.FLGAVALPRAT,1,H.AVALPRAT,'#39#39')  as AVPRAT'
      'From CURSO C, HSTTRN H '
      'Where  H.IDPESSOA = :IdPessoa '
      'And      C.IDCURSO   = H.IDCURSO'
      'And      (H.DATREINI >=  to_date(:Datini, '#39'dd/mm/yyyy'#39')  or  '
      '             H.DATPLINI >=  to_date(:Datini, '#39'dd/mm/yyyy'#39') )'
      'Order by  DATAINI DESC')
    ValidateWithMask = True
    Left = 651
    Top = 64
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdPessoa'
        ParamType = ptUnknown
        Value = 1059805
      end
      item
        DataType = ftString
        Name = 'Datini'
        ParamType = ptUnknown
        Value = '01/01/1997'
      end
      item
        DataType = ftString
        Name = 'Datini'
        ParamType = ptUnknown
      end>
  end
  object dsAval: TwwDataSource
    DataSet = qryAval
    Left = 603
    Top = 111
  end
  object qryAval: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select T.DESCRTIPOAVAL, '
      '    decode(H.DATAREAL,'#39#39', H.DATAPLAN, H.DATAREAL) as DATA, '
      '     H.DATAPLAN, H.DATAREAL, AVALIACAO'
      'From TIPOAVAL T, HSTAVAL H '
      'Where  H.IDPESSOA = :IdPessoa '
      'And      T.FLGTIPOAVAL < 2'
      'And      T.CODTIPOAVAL = H.CODTIPOAVAL'
      'And      (H.DATAREAL >=  to_date(:Datini, '#39'dd/mm/yyyy'#39')  or  '
      '             H.DATAPLAN >=  to_date(:Datini, '#39'dd/mm/yyyy'#39') )'
      'Order by  DATA DESC')
    ValidateWithMask = True
    Left = 650
    Top = 117
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdPessoa'
        ParamType = ptUnknown
        Value = 1059805
      end
      item
        DataType = ftString
        Name = 'Datini'
        ParamType = ptUnknown
        Value = '01/01/1997'
      end
      item
        DataType = ftString
        Name = 'Datini'
        ParamType = ptUnknown
      end>
  end
  object dsEvol: TwwDataSource
    DataSet = qryEvol
    Left = 605
    Top = 160
  end
  object qryEvol: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'Select EVOLFUNC.DATAALTERFUNC,EVOLFUNC.IDMOTIVO,MOTIVO.DESCRICAO' +
        ','
      'EVOLFUNC.SALARIO,EVOLFUNC.TIPOPAGAMENTO,EVOLFUNC.PERC_REAJ,'
      'CARGO.TITULO, EVOLFUNC.CODCENTROCUSTO as CCUSTO '
      'from EVOLFUNC,MOTIVO,CARGO '
      'where EVOLFUNC.IDPESSOA = :IdPessoa'
      'and   EVOLFUNC.IDMOTIVO = MOTIVO.IDMOTIVO'
      'and   EVOLFUNC.IDCARGO = CARGO.IDCARGO'
      'and   EVOLFUNC.DATAALTERFUNC >= to_date(:DatIni,'#39'dd/mm/yyyy'#39')'
      'order by EVOLFUNC.DATAALTERFUNC DESC')
    ValidateWithMask = True
    Left = 650
    Top = 173
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdPessoa'
        ParamType = ptUnknown
        Value = 1059805
      end
      item
        DataType = ftString
        Name = 'DatIni'
        ParamType = ptUnknown
        Value = '01/01/1990'
      end>
  end
  object dsBenef: TwwDataSource
    DataSet = qryBenef
    Left = 609
    Top = 225
  end
  object qryBenef: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  PD.DESCRICAO, RI.ANOMESINICIO, RI.PARCELAS,'
      '  RI.NUMOCORRENCIAS, RI.FLGPERMANENTE, RI.IDREGRACALCULO,'
      '  RI.VALORRUBRICA'
      'FROM'
      '  RUBRICAINDIV RI, PROVDESC PD'
      'WHERE'
      '  (RI.IDPESSOA          = :IDPESSOA) AND'
      '  (PD.FLGCONSTAFOLHA    = 0)         AND'
      '  (PD.IDBENEFSALAR IS NOT NULL)      AND'
      
        '  (RI.ANOMESINICIO     >= TO_CHAR(TO_DATE(:DATINI,'#39'DD/MM/YYYY'#39'),' +
        #39'YYYY/MM'#39')) AND'
      '  (RI.IDRUBRICA         = PD.IDPROVENTO)'
      'UNION'
      'SELECT'
      '  PD.DESCRICAO, H.MES AS ANOMESINICIO, 1 AS PARCELAS,'
      
        '  1 AS NUMOCORRENCIAS, 0 AS FLGPERMANENTE, -99 AS IDREGRACALCULO' +
        ','
      '  H.VALORPROVENTO AS VALORRUBRICA'
      'FROM'
      '  HISTRUBSAL H, PROVDESC PD'
      'WHERE'
      '  (H.IDPESSOA           = :IDPESSOA) AND'
      '  (PD.FLGCONSTAFOLHA    = 1)         AND'
      '  (PD.IDBENEFSALAR IS NOT NULL)      AND'
      
        '  (H.MES               >= TO_CHAR(TO_DATE(:DATINI,'#39'DD/MM/YYYY'#39'),' +
        #39'YYYY/MM'#39')) AND'
      '  (H.IDRUBRICA          = PD.IDPROVENTO)'
      'ORDER BY'
      '  2 DESC'
      ' '
      ' ')
    ControlType.Strings = (
      'FLGPERMANENTE;CheckBox;1;0')
    ValidateWithMask = True
    Left = 655
    Top = 224
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdPessoa'
        ParamType = ptUnknown
        Value = 1059805
      end
      item
        DataType = ftString
        Name = 'DATINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATINI'
        ParamType = ptUnknown
      end>
  end
  object dsMedic: TwwDataSource
    DataSet = qryMedic
    Left = 616
    Top = 274
  end
  object qryMedic: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select T.DESCRTIPOOCMED, H.DATAPLAN, H.DATAREAL, '
      '           H.EXAMINADOR, H.AVALIACAO, H.LICENCA,'
      
        '          DECODE(H.DATAREAL, NULL, H.DATAPLAN, H.DATAREAL) AS DA' +
        'TA'
      'from  TIPOCMED T, HSTASMED H'
      'where H.IDPESSOA = :IdPessoa'
      'and   H.CODTIPOOCMED = T.CODTIPOOCMED'
      'and   (H.DATAREAL >=  to_date(:Datini, '#39'dd/mm/yyyy'#39')  or  '
      '          H.DATAPLAN >=  to_date(:Datini, '#39'dd/mm/yyyy'#39') )'
      'order by DATA DESC')
    ValidateWithMask = True
    Left = 659
    Top = 280
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdPessoa'
        ParamType = ptUnknown
        Value = 1059805
      end
      item
        DataType = ftString
        Name = 'Datini'
        ParamType = ptUnknown
        Value = '01/01/1990'
      end
      item
        DataType = ftString
        Name = 'Datini'
        ParamType = ptUnknown
      end>
  end
  object dsFerias: TwwDataSource
    DataSet = qryFerias
    Left = 504
    Top = 67
  end
  object qryFerias: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select INIPERIODOFERIAS, '
      '           INIGOZOFERIAS,'
      '    FIMGOZOFERIAS,'
      '    FLGOCORRIDA,'
      '    FLGABONO,'
      '    QTDPARCDEVOL,'
      '    QTDIASABONO,'
      '    (ADD_MONTHS(INIPERIODOFERIAS, 12) -1) AS FIMPERIODOFERIAS, '
      '    (FIMGOZOFERIAS - INIGOZOFERIAS + 1)  AS DIASGOZO'
      'from FERIAS'
      'where IDPESSOA = :IdPessoa'
      'and   INIGOZOFERIAS >= to_date(:DatIni,'#39'dd/mm/yyyy'#39')'
      'order by INIGOZOFERIAS DESC')
    ControlType.Strings = (
      'FLGABONO;CheckBox;1;0'
      'FLGOCORRIDA;CheckBox;1;0')
    ValidateWithMask = True
    Left = 537
    Top = 67
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdPessoa'
        ParamType = ptUnknown
        Value = 1059805
      end
      item
        DataType = ftString
        Name = 'DatIni'
        ParamType = ptUnknown
        Value = '01/01/1982'
      end>
  end
  object dsHistRub: TwwDataSource
    DataSet = qryHistRub
    Left = 503
    Top = 123
  end
  object qryHistRub: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select P.DESCRICAO, P.FLGDESCONTO,'
      '    decode(P.FLGDESCONTO,0, '#39'Provento'#39', '
      
        '                decode(P.FLGDESCONTO,1, '#39'Desconto'#39', '#39'Outros'#39')) a' +
        's TIPO,'
      '     H.VALORPROVENTO, '
      '     H.REFERENCIA'
      'From PROVDESC P, HISTRUBSAL H '
      'Where  H.IDPESSOA = :IdPessoa '
      'And      H.IDMOTIVO = :IdMotivo'
      
        'And      (P.FLGDESCONTO   <= 1  or  P.CODRUBCLT IN ('#39'40695'#39','#39'436' +
        '96'#39','
      
        '         '#39'43697'#39','#39'43700'#39','#39'43701'#39','#39'60052'#39','#39'60025'#39','#39'60017'#39','#39'62016'#39 +
        ','
      '         '#39'60999'#39','#39'60026'#39','#39'60028'#39','#39'62026'#39','#39'90010'#39'))'
      'And      H.MES =  :Datini'
      'And      H.IDRUBRICA = P.IDPROVENTO'
      'Order by  H.IDMOTIVO, P.FLGDESCONTO, upper(P.DESCRICAO)'
      ' ')
    PictureMasks.Strings = (
      'VALORPROVENTO'#9'##,###,##0.00'#9'T'#9'T')
    ValidateWithMask = True
    Left = 552
    Top = 115
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdPessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IdMotivo'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'Datini'
        ParamType = ptUnknown
        Value = '1999/01'
      end>
    object qryHistRubDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 130
    end
    object qryHistRubFLGDESCONTO: TFloatField
      FieldName = 'FLGDESCONTO'
    end
    object qryHistRubTIPO: TStringField
      FieldName = 'TIPO'
      Size = 8
    end
    object qryHistRubVALORPROVENTO: TFloatField
      FieldName = 'VALORPROVENTO'
      DisplayFormat = '#,###,##0.00'
    end
    object qryHistRubREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 10
    end
  end
  object tblParam: TwwTable
    DatabaseName = 'BaseDados'
    TableName = 'CM.PARAMRH'
    SyncSQLByRange = True
    NarrowSearch = False
    ValidateWithMask = True
    Left = 702
    Top = 55
  end
  object qryMotivoFolha: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select IDMOTIVO, DESCRICAO '
      'from MOTIVO '
      'where GRUPOMOTIVO = '#39'F'#39' '
      'order by upper(DESCRICAO)')
    ValidateWithMask = True
    Left = 120
    Top = 131
  end
  object dsContrSind: TwwDataSource
    DataSet = qryContrSind
    Left = 469
    Top = 233
  end
  object qryContrSind: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  H.IDPESSOA, H.MES, H.VALORPROVENTO, P.NOME'
      'FROM'
      '  HISTRUBSAL H, PESSOA P, PESSOAFISICA PF, PROVDESC PD'
      'WHERE'
      
        '  (H.MES           >= TO_CHAR(to_date(:DatIni,'#39'DD/MM/YYYY'#39'),'#39'yyy' +
        'y/mm'#39')) AND'
      '  (H.IDPESSOA   = :IDPESSOA)             AND'
      '  (PF.IDPESSOA = :IDPESSOA)             AND'
      '  (PD.CODRUBCLT = '#39'50019'#39')                AND'
      '  (H.IDRUBRICA = PD.IDPROVENTO)  AND  '
      '  (P.IDPESSOA   = PF.IDSINDICATO(+)) '
      'ORDER BY'
      '  H.MES DESC')
    ValidateWithMask = True
    Left = 469
    Top = 221
    ParamData = <
      item
        DataType = ftString
        Name = 'DatIni'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryContrSindNOME: TStringField
      DisplayLabel = 'Sindicato'
      DisplayWidth = 72
      FieldName = 'NOME'
      Size = 60
    end
    object qryContrSindMES: TStringField
      DisplayLabel = 'Ano / Mês'
      DisplayWidth = 8
      FieldName = 'MES'
      FixedChar = True
      Size = 7
    end
    object qryContrSindVALORPROVENTO: TFloatField
      DisplayLabel = '     Valor'
      DisplayWidth = 10
      FieldName = 'VALORPROVENTO'
      DisplayFormat = '###,##0.00'
    end
    object qryContrSindIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Visible = False
    end
  end
end
