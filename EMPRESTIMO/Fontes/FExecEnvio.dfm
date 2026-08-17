inherited frmExecEnvio: TfrmExecEnvio
  Left = 389
  Top = 104
  HelpContext = 150009
  BorderStyle = bsSingle
  Caption = 'Envio '
  ClientHeight = 597
  ClientWidth = 758
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 758
    Height = 564
    object lblTitulo: TfcLabel
      Left = 16
      Top = 8
      Width = 156
      Height = 24
      Caption = 'Envio [seleção]'
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TextOptions.Alignment = taLeftJustify
      TextOptions.Style = fclsRaised
      TextOptions.VAlignment = vaTop
    end
    object ntbPrincipal: TNotebook
      Left = 0
      Top = 44
      Width = 758
      Height = 520
      Align = alBottom
      TabOrder = 0
      OnPageChanged = ntbPrincipalPageChanged
      object TPage
        Left = 0
        Top = 0
        Caption = 'Selecao'
        object Label1: TLabel
          Left = 16
          Top = 45
          Width = 112
          Height = 13
          Caption = 'Tipo de Empréstimo'
        end
        object Label2: TLabel
          Left = 360
          Top = 45
          Width = 96
          Height = 13
          Caption = 'Tipo de Contrato'
        end
        object Label3: TLabel
          Left = 15
          Top = 414
          Width = 181
          Height = 13
          Caption = 'Situação do Participante Titular'
        end
        object Label5: TLabel
          Left = 551
          Top = 488
          Width = 189
          Height = 13
          Caption = '(apenas marca como "enviados")'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        object chkVerificaCobrancaAtraso: TCheckBox
          Left = 305
          Top = 470
          Width = 257
          Height = 17
          Caption = 'NÃO tratar limite de prestações em atraso'
          Checked = True
          Color = clBtnShadow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          State = cbChecked
          TabOrder = 9
          Visible = False
        end
        object Panel1: TPanel
          Left = 431
          Top = 181
          Width = 257
          Height = 62
          TabOrder = 6
          object Label15: TLabel
            Left = 24
            Top = 11
            Width = 116
            Height = 13
            Caption = 'Cobrança (mês/ano)'
          end
          object DBspnAno: TwwDBSpinEdit
            Left = 168
            Top = 25
            Width = 65
            Height = 21
            Increment = 1
            TabOrder = 1
            UnboundDataType = wwDefault
          end
          object cboMes: TComboBox
            Left = 24
            Top = 25
            Width = 145
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
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
        end
        object DBcboTipoEmptmo: TwwDBLookupCombo
          Left = 16
          Top = 59
          Width = 329
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCTIPOEMPTMO'#9'30'#9'Tipo de Empréstimo'#9'F')
          LookupTable = dtmLookEmptmo.qryLookTipoEmptmo
          LookupField = 'IDTIPOEMPTMO'
          ParentFont = False
          TabOrder = 1
          AutoDropDown = False
          ShowButton = True
          UseTFields = False
          AllowClearKey = False
          ShowMatchText = True
          OnCloseUp = DBcboTipoEmptmoCloseUp
        end
        object DBcboTipoContrato: TwwDBLookupCombo
          Left = 360
          Top = 59
          Width = 329
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'TCEDESCRICAO'#9'60'#9'TCEDESCRICAO'#9'F')
          LookupTable = dtmLookEmptmo.qryLookTipoContr
          LookupField = 'IDTIPOCONTREMPTMO'
          DropDownWidth = 8
          Enabled = False
          ParentFont = False
          TabOrder = 2
          AutoDropDown = False
          ShowButton = True
          UseTFields = False
          AllowClearKey = False
          ShowMatchText = True
        end
        object btnContinuar: TfcShapeBtn
          Left = 599
          Top = 458
          Width = 89
          Height = 29
          Caption = 'Confirmar'
          Color = clBtnFace
          DitherColor = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888FFFFF8888888888000008888888888F777778FF888888002222200
            88888887788888778F88887222222222088888788888888878F887A228822222
            208887F88FFF888887F887A2FFF8222220888788777FF888878F7A22FFFF8222
            22087F887777FF88887F7A22FFFFF82222087F8877777FF8887F7A22FF8FFF82
            22087F8877F777FF887F7A22FF82FFF822087F8877F8777F887F7A22FF222FF8
            220878F87788877FF87887A2222222FF208887F88888887787F887A222222222
            2088878F888888888788887AA222222208888878FF88888F788888877AAAAA77
            8888888778FFFF77888888888777778888888888877777888888}
          Layout = blGlyphRight
          NumGlyphs = 2
          Options = [boFocusable, boFocusRect]
          Offsets.GlyphY = 1
          Offsets.TextDownX = 2
          Offsets.TextDownY = 2
          ParentClipping = True
          ParentFont = False
          RoundRectBias = 25
          ShadeStyle = fbsHighlight
          TabOrder = 12
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnContinuarClick
        end
        object GroupBox1: TGroupBox
          Left = 304
          Top = 413
          Width = 385
          Height = 39
          TabOrder = 10
          TabStop = True
          object chkSitPart: TCheckBox
            Left = 8
            Top = 14
            Width = 129
            Height = 17
            Caption = 'Atualizar Situação'
            TabOrder = 0
          end
          object chkAtualiza: TCheckBox
            Left = 144
            Top = 14
            Width = 129
            Height = 17
            Caption = 'Atualizar Rubricas'
            TabOrder = 1
          end
        end
        object grbEnvio: TGroupBox
          Left = 16
          Top = 176
          Width = 400
          Height = 68
          Caption = ' Enviar p/ '
          TabOrder = 5
          object chkFolhaBenef: TCheckBox
            Left = 16
            Top = 32
            Width = 161
            Height = 17
            Caption = 'Folha de Benefícios'
            TabOrder = 1
          end
          object chkFolhaPatro: TCheckBox
            Left = 16
            Top = 16
            Width = 161
            Height = 17
            Caption = 'Folha da Patrocinadora'
            TabOrder = 0
          end
          object chkCaP: TCheckBox
            Left = 184
            Top = 48
            Width = 209
            Height = 17
            Caption = 'Financeiro a Pagar (Concessões)'
            TabOrder = 4
          end
          object chkCar: TCheckBox
            Left = 184
            Top = 16
            Width = 209
            Height = 17
            Caption = 'Financeiro a Receber'
            TabOrder = 2
            OnClick = chkCarClick
          end
          object chkCapDev: TCheckBox
            Left = 184
            Top = 32
            Width = 209
            Height = 17
            Caption = 'Financeiro a Pagar (Devoluções)'
            TabOrder = 3
          end
        end
        inline molContratoEmptmo: TmolContratoEmptmo
          Left = 8
          Top = 4
          Width = 609
          Height = 41
          inherited edtNome: TEdit
            Width = 353
            Color = clWhite
          end
          inherited btnBuscaContrato: TBitBtn
            Left = 552
            OnClick = molContratoEmptmobtnBuscaContratoClick
          end
          inherited btnLimpaContrato: TBitBtn
            Left = 576
            OnClick = molContratoEmptmobtnLimpaContratoClick
          end
        end
        object DBcboSitPart: TwwDBLookupCombo
          Left = 15
          Top = 428
          Width = 274
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCRICAO'#9'50'#9'DESCRICAO'#9'F')
          LookupTable = dtmLookEmptmo.qryLookSitPart
          LookupField = 'IDSITPART'
          DropDownWidth = 8
          ParentFont = False
          TabOrder = 7
          AutoDropDown = False
          ShowButton = True
          UseTFields = False
          AllowClearKey = False
          ShowMatchText = True
          OnCloseUp = DBcboTipoEmptmoCloseUp
        end
        object chkIntegraCaR: TCheckBox
          Left = 305
          Top = 490
          Width = 233
          Height = 17
          Caption = 'NÃO gerar Documentos de cobrança'
          Color = clBtnShadow
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
          TabOrder = 11
          Visible = False
        end
        inline molListaPatro: TmolListaPatro
          Left = 8
          Top = 80
          Width = 345
          Height = 97
          TabOrder = 3
          inherited Label6: TLabel
            Width = 86
          end
          inherited lstPatro: TCheckListBox
            Width = 329
            Height = 78
          end
          inherited btnInvertePatro: TBitBtn
            Left = 295
            OnClick = molListaPatrobtnInvertePatroClick
          end
          inherited btnMarcaTodosPatro: TBitBtn
            Left = 316
            OnClick = molListaPatrobtnMarcaTodosPatroClick
          end
        end
        inline molListaPlano: TmolListaPlano
          Left = 352
          Top = 80
          Width = 345
          Height = 94
          TabOrder = 4
          inherited Label6: TLabel
            Width = 119
          end
          inherited lstPlano: TCheckListBox
            Width = 329
            Height = 78
          end
          inherited btnInvertePlano: TBitBtn
            Left = 295
            OnClick = molListaPlanobtnInvertePlanoClick
          end
          inherited btnMarcaTodosPlano: TBitBtn
            Left = 316
            OnClick = molListaPlanobtnMarcaTodosPlanoClick
          end
        end
        object grpDataVencto: TGroupBox
          Left = 432
          Top = 247
          Width = 257
          Height = 49
          Caption = ' Data de Vencimento (Financeiro) entre: '
          TabOrder = 8
          object Label6: TLabel
            Left = 120
            Top = 22
            Width = 8
            Height = 13
            Caption = 'e'
          end
          object edtDataVenctoIni: TwwDBDateTimePicker
            Left = 16
            Top = 18
            Width = 97
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            Epoch = 1950
            ButtonWidth = 20
            ButtonGlyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              88888888888888888888800000000000000880FFFFFFFFFFFF0880F878787978
              7F0880F7878797978F0880F8787879787F0880F7878787878F0880F878787878
              7F0880F7878787878F0880FFFFFFFFFFFF0880F4C4C4C7777F0880FC4C4C4777
              7F0880FFFFFFFFFFFF0880000000000000088888888888888888}
            ShowButton = True
            TabOrder = 0
            UnboundDataType = wwDTEdtDate
            DisplayFormat = 'dd/mm/yyyy'
          end
          object edtDataVenctoFim: TwwDBDateTimePicker
            Left = 136
            Top = 18
            Width = 97
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            Epoch = 1950
            ButtonWidth = 20
            ButtonGlyph.Data = {
              F6000000424DF600000000000000760000002800000010000000100000000100
              0400000000008000000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              88888888888888888888800000000000000880FFFFFFFFFFFF0880F878787978
              7F0880F7878797978F0880F8787879787F0880F7878787878F0880F878787878
              7F0880F7878787878F0880FFFFFFFFFFFF0880F4C4C4C7777F0880FC4C4C4777
              7F0880FFFFFFFFFFFF0880000000000000088888888888888888}
            ShowButton = True
            TabOrder = 1
            UnboundDataType = wwDTEdtDate
            DisplayFormat = 'dd/mm/yyyy'
          end
        end
        object gbFormaRecDif: TGroupBox
          Left = 16
          Top = 247
          Width = 400
          Height = 49
          Caption = ' Forma de Recebimento Diferenciada '
          TabOrder = 13
          object btnAtribuiParametro: TSpeedButton
            Left = 363
            Top = 17
            Width = 23
            Height = 22
            Hint = 'Seleciona tipo de recebimento padrão'
            Enabled = False
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              8888888888888F88888888888888778888888888888F77F8888888888800F088
              888888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF08
              8888887788888F7F8888887FFFFFCF088888887F88FF7878F888887FFFCCFFF0
              8888887F877788F7F888888744FFFCF088888887778FF7878F888884CC4FCFFF
              088888878878788F78F8884CCCC4FFCFF088887888878F78878F84CCCCCC4FFF
              FF0887FF88887F888F788444CC444FFF77888777F877788F77888884CC4FFF77
              88888887F87F8F7788888884CC47778888888887F877778888888884CC488888
              88888887FF7F8888888888844448888888888887777888888888}
            NumGlyphs = 2
            ParentShowHint = False
            ShowHint = True
            OnClick = btnAtribuiParametroClick
          end
          object DBcboFormaRecebimento: TwwDBLookupCombo
            Left = 16
            Top = 18
            Width = 345
            Height = 21
            Font.Charset = ANSI_CHARSET
            Font.Color = clBlack
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'1'#9'DESCRICAO'#9'F')
            LookupTable = dtmLookEmptmo.qryLookPortadorFormaR
            LookupField = 'CODPORTFORMA'
            Enabled = False
            ParentFont = False
            TabOrder = 0
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
          end
        end
        object chkInArquivo: TCheckBox
          Left = 14
          Top = 452
          Width = 262
          Height = 17
          Caption = 'Considerar APENAS matrículas do arquivo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 14
          OnClick = chkInArquivoClick
        end
        object chkNotInArquivo: TCheckBox
          Left = 305
          Top = 452
          Width = 241
          Height = 17
          Caption = 'NÃO considerar matrículas do arquivo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 15
          OnClick = chkNotInArquivoClick
        end
        object FLGRESGATE: TCheckBox
          Left = 14
          Top = 470
          Width = 193
          Height = 17
          Caption = 'Enviar para Folha de Resgate'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 16
          OnClick = FLGRESGATEClick
        end
        object GrpPlanosValor: TGroupBox
          Left = 14
          Top = 298
          Width = 675
          Height = 113
          Caption = 'Selecionar o Plano / Indicar o Valor a Lançar '
          TabOrder = 17
          object Bevel2: TBevel
            Left = 3
            Top = 17
            Width = 332
            Height = 43
          end
          object Label9: TLabel
            Left = 245
            Top = 19
            Width = 30
            Height = 13
            Caption = 'Valor'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label7: TLabel
            Left = 9
            Top = 19
            Width = 33
            Height = 13
            Caption = 'Plano'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Bevel3: TBevel
            Left = 339
            Top = 17
            Width = 332
            Height = 43
          end
          object Label10: TLabel
            Left = 581
            Top = 19
            Width = 30
            Height = 13
            Caption = 'Valor'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label11: TLabel
            Left = 345
            Top = 19
            Width = 33
            Height = 13
            Caption = 'Plano'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Bevel4: TBevel
            Left = 3
            Top = 65
            Width = 332
            Height = 43
          end
          object Label12: TLabel
            Left = 245
            Top = 67
            Width = 30
            Height = 13
            Caption = 'Valor'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label13: TLabel
            Left = 9
            Top = 67
            Width = 33
            Height = 13
            Caption = 'Plano'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Bevel5: TBevel
            Left = 339
            Top = 65
            Width = 332
            Height = 43
          end
          object Label14: TLabel
            Left = 581
            Top = 67
            Width = 30
            Height = 13
            Caption = 'Valor'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label16: TLabel
            Left = 345
            Top = 67
            Width = 33
            Height = 13
            Caption = 'Plano'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object CmbPlano1: TDBLookupComboBox
            Left = 9
            Top = 33
            Width = 232
            Height = 21
            KeyField = 'IDPLANOPREV'
            ListField = 'NOME'
            ListSource = DscPlano1
            TabOrder = 0
            OnCloseUp = CmbPlano1CloseUp
          end
          object CmbPlano2: TDBLookupComboBox
            Left = 345
            Top = 33
            Width = 232
            Height = 21
            KeyField = 'IDPLANOPREV'
            ListField = 'NOME'
            ListSource = DscPlano2
            TabOrder = 2
            OnCloseUp = CmbPlano2CloseUp
          end
          object CmbPlano3: TDBLookupComboBox
            Left = 9
            Top = 81
            Width = 232
            Height = 21
            KeyField = 'IDPLANOPREV'
            ListField = 'NOME'
            ListSource = DscPlano3
            TabOrder = 4
            OnCloseUp = CmbPlano3CloseUp
          end
          object CmbPlano4: TDBLookupComboBox
            Left = 345
            Top = 81
            Width = 232
            Height = 21
            KeyField = 'IDPLANOPREV'
            ListField = 'NOME'
            ListSource = DscPlano4
            TabOrder = 6
            OnCloseUp = CmbPlano4CloseUp
          end
          object EdtValor1: TEdit
            Left = 245
            Top = 33
            Width = 85
            Height = 21
            TabOrder = 1
            OnKeyPress = EdtValor1KeyPress
          end
          object EdtValor2: TEdit
            Left = 581
            Top = 33
            Width = 85
            Height = 21
            TabOrder = 3
            OnKeyPress = EdtValor2KeyPress
          end
          object EdtValor3: TEdit
            Left = 245
            Top = 81
            Width = 85
            Height = 21
            TabOrder = 5
            OnKeyPress = EdtValor3KeyPress
          end
          object EdtValor4: TEdit
            Left = 581
            Top = 81
            Width = 85
            Height = 21
            TabOrder = 7
            OnKeyPress = EdtValor4KeyPress
          end
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Lancamentos'
        object Bevel1: TBevel
          Left = 16
          Top = 332
          Width = 673
          Height = 3
          Shape = bsTopLine
        end
        object Total: TLabel
          Left = 45
          Top = 174
          Width = 169
          Height = 13
          Alignment = taRightJustify
          Caption = 'Total de Contratos enviados: '
          Visible = False
        end
        object Label4: TLabel
          Left = 384
          Top = 134
          Width = 182
          Height = 13
          Alignment = taRightJustify
          Caption = 'Valor Total dos Itens enviados: '
          Visible = False
        end
        object Label8: TLabel
          Left = 15
          Top = 310
          Width = 199
          Height = 13
          Alignment = taRightJustify
          Caption = 'Total de Contratos NÃO enviados: '
          Visible = False
        end
        object btnVoltar: TfcShapeBtn
          Left = 504
          Top = 344
          Width = 89
          Height = 29
          Caption = 'Voltar'
          Color = clBtnFace
          DitherColor = clWhite
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888888888888888888000008888888888F777778FF88888800BBBBB00
            88888887788888778F88887BBBBBBBBB088888788888888878F887FBBBBBBBBB
            B08887F8888F888887F887FBBB0BBBBBB0888788887F888887887FBBB00BBBBB
            BB087F88877FFFFFF8787FBB00000000BB087F8877777777F8787FB000000000
            BB087F8777777777F8787FBB00000000BB087F887777777788787FBBB00BBBBB
            BB0878F8877F8888887887FBBB0BBBBBB08887F88878888887F887FBBBBBBBBB
            B088878F888888888788887FFBBBBBBB08888878FF88888F788888877FFFFF77
            8888888778FFFF77888888888777778888888888877777888888}
          NumGlyphs = 2
          Options = [boFocusable, boFocusRect]
          Offsets.GlyphY = 1
          Offsets.TextDownX = 2
          Offsets.TextDownY = 2
          ParentClipping = True
          ParentFont = False
          RoundRectBias = 25
          ShadeStyle = fbsHighlight
          TabOrder = 0
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnVoltarClick
        end
        object memResult: TMemo
          Left = 16
          Top = 34
          Width = 673
          Height = 135
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssBoth
          TabOrder = 3
        end
        object edtNumResult: TRealEdit
          Left = 216
          Top = 170
          Width = 73
          Height = 21
          Alignment = taRightJustify
          Enabled = False
          Lines.Strings = (
            '0')
          TabOrder = 4
          Visible = False
          WordWrap = False
          IntDigits = 10
          DecDigits = 0
          NumberFormat = iNumber
          Signal = False
        end
        object edtVlrTotParcela: TRealEdit
          Left = 560
          Top = 170
          Width = 113
          Height = 21
          Alignment = taRightJustify
          Enabled = False
          Lines.Strings = (
            '      0,00')
          TabOrder = 5
          Visible = False
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object memErro: TMemo
          Left = 16
          Top = 224
          Width = 673
          Height = 81
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssBoth
          TabOrder = 6
        end
        object edtNumErro: TRealEdit
          Left = 216
          Top = 306
          Width = 73
          Height = 21
          Alignment = taRightJustify
          Enabled = False
          Lines.Strings = (
            '0')
          TabOrder = 7
          Visible = False
          WordWrap = False
          IntDigits = 10
          DecDigits = 0
          NumberFormat = iNumber
          Signal = False
        end
        object Panel3: TPanel
          Left = 16
          Top = 8
          Width = 673
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Resultado'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
        end
        object Panel4: TPanel
          Left = 16
          Top = 198
          Width = 673
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Erros encontrados'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 564
    Width = 758
    inherited tb97Fundo: TToolbar97
      Left = 565
      DockPos = 565
      inherited bbtnAjuda: TmaHelpBitBtn
        ClickHelpContext = 150001
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      2
      (
        ''
        'Filter'
        0)
      (
        ''
        'DisplayLabel'
        0))
  end
  object qryUpdateRubrica: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   HISTMOVEMPTMO'
      ''
      'SET'
      '   IDRUBRICA ='
      '   ('
      '   SELECT'
      
        '      DECODE(:PRUBRICA, '#39'N'#39', ITC.IDPROVENTON, '#39'A'#39', ITC.IDPROVENT' +
        'OA, '#39'D'#39', ITC.IDPROVENTOD) AS RUBRICA'
      '   FROM'
      '      ITEMXTIPOCONTR ITC'
      '   WHERE'
      '          ( ITC.IDTIPOCONTREMPTMO =:PIDTIPOCONTREMPTMO )'
      '      AND ( ITC.IDITEMEMPTMO      =:PIDITEMEMPTMO )'
      '   )'
      'WHERE'
      '       ( IDITEMEMPTMO         =:PIDITEMEMPTMO )'
      '   AND ( HMEANOCOBRANCA       =:PHMEANOCOBRANCA )'
      '   AND ( HMEMESCOBRANCA       =:PHMEMESCOBRANCA )'
      
        '   AND ( (:PIDCONTRATOEMPTMO  IS NULL) OR (IDCONTRATOEMPTMO =:PI' +
        'DCONTRATOEMPTMO) )'
      '   AND ( FLGENVIO             = 0 )'
      '   AND ( (HMECENTRALIZA       = 1) OR (HMEDESTACADO = 1) )'
      '   AND ( NVL(FLGESTORNADO, 0) = 0 )'
      '   AND ( NVL(FLGQUITADO, 0)   = 0 )'
      '   AND ( NVL(FLGABONADO, 0)   = 0 )'
      '   AND ( HMEFORMACOBRANCA     = '#39'F'#39' )'
      '   AND ('
      
        '       ( (:PRUBRICA = '#39'N'#39') AND ((LTRIM(RTRIM(TO_CHAR(HMEANOCOMPE' +
        'TENCIA, '#39'0000'#39')))) || (LTRIM(RTRIM(TO_CHAR(HMEMESCOMPETENCIA, '#39'0' +
        '0'#39')))) =:PANOMES ) )'
      
        '   OR  ( (:PRUBRICA = '#39'A'#39') AND ((LTRIM(RTRIM(TO_CHAR(HMEANOCOMPE' +
        'TENCIA, '#39'0000'#39')))) || (LTRIM(RTRIM(TO_CHAR(HMEMESCOMPETENCIA, '#39'0' +
        '0'#39')))) <:PANOMES ) )'
      '   OR  ( (:PRUBRICA = '#39'D'#39') AND (HMEVLRPREVISTO < 0) )'
      '       )'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 604
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'PRUBRICA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDITEMEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDITEMEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEANOCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PRUBRICA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PANOMES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PRUBRICA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PANOMES'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PRUBRICA'
        ParamType = ptInput
      end>
  end
  object qryUpdateSitFormaPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   HISTMOVEMPTMO'
      ''
      'SET'
      '   HMETIPOFOLHA = '#39'P'#39
      ''
      'WHERE'
      '       ( HMEFORMACOBRANCA     = '#39'F'#39' )'
      '   AND ( FLGENVIO             = 0 )'
      '   AND ( FLGBAIXADO           = 0 )'
      '   AND ( HMEVLREFETIVO        IS NULL )'
      '   AND ( HMEANOCOBRANCA       =:PHMEANOCOBRANCA )'
      '   AND ( HMEMESCOBRANCA       =:PHMEMESCOBRANCA )'
      '   AND ( HMECENTRALIZA        = 1 OR HMEDESTACADO = 1 )'
      
        '   AND ( :PIDCONTRATOEMPTMO   IS NULL OR IDCONTRATOEMPTMO =:PIDC' +
        'ONTRATOEMPTMO )'
      '   AND ( FLGESTORNADO         IS NULL OR FLGESTORNADO = 0 )'
      '   AND ( FLGQUITADO           IS NULL OR FLGQUITADO   = 0 )'
      '   AND ( FLGABONADO           IS NULL OR FLGABONADO   = 0 )'
      ''
      '   AND IDHISTMOVEMPTMO IN'
      '   ('
      '   SELECT'
      '      IDHISTMOVEMPTMO'
      '   FROM'
      '      HISTMOVEMPTMO  H,'
      '      CONTRATOEMPTMO C,'
      '      PARTPREVPLAN   PPP,'
      '      ELEGPATRO      ELP,'
      '      SITPART        SP,'
      '      SITFUNC        SF'
      '   WHERE'
      '          ('
      '          ( SP.FLGINTERNO           = '#39'AT'#39' ) OR'
      
        '          ( :PFLGEXCEPCIONAL        = 1 AND ELP.IDPESSJURCEDIDO ' +
        '=:PIDEMPRESAPROP ) OR'
      '          ( SP.FLGINTERNO          <> '#39'AS'#39' AND SF.TIPOSIT = '#39'A'#39')'
      '          )'
      '      AND ( H.HMEFORMACOBRANCA      = '#39'F'#39' )'
      '      AND ( H.FLGENVIO              = 0 )'
      '      AND ( H.FLGBAIXADO            = 0 )'
      '      AND ( H.HMEVLREFETIVO         IS NULL )'
      '      AND ( H.HMEANOCOBRANCA        =:PHMEANOCOBRANCA )'
      '      AND ( H.HMEMESCOBRANCA        =:PHMEMESCOBRANCA )'
      '      AND ( H.HMECENTRALIZA         = 1 OR H.HMEDESTACADO = 1 )'
      
        '      AND ( :PIDCONTRATOEMPTMO      IS NULL OR H.IDCONTRATOEMPTM' +
        'O =:PIDCONTRATOEMPTMO )'
      
        '      AND ( :PIDTIPOCONTREMPTMO     IS NULL OR C.IDTIPOCONTREMPT' +
        'MO =:PIDTIPOCONTREMPTMO )'
      
        '      AND ( H.FLGESTORNADO          IS NULL OR H.FLGESTORNADO = ' +
        '0 )'
      
        '      AND ( H.FLGQUITADO            IS NULL OR H.FLGQUITADO   = ' +
        '0 )'
      
        '      AND ( H.FLGABONADO            IS NULL OR H.FLGABONADO   = ' +
        '0 )'
      '      AND ( H.IDCONTRATOEMPTMO      = C.IDCONTRATOEMPTMO )'
      '      AND ( C.IDPESSOA              = PPP.IDPESSOA )'
      '      AND ( C.IDPATRO               = PPP.IDPESSJUR )'
      '      AND ( C.IDPESSOA              = ELP.IDPESSOA )'
      '      AND ( C.IDPATRO               = ELP.IDPESSJUR )'
      '      AND ( PPP.IDSITPART           = SP.IDSITPART )'
      '      AND ( ELP.IDSITFUNC           = SF.IDSITFUNC )'
      '      AND PPP.FLGDESATIVADO         = 0'
      '   )')
    ValidateWithMask = True
    Left = 512
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PHMEANOCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFLGEXCEPCIONAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDEMPRESAPROP'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEANOCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end>
  end
  object qryUpdateSitFormaFolha: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   HISTMOVEMPTMO'
      ''
      'SET'
      '   HMETIPOFOLHA = '#39'B'#39
      ''
      'WHERE'
      '       ( HMEFORMACOBRANCA     = '#39'F'#39' )'
      '   AND ( FLGENVIO             = 0 )'
      '   AND ( FLGBAIXADO           = 0 )'
      '   AND ( HMEVLREFETIVO        IS NULL )'
      '   AND ( HMEANOCOBRANCA       =:PHMEANOCOBRANCA )'
      '   AND ( HMEMESCOBRANCA       =:PHMEMESCOBRANCA )'
      '   AND ( HMECENTRALIZA        = 1 OR HMEDESTACADO = 1 )'
      
        '   AND ( :PIDCONTRATOEMPTMO   IS NULL OR IDCONTRATOEMPTMO =:PIDC' +
        'ONTRATOEMPTMO )'
      '   AND ( FLGESTORNADO         IS NULL OR FLGESTORNADO = 0 )'
      '   AND ( FLGQUITADO           IS NULL OR FLGQUITADO   = 0 )'
      '   AND ( FLGABONADO           IS NULL OR FLGABONADO   = 0 )'
      ''
      '   AND IDHISTMOVEMPTMO IN'
      '   ('
      '   SELECT'
      '      IDHISTMOVEMPTMO'
      '   FROM'
      '      HISTMOVEMPTMO  H,'
      '      CONTRATOEMPTMO C,'
      '      PARTPREVPLAN   PPP,'
      '      SITPART        SP'
      '   WHERE'
      '          ( H.FLGENVIO              = 0 )'
      '      AND ( H.FLGBAIXADO            = 0 )'
      '      AND ( H.HMEFORMACOBRANCA      = '#39'F'#39' )'
      '      AND ( H.HMEVLREFETIVO         IS NULL )'
      '      AND ( H.HMEANOCOBRANCA        =:PHMEANOCOBRANCA )'
      '      AND ( H.HMEMESCOBRANCA        =:PHMEMESCOBRANCA )'
      '      AND ( H.HMECENTRALIZA         = 1 OR H.HMEDESTACADO = 1 )'
      
        '      AND ( :PIDCONTRATOEMPTMO      IS NULL OR H.IDCONTRATOEMPTM' +
        'O =:PIDCONTRATOEMPTMO )'
      
        '      AND ( :PIDTIPOCONTREMPTMO     IS NULL OR C.IDTIPOCONTREMPT' +
        'MO =:PIDTIPOCONTREMPTMO )'
      
        '      AND ( H.FLGESTORNADO          IS NULL OR H.FLGESTORNADO = ' +
        '0 )'
      
        '      AND ( H.FLGQUITADO            IS NULL OR H.FLGQUITADO   = ' +
        '0 )'
      
        '      AND ( H.FLGABONADO            IS NULL OR H.FLGABONADO   = ' +
        '0 )'
      
        '      AND ( SP.FLGINTERNO           = '#39'AS'#39' OR (SP.FLGINTERNO = '#39 +
        'CA'#39' AND C.IDPESSOA <> C.IDBENEF) )'
      '      AND ( H.IDCONTRATOEMPTMO      = C.IDCONTRATOEMPTMO )'
      '      AND ( C.IDPESSOA              = PPP.IDPESSOA )'
      '      AND ( C.IDPATRO               = PPP.IDPESSJUR )'
      '      AND ( PPP.IDSITPART           = SP.IDSITPART )'
      '      AND PPP.FLGDESATIVADO         = 0'
      '   )')
    ValidateWithMask = True
    Left = 324
    Top = 9
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PHMEANOCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEANOCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end>
  end
  object qryUpdateSitFormaCaR: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   HISTMOVEMPTMO'
      ''
      'SET'
      '   HMEFORMACOBRANCA = '#39'C'#39','
      '   HMETIPOFOLHA     = NULL'
      ''
      'WHERE'
      '       ( HMEFORMACOBRANCA     = '#39'F'#39' )'
      '   AND ( FLGENVIO             = 0 )'
      '   AND ( FLGBAIXADO           = 0 )'
      '   AND ( HMEVLREFETIVO        IS NULL )'
      '   AND ( HMEANOCOBRANCA       =:PHMEANOCOBRANCA )'
      '   AND ( HMEMESCOBRANCA       =:PHMEMESCOBRANCA )'
      '   AND ( HMECENTRALIZA        = 1 OR HMEDESTACADO = 1 )'
      
        '   AND ( :PIDCONTRATOEMPTMO   IS NULL OR IDCONTRATOEMPTMO =:PIDC' +
        'ONTRATOEMPTMO )'
      '   AND ( FLGESTORNADO         IS NULL OR FLGESTORNADO = 0 )'
      '   AND ( FLGQUITADO           IS NULL OR FLGQUITADO   = 0 )'
      '   AND ( FLGABONADO           IS NULL OR FLGABONADO   = 0 )'
      ''
      '   AND IDHISTMOVEMPTMO IN'
      '   ('
      '   SELECT'
      '      IDHISTMOVEMPTMO'
      '   FROM'
      '      HISTMOVEMPTMO  H,'
      '      CONTRATOEMPTMO C,'
      '      PARTPREVPLAN   PPP,'
      '      ELEGPATRO      ELP,'
      '      SITPART        SP,'
      '      SITFUNC        SF'
      '   WHERE'
      '          ('
      '          ( SP.FLGINTERNO        IN ('#39'MA'#39', '#39'MS'#39', '#39'MP'#39') ) OR'
      
        '          ( SP.FLGINTERNO = '#39'CA'#39' AND C.IDPESSOA = C.IDBENEF AND ' +
        'SF.TIPOSIT <> '#39'A'#39' )'
      '          )'
      
        '      AND ( :PFLGEXCEPCIONAL     IS NULL OR (:PFLGEXCEPCIONAL = ' +
        '1 AND ELP.IDPESSJURCEDIDO <>:PIDEMPRESAPROP) )'
      '      AND ( H.HMEFORMACOBRANCA   = '#39'F'#39' )'
      '      AND ( H.FLGENVIO           = 0 )'
      '      AND ( H.FLGBAIXADO         = 0 )'
      '      AND ( H.HMEVLREFETIVO      IS NULL )'
      '      AND ( H.HMEANOCOBRANCA     =:PHMEANOCOBRANCA )'
      '      AND ( H.HMEMESCOBRANCA     =:PHMEMESCOBRANCA )'
      '      AND ( H.HMECENTRALIZA      = 1 OR H.HMEDESTACADO = 1 )'
      
        '      AND ( :PIDCONTRATOEMPTMO   IS NULL OR H.IDCONTRATOEMPTMO =' +
        ':PIDCONTRATOEMPTMO )'
      
        '      AND ( :PIDTIPOCONTREMPTMO  IS NULL OR C.IDTIPOCONTREMPTMO ' +
        '=:PIDTIPOCONTREMPTMO )'
      '      AND ( H.FLGESTORNADO       IS NULL OR H.FLGESTORNADO = 0 )'
      '      AND ( H.FLGQUITADO         IS NULL OR H.FLGQUITADO   = 0 )'
      '      AND ( H.FLGABONADO         IS NULL OR H.FLGABONADO   = 0 )'
      '      AND ( H.IDCONTRATOEMPTMO      = C.IDCONTRATOEMPTMO )'
      '      AND ( C.IDPESSOA              = PPP.IDPESSOA )'
      '      AND ( C.IDPATRO               = PPP.IDPESSJUR )'
      '      AND ( C.IDPESSOA              = ELP.IDPESSOA )'
      '      AND ( C.IDPATRO               = ELP.IDPESSJUR )'
      '      AND ( PPP.IDSITPART           = SP.IDSITPART )'
      '      AND ( ELP.IDSITFUNC           = SF.IDSITFUNC )'
      '      AND PPP.FLGDESATIVADO         = 0'
      '   )')
    ValidateWithMask = True
    Left = 356
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PHMEANOCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFLGEXCEPCIONAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PFLGEXCEPCIONAL'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDEMPRESAPROP'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEANOCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end>
  end
  object qryUpdatePag: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   HISTMOVEMPTMO HME'
      ''
      'SET'
      '   HME.HMERECPAG = '#39'P'#39
      ''
      'WHERE'
      '       ( HME.HMEFORMACOBRANCA = '#39'C'#39' )'
      
        '   AND ( (HME.HMETIPOMOV      IN (1, 2, 3, 4, 6, 7) AND HME.HMEV' +
        'LRPREVISTO < 0) OR (HME.HMETIPOMOV = 0 AND HME.HMEVLRPREVISTO > ' +
        '0) )'
      '   AND ( HME.FLGENVIO         = 0 )'
      '   AND ( HME.FLGBAIXADO       = 0 )'
      '   AND ( HME.HMEVLREFETIVO    IS NULL )'
      '   AND ( HME.HMEANOCOBRANCA   =:PHMEANOCOBRANCA )'
      '   AND ( HME.HMEMESCOBRANCA   =:PHMEMESCOBRANCA )'
      
        '   AND ( HME.HMECENTRALIZA    = 1 OR HME.HMEDESTACADO          =' +
        ' 1 )'
      
        '   AND ( :PIDCONTRATOEMPTMO   IS NULL OR HME.IDCONTRATOEMPTMO  =' +
        ':PIDCONTRATOEMPTMO )'
      
        '   AND ( HME.FLGESTORNADO     IS NULL OR HME.FLGESTORNADO      =' +
        ' 0 )'
      
        '   AND ( HME.FLGQUITADO       IS NULL OR HME.FLGQUITADO        =' +
        ' 0 )'
      
        '   AND ( HME.FLGABONADO       IS NULL OR HME.FLGABONADO        =' +
        ' 0 )')
    ValidateWithMask = True
    Left = 544
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PHMEANOCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
  end
  object qryUpdateRec: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   HISTMOVEMPTMO HME'
      ''
      'SET'
      '   HME.HMERECPAG = '#39'R'#39
      ''
      'WHERE'
      '       ( HME.HMEFORMACOBRANCA = '#39'C'#39' )'
      
        '   AND ( (HME.HMETIPOMOV      IN (1, 2, 3, 4, 6, 7) AND HME.HMEV' +
        'LRPREVISTO >= 0) OR (HME.HMETIPOMOV = 0 AND HME.HMEVLRPREVISTO <' +
        ' 0) )'
      '   AND ( HME.FLGENVIO         = 0 )'
      '   AND ( HME.FLGBAIXADO       = 0 )'
      '   AND ( HME.HMEVLREFETIVO    IS NULL )'
      '   AND ( HME.HMEANOCOBRANCA   =:PHMEANOCOBRANCA )'
      '   AND ( HME.HMEMESCOBRANCA   =:PHMEMESCOBRANCA )'
      
        '   AND ( HME.HMECENTRALIZA    = 1 OR HME.HMEDESTACADO          =' +
        ' 1 )'
      
        '   AND ( :PIDCONTRATOEMPTMO   IS NULL OR HME.IDCONTRATOEMPTMO  =' +
        ':PIDCONTRATOEMPTMO )'
      
        '   AND ( HME.FLGESTORNADO     IS NULL OR HME.FLGESTORNADO      =' +
        ' 0 )'
      
        '   AND ( HME.FLGQUITADO       IS NULL OR HME.FLGQUITADO        =' +
        ' 0 )'
      
        '   AND ( HME.FLGABONADO       IS NULL OR HME.FLGABONADO        =' +
        ' 0 )')
    ValidateWithMask = True
    Left = 292
    Top = 10
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PHMEANOCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOBRANCA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
  end
  object qryParcelasEmAberto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT /*RULE */ DISTINCT HME.HMEPARCELA,'
      
        '(LTRIM(RTRIM(TO_CHAR(HME.HMEANOCOMPETENCIA, '#39'0000'#39')))) || (LTRIM' +
        '(RTRIM(TO_CHAR(HME.HMEMESCOMPETENCIA, '#39'00'#39')))) AS COMPET'
      ''
      'FROM'
      '   HISTMOVEMPTMO HME'
      ''
      'WHERE'
      '       ( HME.IDCONTRATOEMPTMO    =:PIDCONTRATOEMPTMO )'
      '   AND ( HME.HMEFORMACOBRANCA    = '#39'F'#39' )'
      '   AND ( HME.FLGBAIXADO          = 0 )'
      '   AND ( HME.HMEDATAEFETIVA      IS NULL )'
      '   AND ( HME.HMEVLREFETIVO       IS NULL )'
      '   AND ( HME.HMETIPOMOV          NOT IN (0, 5, 8) )'
      
        '   AND (LTRIM(RTRIM(TO_CHAR(HME.HMEANOCOMPETENCIA, '#39'0000'#39')))) ||' +
        ' (LTRIM(RTRIM(TO_CHAR(HME.HMEMESCOMPETENCIA, '#39'00'#39')))) <=:PANOMES'
      
        '   AND (LTRIM(RTRIM(TO_CHAR(HME.HMEANOCOBRANCA, '#39'0000'#39'))))    ||' +
        ' (LTRIM(RTRIM(TO_CHAR(HME.HMEMESCOBRANCA, '#39'00'#39'))))     =:PANOMES'
      
        '   AND ( (HME.HMECENTRALIZA      = 1) OR (HME.HMEDESTACADO = 1) ' +
        ')'
      '   AND NVL(HME.FLGESTORNADO, 0)  = 0'
      '   AND NVL(HME.FLGQUITADO, 0)    = 0'
      '   AND NVL(HME.FLGABONADO, 0)    = 0'
      ''
      'ORDER BY'
      '   HME.HMEPARCELA'
      ' ')
    ValidateWithMask = True
    Left = 704
    Top = 60
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pAnoMes'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PANOMES'
        ParamType = ptInput
      end>
    object qryParcelasEmAbertoHMEPARCELA: TFloatField
      FieldName = 'HMEPARCELA'
    end
  end
  object qryBuscaTipoContr: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    IDTIPOCONTREMPTMO'
      'FROM'
      '    TIPOCONTREMPTMO'
      'WHERE'
      '    IDTIPOCONTREMPTMO = :PIDTIPOCONTREMPTMO')
    ValidateWithMask = True
    Left = 385
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end>
    object qryBuscaTipoContrIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.IDTIPOCONTREMPTMO'
    end
  end
  object qryUpdateRubricaFUNCEF: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   HISTMOVEMPTMO'
      ''
      'SET'
      '   IDRUBRICA ='
      '   ('
      '   SELECT'
      
        '      DECODE(:PRUBRICA, '#39'N'#39', ITC.IDPROVENTON, '#39'A'#39', ITC.IDPROVENT' +
        'OA, '#39'D'#39', ITC.IDPROVENTOD) AS RUBRICA'
      '   FROM'
      '      ITEMXTIPOCONTR ITC'
      '   WHERE'
      '          ( ITC.IDTIPOCONTREMPTMO =:PIDTIPOCONTREMPTMO )'
      '      AND ( ITC.IDITEMEMPTMO      =:PIDITEMEMPTMO )'
      '   )'
      'WHERE'
      '   ( IDHISTMOVEMPTMO      =:PIDHISTMOVEMPTMO )')
    ValidateWithMask = True
    Left = 416
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'PRUBRICA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDITEMEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDHISTMOVEMPTMO'
        ParamType = ptInput
      end>
  end
  object qryContratosDevedores_OLD: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CNT.IDCONTRATOEMPTMO,'
      '   CNT.NUMPARCDESCONTO'
      'FROM'
      '   CONTRATOEMPTMO CNT'
      'WHERE'
      '       CNT.FLGSITUACAO <> '#39'C'#39
      '   AND IDCONTRATOEMPTMO IN'
      '         ('
      '         SELECT'
      '            DISTINCT IDCONTRATOEMPTMO'
      '         FROM'
      '            HISTMOVEMPTMO'
      '         WHERE'
      '                HMETIPOMOV             NOT IN (0, 5, 8)'
      '            AND HMEPARCELA             > 0'
      '            AND FLGBAIXADO             = 0'
      '            AND HMEFORMACOBRANCA       = '#39'F'#39
      '            AND NVL(FLGESTORNADO, 0)   = 0'
      '            AND HMEVLREFETIVO          IS NULL'
      '            AND HMEDATAEFETIVA         IS NULL'
      
        '            AND (:PIDCONTRATOEMPTMO    IS NULL OR IDCONTRATOEMPT' +
        'MO =:PIDCONTRATOEMPTMO)'
      '            AND (HMECENTRALIZA         = 1 OR HMEDESTACADO = 1)'
      
        '            AND (LTRIM(RTRIM(TO_CHAR(HMEANOCOMPETENCIA, '#39'0000'#39'))' +
        ')) ||'
      
        '                (LTRIM(RTRIM(TO_CHAR(HMEMESCOMPETENCIA, '#39'00'#39'))))' +
        ' < :pAnoMes'
      '         )')
    ValidateWithMask = True
    Left = 575
    Top = 8
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
        Value = '328969'
      end
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'pAnoMes'
        ParamType = ptInput
        Value = '200305'
      end>
  end
  object qryContratosDevedores: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '   CON.IDCONTRATOEMPTMO,'
      '   TCE.FLGENVIAPARCMES,'
      '   TCE.NUMPARCDESCONTO,'
      '   NVL(TCE.TCETRATAPARCATRAS,'#39'I'#39') AS TCETRATAPARCATRAS'
      'FROM'
      '   HISTMOVEMPTMO   HME,'
      '   CONTRATOEMPTMO  CON,'
      '   ELEGPATRO       ELP,'
      '   TIPOCONTREMPTMO TCE'
      'WHERE'
      '       CON.FLGSITUACAO           NOT IN ('#39'C'#39', '#39'Q'#39')'
      '   AND HME.HMETIPOMOV            NOT IN (5, 8)'
      '   AND HME.HMEANOCOBRANCA        = 2005'
      '   AND HME.HMEMESCOBRANCA        = 9'
      '   AND HME.HMEPARCELA            > 0'
      '   AND HME.FLGBAIXADO            = 0'
      '   AND HME.HMEFORMACOBRANCA      = '#39'F'#39
      '   AND NVL(HME.FLGESTORNADO, 0)  = 0'
      '   AND HME.HMEVLREFETIVO         IS NULL'
      '   AND HME.HMEDATAEFETIVA        IS NULL'
      '   AND (HME.HMECENTRALIZA        = 1 OR HME.HMEDESTACADO = 1)'
      '   AND CON.IDCONTRATOEMPTMO      = -1'
      
        '   AND TO_NUMBER((LTRIM(RTRIM(TO_CHAR(HMEANOCOMPETENCIA, '#39'0000'#39')' +
        '))) ||'
      
        '                 (LTRIM(RTRIM(TO_CHAR(HMEMESCOMPETENCIA, '#39'00'#39')))' +
        ')'
      '                ) <= 200509'
      '   AND CON.IDPATRO               = ELP.IDPESSJUR'
      '   AND CON.IDPESSOA              = ELP.IDPESSOA'
      '   AND CON.IDTIPOCONTREMPTMO     = TCE.IDTIPOCONTREMPTMO'
      '   AND HME.IDCONTRATOEMPTMO      = CON.IDCONTRATOEMPTMO '
      '')
    ValidateWithMask = True
    Left = 677
    Top = 60
    object qryContratosDevedoresIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryContratosDevedoresFLGENVIAPARCMES: TFloatField
      FieldName = 'FLGENVIAPARCMES'
    end
    object qryContratosDevedoresNUMPARCDESCONTO: TFloatField
      FieldName = 'NUMPARCDESCONTO'
    end
    object qryContratosDevedoresTCETRATAPARCATRAS: TStringField
      FieldName = 'TCETRATAPARCATRAS'
      Size = 1
    end
  end
  object qryMarcaNaoEnviar: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE '
      '   HISTMOVEMPTMO'
      'SET'
      '   FLGENVIO         = 2'
      'WHERE'
      '       IDCONTRATOEMPTMO =:PIDCONTRATOEMPTMO'
      '   AND HMEPARCELA       =:PHMEPARCELA'
      ' ')
    ValidateWithMask = True
    Left = 643
    Top = 7
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEPARCELA'
        ParamType = ptInput
      end>
  end
  object qryDesmarcaNaoEnviarOld: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE '
      '   HISTMOVEMPTMO'
      'SET'
      '   FLGENVIO  = 0'
      'WHERE'
      '    FLGENVIO = 2'
      ''
      '')
    ValidateWithMask = True
    Left = 448
    Top = 8
  end
  object qryDesmarcaNaoEnviar: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE '
      '   HISTMOVEMPTMO'
      'SET'
      '   FLGENVIO  = 0'
      'WHERE'
      '    FLGENVIO = 2'
      'AND IDCONTRATOEMPTMO =:PIDCONTRATOEMPTMO'
      'AND HMEPARCELA       =:PHMEPARCELA'
      '')
    ValidateWithMask = True
    Left = 480
    Top = 8
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEPARCELA'
        ParamType = ptInput
      end>
  end
  object QryPlano1: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'select IDPLANOPREV, NOME, IDPLANOPREVPREV  from planprevcontabil' +
        ' where ativo = '#39'S'#39)
    ValidateWithMask = True
    Left = 689
    Top = 386
    object QryPlano1NOME: TStringField
      FieldName = 'NOME'
    end
    object QryPlano1IDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object QryPlano1IDPLANOPREVPREV: TFloatField
      FieldName = 'IDPLANOPREVPREV'
    end
  end
  object QryPlano2: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'select IDPLANOPREV, NOME, IDPLANOPREVPREV  from planprevcontabil' +
        ' where ativo = '#39'S'#39)
    ValidateWithMask = True
    Left = 721
    Top = 386
    object QryPlano2NOME: TStringField
      FieldName = 'NOME'
    end
    object QryPlano2IDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object QryPlano2IDPLANOPREVPREV: TFloatField
      FieldName = 'IDPLANOPREVPREV'
    end
  end
  object QryPlano3: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'select IDPLANOPREV, NOME, IDPLANOPREVPREV  from planprevcontabil' +
        ' where ativo = '#39'S'#39)
    ValidateWithMask = True
    Left = 689
    Top = 418
    object QryPlano3NOME: TStringField
      FieldName = 'NOME'
    end
    object QryPlano3IDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object QryPlano3IDPLANOPREVPREV: TFloatField
      FieldName = 'IDPLANOPREVPREV'
    end
  end
  object QryPlano4: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'select IDPLANOPREV, NOME, IDPLANOPREVPREV  from planprevcontabil' +
        ' where ativo = '#39'S'#39)
    ValidateWithMask = True
    Left = 721
    Top = 418
    object QryPlano4NOME: TStringField
      FieldName = 'NOME'
    end
    object QryPlano4IDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object QryPlano4IDPLANOPREVPREV: TFloatField
      FieldName = 'IDPLANOPREVPREV'
    end
  end
  object DscPlano1: TDataSource
    DataSet = QryPlano1
    Left = 688
    Top = 375
  end
  object DscPlano2: TDataSource
    DataSet = QryPlano2
    Left = 720
    Top = 375
  end
  object DscPlano3: TDataSource
    DataSet = QryPlano3
    Left = 688
    Top = 431
  end
  object DscPlano4: TDataSource
    DataSet = QryPlano4
    Left = 720
    Top = 431
  end
  object QryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 691
    Top = 341
  end
  object QryAuxConsulta: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 721
    Top = 341
  end
end
