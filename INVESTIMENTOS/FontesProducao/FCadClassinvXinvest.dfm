inherited FrmClassinvXinvest: TFrmClassinvXinvest
  Left = 193
  Top = 59
  Caption = 'Classificação do Investimento'
  ClientHeight = 443
  ClientWidth = 484
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 484
    Height = 357
    inherited pnlMestre: TPanel
      Width = 482
      Height = 124
      object Label1: TLabel
        Left = 14
        Top = 2
        Width = 124
        Height = 13
        Caption = 'Tipo de Investimento '
      end
      object Label2: TLabel
        Left = 14
        Top = 43
        Width = 141
        Height = 13
        Caption = 'Tabela de Classificação '
      end
      object Label6: TLabel
        Left = 14
        Top = 83
        Width = 45
        Height = 13
        Caption = 'Carteira'
      end
      object DbLkcTipoInvestimento: TwwDBLookupCombo
        Left = 14
        Top = 17
        Width = 361
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCTIPOINVEST'#9'40'#9'Tipo de Investimento ')
        LookupTable = QryBuscaTipoInvestimento
        LookupField = 'IDTIPOINVEST'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnChange = DbLkcTipoInvestimentoChange
      end
      object DbLkcTabelaClassif: TwwDBLookupCombo
        Left = 14
        Top = 58
        Width = 361
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCTABCLASSINV'#9'40'#9'Tabela de Classificação '
          'CODTABCLASSINV'#9'10'#9'Código da Tabela')
        LookupTable = QryBuscaTabelaClassif
        LookupField = 'CODTABCLASSINV'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnChange = DbLkcTabelaClassifChange
      end
      object dblcCarteira: TwwDBLookupCombo
        Left = 14
        Top = 98
        Width = 361
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCCARTINVEST'#9'40'#9'Carteira de Investimentos')
        LookupTable = qryCarteira
        LookupField = 'IDCARTEIRAINVEST'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnChange = dblcCarteiraChange
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 125
      Width = 482
      Height = 231
      inherited pgctrlDetalhe: TPageControl
        Width = 384
        Height = 172
        inherited tbsDet: TTabSheet
          Caption = 'Registros '
          inherited dbgrdDet: TwwDBGrid
            Width = 376
            Height = 144
            Selected.Strings = (
              'DESCINVESTIMENTO'#9'30'#9'Investimento'
              'DESCCLASSINVEST'#9'25'#9'Classificação')
          end
          inherited pnlControlesDet: TPanel
            Width = 376
            Height = 144
            object Label5: TLabel
              Left = 8
              Top = 94
              Width = 66
              Height = 13
              Caption = 'Data Inicial'
            end
            object Label7: TLabel
              Left = 8
              Top = 8
              Width = 73
              Height = 13
              Caption = 'Investimento'
            end
            object Label4: TLabel
              Left = 8
              Top = 52
              Width = 80
              Height = 13
              Caption = 'Classificação '
            end
            object SB1: TSpeedButton
              Left = 345
              Top = 67
              Width = 22
              Height = 23
              Hint = 'Busca Classificação '
              Glyph.Data = {
                4E010000424D4E01000000000000760000002800000012000000120000000100
                040000000000D800000000000000000000001000000010000000000000000000
                BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
                DDDDDD000000DDDDDDDDDDDDDDDDDD000000D000000000000DD00D000000D0FF
                FFFFFFFF0D000D000000D0FFFFFFF0000800DD000000D0FFFFFF0877808DDD00
                0000D0FFFFF0877E880DDD000000D0FFFFF07777870DDD000000D0FFFFF07E77
                870DDD000000D0FFFFF08EE7880DDD000000D0FFFFFF087780DDDD000000D0FF
                FFFFF0000DDDDD000000D0FFFFFFFFFF0DDDDD000000D0FFFFFFF0000DDDDD00
                0000D0FFFFFFF070DDDDDD000000D0FFFFFFF00DDDDDDD000000DD00000000DD
                DDDDDD000000DDDDDDDDDDDDDDDDDD000000}
              ParentShowHint = False
              ShowHint = True
              OnClick = SB1Click
            end
            object DBDateEdit1: TCMDateTimePicker
              Left = 8
              Top = 109
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DTENQUADRA'
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
            end
            object DbLkcInvestimento: TwwDBLookupCombo
              Left = 8
              Top = 24
              Width = 361
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCINVESTIMENTO'#9'60'#9'DESCINVESTIMENTO')
              DataField = 'IDINVESTIMENTO'
              DataSource = dsDet
              LookupTable = QryInvestimento
              LookupField = 'IDINVESTIMENTO'
              Options = [loColLines, loRowLines, loTitles]
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              ShowMatchText = True
            end
            object DbLckClassificacao: TwwDBLookupCombo
              Left = 8
              Top = 67
              Width = 335
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCCLASSINVEST'#9'40'#9'Classificação ')
              DataField = 'CODCLASSINVEST'
              DataSource = dsDet
              LookupTable = QryBuscaClassificacao
              LookupField = 'CODCLASSINVEST'
              Options = [loColLines, loRowLines, loTitles]
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              ShowMatchText = True
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 474
        inherited tb97BotoesDetalhe: TToolbar97
          inherited sbtnInsDet: TToolbarButton97
            Enabled = False
          end
        end
      end
      inherited Dock974: TDock97
        Left = 388
        Height = 172
      end
    end
  end
  inherited Dock972: TDock97
    Width = 484
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Enabled = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Enabled = False
      end
      inherited sbtnApagar: TToolbarButton97
        Enabled = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 404
    Width = 484
    inherited tb97Fundo: TToolbar97
      Left = 222
      DockPos = 222
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 53
      DockPos = 53
    end
  end
  inherited dsDet: TwwDataSource
    AutoEdit = True
    DataSet = QryDetalhe
    Left = 250
    Top = 199
  end
  inherited ds: TwwDataSource
    Left = 321
    Top = 4
  end
  inherited upd: TUpdateSQL
    Left = 258
    Top = 4
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TI.DESCTIPOINVEST'
      'TC.DESCTABCLASSINV'
      'IV.DESCINVESTIMENTO'
      'CI.DESCCARTINVEST'
      'CL.DESCCLASSINVEST')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Tipo de Investimento'
      'Tabela de Classificação'
      'Investimento'
      'Carteira'
      'Classificação')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CLASSINVxTIPTIT CT'
      'TIPOINVEST TI'
      'TABCLASSIFINVEST TC'
      'CLASSINVxINVEST CLI'
      'CLASSIFINVEST CL'
      'CARTEIRAINVEST CI'
      'INVESTIMENTO IV')
    CamposChave.Strings = (
      'CT.IDTIPOINVEST'
      'TC.CODTABCLASSINV'
      'IV.IDINVESTIMENTO'
      'CI.IDCARTEIRAINVEST')
    Filtro.Strings = (
      'TI.IDTIPOINVEST IN (1,2)'
      'CT.IDTIPOINVEST    = TI.IDTIPOINVEST'
      'TC.CODTABCLASSINV  = CLI.CODTABCLASSINV'
      'CLI.CODCLASSINVEST = CT.CODCLASSINVEST'
      'CL.CODTABCLASSINV  = CLI.CODTABCLASSINV'
      'CI.IDCARTEIRAINVEST= CLI.IDCARTEIRAINVEST'
      'IV.IDINVESTIMENTO  = CLI.IDINVESTIMENTO')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '30'
      '40'
      '40'
      '40'
      '20')
    Left = 352
    Top = 4
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '   TI.DESCTIPOINVEST AS C0,'
      '   TC.DESCTABCLASSINV AS C1,'
      '   (TA.DESCTIPOACAO||TR. DESCTIPRENFIXA) AS DESCTITULO,'
      '   CI.DESCCARTINVEST AS C3,'
      '   CL.DESCCLASSINVEST AS C4,'
      '   IV.DESCINVESTIMENTO AS C5,'
      '   CT.IDTIPOINVEST AS C6,'
      '   TC.CODTABCLASSINV AS C7,'
      '   TT.CODTIPTITULO AS C8,'
      '   CI.IDCARTEIRAINVEST AS C9'
      'FROM'
      '   CLASSINVxTIPTIT CT,'
      '   TIPOINVEST TI,'
      '   TABCLASSIFINVEST TC,'
      '   CLASSINVxINVEST CLI,'
      '   CLASSIFINVEST CL,'
      '   CARTEIRAINVEST CI,'
      '   INVESTIMENTO IV,'
      '   TIPOTITULO TT,'
      ' TIPOACAO TA,'
      ' TIPOTITRENFIXA TR'
      ''
      'WHERE'
      '   ( TI.IDTIPOINVEST    =:IDTIPOINVEST) AND'
      '   ( CT.IDTIPOINVEST    =:IDTIPOINVEST) AND'
      '   ( TC.CODTABCLASSINV  =:CODTABCLASSINV ) AND'
      '   ( CLI.CODCLASSINVEST = CT.CODCLASSINVEST ) AND'
      '   ( CL.CODTABCLASSINV  =:CODTABCLASSINV ) AND'
      '   ( CI.IDCARTEIRAINVEST=:IDCARTEIRAINVEST ) AND'
      '   ( IV.IDINVESTIMENTO  = CLI.IDINVESTIMENTO ) AND'
      '   ( TT.IDTIPOINVEST    = CT.IDTIPOINVEST ) AND'
      '   ( TT.CODTIPTITULO    = TA.CODTIPOACAO(+) ) AND'
      '   ( TT.CODTIPTITULO    = TR.CODTIPRENFIXA(+) )')
    Left = 289
    Top = 4
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODTABCLASSINV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODTABCLASSINV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end>
  end
  object QryBuscaTipoInvestimento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '#9'IDTIPOINVEST, DESCTIPOINVEST'
      ''
      'FROM '#9'TIPOINVEST'
      ''
      'WHERE IDTIPOINVEST IN (1,2) '
      ''
      'ORDER BY DESCTIPOINVEST')
    ValidateWithMask = True
    Left = 123
    Top = 95
  end
  object QryBuscaTabelaClassif: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '#9'CODTABCLASSINV, DESCTABCLASSINV'
      ''
      'FROM '#9'TABCLASSIFINVEST'
      ''
      'ORDER BY DESCTABCLASSINV')
    ValidateWithMask = True
    Left = 229
    Top = 95
  end
  object QryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 295
    Top = 95
  end
  object QryBuscaClassificacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODTABCLASSINV, CODCLASSINVEST, DESCCLASSINVEST '
      ''
      'FROM CLASSIFINVEST'
      ''
      'ORDER BY DESCCLASSINVEST ')
    ValidateWithMask = True
    Left = 122
    Top = 199
  end
  object QryDetalhe: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '       CODTABCLASSINV,'
      '       CODCLASSINVEST,'
      '       IDCARTEIRAINVEST,'
      '       IDINVESTIMENTO,'
      '       DTENQUADRA'
      'FROM'
      '      CLASSINVXINVEST'
      'WHERE'
      '      IDCARTEIRAINVEST =:IDCARTEIRAINVEST AND'
      '      IDINVESTIMENTO   =:IDINVESTIMENTO   AND'
      '      CODTABCLASSINV   =:CODTABCLASSINV   AND   '
      '      CODCLASSINVEST   =:CODCLASSINVEST'
      '')
    UpdateObject = updDetalhe
    ValidateWithMask = True
    Left = 210
    Top = 199
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCARTEIRAINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODTABCLASSINV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'CODCLASSINVEST'
        ParamType = ptUnknown
      end>
    object QryDetalheDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 30
      FieldKind = fkLookup
      FieldName = 'DESCINVESTIMENTO'
      LookupDataSet = QryInvestimento
      LookupKeyFields = 'IDINVESTIMENTO'
      LookupResultField = 'DESCINVESTIMENTO'
      KeyFields = 'IDINVESTIMENTO'
      Size = 60
      Lookup = True
    end
    object QryDetalheDESCCLASSINVEST: TStringField
      DisplayLabel = 'Classificação'
      DisplayWidth = 25
      FieldKind = fkLookup
      FieldName = 'DESCCLASSINVEST'
      LookupDataSet = QryBuscaClassificacao
      LookupKeyFields = 'CODCLASSINVEST'
      LookupResultField = 'DESCCLASSINVEST'
      KeyFields = 'CODCLASSINVEST'
      Size = 60
      Lookup = True
    end
    object QryDetalheCODTABCLASSINV: TStringField
      FieldName = 'CODTABCLASSINV'
      Origin = 'CLASSINVXINVEST.CODTABCLASSINV'
      Visible = False
      Size = 10
    end
    object QryDetalheCODCLASSINVEST: TStringField
      FieldName = 'CODCLASSINVEST'
      Origin = 'CLASSINVXINVEST.CODCLASSINVEST'
      Visible = False
      Size = 8
    end
    object QryDetalheIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'CLASSINVXINVEST.IDCARTEIRAINVEST'
      Visible = False
    end
    object QryDetalheIDINVESTIMENTO: TFloatField
      FieldName = 'IDINVESTIMENTO'
      Origin = 'CLASSINVXINVEST.IDINVESTIMENTO'
      Visible = False
    end
    object QryDetalheDTENQUADRA: TDateTimeField
      FieldName = 'DTENQUADRA'
      Origin = 'CLASSINVXINVEST.DTENQUADRA'
      Visible = False
    end
  end
  object qryCarteira: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '        IDCARTEIRAiNVEST,'
      '        DESCCARTINVEST'
      'FROM'
      '        CARTEIRAINVEST'
      'ORDER BY DESCCARTINVEST')
    ValidateWithMask = True
    Left = 211
    Top = 247
  end
  object QryInvestimento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      DESCINVESTIMENTO,IDINVESTIMENTO'
      'FROM'
      '      INVESTIMENTO'
      'ORDER BY DESCINVESTIMENTO')
    ValidateWithMask = True
    Left = 123
    Top = 247
  end
  object updDetalhe: TUpdateSQL
    ModifySQL.Strings = (
      'update CLASSINVXINVEST'
      'set'
      '  CODTABCLASSINV = :CODTABCLASSINV,'
      '  CODCLASSINVEST = :CODCLASSINVEST,'
      '  IDCARTEIRAINVEST = :IDCARTEIRAINVEST,'
      '  IDINVESTIMENTO = :IDINVESTIMENTO,'
      '  DTENQUADRA = :DTENQUADRA'
      'where'
      '  CODTABCLASSINV = :OLD_CODTABCLASSINV and'
      '  CODCLASSINVEST = :OLD_CODCLASSINVEST and'
      '  IDCARTEIRAINVEST = :OLD_IDCARTEIRAINVEST and'
      '  IDINVESTIMENTO = :OLD_IDINVESTIMENTO')
    InsertSQL.Strings = (
      'insert into CLASSINVXINVEST'
      '  (CODTABCLASSINV, CODCLASSINVEST, IDCARTEIRAINVEST, '
      'IDINVESTIMENTO, DTENQUADRA)'
      'values'
      '  (:CODTABCLASSINV, :CODCLASSINVEST, :IDCARTEIRAINVEST, '
      ':IDINVESTIMENTO, '
      '   :DTENQUADRA)')
    DeleteSQL.Strings = (
      'delete from CLASSINVXINVEST'
      'where'
      '  CODTABCLASSINV = :OLD_CODTABCLASSINV and'
      '  CODCLASSINVEST = :OLD_CODCLASSINVEST and'
      '  IDCARTEIRAINVEST = :OLD_IDCARTEIRAINVEST and'
      '  IDINVESTIMENTO = :OLD_IDINVESTIMENTO')
    Left = 298
    Top = 198
  end
end
