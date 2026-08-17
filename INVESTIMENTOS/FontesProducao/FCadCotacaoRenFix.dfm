inherited frmCadCotacaoRenFix: TfrmCadCotacaoRenFix
  Left = 337
  Top = 223
  HelpContext = 790251
  ClientHeight = 433
  ClientWidth = 491
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 491
    Height = 347
    inherited Bevel1: TBevel
      Width = 489
    end
    inherited pnlMestre: TPanel
      Width = 489
      Height = 66
      object Label11: TLabel
        Left = 18
        Top = 4
        Width = 73
        Height = 13
        Caption = 'Investimento'
      end
      object Label1: TLabel
        Left = 338
        Top = 5
        Width = 116
        Height = 13
        Caption = 'Data do Vencimento'
      end
      object dblInvestimento: TwwDBLookupCombo
        Left = 18
        Top = 19
        Width = 312
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCINVESTIMENTO'#9'30'#9'Investimento'#9'F'
          'VENCOPERACAO'#9'10'#9'Vencimento'#9'F')
        LookupTable = qryInvestimento
        LookupField = 'CHAVE'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        OnDropDown = dblInvestimentoDropDown
        OnCloseUp = dblInvestimentoCloseUp
        OnExit = dblInvestimentoExit
      end
      object dblDataVencto: TwwDBLookupCombo
        Left = 338
        Top = 19
        Width = 135
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'VENCOPERACAO'#9'18'#9'Vencimento'#9'F')
        LookupTable = qryVencOperacao
        LookupField = 'CHAVE'
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnCloseUp = dblDataVenctoCloseUp
        OnExit = dblDataVenctoExit
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 110
      Width = 489
      Height = 236
      Tabs.Strings = (
        'Items')
      inherited pgctrlDetalhe: TPageControl
        Width = 391
        Height = 177
        inherited tbsDet: TTabSheet
          inherited pnlControlesDet: TPanel [0]
            Width = 383
            Height = 149
            object Label2: TLabel
              Left = 48
              Top = 38
              Width = 28
              Height = 13
              Caption = 'Data'
            end
            object Label3: TLabel
              Left = 208
              Top = 38
              Width = 48
              Height = 13
              Caption = 'Cotação'
            end
            object dbdDataCotacao: TCMDateTimePicker
              Left = 47
              Top = 55
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATACOTACAO'
              DataSource = dsDet
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
              DisplayFormat = 'dd/mm/yyyy'
            end
            object dbrVlrCotacao: TDBRealEdit
              Left = 207
              Top = 55
              Width = 121
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,000000000')
              TabOrder = 1
              WordWrap = False
              IntDigits = 10
              DecDigits = 9
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLRCOTACAO'
              DataSource = dsDet
            end
          end
          inherited dbgrdDet: TwwDBGrid [1]
            Width = 383
            Height = 149
            Selected.Strings = (
              'DATACOTACAO'#9'22'#9'Data da Cotação'#9'F'
              'VLRCOTACAO'#9'26'#9'Valor da Cotação'#9'F'
              'VLRPUPAR'#9'20'#9'PU Par'#9'F')
            TitleAlignment = taLeftJustify
          end
        end
      end
      inherited Dock973: TDock97
        Width = 481
        inherited tb97BotoesDetalhe: TToolbar97
          inherited sbtnConsDet: TToolbarButton97
            Visible = True
          end
        end
      end
      inherited Dock974: TDock97
        Left = 395
        Height = 177
      end
    end
    inherited pnlTitulo: TPanel
      Width = 489
      inherited lbNomItem: TfcLabel
        Width = 246
        Caption = 'Cotações de Renda Fixa'
      end
    end
  end
  inherited Dock972: TDock97
    Width = 491
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 394
    Width = 491
    inherited tb97Fundo: TToolbar97
      Left = 319
      DockPos = 869
      inherited sep1: TToolbarSep97
        Visible = False
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 150
      DockPos = 700
      Visible = False
      inherited bbtnConfirmar: TBitBtn
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 280
  end
  inherited dsDet: TwwDataSource
    Left = 205
    Top = 177
  end
  inherited ds: TwwDataSource
    Left = 368
  end
  inherited upd: TUpdateSQL
    Left = 395
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'COTACAORENFIX.DATACOTACAO'
      'INVESTIMENTO.DESCINVESTIMENTO'
      
        'DECODE(COTACAORENFIX.DATAVENCTO, TO_DATE('#39'30/12/1899'#39','#39'DD/MM/YYY' +
        'Y'#39'), TO_DATE(NULL,'#39'DD/MM/YYYY'#39'),COTACAORENFIX.DATAVENCTO)'
      'COTACAORENFIX.VLRCOTACAO')
    TipodeDado.Strings = (
      'D'
      'C'
      'D'
      'N')
    Descricao.Strings = (
      'Data Cotação'
      'Investimento'
      'Data Vencimento'
      'Cotação')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'COTACAORENFIX'
      'INVESTIMENTO')
    CamposChave.Strings = (
      'COTACAORENFIX.DATACOTACAO'
      'COTACAORENFIX.IDINVESTIMENTO'
      
        'DECODE(COTACAORENFIX.DATAVENCTO, TO_DATE('#39'30/12/1899'#39','#39'DD/MM/YYY' +
        'Y'#39'), TO_DATE(NULL,'#39'DD/MM/YYYY'#39'),COTACAORENFIX.DATAVENCTO)')
    Filtro.Strings = (
      'COTACAORENFIX.IDINVESTIMENTO = INVESTIMENTO.IDINVESTIMENTO')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '12'
      '40'
      '12'
      '10')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1')
    UsaDistinct = True
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
    Top = 11
  end
  inherited ImlPadrao: TImageList
    Left = 257
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 246
  end
  inherited qry: TwwQuery
    Left = 424
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 252
    Top = 177
  end
  inherited qryDetalhe: TwwQuery
    SQL.Strings = (
      
        'SELECT DATACOTACAO, DATAVENCTO, VLRCOTACAO, VLRPUPAR, IDINVESTIM' +
        'ENTO'
      'FROM COTACAORENFIX'
      
        'WHERE ((:IDINVESTIMENTO IS NULL) OR (IDINVESTIMENTO = :IDINVESTI' +
        'MENTO))'
      
        '  AND ((:DATAVENCTO IS NULL) OR (DATAVENCTO = TO_DATE(:DATAVENCT' +
        'O,'#39'DD/MM/YYYY'#39')))'
      'ORDER BY DATAVENCTO, DATACOTACAO DESC'
      ' '
      ' '
      ' '
      ' ')
    Left = 169
    Top = 177
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
        Value = 2452
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAVENCTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATAVENCTO'
        ParamType = ptInput
      end>
    object qryDetalheDATACOTACAO: TDateTimeField
      DisplayLabel = 'Data da Cotação'
      DisplayWidth = 22
      FieldName = 'DATACOTACAO'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryDetalheVLRCOTACAO: TFloatField
      DisplayLabel = 'Valor da Cotação'
      DisplayWidth = 26
      FieldName = 'VLRCOTACAO'
      DisplayFormat = '###,###,###,##0.000000000'
    end
    object qryDetalheVLRPUPAR: TFloatField
      DisplayLabel = 'PU Par'
      DisplayWidth = 20
      FieldName = 'VLRPUPAR'
      DisplayFormat = '###,###,###,##0.000000000'
    end
    object qryDetalheDATAVENCTO: TDateTimeField
      DisplayLabel = 'Vencimento'
      DisplayWidth = 14
      FieldName = 'DATAVENCTO'
      Visible = False
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryDetalheIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
  end
  inherited updDetalhe: TUpdateSQL
    ModifySQL.Strings = (
      'update COTACAORENFIX'
      'set'
      '  VLRCOTACAO = :VLRCOTACAO,'
      '  VLRPUPAR = :VLRPUPAR'
      'where'
      '  DATACOTACAO = :OLD_DATACOTACAO and'
      '  DATAVENCTO = :OLD_DATAVENCTO and'
      '  IDINVESTIMENTO = :OLD_IDINVESTIMENTO')
    InsertSQL.Strings = (
      'insert into COTACAORENFIX'
      
        '  (DATACOTACAO, DATAVENCTO, VLRCOTACAO, VLRPUPAR, IDINVESTIMENTO' +
        ')'
      'values'
      '  (:DATACOTACAO, :DATAVENCTO, :VLRCOTACAO, :VLRPUPAR, '
      ':IDINVESTIMENTO)')
    DeleteSQL.Strings = (
      'delete from COTACAORENFIX'
      'where'
      '  DATACOTACAO = :OLD_DATACOTACAO and'
      '  DATAVENCTO = :OLD_DATAVENCTO and'
      '  IDINVESTIMENTO = :OLD_IDINVESTIMENTO')
    Left = 125
    Top = 177
  end
  object qryInvestimento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   (IV.IDINVESTIMENTO || OP.VENCOPERACAO) AS CHAVE,'
      '    IV.IDINVESTIMENTO, IV.DESCINVESTIMENTO, OP.VENCOPERACAO,'
      '    IV.IDCLASSETIT'
      'FROM'
      '   (SELECT IDINVESTIMENTO, VENCOPERACAO'
      '    FROM OPERRENFIX'
      '    WHERE (IDTIPOOPERACAO NOT IN (-17,-18,-19))) OP,'
      '   INVESTIMENTO IV, INVESTXCURVARENFIX IC, PARAMCALCMKT P'
      'WHERE (IV.IDCLASSETIT = P.IDCLASSETIT(+))'
      '  AND ((IC.FLGCOTRENFIX = '#39'Y'#39') OR (P.IDCLASSETIT IS NOT NULL))'
      '  AND (IV.IDINVESTIMENTO = OP.IDINVESTIMENTO(+))'
      '  AND (IV.IDINVESTIMENTO = IC.IDINVESTIMENTO(+))'
      
        'GROUP BY IV.IDINVESTIMENTO, IV.DESCINVESTIMENTO, OP.VENCOPERACAO' +
        ', IV.IDCLASSETIT, P.IDCLASSETIT'
      'ORDER BY DESCINVESTIMENTO'
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 289
    Top = 106
    object qryInvestimentoDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 30
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryInvestimentoVENCOPERACAO: TDateTimeField
      DisplayLabel = 'Vencimento'
      DisplayWidth = 10
      FieldName = 'VENCOPERACAO'
    end
    object qryInvestimentoIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
    object qryInvestimentoCHAVE: TStringField
      FieldName = 'CHAVE'
      Visible = False
      Size = 48
    end
    object qryInvestimentoIDCLASSETIT: TFloatField
      FieldName = 'IDCLASSETIT'
    end
  end
  object qryVencOperacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT OP.IDINVESTIMENTO, OP.VENCOPERACAO, (OP.IDINVESTIMENTO||T' +
        'O_CHAR(OP.VENCOPERACAO,'#39'DD/MM/YYYY'#39')) AS CHAVE'
      'FROM OPERRENFIX OP, INVESTIMENTO IV, PARAMCALCMKT PC'
      'WHERE OP.IDINVESTIMENTO = :IDINVESTIMENTO'
      '  AND OP.IDOPERRENFIX = OP.IDOPERRENFIXAPLIC'
      '  AND OP.IDINVESTIMENTO = IV.IDINVESTIMENTO'
      '  AND IV.IDCLASSETIT = PC.IDCLASSETIT(+)'
      'GROUP BY OP.IDINVESTIMENTO, OP.VENCOPERACAO'
      'ORDER BY OP.VENCOPERACAO'
      '')
    ValidateWithMask = True
    Left = 433
    Top = 106
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end>
    object qryVencOperacaoVENCOPERACAO: TDateTimeField
      DisplayLabel = 'Vencimento'
      DisplayWidth = 18
      FieldName = 'VENCOPERACAO'
      Origin = 'BASEDADOS.OPERRENFIX.VENCOPERACAO'
    end
    object qryVencOperacaoIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = 'BASEDADOS.OPERRENFIX.IDINVESTIMENTO'
      Visible = False
    end
    object qryVencOperacaoCHAVE: TStringField
      FieldName = 'CHAVE'
      Origin = 'BASEDADOS.OPERRENFIX.IDINVESTIMENTO'
      Size = 48
    end
  end
end
