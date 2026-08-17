inherited frmCadTransfRenFix: TfrmCadTransfRenFix
  Left = 223
  Top = 175
  HelpContext = 790254
  Caption = 'Operação'
  ClientHeight = 423
  ClientWidth = 755
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 755
    Height = 337
    inherited Bevel2: TBevel
      Width = 753
    end
    inherited pnlTitulo: TPanel
      Width = 753
      inherited lbNomItem: TfcLabel
        Width = 274
        Caption = 'Transferência Entre Planos'
      end
    end
    object pnlDados: TPanel
      Left = 1
      Top = 45
      Width = 436
      Height = 291
      Align = alLeft
      BevelInner = bvLowered
      BevelOuter = bvNone
      TabOrder = 1
      object pnlOrigem: TPanel
        Left = 1
        Top = 1
        Width = 434
        Height = 160
        Align = alTop
        TabOrder = 0
        object lblPlanoPatroOrigem: TLabel
          Left = 16
          Top = 30
          Width = 126
          Height = 13
          Caption = 'Plano / Patrocinadora'
        end
        object lblInvestimento: TLabel
          Left = 16
          Top = 68
          Width = 73
          Height = 13
          Caption = 'Investimento'
        end
        object lblQtdOrigem: TLabel
          Left = 144
          Top = 107
          Width = 66
          Height = 13
          Caption = 'Quantidade'
        end
        object lblVlrOrigem: TLabel
          Left = 296
          Top = 107
          Width = 30
          Height = 13
          Caption = 'Valor'
        end
        object lblDtOperacao: TLabel
          Left = 17
          Top = 107
          Width = 73
          Height = 13
          Caption = 'Dt Operação'
        end
        object dblkPlanPatroO: TwwDBLookupCombo
          Left = 16
          Top = 44
          Width = 401
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'PLANPRVCONTABPATRO'#9'113'#9'Plano / Patrocinadora'#9'F')
          LookupTable = qryPatroPlanPrevContabO
          LookupField = 'IDPLANPREVCTBPATR'
          Options = [loColLines, loRowLines, loTitles]
          Enabled = False
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
          ShowMatchText = True
        end
        object dblkInvestimento: TwwDBLookupCombo
          Left = 16
          Top = 82
          Width = 401
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCINVESTIMENTO'#9'60'#9'Investimento'#9'F')
          LookupTable = qryInvestimento
          LookupField = 'IDINVESTIMENTO'
          Options = [loColLines, loRowLines, loTitles]
          Enabled = False
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
          ShowMatchText = True
        end
        object pnlCaptionOrigem: TPanel
          Left = 1
          Top = 1
          Width = 432
          Height = 24
          Align = alTop
          Alignment = taLeftJustify
          BevelInner = bvLowered
          Caption = '    Origem'
          Color = clNavy
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
        end
        object pnlVlrOrigem: TPanel
          Left = 295
          Top = 124
          Width = 121
          Height = 21
          Alignment = taRightJustify
          BevelOuter = bvLowered
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
        end
        object pnlQtdOrigem: TPanel
          Left = 145
          Top = 124
          Width = 132
          Height = 21
          Alignment = taRightJustify
          BevelOuter = bvLowered
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
        end
        object dbDtaOperacao: TCMDateTimePicker
          Left = 18
          Top = 124
          Width = 111
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
          Enabled = False
          ShowButton = True
          TabOrder = 2
        end
      end
      object pnlDestino: TPanel
        Left = 1
        Top = 161
        Width = 434
        Height = 129
        Align = alClient
        TabOrder = 1
        object lblPlanoPatroDestino: TLabel
          Left = 17
          Top = 32
          Width = 126
          Height = 13
          Caption = 'Plano / Patrocinadora'
        end
        object lblVlrDestino: TLabel
          Left = 264
          Top = 71
          Width = 30
          Height = 13
          Caption = 'Valor'
        end
        object lblQtdDestino: TLabel
          Left = 154
          Top = 71
          Width = 66
          Height = 13
          Caption = 'Quantidade'
        end
        object lblPercentual: TLabel
          Left = 16
          Top = 71
          Width = 62
          Height = 13
          Caption = 'Percentual'
        end
        object dblkPlanPatroD: TwwDBLookupCombo
          Left = 17
          Top = 45
          Width = 400
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'PLANPRVCONTABPATRO'#9'50'#9'Plano / Patrocinadora'#9'F')
          LookupTable = qryPatroPlanPrevContabD
          LookupField = 'IDPLANPREVCTBPATR'
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
          ShowMatchText = True
        end
        object pnlCaptionDestino: TPanel
          Left = 1
          Top = 1
          Width = 432
          Height = 24
          Align = alTop
          Alignment = taLeftJustify
          BevelInner = bvLowered
          Caption = '    Destino'
          Color = clNavy
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
        end
        object redtPercentual: TRealEdit
          Left = 16
          Top = 86
          Width = 121
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '100,00')
          TabOrder = 1
          WordWrap = False
          OnExit = redtPercentualExit
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object redtQtdDestino: TRealEdit
          Left = 155
          Top = 86
          Width = 121
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,000000000')
          TabOrder = 2
          WordWrap = False
          OnEnter = redtQtdDestinoEnter
          OnExit = redtQtdDestinoExit
          IntDigits = 10
          DecDigits = 9
          NumberFormat = fNumber
          Signal = False
        end
        object redtVlrDestino: TRealEdit
          Left = 296
          Top = 86
          Width = 121
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          TabOrder = 3
          WordWrap = False
          OnEnter = redtVlrDestinoEnter
          OnExit = redtVlrDestinoExit
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
      end
    end
    object pnlObs: TPanel
      Left = 437
      Top = 45
      Width = 317
      Height = 291
      Align = alClient
      BevelInner = bvRaised
      BevelOuter = bvNone
      TabOrder = 2
      object dbRtObs: TwwDBRichEdit
        Left = 1
        Top = 25
        Width = 315
        Height = 265
        TabStop = False
        Align = alClient
        AutoURLDetect = False
        PrintJobName = 'Delphi 5'
        TabOrder = 0
        EditorCaption = 'Edit Rich Text'
        EditorPosition.Left = 0
        EditorPosition.Top = 0
        EditorPosition.Width = 0
        EditorPosition.Height = 0
        MeasurementUnits = muInches
        PrintMargins.Top = 1
        PrintMargins.Bottom = 1
        PrintMargins.Left = 1
        PrintMargins.Right = 1
        RichEditVersion = 2
        Data = {
          750000007B5C727466315C616E73695C616E7369637067313235325C64656666
          305C6465666C616E67313034367B5C666F6E7474626C7B5C66305C666E696C20
          4D532053616E732053657269663B7D7D0D0A5C766965776B696E64345C756331
          5C706172645C625C66305C667331345C7061720D0A7D0D0A00}
      end
      object Panel1: TPanel
        Left = 1
        Top = 1
        Width = 315
        Height = 24
        Align = alTop
        Alignment = taLeftJustify
        BevelInner = bvLowered
        BevelOuter = bvNone
        Caption = '    Observação'
        Color = clNavy
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
    end
  end
  inherited Dock972: TDock97
    Width = 755
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Visible = False
      end
      object sbtnBuscaSaldos: TToolbarButton97
        Left = 240
        Top = 0
        Width = 84
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        Caption = '&Busca Saldo'
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
        WordWrap = True
        OnClick = sbtnBuscaSaldosClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 384
    Width = 755
    inherited tb97Fundo: TToolbar97
      Left = 583
      DockPos = 594
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 414
      DockPos = 425
    end
    inline fraMensTRC: TfraMensagem
      Width = 413
      Height = 38
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 2
      inherited pnlProgresso: TPanel
        Width = 413
        Height = 38
        inherited pnlProgressoMensagem: TPanel
          Width = 272
          Height = 36
          inherited lblProgressoMensagem: TfcLabel
            Width = 270
            Height = 34
          end
        end
        inherited pnlProgressoBarra: TPanel
          Left = 273
          Width = 139
          Height = 36
          inherited pgbProcesso: TProgressBar
            Width = 137
            Height = 34
          end
        end
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 496
    TargetsData = (
      1
      3
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        'TRealEdit'
        'Text'
        0)
      (
        'TwwDBRichEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 374
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update OPERRENFIX'
      'setI'
      '  IDINVESTIMENTO = :IDINVESTIMENTO,'
      '  IDTIPOOPERACAO = :IDTIPOOPERACAO,'
      '  IDCARTEIRAINVEST = :IDCARTEIRAINVEST,'
      '  IDCUSTODIANTE = :IDCUSTODIANTE,'
      '  IDFORCLI = :IDFORCLI,'
      '  MOECODIGO = :MOECODIGO,'
      '  IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR,'
      '  DATAOPERACAO = :DATAOPERACAO,'
      '  PUOPERACAO = :PUOPERACAO,'
      '  DATAEMISSAO = :DATAEMISSAO,'
      '  PUEMISSAO = :PUEMISSAO,'
      '  VLROPERACAO = :VLROPERACAO,'
      '  QTDEOPERACAO = :QTDEOPERACAO,'
      '  VENCOPERACAO = :VENCOPERACAO,'
      '  OBSERVACAO = :OBSERVACAO,'
      '  IDUSUARIO = :IDUSUARIO,'
      '  IDOPERRENFIXAPLIC = :IDOPERRENFIXAPLIC,'
      '  FLGOPERIMPLANT = :FLGOPERIMPLANT,'
      '  DATALEILAO = :DATALEILAO,'
      '  FLGNEGOCIACAO = :FLGNEGOCIACAO,'
      '  FLGCARTHIPO = :FLGCARTHIPO,'
      '  QTDCARTHIPO = :QTDCARTHIPO,'
      '  TXOPERACIONAL = :TXOPERACIONAL,'
      '  TXBOLSA = :TXBOLSA,'
      '  IDCLASSRISCORENFIX = :IDCLASSRISCORENFIX'
      '  FLGRECALC = :FLGRECALC,'
      '  BOLETA = :BOLETA,'
      '  IDTIPOINVEST = :IDTIPOINVEST,'
      '  PUMERCADO = :PUMERCADO,'
      '  DATALIQUIDACAO = :DATALIQUIDACAO'
      'where'
      '  IDOPERRENFIX = :OLD_IDOPERRENFIX')
    InsertSQL.Strings = (
      'insert into OPERRENFIX'
      
        '  (IDOPERRENFIX, IDINVESTIMENTO, IDTIPOOPERACAO, IDCARTEIRAINVES' +
        'T, '
      'IDCUSTODIANTE, '
      '   IDFORCLI, MOECODIGO, IDPLANPREVCTBPATR, DATAOPERACAO, '
      'PUOPERACAO, DATAEMISSAO, '
      '   PUEMISSAO, VLROPERACAO, QTDEOPERACAO, VENCOPERACAO, '
      'OBSERVACAO, IDUSUARIO, '
      '   IDOPERRENFIXAPLIC, FLGOPERIMPLANT, DATALEILAO, TXBOLSA, '
      'TXOPERACIONAL, '
      '   FLGNEGOCIACAO, FLGCARTHIPO, QTDCARTHIPO, PLNCODIGO, '
      'CODDOCUMENTO, IDCLASSRISCORENFIX, '
      '   FLGRECALC, BOLETA, IDTIPOINVEST, PUMERCADO, DATALIQUIDACAO)'
      'values'
      '  (:IDOPERRENFIX, :IDINVESTIMENTO, :IDTIPOOPERACAO, '
      ':IDCARTEIRAINVEST, '
      '   :IDCUSTODIANTE, :IDFORCLI, :MOECODIGO, :IDPLANPREVCTBPATR, '
      ':DATAOPERACAO, '
      '   :PUOPERACAO, :DATAEMISSAO, :PUEMISSAO, :VLROPERACAO, '
      ':QTDEOPERACAO, '
      '   :VENCOPERACAO, :OBSERVACAO, :IDUSUARIO, :IDOPERRENFIXAPLIC, '
      ':FLGOPERIMPLANT, '
      '   :DATALEILAO, :TXBOLSA, :TXOPERACIONAL, :FLGNEGOCIACAO, '
      ':FLGCARTHIPO, '
      
        '   :QTDCARTHIPO, :PLNCODIGO, :CODDOCUMENTO, :IDCLASSRISCORENFIX,' +
        ' '
      ':FLGRECALC, '
      '   :BOLETA, :IDTIPOINVEST, :PUMERCADO, :DATALIQUIDACAO)')
    DeleteSQL.Strings = (
      'delete from OPERRENFIX'
      'where'
      '  IDOPERRENFIX = :OLD_IDOPERRENFIX ')
    Left = 402
  end
  inherited MontaSelect: TMontaSelect
    Caption = ''
    Colunas.Strings = (
      'OPERRENFIX.DATAOPERACAO'
      'INVESTIMENTO.DESCINVESTIMENTO'
      'OPERRENFIX.VLROPERACAO'
      'OPERRENFIX.QTDEOPERACAO'
      'OPERRENFIX.BOLETA')
    TipodeDado.Strings = (
      'D'
      'C'
      'N'
      'N'
      'C')
    Descricao.Strings = (
      'Data Operação'
      'Investimento'
      'Valor'
      'Quantidade'
      'Boleta')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'OPERRENFIX'
      'INVESTIMENTO')
    CamposChave.Strings = (
      'OPERRENFIX.IDPLANPREVCTBPATR'
      'OPERRENFIX.IDINVESTIMENTO'
      'OPERRENFIX.DATAOPERACAO'
      'OPERRENFIX.IDOPERRENFIXAPLIC'
      'OPERRENFIX.BOLETA'
      'OPERRENFIX.VLROPERACAO'
      'OPERRENFIX.QTDEOPERACAO'
      'OPERRENFIX.PERCTRANSF'
      'OPERRENFIX.OBSERVACAO'
      'INVESTIMENTO.IDCLASSETIT')
    Filtro.Strings = (
      'OPERRENFIX.IDINVESTIMENTO = INVESTIMENTO.IDINVESTIMENTO'
      'OPERRENFIX.IDTIPOOPERACAO IN (-97,-98)')
    Mascaras.Strings = (
      ''
      ''
      '#,##0.00'
      '#,##0.000000'
      '')
    Larguras.Strings = (
      '25'
      '60'
      '25'
      '25'
      '20')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    Left = 349
  end
  inherited ImlPadrao: TImageList
    Left = 569
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 532
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      
        'SELECT IDOPERRENFIX, IDINVESTIMENTO, IDTIPOOPERACAO, IDCARTEIRAI' +
        'NVEST, IDCUSTODIANTE,'
      '       IDFORCLI, MOECODIGO,IDPLANPREVCTBPATR,'
      
        '       DATAOPERACAO, PUOPERACAO, DATAEMISSAO, PUEMISSAO, VLROPER' +
        'ACAO, QTDEOPERACAO, VENCOPERACAO,'
      '       OBSERVACAO, IDUSUARIO, IDOPERRENFIXAPLIC,FLGOPERIMPLANT,'
      
        '       DATALEILAO, TXBOLSA, TXOPERACIONAL, FLGNEGOCIACAO, FLGCAR' +
        'THIPO, QTDCARTHIPO,'
      
        '       PLNCODIGO, CODDOCUMENTO, IDCLASSRISCORENFIX,FLGRECALC,BOL' +
        'ETA,IDTIPOINVEST,PUMERCADO,'
      '       DATALIQUIDACAO'
      'FROM   OPERRENFIX'
      'WHERE  IDOPERRENFIX = :IDOPERRENFIX'
      ' '
      ' ')
    Left = 346
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIX'
        ParamType = ptUnknown
      end>
    object qryIDOPERRENFIX: TFloatField
      FieldName = 'IDOPERRENFIX'
      Origin = 'BASEDADOS.OPERRENFIX.IDOPERRENFIX'
    end
    object qryIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = 'BASEDADOS.OPERRENFIX.IDINVESTIMENTO'
    end
    object qryIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'BASEDADOS.OPERRENFIX.IDTIPOOPERACAO'
    end
    object qryIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'BASEDADOS.OPERRENFIX.IDCARTEIRAINVEST'
    end
    object qryIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
      Origin = 'BASEDADOS.OPERRENFIX.IDCUSTODIANTE'
    end
    object qryIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'BASEDADOS.OPERRENFIX.IDFORCLI'
    end
    object qryMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'BASEDADOS.OPERRENFIX.MOECODIGO'
    end
    object qryIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Origin = 'BASEDADOS.OPERRENFIX.IDPLANPREVCTBPATR'
    end
    object qryDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
      Origin = 'BASEDADOS.OPERRENFIX.DATAOPERACAO'
    end
    object qryPUOPERACAO: TFloatField
      FieldName = 'PUOPERACAO'
      Origin = 'BASEDADOS.OPERRENFIX.PUOPERACAO'
    end
    object qryDATAEMISSAO: TDateTimeField
      FieldName = 'DATAEMISSAO'
      Origin = 'BASEDADOS.OPERRENFIX.DATAEMISSAO'
    end
    object qryPUEMISSAO: TFloatField
      FieldName = 'PUEMISSAO'
      Origin = 'BASEDADOS.OPERRENFIX.PUEMISSAO'
    end
    object qryVLROPERACAO: TFloatField
      FieldName = 'VLROPERACAO'
      Origin = 'BASEDADOS.OPERRENFIX.VLROPERACAO'
    end
    object qryQTDEOPERACAO: TFloatField
      FieldName = 'QTDEOPERACAO'
      Origin = 'BASEDADOS.OPERRENFIX.QTDEOPERACAO'
    end
    object qryVENCOPERACAO: TDateTimeField
      FieldName = 'VENCOPERACAO'
      Origin = 'BASEDADOS.OPERRENFIX.VENCOPERACAO'
    end
    object qryOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Origin = 'BASEDADOS.OPERRENFIX.OBSERVACAO'
      Size = 200
    end
    object qryIDUSUARIO: TFloatField
      FieldName = 'IDUSUARIO'
      Origin = 'BASEDADOS.OPERRENFIX.IDUSUARIO'
    end
    object qryIDOPERRENFIXAPLIC: TFloatField
      FieldName = 'IDOPERRENFIXAPLIC'
      Origin = 'BASEDADOS.OPERRENFIX.IDOPERRENFIXAPLIC'
    end
    object qryFLGOPERIMPLANT: TStringField
      FieldName = 'FLGOPERIMPLANT'
      Origin = 'BASEDADOS.OPERRENFIX.FLGOPERIMPLANT'
      FixedChar = True
      Size = 1
    end
    object qryDATALEILAO: TDateTimeField
      FieldName = 'DATALEILAO'
      Origin = 'BASEDADOS.OPERRENFIX.DATALEILAO'
    end
    object qryTXBOLSA: TFloatField
      FieldName = 'TXBOLSA'
      Origin = 'BASEDADOS.OPERRENFIX.TXBOLSA'
    end
    object qryTXOPERACIONAL: TFloatField
      FieldName = 'TXOPERACIONAL'
      Origin = 'BASEDADOS.OPERRENFIX.TXOPERACIONAL'
    end
    object qryFLGNEGOCIACAO: TStringField
      FieldName = 'FLGNEGOCIACAO'
      Origin = 'BASEDADOS.OPERRENFIX.FLGNEGOCIACAO'
      FixedChar = True
      Size = 1
    end
    object qryFLGCARTHIPO: TStringField
      FieldName = 'FLGCARTHIPO'
      Origin = 'BASEDADOS.OPERRENFIX.FLGCARTHIPO'
      FixedChar = True
      Size = 1
    end
    object qryQTDCARTHIPO: TFloatField
      FieldName = 'QTDCARTHIPO'
      Origin = 'BASEDADOS.OPERRENFIX.QTDCARTHIPO'
    end
    object qryPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Origin = 'BASEDADOS.OPERRENFIX.PLNCODIGO'
    end
    object qryCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Origin = 'BASEDADOS.OPERRENFIX.CODDOCUMENTO'
    end
    object qryIDCLASSRISCORENFIX: TFloatField
      FieldName = 'IDCLASSRISCORENFIX'
      Origin = 'BASEDADOS.OPERRENFIX.IDCLASSRISCORENFIX'
    end
    object qryFLGRECALC: TStringField
      FieldName = 'FLGRECALC'
      Origin = 'BASEDADOS.OPERRENFIX.FLGRECALC'
      FixedChar = True
      Size = 1
    end
    object qryBOLETA: TStringField
      FieldName = 'BOLETA'
      Origin = 'BASEDADOS.OPERRENFIX.BOLETA'
      Size = 30
    end
    object qryIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'BASEDADOS.OPERRENFIX.IDTIPOINVEST'
    end
    object qryPUMERCADO: TFloatField
      FieldName = 'PUMERCADO'
      Origin = 'BASEDADOS.OPERRENFIX.PUMERCADO'
    end
    object qryDATALIQUIDACAO: TDateTimeField
      FieldName = 'DATALIQUIDACAO'
      Origin = 'BASEDADOS.OPERRENFIX.DATALIQUIDACAO'
    end
  end
  object qryPatroPlanPrevContabO: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PA.IDPLANPREVCTBPATR,'
      '   PA.IDPLANOPREV,'
      '   PA.IDPATRO,'
      '   (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLANPRVCONTABPATRO'
      'FROM'
      '   PESSOA PE,'
      '   PLANPREVCONTABPATRO PA,'
      '   PLANPREVCONTABIL PL'
      'WHERE'
      '   (PA.IDPATRO = PE.IDPESSOA(+))  AND'
      '   (PA.IDPLANOPREV = PL.IDPLANOPREV)'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 378
    Top = 133
    object qryPatroPlanPrevContabOPLANPRVCONTABPATRO: TStringField
      DisplayLabel = 'Plano / Patrocinadora'
      DisplayWidth = 113
      FieldName = 'PLANPRVCONTABPATRO'
      Origin = 'BASEDADOS.PLANPREVCONTABIL.NOME'
      Size = 113
    end
    object qryPatroPlanPrevContabOIDPLANPREVCTBPATR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANPREVCTBPATR'
      Origin = 'BASEDADOS.PLANPREVCONTABPATRO.IDPLANPREVCTBPATR'
      Visible = False
    end
    object qryPatroPlanPrevContabOIDPLANOPREV: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.PLANPREVCONTABPATRO.IDPLANOPREV'
      Visible = False
    end
    object qryPatroPlanPrevContabOIDPATRO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPATRO'
      Origin = 'BASEDADOS.PLANPREVCONTABPATRO.IDPATRO'
      Visible = False
    end
  end
  object qryInvestimento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IV.IDINVESTIMENTO, IV.DESCINVESTIMENTO, CL.IDCLASSETIT, C' +
        'L.FLGUSAQTD'
      'FROM   INVESTIMENTO IV, CLASSETITRENFIX CL'
      'WHERE IDTIPOINVEST = 1'
      'AND IV.IDCLASSETIT = CL.IDCLASSETIT'
      'ORDER BY DESCINVESTIMENTO'
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 378
    Top = 171
    object qryInvestimentoDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 60
      FieldName = 'DESCINVESTIMENTO'
      Origin = 'BASEDADOS.INVESTIMENTO.DESCINVESTIMENTO'
      Size = 60
    end
    object qryInvestimentoIDINVESTIMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINVESTIMENTO'
      Origin = 'BASEDADOS.INVESTIMENTO.IDINVESTIMENTO'
      Visible = False
    end
    object qryInvestimentoIDCLASSETIT: TFloatField
      FieldName = 'IDCLASSETIT'
      Origin = 'BASEDADOS.CLASSETITRENFIX.IDCLASSETIT'
    end
    object qryInvestimentoFLGUSAQTD: TStringField
      FieldName = 'FLGUSAQTD'
      Origin = 'BASEDADOS.CLASSETITRENFIX.FLGUSAQTD'
      FixedChar = True
      Size = 1
    end
  end
  object qryPatroPlanPrevContabD: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PA.IDPLANPREVCTBPATR,'
      '   PA.IDPLANOPREV,'
      '   PA.IDPATRO,'
      '   (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLANPRVCONTABPATRO'
      'FROM'
      '   PESSOA PE,'
      '   PLANPREVCONTABPATRO PA,'
      '   PLANPREVCONTABIL PL'
      'WHERE'
      
        '   (((:IDPLANPREVCTBPATR IS NOT NULL) AND (PA.IDPLANPREVCTBPATR ' +
        '<> :IDPLANPREVCTBPATR)) OR (:IDPLANPREVCTBPATR IS NULL)) AND'
      '   (PA.IDPATRO = PE.IDPESSOA(+))  AND'
      '   (PA.IDPLANOPREV = PL.IDPLANOPREV)'
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 378
    Top = 256
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end>
    object qryPatroPlanPrevContabDIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
    end
    object qryPatroPlanPrevContabDIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryPatroPlanPrevContabDIDPATRO: TFloatField
      FieldName = 'IDPATRO'
    end
    object qryPatroPlanPrevContabDPLANPRVCONTABPATRO: TStringField
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
  end
  object msBuscaSaldos: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Saldos'
    Colunas.Strings = (
      'HISTRENFIX.DATAHISTRENFIX'
      'HISTRENFIX.SALDOVLRHISTRENFI'
      'HISTRENFIX.SALDOQTDHISTRENFI'
      'INVESTIMENTO.DESCINVESTIMENTO'
      'OPERRENFIX.DATAOPERACAO'
      'OPERRENFIX.QTDEOPERACAO'
      'OPERRENFIX.VLROPERACAO')
    TipodeDado.Strings = (
      'D'
      'N'
      'N'
      'C'
      'D'
      'N'
      'N')
    Descricao.Strings = (
      'Data do Saldo'
      'Saldo'
      'Saldo de Qtd'
      'Investimento'
      'Data da Aplicação'
      'Quantidade Aplicada'
      'Valor Aplicado')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'HISTRENFIX'
      
        '(SELECT MAX(IDHISTRENFIX) AS IDHISTRENFIX FROM HISTRENFIX H, PAR' +
        'AMINVEST P WHERE (H.DATAHISTRENFIX >= (P.DATAULTFECHRF-30)) GROU' +
        'P BY DATAHISTRENFIX, IDINVESTIMENTO, IDOPERRENFIXAPLIC) IDS'
      'INVESTIMENTO'
      'OPERRENFIX')
    CamposChave.Strings = (
      'INVESTIMENTO.IDEMISSOR'
      'HISTRENFIX.IDINVESTIMENTO'
      'HISTRENFIX.IDCARTEIRAINVEST'
      'OPERRENFIX.IDFORCLI'
      'OPERRENFIX.IDCUSTODIANTE'
      'HISTRENFIX.DATAHISTRENFIX'
      'OPERRENFIX.VENCOPERACAO'
      'HISTRENFIX.SALDOVLRHISTRENFI'
      'HISTRENFIX.SALDOQTDHISTRENFI'
      'OPERRENFIX.DATAEMISSAO'
      'OPERRENFIX.PUEMISSAO'
      'HISTRENFIX.IDOPERRENFIXAPLIC'
      'OPERRENFIX.IDUSUARIO'
      'INVESTIMENTO.IDCLASSETIT'
      'OPERRENFIX.DATAOPERACAO'
      'INVESTIMENTO.CARENCIA'
      'NVL(OPERRENFIX.IDCLASSRISCORENFIX,0)'
      'OPERRENFIX.FLGCARTHIPO'
      'OPERRENFIX.QTDCARTHIPO'
      'OPERRENFIX.FLGNEGOCIACAO'
      'OPERRENFIX.IDPLANPREVCTBPATR'
      'OPERRENFIX.FLGOPERIMPLANT'
      'OPERRENFIX.MOECODIGO'
      'OPERRENFIX.DATALEILAO'
      'OPERRENFIX.PUOPERACAO'
      'OPERRENFIX.PUMERCADO'
      'HISTRENFIX.IDHISTRENFIX')
    Filtro.Strings = (
      'HISTRENFIX.IDHISTRENFIX = IDS.IDHISTRENFIX'
      'HISTRENFIX.SALDOVLRHISTRENFI > 0'
      'INVESTIMENTO.IDTIPOINVEST = 1'
      'INVESTIMENTO.IDINVESTIMENTO = HISTRENFIX.IDINVESTIMENTO'
      'HISTRENFIX.IDOPERRENFIXAPLIC = OPERRENFIX.IDOPERRENFIX'
      'HISTRENFIX.DATAHISTRENFIX = TO_DATE('#39'01/01/1899'#39','#39'DD/MM/YYYY'#39')')
    Mascaras.Strings = (
      'dd/mm/yyyy'
      '###,###,###,##0.00'
      '###,###,###,##0.00'
      ''
      'dd/mm/yyyy'
      '###,###,###,##0'
      '###,###,###,##0.00')
    Larguras.Strings = (
      '10'
      '18'
      '18'
      '40'
      '18'
      '18'
      '18')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    BeforeOpenCds = msBuscaSaldosBeforeOpenCds
    Left = 408
    Top = 2
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 458
    Top = 54
  end
  object qryTipoOperacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   IDTIPOOPERACAO,DESCTIPOOPERACAO,NATUREZAOPERACAO,FLGGERACONTA' +
        'B,FLGGERACAPCAR,'
      '   RECPAG,TIPCREDOR,FLGTRATAIR,SIGLATIPOOPER,CODTIPDOC'
      'FROM'
      '   TIPOOPERACAO'
      'WHERE'
      '   (IDTIPOINVEST = 1)   AND'
      '   (IDTIPOOPERACAO = :IDTIPOOPERACAO) '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 634
    Top = 53
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptResult
      end>
    object qryTipoOperacaoIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.IDTIPOOPERACAO'
    end
    object qryTipoOperacaoDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.DESCTIPOOPERACAO'
      Size = 60
    end
    object qryTipoOperacaoNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.NATUREZAOPERACAO'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGGERACONTAB: TFloatField
      FieldName = 'FLGGERACONTAB'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGGERACONTAB'
    end
    object qryTipoOperacaoFLGGERACAPCAR: TFloatField
      FieldName = 'FLGGERACAPCAR'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGGERACAPCAR'
    end
    object qryTipoOperacaoRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'BASEDADOS.TIPOOPERACAO.RECPAG'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoTIPCREDOR: TStringField
      FieldName = 'TIPCREDOR'
      Origin = 'BASEDADOS.TIPOOPERACAO.TIPCREDOR'
      Size = 2
    end
    object qryTipoOperacaoFLGTRATAIR: TStringField
      FieldName = 'FLGTRATAIR'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGTRATAIR'
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoSIGLATIPOOPER: TStringField
      FieldName = 'SIGLATIPOOPER'
      Origin = 'BASEDADOS.TIPOOPERACAO.SIGLATIPOOPER'
      Size = 4
    end
    object qryTipoOperacaoCODTIPDOC: TFloatField
      FieldName = 'CODTIPDOC'
      Origin = 'BASEDADOS.TIPOOPERACAO.CODTIPDOC'
    end
  end
  object qryBuscaPlanoDest: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    IDPLANPREVCTBPATR'
      'FROM'
      '    OPERRENFIX'
      'WHERE'
      '    (BOLETA = :BOLETA) AND'
      '    (IDTIPOOPERACAO = -98)')
    ValidateWithMask = True
    Left = 562
    Top = 54
    ParamData = <
      item
        DataType = ftString
        Name = 'BOLETA'
        ParamType = ptUnknown
      end>
    object qryBuscaPlanoDestIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Origin = 'BASEDADOS.OPERRENFIX.IDPLANPREVCTBPATR'
    end
  end
  object qryBuscaOpeExclusao_Old: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT O.DATAOPERACAO, O.IDOPERRENFIX, O.IDOPERRENFIXAPLIC, O.ID' +
        'INVESTIMENTO, O.IDTIPOOPERACAO, O.PLNCODIGO, O.CODDOCUMENTO, '
      '       T.DESCTIPOOPERACAO, P.DESCPLANOPREV'
      'FROM OPERRENFIX O, TIPOOPERACAO T,'
      
        '     (SELECT PA.IDPLANPREVCTBPATR, (PL.NOME ||'#39' - '#39'|| PE.NOME) A' +
        'S DESCPLANOPREV'
      
        '      FROM PESSOA PE, PLANPREVCONTABPATRO PA, PLANPREVCONTABIL P' +
        'L'
      '      WHERE (PA.IDPATRO = PE.IDPESSOA(+))'
      '        AND (PA.IDPLANOPREV = PL.IDPLANOPREV)) P'
      'WHERE O.BOLETA = :BOLETA'
      '  AND O.IDTIPOOPERACAO = T.IDTIPOOPERACAO'
      '  AND O.IDPLANPREVCTBPATR = P.IDPLANPREVCTBPATR'
      'ORDER BY IDTIPOOPERACAO'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 509
    Top = 53
    ParamData = <
      item
        DataType = ftString
        Name = 'BOLETA'
        ParamType = ptResult
      end>
    object qryBuscaOpeExclusao_OldDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
    end
    object qryBuscaOpeExclusao_OldIDOPERRENFIXAPLIC: TFloatField
      FieldName = 'IDOPERRENFIXAPLIC'
    end
    object qryBuscaOpeExclusao_OldIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
    end
    object qryBuscaOpeExclusao_OldIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
    end
    object qryBuscaOpeExclusao_OldDESCTIPOOPERACAO: TStringField
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object qryBuscaOpeExclusao_OldDESCPLANOPREV: TStringField
      FieldName = 'DESCPLANOPREV'
      Size = 113
    end
    object qryBuscaOpeExclusao_OldPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
    end
    object qryBuscaOpeExclusao_OldCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object qryBuscaOpeExclusao_OldIDOPERRENFIX: TFloatField
      FieldName = 'IDOPERRENFIX'
    end
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 259
    Top = 118
  end
end
