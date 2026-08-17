inherited frmCadTipoContratoEmptmo: TfrmCadTipoContratoEmptmo
  Left = 180
  Top = 93
  HelpContext = 150060
  Caption = 'Tipos de Contrato de Empréstimo'
  ClientHeight = 531
  ClientWidth = 772
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 772
    Height = 463
    object pgcParametros: TPageControl
      Left = 1
      Top = 172
      Width = 770
      Height = 290
      ActivePage = tbsRegraCalc
      Align = alBottom
      TabOrder = 0
      object tbsConcessao: TTabSheet
        Caption = 'Concessão / Prazos'
        object Bevel3: TBevel
          Left = 16
          Top = 104
          Width = 337
          Height = 3
          Shape = bsTopLine
        end
        object Label19: TLabel
          Left = 23
          Top = 98
          Width = 172
          Height = 13
          Caption = ' "Destino" padrão para Envio '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label20: TLabel
          Left = 15
          Top = 171
          Width = 333
          Height = 39
          Caption = 
            'Obs.: Caso os parâmetros acima não estejam assinalados, serão co' +
            'nsiderados os valores definidos na tela de Parâmetros do Sistema' +
            '.'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clRed
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          WordWrap = True
        end
        object GroupBox3: TGroupBox
          Left = 368
          Top = 8
          Width = 386
          Height = 249
          TabOrder = 1
          object Label4: TLabel
            Left = 32
            Top = 157
            Width = 269
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nº mínimo de parcelas pagas para Renovação:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label5: TLabel
            Left = 38
            Top = 134
            Width = 263
            Height = 13
            Alignment = taRightJustify
            Caption = 'Prazo Máximo (nº de parcelas) do Empréstimo:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label8: TLabel
            Left = 39
            Top = 110
            Width = 262
            Height = 13
            Alignment = taRightJustify
            Caption = 'Prazo Mínimo (nº de parcelas) do Empréstimo:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label3: TLabel
            Left = 150
            Top = 203
            Width = 105
            Height = 13
            Caption = 'Indexador Padrão:'
          end
          object Label9: TLabel
            Left = 46
            Top = 180
            Width = 255
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nº mínimo de parcelas pagas para Quitação:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label14: TLabel
            Left = 9
            Top = 226
            Width = 311
            Height = 13
            Caption = 'Nº de parcelas calculáveis para simulação na internet:'
          end
          object DBspeMinParcelas: TwwDBSpinEdit
            Left = 304
            Top = 106
            Width = 70
            Height = 21
            Increment = 1
            MaxValue = 999
            MinValue = 1
            Value = 1
            DataField = 'TCEMINPARC'
            DataSource = ds
            TabOrder = 1
            UnboundDataType = wwDefault
          end
          object DBspeMaxParcelas: TwwDBSpinEdit
            Left = 304
            Top = 130
            Width = 70
            Height = 21
            Increment = 1
            MaxValue = 999
            MinValue = 1
            Value = 1
            DataField = 'TCEMAXPARC'
            DataSource = ds
            TabOrder = 2
            UnboundDataType = wwDefault
          end
          object DBMinRenova: TwwDBSpinEdit
            Left = 304
            Top = 153
            Width = 70
            Height = 21
            Increment = 1
            MaxValue = 999
            DataField = 'TCEMINRENOVA'
            DataSource = ds
            TabOrder = 3
            UnboundDataType = wwDefault
          end
          object dbcboMoeda: TwwDBLookupCombo
            Left = 264
            Top = 200
            Width = 110
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'MOESIGLA'#9'10'#9'Sigla'#9'F')
            DataField = 'MOECODIGO'
            DataSource = ds
            LookupTable = dtmLookEmptmo.qryLookMoeda
            LookupField = 'MOECODIGO'
            TabOrder = 5
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
          end
          object DBMinQuitacao: TwwDBSpinEdit
            Left = 304
            Top = 177
            Width = 70
            Height = 21
            Increment = 1
            MaxValue = 999
            DataField = 'TCEMINQUIT'
            DataSource = ds
            TabOrder = 4
            UnboundDataType = wwDefault
          end
          object wwDBSpinEdit2: TwwDBSpinEdit
            Left = 325
            Top = 223
            Width = 49
            Height = 21
            Increment = 1
            MaxValue = 99
            DataField = 'TCENUMPARCSIM'
            DataSource = ds
            TabOrder = 6
            UnboundDataType = wwDefault
          end
          object cbChkVerPrazo: TDBCheckBox
            Left = 33
            Top = 11
            Width = 337
            Height = 17
            Caption = 'Verifica prazos nos demais tipos de contratos quitáveis'
            DataField = 'FLGVERPRAZOTIPOQUIT'
            DataSource = ds
            TabOrder = 0
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
          object rdgVerificaContrato: TDBRadioGroup
            Left = 32
            Top = 31
            Width = 341
            Height = 73
            Caption = ' Verificação de Concessões Não Efetivadas '
            DataField = 'FLGVERIFICACONTRATO'
            DataSource = ds
            Items.Strings = (
              'NÃO verifica'
              'Verifica APENAS para o mesmo Tipo de Contrato'
              'Verifica em TODOS os Tipos de Contrato')
            TabOrder = 7
            Values.Strings = (
              '0'
              '1'
              '2')
          end
        end
        object DBCheckBox1: TDBCheckBox
          Left = 120
          Top = 271
          Width = 337
          Height = 17
          Caption = 'Permite Suspensão AUTOMÁTICA de Cobrança'
          DataField = 'FLGSUSPENSAOAUTO'
          DataSource = ds
          TabOrder = 2
          ValueChecked = '1'
          ValueUnchecked = '0'
          Visible = False
        end
        object GroupBox2: TGroupBox
          Left = 16
          Top = 8
          Width = 337
          Height = 73
          Color = clBtnFace
          ParentColor = False
          TabOrder = 0
          object Label6: TLabel
            Left = 23
            Top = 20
            Width = 236
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nº máximo de inscrições por participante:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label7: TLabel
            Left = 27
            Top = 44
            Width = 232
            Height = 13
            Alignment = taRightJustify
            Caption = 'Nº máximo de contratos por participante:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBspeNumCtr: TwwDBSpinEdit
            Left = 264
            Top = 40
            Width = 54
            Height = 21
            Increment = 1
            MaxValue = 999
            MinValue = 1
            Value = 1
            DataField = 'TCEMAXCONTRATO'
            DataSource = ds
            TabOrder = 1
            UnboundDataType = wwDefault
          end
          object DBspeMaxInscricao: TwwDBSpinEdit
            Left = 264
            Top = 16
            Width = 54
            Height = 21
            Increment = 1
            MaxValue = 999
            MinValue = 1
            Value = 1
            DataField = 'TCEMAXINSCR'
            DataSource = ds
            TabOrder = 0
            UnboundDataType = wwDefault
          end
        end
        object DBRadioGroup2: TDBRadioGroup
          Left = 16
          Top = 115
          Width = 169
          Height = 51
          Caption = ' Concessão '
          DataField = 'FLGFORMAPAG'
          DataSource = ds
          Items.Strings = (
            'Contas a Pagar'
            'Folha')
          TabOrder = 3
          Values.Strings = (
            'C'
            'F')
        end
        object DBRadioGroup3: TDBRadioGroup
          Left = 186
          Top = 115
          Width = 169
          Height = 51
          Caption = ' Prestação '
          DataField = 'FLGFORMAREC'
          DataSource = ds
          Items.Strings = (
            'Contas a Receber'
            'Folha')
          TabOrder = 4
          Values.Strings = (
            'C'
            'F')
        end
        object btnLimpaFormaPag: TBitBtn
          Left = 160
          Top = 121
          Width = 24
          Height = 22
          Hint = 'Limpa o destino de Concessão'
          TabOrder = 5
          OnClick = btnLimpaFormaPagClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            88888888888FF8888888888888008888888888888F77F8888888888800F08888
            8888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0888
            88887788888F788888887FFFFFCF888888887F88FF7888FF88887FFCCCF88008
            888878F777888778F88887FFFF880110888887F88F8878878F8887FFC8809991
            0888878F7887F88878F8887FF88099991088887F88878F88878F887FF8880999
            03088878F88878F878788887F8888090B03088878F888787878788887888880B
            0B038888788888787878888888888880B0B38888888888878788888888888888
            0BBB88888888888878F888888888888880BB8888888888888788}
          NumGlyphs = 2
        end
        object btnLimpaFormaRec: TBitBtn
          Left = 330
          Top = 121
          Width = 24
          Height = 22
          Hint = 'Limpa o destino de Prestação'
          TabOrder = 6
          OnClick = btnLimpaFormaRecClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            88888888888FF8888888888888008888888888888F77F8888888888800F08888
            8888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0888
            88887788888F788888887FFFFFCF888888887F88FF7888FF88887FFCCCF88008
            888878F777888778F88887FFFF880110888887F88F8878878F8887FFC8809991
            0888878F7887F88878F8887FF88099991088887F88878F88878F887FF8880999
            03088878F88878F878788887F8888090B03088878F888787878788887888880B
            0B038888788888787878888888888880B0B38888888888878788888888888888
            0BBB88888888888878F888888888888880BB8888888888888788}
          NumGlyphs = 2
        end
      end
      object tbsFlags: TTabSheet
        Caption = 'Detalhes'
        ImageIndex = 5
        object lblPermiteParcela: TLabel
          Left = 35
          Top = 180
          Width = 298
          Height = 13
          Caption = 'prestação gerada para o mês imediatamente anterior'
        end
        object DBchkSeguro: TDBCheckBox
          Left = 16
          Top = 16
          Width = 353
          Height = 17
          Caption = 'Contrato Garantido por Seguro / Fundo em caso de morte'
          DataField = 'FLGSEGURO'
          DataSource = ds
          TabOrder = 0
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object DBCheckBox2: TDBCheckBox
          Left = 16
          Top = 53
          Width = 369
          Height = 17
          Caption = 'Obriga indicação de beneficiário(s) do seguro na concessão'
          DataField = 'FLGOBRIGBENEF'
          DataSource = ds
          TabOrder = 1
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBCheckBox3: TDBCheckBox
          Left = 16
          Top = 76
          Width = 369
          Height = 17
          Caption = 'Permite Concessão por Renovação com valor líquido ZERO'
          DataField = 'FLGCONCESSAOZERO'
          DataSource = ds
          TabOrder = 2
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBCheckBox4: TDBCheckBox
          Left = 491
          Top = 92
          Width = 353
          Height = 17
          Caption = 'Permite Suspensão de Cobrança'
          Color = clGray
          DataField = 'FLGSUSPENSAO'
          DataSource = ds
          ParentColor = False
          TabOrder = 5
          ValueChecked = '1'
          ValueUnchecked = '0'
          Visible = False
        end
        object DBCheckBox7: TDBCheckBox
          Left = 16
          Top = 120
          Width = 369
          Height = 17
          Caption = 'NÃO permite refinanciamento / repactuação'
          DataField = 'FLGNAOREFINANCIA'
          DataSource = ds
          TabOrder = 3
          ValueChecked = '1'
          ValueUnchecked = '0'
          Visible = False
        end
        object DBchkPermiteParcela: TDBCheckBox
          Left = 16
          Top = 160
          Width = 393
          Height = 17
          Caption = 'Permite geração da PRIMEIRA parcela mesmo não havendo'
          DataField = 'FLGPERMITEPARCELA'
          DataSource = ds
          TabOrder = 4
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBCheckBox11: TDBCheckBox
          Left = 16
          Top = 97
          Width = 369
          Height = 17
          Caption = 'Obriga Concessão com valor líquido ZERO'
          DataField = 'FLGOBRIGACONCZERO'
          DataSource = ds
          TabOrder = 6
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbchkFLGOBRIGANUMPROTOCOLO: TDBCheckBox
          Left = 16
          Top = 221
          Width = 369
          Height = 17
          Caption = 'Obriga a Vinculação de Número de Protocolo'
          DataField = 'FLGOBRIGANUMPROTOCOLO'
          DataSource = ds
          TabOrder = 7
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
      end
      object tbsRegraControle: TTabSheet
        Caption = 'Regras de Controle'
        ImageIndex = 3
        object Bevel2: TBevel
          Left = 384
          Top = 8
          Width = 2
          Height = 185
          Shape = bsLeftLine
        end
        inline molRegraDB4: TmolRegraDB
          Left = 8
          Top = 8
          Width = 369
          inherited Regra: TLabel
            Width = 73
            Caption = 'Elegibilidade'
          end
          inherited DBedtRegra: TDBEdit
            Width = 273
            DataField = 'NOMEREGRAELEG'
            DataSource = ds
          end
          inherited btnBuscaRegra: TBitBtn
            Left = 320
          end
          inherited btnLimpaRegra: TBitBtn
            Left = 344
          end
          inherited DBedtIDRegra: TDBEdit
            DataField = 'IDREGRAELEG'
            DataSource = ds
          end
        end
        inline molRegraDB7: TmolRegraDB
          Left = 388
          Top = 88
          Width = 369
          TabOrder = 5
          inherited Regra: TLabel
            Width = 139
            Caption = 'Suspensão de Cobrança'
          end
          inherited DBedtRegra: TDBEdit
            Width = 273
            DataField = 'NOMEREGRASUSPCOBR'
            DataSource = ds
          end
          inherited btnBuscaRegra: TBitBtn
            Left = 320
          end
          inherited btnLimpaRegra: TBitBtn
            Left = 344
          end
          inherited DBedtIDRegra: TDBEdit
            DataField = 'IDREGRASUSPCOBR'
            DataSource = ds
          end
        end
        inline molRegraDB10: TmolRegraDB
          Left = 8
          Top = 48
          Width = 369
          TabOrder = 1
          inherited Regra: TLabel
            Width = 185
            Caption = 'Prazos de Concessão Permitidos'
          end
          inherited DBedtRegra: TDBEdit
            Width = 273
            DataField = 'NOMEREGRAPRAZOSCONC'
            DataSource = ds
          end
          inherited btnBuscaRegra: TBitBtn
            Left = 320
          end
          inherited btnLimpaRegra: TBitBtn
            Left = 344
          end
          inherited DBedtIDRegra: TDBEdit
            DataField = 'IDREGRAPRAZOSCONC'
            DataSource = ds
          end
        end
        inline molRegraDB11: TmolRegraDB
          Left = 8
          Top = 88
          Width = 369
          TabOrder = 2
          inherited Regra: TLabel
            Width = 174
            Caption = 'Prazo Máximo para Concessão'
          end
          inherited DBedtRegra: TDBEdit
            Width = 273
            DataField = 'NOMEREGRAPRAZOMAX'
            DataSource = ds
          end
          inherited btnBuscaRegra: TBitBtn
            Left = 320
          end
          inherited btnLimpaRegra: TBitBtn
            Left = 344
          end
          inherited DBedtIDRegra: TDBEdit
            DataField = 'IDREGRAPRAZOMAX'
            DataSource = ds
          end
        end
        inline molRegraDB8: TmolRegraDB
          Left = 388
          Top = 128
          Width = 369
          TabOrder = 6
          inherited Regra: TLabel
            Width = 240
            Caption = 'Itens a considerar "quitados" na Quitação'
          end
          inherited DBedtRegra: TDBEdit
            Width = 273
            DataField = 'NOMEREGRAQUITADO'
            DataSource = ds
          end
          inherited btnBuscaRegra: TBitBtn
            Left = 320
          end
          inherited btnLimpaRegra: TBitBtn
            Left = 344
          end
          inherited DBedtIDRegra: TDBEdit
            DataField = 'IDREGRAQUITADO'
            DataSource = ds
          end
        end
        inline molRegraDB3: TmolRegraDB
          Left = 388
          Top = 8
          Width = 369
          TabOrder = 3
          inherited Regra: TLabel
            Width = 90
            Caption = 'Data de Crédito'
          end
          inherited DBedtRegra: TDBEdit
            Width = 273
            DataField = 'NOMEREGRADATACRED'
            DataSource = ds
          end
          inherited btnBuscaRegra: TBitBtn
            Left = 320
          end
          inherited btnLimpaRegra: TBitBtn
            Left = 344
          end
          inherited DBedtIDRegra: TDBEdit
            DataField = 'IDREGRADATACRED'
            DataSource = ds
          end
        end
        inline molRegraDB12: TmolRegraDB
          Left = 388
          Top = 48
          Width = 369
          TabOrder = 4
          inherited Regra: TLabel
            Width = 109
            Caption = 'Data da 1ª Parcela'
          end
          inherited DBedtRegra: TDBEdit
            Width = 273
            DataField = 'NOMEREGRAPRIMPARC'
            DataSource = ds
          end
          inherited btnBuscaRegra: TBitBtn
            Left = 320
          end
          inherited btnLimpaRegra: TBitBtn
            Left = 344
          end
          inherited DBedtIDRegra: TDBEdit
            DataField = 'IDREGRAPRIMPARC'
            DataSource = ds
          end
        end
      end
      object tbsRegraCalc: TTabSheet
        Caption = 'Regras de Cálculo'
        ImageIndex = 1
        object Bevel1: TBevel
          Left = 384
          Top = 8
          Width = 2
          Height = 121
          Shape = bsLeftLine
        end
        object GroupBox6: TGroupBox
          Left = 16
          Top = 128
          Width = 737
          Height = 105
          TabOrder = 5
          object Label17: TLabel
            Left = 504
            Top = 18
            Width = 50
            Height = 13
            Caption = 'Legenda'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Regra: TLabel
            Left = 504
            Top = 58
            Width = 50
            Height = 13
            Caption = 'Legenda'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label15: TLabel
            Left = 52
            Top = 75
            Width = 68
            Height = 13
            Caption = 'opcional -->'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlue
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          inline molRegraDB2: TmolRegraDB
            Left = 120
            Top = 16
            Width = 369
            inherited Regra: TLabel
              Width = 325
              Caption = 'Taxa de Juros (para cálculo de Concessão e Prestações)'
            end
            inherited DBedtRegra: TDBEdit
              Width = 273
              DataField = 'NOMEREGRAJURCONC'
              DataSource = ds
            end
            inherited btnBuscaRegra: TBitBtn
              Left = 320
            end
            inherited btnLimpaRegra: TBitBtn
              Left = 344
            end
            inherited DBedtIDRegra: TDBEdit
              DataField = 'IDREGRAJURCONC'
              DataSource = ds
            end
          end
          inline molRegraDB13: TmolRegraDB
            Left = 120
            Top = 56
            Width = 369
            TabOrder = 2
            inherited Regra: TLabel
              Width = 239
              Caption = 'Taxa de Juros (para exibição no Contrato)'
            end
            inherited DBedtRegra: TDBEdit
              Width = 273
              DataField = 'NOMEREGRAJUREXIBE'
              DataSource = ds
            end
            inherited btnBuscaRegra: TBitBtn
              Left = 320
            end
            inherited btnLimpaRegra: TBitBtn
              Left = 344
            end
            inherited DBedtIDRegra: TDBEdit
              DataField = 'IDREGRAJUREXIBE'
              DataSource = ds
            end
          end
          object DBEdit1: TDBEdit
            Left = 504
            Top = 32
            Width = 89
            Height = 21
            DataField = 'TCELEGENDACALC'
            DataSource = ds
            MaxLength = 15
            TabOrder = 1
          end
          object DBEdit2: TDBEdit
            Left = 504
            Top = 72
            Width = 89
            Height = 21
            DataField = 'TCELEGENDAEXIBE'
            DataSource = ds
            MaxLength = 15
            TabOrder = 3
          end
        end
        inline molRegraDB5: TmolRegraDB
          Left = 8
          Top = 8
          Width = 369
          inherited Regra: TLabel
            Width = 127
            Caption = 'Reserva de Poupança'
          end
          inherited DBedtRegra: TDBEdit
            Width = 273
            DataField = 'NOMEREGRARESERVA'
            DataSource = ds
          end
          inherited btnBuscaRegra: TBitBtn
            Left = 320
          end
          inherited btnLimpaRegra: TBitBtn
            Left = 344
          end
          inherited DBedtIDRegra: TDBEdit
            DataField = 'IDREGRARESERVA'
            DataSource = ds
          end
        end
        inline molRegraDB6: TmolRegraDB
          Left = 8
          Top = 48
          Width = 369
          TabOrder = 1
          inherited Regra: TLabel
            Width = 118
            Caption = 'Margem Consignável'
          end
          inherited DBedtRegra: TDBEdit
            Width = 273
            DataField = 'NOMEREGRAMARGEM'
            DataSource = ds
          end
          inherited btnBuscaRegra: TBitBtn
            Left = 320
          end
          inherited btnLimpaRegra: TBitBtn
            Left = 344
          end
          inherited DBedtIDRegra: TDBEdit
            DataField = 'IDREGRAMARGEM'
            DataSource = ds
          end
        end
        inline molRegraLimiteValorConc: TmolRegraDB
          Left = 387
          Top = 48
          Width = 369
          TabOrder = 4
          inherited Regra: TLabel
            Width = 207
            Caption = 'Limites: Valor de Concessão / Prazo'
          end
          inherited DBedtRegra: TDBEdit
            Width = 273
            DataField = 'NOMEREGRALIMITES'
            DataSource = ds
          end
          inherited btnBuscaRegra: TBitBtn
            Left = 320
          end
          inherited btnLimpaRegra: TBitBtn
            Left = 344
          end
          inherited DBedtIDRegra: TDBEdit
            DataField = 'IDREGRALIMITES'
            DataSource = ds
          end
        end
        inline molRegraDB1: TmolRegraDB
          Left = 8
          Top = 88
          Width = 369
          TabOrder = 2
          inherited Regra: TLabel
            Width = 72
            Caption = 'Salário Base'
          end
          inherited DBedtRegra: TDBEdit
            Width = 273
            DataField = 'NOMEREGRASALBASE'
            DataSource = ds
          end
          inherited btnBuscaRegra: TBitBtn
            Left = 320
          end
          inherited btnLimpaRegra: TBitBtn
            Left = 344
          end
          inherited DBedtIDRegra: TDBEdit
            DataField = 'IDREGRASALBAS'
            DataSource = ds
          end
        end
        inline molRegraDB9: TmolRegraDB
          Left = 387
          Top = 8
          Width = 369
          TabOrder = 3
          inherited Regra: TLabel
            Width = 227
            Caption = 'Valor Máximo Permitido para Concessão'
          end
          inherited DBedtRegra: TDBEdit
            Width = 273
            DataField = 'NOMEREGRAVLRMAX'
            DataSource = ds
          end
          inherited btnBuscaRegra: TBitBtn
            Left = 320
          end
          inherited btnLimpaRegra: TBitBtn
            Left = 344
          end
          inherited DBedtIDRegra: TDBEdit
            DataField = 'IDREGRAVLRMAX'
            DataSource = ds
          end
        end
        inline molREGRATXCORRMONET: TmolRegraDB
          Left = 387
          Top = 89
          Width = 369
          TabOrder = 6
          inherited Regra: TLabel
            Width = 173
            Caption = 'Taxa de Correção Monetetária'
          end
          inherited DBedtRegra: TDBEdit
            Width = 273
            DataField = 'NOMEREGRATXCORRMONET'
            DataSource = ds
          end
          inherited btnBuscaRegra: TBitBtn
            Left = 320
          end
          inherited btnLimpaRegra: TBitBtn
            Left = 344
          end
          inherited DBedtIDRegra: TDBEdit
            DataField = 'IDREGRATXCORRMONET'
            DataSource = ds
          end
        end
      end
      object tbsTratamento: TTabSheet
        Caption = 'Tratamentos'
        ImageIndex = 4
        object DBRadioGroup1: TDBRadioGroup
          Left = 496
          Top = -8
          Width = 441
          Height = 65
          Caption = ' Parcelas pagas Parcialmente '
          Color = clBtnShadow
          Items.Strings = (
            'Tratar individualmente na Análise de Divergências'
            
              'Receber o valor pago e tratar a diferença na Análise de Divergên' +
              'cias'
            'Considerar automaticamente a parte recebida como Amortização')
          ParentColor = False
          TabOrder = 4
          Values.Strings = (
            'T'
            'R'
            'A')
          Visible = False
        end
        object DBRadioGroup4: TDBRadioGroup
          Left = 496
          Top = 64
          Width = 441
          Height = 49
          Caption = ' Parcelas em Atraso '
          Color = clBtnShadow
          Items.Strings = (
            'Tratar individualmente na Análise de Divergências'
            'Incorporar automaticamente ao Saldo Devedor')
          ParentColor = False
          TabOrder = 5
          Values.Strings = (
            'T'
            'I')
          Visible = False
        end
        object GroupBox1: TGroupBox
          Left = 496
          Top = 180
          Width = 417
          Height = 77
          Caption = ' Cobrança Judicial '
          Color = clBtnShadow
          ParentColor = False
          TabOrder = 3
          Visible = False
          object Label10: TLabel
            Left = 61
            Top = 52
            Width = 278
            Height = 13
            Alignment = taRightJustify
            Caption = 'Prazo Máximo permitido para parcelas atrasadas:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbspnMaxMesDeb: TwwDBSpinEdit
            Left = 344
            Top = 48
            Width = 57
            Height = 21
            Increment = 1
            MaxValue = 99
            MinValue = 1
            Value = 1
            DataField = 'TCEMAXMESDEB'
            DataSource = ds
            TabOrder = 1
            UnboundDataType = wwDefault
          end
          object chkCobrJudic: TDBCheckBox
            Left = 24
            Top = 20
            Width = 361
            Height = 17
            Caption = 'Trata débitos para envio para Cobrança Judicial'
            Color = clBtnShadow
            DataField = 'FLGCOBRJUDIC'
            DataSource = ds
            ParentColor = False
            TabOrder = 0
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
        object GroupBox4: TGroupBox
          Left = 496
          Top = 120
          Width = 417
          Height = 57
          Caption = ' Tratamento de Divergências '
          Color = clBtnShadow
          ParentColor = False
          TabOrder = 2
          Visible = False
          object DBCheckBox5: TDBCheckBox
            Left = 16
            Top = 16
            Width = 342
            Height = 17
            Caption = 'Tratar individualmente Parcelas em Atraso'
            Color = clBtnShadow
            DataField = 'TCETRATAPARCATRAS'
            DataSource = ds
            ParentColor = False
            TabOrder = 0
            ValueChecked = 'T'
            ValueUnchecked = 'I'
          end
          object DBCheckBox6: TDBCheckBox
            Left = 16
            Top = 32
            Width = 342
            Height = 17
            Caption = 'Receber o Valor Pago Parcialmente e tratar a diferença'
            Color = clBtnShadow
            DataField = 'TCETRATAPARCPARC'
            DataSource = ds
            ParentColor = False
            TabOrder = 1
            ValueChecked = 'R'
            ValueUnchecked = 'T'
            Visible = False
          end
        end
        object GroupBox5: TGroupBox
          Left = 16
          Top = 40
          Width = 337
          Height = 89
          TabOrder = 1
          object Label11: TLabel
            Left = 18
            Top = 27
            Width = 246
            Height = 13
            Caption = 'Nº de parcelas atrasadas para cobrança:   '
          end
          object wwDBSpinEdit1: TwwDBSpinEdit
            Left = 264
            Top = 24
            Width = 57
            Height = 21
            Increment = 1
            DataField = 'NUMPARCDESCONTO'
            DataSource = ds
            TabOrder = 0
            UnboundDataType = wwDefault
          end
          object DBCheckBox10: TDBCheckBox
            Left = 16
            Top = 56
            Width = 305
            Height = 17
            Caption = 'Sempre enviar a prestação do mês, além de...'
            Color = clBtnFace
            DataField = 'FLGENVIAPARCMES'
            DataSource = ds
            ParentColor = False
            TabOrder = 1
            ValueChecked = '1'
            ValueUnchecked = '0'
          end
        end
        object DBCheckBox9: TDBCheckBox
          Left = 16
          Top = 16
          Width = 321
          Height = 17
          Caption = 'Tratar parcelas em atraso no momento do Envio'
          Color = clBtnFace
          DataField = 'TCETRATAPARCATRAS'
          DataSource = ds
          ParentColor = False
          TabOrder = 0
          ValueChecked = 'T'
          ValueUnchecked = 'I'
        end
        object DBCheckBox8: TDBCheckBox
          Left = 16
          Top = 144
          Width = 361
          Height = 17
          Caption = 'NÃO Permite Cancelamento e/ou Alteração de Concessão'
          Color = clBtnFace
          DataField = 'FLGEXCLUIALT'
          DataSource = ds
          ParentColor = False
          TabOrder = 6
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBCheckBox12: TDBCheckBox
          Left = 16
          Top = 176
          Width = 417
          Height = 17
          Caption = 
            'NÃO verifica se a margem consignável é inferior a prestação inic' +
            'ial'
          Color = clBtnFace
          DataField = 'FLGNAOVERIFICAMRGPCL'
          DataSource = ds
          ParentColor = False
          TabOrder = 7
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBCheckBox13: TDBCheckBox
          Left = 16
          Top = 208
          Width = 481
          Height = 17
          Caption = 
            'VERIFICA itens em aberto para todos contratos ativos na concessã' +
            'o/renovação'
          Color = clBtnFace
          DataField = 'FLGVERIFICAITEMABERTO'
          DataSource = ds
          ParentColor = False
          TabOrder = 8
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
      end
      object tbsImpressao: TTabSheet
        Caption = 'Impressão de Contratos'
        ImageIndex = 2
        object lblRelatorio1: TfcLabel
          Left = 16
          Top = 120
          Width = 561
          Height = 19
          AutoSize = False
          Caption = 'Norma para Impressão de Contrato'#13#10#13#10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold, fsUnderline]
          ParentFont = False
          TextOptions.Alignment = taLeftJustify
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.LineSpacing = 3
          TextOptions.VAlignment = vaTop
          TextOptions.WordWrap = True
        end
        object lblRelatorio: TfcLabel
          Left = 16
          Top = 56
          Width = 513
          Height = 57
          AutoSize = False
          Caption = 
            'Atenção : Estes relatórios devem seguir as normas para eles espe' +
            'cificadas. Caso contrário, não funcionarão ao serem executados a' +
            ' partir do programa.     Verifique a norma de cada um dos relató' +
            'rios clicando no botão ao lado da lista de opções de cada um del' +
            'es.'#13#10#13#10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TextOptions.Alignment = taLeftJustify
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.LineSpacing = 3
          TextOptions.VAlignment = vaTop
          TextOptions.WordWrap = True
        end
        object Label66: TLabel
          Left = 16
          Top = 10
          Width = 112
          Height = 13
          Caption = 'Modelo do Contrato'
        end
        object lblRelatorio2: TfcLabel
          Left = 16
          Top = 144
          Width = 513
          Height = 49
          AutoSize = False
          Caption = 
            'A consulta deste relatório, cadastrada no Gerador de Relatórios,' +
            ' deve conter a clausula where e o alias da consulta deve ser CON' +
            'TRATOEMPTMO. '#13#10'Além disto, esta consulta não pode conter ordenaç' +
            'ão (ORDER BY) ou agrupamento (GROUP BY).'#13#10#13#10#13#10
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TextOptions.Alignment = taLeftJustify
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.LineSpacing = 3
          TextOptions.VAlignment = vaTop
          TextOptions.WordWrap = True
        end
        object DBcboRelatorio: TwwDBLookupCombo
          Left = 16
          Top = 24
          Width = 358
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NAME'#9'1'#9'Nome'#9'F')
          DataField = 'IDREPORTS'
          DataSource = ds
          LookupTable = dtmLookEmptmo.qryLookReports
          LookupField = 'IDREPORTS'
          DropDownCount = 15
          ParentFont = False
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
        end
      end
      object tbsOutros: TTabSheet
        Caption = 'Outros'
        ImageIndex = 6
        object grpRubricas: TGroupBox
          Left = 16
          Top = 17
          Width = 633
          Height = 88
          Caption = ' Rubricas Informativas '
          TabOrder = 0
          object Label13: TLabel
            Left = 13
            Top = 20
            Width = 181
            Height = 13
            Alignment = taRightJustify
            Caption = 'Valor Máximo para Empréstimo: '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object Label18: TLabel
            Left = 68
            Top = 52
            Width = 126
            Height = 13
            Alignment = taRightJustify
            Caption = 'Valor Saldo Devedor: '
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object DBcboRubVlMax: TwwDBLookupCombo
            Left = 290
            Top = 16
            Width = 310
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'1'#9'Descrição'#9'F')
            DataField = 'IDPROVENTOVLMAX'
            DataSource = ds
            LookupTable = dtmLookEmptmo.qryLookRubricaInforma
            LookupField = 'IDPROVENTO'
            DropDownCount = 4
            ParentFont = False
            TabOrder = 2
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            OnChange = DBcboRubVlMaxChange
          end
          object edtRubVlMax: TEdit
            Left = 195
            Top = 16
            Width = 45
            Height = 21
            Enabled = False
            TabOrder = 0
          end
          object btnLimpaRubN: TBitBtn
            Left = 600
            Top = 16
            Width = 24
            Height = 21
            Hint = 'Limpa a seleção de Contrato'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 3
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              88888888888FF8888888888888008888888888888F77F8888888888800F08888
              8888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0888
              88887788888F788888887FFFFFCF888888887F88FF7888FF88887FFCCCF88008
              888878F777888778F88887FFFF880110888887F88F8878878F8887FFC8809991
              0888878F7887F88878F8887FF88099991088887F88878F88878F887FF8880999
              03088878F88878F878788887F8888090B03088878F888787878788887888880B
              0B038888788888787878888888888880B0B38888888888878788888888888888
              0BBB88888888888878F888888888888880BB8888888888888788}
            NumGlyphs = 2
          end
          object edtProvDescVlMax: TEdit
            Left = 240
            Top = 16
            Width = 49
            Height = 21
            Enabled = False
            TabOrder = 1
          end
          object DBcboRubVlDev: TwwDBLookupCombo
            Left = 290
            Top = 48
            Width = 310
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'1'#9'Descrição'#9'F')
            DataField = 'IDPROVENTOVLDEV'
            DataSource = ds
            LookupTable = dtmLookEmptmo.qryLookRubricaInforma
            LookupField = 'IDPROVENTO'
            DropDownCount = 4
            ParentFont = False
            TabOrder = 4
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            OnChange = DBcboRubVlDevChange
          end
          object edtRubVlDev: TEdit
            Left = 195
            Top = 48
            Width = 45
            Height = 21
            Enabled = False
            TabOrder = 5
          end
          object BitBtn1: TBitBtn
            Left = 600
            Top = 48
            Width = 24
            Height = 21
            Hint = 'Limpa a seleção de Contrato'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 6
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000000000000000000000000
              8000008000000080800080000000800080008080000080808000C0C0C0000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
              88888888888FF8888888888888008888888888888F77F8888888888800F08888
              8888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0888
              88887788888F788888887FFFFFCF888888887F88FF7888FF88887FFCCCF88008
              888878F777888778F88887FFFF880110888887F88F8878878F8887FFC8809991
              0888878F7887F88878F8887FF88099991088887F88878F88878F887FF8880999
              03088878F88878F878788887F8888090B03088878F888787878788887888880B
              0B038888788888787878888888888880B0B38888888888878788888888888888
              0BBB88888888888878F888888888888880BB8888888888888788}
            NumGlyphs = 2
          end
          object edtProvDescVlDev: TEdit
            Left = 240
            Top = 48
            Width = 49
            Height = 21
            Enabled = False
            TabOrder = 7
          end
        end
        inline molRegraDB14: TmolRegraDB
          Left = 12
          Top = 112
          Width = 369
          TabOrder = 1
          inherited Regra: TLabel
            Width = 299
            Caption = 'Margem Consignável Alternativa ( Fundação + INSS)'
          end
          inherited DBedtRegra: TDBEdit
            Width = 273
            DataField = 'NOMEREGRAMARGELALT'
            DataSource = ds
          end
          inherited btnBuscaRegra: TBitBtn
            Left = 320
          end
          inherited btnLimpaRegra: TBitBtn
            Left = 344
          end
          inherited DBedtIDRegra: TDBEdit
            DataField = 'IDREGRAMARGEMALT'
            DataSource = ds
          end
        end
        inline molRegraDB15: TmolRegraDB
          Left = 11
          Top = 151
          Width = 369
          TabOrder = 2
          inherited Regra: TLabel
            Width = 185
            Caption = 'Margem Consignável do Avalista'
          end
          inherited DBedtRegra: TDBEdit
            Width = 273
            DataField = 'NOMEREGRAMARGEMAVAL'
            DataSource = ds
          end
          inherited btnBuscaRegra: TBitBtn
            Left = 320
          end
          inherited btnLimpaRegra: TBitBtn
            Left = 344
          end
          inherited DBedtIDRegra: TDBEdit
            DataField = 'IDREGRAMARGEMAVAL'
            DataSource = ds
          end
        end
        inline molRegraDB16: TmolRegraDB
          Left = 11
          Top = 191
          Width = 369
          TabOrder = 3
          inherited Regra: TLabel
            Width = 140
            Caption = 'Elegibilidade do Avalista'
          end
          inherited DBedtRegra: TDBEdit
            Width = 273
            DataField = 'NOMEREGRAELEGAVAL'
            DataSource = ds
          end
          inherited btnBuscaRegra: TBitBtn
            Left = 320
          end
          inherited btnLimpaRegra: TBitBtn
            Left = 344
          end
          inherited DBedtIDRegra: TDBEdit
            DataField = 'IDREGRAELEGAVAL'
            DataSource = ds
          end
        end
        inline molRegraDB17: TmolRegraDB
          Left = 387
          Top = 113
          Width = 369
          TabOrder = 4
          inherited Regra: TLabel
            Width = 132
            Caption = 'Vencimento de Parcela'
          end
          inherited DBedtRegra: TDBEdit
            Width = 273
            DataField = 'NOMEREGRAVENCPARC'
            DataSource = ds
          end
          inherited btnBuscaRegra: TBitBtn
            Left = 320
          end
          inherited btnLimpaRegra: TBitBtn
            Left = 344
          end
          inherited DBedtIDRegra: TDBEdit
            DataField = 'IDREGRAVENCPARC'
            DataSource = ds
          end
        end
      end
    end
    object pnlTopo: TPanel
      Left = 8
      Top = 2
      Width = 769
      Height = 167
      BevelOuter = bvNone
      TabOrder = 1
      object Label1: TLabel
        Left = 8
        Top = 34
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object Label2: TLabel
        Left = 8
        Top = 74
        Width = 112
        Height = 13
        Caption = 'Tipo de Empréstimo'
      end
      object Label12: TLabel
        Left = 8
        Top = 122
        Width = 175
        Height = 13
        Caption = 'Plano Previdencário (opcional)'
      end
      object Label16: TLabel
        Left = 416
        Top = 122
        Width = 198
        Height = 13
        Caption = 'Carteira SPC (p/ Cotas Gerenciais)'
      end
      object Label21: TLabel
        Left = 8
        Top = 8
        Width = 44
        Height = 13
        Caption = 'Código:'
      end
      object lblCodigoContrato: TLabel
        Left = 54
        Top = 8
        Width = 49
        Height = 13
        AutoSize = False
        Caption = '-'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBedtDescricao: TDBEdit
        Left = 8
        Top = 48
        Width = 393
        Height = 21
        DataField = 'TceDescricao'
        DataSource = ds
        TabOrder = 0
      end
      object DBcboEmprest: TwwDBLookupCombo
        Left = 8
        Top = 88
        Width = 393
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCTIPOEMPTMO'#9'30'#9'Tipo de Empréstimo'#9'F')
        DataField = 'IDTIPOEMPTMO'
        DataSource = ds
        LookupTable = dtmLookEmptmo.qryLookTipoEmptmo
        LookupField = 'IDTIPOEMPTMO'
        DropDownCount = 15
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnCloseUp = DBcboEmprestCloseUp
      end
      object dbrgSituacao: TDBRadioGroup
        Left = 416
        Top = 34
        Width = 113
        Height = 83
        Hint = 'Situação do Contrato quanto à possibilidade de concessão.'
        Caption = ' Situação '
        DataField = 'FLGSITUACAO'
        DataSource = ds
        Items.Strings = (
          'Ativo'
          'Inativo')
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        Values.Strings = (
          'A'
          'I')
      end
      object DBcboPlano: TwwDBLookupCombo
        Left = 8
        Top = 136
        Width = 393
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'50'#9'Nome do Plano'#9'F')
        DataField = 'IDPLANOPREV'
        DataSource = ds
        LookupTable = dtmLookEmptmo.qryLookPlanPrev
        LookupField = 'IDPLANOPREV'
        DropDownCount = 15
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnCloseUp = DBcboEmprestCloseUp
      end
      object wwDBLookupCombo1: TwwDBLookupCombo
        Left = 416
        Top = 136
        Width = 337
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCARTEIRASPC'#9'60'#9'Carteira'#9'F')
        DataField = 'IDCARTEIRASPC'
        DataSource = ds
        LookupField = 'IDCARTEIRASPC'
        TabOrder = 4
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
      object GroupBox7: TGroupBox
        Left = 536
        Top = 34
        Width = 217
        Height = 83
        Caption = ' Disponível para '
        TabOrder = 5
        object chkEmprestimo: TDBCheckBox
          Left = 11
          Top = 14
          Width = 161
          Height = 17
          Caption = 'Empréstimo'
          DataField = 'FLGUSOEMPTMO'
          DataSource = ds
          TabOrder = 0
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object chkAutoAtend: TDBCheckBox
          Left = 11
          Top = 30
          Width = 161
          Height = 17
          Caption = 'Auto-Atendimento'
          DataField = 'FLGUSOINTERNET'
          DataSource = ds
          TabOrder = 1
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object chkAutoEmp: TDBCheckBox
          Left = 11
          Top = 46
          Width = 161
          Height = 17
          Caption = 'Auto-Empréstimo'
          DataField = 'FLGUSOAUTOEMP'
          DataSource = ds
          TabOrder = 2
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object chkCentral: TDBCheckBox
          Left = 11
          Top = 62
          Width = 161
          Height = 17
          Caption = 'Central de Atendimentos'
          DataField = 'FLGUSOCENTRAL'
          DataSource = ds
          TabOrder = 3
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 772
    inherited Toolbar971: TToolbar97
      inherited btnRefresh: TToolbarButton97
        Width = 25
        Enabled = False
        Visible = False
      end
      inherited btnTrazer: TToolbarButton97
        Left = 371
        Width = 25
      end
      inherited ToolbarSep972: TToolbarSep97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 498
    Width = 772
    inherited tb97Fundo: TToolbar97
      Left = 565
      DockPos = 565
      inherited bbtnAjuda: TmaHelpBitBtn
        ClickHelpContext = 150056
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 393
      DockPos = 393
    end
  end
  inherited ds: TwwDataSource
    Left = 472
    Top = 0
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TIPOCONTREMPTMO'
      'set'
      '  IDTIPOCONTREMPTMO = :IDTIPOCONTREMPTMO,'
      '  IDTIPOEMPTMO = :IDTIPOEMPTMO,'
      '  TCEDESCRICAO = :TCEDESCRICAO,'
      '  IDREGRAJURCONC = :IDREGRAJURCONC,'
      '  IDREGRAJUREXIBE = :IDREGRAJUREXIBE,'
      '  IDREGRALIMITES = :IDREGRALIMITES,'
      '  IDREGRASUSPCOBR = :IDREGRASUSPCOBR,'
      '  IDREGRASLDDIA = :IDREGRASLDDIA,'
      '  IDREGRAJURANTCONC = :IDREGRAJURANTCONC,'
      '  IDREGRAELEG = :IDREGRAELEG,'
      '  IDREGRARESERVA = :IDREGRARESERVA,'
      '  IDREGRAMARGEM = :IDREGRAMARGEM,'
      '  IDREGRAPRAZOSCONC = :IDREGRAPRAZOSCONC,'
      '  IDREGRASALBAS = :IDREGRASALBAS,'
      '  IDREGRADATACRED = :IDREGRADATACRED,'
      '  IDREGRAQUITADO = :IDREGRAQUITADO,'
      '  IDREGRAVLRMAX = :IDREGRAVLRMAX,'
      '  IDREGRAPRAZOMAX = :IDREGRAPRAZOMAX,'
      '  IDREGRAPRIMPARC = :IDREGRAPRIMPARC,'
      '  IDREPORTS = :IDREPORTS,'
      '  ORIGEMCM = :ORIGEMCM,'
      '  FLGSITUACAO = :FLGSITUACAO,'
      '  FLGSUSPENSAOAUTO = :FLGSUSPENSAOAUTO,'
      '  FLGSUSPENSAO = :FLGSUSPENSAO,'
      '  FLGSEGURO = :FLGSEGURO,'
      '  FLGCONCESSAOZERO = :FLGCONCESSAOZERO,'
      '  FLGUSOINTERNET = :FLGUSOINTERNET,'
      '  FLGUSOAUTOEMP = :FLGUSOAUTOEMP,'
      '  TCEMAXCONTRATO = :TCEMAXCONTRATO,'
      '  TCEMAXINSCR = :TCEMAXINSCR,'
      '  TCEMAXPARC = :TCEMAXPARC,'
      '  TCEMINPARC = :TCEMINPARC,'
      '  TCEMINQUIT = :TCEMINQUIT,'
      '  TCEMINRENOVA = :TCEMINRENOVA,'
      '  TCETRATAPARCATRAS = :TCETRATAPARCATRAS,'
      '  TCETRATAPARCPARC = :TCETRATAPARCPARC,'
      '  FLGOBRIGBENEF = :FLGOBRIGBENEF,'
      '  MOECODIGO = :MOECODIGO,'
      '  FLGCOBRJUDIC = :FLGCOBRJUDIC,'
      '  TCEMAXMESDEB = :TCEMAXMESDEB,'
      '  NUMPARCDESCONTO = :NUMPARCDESCONTO,'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  TCENUMPARCSIM = :TCENUMPARCSIM,'
      '  FLGPERMITEPARCELA = :FLGPERMITEPARCELA,'
      '  FLGNAOREFINANCIA = :FLGNAOREFINANCIA,'
      '  IDCARTEIRASPC = :IDCARTEIRASPC,'
      '  TCELEGENDACALC = :TCELEGENDACALC,'
      '  TCELEGENDAEXIBE = :TCELEGENDAEXIBE,'
      '  FLGENVIAPARCMES = :FLGENVIAPARCMES,'
      '  IDPROVENTOVLMAX = :IDPROVENTOVLMAX,'
      '  IDPROVENTOVLDEV = :IDPROVENTOVLDEV,'
      '  FLGOBRIGACONCZERO = :FLGOBRIGACONCZERO,'
      '  FLGUSOCENTRAL = :FLGUSOCENTRAL,'
      '  FLGVERPRAZOTIPOQUIT = :FLGVERPRAZOTIPOQUIT,'
      '  FLGFORMAPAG = :FLGFORMAPAG,'
      '  FLGFORMAREC = :FLGFORMAREC,'
      '  FLGVERIFICACONTRATO = :FLGVERIFICACONTRATO,'
      '  IDREGRAMARGEMALT    = :IDREGRAMARGEMALT,'
      '  IDREGRAMARGEMAVAL   = :IDREGRAMARGEMAVAL,'
      '  IDREGRAELEGAVAL     = :IDREGRAELEGAVAL,'
      '  IDREGRAVENCPARC     = :IDREGRAVENCPARC,'
      '  FLGUSOEMPTMO        = :FLGUSOEMPTMO,'
      '  FLGEXCLUIALT        = :FLGEXCLUIALT,'
      '  FLGNAOVERIFICAMRGPCL  = :FLGNAOVERIFICAMRGPCL,'
      '  FLGVERIFICAITEMABERTO = :FLGVERIFICAITEMABERTO,'
      '  FLGOBRIGANUMPROTOCOLO= :FLGOBRIGANUMPROTOCOLO,'
      '  IDREGRATXCORRMONET = :IDREGRATXCORRMONET'
      'where'
      '  IDTIPOCONTREMPTMO = :OLD_IDTIPOCONTREMPTMO'
      ' '
      ' ')
    InsertSQL.Strings = (
      'insert into TIPOCONTREMPTMO'
      '  (IDTIPOCONTREMPTMO, IDTIPOEMPTMO, TCEDESCRICAO, '
      'IDREGRAJURCONC, IDREGRAJUREXIBE,'
      '   IDREGRALIMITES, IDREGRASUSPCOBR, IDREGRASLDDIA, '
      'IDREGRAJURANTCONC, IDREGRAELEG,'
      '   IDREGRARESERVA, IDREGRAMARGEM, IDREGRAPRAZOSCONC, '
      'IDREGRASALBAS, IDREGRADATACRED,'
      '   IDREGRAQUITADO, IDREGRAVLRMAX, IDREGRAPRAZOMAX, '
      'IDREGRAPRIMPARC, IDREPORTS,'
      '   ORIGEMCM, FLGSITUACAO, FLGSUSPENSAOAUTO, FLGSUSPENSAO, '
      'FLGSEGURO, FLGCONCESSAOZERO,'
      '   FLGUSOINTERNET, FLGUSOAUTOEMP, TCEMAXCONTRATO, TCEMAXINSCR, '
      'TCEMAXPARC,'
      '   TCEMINPARC,TCEMINQUIT, TCEMINRENOVA, TCETRATAPARCATRAS, '
      'TCETRATAPARCPARC,'
      '   FLGOBRIGBENEF,MOECODIGO, FLGCOBRJUDIC, TCEMAXMESDEB, '
      'NUMPARCDESCONTO,'
      '   IDPLANOPREV, TCENUMPARCSIM, FLGPERMITEPARCELA, '
      'FLGNAOREFINANCIA, IDCARTEIRASPC,'
      '   TCELEGENDACALC, TCELEGENDAEXIBE, FLGENVIAPARCMES, '
      'IDPROVENTOVLMAX, IDPROVENTOVLDEV,'
      '   FLGOBRIGACONCZERO, FLGUSOCENTRAL, FLGVERPRAZOTIPOQUIT, '
      'FLGFORMAPAG,'
      '   FLGFORMAREC, FLGVERIFICACONTRATO, IDREGRAMARGEMALT, '
      'IDREGRAMARGEMAVAL, IDREGRAELEGAVAL,'
      '   IDREGRAVENCPARC, FLGUSOEMPTMO, FLGEXCLUIALT, '
      'FLGNAOVERIFICAMRGPCL,'
      '   FLGVERIFICAITEMABERTO, FLGOBRIGANUMPROTOCOLO, '
      'IDREGRATXCORRMONET)'
      'values'
      '  (:IDTIPOCONTREMPTMO, :IDTIPOEMPTMO, :TCEDESCRICAO, '
      ':IDREGRAJURCONC, :IDREGRAJUREXIBE,'
      '   :IDREGRALIMITES, :IDREGRASUSPCOBR, :IDREGRASLDDIA, '
      ':IDREGRAJURANTCONC,'
      '   :IDREGRAELEG, :IDREGRARESERVA, :IDREGRAMARGEM, '
      ':IDREGRAPRAZOSCONC, :IDREGRASALBAS,'
      '   :IDREGRADATACRED, :IDREGRAQUITADO, :IDREGRAVLRMAX, '
      ':IDREGRAPRAZOMAX,'
      '   :IDREGRAPRIMPARC, :IDREPORTS, :ORIGEMCM, :FLGSITUACAO, '
      ':FLGSUSPENSAOAUTO,'
      
        '   :FLGSUSPENSAO, :FLGSEGURO, :FLGCONCESSAOZERO, :FLGUSOINTERNET' +
        ', '
      ':FLGUSOAUTOEMP,'
      '   :TCEMAXCONTRATO, :TCEMAXINSCR, :TCEMAXPARC, :TCEMINPARC, '
      ':TCEMINQUIT,'
      '   :TCEMINRENOVA, :TCETRATAPARCATRAS, :TCETRATAPARCPARC, '
      ':FLGOBRIGBENEF,'
      '   :MOECODIGO, :FLGCOBRJUDIC, :TCEMAXMESDEB, :NUMPARCDESCONTO, '
      ':IDPLANOPREV,'
      '   :TCENUMPARCSIM, :FLGPERMITEPARCELA, :FLGNAOREFINANCIA, '
      ':IDCARTEIRASPC,'
      '   :TCELEGENDACALC, :TCELEGENDAEXIBE, :FLGENVIAPARCMES, '
      ':IDPROVENTOVLMAX,'
      '   :IDPROVENTOVLDEV, :FLGOBRIGACONCZERO, :FLGUSOCENTRAL, '
      ':FLGVERPRAZOTIPOQUIT,'
      '   :FLGFORMAPAG, :FLGFORMAREC, :FLGVERIFICACONTRATO, '
      ':IDREGRAMARGEMALT, :IDREGRAMARGEMAVAL, :IDREGRAELEGAVAL,'
      '   :IDREGRAVENCPARC, :FLGUSOEMPTMO, :FLGEXCLUIALT, '
      ':FLGNAOVERIFICAMRGPCL,'
      '   :FLGVERIFICAITEMABERTO, :FLGOBRIGANUMPROTOCOLO, '
      ':IDREGRATXCORRMONET)')
    DeleteSQL.Strings = (
      'delete from TIPOCONTREMPTMO'
      'where'
      '  IDTIPOCONTREMPTMO = :OLD_IDTIPOCONTREMPTMO')
    Left = 408
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Caption = ''
    Colunas.Strings = (
      'TC.IDTIPOCONTREMPTMO'
      'TC.TCEDESCRICAO'
      'TE.DESCTIPOEMPTMO')
    TipodeDado.Strings = (
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Tipo de Contrato'
      'Tipo de Empréstimo')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'TIPOCONTREMPTMO TC'
      'TIPOEMPTMO TE')
    CamposChave.Strings = (
      'TC.IDTipoContrEmptmo'
      'TC.IDTIPOEMPTMO')
    Filtro.Strings = (
      '( TC.IDTIPOEMPTMO = TE.IDTIPOEMPTMO )')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '55'
      '40')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1')
    RepeteConsulta = True
    ExibePergunta = False
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
    Left = 528
    Top = 0
  end
  inherited ImlPadrao: TImageList
    Left = 977
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 728
    Top = 0
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '   TCE.IDTIPOCONTREMPTMO, TCE.IDTIPOEMPTMO, TCE.TCEDESCRICAO,'
      ''
      '   TCE.IDREGRAJURCONC,'
      '   TCE.IDREGRAJUREXIBE,'
      '   TCE.IDREGRALIMITES,'
      '   TCE.IDREGRASUSPCOBR,'
      '   TCE.IDREGRASLDDIA,'
      '   TCE.IDREGRAJURANTCONC,'
      '   TCE.IDREGRAELEG,'
      '   TCE.IDREGRARESERVA,'
      '   TCE.IDREGRAMARGEM,'
      '   TCE.IDREGRAPRAZOSCONC,'
      '   TCE.IDREGRASALBAS,'
      '   TCE.IDREGRADATACRED,'
      '   TCE.IDREGRAQUITADO,'
      '   TCE.IDREGRAVLRMAX,'
      '   TCE.IDREGRAPRAZOMAX,'
      '   TCE.IDREGRAPRIMPARC,'
      ''
      '   TCE.IDREPORTS,'
      '   TCE.ORIGEMCM,'
      ''
      '   TCE.FLGSITUACAO,'
      '   TCE.FLGSUSPENSAOAUTO,'
      '   TCE.FLGSUSPENSAO,'
      '   TCE.FLGSEGURO,'
      '   TCE.FLGCONCESSAOZERO,'
      '   TCE.FLGUSOINTERNET,'
      '   TCE.FLGUSOAUTOEMP,'
      ''
      '   TCE.TCEMAXCONTRATO,'
      '   TCE.TCEMAXINSCR,'
      '   TCE.TCEMAXPARC,'
      '   TCE.TCEMINPARC,'
      '   TCE.TCEMINQUIT,'
      '   TCE.TCEMINRENOVA,'
      ''
      '   TCE.TCETRATAPARCATRAS,'
      '   TCE.TCETRATAPARCPARC,'
      '   TCE.FLGOBRIGBENEF,'
      '   TCE.MOECODIGO,'
      '   TCE.FLGCOBRJUDIC,'
      '   TCE.TCEMAXMESDEB,'
      '   TCE.NUMPARCDESCONTO,'
      '   TCE.IDPLANOPREV,'
      '   TCE.TCENUMPARCSIM,'
      ''
      '   TCE.FLGPERMITEPARCELA,'
      '   TCE.FLGNAOREFINANCIA,'
      ''
      '   TCE.IDCARTEIRASPC,'
      ''
      '   TCE.TCELEGENDACALC,'
      '   TCE.TCELEGENDAEXIBE,'
      ''
      '   TCE.FLGENVIAPARCMES,'
      '   TCE.IDPROVENTOVLMAX,'
      '   TCE.IDPROVENTOVLDEV,'
      ''
      '   TCE.FLGOBRIGACONCZERO,'
      '   TCE.FLGUSOCENTRAL,'
      '   TCE.FLGVERPRAZOTIPOQUIT,'
      ''
      '   TCE.FLGFORMAPAG,'
      '   TCE.FLGFORMAREC,'
      '   TCE.FLGVERIFICACONTRATO,'
      ''
      '   TCE.IDREGRAMARGEMALT,'
      '   TCE.IDREGRAMARGEMAVAL,'
      '   TCE.IDREGRAELEGAVAL,'
      '   TCE.IDREGRAVENCPARC,'
      '   TCE.FLGUSOEMPTMO,'
      '   TCE.FLGEXCLUIALT,'
      ''
      '   TCE.FLGNAOVERIFICAMRGPCL,'
      '   TCE.FLGVERIFICAITEMABERTO,'
      ''
      '   TCE.IDREGRATXCORRMONET, --SIG27879'
      ''
      '   TCE.FLGOBRIGANUMPROTOCOLO, ----- SOL172525'
      ''
      '   REGRAJURCONC.NOMEREGRA AS NOMEREGRAJURCONC,'
      '   REGRAJUREXIBE.NOMEREGRA AS NOMEREGRAJUREXIBE,'
      '   REGRALIMITES.NOMEREGRA AS NOMEREGRALIMITES,'
      '   REGRASUSPCOBR.NOMEREGRA AS NOMEREGRASUSPCOBR,'
      '   REGRAVLRQUIT.NOMEREGRA AS NOMEREGRAVLRQUIT,'
      '   REGRASLDDIA.NOMEREGRA AS NOMEREGRASLDDIA,'
      '   REGRAJURANTCONC.NOMEREGRA AS NOMEREGRAJURANTCONC,'
      '   REGRAELEG.NOMEREGRA AS NOMEREGRAELEG,'
      '   REGRARESERVA.NOMEREGRA AS NOMEREGRARESERVA,'
      '   REGRAMARGEM.NOMEREGRA AS NOMEREGRAMARGEM,'
      '   REGRAPRAZOSCONC.NOMEREGRA AS NOMEREGRAPRAZOSCONC,'
      '   REGRASALARIOBASE.NOMEREGRA AS NOMEREGRASALBASE,'
      '   REGRADATACRED.NOMEREGRA AS NOMEREGRADATACRED,'
      '   REGRAQUITADO.NOMEREGRA AS NOMEREGRAQUITADO,'
      '   REGRAVLRMAX.NOMEREGRA AS NOMEREGRAVLRMAX,'
      '   REGRAPRAZOMAX.NOMEREGRA AS NOMEREGRAPRAZOMAX,'
      '   REGRAPRIMPARC.NOMEREGRA AS NOMEREGRAPRIMPARC,'
      ''
      '   REGRAMARGELALT.NOMEREGRA AS NOMEREGRAMARGELALT,'
      '   REGRAMARGEMAVAL.NOMEREGRA AS NOMEREGRAMARGEMAVAL,'
      '   REGRAELEGAVAL.NOMEREGRA AS NOMEREGRAELEGAVAL,'
      ''
      '   REGRAVENCPARC.NOMEREGRA AS NOMEREGRAVENCPARC,'
      '   '
      '   REGRATXCORRMONET.NOMEREGRA AS NOMEREGRATXCORRMONET--SIG27879'
      ''
      'FROM'
      '   REGRA REGRAJURCONC,'
      '   REGRA REGRAJUREXIBE,'
      '   REGRA REGRALIMITES,'
      '   REGRA REGRASUSPCOBR,'
      '   REGRA REGRAVLRQUIT,'
      '   REGRA REGRASLDDIA,'
      '   REGRA REGRAJURANTCONC,'
      '   REGRA REGRAELEG,'
      '   REGRA REGRARESERVA,'
      '   REGRA REGRAMARGEM,'
      '   REGRA REGRAPRAZOSCONC,'
      '   REGRA REGRASALARIOBASE,'
      '   REGRA REGRADATACRED,'
      '   REGRA REGRATXADM,'
      '   REGRA REGRAQUITADO,'
      '   REGRA REGRAVLRMAX,'
      '   REGRA REGRAPRAZOMAX,'
      '   REGRA REGRAPRIMPARC,'
      ''
      '   REGRA REGRATXCORRMONET, --SIG27879'
      ''
      '   REGRA REGRAMARGELALT,'
      '   REGRA REGRAMARGEMAVAL,'
      '   REGRA REGRAELEGAVAL,'
      '   REGRA REGRAVENCPARC,'
      ''
      '   TIPOCONTREMPTMO TCE,'
      '   TIPOEMPTMO      TEP'
      ''
      'WHERE'
      '       TCE.IDTIPOCONTREMPTMO =:PIDTIPOCONTREMPTMO'
      '   AND TCE.IDTIPOEMPTMO      =:PIDTIPOEMPTMO'
      '   AND TEP.IDTIPOEMPTMO      =:PIDTIPOEMPTMO'
      '   AND TCE.IDTIPOEMPTMO      = TEP.IDTIPOEMPTMO'
      ''
      '   AND TCE.IDREGRAJURCONC    = REGRAJURCONC.IDREGRA(+)'
      '   AND TCE.IDREGRAJUREXIBE   = REGRAJUREXIBE.IDREGRA(+)'
      '   AND TCE.IDREGRALIMITES    = REGRALIMITES.IDREGRA(+)'
      '   AND TCE.IDREGRASUSPCOBR   = REGRASUSPCOBR.IDREGRA(+)'
      '   AND TCE.IDREGRASLDDIA     = REGRASLDDIA.IDREGRA(+)'
      '   AND TCE.IDREGRAJURANTCONC = REGRAJURANTCONC.IDREGRA(+)'
      '   AND TCE.IDREGRAELEG       = REGRAELEG.IDREGRA(+)'
      '   AND TCE.IDREGRARESERVA    = REGRARESERVA.IDREGRA(+)'
      '   AND TCE.IDREGRAMARGEM     = REGRAMARGEM.IDREGRA(+)'
      '   AND TCE.IDREGRAPRAZOSCONC = REGRAPRAZOSCONC.IDREGRA(+)'
      '   AND TCE.IDREGRASALBAS     = REGRASALARIOBASE.IDREGRA(+)'
      '   AND TCE.IDREGRADATACRED   = REGRADATACRED.IDREGRA(+)'
      '   AND TCE.IDREGRAQUITADO    = REGRAQUITADO.IDREGRA(+)'
      '   AND TCE.IDREGRAVLRMAX     = REGRAVLRMAX.IDREGRA(+)'
      '   AND TCE.IDREGRAPRAZOMAX   = REGRAPRAZOMAX.IDREGRA(+)'
      '   AND TCE.IDREGRAPRIMPARC   = REGRAPRIMPARC.IDREGRA(+)'
      ''
      '   AND TCE.IDREGRAMARGEMALT  = REGRAMARGELALT.IDREGRA(+)'
      '   AND TCE.IDREGRAMARGEMAVAL = REGRAMARGEMAVAL.IDREGRA(+)'
      '   AND TCE.IDREGRAELEGAVAL   = REGRAELEGAVAL.IDREGRA(+)'
      '   AND TCE.IDREGRAVENCPARC   = REGRAVENCPARC.IDREGRA(+)'
      ''
      
        '   AND TCE.IDREGRATXCORRMONET = REGRATXCORRMONET.IDREGRA(+)--SIG' +
        '27879'
      ''
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ''
      ' ')
    Left = 440
    Top = 0
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDTipoContrEmptmo'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOEMPTMO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOEMPTMO'
        ParamType = ptUnknown
      end>
    object qryIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryIDTIPOEMPTMO: TFloatField
      FieldName = 'IDTIPOEMPTMO'
    end
    object qryTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      Size = 60
    end
    object qryIDREGRAJURCONC: TFloatField
      FieldName = 'IDREGRAJURCONC'
    end
    object qryIDREGRALIMITES: TFloatField
      FieldName = 'IDREGRALIMITES'
    end
    object qryIDREGRASUSPCOBR: TFloatField
      FieldName = 'IDREGRASUSPCOBR'
    end
    object qryIDREGRASLDDIA: TFloatField
      FieldName = 'IDREGRASLDDIA'
    end
    object qryIDREGRAJURANTCONC: TFloatField
      FieldName = 'IDREGRAJURANTCONC'
    end
    object qryIDREGRAELEG: TFloatField
      FieldName = 'IDREGRAELEG'
    end
    object qryIDREGRARESERVA: TFloatField
      FieldName = 'IDREGRARESERVA'
    end
    object qryIDREGRAMARGEM: TFloatField
      FieldName = 'IDREGRAMARGEM'
    end
    object qryIDREGRAPRAZOSCONC: TFloatField
      FieldName = 'IDREGRAPRAZOSCONC'
    end
    object qryIDREPORTS: TFloatField
      FieldName = 'IDREPORTS'
    end
    object qryORIGEMCM: TFloatField
      FieldName = 'ORIGEMCM'
    end
    object qryFLGSITUACAO: TStringField
      FieldName = 'FLGSITUACAO'
      FixedChar = True
      Size = 1
    end
    object qryFLGSUSPENSAO: TStringField
      FieldName = 'FLGSUSPENSAO'
      FixedChar = True
      Size = 1
    end
    object qryFLGSEGURO: TStringField
      FieldName = 'FLGSEGURO'
      FixedChar = True
      Size = 1
    end
    object qryTCEMAXCONTRATO: TFloatField
      FieldName = 'TCEMAXCONTRATO'
    end
    object qryTCEMAXINSCR: TFloatField
      FieldName = 'TCEMAXINSCR'
    end
    object qryTCEMAXPARC: TFloatField
      FieldName = 'TCEMAXPARC'
    end
    object qryTCEMINPARC: TFloatField
      FieldName = 'TCEMINPARC'
    end
    object qryTCEMINQUIT: TFloatField
      FieldName = 'TCEMINQUIT'
    end
    object qryTCETRATAPARCATRAS: TStringField
      FieldName = 'TCETRATAPARCATRAS'
      FixedChar = True
      Size = 1
    end
    object qryTCETRATAPARCPARC: TStringField
      FieldName = 'TCETRATAPARCPARC'
      FixedChar = True
      Size = 1
    end
    object qryNOMEREGRAJURCONC: TStringField
      FieldName = 'NOMEREGRAJURCONC'
      Size = 60
    end
    object qryNOMEREGRALIMITES: TStringField
      FieldName = 'NOMEREGRALIMITES'
      Size = 60
    end
    object qryNOMEREGRASUSPCOBR: TStringField
      FieldName = 'NOMEREGRASUSPCOBR'
      Size = 60
    end
    object qryNOMEREGRAVLRQUIT: TStringField
      FieldName = 'NOMEREGRAVLRQUIT'
      Size = 60
    end
    object qryNOMEREGRASLDDIA: TStringField
      FieldName = 'NOMEREGRASLDDIA'
      Size = 60
    end
    object qryNOMEREGRAJURANTCONC: TStringField
      FieldName = 'NOMEREGRAJURANTCONC'
      Size = 60
    end
    object qryNOMEREGRAELEG: TStringField
      FieldName = 'NOMEREGRAELEG'
      Size = 60
    end
    object qryNOMEREGRARESERVA: TStringField
      FieldName = 'NOMEREGRARESERVA'
      Size = 60
    end
    object qryNOMEREGRAMARGEM: TStringField
      FieldName = 'NOMEREGRAMARGEM'
      Size = 60
    end
    object qryNOMEREGRAPRAZOSCONC: TStringField
      FieldName = 'NOMEREGRAPRAZOSCONC'
      Size = 60
    end
    object qryFLGSUSPENSAOAUTO: TFloatField
      FieldName = 'FLGSUSPENSAOAUTO'
    end
    object qryFLGOBRIGBENEF: TFloatField
      FieldName = 'FLGOBRIGBENEF'
    end
    object qryIDREGRASALBAS: TFloatField
      FieldName = 'IDREGRASALBAS'
    end
    object qryNOMEREGRASALBASE: TStringField
      FieldName = 'NOMEREGRASALBASE'
      Size = 60
    end
    object qryMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
    end
    object qryFLGCONCESSAOZERO: TFloatField
      FieldName = 'FLGCONCESSAOZERO'
    end
    object qryTCEMINRENOVA: TFloatField
      FieldName = 'TCEMINRENOVA'
    end
    object qryIDREGRADATACRED: TFloatField
      FieldName = 'IDREGRADATACRED'
    end
    object qryNOMEREGRADATACRED: TStringField
      FieldName = 'NOMEREGRADATACRED'
      Size = 60
    end
    object qryFLGUSOINTERNET: TFloatField
      FieldName = 'FLGUSOINTERNET'
    end
    object qryIDREGRAQUITADO: TFloatField
      FieldName = 'IDREGRAQUITADO'
    end
    object qryNOMEREGRAQUITADO: TStringField
      FieldName = 'NOMEREGRAQUITADO'
      Size = 60
    end
    object qryFLGCOBRJUDIC: TFloatField
      FieldName = 'FLGCOBRJUDIC'
    end
    object qryTCEMAXMESDEB: TFloatField
      FieldName = 'TCEMAXMESDEB'
    end
    object qryIDREGRAVLRMAX: TFloatField
      FieldName = 'IDREGRAVLRMAX'
    end
    object qryNOMEREGRAVLRMAX: TStringField
      FieldName = 'NOMEREGRAVLRMAX'
      Size = 60
    end
    object qryIDREGRAPRAZOMAX: TFloatField
      FieldName = 'IDREGRAPRAZOMAX'
    end
    object qryNOMEREGRAPRAZOMAX: TStringField
      FieldName = 'NOMEREGRAPRAZOMAX'
      Size = 60
    end
    object qryNUMPARCDESCONTO: TFloatField
      FieldName = 'NUMPARCDESCONTO'
    end
    object qryIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryTCENUMPARCSIM: TFloatField
      FieldName = 'TCENUMPARCSIM'
    end
    object qryFLGPERMITEPARCELA: TFloatField
      FieldName = 'FLGPERMITEPARCELA'
    end
    object qryFLGNAOREFINANCIA: TFloatField
      FieldName = 'FLGNAOREFINANCIA'
    end
    object qryIDREGRAPRIMPARC: TFloatField
      FieldName = 'IDREGRAPRIMPARC'
    end
    object qryNOMEREGRAPRIMPARC: TStringField
      FieldName = 'NOMEREGRAPRIMPARC'
      Size = 60
    end
    object qryIDCARTEIRASPC: TFloatField
      FieldName = 'IDCARTEIRASPC'
    end
    object qryTCELEGENDACALC: TStringField
      FieldName = 'TCELEGENDACALC'
      Size = 10
    end
    object qryTCELEGENDAEXIBE: TStringField
      FieldName = 'TCELEGENDAEXIBE'
      Size = 10
    end
    object qryIDREGRAJUREXIBE: TFloatField
      FieldName = 'IDREGRAJUREXIBE'
    end
    object qryNOMEREGRAJUREXIBE: TStringField
      FieldName = 'NOMEREGRAJUREXIBE'
      Size = 60
    end
    object qryFLGENVIAPARCMES: TFloatField
      FieldName = 'FLGENVIAPARCMES'
    end
    object qryIDPROVENTOVLMAX: TFloatField
      FieldName = 'IDPROVENTOVLMAX'
    end
    object qryIDPROVENTOVLDEV: TFloatField
      FieldName = 'IDPROVENTOVLDEV'
    end
    object qryFLGOBRIGACONCZERO: TFloatField
      FieldName = 'FLGOBRIGACONCZERO'
    end
    object qryFLGUSOCENTRAL: TFloatField
      FieldName = 'FLGUSOCENTRAL'
    end
    object qryFLGVERPRAZOTIPOQUIT: TFloatField
      FieldName = 'FLGVERPRAZOTIPOQUIT'
    end
    object qryFLGFORMAPAG: TStringField
      FieldName = 'FLGFORMAPAG'
      FixedChar = True
      Size = 1
    end
    object qryFLGFORMAREC: TStringField
      FieldName = 'FLGFORMAREC'
      FixedChar = True
      Size = 1
    end
    object qryFLGVERIFICACONTRATO: TFloatField
      FieldName = 'FLGVERIFICACONTRATO'
    end
    object qryFLGUSOAUTOEMP: TFloatField
      FieldName = 'FLGUSOAUTOEMP'
    end
    object qryIDREGRAMARGEMALT: TFloatField
      FieldName = 'IDREGRAMARGEMALT'
    end
    object qryIDREGRAMARGEMAVAL: TFloatField
      FieldName = 'IDREGRAMARGEMAVAL'
    end
    object qryIDREGRAELEGAVAL: TFloatField
      FieldName = 'IDREGRAELEGAVAL'
    end
    object qryNOMEREGRAMARGELALT: TStringField
      FieldName = 'NOMEREGRAMARGELALT'
      Size = 60
    end
    object qryNOMEREGRAMARGEMAVAL: TStringField
      FieldName = 'NOMEREGRAMARGEMAVAL'
      Size = 60
    end
    object qryNOMEREGRAELEGAVAL: TStringField
      FieldName = 'NOMEREGRAELEGAVAL'
      Size = 60
    end
    object qryIDREGRAVENCPARC: TFloatField
      FieldName = 'IDREGRAVENCPARC'
    end
    object qryNOMEREGRAVENCPARC: TStringField
      FieldName = 'NOMEREGRAVENCPARC'
      Size = 60
    end
    object qryFLGUSOEMPTMO: TFloatField
      FieldName = 'FLGUSOEMPTMO'
    end
    object qryFLGEXCLUIALT: TFloatField
      FieldName = 'FLGEXCLUIALT'
    end
    object qryFLGNAOVERIFICAMRGPCL: TFloatField
      FieldName = 'FLGNAOVERIFICAMRGPCL'
    end
    object qryFLGVERIFICAITEMABERTO: TFloatField
      FieldName = 'FLGVERIFICAITEMABERTO'
    end
    object qryFLGOBRIGANUMPROTOCOLO: TFloatField
      FieldName = 'FLGOBRIGANUMPROTOCOLO'
    end
    object qryIDREGRATXCORRMONET: TFloatField
      FieldName = 'IDREGRATXCORRMONET'
    end
    object qryNOMEREGRATXCORRMONET: TStringField
      FieldName = 'NOMEREGRATXCORRMONET'
      Size = 60
    end
  end
  object dsCarteiraSPC: TDataSource
    DataSet = qryCarteiraSPC
    Left = 294
    Top = 410
  end
  object qryCarteiraSPC: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM CARTEIRASPC')
    ValidateWithMask = True
    Left = 206
    Top = 410
    object qryCarteiraSPCDESCARTEIRASPC: TStringField
      DisplayLabel = 'Carteira'
      DisplayWidth = 60
      FieldName = 'DESCARTEIRASPC'
      Origin = 'BASEDADOS.CARTEIRASPC.DESCARTEIRASPC'
      Size = 60
    end
    object qryCarteiraSPCIDCARTEIRASPC: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRASPC'
      Origin = 'BASEDADOS.CARTEIRASPC.IDCARTEIRASPC'
      Visible = False
    end
    object qryCarteiraSPCCODSEGMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'CODSEGMENTO'
      Origin = 'BASEDADOS.CARTEIRASPC.CODSEGMENTO'
      Visible = False
    end
    object qryCarteiraSPCCODTIPOCART: TStringField
      DisplayWidth = 5
      FieldName = 'CODTIPOCART'
      Origin = 'BASEDADOS.CARTEIRASPC.CODTIPOCART'
      Visible = False
      Size = 5
    end
  end
end
