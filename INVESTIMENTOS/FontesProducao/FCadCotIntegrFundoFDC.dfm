inherited frmCadCotIntegrFundoFDC: TfrmCadCotIntegrFundoFDC
  Left = 376
  Top = 47
  HelpContext = 790234
  Caption = ''
  ClientHeight = 423
  ClientWidth = 359
  PixelsPerInch = 96
  TextHeight = 13
  object Investimento: TLabel [0]
    Left = 23
    Top = 111
    Width = 130
    Height = 13
    Caption = 'Fundo de Investimento'
  end
  inherited pnlFundo: TPanel
    Width = 359
    Height = 337
    inherited Bevel1: TBevel
      Width = 357
    end
    inherited pnlMestre: TPanel
      Width = 357
      Height = 90
      BevelInner = bvRaised
      BevelOuter = bvLowered
      object Label1: TLabel
        Left = 18
        Top = 7
        Width = 130
        Height = 13
        Caption = 'Fundo de Investimento'
      end
      object Label4: TLabel
        Left = 18
        Top = 49
        Width = 74
        Height = 13
        Caption = 'Tipo de Cota'
      end
      object dblInvest: TwwDBLookupCombo
        Left = 18
        Top = 22
        Width = 317
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCFUNDOINVEST'#9'60'#9'Descrição'#9'F')
        LookupTable = QryFundoInvest
        LookupField = 'IDFUNDOINVEST'
        Options = [loRowLines, loTitles]
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnCloseUp = dblInvestCloseUp
        OnExit = dblInvestExit
      end
      object dblTipoCota: TwwDBLookupCombo
        Left = 18
        Top = 64
        Width = 254
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCTIPOCOTA'#9'20'#9'Descrição'#9'F')
        LookupTable = QryTipoCota
        LookupField = 'IDTIPOCOTA'
        Options = [loRowLines, loTitles]
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnCloseUp = dblTipoCotaCloseUp
        OnExit = dblTipoCotaExit
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 135
      Width = 357
      Height = 201
      Tabs.Strings = (
        'Cotas')
      inherited pgctrlDetalhe: TPageControl
        Width = 259
        Height = 142
        inherited tbsDet: TTabSheet
          inherited dbgrdDet: TwwDBGrid
            Width = 251
            Height = 114
            Selected.Strings = (
              'DATACOTA'#9'16'#9'Data'
              'VLRCOTA'#9'26'#9'Valor da Cota'#9'F')
            ParentFont = False
            TitleAlignment = taCenter
            TitleFont.Color = clMaroon
            OnDblClick = dbgrdDetDblClick
          end
          inherited pnlControlesDet: TPanel
            Width = 251
            Height = 114
            BevelInner = bvRaised
            BevelOuter = bvLowered
            object Label2: TLabel
              Left = 7
              Top = 6
              Width = 28
              Height = 13
              Caption = 'Data'
            end
            object Label3: TLabel
              Left = 7
              Top = 50
              Width = 78
              Height = 13
              Caption = 'Valor da Cota'
            end
            object dbdDta: TCMDateTimePicker
              Left = 7
              Top = 20
              Width = 122
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATACOTA'
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
            object DbEdValorCota: TDBRealEdit
              Left = 7
              Top = 65
              Width = 193
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00000000')
              TabOrder = 1
              WordWrap = False
              IntDigits = 9
              DecDigits = 8
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLRCOTA'
              DataSource = dsDet
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 349
      end
      inherited Dock974: TDock97
        Left = 263
        Height = 142
      end
    end
    inherited pnlTitulo: TPanel
      Width = 357
      inherited lbNomItem: TfcLabel
        Width = 194
        Caption = 'Cotas a Integralizar'
      end
    end
  end
  inherited Dock972: TDock97
    Width = 359
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
      object sbtnImprimir: TToolbarButton97
        Left = 240
        Top = 0
        Width = 67
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        Caption = '&Imprimir'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          0003377777777777777308888888888888807F33333333333337088888888888
          88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
          8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
          8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
        ImageIndex = 3
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        Spacing = 0
        OnClick = sbtnImprimirClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 384
    Width = 359
    inherited tb97Fundo: TToolbar97
      Left = 187
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 18
      Visible = False
      inherited ToolbarSep971: TToolbarSep97
        Visible = False
      end
      inherited bbtnConfirmar: TBitBtn
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 320
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDetalhe
    Left = 200
    Top = 177
  end
  inherited ds: TwwDataSource
    Left = 242
    Top = 58
  end
  inherited upd: TUpdateSQL
    Left = 258
    Top = 58
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'FUNDOINVEST.DESCFUNDOINVEST'
      'COTAINTEGRFUNDO.DATACOTA'
      'COTAINTEGRFUNDO.VLRCOTA'
      'TIPOCOTA.DESCTIPOCOTA')
    TipodeDado.Strings = (
      'C'
      'D'
      'N'
      'C')
    Descricao.Strings = (
      'Fundo de Investimento'
      'Data da Cota'
      'Valor da Cota'
      'Tipo de Cota')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'COTAINTEGRFUNDO'
      'FUNDOINVEST'
      'TIPOFUNDOINVEST'
      'TIPOCOTA')
    CamposChave.Strings = (
      'COTAINTEGRFUNDO.IDFUNDOINVEST'
      'COTAINTEGRFUNDO.DATACOTA'
      'TIPOCOTA.IDTIPOCOTA')
    Filtro.Strings = (
      'FUNDOINVEST.IDFUNDOINVEST = COTAINTEGRFUNDO.IDFUNDOINVEST'
      'TIPOCOTA.IDTIPOCOTA       = COTAINTEGRFUNDO.IDTIPOCOTA '
      
        'TIPOFUNDOINVEST.IDTIPOFUNDOINVEST = FUNDOINVEST.IDTIPOFUNDOINVES' +
        'T')
    Mascaras.Strings = (
      ''
      ''
      '###,###,###0.000000000'
      '')
    Larguras.Strings = (
      '60'
      '18'
      '18'
      '20')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1')
    Left = 147
  end
  inherited ImlPadrao: TImageList
    Left = 209
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 92
  end
  inherited qry: TwwQuery
    Left = 273
    Top = 58
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 73
    Top = 177
  end
  inherited qryDetalhe: TwwQuery
    SQL.Strings = (
      
        'SELECT CF.IDFUNDOINVEST, CF.DATACOTA, CF.VLRCOTA, CF.IDTIPOCOTA,' +
        ' CF.IDCOTAINTEGRFUNDO'
      'FROM COTAINTEGRFUNDO CF'
      'WHERE   (IDFUNDOINVEST = :IDFUNDOINVEST) AND'
      
        '      (((:DATACOTA IS NOT NULL)   AND (DATACOTA   = TO_DATE(:DAT' +
        'ACOTA,'#39'DD/MM/YYYY'#39'))) OR'
      '        (:DATACOTA IS NULL))      AND'
      '      (((:IDTIPOCOTA IS NOT NULL) AND'
      '         (IDTIPOCOTA        = :IDTIPOCOTA)) OR'
      '        (:IDTIPOCOTA IS NULL))'
      'ORDER BY IDFUNDOINVEST, DATACOTA DESC'
      ' '
      ' '
      ' '
      ' ')
    Left = 111
    Top = 177
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATACOTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATACOTA'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DATACOTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptResult
      end>
    object qryDetalheDATACOTA: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 16
      FieldName = 'DATACOTA'
      DisplayFormat = 'dd/mm/yyyy'
    end
    object qryDetalheVLRCOTA: TFloatField
      DisplayLabel = 'Valor da Cota'
      DisplayWidth = 26
      FieldName = 'VLRCOTA'
      DisplayFormat = '###,###,##0.00000000'
    end
    object qryDetalheIDFUNDOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFUNDOINVEST'
      Visible = False
    end
    object qryDetalheIDTIPOCOTA: TFloatField
      FieldName = 'IDTIPOCOTA'
      Visible = False
    end
    object qryDetalheIDCOTAINTEGRFUNDO: TFloatField
      FieldName = 'IDCOTAINTEGRFUNDO'
    end
  end
  inherited updDetalhe: TUpdateSQL
    ModifySQL.Strings = (
      'update COTAINTEGRFUNDO'
      'set'
      '  VLRCOTA = :VLRCOTA,'
      '  IDTIPOCOTA = :IDTIPOCOTA'
      'where'
      '  IDFUNDOINVEST = :OLD_IDFUNDOINVEST and'
      '  DATACOTA = :OLD_DATACOTA and'
      '  IDTIPOCOTA = :OLD_IDTIPOCOTA')
    InsertSQL.Strings = (
      'insert into COTAINTEGRFUNDO'
      
        '  (IDFUNDOINVEST, DATACOTA, VLRCOTA, IDTIPOCOTA, IDCOTAINTEGRFUN' +
        'DO)'
      'values'
      
        '  (:IDFUNDOINVEST, :DATACOTA, :VLRCOTA, :IDTIPOCOTA, :IDCOTAINTE' +
        'GRFUNDO)')
    DeleteSQL.Strings = (
      'delete from COTAINTEGRFUNDO'
      'where'
      '  IDFUNDOINVEST = :OLD_IDFUNDOINVEST and'
      '  DATACOTA = :OLD_DATACOTA and'
      '  IDTIPOCOTA = :OLD_IDTIPOCOTA')
    Left = 159
    Top = 177
  end
  object QryFundoInvest: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  FUN.IDFUNDOINVEST     , FUN.DESCFUNDOINVEST   , FUN.IDGESTORCA' +
        'RTEIRA  , FUN.TRGDTINCLUSAO     ,'
      
        '  FUN.TRGUSERINCLUSAO   , FUN.MOECODIGO         , FUN.IDCARTEIRA' +
        'INVEST  , FUN.IDTIPOFUNDOINVEST ,'
      
        '  FUN.CNPJFUNDO         , FUN.STAEXCLUSIVO      , FUN.PZOCARENCI' +
        'A       , FUN.PZOANIVERSARIO    ,'
      
        '  FUN.PZOLIQAPLIC       , FUN.PZOLIQRESG        , FUN.QTDDECQTD ' +
        '        , FUN.QTDDECVALOR       ,'
      
        '  FUN.STAFUNDO          , FUN.PZOAMORTIZACAO    , FUN.PERCTXPERF' +
        'ORM     , FUN.PERCTXADM         ,'
      
        '  FUN.CODFUNCETIP       , FUN.STAPROVISIONAIR   , FUN.STAPROVISI' +
        'ONAIOF  , FUN.CONTRCETIP        ,'
      '  '#39'NULL'#39' AS DATAREFERENCIA, TPF.DATAULTFECH, FUN.DTAINIPROC'
      'FROM'
      '  HISTFUNDOINVEST FUN, TIPOFUNDOINVEST TPF'
      
        'WHERE (IDFUNDOINVEST || TO_CHAR(DTAVIGENCIA,'#39'DD/MM/YYYY, HH24:MI' +
        ':SS'#39') IN'
      
        '      (SELECT F.IDFUNDOINVEST || TO_CHAR(MAX(F.DTAVIGENCIA),'#39'DD/' +
        'MM/YYYY, HH24:MI:SS'#39')'
      '       FROM HISTFUNDOINVEST F, TIPOFUNDOINVEST T'
      '       WHERE'
      '            T.IDTIPOINVEST      = :IDTIPOINVEST         AND'
      '            T.IDTIPOFUNDOINVEST = F.IDTIPOFUNDOINVEST'
      '       GROUP BY F.IDFUNDOINVEST)) AND'
      '   TPF.IDTIPOFUNDOINVEST = FUN.IDTIPOFUNDOINVEST'
      'ORDER BY FUN.DESCFUNDOINVEST')
    ValidateWithMask = True
    Left = 95
    Top = 111
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end>
    object QryFundoInvestDESCFUNDOINVEST: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'DESCFUNDOINVEST'
      Size = 60
    end
    object QryFundoInvestIDFUNDOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFUNDOINVEST'
      Visible = False
    end
    object QryFundoInvestIDGESTORCARTEIRA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDGESTORCARTEIRA'
      Visible = False
    end
    object QryFundoInvestTRGDTINCLUSAO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'TRGDTINCLUSAO'
      Visible = False
    end
    object QryFundoInvestTRGUSERINCLUSAO: TStringField
      DisplayWidth = 30
      FieldName = 'TRGUSERINCLUSAO'
      Visible = False
      Size = 30
    end
    object QryFundoInvestMOECODIGO: TFloatField
      DisplayWidth = 10
      FieldName = 'MOECODIGO'
      Visible = False
    end
    object QryFundoInvestIDCARTEIRAINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object QryFundoInvestIDTIPOFUNDOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOFUNDOINVEST'
      Visible = False
    end
    object QryFundoInvestCNPJFUNDO: TStringField
      DisplayWidth = 25
      FieldName = 'CNPJFUNDO'
      Visible = False
      Size = 25
    end
    object QryFundoInvestSTAEXCLUSIVO: TStringField
      DisplayWidth = 1
      FieldName = 'STAEXCLUSIVO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryFundoInvestPZOCARENCIA: TFloatField
      DisplayWidth = 10
      FieldName = 'PZOCARENCIA'
      Visible = False
    end
    object QryFundoInvestPZOANIVERSARIO: TFloatField
      DisplayWidth = 10
      FieldName = 'PZOANIVERSARIO'
      Visible = False
    end
    object QryFundoInvestPZOLIQAPLIC: TFloatField
      DisplayWidth = 10
      FieldName = 'PZOLIQAPLIC'
      Visible = False
    end
    object QryFundoInvestPZOLIQRESG: TFloatField
      DisplayWidth = 10
      FieldName = 'PZOLIQRESG'
      Visible = False
    end
    object QryFundoInvestQTDDECQTD: TFloatField
      DisplayWidth = 10
      FieldName = 'QTDDECQTD'
      Visible = False
    end
    object QryFundoInvestQTDDECVALOR: TFloatField
      DisplayWidth = 10
      FieldName = 'QTDDECVALOR'
      Visible = False
    end
    object QryFundoInvestSTAFUNDO: TStringField
      DisplayWidth = 1
      FieldName = 'STAFUNDO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryFundoInvestPZOAMORTIZACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'PZOAMORTIZACAO'
      Visible = False
    end
    object QryFundoInvestPERCTXPERFORM: TFloatField
      DisplayWidth = 10
      FieldName = 'PERCTXPERFORM'
      Visible = False
    end
    object QryFundoInvestPERCTXADM: TFloatField
      DisplayWidth = 10
      FieldName = 'PERCTXADM'
      Visible = False
    end
    object QryFundoInvestCODFUNCETIP: TStringField
      DisplayWidth = 30
      FieldName = 'CODFUNCETIP'
      Visible = False
      Size = 30
    end
    object QryFundoInvestSTAPROVISIONAIR: TStringField
      DisplayWidth = 1
      FieldName = 'STAPROVISIONAIR'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryFundoInvestSTAPROVISIONAIOF: TStringField
      DisplayWidth = 1
      FieldName = 'STAPROVISIONAIOF'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object QryFundoInvestCONTRCETIP: TStringField
      DisplayWidth = 30
      FieldName = 'CONTRCETIP'
      Visible = False
      Size = 30
    end
    object QryFundoInvestDATAREFERENCIA: TStringField
      DisplayWidth = 4
      FieldName = 'DATAREFERENCIA'
      Visible = False
      FixedChar = True
      Size = 4
    end
    object QryFundoInvestDATAULTFECH: TDateTimeField
      FieldName = 'DATAULTFECH'
    end
    object QryFundoInvestDTAINIPROC: TDateTimeField
      FieldName = 'DTAINIPROC'
    end
  end
  object QryTipoCota: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM TIPOCOTA'
      'ORDER BY DESCTIPOCOTA'
      ''
      ' ')
    ValidateWithMask = True
    Left = 187
    Top = 111
  end
end
