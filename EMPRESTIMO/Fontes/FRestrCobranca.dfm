inherited frmRestrCobranca: TfrmRestrCobranca
  Left = 167
  Top = 40
  Caption = 'Restrição de Cobrança'
  ClientHeight = 609
  ClientWidth = 1078
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 1078
    Height = 523
    inherited pnlMestre: TPanel
      Width = 1076
      Height = 10
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 11
      Width = 1076
      Height = 511
      Tabs.Strings = (
        'Pessoa'
        'Matrícula'
        'Contrato'
        'Cargo')
      inherited pgctrlDetalhe: TPageControl
        Width = 1055
        Height = 452
        ActivePage = tbsContrato
        inherited tbsDet: TTabSheet
          Caption = 'tbsDet'
          inherited dbgrdDet: TwwDBGrid
            Width = 1047
            Height = 424
            Visible = False
          end
          inherited pnlControlesDet: TPanel
            Width = 1047
            Height = 424
            object lblEventosCob: TLabel
              Left = 769
              Top = 8
              Width = 122
              Height = 13
              Caption = 'Eventos de cobrança'
            end
            object lblObsPessoaA: TLabel
              Left = 16
              Top = 248
              Width = 69
              Height = 13
              Caption = 'Observação'
            end
            object chkLstEventosCobA: TCheckListBox
              Left = 767
              Top = 22
              Width = 271
              Height = 401
              Enabled = False
              ItemHeight = 13
              TabOrder = 0
            end
            object dbmmoObsPessoaB: TDBMemo
              Left = 16
              Top = 262
              Width = 737
              Height = 160
              DataField = 'OBSERVACAO'
              DataSource = dsDet
              ReadOnly = True
              TabOrder = 1
            end
            object dbgrdPessoa: TwwDBGrid
              Left = 15
              Top = 16
              Width = 737
              Height = 230
              Selected.Strings = (
                'NUMDOCUMENTO'#9'25'#9'CPF'
                'NOME'#9'70'#9'Nome')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              DataSource = dsDet
              ReadOnly = True
              TabOrder = 2
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
          object pnlPessoaEdt: TPanel
            Left = 0
            Top = 0
            Width = 1047
            Height = 424
            Align = alClient
            TabOrder = 2
            object lblobservacao: TLabel
              Left = 16
              Top = 66
              Width = 69
              Height = 13
              Caption = 'Observação'
            end
            object btnProcPessoa: TToolbarButton97
              Left = 757
              Top = 31
              Width = 29
              Height = 25
              AllowAllUp = True
              GroupIndex = 1
              Flat = False
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
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
              ImageIndex = 3
              Images = ImlPadrao
              Layout = blGlyphTop
              Opaque = False
              Spacing = 0
              OnClick = btnProcPessoaClick
            end
            object lblNome: TLabel
              Left = 279
              Top = 19
              Width = 33
              Height = 13
              Caption = 'Nome'
            end
            object lblCPF02: TLabel
              Left = 18
              Top = 19
              Width = 24
              Height = 13
              Caption = 'CPF'
            end
            object dbmmoObsPessB: TDBMemo
              Left = 16
              Top = 82
              Width = 505
              Height = 325
              DataField = 'OBSERVACAO'
              DataSource = dsDet
              TabOrder = 2
            end
            object grbEventosCob: TGroupBox
              Left = 532
              Top = 79
              Width = 509
              Height = 328
              Caption = 'Eventos de cobrança'
              TabOrder = 3
              object chkRestringirEvento: TCheckBox
                Left = 8
                Top = 19
                Width = 185
                Height = 17
                Caption = 'Restringir todos os eventos'
                Checked = True
                State = cbChecked
                TabOrder = 0
                OnClick = chkRestringirEventoClick
              end
              object chkLstEventosCobB: TCheckListBox
                Left = 7
                Top = 38
                Width = 490
                Height = 283
                Enabled = False
                ItemHeight = 13
                TabOrder = 1
              end
            end
            object dbedtNomePess: TwwDBEdit
              Left = 279
              Top = 36
              Width = 474
              Height = 21
              DataField = 'NOME'
              DataSource = dsDet
              Enabled = False
              ReadOnly = True
              TabOrder = 1
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbedtCPFPess: TwwDBEdit
              Left = 18
              Top = 36
              Width = 249
              Height = 21
              DataField = 'NUMDOCUMENTO'
              DataSource = dsDet
              Enabled = False
              ReadOnly = True
              TabOrder = 0
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
          end
        end
        object tbsMat: TTabSheet
          Caption = 'tbsMat'
          ImageIndex = 1
          object pnlMat: TPanel
            Left = 0
            Top = 0
            Width = 1047
            Height = 424
            Align = alClient
            TabOrder = 1
            object Label2: TLabel
              Left = 16
              Top = 239
              Width = 69
              Height = 13
              Caption = 'Observação'
            end
            object dbmmoMatObsA: TDBMemo
              Left = 15
              Top = 253
              Width = 1026
              Height = 165
              DataField = 'OBSERVACAO'
              DataSource = dsMat
              ReadOnly = True
              TabOrder = 0
            end
            object dbgrdMat: TwwDBGrid
              Left = 16
              Top = 9
              Width = 1025
              Height = 220
              Selected.Strings = (
                'MATRICULA'#9'15'#9'Matrícula'
                'NOME'#9'90'#9'Nome'
                'NUMDOCUMENTO'#9'30'#9'CPF')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              DataSource = dsMat
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
              IndicatorColor = icBlack
            end
          end
          object pnlMatEdt: TPanel
            Left = 0
            Top = 0
            Width = 1047
            Height = 424
            Align = alClient
            Caption = 'pnlMatEdt'
            TabOrder = 0
            object lblMatB: TLabel
              Left = 32
              Top = 23
              Width = 55
              Height = 13
              Caption = 'Matrícula'
            end
            object lblNomeMat: TLabel
              Left = 200
              Top = 23
              Width = 33
              Height = 13
              Caption = 'Nome'
            end
            object lblCPFMat: TLabel
              Left = 688
              Top = 23
              Width = 24
              Height = 13
              Caption = 'CPF'
            end
            object btnProcMat: TToolbarButton97
              Left = 912
              Top = 35
              Width = 29
              Height = 25
              AllowAllUp = True
              GroupIndex = 1
              Flat = False
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
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
              ImageIndex = 3
              Images = ImlPadrao
              Layout = blGlyphTop
              Opaque = False
              Spacing = 0
              OnClick = btnProcMatClick
            end
            object lblObsMatB: TLabel
              Left = 32
              Top = 88
              Width = 69
              Height = 13
              Caption = 'Observação'
            end
            object dbedtMat: TwwDBEdit
              Left = 32
              Top = 39
              Width = 161
              Height = 21
              DataField = 'MATRICULA'
              DataSource = dsMat
              Enabled = False
              ReadOnly = True
              TabOrder = 0
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbedtNomeMat: TwwDBEdit
              Left = 200
              Top = 39
              Width = 481
              Height = 21
              DataField = 'NOME'
              DataSource = dsMat
              Enabled = False
              ReadOnly = True
              TabOrder = 1
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbedtCPFMat: TwwDBEdit
              Left = 688
              Top = 39
              Width = 217
              Height = 21
              DataField = 'NUMDOCUMENTO'
              DataSource = dsMat
              Enabled = False
              ReadOnly = True
              TabOrder = 2
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbmmoObsMatB: TDBMemo
              Left = 32
              Top = 104
              Width = 913
              Height = 281
              DataField = 'OBSERVACAO'
              DataSource = dsMat
              TabOrder = 3
            end
          end
        end
        object tbsContrato: TTabSheet
          Caption = 'tbsContrato'
          ImageIndex = 2
          object pnlContrato: TPanel
            Left = 0
            Top = 0
            Width = 1047
            Height = 424
            Align = alClient
            TabOrder = 0
            object lblObsContratoA: TLabel
              Left = 16
              Top = 239
              Width = 69
              Height = 13
              Caption = 'Observação'
            end
            object dbgrdContrato: TwwDBGrid
              Left = 16
              Top = 9
              Width = 1025
              Height = 217
              Selected.Strings = (
                'IDCONTRATOEMPTMO'#9'20'#9'Contrato'
                'TCEDESCRICAO'#9'40'#9'Modalidade'
                'MATRICULA'#9'15'#9'Matrícula'
                'NOME'#9'40'#9'Nome'
                'NUMDOCUMENTO'#9'20'#9'CPF')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              DataSource = dsContrato
              ReadOnly = True
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
            object dbmmoContratoObsA: TDBMemo
              Left = 15
              Top = 253
              Width = 1025
              Height = 165
              DataField = 'OBSERVACAO'
              DataSource = dsContrato
              ReadOnly = True
              TabOrder = 1
            end
          end
          object pnlContrEdt: TPanel
            Left = 0
            Top = 0
            Width = 1047
            Height = 424
            Align = alClient
            TabOrder = 1
            object lblNumContrato: TLabel
              Left = 32
              Top = 25
              Width = 114
              Height = 13
              Caption = 'Número do Contrato'
            end
            object lblModalidade: TLabel
              Left = 240
              Top = 25
              Width = 66
              Height = 13
              Caption = 'Modalidade'
            end
            object lblMatContr: TLabel
              Left = 32
              Top = 66
              Width = 55
              Height = 13
              Caption = 'Matrícula'
            end
            object lblNomeContr: TLabel
              Left = 240
              Top = 66
              Width = 33
              Height = 13
              Caption = 'Nome'
            end
            object lblCPFContr: TLabel
              Left = 720
              Top = 66
              Width = 24
              Height = 13
              Caption = 'CPF'
            end
            object lblObsContratoB: TLabel
              Left = 32
              Top = 112
              Width = 69
              Height = 13
              Caption = 'Observação'
            end
            object btnProcContrato: TToolbarButton97
              Left = 720
              Top = 36
              Width = 29
              Height = 25
              AllowAllUp = True
              GroupIndex = 1
              Flat = False
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
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
              ImageIndex = 3
              Images = ImlPadrao
              Layout = blGlyphTop
              Opaque = False
              Spacing = 0
              OnClick = btnProcContratoClick
            end
            object dbedtNumContrato: TwwDBEdit
              Left = 32
              Top = 41
              Width = 201
              Height = 21
              DataField = 'IDCONTRATOEMPTMO'
              DataSource = dsContrato
              Enabled = False
              ReadOnly = True
              TabOrder = 0
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbedtModalidade: TwwDBEdit
              Left = 240
              Top = 40
              Width = 474
              Height = 21
              DataField = 'TCEDESCRICAO'
              DataSource = dsContrato
              Enabled = False
              ReadOnly = True
              TabOrder = 1
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbedtMatContr: TwwDBEdit
              Left = 32
              Top = 82
              Width = 201
              Height = 21
              DataField = 'MATRICULA'
              DataSource = dsContrato
              Enabled = False
              ReadOnly = True
              TabOrder = 2
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbedtNomeContr: TwwDBEdit
              Left = 240
              Top = 82
              Width = 474
              Height = 21
              DataField = 'NOME'
              DataSource = dsContrato
              Enabled = False
              ReadOnly = True
              TabOrder = 3
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbedtCPFContr: TwwDBEdit
              Left = 720
              Top = 82
              Width = 161
              Height = 21
              DataField = 'NUMDOCUMENTO'
              DataSource = dsContrato
              Enabled = False
              ReadOnly = True
              TabOrder = 4
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbmmoObsContratoB: TDBMemo
              Left = 32
              Top = 126
              Width = 1001
              Height = 292
              DataField = 'OBSERVACAO'
              DataSource = dsContrato
              TabOrder = 5
            end
          end
        end
        object tbsCargo: TTabSheet
          Caption = 'tbsCargo'
          ImageIndex = 3
          object pnlCargo: TPanel
            Left = 0
            Top = 0
            Width = 1047
            Height = 424
            Align = alClient
            TabOrder = 1
            object lblObsCargoA: TLabel
              Left = 16
              Top = 239
              Width = 69
              Height = 13
              Caption = 'Observação'
            end
            object dbgrdCargo: TwwDBGrid
              Left = 16
              Top = 9
              Width = 1024
              Height = 217
              Selected.Strings = (
                'CODIGO'#9'20'#9'Código'
                'TITULO'#9'60'#9'Título'
                'NOME'#9'55'#9'Patrocinadora')
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              DataSource = dsCargo
              ReadOnly = True
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
            object dbmmoCargoObsA: TDBMemo
              Left = 15
              Top = 253
              Width = 1025
              Height = 165
              DataField = 'OBSERVACAO'
              DataSource = dsCargo
              ReadOnly = True
              TabOrder = 1
            end
          end
          object pnlCargoEdt: TPanel
            Left = 0
            Top = 0
            Width = 1047
            Height = 424
            Align = alClient
            TabOrder = 0
            object lblCod: TLabel
              Left = 8
              Top = 18
              Width = 40
              Height = 13
              Caption = 'Código'
            end
            object lblTitulo: TLabel
              Left = 176
              Top = 18
              Width = 35
              Height = 13
              Caption = 'Título'
            end
            object lblPatro: TLabel
              Left = 680
              Top = 18
              Width = 80
              Height = 13
              Caption = 'Patrocinadora'
            end
            object btnProcCargo: TToolbarButton97
              Left = 1008
              Top = 27
              Width = 29
              Height = 25
              AllowAllUp = True
              GroupIndex = 1
              Flat = False
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                04000000000000010000120B0000120B00001000000000000000000000000000
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
              ImageIndex = 3
              Images = ImlPadrao
              Layout = blGlyphTop
              Opaque = False
              Spacing = 0
              OnClick = btnProcCargoClick
            end
            object lblObsCargoB: TLabel
              Left = 8
              Top = 75
              Width = 69
              Height = 13
              Caption = 'Observação'
            end
            object dbedtCod: TwwDBEdit
              Left = 8
              Top = 34
              Width = 161
              Height = 21
              DataField = 'CODIGO'
              DataSource = dsCargo
              Enabled = False
              ReadOnly = True
              TabOrder = 0
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbedtTitulo: TwwDBEdit
              Left = 176
              Top = 34
              Width = 497
              Height = 21
              DataField = 'TITULO'
              DataSource = dsCargo
              Enabled = False
              ReadOnly = True
              TabOrder = 1
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbedtPatro: TwwDBEdit
              Left = 680
              Top = 34
              Width = 321
              Height = 21
              DataField = 'NOME'
              DataSource = dsCargo
              Enabled = False
              ReadOnly = True
              TabOrder = 2
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbmmoObsCargoB: TDBMemo
              Left = 8
              Top = 91
              Width = 1033
              Height = 319
              DataField = 'OBSERVACAO'
              DataSource = dsCargo
              TabOrder = 3
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 1068
        object btnConfirmarDetalhe: TBitBtn
          Left = 880
          Top = 2
          Width = 94
          Height = 27
          Caption = 'Confirmar'
          TabOrder = 1
          Visible = False
          OnClick = bbtnOkDetClick
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
          NumGlyphs = 2
        end
        object btnCancelarDetalhe: TBitBtn
          Left = 976
          Top = 2
          Width = 85
          Height = 27
          Cancel = True
          Caption = 'Cancelar'
          TabOrder = 2
          Visible = False
          OnClick = bbtnCancelarDetClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888FFFFF8888888888000008888888888F777778FF888888009191900
            88888887788888778F88887991919191088888788888888878F8879919191919
            108887F888F888F887F887917F919F719088878887FF87FF878F7919FFF9FFF9
            19087F88777F7778887F79919FFFFF9191087F8887777788887F791919FFF919
            19087F8888777FF8887F79919FFFFF9191087F88877777FF887F7919FFF9FFF9
            190878F877787778887887917F919F71908887F88788878887F8879919191919
            1088878F88888888878888799191919108888878FF88888F7888888779999977
            8888888778FFFF77888888888777778888888888877777888888}
          NumGlyphs = 2
          Spacing = -1
        end
      end
      inherited Dock974: TDock97
        Left = 1059
        Width = 13
        Height = 452
        Visible = False
        inherited tb97Detalhe: TToolbar97
          inherited bbtnOkDet: TBitBtn
            Width = 8
          end
          inherited bbtnCancelarDet: TBitBtn
            Width = 8
          end
          inherited bbtnVoltarDet: TBitBtn
            Width = 8
          end
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 1078
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 570
    Width = 1078
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        'TDBMemo'
        'Text'
        0))
  end
  inherited dsDet: TwwDataSource
    DataSet = qryPessoa
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT IDPESSOA FROM PESSOA WHERE ROWNUM = 1')
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 484
    Top = 58
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 352
    Top = 232
  end
  object msPessoa: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'P.NUMDOCUMENTO'
      'P.NOME'
      'D.MATRICULA')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'C.P.F.'
      'Nome'
      'Matrícula')
    SensivelACaixa.Strings = (
      'N'
      'S'
      'S')
    Tabelas.Strings = (
      'PESSOA P'
      'DEPENTIT D')
    CamposChave.Strings = (
      'P.IDPESSOA'
      'P.NUMDOCUMENTO'
      'P.NOME')
    Filtro.Strings = (
      'D.IDPESSOA = P.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '18'
      '60'
      '10')
    OperComparador.Strings = (
      '0'
      '0'
      '1')
    ApenasLetraENum.Strings = (
      'N'
      'N'
      'N')
    ComparaMaiuscula.Strings = (
      ''
      ''
      '')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      '')
    Left = 258
    Top = 280
  end
  object msContrato: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'C.IDCONTRATOEMPTMO'
      'P.NOME'
      'D.MATRICULA'
      'T.TCEDESCRICAO'
      'P.NUMDOCUMENTO')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Contrato'
      'Nome'
      'Matrícula'
      'Modalidade'
      'C.P.F.')
    SensivelACaixa.Strings = (
      'N'
      'S'
      'S'
      'S'
      'S')
    Tabelas.Strings = (
      'CONTRATOEMPTMO C'
      'PESSOA P'
      'DEPENTIT D'
      'TIPOCONTREMPTMO T')
    CamposChave.Strings = (
      'C.IDCONTRATOEMPTMO'
      'T.TCEDESCRICAO'
      'D.MATRICULA'
      'P.NOME'
      'P.NUMDOCUMENTO')
    Filtro.Strings = (
      'C.IDPESSOA = P.IDPESSOA'
      'D.IDPESSOA = P.IDPESSOA'
      'C.IDTIPOCONTREMPTMO = T.IDTIPOCONTREMPTMO')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '15'
      '60'
      '10'
      '10'
      '10')
    OperComparador.Strings = (
      '0'
      '0'
      '1'
      '0'
      '0')
    ApenasLetraENum.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    ComparaMaiuscula.Strings = (
      ''
      ''
      ''
      ''
      '')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      '')
    Left = 258
    Top = 344
  end
  object msCargo: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Cargos ou Funções'
    Colunas.Strings = (
      'C.CODIGO'
      'C.TITULO'
      'C.NOMERESUMIDO'
      'P.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Título do Cargo'
      'Nome Resumido'
      'Patrocinadora')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'S'
      'N')
    Tabelas.Strings = (
      'CARGOEXT C'
      'PESSOA P')
    CamposChave.Strings = (
      'C.IDCARGOEXT'
      'C.IDPESSJUR'
      'C.CODIGO'
      'C.TITULO'
      'P.NOME')
    Filtro.Strings = (
      'C.IDPESSJUR = P.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '20'
      '20'
      '40')
    OperComparador.Strings = (
      '0'
      '0'
      '1'
      '0')
    ApenasLetraENum.Strings = (
      'N'
      'N'
      'N'
      'N')
    ComparaMaiuscula.Strings = (
      ''
      ''
      ''
      '')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      '')
    Left = 338
    Top = 288
  end
  object qryPessoa: TwwQuery
    CachedUpdates = True
    BeforeDelete = qryPessoaBeforeDelete
    AfterScroll = qryPessoaAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.IDPESSOA, '
      '       R.OBSERVACAO, '
      '       P.NUMDOCUMENTO, '
      '       P.NOME'
      '  FROM PESSOA P, RESTRCOBRPESSOA R'
      ' WHERE P.IDPESSOA = R.IDPESSOA'
      'ORDER BY P.NOME')
    UpdateObject = updPessoa
    ValidateWithMask = True
    Left = 112
    Top = 280
  end
  object qryMat: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.IDPESSOA, '
      '       R.OBSERVACAO, '
      '       P.NUMDOCUMENTO, '
      '       P.NOME,'
      '       D.MATRICULA,'
      '       D.IDTITULAR'
      '  FROM PESSOA P, RESTRCOBRMATRICULA R, DEPENTIT D'
      ' WHERE P.IDPESSOA = R.IDPESSOA'
      '   AND D.IDPESSOA = P.IDPESSOA'
      ' ORDER BY D.MATRICULA')
    UpdateObject = updMat
    ValidateWithMask = True
    Left = 192
    Top = 216
  end
  object qryContrato: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT C.IDCONTRATOEMPTMO, '
      '       R.OBSERVACAO,'
      '       T.TCEDESCRICAO, '
      '       P.NUMDOCUMENTO, '
      '       P.NOME, '
      '       D.MATRICULA'
      '  FROM RESTRCOBRCONTRATO R, '
      '       CONTRATOEMPTMO C, '
      '       DEPENTIT D, '
      '       PESSOA P,'
      '       TIPOCONTREMPTMO T'
      ' WHERE '
      '       R.IDCONTRATOEMPTMO = C.IDCONTRATOEMPTMO'
      '   AND C.IDTIPOCONTREMPTMO = T.IDTIPOCONTREMPTMO'
      '   AND C.IDPESSOA = P.IDPESSOA'
      '   AND D.IDPESSOA = P.IDPESSOA'
      'ORDER BY C.IDTIPOCONTREMPTMO '
      '    ')
    UpdateObject = updContrato
    ValidateWithMask = True
    Left = 144
    Top = 296
  end
  object updPessoa: TUpdateSQL
    ModifySQL.Strings = (
      'UPDATE RESTRCOBRPESSOA SET'
      ' IDPESSOA = :IDPESSOA,'
      ' OBSERVACAO = :OBSERVACAO'
      'WHERE IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'INSERT INTO RESTRCOBRPESSOA (IDPESSOA, OBSERVACAO)'
      ' VALUES (:IDPESSOA, :OBSERVACAO)')
    DeleteSQL.Strings = (
      'DELETE FROM RESTRCOBRPESSOA '
      'WHERE IDPESSOA = :OLD_IDPESSOA'
      ' ')
    Left = 692
    Top = 282
  end
  object updMat: TUpdateSQL
    ModifySQL.Strings = (
      'UPDATE RESTRCOBRMATRICULA SET'
      '  IDPESSOA = :IDPESSOA,'
      '  IDTITULAR = :IDTITULAR,'
      '  OBSERVACAO = :OBSERVACAO'
      'WHERE IDPESSOA = :OLD_IDPESSOA'
      '    AND IDTITULAR = :OLD_IDTITULAR')
    InsertSQL.Strings = (
      'INSERT INTO RESTRCOBRMATRICULA(IDPESSOA, IDTITULAR, OBSERVACAO) '
      '        VALUES (:IDPESSOA, :IDTITULAR, :OBSERVACAO)')
    DeleteSQL.Strings = (
      'DELETE FROM RESTRCOBRMATRICULA '
      'WHERE IDPESSOA = :OLD_IDPESSOA'
      '    AND IDTITULAR = :OLD_IDTITULAR')
    Left = 652
    Top = 290
  end
  object updContrato: TUpdateSQL
    ModifySQL.Strings = (
      'UPDATE RESTRCOBRCONTRATO SET'
      '  IDCONTRATOEMPTMO = :IDCONTRATOEMPTMO, '
      '  OBSERVACAO = :OBSERVACAO'
      'WHERE IDCONTRATOEMPTMO = :OLD_IDCONTRATOEMPTMO')
    InsertSQL.Strings = (
      'INSERT INTO RESTRCOBRCONTRATO(IDCONTRATOEMPTMO, OBSERVACAO)'
      '  VALUES (:IDCONTRATOEMPTMO, :OBSERVACAO)')
    DeleteSQL.Strings = (
      'DELETE FROM RESTRCOBRCONTRATO '
      'WHERE IDCONTRATOEMPTMO = :OLD_IDCONTRATOEMPTMO')
    Left = 788
    Top = 210
  end
  object updCargo: TUpdateSQL
    ModifySQL.Strings = (
      'UPDATE  RESTRCOBRCARGO SET '
      '  IDCARGOEXT = :IDCARGOEXT,  '
      '  IDPESSJUR = :IDPESSJUR,'
      '  OBSERVACAO = :OBSERVACAO'
      ' WHERE IDCARGOEXT = :OLD_IDCARGOEXT'
      '      and IDPESSJUR = :OLD_IDPESSJUR')
    InsertSQL.Strings = (
      'INSERT INTO RESTRCOBRCARGO (IDCARGOEXT, IDPESSJUR, OBSERVACAO)'
      '  VALUES  (:IDCARGOEXT, :IDPESSJUR, :OBSERVACAO)')
    DeleteSQL.Strings = (
      'DELETE FROM RESTRCOBRCARGO '
      ' WHERE IDCARGOEXT = :OLD_IDCARGOEXT'
      '      and IDPESSJUR = :OLD_IDPESSJUR')
    Left = 820
    Top = 258
  end
  object dsMat: TwwDataSource
    AutoEdit = False
    DataSet = qryMat
    Left = 411
    Top = 130
  end
  object dsContrato: TwwDataSource
    AutoEdit = False
    DataSet = qryContrato
    Left = 387
    Top = 186
  end
  object dsCargo: TwwDataSource
    AutoEdit = False
    DataSet = qryCargo
    Left = 459
    Top = 250
  end
  object qryPessoaXEventos: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT R.IDPESSOA,'
      '             R.IDTIPOEVENTOCOBEMPTMO,'
      '             T.DESCEVENTOCOB'
      '  FROM RESTRCOBRPESSOAXEVENTO R, TIPOEVENTOCOBEMPTMO T'
      'WHERE  R.IDTIPOEVENTOCOBEMPTMO = T.IDTIPOEVENTOCOBEMPTMO'
      '           ')
    UpdateObject = updPessoaXEventos
    ValidateWithMask = True
    Left = 128
    Top = 376
  end
  object msMat: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'P.NUMDOCUMENTO'
      'P.NOME'
      'D.MATRICULA')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'C.P.F.'
      'Nome'
      'Matrícula')
    SensivelACaixa.Strings = (
      'N'
      'S'
      'S')
    Tabelas.Strings = (
      'PESSOA P'
      'DEPENTIT D')
    CamposChave.Strings = (
      'P.IDPESSOA'
      'P.NUMDOCUMENTO'
      'P.NOME'
      'D.MATRICULA'
      'D.IDTITULAR')
    Filtro.Strings = (
      'D.IDPESSOA = P.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '18'
      '60'
      '10')
    OperComparador.Strings = (
      '0'
      '0'
      '1')
    ApenasLetraENum.Strings = (
      'N'
      'N'
      'N')
    ComparaMaiuscula.Strings = (
      ''
      ''
      '')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      '')
    Left = 258
    Top = 232
  end
  object qryEventos: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 464
    Top = 368
  end
  object updPessoaXEventos: TUpdateSQL
    InsertSQL.Strings = (
      
        'INSERT INTO RESTRCOBRPESSOAXEVENTO (IDPESSOA, IDTIPOEVENTOCOBEMP' +
        'TMO)'
      '  VALUES (:IDPESSOA, :IDTIPOEVENTOCOBEMPTMO)')
    DeleteSQL.Strings = (
      'DELETE FROM RESTRCOBRPESSOAXEVENTO'
      ' WHERE IDPESSOA = :OLD_IDPESSOA '
      '     AND  IDTIPOEVENTOCOBEMPTMO = :OLD_IDTIPOEVENTOCOBEMPTMO'
      '      ')
    Left = 593
    Top = 360
  end
  object qryCargo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT R.IDCARGOEXT, '
      '       R.IDPESSJUR,'
      '       R.OBSERVACAO,'
      '       C.CODIGO,'
      '       C.TITULO,'
      '       C.NOMERESUMIDO,'
      '       P.NOME'
      '  FROM RESTRCOBRCARGO R, PESSOA P, CARGOEXT C'
      '  WHERE  R.IDCARGOEXT = C.IDCARGOEXT'
      '  AND R.IDPESSJUR = C.IDPESSJUR'
      '  AND C.IDPESSJUR = P.IDPESSOA'
      'ORDER BY C.CODIGO')
    UpdateObject = updCargo
    ValidateWithMask = True
    Left = 112
    Top = 176
  end
  object qryValidaRestrCad: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    UpdateObject = updValida
    ValidateWithMask = True
    Left = 288
    Top = 440
  end
  object updValida: TUpdateSQL
    Left = 528
    Top = 288
  end
end
