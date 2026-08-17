inherited frmCancAtualizacaoDiaria: TfrmCancAtualizacaoDiaria
  Left = 28
  Top = 110
  Caption = 'Desfazer Atualização Diária'
  ClientHeight = 436
  ClientWidth = 740
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 740
    Height = 403
    object lblTitulo: TfcLabel
      Left = 16
      Top = 8
      Width = 373
      Height = 24
      Caption = 'Desfazer Atualização Diária [seleção]'
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
      Left = 1
      Top = 32
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
          Top = 58
          Width = 112
          Height = 13
          Caption = 'Tipo de Empréstimo'
        end
        object Label2: TLabel
          Left = 360
          Top = 58
          Width = 96
          Height = 13
          Caption = 'Tipo de Contrato'
        end
        object Label6: TLabel
          Left = 16
          Top = 98
          Width = 94
          Height = 13
          Caption = 'Patrocinadora(s)'
        end
        object Label7: TLabel
          Left = 360
          Top = 98
          Width = 47
          Height = 13
          Caption = 'Plano(s)'
        end
        object Panel1: TPanel
          Left = 360
          Top = 240
          Width = 361
          Height = 65
          TabOrder = 2
          object Label5: TLabel
            Left = 16
            Top = 14
            Width = 66
            Height = 13
            Caption = 'Data Inicial'
          end
          object Label3: TLabel
            Left = 136
            Top = 14
            Width = 59
            Height = 13
            Caption = 'Data Final'
          end
          object edtDataInicial: TwwDBDateTimePicker
            Left = 16
            Top = 28
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
          object edtDataFinal: TwwDBDateTimePicker
            Left = 136
            Top = 28
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
            TabOrder = 1
            UnboundDataType = wwDTEdtDate
            DisplayFormat = 'dd/mm/yyyy'
          end
        end
        object DBcboTipoEmptmo: TwwDBLookupCombo
          Left = 16
          Top = 72
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
          AllowClearKey = False
          ShowMatchText = True
          OnCloseUp = DBcboTipoEmptmoCloseUp
        end
        object DBcboTipoContrato: TwwDBLookupCombo
          Left = 360
          Top = 72
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
          TabOrder = 3
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnContinuarClick
        end
        object lstPatro: TCheckListBox
          Left = 16
          Top = 112
          Width = 329
          Height = 193
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          TabOrder = 4
        end
        object BitBtn2: TBitBtn
          Left = 303
          Top = 102
          Width = 21
          Height = 20
          Hint = 'Inverte a Seleção'
          TabOrder = 5
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
        object BitBtn1: TBitBtn
          Left = 324
          Top = 102
          Width = 21
          Height = 20
          Hint = 'Seleciona Todos'
          TabOrder = 6
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
          Left = 360
          Top = 112
          Width = 361
          Height = 121
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          TabOrder = 7
        end
        object BitBtn3: TBitBtn
          Left = 679
          Top = 102
          Width = 21
          Height = 20
          Hint = 'Inverte a Seleção'
          TabOrder = 8
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
        object BitBtn4: TBitBtn
          Left = 700
          Top = 102
          Width = 21
          Height = 20
          Hint = 'Seleciona Todos'
          TabOrder = 9
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
        inline molContratoEmptmo: TmolContratoEmptmo
          Left = 8
          Top = 16
          Width = 713
          TabOrder = 10
          inherited edtNome: TEdit
            Width = 465
          end
          inherited btnBuscaContrato: TBitBtn
            Left = 664
          end
          inherited btnLimpaContrato: TBitBtn
            Left = 688
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
        object LblProcessado: TLabel
          Left = 16
          Top = 131
          Width = 88
          Height = 13
          Caption = 'Processados: 0'
        end
        object lblErro: TLabel
          Left = 16
          Top = 284
          Width = 119
          Height = 13
          Caption = 'Erros encontrados: 0'
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
          OnClick = btnVoltarClick
        end
        object memResult: TMemo
          Left = 16
          Top = 34
          Width = 707
          Height = 95
          TabOrder = 1
        end
        object memErro: TMemo
          Left = 16
          Top = 186
          Width = 707
          Height = 95
          TabOrder = 4
        end
        object Panel3: TPanel
          Left = 16
          Top = 8
          Width = 707
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
          Top = 160
          Width = 707
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
          TabOrder = 3
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 403
    Width = 740
    inherited tb97Fundo: TToolbar97
      Left = 565
      DockPos = 565
    end
  end
  object Panel2: TPanel
    Left = 0
    Top = 0
    Width = 740
    Height = 0
    TabOrder = 2
    Visible = False
  end
  object qryParcela: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   H.IDHISTMOVEMPTMO,'
      '   H.IDCONTRATOEMPTMO,'
      '   H.IDITEMEMPTMO,'
      '   H.HMEPARCELA,'
      '   H.HMETIPOMOV,'
      ''
      '   H.FLGSUSPENSAO,'
      '   H.FLGESTORNADO,'
      '   H.FLGBAIXADO,'
      '   H.FLGABONADO,'
      '   H.FLGENVIO,'
      '   H.FLGDIVERGPEND,'
      '   H.PLNCODIGO,'
      '   H.PLNCODIGOESTORNO,'
      ''
      '   H.HMEORIGEM,'
      ''
      '   H.HMEFORMACOBRANCA,'
      '   H.HMECENTRALIZA,'
      '   H.HMEDESTACADO,'
      '   H.IDITEMCENTRALIZA,'
      ''
      '   H.HMEVLRPREVISTO,'
      '   H.HMEVLREFETIVO,'
      ''
      '   H.HMEANOCOMPETENCIA, H.HMEMESCOMPETENCIA,'
      '   H.HMEDATAPREVISTA, H.HMEDATAEFETIVA,'
      '   H.HMEANOCOBRANCA, H.HMEMESCOBRANCA,'
      '   H.HMESEQCOBRANCA,'
      '   H.HMESALDODEV, H.HMETXJUROS, H.HMEFORMACOBRANCA,'
      '   H.FLGESTORNADO'
      ''
      ''
      'FROM'
      
        '   HISTMOVEMPTMO H, CONTRATOEMPTMO C, TIPOCONTREMPTMO TC, TIPOEM' +
        'PTMO TE'
      ''
      'WHERE'
      '   ( HMETIPOMOV = 1 )'
      '   AND ( HMEORIGEM = 5 )'
      '   AND ( ( H.FLGESTORNADO = 0 ) OR ( H.FLGESTORNADO IS NULL ) )'
      '   AND ( H.FLGBAIXADO = 0 )'
      
        '   AND ( ( H.FLGDIVERGPEND = 0 ) OR ( H.FLGDIVERGPEND IS NULL ) ' +
        ')'
      '   AND ( H.PLNCODIGOESTORNO IS NULL )'
      
        '   AND ( (:PIDTIPOEMPTMO IS NULL) OR (TC.IDTIPOEMPTMO =:PIDTIPOE' +
        'MPTMO) )'
      
        '   AND ( (:PIDTIPOCONTREMPTMO IS NULL) OR (C.IDTIPOCONTREMPTMO =' +
        ':PIDTIPOCONTREMPTMO) )'
      
        '   AND ( (:PIDTIPOCONTREMPTMO IS NULL) OR (TC.IDTIPOCONTREMPTMO ' +
        '=:PIDTIPOCONTREMPTMO) )'
      '   AND ( H.HMEDATAATUALIZA = :PHMEDATAATUALIZA)'
      '   AND ( C.IDPATRO IN (:PIDPATRO) )'
      '   AND ( C.IDPLANOPREV IN (:PIDPLANOPREV) )'
      '   AND ( TE.IDEMPRESAPROP =:PIDEMPRESAPROP )'
      '   AND ( TC.IDTIPOEMPTMO = TE.IDTIPOEMPTMO )'
      '   AND ( C.IDTIPOCONTREMPTMO = TC.IDTIPOCONTREMPTMO )'
      '   AND ( TC.IDTIPOEMPTMO = TE.IDTIPOEMPTMO )'
      '   AND ( C.IDCONTRATOEMPTMO = H.IDCONTRATOEMPTMO )'
      ''
      ''
      ' ')
    UpdateObject = updParcela
    ValidateWithMask = True
    Left = 664
    Top = 12
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDTIPOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOEMPTMO'
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
      end
      item
        DataType = ftDateTime
        Name = 'PHMEDATAATUALIZA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PIDPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDEMPRESAPROP'
        ParamType = ptInput
      end>
    object qryParcelaIDHISTMOVEMPTMO: TFloatField
      FieldName = 'IDHISTMOVEMPTMO'
    end
    object qryParcelaIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryParcelaIDITEMEMPTMO: TFloatField
      FieldName = 'IDITEMEMPTMO'
    end
    object qryParcelaHMEPARCELA: TFloatField
      FieldName = 'HMEPARCELA'
    end
    object qryParcelaHMETIPOMOV: TFloatField
      FieldName = 'HMETIPOMOV'
    end
    object qryParcelaFLGSUSPENSAO: TFloatField
      FieldName = 'FLGSUSPENSAO'
    end
    object qryParcelaFLGESTORNADO: TFloatField
      FieldName = 'FLGESTORNADO'
    end
    object qryParcelaFLGBAIXADO: TFloatField
      FieldName = 'FLGBAIXADO'
    end
    object qryParcelaFLGABONADO: TFloatField
      FieldName = 'FLGABONADO'
    end
    object qryParcelaFLGENVIO: TFloatField
      FieldName = 'FLGENVIO'
    end
    object qryParcelaFLGDIVERGPEND: TFloatField
      FieldName = 'FLGDIVERGPEND'
    end
    object qryParcelaPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
    end
    object qryParcelaPLNCODIGOESTORNO: TFloatField
      FieldName = 'PLNCODIGOESTORNO'
    end
    object qryParcelaHMEORIGEM: TFloatField
      FieldName = 'HMEORIGEM'
    end
    object qryParcelaHMEFORMACOBRANCA: TStringField
      FieldName = 'HMEFORMACOBRANCA'
      FixedChar = True
      Size = 1
    end
    object qryParcelaHMECENTRALIZA: TFloatField
      FieldName = 'HMECENTRALIZA'
    end
    object qryParcelaHMEDESTACADO: TFloatField
      FieldName = 'HMEDESTACADO'
    end
    object qryParcelaIDITEMCENTRALIZA: TFloatField
      FieldName = 'IDITEMCENTRALIZA'
    end
    object qryParcelaHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
    end
    object qryParcelaHMEVLREFETIVO: TFloatField
      FieldName = 'HMEVLREFETIVO'
    end
    object qryParcelaHMEANOCOMPETENCIA: TFloatField
      FieldName = 'HMEANOCOMPETENCIA'
    end
    object qryParcelaHMEMESCOMPETENCIA: TFloatField
      FieldName = 'HMEMESCOMPETENCIA'
    end
    object qryParcelaHMEDATAPREVISTA: TDateTimeField
      FieldName = 'HMEDATAPREVISTA'
    end
    object qryParcelaHMEDATAEFETIVA: TDateTimeField
      FieldName = 'HMEDATAEFETIVA'
    end
    object qryParcelaHMEANOCOBRANCA: TFloatField
      FieldName = 'HMEANOCOBRANCA'
    end
    object qryParcelaHMEMESCOBRANCA: TFloatField
      FieldName = 'HMEMESCOBRANCA'
    end
    object qryParcelaHMESEQCOBRANCA: TFloatField
      FieldName = 'HMESEQCOBRANCA'
    end
    object qryParcelaHMESALDODEV: TFloatField
      FieldName = 'HMESALDODEV'
    end
    object qryParcelaHMETXJUROS: TFloatField
      FieldName = 'HMETXJUROS'
    end
    object qryParcelaHMEFORMACOBRANCA_1: TStringField
      FieldName = 'HMEFORMACOBRANCA_1'
      FixedChar = True
      Size = 1
    end
    object qryParcelaFLGESTORNADO_1: TFloatField
      FieldName = 'FLGESTORNADO_1'
    end
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 584
  end
  object qryContaParcelas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT COUNT(*) AS QUANTIDADE'
      'FROM'
      
        '   HISTMOVEMPTMO H, CONTRATOEMPTMO C, TIPOCONTREMPTMO TC, TIPOEM' +
        'PTMO TE'
      'WHERE'
      '   ( HMETIPOMOV = 1 )'
      '   AND ( HMEORIGEM = 5 )'
      '   AND ( ( H.FLGESTORNADO = 0 ) OR ( H.FLGESTORNADO IS NULL ) )'
      '   AND ( H.FLGBAIXADO = 0 )'
      
        '   AND ( ( H.FLGDIVERGPEND = 0 ) OR ( H.FLGDIVERGPEND IS NULL ) ' +
        ')'
      '   AND ( H.PLNCODIGOESTORNO IS NULL )'
      '   AND ( H.HMEDATAATUALIZA = :PHMEDATAATUALIZA )'
      '   AND ( H.PLNCODIGOESTORNO IS NULL )'
      
        '   AND ( (:PIDTIPOEMPTMO IS NULL) OR (TC.IDTIPOEMPTMO =:PIDTIPOE' +
        'MPTMO) )'
      
        '   AND ( (:PIDTIPOCONTREMPTMO IS NULL) OR (C.IDTIPOCONTREMPTMO =' +
        ':PIDTIPOCONTREMPTMO) )'
      
        '   AND ( (:PIDTIPOCONTREMPTMO IS NULL) OR (TC.IDTIPOCONTREMPTMO ' +
        '=:PIDTIPOCONTREMPTMO) )'
      '   AND ( C.IDPATRO IN (:PIDPATRO) )'
      '   AND ( C.IDPLANOPREV IN (:PIDPLANOPREV) )'
      '   AND ( TE.IDEMPRESAPROP =:PIDEMPRESAPROP )'
      '   AND ( TC.IDTIPOEMPTMO = TE.IDTIPOEMPTMO )'
      '   AND ( C.IDTIPOCONTREMPTMO = TC.IDTIPOCONTREMPTMO )'
      '   AND ( TC.IDTIPOEMPTMO = TE.IDTIPOEMPTMO )'
      '   AND ( C.IDCONTRATOEMPTMO = H.IDCONTRATOEMPTMO )'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 600
    Top = 80
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'PHMEDATAATUALIZA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOEMPTMO'
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
      end
      item
        DataType = ftString
        Name = 'PIDPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PIDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDEMPRESAPROP'
        ParamType = ptInput
      end>
    object qryContaParcelasQUANTIDADE: TFloatField
      FieldName = 'QUANTIDADE'
    end
  end
  object updParcela: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTMOVEMPTMO'
      'set'
      '  FLGESTORNADO = :FLGESTORNADO'
      'where'
      '  IDHISTMOVEMPTMO = :OLD_IDHISTMOVEMPTMO')
    DeleteSQL.Strings = (
      '')
    Left = 649
    Top = 184
  end
  object qryParcelasEstorno: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   HISTMOVEMPTMO'
      'SET'
      '   FLGESTORNADO = 1'
      'WHERE'
      '   IDHISTMOVEMPTMO = :PIDHISTMOVEMPTMO'
      ' ')
    ValidateWithMask = True
    Left = 240
    Top = 136
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDHISTMOVEMPTMO'
        ParamType = ptInput
      end>
  end
end
