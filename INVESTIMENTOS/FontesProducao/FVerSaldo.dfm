inherited frmVerSaldo: TfrmVerSaldo
  Left = 150
  Top = 172
  Caption = 'Verificação de Saldo'
  ClientHeight = 461
  ClientWidth = 780
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 780
    Height = 422
    inherited bvlSepTit: TBevel
      Width = 778
    end
    object Splitter1: TSplitter [1]
      Left = 1
      Top = 316
      Width = 778
      Height = 3
      Cursor = crVSplit
      Align = alBottom
    end
    object Splitter3: TSplitter [2]
      Left = 1
      Top = 181
      Width = 778
      Height = 2
      Cursor = crVSplit
      Align = alTop
    end
    inherited pnlTitulo: TPanel
      Width = 778
      inherited lbNomDescricao: TfcLabel
        Width = 367
        Caption = 'Verificação de Saldos de Renda Fixa'
      end
    end
    object pnlTopo: TPanel
      Left = 1
      Top = 45
      Width = 778
      Height = 136
      Align = alTop
      Caption = 'pnlTopo'
      TabOrder = 1
      object Splitter5: TSplitter
        Left = 329
        Top = 1
        Width = 3
        Height = 134
        Cursor = crHSplit
      end
      object pnlHistorico: TPanel
        Left = 1
        Top = 1
        Width = 328
        Height = 134
        Align = alLeft
        TabOrder = 0
        object wwDBGrid1: TwwDBGrid
          Left = 1
          Top = 19
          Width = 326
          Height = 114
          Selected.Strings = (
            'DATAHISTRENFIX'#9'10'#9'Data'#9'F'
            'DESCINVESTIMENTO'#9'17'#9'Investimento'#9'F'
            'SALDOVLRHISTRENFIX'#9'10'#9'Saldo Valor'#9'F'
            'SALDOQTDHISTRENFIX'#9'10'#9'Saldo Quant.'#9'F'
            'VLRHISTRENFIX'#9'10'#9'Valor'#9'F'
            'QTDHISTRENFIX'#9'10'#9'Quantidade'#9'F'
            'IDOPERRENFIXAPLIC'#9'7'#9'Operação'#9'F'
            'IDHISTRENFIX'#9'9'#9'ID Histórico'#9'F'
            'IDCARTEIRAINVEST'#9'6'#9'Carteira'#9'F'
            'IDTIPOOPERACAO'#9'14'#9'Tipo de Operação'#9'F'
            'IDOPERRENFIX'#9'10'#9'ID Operação'#9'F'
            'CODDOCUMENTO'#9'15'#9'CODDOCUMENTO'#9'F'
            'PLNCODIGO'#9'10'#9'PLNCODIGO'#9'F'
            'IDPLANPREVCTBPATR'#9'19'#9'IDPLANPREVCTBPATR'#9'F'
            'IDMODULO'#9'10'#9'IDMODULO'#9'F'
            'IDEMPRESAPROP'#9'15'#9'IDEMPRESAPROP'#9'F'
            'TIPMOVHISRENFIX'#9'16'#9'TIPMOVHISRENFIX'#9'F'
            'NATURMOVHISTRENFIX'#9'20'#9'NATURMOVHISTRENFIX'#9'F'
            'IDINVESTIMENTO'#9'4'#9'Inv.'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsHistorico
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
        object Panel2: TPanel
          Left = 1
          Top = 1
          Width = 326
          Height = 18
          Align = alTop
          Caption = 'Histórico - HISTRENFIX'
          TabOrder = 1
        end
      end
      object pnlOperacoes: TPanel
        Left = 332
        Top = 1
        Width = 445
        Height = 134
        Align = alClient
        TabOrder = 1
        object wwDBGrid2: TwwDBGrid
          Left = 1
          Top = 19
          Width = 443
          Height = 114
          Selected.Strings = (
            'IDOPERRENFIX'#9'6'#9'Operação'
            'DATAOPERACAO'#9'10'#9'Data'
            'VLROPERACAO'#9'15'#9'Valor'
            'QTDEOPERACAO'#9'10'#9'Quantidade'
            'PUOPERACAO'#9'10'#9'PU Operação'
            'PUEMISSAO'#9'10'#9'PU Emissão'
            'DATAEMISSAO'#9'10'#9'Emissão'
            'VENCOPERACAO'#9'10'#9'Vencimento'
            'NATUREZAOPERACAO'#9'1'#9'Natureza'
            'IDINVESTIMENTO'#9'6'#9'ID Investimento'
            'IDCUSTODIANTE'#9'6'#9'ID Custodiante'
            'IDCARTEIRAINVEST'#9'6'#9'ID Carteira'
            'IDPLANPREVCTBPATR'#9'10'#9'IDPLANPREVCTBPATR'
            'IDFORCLI'#9'6'#9'ID ForCli'
            'MOECODIGO'#9'6'#9'ID Moeda'
            'IDTIPOOPERACAO'#9'6'#9'ID Tipo de Operação')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsOperacoes
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
        object Panel3: TPanel
          Left = 1
          Top = 1
          Width = 443
          Height = 18
          Align = alTop
          Caption = 'Operações - OPERRENFIX'
          TabOrder = 1
        end
      end
    end
    object pnlRodape: TPanel
      Left = 1
      Top = 319
      Width = 778
      Height = 102
      Align = alBottom
      Caption = 'pnlRodape'
      TabOrder = 2
      object Splitter6: TSplitter
        Left = 409
        Top = 1
        Width = 3
        Height = 100
        Cursor = crHSplit
      end
      object pnlItensCurvas: TPanel
        Left = 1
        Top = 1
        Width = 408
        Height = 100
        Align = alLeft
        Caption = 'pnlItensCurvas'
        TabOrder = 0
        object wwDBGrid4: TwwDBGrid
          Left = 1
          Top = 25
          Width = 406
          Height = 74
          Selected.Strings = (
            'DESCITEMRENFIX'#9'30'#9'Descrição'
            'SEQCALCULO'#9'6'#9'Seq. de Cálculo'
            'IDCURVARENFIX'#9'6'#9'ID Curva'
            'IDITEMRENFIX'#9'6'#9'ID Item'
            'IDREGRA'#9'6'#9'ID Regra'
            'FLGMOEDA'#9'1'#9'FLG Moeda'
            'FLGDESTACADO'#9'1'#9'FLG Destacado'
            'FLGCENTRALIZADO'#9'1'#9'FLG Centralizado'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsItensCurva
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
        object Panel5: TPanel
          Left = 1
          Top = 1
          Width = 406
          Height = 24
          Align = alTop
          Caption = 'Itens da Curva - CURVASXITEMRENFIX'
          TabOrder = 1
        end
      end
      object Panel6: TPanel
        Left = 412
        Top = 1
        Width = 365
        Height = 100
        Align = alClient
        TabOrder = 1
        object Label1: TLabel
          Left = 17
          Top = 12
          Width = 28
          Height = 13
          Caption = 'Data'
        end
        object Label4: TLabel
          Left = 16
          Top = 52
          Width = 73
          Height = 13
          Caption = 'Investimento'
        end
        object dtFinal: TCMDateTimePicker
          Left = 18
          Top = 28
          Width = 140
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
        end
        object dblInvestimento: TwwDBLookupCombo
          Left = 16
          Top = 68
          Width = 297
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCINVESTIMENTO'#9'60'#9'Investimento'#9'F')
          LookupTable = qryInvestimento
          LookupField = 'IDINVESTIMENTO'
          TabOrder = 1
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
        end
      end
    end
    object pnlMeio: TPanel
      Left = 1
      Top = 183
      Width = 778
      Height = 133
      Align = alClient
      Caption = 'pnlMeio'
      TabOrder = 3
      object Splitter4: TSplitter
        Left = 329
        Top = 1
        Width = 3
        Height = 131
        Cursor = crHSplit
      end
      object pnlHistItems: TPanel
        Left = 1
        Top = 1
        Width = 328
        Height = 131
        Align = alLeft
        TabOrder = 0
        object wwDBGrid5: TwwDBGrid
          Left = 1
          Top = 19
          Width = 326
          Height = 111
          Selected.Strings = (
            'PUITEM'#9'15'#9'PU do Item'
            'PUACUITEM'#9'15'#9'PU Acumulado'
            'IDREGRACALCULO'#9'10'#9'Regra de Cálculo'
            'IDHISTRENFIX'#9'6'#9'ID Histórico'#9'F'
            'IDCURVARENFIX'#9'6'#9'ID Curva'
            'IDITEMRENFIX'#9'6'#9'ID Item')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsItemsHistorico
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
          Left = 1
          Top = 1
          Width = 326
          Height = 18
          Align = alTop
          Caption = 'Itens de Histórico - HISTRENFIXXITENS'
          TabOrder = 1
        end
      end
      object pnlOperItens: TPanel
        Left = 332
        Top = 1
        Width = 445
        Height = 131
        Align = alClient
        Caption = 'pnlOperItens'
        TabOrder = 1
        object wwDBGrid3: TwwDBGrid
          Left = 1
          Top = 19
          Width = 443
          Height = 111
          Selected.Strings = (
            'DESCITEMRENFIX'#9'30'#9'Item'
            'VLRCURVA'#9'15'#9'Valor'
            'PERCCURVA'#9'6'#9'Percentual'
            'CODITEMRENFIX'#9'12'#9'Cod. no Regra'
            'SEQCALCULO'#9'4'#9'Seq. Cálculo'
            'MOESIGLA'#9'10'#9'Moeda'
            'IDOPERRENFIX'#9'6'#9'ID Operação'
            'IDITEMRENFIX'#9'6'#9'ID Item'
            'IDCURVARENFIX'#9'6'#9'ID Curva'
            'IDREGRA'#9'6'#9'ID Regra'
            'FLGMOEDA'#9'1'#9'FLG Moeda'
            'FLGDESTACADO'#9'1'#9'FLG Destacado'
            'FLGCENTRALIZADO'#9'1'#9'FLG Centralizado'
            'IDMOEDA'#9'6'#9'ID Moeda')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsItensOperacao
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
        object Panel4: TPanel
          Left = 1
          Top = 1
          Width = 443
          Height = 18
          Align = alTop
          Caption = 'Itens de Operação - OPERRENFIXXCURVAS'
          TabOrder = 1
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 422
    Width = 780
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 160
      DockPos = 160
      inherited ToolbarSep971: TToolbarSep97
        Left = 113
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 113
        Caption = '&Busca Saldos'
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 116
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 5
    Top = 5
  end
  object dsHistorico: TwwDataSource
    AutoEdit = False
    DataSet = DMRendaFixa.qryBuscaSaldosHist
    Left = 224
    Top = 72
  end
  object dsOperacoes: TwwDataSource
    AutoEdit = False
    DataSet = DMRendaFixa.qryBuscaSaldosOper
    Left = 328
    Top = 72
  end
  object dsItensOperacao: TwwDataSource
    AutoEdit = False
    DataSet = DMRendaFixa.qryBuscaSaldosItemsOper
    Left = 528
    Top = 64
  end
  object dsItensCurva: TwwDataSource
    AutoEdit = False
    DataSet = DMRendaFixa.qryBuscaSaldosItemsXCurvas
    Left = 633
    Top = 64
  end
  object dsItemsHistorico: TwwDataSource
    AutoEdit = False
    DataSet = DMRendaFixa.qryBuscaSaldosItems
    Left = 426
    Top = 72
  end
  object qryInvestimento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM INVESTIMENTO '
      'WHERE IDTIPOINVEST = 1'
      'ORDER BY DESCINVESTIMENTO'
      ''
      ' ')
    ValidateWithMask = True
    Left = 126
    Top = 80
    object qryInvestimentoDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 60
      FieldName = 'DESCINVESTIMENTO'
      Origin = 'INVESTIMENTO.DESCINVESTIMENTO'
      Size = 60
    end
    object qryInvestimentoIDINVESTIMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINVESTIMENTO'
      Origin = 'INVESTIMENTO.IDINVESTIMENTO'
      Visible = False
    end
    object qryInvestimentoIDMOEDACONTAB: TFloatField
      DisplayWidth = 10
      FieldName = 'IDMOEDACONTAB'
      Origin = 'INVESTIMENTO.IDMOEDACONTAB'
      Visible = False
    end
    object qryInvestimentoIDEMISSOR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDEMISSOR'
      Origin = 'INVESTIMENTO.IDEMISSOR'
      Visible = False
    end
    object qryInvestimentoIDTIPOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOINVEST'
      Origin = 'INVESTIMENTO.IDTIPOINVEST'
      Visible = False
    end
    object qryInvestimentoFLGATIVO: TStringField
      DisplayWidth = 1
      FieldName = 'FLGATIVO'
      Origin = 'INVESTIMENTO.FLGATIVO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryInvestimentoOBSINVESTIMENTO: TStringField
      DisplayWidth = 200
      FieldName = 'OBSINVESTIMENTO'
      Origin = 'INVESTIMENTO.OBSINVESTIMENTO'
      Visible = False
      Size = 200
    end
    object qryInvestimentoDESCCLASSINVEST: TStringField
      DisplayWidth = 60
      FieldName = 'DESCCLASSINVEST'
      Origin = 'INVESTIMENTO.DESCCLASSINVEST'
      Visible = False
      Size = 60
    end
    object qryInvestimentoCODISIN: TStringField
      DisplayWidth = 14
      FieldName = 'CODISIN'
      Origin = 'INVESTIMENTO.CODISIN'
      Visible = False
      Size = 14
    end
    object qryInvestimentoIDCLASSETIT: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCLASSETIT'
      Origin = 'INVESTIMENTO.IDCLASSETIT'
      Visible = False
    end
  end
  object updHistorico: TUpdateSQL
    ModifySQL.Strings = (
      'update OPERRENFIX'
      'set'
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
      '  IDOPERRENFIXAPLIC = :IDOPERRENFIXAPLIC'
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
      'OBSERVACAO,IDUSUARIO,  IDOPERRENFIXAPLIC)'
      'values'
      '  (:IDOPERRENFIX, :IDINVESTIMENTO, :IDTIPOOPERACAO, '
      ':IDCARTEIRAINVEST, '
      '   :IDCUSTODIANTE, :IDFORCLI, :MOECODIGO, :IDPLANPREVCTBPATR, '
      ':DATAOPERACAO, '
      '   :PUOPERACAO, :DATAEMISSAO, :PUEMISSAO, :VLROPERACAO, '
      ':QTDEOPERACAO, '
      '   :VENCOPERACAO, :OBSERVACAO,:IDUSUARIO, :IDOPERRENFIXAPLIC)')
    DeleteSQL.Strings = (
      'delete from OPERRENFIX'
      'where'
      '  IDOPERRENFIX = :OLD_IDOPERRENFIX')
    Left = 226
    Top = 126
  end
end
