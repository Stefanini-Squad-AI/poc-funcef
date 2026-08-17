inherited FrmCadClassifXTipoTitulo: TFrmCadClassifXTipoTitulo
  Left = 224
  Top = 107
  Caption = 'Classificação por Tipo de Titulo'
  ClientHeight = 408
  ClientWidth = 419
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 419
    Height = 322
    inherited pnlMestre: TPanel
      Width = 417
      Height = 89
      object Label1: TLabel
        Left = 24
        Top = 5
        Width = 124
        Height = 13
        Caption = 'Tipo de Investimento '
      end
      object Label2: TLabel
        Left = 24
        Top = 45
        Width = 141
        Height = 13
        Caption = 'Tabela de Classificação '
      end
      object DbLkcTipoInvestimento: TwwDBLookupCombo
        Left = 24
        Top = 20
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
        Left = 24
        Top = 60
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
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 90
      Width = 417
      Height = 231
      inherited pgctrlDetalhe: TPageControl
        Width = 319
        Height = 172
        inherited tbsDet: TTabSheet
          Caption = 'Registros '
          inherited dbgrdDet: TwwDBGrid
            Width = 311
            Height = 144
            Selected.Strings = (
              'DESCTIPOTITULO'#9'30'#9'Tipo de Título'#9'No'
              'DESCCLASSIFICACAO'#9'30'#9'Classificação'#9'No')
          end
          inherited pnlControlesDet: TPanel
            Width = 311
            Height = 144
            object Label3: TLabel
              Left = 8
              Top = 8
              Width = 86
              Height = 13
              Caption = 'Tipo de Título '
            end
            object Label4: TLabel
              Left = 8
              Top = 49
              Width = 80
              Height = 13
              Caption = 'Classificação '
            end
            object SB1: TSpeedButton
              Left = 275
              Top = 64
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
            object Label5: TLabel
              Left = 8
              Top = 89
              Width = 66
              Height = 13
              Caption = 'Data Inicial'
            end
            object DbLkcTipoTituloAcao: TwwDBLookupCombo
              Left = 8
              Top = 24
              Width = 289
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCTIPRENFIXA'#9'40'#9'Tipo de Titulo')
              DataField = 'CODTIPTITULO'
              DataSource = dsDet
              LookupTable = QryBuscaTipoTitulo
              LookupField = 'CODTIPTITULO'
              Options = [loColLines, loRowLines, loTitles]
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              ShowMatchText = True
            end
            object DbLkcTipoTituloRendaFixa: TwwDBLookupCombo
              Left = 160
              Top = 1
              Width = 289
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCTIPRENFIXA'#9'40'#9'Tipo de Titulo')
              DataField = 'CODTIPTITULO'
              DataSource = dsDet
              LookupTable = QryBuscaTipoTitulo
              LookupField = 'CODTIPTITULO'
              Options = [loColLines, loRowLines, loTitles]
              TabOrder = 1
              Visible = False
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              ShowMatchText = True
            end
            object DbLckClassificacao: TwwDBLookupCombo
              Left = 8
              Top = 65
              Width = 265
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
            object DBDateEdit1: TCMDateTimePicker
              Left = 8
              Top = 104
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
              TabOrder = 3
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 409
        inherited tb97BotoesDetalhe: TToolbar97
          inherited sbtnInsDet: TToolbarButton97
            Enabled = False
          end
        end
      end
      inherited Dock974: TDock97
        Left = 323
        Height = 172
      end
    end
  end
  inherited Dock972: TDock97
    Width = 419
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
    Top = 369
    Width = 419
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
    DataSet = QryDetalhe
    Left = 378
    Top = 167
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
      'TIV.DESCTIPOINVEST'
      'TCI.DESCTABCLASSINV')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Tipo de Investimento '
      'Tabela de Classificação ')
    Tabelas.Strings = (
      'CLASSINVXTIPTIT CTT '
      'TABCLASSIFINVEST TCI'
      'TIPOINVEST TIV')
    CamposChave.Strings = (
      'CTT.IDTIPOINVEST'
      'CTT.CODTABCLASSINV')
    Filtro.Strings = (
      'CTT.CODTABCLASSINV = TCI.CODTABCLASSINV'
      'CTT.IDTIPOINVEST = TIV.IDTIPOINVEST')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '42'
      '42')
    Left = 352
    Top = 4
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'select * from dual')
    Left = 289
    Top = 4
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
    Left = 91
    Top = 167
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
    Left = 125
    Top = 167
  end
  object QryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 159
    Top = 167
  end
  object QryBuscaTipoTitulo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '#9'* '
      ''
      'FROM '#9'TIPOTITULO TT, TIPOACAO TA, TIPOTITRENFIXA TR '
      ''
      'WHERE '#9'(TT.IDTIPOINVEST  = :IDTIPOINVEST)'#9#9'AND '
      #9'(TT.CODTIPTITULO = TA.CODTIPOACAO(+)) '#9'AND'
      #9'(TT.CODTIPTITULO = TR.CODTIPRENFIXA(+)) ')
    ValidateWithMask = True
    Left = 192
    Top = 167
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptUnknown
      end>
  end
  object QryBuscaClassificacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODTABCLASSINV, CODCLASSINVEST, DESCCLASSINVEST '
      ''
      'FROM CLASSIFINVEST'
      ''
      'WHERE (CODTABCLASSINV = :CODTABCLASSINV)'
      ''
      'ORDER BY DESCCLASSINVEST ')
    ValidateWithMask = True
    Left = 226
    Top = 167
    ParamData = <
      item
        DataType = ftString
        Name = 'CODTABCLASSINV'
        ParamType = ptUnknown
      end>
  end
  object QryDetalhe: TwwQuery
    DatabaseName = 'BaseDados'
    RequestLive = True
    SQL.Strings = (
      
        'SELECT '#9'CODTIPTITULO,  CODTABCLASSINV,  CODCLASSINVEST, IDTIPOIN' +
        'VEST,'
      #9'DTENQUADRA'
      ''
      'FROM '#9'CLASSINVXTIPTIT'
      ''
      'WHERE '#9'(CODTABCLASSINV = :CODTABCLASSINV) AND '
      #9'(IDTIPOINVEST        = :IDTIPOINVEST) '
      #9)
    ValidateWithMask = True
    Left = 346
    Top = 167
    ParamData = <
      item
        DataType = ftString
        Name = 'CODTABCLASSINV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptUnknown
      end>
    object QryDetalheDESCTIPOTITULO: TStringField
      DisplayLabel = 'Tipo de Título'
      DisplayWidth = 30
      FieldKind = fkLookup
      FieldName = 'DESCTIPOTITULO'
      LookupDataSet = QryBuscaTipoTitulo
      LookupKeyFields = 'CODTIPTITULO'
      LookupResultField = 'DESCTIPRENFIXA'
      KeyFields = 'CODTIPTITULO'
      Size = 40
      Lookup = True
    end
    object QryDetalheDESCCLASSIFICACAO: TStringField
      DisplayLabel = 'Classificação'
      DisplayWidth = 30
      FieldKind = fkLookup
      FieldName = 'DESCCLASSIFICACAO'
      LookupDataSet = QryBuscaClassificacao
      LookupKeyFields = 'CODCLASSINVEST'
      LookupResultField = 'DESCCLASSINVEST'
      KeyFields = 'CODCLASSINVEST'
      Size = 40
      Lookup = True
    end
    object QryDetalheCODTIPTITULO: TStringField
      DisplayWidth = 5
      FieldName = 'CODTIPTITULO'
      Visible = False
      Size = 5
    end
    object QryDetalheCODTABCLASSINV: TStringField
      DisplayWidth = 10
      FieldName = 'CODTABCLASSINV'
      Visible = False
      Size = 10
    end
    object QryDetalheCODCLASSINVEST: TStringField
      DisplayWidth = 8
      FieldName = 'CODCLASSINVEST'
      Visible = False
      Size = 8
    end
    object QryDetalheIDTIPOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOINVEST'
      Visible = False
    end
    object QryDetalheDTENQUADRA: TDateTimeField
      FieldName = 'DTENQUADRA'
      Origin = 'CLASSINVXTIPTIT.DTENQUADRA'
    end
  end
end
