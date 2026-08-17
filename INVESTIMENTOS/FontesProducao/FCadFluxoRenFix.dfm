inherited frmCadFluxoRenFix: TfrmCadFluxoRenFix
  Left = 544
  Top = 210
  HelpContext = 790253
  Caption = 'Operações de Fluxo de Renda Fixa'
  ClientHeight = 444
  ClientWidth = 380
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 380
    Height = 358
    inherited Bevel2: TBevel
      Width = 378
    end
    inherited pnlTitulo: TPanel
      Width = 378
      TabOrder = 2
      inherited lbNomItem: TfcLabel
        Width = 206
        Caption = 'Fluxo de Renda Fixa'
      end
    end
    object pnlCombos: TPanel
      Left = 1
      Top = 45
      Width = 378
      Height = 140
      Align = alTop
      TabOrder = 0
      object lblInvestimento: TLabel
        Left = 10
        Top = 52
        Width = 73
        Height = 13
        Caption = 'Investimento'
      end
      object lblOperacao: TLabel
        Left = 10
        Top = 8
        Width = 56
        Height = 13
        Caption = 'Operação'
      end
      object Label1: TLabel
        Left = 10
        Top = 93
        Width = 126
        Height = 13
        Caption = 'Plano / Patrocinadora'
      end
      object dblkInvestimento: TwwDBLookupCombo
        Left = 10
        Top = 66
        Width = 356
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCINVESTIMENTO'#9'60'#9'Investimento'#9'F')
        DataField = 'IDINVESTIMENTO'
        DataSource = ds
        LookupTable = qryInvestimento
        LookupField = 'IDINVESTIMENTO'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
      end
      object dblkTipoOperacao: TwwDBLookupCombo
        Left = 10
        Top = 22
        Width = 355
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCTIPOOPERACAO'#9'40'#9'Tipo de Operação'#9'F')
        DataField = 'IDTIPOOPERACAO'
        DataSource = ds
        LookupTable = qryTipoOperacao
        LookupField = 'IDTIPOOPERACAO'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
      end
      object dblPlanoPatro: TwwDBLookupCombo
        Left = 10
        Top = 107
        Width = 356
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'PLANPRVCONTABPATRO'#9'40'#9'Descrição'#9'F')
        DataField = 'IDPLANPREVCTBPATR'
        DataSource = ds
        LookupTable = qryPlanPrev
        LookupField = 'IDPLANPREVCTBPATR'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
      end
    end
    object pgcOper: TPageControl
      Left = 1
      Top = 185
      Width = 378
      Height = 172
      ActivePage = tbsOper
      Align = alClient
      MultiLine = True
      TabOrder = 1
      TabPosition = tpRight
      TabStop = False
      object tbsOper: TTabSheet
        Caption = 'Operação'
        object pnlDados: TPanel
          Left = 0
          Top = 0
          Width = 353
          Height = 162
          Align = alClient
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Enabled = False
          TabOrder = 0
          object lblDtVencimento: TLabel
            Left = 12
            Top = 22
            Width = 67
            Height = 13
            Caption = 'Vencimento'
          end
          object Label16: TLabel
            Left = 12
            Top = 84
            Width = 30
            Height = 13
            Caption = 'Valor'
          end
          object Label17: TLabel
            Left = 182
            Top = 84
            Width = 77
            Height = 13
            Caption = 'PU Operação'
          end
          object lblDtLiquidacao: TLabel
            Left = 182
            Top = 22
            Width = 63
            Height = 13
            Caption = 'Liquidação'
          end
          object dbdDataOperacao: TCMDateTimePicker
            Left = 12
            Top = 36
            Width = 156
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'DATAOPERACAO'
            DataSource = ds
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
            TabOrder = 0
          end
          object dbrVlrOperacao: TDBRealEdit
            Tag = -1
            Left = 12
            Top = 100
            Width = 156
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '90.000,00')
            TabOrder = 2
            WordWrap = False
            OnExit = dbrVlrOperacaoExit
            IntDigits = 15
            DecDigits = 2
            NumberFormat = fNumber
            Signal = False
            DataField = 'VLROPERACAO'
            DataSource = ds
          end
          object dbePuOperacao: TDBRealEdit
            Tag = -4
            Left = 182
            Top = 100
            Width = 156
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '9.000,000000')
            TabOrder = 3
            WordWrap = False
            IntDigits = 12
            DecDigits = 6
            NumberFormat = fNumber
            Signal = False
            DataField = 'PUOPERACAO'
            DataSource = ds
          end
          object dbdDtaLiquidacao: TCMDateTimePicker
            Left = 182
            Top = 36
            Width = 156
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            DataField = 'DATALIQUIDACAO'
            DataSource = ds
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
            TabOrder = 1
          end
        end
      end
      object tbsObs: TTabSheet
        Caption = 'Observações'
        ImageIndex = 1
        object pnlObs: TPanel
          Left = 0
          Top = 0
          Width = 353
          Height = 162
          Align = alClient
          BevelInner = bvRaised
          BevelOuter = bvLowered
          TabOrder = 0
          object pnlBoleta: TPanel
            Left = 2
            Top = 2
            Width = 349
            Height = 47
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 0
            object lblBoleta: TLabel
              Left = 7
              Top = 4
              Width = 37
              Height = 13
              Caption = 'Boleta'
            end
            object dbeBoleta: TwwDBEdit
              Left = 7
              Top = 18
              Width = 121
              Height = 21
              DataField = 'BOLETA'
              DataSource = ds
              TabOrder = 0
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
          end
          object pnlObsDet: TPanel
            Left = 2
            Top = 49
            Width = 349
            Height = 111
            Align = alClient
            BevelInner = bvRaised
            BevelOuter = bvLowered
            TabOrder = 1
            object dbRtObs: TDBMemo
              Left = 2
              Top = 2
              Width = 345
              Height = 107
              Align = alClient
              DataField = 'OBSERVACAO'
              DataSource = ds
              TabOrder = 0
            end
          end
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 380
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Enabled = False
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Visible = False
      end
      object sbtnBuscaFluxo: TToolbarButton97
        Left = 240
        Top = 0
        Width = 72
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        Caption = '&Busca Fluxo'
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
        OnClick = sbtnBuscaFluxoClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 405
    Width = 380
    inherited tb97Fundo: TToolbar97
      Left = 208
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 39
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 332
    TargetsData = (
      1
      3
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        'TwwDBRichEdit'
        'Text'
        0)
      (
        'TDBMemo'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 254
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update OPERRENFIX'
      'set'
      '  IDINVESTIMENTO = :IDINVESTIMENTO,'
      '  IDCUSTODIANTE = :IDCUSTODIANTE,'
      '  IDCARTEIRAINVEST = :IDCARTEIRAINVEST,'
      '  IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR,'
      '  IDFORCLI = :IDFORCLI,'
      '  MOECODIGO = :MOECODIGO,'
      '  DATAOPERACAO = :DATAOPERACAO,'
      '  PUOPERACAO = :PUOPERACAO,'
      '  PUEMISSAO = :PUEMISSAO,'
      '  VLROPERACAO = :VLROPERACAO,'
      '  QTDEOPERACAO = :QTDEOPERACAO,'
      '  DATALIQUIDACAO = :DATALIQUIDACAO,'
      '  OBSERVACAO = :OBSERVACAO,'
      '  IDTIPOOPERACAO = :IDTIPOOPERACAO,'
      '  DATAEMISSAO = :DATAEMISSAO,'
      '  IDUSUARIO = :IDUSUARIO,'
      '  IDOPERRENFIXAPLIC = :IDOPERRENFIXAPLIC,'
      '  FLGCARTHIPO=:FLGCARTHIPO,'
      '  QTDCARTHIPO=:QTDCARTHIPO,'
      '  BOLETA = :BOLETA'
      'where'
      '  IDOPERRENFIX = :OLD_IDOPERRENFIX'
      ' ')
    InsertSQL.Strings = (
      'insert into OPERRENFIX'
      
        '  (IDOPERRENFIX, IDINVESTIMENTO, IDCUSTODIANTE, IDCARTEIRAINVEST' +
        ','
      'IDPLANPREVCTBPATR,'
      '   IDFORCLI, MOECODIGO, DATAOPERACAO, PUOPERACAO, PUEMISSAO,'
      'VLROPERACAO,'
      '   QTDEOPERACAO, OBSERVACAO, IDTIPOOPERACAO,'
      'DATAEMISSAO,'
      '   IDUSUARIO, IDOPERRENFIXAPLIC,FLGCARTHIPO,QTDCARTHIPO,BOLETA,'
      '   DATALIQUIDACAO)'
      'values'
      
        '  (:IDOPERRENFIX, :IDINVESTIMENTO,:IDCUSTODIANTE, :IDCARTEIRAINV' +
        'EST,'
      ':IDPLANPREVCTBPATR,'
      
        '   :IDFORCLI, :MOECODIGO, :DATAOPERACAO, :PUOPERACAO, :PUEMISSAO' +
        ','
      ':VLROPERACAO,'
      '   :QTDEOPERACAO, :OBSERVACAO, :IDTIPOOPERACAO,'
      ':DATAEMISSAO,'
      
        '   :IDUSUARIO, :IDOPERRENFIXAPLIC,:FLGCARTHIPO,:QTDCARTHIPO, :BO' +
        'LETA,'
      '   :DATALIQUIDACAO)'
      ' ')
    DeleteSQL.Strings = (
      'delete from OPERRENFIX'
      'where'
      '  IDOPERRENFIX = :OLD_IDOPERRENFIX')
    Left = 282
  end
  inherited MontaSelect: TMontaSelect
    Caption = ''
    Colunas.Strings = (
      'HISTRENFIX.DATAHISTRENFIX'
      'VWPLANPREVCTBPATR.PLANPRVCONTABPATRO'
      'HISTRENFIX.VLRHISTRENFIX'
      'INVESTIMENTO.DESCINVESTIMENTO'
      'HISTRENFIX.HISTMOVRENFIX')
    TipodeDado.Strings = (
      'D'
      'C'
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Data'
      'Plano/Patrocinador'
      'Valor'
      'Investimento'
      'Operação')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'HISTRENFIX'
      'INVESTIMENTO'
      'OPERRENFIX'
      'OPERRENFIX OPERAPLIC'
      'VWPLANPREVCTBPATR')
    CamposChave.Strings = (
      'HISTRENFIX.IDHISTRENFIX'
      'HISTRENFIX.IDOPERRENFIX'
      'HISTRENFIX.DATAHISTRENFIX'
      'OPERRENFIX.PLNCODIGO'
      'OPERRENFIX.CODDOCUMENTO'
      'OPERRENFIX.DATALIQUIDACAO'
      'OPERRENFIX.PUOPERACAO'
      'OPERRENFIX.VLROPERACAO'
      'HISTRENFIX.IDTIPOOPERACAO'
      'HISTRENFIX.IDINVESTIMENTO'
      'HISTRENFIX.IDOPERRENFIXAPLIC'
      'OPERAPLIC.DATAOPERACAO'
      'INVESTIMENTO.IDCLASSETIT'
      'HISTRENFIX.IDPLANPREVCTBPATR')
    Filtro.Strings = (
      'HISTRENFIX.IDINVESTIMENTO = INVESTIMENTO.IDINVESTIMENTO'
      'HISTRENFIX.IDTIPOOPERACAO IN (-17,-18,-19)'
      'HISTRENFIX.IDOPERRENFIX = OPERRENFIX.IDOPERRENFIX'
      'HISTRENFIX.IDOPERRENFIXAPLIC = OPERAPLIC.IDOPERRENFIX'
      
        'HISTRENFIX.IDPLANPREVCTBPATR = VWPLANPREVCTBPATR.IDPLANPREVCTBPA' +
        'TR')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '18'
      '60'
      '10'
      '60'
      '60')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
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
    Left = 301
  end
  inherited ImlPadrao: TImageList
    Left = 332
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 332
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      
        '   IDOPERRENFIX,IDINVESTIMENTO,IDCUSTODIANTE,IDCARTEIRAINVEST,ID' +
        'PLANPREVCTBPATR,'
      '   IDFORCLI,MOECODIGO,DATAOPERACAO,PUOPERACAO,PUEMISSAO,'
      '   VLROPERACAO,QTDEOPERACAO,OBSERVACAO,IDTIPOOPERACAO,'
      
        '   DATAEMISSAO,IDUSUARIO,IDOPERRENFIXAPLIC,FLGCARTHIPO,QTDCARTHI' +
        'PO,BOLETA, DATALIQUIDACAO'
      'FROM'
      '   OPERRENFIX'
      'WHERE'
      '   IDOPERRENFIX = :IDOPERRENFIX'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 226
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIX'
        ParamType = ptUnknown
        Value = '5140'
      end>
    object qryIDOPERRENFIX: TFloatField
      FieldName = 'IDOPERRENFIX'
      Origin = 'BASEDADOS.OPERRENFIX.IDOPERRENFIX'
    end
    object qryIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = 'BASEDADOS.OPERRENFIX.IDINVESTIMENTO'
    end
    object qryIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
      Origin = 'BASEDADOS.OPERRENFIX.IDCUSTODIANTE'
    end
    object qryIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'BASEDADOS.OPERRENFIX.IDCARTEIRAINVEST'
    end
    object qryIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Origin = 'BASEDADOS.OPERRENFIX.IDPLANPREVCTBPATR'
    end
    object qryIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = 'BASEDADOS.OPERRENFIX.IDFORCLI'
    end
    object qryMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'BASEDADOS.OPERRENFIX.MOECODIGO'
    end
    object qryDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
      Origin = 'BASEDADOS.OPERRENFIX.DATAOPERACAO'
    end
    object qryPUOPERACAO: TFloatField
      FieldName = 'PUOPERACAO'
      Origin = 'BASEDADOS.OPERRENFIX.PUOPERACAO'
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
    object qryOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Origin = 'BASEDADOS.OPERRENFIX.OBSERVACAO'
      Size = 200
    end
    object qryIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'BASEDADOS.OPERRENFIX.IDTIPOOPERACAO'
    end
    object qryDATAEMISSAO: TDateTimeField
      FieldName = 'DATAEMISSAO'
      Origin = 'BASEDADOS.OPERRENFIX.DATAEMISSAO'
    end
    object qryIDUSUARIO: TFloatField
      FieldName = 'IDUSUARIO'
      Origin = 'BASEDADOS.OPERRENFIX.IDUSUARIO'
    end
    object qryIDOPERRENFIXAPLIC: TFloatField
      FieldName = 'IDOPERRENFIXAPLIC'
      Origin = 'BASEDADOS.OPERRENFIX.IDOPERRENFIXAPLIC'
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
    object qryBOLETA: TStringField
      FieldName = 'BOLETA'
      Origin = 'BASEDADOS.OPERRENFIX.BOLETA'
      Size = 30
    end
    object qryDATALIQUIDACAO: TDateTimeField
      FieldName = 'DATALIQUIDACAO'
      Origin = 'BASEDADOS.OPERRENFIX.DATALIQUIDACAO'
    end
  end
  object qryTipoOperacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   IDTIPOOPERACAO,DESCTIPOOPERACAO,NATUREZAOPERACAO,FLGGERACONTA' +
        'B,FLGGERACAPCAR,'
      '   RECPAG,TIPCREDOR,FLGTRATAIR,SIGLATIPOOPER,CODTIPDOC '
      'FROM'
      '   TIPOOPERACAO'
      'WHERE'
      '   IDTIPOOPERACAO = :IDTIPOOPERACAO'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 322
    Top = 109
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptUnknown
      end>
    object qryTipoOperacaoDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Tipo de Operação'
      DisplayWidth = 40
      FieldName = 'DESCTIPOOPERACAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.DESCTIPOOPERACAO'
      Size = 60
    end
    object qryTipoOperacaoSIGLATIPOOPER: TStringField
      DisplayLabel = 'Operação'
      DisplayWidth = 4
      FieldName = 'SIGLATIPOOPER'
      Origin = 'BASEDADOS.TIPOOPERACAO.SIGLATIPOOPER'
      Visible = False
      Size = 4
    end
    object qryTipoOperacaoIDTIPOOPERACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.IDTIPOOPERACAO'
      Visible = False
    end
    object qryTipoOperacaoNATUREZAOPERACAO: TStringField
      DisplayWidth = 1
      FieldName = 'NATUREZAOPERACAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.NATUREZAOPERACAO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoFLGGERACONTAB: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGGERACONTAB'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGGERACONTAB'
      Visible = False
    end
    object qryTipoOperacaoFLGGERACAPCAR: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGGERACAPCAR'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGGERACAPCAR'
      Visible = False
    end
    object qryTipoOperacaoRECPAG: TStringField
      DisplayWidth = 1
      FieldName = 'RECPAG'
      Origin = 'BASEDADOS.TIPOOPERACAO.RECPAG'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoTIPCREDOR: TStringField
      DisplayWidth = 2
      FieldName = 'TIPCREDOR'
      Origin = 'BASEDADOS.TIPOOPERACAO.TIPCREDOR'
      Visible = False
      Size = 2
    end
    object qryTipoOperacaoFLGTRATAIR: TStringField
      DisplayWidth = 1
      FieldName = 'FLGTRATAIR'
      Origin = 'BASEDADOS.TIPOOPERACAO.FLGTRATAIR'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipoOperacaoCODTIPDOC: TFloatField
      DisplayWidth = 10
      FieldName = 'CODTIPDOC'
      Origin = 'BASEDADOS.TIPOOPERACAO.CODTIPDOC'
      Visible = False
    end
  end
  object qryInvestimento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDINVESTIMENTO, DESCINVESTIMENTO, IDEMISSOR,IDCLASSETIT'
      'FROM'
      '   INVESTIMENTO'
      'WHERE'
      '   IDINVESTIMENTO = :IDINVESTIMENTO'
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 322
    Top = 153
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end>
    object qryInvestimentoDESCINVESTIMENTO: TStringField
      DisplayWidth = 60
      FieldName = 'DESCINVESTIMENTO'
      Visible = False
      Size = 60
    end
    object qryInvestimentoIDINVESTIMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
    object qryInvestimentoIDEMISSOR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDEMISSOR'
      Visible = False
    end
    object qryInvestimentoIDCLASSETIT: TFloatField
      FieldName = 'IDCLASSETIT'
      Origin = 'BASEDADOS.INVESTIMENTO.IDCLASSETIT'
      Visible = False
    end
  end
  object MSBuscaFluxo: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'FLUXOINVESTRENFIX.DATAFLUXOORIGINAL'
      'INVESTIMENTO.DESCINVESTIMENTO'
      'HISTRENFIX.SALDOQTDHISTRENFI '
      'ITEMRENFIX.DESCITEMRENFIX'
      'CURVASRENFIX.DESCCURVARENFIX'
      'FLUXOINVESTRENFIX.PERCFLUXO'
      'PLANPREV.PLANPRVCONTABPATRO'
      'FLUXOINVESTRENFIX.DATAFLUXO')
    TipodeDado.Strings = (
      'D'
      'C'
      'N'
      'C'
      'C'
      'N'
      'C'
      'D')
    Descricao.Strings = (
      'Data do Fluxo'
      'Investimento'
      'Saldo de Quantidade'
      'Item'
      'Perfil'
      'Percentual do Fluxo'
      'Plano / Patro'
      'Data Recebimento')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      
        '(SELECT * FROM OPERRENFIX WHERE (OPERRENFIX.IDOPERRENFIX = OPERR' +
        'ENFIX.IDOPERRENFIXAPLIC)) OPERRENFIX'
      'INVESTIMENTO'
      'ITEMRENFIX'
      'CURVASRENFIX'
      'HISTRENFIX'
      
        '(SELECT MAX(IDHISTRENFIX) AS IDHISTRENFIX FROM HISTRENFIX H, PAR' +
        'AMINVEST P WHERE (H.DATAHISTRENFIX >= (P.DATAULTFECHRF-30)) AND ' +
        '(H.IDTIPOOPERACAO = -2) GROUP BY DATAHISTRENFIX, IDINVESTIMENTO,' +
        ' IDOPERRENFIXAPLIC) IDS'
      'PARAMINVEST'
      
        '(SELECT * FROM FLUXOINVESTRENFIX , PARAMINVEST WHERE (FLUXOINVES' +
        'TRENFIX.DATAFLUXO BETWEEN (PARAMINVEST.DATAULTFECHRF - 30) AND (' +
        'PARAMINVEST.DATAULTFECHRF)) AND (FLUXOINVESTRENFIX.IDITEMRENFIX ' +
        'IN (28,29,30))) FLUXOINVESTRENFIX'
      
        '(SELECT PA.IDPLANPREVCTBPATR , (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PL' +
        'ANPRVCONTABPATRO FROM    PESSOA PE,    PLANPREVCONTABPATRO PA,  ' +
        '  PLANPREVCONTABIL PL  WHERE    (PA.IDPATRO = PE.IDPESSOA(+))  A' +
        'ND PA.IDPLANOPREV = PL.IDPLANOPREV)  PLANPREV')
    CamposChave.Strings = (
      'OPERRENFIX.IDOPERRENFIX'
      'FLUXOINVESTRENFIX.DATAFLUXOORIGINAL'
      'FLUXOINVESTRENFIX.IDCURVARENFIX'
      'FLUXOINVESTRENFIX.IDITEMRENFIX'
      'FLUXOINVESTRENFIX.IDINVESTIMENTO'
      'OPERRENFIX.DATAOPERACAO'
      'HISTRENFIX.IDPLANPREVCTBPATR'
      'OPERRENFIX.IDOPERRENFIXAPLIC'
      'FLUXOINVESTRENFIX.DATAFLUXO')
    Filtro.Strings = (
      'HISTRENFIX.IDHISTRENFIX = IDS.IDHISTRENFIX'
      'HISTRENFIX.SALDOQTDHISTRENFI > 0'
      'HISTRENFIX.IDTIPOOPERACAO = -2'
      'HISTRENFIX.DATAHISTRENFIX = FLUXOINVESTRENFIX.DATAFLUXO'
      'OPERRENFIX.DATAOPERACAO <= PARAMINVEST.DATAULTFECHRF'
      'OPERRENFIX.IDINVESTIMENTO = FLUXOINVESTRENFIX.IDINVESTIMENTO'
      'OPERRENFIX.IDINVESTIMENTO = INVESTIMENTO.IDINVESTIMENTO'
      
        '((OPERRENFIX.DATAOPERACAO < FLUXOINVESTRENFIX.DATAFLUXO) OR ((OP' +
        'ERRENFIX.DATAOPERACAO = FLUXOINVESTRENFIX.DATAFLUXO) AND (OPERRE' +
        'NFIX.IDTIPOOPERACAO IN (-97,-98) ) ))'
      'OPERRENFIX.IDINVESTIMENTO = HISTRENFIX.IDINVESTIMENTO'
      'OPERRENFIX.IDOPERRENFIX = HISTRENFIX.IDOPERRENFIXAPLIC'
      'FLUXOINVESTRENFIX.IDITEMRENFIX = ITEMRENFIX.IDITEMRENFIX'
      'FLUXOINVESTRENFIX.IDCURVARENFIX = CURVASRENFIX.IDCURVARENFIX'
      
        'OPERRENFIX.IDOPERRENFIXAPLIC||FLUXOINVESTRENFIX.IDITEMRENFIX NOT' +
        ' IN (SELECT OP.IDOPERRENFIXAPLIC||OC.IDITEMRENFIX FROM OPERRENFI' +
        'X OP, OPERRENFIXXCURVAS OC, ITEMRENFIX IT WHERE OP.DATAOPERACAO ' +
        '= FLUXOINVESTRENFIX.DATAFLUXO AND ((OP.IDTIPOOPERACAO = -17 AND ' +
        'IT.CODITEMRENFIX = '#39'PUPAGTOJUROS'#39') OR (OP.IDTIPOOPERACAO = -18 A' +
        'ND IT.CODITEMRENFIX = '#39'PUAMORTPRINC'#39') OR (OP.IDTIPOOPERACAO = -1' +
        '9 AND IT.CODITEMRENFIX = '#39'PUINCJUROS'#39')) AND OC.IDITEMRENFIX = IT' +
        '.IDITEMRENFIX AND OC.IDITEMRENFIX = FLUXOINVESTRENFIX.IDITEMRENF' +
        'IX AND OP.IDOPERRENFIX = OC.IDOPERRENFIX AND OP.IDINVESTIMENTO =' +
        ' FLUXOINVESTRENFIX.IDINVESTIMENTO AND OP.IDOPERRENFIXAPLIC = HIS' +
        'TRENFIX.IDOPERRENFIXAPLIC )'
      'HISTRENFIX.IDPLANPREVCTBPATR = PLANPREV.IDPLANPREVCTBPATR')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '18'
      '60'
      '10'
      '60'
      '60'
      '10'
      '60'
      '0')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = True
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      ''
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
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 333
    Top = 53
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 10
    Top = 401
  end
  object qryBuscaFluxoLiquidado: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDOPERRENFIX'
      'FROM'
      '   OPERRENFIX'
      'WHERE'
      '    DATAOPERACAO      = TO_DATE(:dDataOper,'#39'DD/MM/YYYY'#39') AND'
      '    IDOPERRENFIXAPLIC = :IDOPERRENFIX AND'
      '    IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR AND'
      '    IDTIPOOPERACAO    = :IDTIPOOPERACAO'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 42
    Top = 406
    ParamData = <
      item
        DataType = ftString
        Name = 'dDataOper'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOPERRENFIX'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANPREVCTBPATR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptUnknown
      end>
  end
  object qryPlanPrev: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM VWPLANPREVCTBPATR')
    ValidateWithMask = True
    Left = 322
    Top = 189
    object qryPlanPrevPLANPRVCONTABPATRO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldName = 'PLANPRVCONTABPATRO'
      Size = 113
    end
    object qryPlanPrevIDPLANPREVCTBPATR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANPREVCTBPATR'
      Visible = False
    end
    object qryPlanPrevIDPLANOPREV: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
    object qryPlanPrevIDPATRO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPATRO'
      Visible = False
    end
  end
end
