inherited frmCancInscricao: TfrmCancInscricao
  Left = 30
  Top = 69
  HelpContext = 150003
  Caption = 'Cancelamento de Inscrições'
  ClientHeight = 436
  ClientWidth = 738
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 738
    Height = 403
    object lblTitulo: TfcLabel
      Left = 16
      Top = 8
      Width = 384
      Height = 24
      Caption = 'Cancelamento de Inscrições [seleção]'
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
      Top = 33
      Width = 738
      Height = 370
      Align = alBottom
      TabOrder = 0
      object TPage
        Left = 0
        Top = 0
        Caption = 'Selecao'
        object Bevel3: TBevel
          Left = 16
          Top = 312
          Width = 706
          Height = 3
          Shape = bsTopLine
        end
        object Label1: TLabel
          Left = 16
          Top = 50
          Width = 112
          Height = 13
          Caption = 'Tipo de Empréstimo'
        end
        object Label2: TLabel
          Left = 360
          Top = 50
          Width = 96
          Height = 13
          Caption = 'Tipo de Contrato'
        end
        object Label6: TLabel
          Left = 16
          Top = 90
          Width = 94
          Height = 13
          Caption = 'Patrocinadora(s)'
        end
        object Label7: TLabel
          Left = 360
          Top = 90
          Width = 47
          Height = 13
          Caption = 'Plano(s)'
        end
        object Panel1: TPanel
          Left = 360
          Top = 232
          Width = 361
          Height = 65
          TabOrder = 8
          object Label5: TLabel
            Left = 40
            Top = 28
            Width = 164
            Height = 13
            Caption = 'Data de Inscrição anterior a:'
          end
          object edtDataInscricao: TwwDBDateTimePicker
            Left = 208
            Top = 24
            Width = 105
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
        end
        object DBcboTipoEmptmo: TwwDBLookupCombo
          Left = 16
          Top = 64
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
          DropDownWidth = 8
          ParentFont = False
          TabOrder = 0
          AutoDropDown = False
          ShowButton = True
          UseTFields = False
          AllowClearKey = True
          ShowMatchText = True
          OnCloseUp = DBcboTipoEmptmoCloseUp
          OnExit = DBcboTipoEmptmoExit
        end
        object DBcboTipoContrato: TwwDBLookupCombo
          Left = 360
          Top = 64
          Width = 361
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
          LookupField = 'IDTipoContrEmptmo'
          DropDownWidth = 8
          Enabled = False
          ParentFont = False
          TabOrder = 1
          AutoDropDown = False
          ShowButton = True
          UseTFields = False
          AllowClearKey = False
          ShowMatchText = True
        end
        object btnContinuar: TfcShapeBtn
          Left = 632
          Top = 328
          Width = 89
          Height = 29
          Caption = 'Continuar'
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
            B08887F88888888887F887FBBBBB0BBBB088878888887F8887887FBBBBBB00BB
            BB087F88FFFF77F888787FB00000000BBB087F877777777F88787FB000000000
            BB087F877777777788787FB00000000BBB087F877777777888787FBBBBBB00BB
            BB0878F888887788887887FBBBBB0BBBB08887F88888788887F887FBBBBBBBBB
            B088878F888888888788887FFBBBBBBB08888878FF88888F788888877FFFFF77
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
          TabOrder = 9
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
        end
        object lstPatro: TCheckListBox
          Left = 16
          Top = 104
          Width = 329
          Height = 193
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          TabOrder = 2
        end
        object BitBtn2: TBitBtn
          Left = 303
          Top = 94
          Width = 21
          Height = 20
          Hint = 'Inverte a Seleção'
          TabOrder = 3
          OnClick = BitBtn2Click
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
        object BitBtn1: TBitBtn
          Left = 324
          Top = 94
          Width = 21
          Height = 20
          Hint = 'Seleciona Todos'
          TabOrder = 4
          OnClick = BitBtn1Click
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
          Left = 360
          Top = 104
          Width = 361
          Height = 113
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          TabOrder = 5
        end
        object BitBtn3: TBitBtn
          Left = 679
          Top = 94
          Width = 21
          Height = 20
          Hint = 'Inverte a Seleção'
          TabOrder = 6
          OnClick = BitBtn3Click
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
        object BitBtn4: TBitBtn
          Left = 700
          Top = 94
          Width = 21
          Height = 20
          Hint = 'Seleciona Todos'
          TabOrder = 7
          OnClick = BitBtn4Click
          Glyph.Data = {
            D6000000424DD60000000000000076000000280000000C0000000C0000000100
            0400000000006000000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888848888888
            0000888224888888000088222248888800008822822488880000882848224888
            0000888224822488000088222248228800008822822482880000882888224888
            0000888888822488000088888888228800008888888882880000}
        end
        object fcShapeBtn2: TfcShapeBtn
          Left = 632
          Top = 328
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
          TabOrder = 10
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = fcShapeBtn2Click
        end
        inline molInscricaoEmptmo1: TmolInscricaoEmptmo
          Left = 8
          Top = 8
          Width = 609
          TabOrder = 11
          inherited Label1: TLabel
            Left = 120
          end
          inherited edtNome: TEdit
            Left = 120
            Width = 441
          end
          inherited btnBuscaContrato: TBitBtn
            Left = 560
            OnClick = molInscricaoEmptmo1btnBuscaContratoClick
          end
          inherited btnLimpaContrato: TBitBtn
            Left = 584
          end
          inherited edtidInscricao: TEdit
            Width = 113
          end
        end
      end
      object TPage
        Left = 0
        Top = 0
        Caption = 'Lancamentos'
        object Bevel1: TBevel
          Left = 16
          Top = 312
          Width = 705
          Height = 3
          Shape = bsTopLine
        end
        object btnVoltar: TfcShapeBtn
          Left = 536
          Top = 328
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
        end
        object Panel3: TPanel
          Left = 16
          Top = 8
          Width = 705
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Inscrições'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
        object fcShapeBtn1: TfcShapeBtn
          Left = 632
          Top = 328
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
          TabOrder = 2
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = fcShapeBtn1Click
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 403
    Width = 738
    inherited tb97Fundo: TToolbar97
      Left = 421
      inherited bbtnAjuda: TmaHelpBitBtn
        ClickHelpContext = 150001
      end
    end
  end
  object qryInscricaoCanc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   I.IDISCRICAOEMPTMO,'
      ''
      '   I.IDTIPOCONTREMPTMO,'
      '   I.IDPESSOA,'
      '   I.IDPATRO,'
      '   I.IDPLANOPREV,'
      '   I.IDBENEF,'
      '   I.DATAINSC,'
      '   I.DATACANCINSC,'
      '   I.IDMOTIVOCANC,'
      '   I.VLRSOLIC,'
      '   I.NUMPARCELAS,'
      ''
      '   PT.NOME AS NOME_TITULAR,'
      '   PB.NOME AS NOME_BENEF,'
      '   PP.NOME AS NOME_PATRO,'
      '   PL.NOME AS NOME_PLANO,'
      ''
      '   TC.TCEDESCRICAO'
      ''
      'FROM'
      '   PESSOA PT,'
      '   PESSOA PB,'
      '   PESSOA PP,'
      '   INSCRICAOEMPTMO I,'
      '   CONTRATOEMPTMO C,'
      ''
      '   PLANPREV PL'
      ''
      'WHERE'
      '   ('
      ''
      '/*'
      'SELECT'
      '   I.IDINSCRICAOEMPTMO AS C0,'
      '   PT.NOME AS TITULAR,'
      '   PB.NOME AS BENEF,'
      '   PP.NOME AS PATRO,'
      '   PL.NOME AS PLANO,'
      '   I.DATAINSC AS C5,'
      '   I.IDINSCRICAOEMPTMO AS C6,'
      '   PT.IDPESSOA AS IDTITULAR,'
      '   PB.IDPESSOA AS IDBENEF,'
      '   PT.NOME AS NOME_TITULAR,'
      '   PB.NOME AS NOME_BENEF'
      'FROM'
      '   PESSOA PT,'
      '   PESSOA PB,'
      '   PESSOA PP,'
      '   INSCRICAOEMPTMO I,'
      '   CONTRATOEMPTMO C,'
      '   PLANPREV PL'
      'WHERE'
      '   ( C.IDINSCRICAOEMPTMO IS NULL ) AND'
      '   ( I.IDINSCRICAOEMPTMO = C.IDINSCRICAOEMPTMO(+) ) AND'
      '   ( I.IDPESSOA = PT.IDPESSOA ) AND'
      '   ( I.IDBENEF = PB.IDPESSOA ) AND'
      '   ( I.IDPATRO = PP.IDPESSOA ) AND'
      '   ( I.IDPLANOPREV = PL.IDPLANOPREV )'
      ' ')
    ValidateWithMask = True
    Left = 624
    Top = 172
  end
  object updInscricaoCanc: TUpdateSQL
    Left = 624
    Top = 160
  end
  object qryCancelaInscricao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   I.IDISCRICAOEMPTMO,'
      ''
      '   I.IDTIPOCONTREMPTMO,'
      '   I.IDPESSOA,'
      '   I.IDPATRO,'
      '   I.IDPLANOPREV,'
      '   I.IDBENEF,'
      '   I.DATAINSC,'
      '   I.DATACANCINSC,'
      '   I.IDMOTIVOCANC,'
      '   I.VLRSOLIC,'
      '   I.NUMPARCELAS,'
      ''
      '   PT.NOME AS NOME_TITULAR,'
      '   PB.NOME AS NOME_BENEF,'
      '   PP.NOME AS NOME_PATRO,'
      '   PL.NOME AS NOME_PLANO,'
      ''
      '   TC.TCEDESCRICAO'
      ''
      'FROM'
      '   PESSOA PT,'
      '   PESSOA PB,'
      '   PESSOA PP,'
      '   INSCRICAOEMPTMO I,'
      '   CONTRATOEMPTMO C,'
      ''
      '   PLANPREV PL'
      ''
      'WHERE'
      '   ('
      ''
      '/*'
      'SELECT'
      '   I.IDINSCRICAOEMPTMO AS C0,'
      '   PT.NOME AS TITULAR,'
      '   PB.NOME AS BENEF,'
      '   PP.NOME AS PATRO,'
      '   PL.NOME AS PLANO,'
      '   I.DATAINSC AS C5,'
      '   I.IDINSCRICAOEMPTMO AS C6,'
      '   PT.IDPESSOA AS IDTITULAR,'
      '   PB.IDPESSOA AS IDBENEF,'
      '   PT.NOME AS NOME_TITULAR,'
      '   PB.NOME AS NOME_BENEF'
      'FROM'
      '   PESSOA PT,'
      '   PESSOA PB,'
      '   PESSOA PP,'
      '   INSCRICAOEMPTMO I,'
      '   CONTRATOEMPTMO C,'
      '   PLANPREV PL'
      'WHERE'
      '   ( C.IDINSCRICAOEMPTMO IS NULL ) AND'
      '   ( I.IDINSCRICAOEMPTMO = C.IDINSCRICAOEMPTMO(+) ) AND'
      '   ( I.IDPESSOA = PT.IDPESSOA ) AND'
      '   ( I.IDBENEF = PB.IDPESSOA ) AND'
      '   ( I.IDPATRO = PP.IDPESSOA ) AND'
      '   ( I.IDPLANOPREV = PL.IDPLANOPREV )'
      ' ')
    ValidateWithMask = True
    Left = 152
    Top = 188
  end
  object qryDeletaAvalista: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM CONTRATOXAVALISTA'
      'WHERE IDINSCRICAOEMPTMO = :PIDINSCRICAOEMPTMO'
      ''
      '   ')
    ValidateWithMask = True
    Left = 112
    Top = 260
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDINSCRICAOEMPTMO'
        ParamType = ptInput
      end>
  end
  object qryDeletaBenef: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM CONTRATOXBENEFSEG'
      'WHERE IDINSCRICAOEMPTMO = :PIDINSCRICAOEMPTMO'
      ''
      '   ')
    ValidateWithMask = True
    Left = 208
    Top = 260
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDINSCRICAOEMPTMO'
        ParamType = ptInput
      end>
  end
end
