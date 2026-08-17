inherited frmCancGeraParcela: TfrmCancGeraParcela
  Left = 205
  Top = 179
  HelpContext = 150008
  Caption = 'Geração Mensal de Parcelas'
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
      Width = 402
      Height = 24
      Caption = 'Desfazer Geração de Parcelas [seleção]'
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
      Width = 740
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
          TabOrder = 6
          TabStop = True
          TextOptions.Alignment = taCenter
          TextOptions.ExtrudeEffects.Depth = 4
          TextOptions.ExtrudeEffects.Orientation = fcTopRight
          TextOptions.VAlignment = vaVCenter
          OnClick = btnContinuarClick
        end
        object Panel1: TPanel
          Left = 360
          Top = 192
          Width = 361
          Height = 65
          TabOrder = 5
          object Label15: TLabel
            Left = 16
            Top = 14
            Width = 135
            Height = 13
            Caption = 'Competência (mês/ano)'
          end
          object Label5: TLabel
            Left = 240
            Top = 14
            Width = 75
            Height = 13
            Caption = 'Data Estorno'
          end
          object DBspnAno: TwwDBSpinEdit
            Left = 160
            Top = 28
            Width = 65
            Height = 21
            Increment = 1
            TabOrder = 1
            UnboundDataType = wwDefault
          end
          object cboMes: TComboBox
            Left = 16
            Top = 28
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
          object edtDataLancto: TwwDBDateTimePicker
            Left = 240
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
            TabOrder = 2
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
          TabOrder = 1
          AutoDropDown = False
          ShowButton = True
          UseTFields = False
          AllowClearKey = True
          ShowMatchText = True
          OnCloseUp = DBcboTipoEmptmoCloseUp
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
          TabOrder = 2
          AutoDropDown = False
          ShowButton = True
          UseTFields = False
          AllowClearKey = False
          ShowMatchText = True
        end
        inline molContratoEmptmo: TmolContratoEmptmo
          Left = 8
          Top = 8
          Width = 601
          inherited edtNome: TEdit
            Width = 353
          end
          inherited btnBuscaContrato: TBitBtn
            Left = 536
            OnClick = molContratoEmptmobtnBuscaContratoClick
          end
          inherited btnLimpaContrato: TBitBtn
            Left = 560
          end
          inherited edtIdContrato: TEdit
            Width = 105
          end
        end
        inline molListaPatro: TmolListaPatro
          Left = 8
          Top = 88
          Width = 345
          Height = 169
          TabOrder = 3
          inherited Label6: TLabel
            Width = 86
          end
          inherited lstPatro: TCheckListBox
            Width = 329
            Height = 153
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
          Top = 88
          Width = 377
          Height = 97
          TabOrder = 4
          inherited Label6: TLabel
            Width = 119
          end
          inherited lstPlano: TCheckListBox
            Width = 361
            Height = 81
          end
          inherited btnInvertePlano: TBitBtn
            Left = 327
            OnClick = molListaPlanobtnInvertePlanoClick
          end
          inherited btnMarcaTodosPlano: TBitBtn
            Left = 348
            OnClick = molListaPlanobtnMarcaTodosPlanoClick
          end
        end
        object chkDuplicidade: TCheckBox
          Left = 24
          Top = 264
          Width = 281
          Height = 17
          Caption = 'Defazer somente as parcelas em duplicidade'
          TabOrder = 7
          Visible = False
        end
        object chkInArquivo: TCheckBox
          Left = 368
          Top = 264
          Width = 345
          Height = 17
          Caption = 'Considerar APENAS Contratos do arquivo CONTRATOAD'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 8
        end
        object chkNotInArquivo: TCheckBox
          Left = 368
          Top = 288
          Width = 345
          Height = 17
          Caption = 'NÃO considerar Contratos do arquivo CONTRATOAD'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 9
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
        object memResult: TMemo
          Left = 16
          Top = 34
          Width = 345
          Height = 263
          TabOrder = 1
        end
        object memErro: TMemo
          Left = 384
          Top = 34
          Width = 337
          Height = 263
          TabOrder = 4
        end
        object Panel3: TPanel
          Left = 16
          Top = 8
          Width = 345
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
          Left = 384
          Top = 8
          Width = 337
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
      inherited bbtnAjuda: TmaHelpBitBtn
        ClickHelpContext = 150001
      end
    end
  end
  object Panel2: TPanel [2]
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
      '   H.FLGSUSPENSAO,'
      '   C.FLGSITUACAO'
      ''
      'FROM'
      
        '   HISTMOVEMPTMO H, CONTRATOEMPTMO C, TIPOCONTREMPTMO TC, TIPOEM' +
        'PTMO TE'
      ''
      'WHERE'
      '       ( HMETIPOMOV           = 1 )'
      '   AND ( H.FLGBAIXADO         = 0 )'
      '   AND ( H.FLGENVIO           = 0 )'
      
        '   AND ( ( H.FLGESTORNADO     = 0 ) OR ( H.FLGESTORNADO IS NULL ' +
        ') )'
      
        '   AND ( ( H.FLGQUITADO       = 0 ) OR ( H.FLGFLGQUITADO IS NULL' +
        ' ) )'
      
        '   AND ( (:PIDTIPOEMPTMO      IS NULL) OR (TC.IDTIPOEMPTMO =:PID' +
        'TIPOEMPTMO) )'
      
        '   AND ( (:PIDTIPOCONTREMPTMO IS NULL) OR (C.IDTIPOCONTREMPTMO =' +
        ':PIDTIPOCONTREMPTMO) )'
      
        '   AND ( (:PIDTIPOCONTREMPTMO IS NULL) OR (TC.IDTIPOCONTREMPTMO ' +
        '=:PIDTIPOCONTREMPTMO) )'
      '   AND ( H.PLNCODIGOESTORNO   IS NULL )'
      '   AND ( C.IDPATRO            IN (:PIDPATRO) )'
      '   AND ( C.IDPLANOPREV        IN (:PIDPLANOPREV) )'
      '   AND ( TE.IDEMPRESAPROP     =:PIDEMPRESAPROP )'
      '   AND ( TC.IDTIPOEMPTMO      = TE.IDTIPOEMPTMO )'
      '   AND ( C.IDTIPOCONTREMPTMO  = TC.IDTIPOCONTREMPTMO )'
      '   AND ( TC.IDTIPOEMPTMO      = TE.IDTIPOEMPTMO )'
      '   AND ( C.IDCONTRATOEMPTMO   = H.IDCONTRATOEMPTMO )')
    UpdateObject = updParcela
    ValidateWithMask = True
    Left = 304
    Top = 376
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
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 144
    Top = 376
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
      '   AND ( HMEORIGEM <> 9 )'
      '   AND ( ( H.FLGESTORNADO = 0 ) OR ( H.FLGESTORNADO IS NULL ) )'
      '   AND ( H.FLGBAIXADO = 0 )'
      '   AND ( H.FLGENVIO = 0 )'
      
        '   AND ( ( H.FLGDIVERGPEND = 0 ) OR ( H.FLGDIVERGPEND IS NULL ) ' +
        ')'
      '   AND ( H.PLNCODIGOESTORNO IS NULL )'
      '   AND ( H.HMEANOCOMPETENCIA =:PHMEANOCOMPETENCIA )'
      '   AND ( H.HMEMESCOMPETENCIA =:PHMEMESCOMPETENCIA )'
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
      ' ')
    ValidateWithMask = True
    Left = 400
    Top = 376
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
  object qryParcelasEstorno: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   HISTMOVEMPTMO'
      'SET'
      '   FLGESTORNADO      = 1,'
      '   HMEDATAESTORNO    =:PHMEDATAESTORNO,'
      '   HMEDATAESTORNOALT = SYSDATE,'
      '   IDUSUARIOESTORNO  =:PIDUSUARIOESTORNO'
      'WHERE'
      '   IDHISTMOVEMPTMO   =:PIDHISTMOVEMPTMO')
    ValidateWithMask = True
    Left = 224
    Top = 376
    ParamData = <
      item
        DataType = ftDateTime
        Name = 'PHMEDATAESTORNO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDUSUARIOESTORNO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDHISTMOVEMPTMO'
        ParamType = ptInput
      end>
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
    Left = 304
    Top = 388
  end
  object qrySituacaoContrato: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CON.FLGSITUACAO'
      'FROM'
      '   CONTRATOEMPTMO CON'
      'WHERE'
      '   CON.IDCONTRATOEMPTMO =:PIDCONTRATOEMPTMO')
    ValidateWithMask = True
    Left = 52
    Top = 375
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
    object qrySituacaoContratoFLGSITUACAO: TStringField
      FieldName = 'FLGSITUACAO'
      Origin = 'BASEDADOS.CONTRATOEMPTMO.FLGSITUACAO'
      FixedChar = True
      Size = 1
    end
  end
  object qryUpdateSituacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   CONTRATOEMPTMO CON'
      'SET'
      '   CON.FLGSITUACAO =:PFLGSITUACAO'
      'WHERE'
      '   CON.IDCONTRATOEMPTMO =:PIDCONTRATOEMPTMO')
    ValidateWithMask = True
    Left = 52
    Top = 387
    ParamData = <
      item
        DataType = ftString
        Name = 'PFLGSITUACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
  end
end
