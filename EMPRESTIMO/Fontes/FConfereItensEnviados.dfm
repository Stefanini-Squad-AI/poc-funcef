inherited frmConfereItensEnviados: TfrmConfereItensEnviados
  Left = 158
  Top = 156
  Caption = 'Confere Itens Enviados'
  ClientHeight = 354
  ClientWidth = 638
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 638
    Height = 321
    object pgcGeral: TPageControl
      Left = 1
      Top = 1
      Width = 636
      Height = 319
      ActivePage = tbsFiltro
      Align = alClient
      TabOrder = 0
      object tbsFiltro: TTabSheet
        Caption = 'Filtros'
        object Label6: TLabel
          Left = 16
          Top = 42
          Width = 94
          Height = 13
          Caption = 'Patrocinadora(s)'
        end
        object Label7: TLabel
          Left = 320
          Top = 42
          Width = 47
          Height = 13
          Caption = 'Plano(s)'
        end
        object Label2: TLabel
          Left = 320
          Top = 2
          Width = 96
          Height = 13
          Caption = 'Tipo de Contrato'
        end
        object Label1: TLabel
          Left = 16
          Top = 2
          Width = 112
          Height = 13
          Caption = 'Tipo de Empréstimo'
        end
        object btnContinuar: TfcShapeBtn
          Left = 520
          Top = 243
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
          TabOrder = 0
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnContinuarClick
        end
        object lstPatro: TCheckListBox
          Left = 16
          Top = 56
          Width = 289
          Height = 169
          OnClickCheck = lstPatroClickCheck
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          TabOrder = 1
        end
        object btnInvertePatro: TBitBtn
          Left = 264
          Top = 48
          Width = 20
          Height = 20
          Hint = 'Inverte a Seleção'
          TabOrder = 2
          OnClick = btnInvertePatroClick
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888488888888888888844888888888888444448888888888444444488
            1888884444444888118884448844888881188448884888888118844888888188
            8118844888881188111888448881111111888884881111111888888888811111
            8888888888881188888888888888818888888888888888888888}
        end
        object btnMarcaTodosPatro: TBitBtn
          Left = 284
          Top = 48
          Width = 21
          Height = 20
          Hint = 'Seleciona Todos'
          TabOrder = 3
          OnClick = btnMarcaTodosPatroClick
          Glyph.Data = {
            D6000000424DD60000000000000076000000280000000C0000000C0000000100
            0400000000006000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888848888888
            0000888224888888000088222248888800008822822488880000882848224888
            0000888224822488000088222248228800008822822482880000882888224888
            0000888888822488000088888888228800008888888882880000}
        end
        object lstPlano: TCheckListBox
          Left = 320
          Top = 56
          Width = 289
          Height = 105
          OnClickCheck = lstPlanoClickCheck
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          TabOrder = 4
        end
        object btnInvertePlano: TBitBtn
          Left = 567
          Top = 48
          Width = 21
          Height = 20
          Hint = 'Inverte a Seleção'
          TabOrder = 5
          OnClick = btnInvertePlanoClick
          Glyph.Data = {
            F6000000424DF600000000000000760000002800000010000000100000000100
            0400000000008000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888488888888888888844888888888888444448888888888444444488
            1888884444444888118884448844888881188448884888888118844888888188
            8118844888881188111888448881111111888884881111111888888888811111
            8888888888881188888888888888818888888888888888888888}
        end
        object btnMarcaTodosPlano: TBitBtn
          Left = 588
          Top = 48
          Width = 21
          Height = 20
          Hint = 'Seleciona Todos'
          TabOrder = 6
          OnClick = btnMarcaTodosPlanoClick
          Glyph.Data = {
            D6000000424DD60000000000000076000000280000000C0000000C0000000100
            0400000000006000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888848888888
            0000888224888888000088222248888800008822822488880000882848224888
            0000888224822488000088222248228800008822822482880000882888224888
            0000888888822488000088888888228800008888888882880000}
        end
        object DBcboTipoContrato: TwwDBLookupCombo
          Left = 320
          Top = 16
          Width = 289
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'TCEDESCRICAO'#9'60'#9'TCEDESCRICAO'#9'F')
          LookupTable = dtmLookEmptmo.qryLookTipoContrato
          LookupField = 'IDTIPOCONTREMPTMO'
          DropDownWidth = 8
          Enabled = False
          ParentFont = False
          TabOrder = 7
          AutoDropDown = False
          ShowButton = True
          UseTFields = False
          AllowClearKey = False
          ShowMatchText = True
        end
        object Panel1: TPanel
          Left = 320
          Top = 168
          Width = 289
          Height = 57
          TabOrder = 8
          object Label15: TLabel
            Left = 40
            Top = 10
            Width = 116
            Height = 13
            Caption = 'Cobrança (mês/ano)'
          end
          object DBspnAno: TwwDBSpinEdit
            Left = 192
            Top = 24
            Width = 65
            Height = 21
            Increment = 1
            MaxValue = 2500
            MinValue = 1850
            TabOrder = 1
            UnboundDataType = wwDefault
          end
          object cboMes: TComboBox
            Left = 40
            Top = 24
            Width = 153
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
        object GroupBox1: TGroupBox
          Left = 16
          Top = 232
          Width = 465
          Height = 41
          Caption = ' Forma(s) de Envio '
          TabOrder = 9
          object chkFinanceiro: TCheckBox
            Left = 16
            Top = 16
            Width = 121
            Height = 17
            Caption = 'Financeiro (CaR)'
            Checked = True
            State = cbChecked
            TabOrder = 0
          end
          object chkFolhaPatro: TCheckBox
            Left = 152
            Top = 16
            Width = 137
            Height = 17
            Caption = 'Folha Patrocinadora'
            Checked = True
            State = cbChecked
            TabOrder = 1
          end
          object chkFolhaBenef: TCheckBox
            Left = 312
            Top = 16
            Width = 137
            Height = 17
            Caption = 'Folha de Benefícios'
            Checked = True
            State = cbChecked
            TabOrder = 2
          end
        end
        object DBcboTipoEmptmo: TwwDBLookupCombo
          Left = 16
          Top = 16
          Width = 289
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
          TabOrder = 10
          AutoDropDown = False
          ShowButton = True
          UseTFields = False
          AllowClearKey = False
          ShowMatchText = True
          OnCloseUp = DBcboTipoEmptmoCloseUp
        end
      end
      object tbsResultado: TTabSheet
        Caption = 'Resultado'
        ImageIndex = 1
        object Panel2: TPanel
          Left = 15
          Top = 3
          Width = 598
          Height = 25
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Resumo'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -19
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object btnVoltar: TfcShapeBtn
          Left = 520
          Top = 243
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
          TabOrder = 1
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnVoltarClick
        end
        object planilha: TF1Book
          Left = 16
          Top = 29
          Width = 595
          Height = 202
          TabOrder = 2
          ControlData = {
            000001007F3D0000E114000060000000010001074631426F6F6B310101010101
            0101010101010101010101000A070000000009080800000505006C09C907EE7E
            040000000000EF7E140000000000000000000000FFFFFFFFFFFFFFFFF3FF3D00
            1200F000B301DD22D60B3800000000000100580222000200000031001400C800
            0000FF7F900100000000000005417269616C31001400C8000000FF7FBC020000
            0000000005417269616C31001400C8000200FF7F900100000000000005417269
            616C31001400C8000200FF7FBC0200000000000005417269616C31001400C800
            0000FF7F900100000000000005417269616C1E041C0005001922522422232C23
            23305F293B5C2822522422232C2323305C291E04210006001E22522422232C23
            23305F293B5B5265645D5C2822522422232C2323305C291E04220007001F2252
            2422232C2323302E30305F293B5C2822522422232C2323302E30305C291E0427
            0008002422522422232C2323302E30305F293B5B5265645D5C2822522422232C
            2323302E30305C291E0432002A002F5F285C242A20232C2323305F293B5F285C
            242A205C28232C2323305C293B5F285C242A20222D225F293B5F28405F291E04
            2C002900295F282A20232C2323305F293B5F282A205C28232C2323305C293B5F
            282A20222D225F293B5F28405F291E043A002C00375F285C242A20232C232330
            2E30305F293B5F285C242A205C28232C2323302E30305C293B5F285C242A2022
            2D223F3F5F293B5F28405F291E0434002B00315F282A20232C2323302E30305F
            293B5F282A205C28232C2323302E30305C293B5F282A20222D223F3F5F293B5F
            28405F29ED7E05000000000000EC7E0300000000E000140000000000F5FF2000
            C02000000000000000000000E000140001000000F5FF20C4C020000000000000
            00000000E000140001000000F5FF20C4C02000000000000000000000E0001400
            02000000F5FF20C4C02000000000000000000000E000140002000000F5FF20C4
            C02000000000000000000000E000140000000000F5FF20C4C020000000000000
            00000000E000140000000000F5FF20C4C02000000000000000000000E0001400
            00000000F5FF20C4C02000000000000000000000E000140000000000F5FF20C4
            C02000000000000000000000E000140000000000F5FF20C4C020000000000000
            00000000E000140000000000F5FF20C4C02000000000000000000000E0001400
            00000000F5FF20C4C02000000000000000000000E000140000000000F5FF20C4
            C02000000000000000000000E000140000000000F5FF20C4C020000000000000
            00000000E000140000000000F5FF20C4C02000000000000000000000E0001400
            0000000001002000C02000000000000000000000E000140005000800F5FF20C8
            C02000000000000000000000E000140005000600F5FF20C8C020000000000000
            00000000E000140005000C00F5FF20C8C02000000000000000000000E0001400
            05000A00F5FF20C8C02000000000000000000000E000140005000D00F5FF20C8
            C02000000000000000000000E000140004000000F0FF1248C020000000000000
            00000000E00014000000040001002314C0200000000000000000000093020400
            108003FF93020400118006FF93020400128004FF93020400138007FF93020400
            008000FF93020400148005FF85000D00AF0400000000065368656574310A0000
            0009080800000510006C09C9070D00020001000C00020064000F000200010011
            000200000010000800FCA9F1D24D62503F5F00020001002A00020000002B0002
            000100250204000100FF008C0004000100370081000200C10414000300022641
            1500080007506167652026508300020000008400020000002600080000000000
            0000E83F27000800000000000000E83F28000800000000000000F03F29000800
            000000000000F03FA10022000100640001000100010006000000000000000000
            0000E03F000000000000E03F010055000200080000020A000000000000000000
            0000F77E18009200FFCCFFFFFF00C0C0C000FF00FF3F0000000000000000F27E
            10000000000000000000000000000000FFFFF67E0A00150015001500FF004006
            F37E110006000E466F726D6120436F6272616EE761F37E080005000556616C6F
            72F37E0B00040008436F6E747261746FF37E100003000D5469706F20436F6E74
            7261746FF37E0800020005506C616E6FF37E100001000D506174726F63696E61
            646F7261F37E09000000064576656E746F7D000C000000000025130F00000000
            007D000C000100010025120F00000000007D000C0002000200B7100F00000000
            007D000C0003000300B7130F00000000007D000C0004000400920C0F00000000
            007D000C0005000500DB0B1600000000007D000C000600060025130F00000000
            001D000F000300000000000001000000000000003E020A003602000000000000
            0000A000040064006400AB002200200080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF9900020026090A0000000000000452E3
            0B918FCE119DE300AA004BB8516C740000AC020000010000006C000000000000
            0000000000FFFFFFFFFFFFFFFF0000000000000000007D0000C05D000020454D
            4600000100AC0200001000000004000000000000000000000000000000000400
            000003000040010000F000000000000000000000000000000000E2040080A903
            001B000000100000000000000000000000520000007001000001000000F5FFFF
            FF0000000000000000000000009001000000000001000000004D005300200053
            0061006E00730020005300650072006900660000000000000000000000000000
            0000000000000000000000000000000000000000000000000000000300030000
            00000000004D0053002000530061006E00730020005300650072006900660000
            000000000000000000000000000000000084FB12002F034878C4FA1200180000
            0048129200030000000000130003000000000FA3017439E177238AE177010001
            805CFB120070FA12000101010004FC1200A79D4978902646780000FFFF84FB12
            004A8AE17700001300000000003879130050804100B82452018CFC1200030000
            0068FB1200444A000020374678FFFFFFFF78FB1200A736467800000000402D52
            01CCA215004E460041000000000100004034750041402D5201484A0000402D52
            01F6460041307500411C000000242D520140490041ACFB120064760008000000
            00250000000C00000001000000180000000C00000000000000260000001C0000
            000200000000000000010000000000000000000000250000000C000000020000
            00140000000C0000000D00000027000000180000000300000000000000FFFFFF
            0000000000250000000C00000003000000190000000C000000FFFFFF00120000
            000C00000002000000250000000C00000007000080250000000C000000050000
            80250000000C0000000D0000800E000000140000000000000010000000140000
            0001}
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 321
    Width = 638
    inherited tb97Fundo: TToolbar97
      Left = 421
    end
  end
  object qryConcessoes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '   SELECT'
      '      HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO,'
      
        '      DECODE(HME.HMEFORMACOBRANCA,'#39'C'#39','#39'Financeiro'#39','#39'Folha'#39') AS H' +
        'MEFORMACOBRANCA,'
      '      HME.HMEVLRPREVISTO'
      '   FROM'
      '      HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '      ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC, TIPOEMPTMO TE'
      '   WHERE'
      '          C.IDCONTRQUITACAO      IS NULL'
      '      AND HMETIPOMOV             = 0'
      '      AND HMEPARCELA             = 0'
      '      AND FLGBAIXADO             IS NULL'
      '      AND FLGESTORNADO           IS NULL'
      '      AND HME.HMEANOCOMPETENCIA  =:PHMEANOCOMPETENCIA'
      '      AND HME.HMEMESCOMPETENCIA  =:PHMEMESCOMPETENCIA'
      
        '      AND ( (:PITCTRATASALDODEV IS NULL) OR (ITC.ITCTRATASALDODE' +
        'V <> 0) )'
      '      AND ITCSEQCALCULO =  ('
      '                           SELECT'
      
        '                              MIN(ITCSEQCALCULO) AS ITCSEQCALCUL' +
        'O'
      '                           FROM'
      '                              ITEMXTIPOCONTR'
      '                           WHERE'
      
        '                                  IDTIPOCONTREMPTMO = TC.IDTIPOC' +
        'ONTREMPTMO'
      '                              AND ITCEVENTO = 0'
      '                           )'
      '      AND C.IDPATRO              =:PIDPESSOA'
      '      AND C.IDPLANOPREV          =:PIDPLANOPREV'
      '      AND C.IDTIPOCONTREMPTMO    =:PIDTIPOCONTREMPTMO'
      '      AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO'
      '      AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO'
      '      AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO'
      '      AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO'
      '      AND TE.IDEMPRESAPROP       =:PIDEMPRESAPROP'
      '      AND TE.IDTIPOEMPTMO        = TC.IDTIPOEMPTMO'
      'ORDER BY HME.IDCONTRATOEMPTMO'
      ''
      ''
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 56
    Top = 88
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PHMEANOCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PITCTRATASALDODEV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PIDEMPRESAPROP'
        ParamType = ptUnknown
      end>
    object qryConcessoesIDHISTMOVEMPTMO: TFloatField
      FieldName = 'IDHISTMOVEMPTMO'
    end
    object qryConcessoesIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryConcessoesHMEFORMACOBRANCA: TStringField
      FieldName = 'HMEFORMACOBRANCA'
      Size = 10
    end
    object qryConcessoesHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
    end
  end
  object qryParcelas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO,'
      
        '   DECODE(HME.HMEFORMACOBRANCA,'#39'C'#39','#39'Financeiro'#39','#39'Folha'#39') AS HMEF' +
        'ORMACOBRANCA,'
      '   HME.HMEVLRPREVISTO'
      'FROM'
      '   HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '   ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC, TIPOEMPTMO TE'
      'WHERE'
      '       HMETIPOMOV             IN (1, 6, 7)'
      '   AND FLGBAIXADO             IS NULL'
      '   AND FLGESTORNADO           IS NULL'
      '   AND HME.HMEANOCOMPETENCIA  =:PHMEANOCOMPETENCIA'
      '   AND HME.HMEMESCOMPETENCIA  =:PHMEMESCOMPETENCIA'
      
        '   AND ( ((:PITCTRATASALDODEV IS NOT NULL) AND (ITC.ITCTRATASALD' +
        'ODEV <> 0)) OR (HMECENTRALIZA = 1 OR HMEDESTACADO = 1) )'
      '   AND C.IDPATRO              =:PIDPESSOA'
      '   AND C.IDPLANOPREV          =:PIDPLANOPREV'
      '   AND C.IDTIPOCONTREMPTMO    =:PIDTIPOCONTREMPTMO'
      '   AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO'
      '   AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO'
      '   AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO'
      '   AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO'
      '   AND TE.IDEMPRESAPROP       =:PIDEMPRESAPROP'
      '   AND TE.IDTIPOEMPTMO        = TC.IDTIPOEMPTMO'
      'ORDER BY HME.IDCONTRATOEMPTMO'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 56
    Top = 136
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PHMEANOCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PITCTRATASALDODEV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PIDEMPRESAPROP'
        ParamType = ptUnknown
      end>
    object qryParcelasIDHISTMOVEMPTMO: TFloatField
      FieldName = 'IDHISTMOVEMPTMO'
    end
    object qryParcelasIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryParcelasHMEFORMACOBRANCA: TStringField
      FieldName = 'HMEFORMACOBRANCA'
      Size = 10
    end
    object qryParcelasHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
    end
  end
  object qryParcelaAtr: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO,'
      
        '   DECODE(HME.HMEFORMACOBRANCA,'#39'C'#39','#39'Financeiro'#39','#39'Folha'#39') AS HMEF' +
        'ORMACOBRANCA,'
      '   HME.HMEVLRPREVISTO'
      'FROM'
      '   HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '   ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC, TIPOEMPTMO TE'
      'WHERE'
      '       HMETIPOMOV             IN (1, 6, 7)'
      '   AND FLGBAIXADO             IS NULL'
      '   AND FLGESTORNADO           IS NULL'
      '   AND HME.HMEANOCOBRANCA     =:PHMEANOCOMPETENCIA'
      '   AND HME.HMEMESCOBRANCA     =:PHMEMESCOMPETENCIA'
      
        '   AND (RTRIM(LTRIM(HME.HMEANOCOMPETENCIA)) || RTRIM(LTRIM(HME.H' +
        'MEMESCOMPETENCIA))) < (RTRIM(LTRIM(HME.HMEANOCOBRANCA)) || RTRIM' +
        '(LTRIM(HME.HMEMESCOBRANCA)))'
      
        '   AND ( ((:PITCTRATASALDODEV IS NOT NULL) AND (ITC.ITCTRATASALD' +
        'ODEV <> 0)) OR (HMECENTRALIZA = 1 OR HMEDESTACADO = 1) )'
      '   AND C.IDPATRO              =:PIDPESSOA'
      '   AND C.IDPLANOPREV          =:PIDPLANOPREV'
      '   AND C.IDTIPOCONTREMPTMO    =:PIDTIPOCONTREMPTMO'
      '   AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO'
      '   AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO'
      '   AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO'
      '   AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO'
      '   AND TE.IDEMPRESAPROP       =:PIDEMPRESAPROP'
      '   AND TE.IDTIPOEMPTMO        = TC.IDTIPOEMPTMO'
      'ORDER BY HME.IDCONTRATOEMPTMO'
      ''
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 56
    Top = 184
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PHMEANOCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PITCTRATASALDODEV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PIDEMPRESAPROP'
        ParamType = ptUnknown
      end>
    object qryParcelaAtrIDHISTMOVEMPTMO: TFloatField
      FieldName = 'IDHISTMOVEMPTMO'
    end
    object qryParcelaAtrIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryParcelaAtrHMEFORMACOBRANCA: TStringField
      FieldName = 'HMEFORMACOBRANCA'
      Size = 10
    end
    object qryParcelaAtrHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
    end
  end
  object qryQuitacoes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO,'
      
        '   DECODE(HME.HMEFORMACOBRANCA,'#39'C'#39','#39'Financeiro'#39','#39'Folha'#39') AS HMEF' +
        'ORMACOBRANCA,'
      '   HME.HMEVLRPREVISTO'
      'FROM'
      '   HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '   ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC, TIPOEMPTMO TE'
      'WHERE'
      '       HMETIPOMOV             = 3'
      '   AND FLGBAIXADO             IS NULL'
      '   AND FLGESTORNADO           IS NULL'
      '   AND HME.HMEANOCOMPETENCIA  =:PHMEANOCOMPETENCIA'
      '   AND HME.HMEMESCOMPETENCIA  =:PHMEMESCOMPETENCIA'
      
        '   AND ( ((:PITCTRATASALDODEV IS NOT NULL) AND (ITC.ITCTRATASALD' +
        'ODEV <> 0)) OR (HMECENTRALIZA = 1 OR HMEDESTACADO = 1) )'
      '   AND C.IDPATRO              =:PIDPESSOA'
      '   AND C.IDPLANOPREV          =:PIDPLANOPREV'
      '   AND C.IDTIPOCONTREMPTMO    =:PIDTIPOCONTREMPTMO'
      '   AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO'
      '   AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO'
      '   AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO'
      '   AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO'
      '   AND TE.IDEMPRESAPROP       =:PIDEMPRESAPROP'
      '   AND TE.IDTIPOEMPTMO        = TC.IDTIPOEMPTMO'
      'ORDER BY HME.IDCONTRATOEMPTMO'
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 160
    Top = 200
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PHMEANOCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PITCTRATASALDODEV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PIDEMPRESAPROP'
        ParamType = ptUnknown
      end>
    object qryQuitacoesIDHISTMOVEMPTMO: TFloatField
      FieldName = 'IDHISTMOVEMPTMO'
    end
    object qryQuitacoesIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryQuitacoesHMEFORMACOBRANCA: TStringField
      FieldName = 'HMEFORMACOBRANCA'
      Size = 10
    end
    object qryQuitacoesHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
    end
  end
  object qryAmortizacoes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO,'
      
        '   DECODE(HME.HMEFORMACOBRANCA,'#39'C'#39','#39'Financeiro'#39','#39'Folha'#39') AS HMEF' +
        'ORMACOBRANCA,'
      '   HME.HMEVLRPREVISTO'
      'FROM'
      '   HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '   ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC, TIPOEMPTMO TE'
      'WHERE'
      '       HMETIPOMOV             = 2'
      '   AND FLGBAIXADO             IS NULL'
      '   AND FLGESTORNADO           IS NULL'
      '   AND HME.HMEANOCOMPETENCIA  =:PHMEANOCOMPETENCIA'
      '   AND HME.HMEMESCOMPETENCIA  =:PHMEMESCOMPETENCIA'
      
        '   AND ( ((:PITCTRATASALDODEV IS NOT NULL) AND (ITC.ITCTRATASALD' +
        'ODEV <> 0)) OR (HMECENTRALIZA = 1 OR HMEDESTACADO = 1) )'
      '   AND C.IDPATRO              =:PIDPESSOA'
      '   AND C.IDPLANOPREV          =:PIDPLANOPREV'
      '   AND C.IDTIPOCONTREMPTMO    =:PIDTIPOCONTREMPTMO'
      '   AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO'
      '   AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO'
      '   AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO'
      '   AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO'
      '   AND TE.IDEMPRESAPROP       =:PIDEMPRESAPROP'
      '   AND TE.IDTIPOEMPTMO        = TC.IDTIPOEMPTMO'
      'ORDER BY HME.IDCONTRATOEMPTMO'
      ' ')
    ValidateWithMask = True
    Left = 160
    Top = 144
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PHMEANOCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PITCTRATASALDODEV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PIDEMPRESAPROP'
        ParamType = ptUnknown
      end>
    object qryAmortizacoesIDHISTMOVEMPTMO: TFloatField
      FieldName = 'IDHISTMOVEMPTMO'
    end
    object qryAmortizacoesIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryAmortizacoesHMEFORMACOBRANCA: TStringField
      FieldName = 'HMEFORMACOBRANCA'
      Size = 10
    end
    object qryAmortizacoesHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
    end
  end
  object qryEncargos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO,'
      
        '   DECODE(HME.HMEFORMACOBRANCA,'#39'C'#39','#39'Financeiro'#39','#39'Folha'#39') AS HMEF' +
        'ORMACOBRANCA,'
      '   HME.HMEVLRPREVISTO'
      'FROM'
      '   HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '   ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC, TIPOEMPTMO TE'
      'WHERE'
      '       HMETIPOMOV             = 4'
      '   AND FLGBAIXADO             IS NULL'
      '   AND FLGESTORNADO           IS NULL'
      '   AND HME.HMEANOCOMPETENCIA  =:PHMEANOCOMPETENCIA'
      '   AND HME.HMEMESCOMPETENCIA  =:PHMEMESCOMPETENCIA'
      
        '   AND ( ((:PITCTRATASALDODEV IS NOT NULL) AND (ITC.ITCTRATASALD' +
        'ODEV <> 0)) OR (HMECENTRALIZA = 1 OR HMEDESTACADO = 1) )'
      '   AND C.IDPATRO              =:PIDPESSOA'
      '   AND C.IDPLANOPREV          =:PIDPLANOPREV'
      '   AND C.IDTIPOCONTREMPTMO    =:PIDTIPOCONTREMPTMO'
      '   AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO'
      '   AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO'
      '   AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO'
      '   AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO'
      '   AND TE.IDEMPRESAPROP       =:PIDEMPRESAPROP'
      '   AND TE.IDTIPOEMPTMO        = TC.IDTIPOEMPTMO'
      'ORDER BY HME.IDCONTRATOEMPTMO'
      ''
      ' ')
    ValidateWithMask = True
    Left = 160
    Top = 96
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PHMEANOCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PITCTRATASALDODEV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PIDEMPRESAPROP'
        ParamType = ptUnknown
      end>
    object qryEncargosIDHISTMOVEMPTMO: TFloatField
      FieldName = 'IDHISTMOVEMPTMO'
    end
    object qryEncargosIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryEncargosHMEFORMACOBRANCA: TStringField
      FieldName = 'HMEFORMACOBRANCA'
      Size = 10
    end
    object qryEncargosHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
    end
  end
  object qryQuitMort: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   HME.IDHISTMOVEMPTMO, HME.IDCONTRATOEMPTMO,'
      
        '   DECODE(HME.HMEFORMACOBRANCA,'#39'C'#39','#39'Financeiro'#39','#39'Folha'#39') AS HMEF' +
        'ORMACOBRANCA,'
      '   HME.HMEVLRPREVISTO'
      'FROM'
      '   HISTMOVEMPTMO HME, CONTRATOEMPTMO C,'
      '   ITEMXTIPOCONTR ITC, TIPOCONTREMPTMO TC, TIPOEMPTMO TE'
      'WHERE'
      '       HMETIPOMOV             = 3'
      '   AND HMEORIGEM              = 8'
      '   AND FLGBAIXADO             IS NULL'
      '   AND FLGESTORNADO           IS NULL'
      '   AND HME.HMEANOCOMPETENCIA  =:PHMEANOCOMPETENCIA'
      '   AND HME.HMEMESCOMPETENCIA  =:PHMEMESCOMPETENCIA'
      
        '   AND ( ((:PITCTRATASALDODEV IS NOT NULL) AND (ITC.ITCTRATASALD' +
        'ODEV <> 0)) OR (HMECENTRALIZA = 1 OR HMEDESTACADO = 1) )'
      '   AND C.IDPATRO              =:PIDPESSOA'
      '   AND C.IDPLANOPREV          =:PIDPLANOPREV'
      '   AND C.IDTIPOCONTREMPTMO    =:PIDTIPOCONTREMPTMO'
      '   AND HME.IDCONTRATOEMPTMO   = C.IDCONTRATOEMPTMO'
      '   AND C.IDTIPOCONTREMPTMO    = TC.IDTIPOCONTREMPTMO'
      '   AND TC.IDTIPOCONTREMPTMO   = ITC.IDTIPOCONTREMPTMO'
      '   AND HME.IDITEMEMPTMO       = ITC.IDITEMEMPTMO'
      '   AND TE.IDEMPRESAPROP       =:PIDEMPRESAPROP'
      '   AND TE.IDTIPOEMPTMO        = TC.IDTIPOEMPTMO'
      'ORDER BY HME.IDCONTRATOEMPTMO'
      ''
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 256
    Top = 120
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PHMEANOCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMEMESCOMPETENCIA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PITCTRATASALDODEV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PIDEMPRESAPROP'
        ParamType = ptUnknown
      end>
    object qryQuitMortIDHISTMOVEMPTMO: TFloatField
      FieldName = 'IDHISTMOVEMPTMO'
    end
    object qryQuitMortIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryQuitMortHMEFORMACOBRANCA: TStringField
      FieldName = 'HMEFORMACOBRANCA'
      Size = 10
    end
    object qryQuitMortHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
    end
  end
  object qryTipoContrato: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDTIPOCONTREMPTMO, TCEDESCRICAO'
      'FROM'
      '   TIPOCONTREMPTMO'
      'WHERE'
      '       ( IDTIPOEMPTMO =:PIDTIPOEMPTMO )'
      
        '   AND ( (:PIDTIPOCONTREMPTMO IS NULL) OR (IDTIPOCONTREMPTMO = :' +
        'PIDTIPOCONTREMPTMO) )'
      'ORDER BY'
      '   TCEDESCRICAO')
    ValidateWithMask = True
    Left = 448
    Top = 88
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PIDTIPOEMPTMO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptUnknown
      end>
    object qryTipoContratoIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.IDTIPOCONTREMPTMO'
    end
    object qryTipoContratoTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.TCEDESCRICAO'
      Size = 60
    end
  end
end
