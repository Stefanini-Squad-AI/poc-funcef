inherited frmCadPatrimonioFDC: TfrmCadPatrimonioFDC
  Left = 460
  Top = 275
  HelpContext = 790232
  ClientHeight = 436
  ClientWidth = 420
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 420
    Height = 350
    inherited Bevel1: TBevel
      Width = 418
    end
    inherited pnlMestre: TPanel
      Width = 418
      Height = 96
      object Label1: TLabel
        Left = 18
        Top = 7
        Width = 130
        Height = 13
        Caption = 'Fundo de Investimento'
      end
      object Label4: TLabel
        Left = 17
        Top = 49
        Width = 74
        Height = 13
        Caption = 'Tipo de Cota'
      end
      object dblInvest: TwwDBLookupCombo
        Left = 18
        Top = 23
        Width = 351
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
        Top = 65
        Width = 239
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCTIPOCOTA'#9'40'#9'Descrição'#9'F')
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
      Top = 141
      Width = 418
      Height = 208
      inherited pgctrlDetalhe: TPageControl
        Width = 320
        Height = 149
        inherited tbsDet: TTabSheet
          inherited pnlControlesDet: TPanel [0]
            Width = 312
            Height = 121
            object Label2: TLabel
              Left = 7
              Top = 1
              Width = 28
              Height = 13
              Caption = 'Data'
            end
            object Label5: TLabel
              Left = 7
              Top = 40
              Width = 120
              Height = 13
              Caption = 'Quantidade de Cotas'
            end
            object Label3: TLabel
              Left = 8
              Top = 81
              Width = 111
              Height = 13
              Caption = 'Valor do Patrimônio'
            end
            object dbdDta: TCMDateTimePicker
              Left = 7
              Top = 16
              Width = 130
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAREFERENCIA'
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
            object dbreQtdCotas: TDBRealEdit
              Left = 8
              Top = 55
              Width = 209
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
              DataField = 'QTDCOTAS'
              DataSource = dsDet
            end
            object dbreValorPatrimonio: TDBRealEdit
              Left = 7
              Top = 95
              Width = 210
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 2
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLRPATRIMONIO'
              DataSource = dsDet
            end
          end
          inherited dbgrdDet: TwwDBGrid [1]
            Width = 312
            Height = 121
            Selected.Strings = (
              'DATAREFERENCIA'#9'11'#9'Data'
              'QTDCOTAS'#9'22'#9'Quantidade'
              'VLRPATRIMONIO'#9'16'#9'Patrimonio'#9'F')
            ParentFont = False
            TitleAlignment = taCenter
            TitleFont.Color = clMaroon
          end
        end
      end
      inherited Dock973: TDock97
        Width = 410
      end
      inherited Dock974: TDock97
        Left = 324
        Height = 149
      end
    end
    inherited pnlTitulo: TPanel
      Width = 418
      inherited lbNomItem: TfcLabel
        Width = 336
        Caption = 'Quantidade de Cotas de Emissão'
      end
    end
  end
  inherited Dock972: TDock97
    Width = 420
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
    Top = 397
    Width = 420
    inherited tb97Fundo: TToolbar97
      Left = 248
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 79
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
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
    Left = 235
  end
  inherited ds: TwwDataSource
    Left = 306
  end
  inherited upd: TUpdateSQL
    Left = 330
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'FUNDOINVEST.DESCFUNDOINVEST'
      'PATRIMONIOFUNDO.DATAREFERENCIA'
      'PATRIMONIOFUNDO.QTDCOTAS'
      'PATRIMONIOFUNDO.VLRPATRIMONIO')
    TipodeDado.Strings = (
      'C'
      'D'
      'N'
      'N')
    Descricao.Strings = (
      'Fundo de Investimento'
      'Data'
      'Quantidade'
      'Patrimonio')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'FUNDOINVEST'
      'TIPOFUNDOINVEST'
      'TIPOCOTA'
      'PATRIMONIOFUNDO')
    CamposChave.Strings = (
      'PATRIMONIOFUNDO.IDFUNDOINVEST'
      'PATRIMONIOFUNDO.IDTIPOCOTA'
      'PATRIMONIOFUNDO.DATAREFERENCIA'
      'PATRIMONIOFUNDO.QTDCOTAS'
      'PATRIMONIOFUNDO.VLRPATRIMONIO')
    Filtro.Strings = (
      'TIPOFUNDOINVEST.IDTIPOINVEST = 9'
      
        'TIPOFUNDOINVEST.IDTIPOFUNDOINVEST = FUNDOINVEST.IDTIPOFUNDOINVES' +
        'T'
      'FUNDOINVEST.IDFUNDOINVEST = PATRIMONIOFUNDO.IDFUNDOINVEST'
      'TIPOCOTA.IDTIPOCOTA = PATRIMONIOFUNDO.IDTIPOCOTA')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '18'
      '10'
      '10')
  end
  inherited qryDetalhe: TwwQuery
    SQL.Strings = (
      'SELECT'
      
        '   IDPATRIMONIOFDO,IDFUNDOINVEST, DATAREFERENCIA, QTDCOTAS, VLRP' +
        'ATRIMONIO, IDTIPOCOTA'
      'FROM'
      '   PATRIMONIOFUNDO'
      'WHERE'
      '   (IDFUNDOINVEST = :IDFUNDOINVEST)  AND'
      '   (IDTIPOCOTA    = :IDTIPOCOTA )    AND'
      
        '   (((:DATAREFERENCIA IS NOT NULL) AND (DATAREFERENCIA = TO_DATE' +
        '(:DATAREFERENCIA,'#39'DD/MM/YYYY'#39'))) OR (:DATAREFERENCIA IS NULL))'
      'ORDER BY IDFUNDOINVEST, DATAREFERENCIA')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREFERENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREFERENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAREFERENCIA'
        ParamType = ptUnknown
      end>
    object qryDetalheDATAREFERENCIA: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 11
      FieldName = 'DATAREFERENCIA'
    end
    object qryDetalheQTDCOTAS: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 22
      FieldName = 'QTDCOTAS'
      DisplayFormat = '###,#0.00000000000'
    end
    object qryDetalheVLRPATRIMONIO: TFloatField
      DisplayLabel = 'Patrimonio'
      DisplayWidth = 16
      FieldName = 'VLRPATRIMONIO'
      DisplayFormat = '#,##0.00'
    end
    object qryDetalheIDPATRIMONIOFDO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPATRIMONIOFDO'
      Visible = False
    end
    object qryDetalheIDFUNDOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFUNDOINVEST'
      Visible = False
    end
    object qryDetalheIDTIPOCOTA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOCOTA'
      Visible = False
    end
  end
  inherited updDetalhe: TUpdateSQL
    ModifySQL.Strings = (
      'update PATRIMONIOFUNDO'
      'set'
      '  QTDCOTAS = :QTDCOTAS,'
      '  VLRPATRIMONIO = :VLRPATRIMONIO'
      'where'
      '  IDPATRIMONIOFDO = :OLD_IDPATRIMONIOFDO')
    InsertSQL.Strings = (
      'insert into PATRIMONIOFUNDO'
      '  (IDPATRIMONIOFDO, IDFUNDOINVEST, DATAREFERENCIA, '
      'QTDCOTAS, VLRPATRIMONIO, IDTIPOCOTA)'
      'values'
      '  (:IDPATRIMONIOFDO, :IDFUNDOINVEST, :DATAREFERENCIA, '
      ':QTDCOTAS, :VLRPATRIMONIO, :IDTIPOCOTA)')
    DeleteSQL.Strings = (
      'delete from PATRIMONIOFUNDO'
      'where'
      '  IDPATRIMONIOFDO = :OLD_IDPATRIMONIOFDO')
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
        'ONAIOF  , FUN.CONTRCETIP'
      'FROM'
      '  FUNDOINVEST FUN, TIPOFUNDOINVEST TPF'
      'WHERE'
      '  TPF.IDTIPOFUNDOINVEST = FUN.IDTIPOFUNDOINVEST AND'
      
        '  (((:IDTIPOINVEST <> 0) AND (TPF.IDTIPOINVEST = :IDTIPOINVEST))' +
        ' OR (:IDTIPOINVEST = 0)) AND'
      '  (IDTIPOINVEST = 9)'
      'ORDER BY'
      '  FUN.DESCFUNDOINVEST'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 131
    Top = 95
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end>
    object QryFundoInvestDESCFUNDOINVEST: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'DESCFUNDOINVEST'
      Origin = 'FUNDOINVEST.DESCFUNDOINVEST'
      Size = 60
    end
    object QryFundoInvestIDFUNDOINVEST: TFloatField
      FieldName = 'IDFUNDOINVEST'
      Origin = 'FUNDOINVEST.IDFUNDOINVEST'
      Visible = False
    end
    object QryFundoInvestIDGESTORCARTEIRA: TFloatField
      FieldName = 'IDGESTORCARTEIRA'
      Origin = 'FUNDOINVEST.IDGESTORCARTEIRA'
      Visible = False
    end
    object QryFundoInvestTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'FUNDOINVEST.TRGDTINCLUSAO'
      Visible = False
    end
    object QryFundoInvestTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'FUNDOINVEST.TRGUSERINCLUSAO'
      Visible = False
      Size = 30
    end
    object QryFundoInvestMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Origin = 'FUNDOINVEST.MOECODIGO'
      Visible = False
    end
    object QryFundoInvestIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'FUNDOINVEST.IDCARTEIRAINVEST'
      Visible = False
    end
    object QryFundoInvestIDTIPOFUNDOINVEST: TFloatField
      FieldName = 'IDTIPOFUNDOINVEST'
      Origin = 'FUNDOINVEST.IDTIPOFUNDOINVEST'
      Visible = False
    end
    object QryFundoInvestCNPJFUNDO: TStringField
      FieldName = 'CNPJFUNDO'
      Origin = 'FUNDOINVEST.CNPJFUNDO'
      Visible = False
      Size = 25
    end
    object QryFundoInvestSTAEXCLUSIVO: TStringField
      FieldName = 'STAEXCLUSIVO'
      Origin = 'FUNDOINVEST.STAEXCLUSIVO'
      Visible = False
      Size = 1
    end
    object QryFundoInvestPZOCARENCIA: TFloatField
      FieldName = 'PZOCARENCIA'
      Origin = 'FUNDOINVEST.PZOCARENCIA'
      Visible = False
    end
    object QryFundoInvestPZOANIVERSARIO: TFloatField
      FieldName = 'PZOANIVERSARIO'
      Origin = 'FUNDOINVEST.PZOANIVERSARIO'
      Visible = False
    end
    object QryFundoInvestPZOLIQAPLIC: TFloatField
      FieldName = 'PZOLIQAPLIC'
      Origin = 'FUNDOINVEST.PZOLIQAPLIC'
      Visible = False
    end
    object QryFundoInvestPZOLIQRESG: TFloatField
      FieldName = 'PZOLIQRESG'
      Origin = 'FUNDOINVEST.PZOLIQRESG'
      Visible = False
    end
    object QryFundoInvestQTDDECQTD: TFloatField
      FieldName = 'QTDDECQTD'
      Origin = 'FUNDOINVEST.QTDDECQTD'
      Visible = False
    end
    object QryFundoInvestQTDDECVALOR: TFloatField
      FieldName = 'QTDDECVALOR'
      Origin = 'FUNDOINVEST.QTDDECVALOR'
      Visible = False
    end
    object QryFundoInvestSTAFUNDO: TStringField
      FieldName = 'STAFUNDO'
      Origin = 'FUNDOINVEST.STAFUNDO'
      Visible = False
      Size = 1
    end
    object QryFundoInvestPZOAMORTIZACAO: TFloatField
      FieldName = 'PZOAMORTIZACAO'
      Origin = 'FUNDOINVEST.PZOAMORTIZACAO'
      Visible = False
    end
    object QryFundoInvestPERCTXPERFORM: TFloatField
      FieldName = 'PERCTXPERFORM'
      Origin = 'FUNDOINVEST.PERCTXPERFORM'
      Visible = False
    end
    object QryFundoInvestPERCTXADM: TFloatField
      FieldName = 'PERCTXADM'
      Origin = 'FUNDOINVEST.PERCTXADM'
      Visible = False
    end
    object QryFundoInvestCODFUNCETIP: TStringField
      FieldName = 'CODFUNCETIP'
      Origin = 'FUNDOINVEST.CODFUNCETIP'
      Visible = False
      Size = 30
    end
    object QryFundoInvestSTAPROVISIONAIR: TStringField
      FieldName = 'STAPROVISIONAIR'
      Origin = 'FUNDOINVEST.STAPROVISIONAIR'
      Visible = False
      Size = 1
    end
    object QryFundoInvestSTAPROVISIONAIOF: TStringField
      FieldName = 'STAPROVISIONAIOF'
      Origin = 'FUNDOINVEST.STAPROVISIONAIOF'
      Visible = False
      Size = 1
    end
    object QryFundoInvestCONTRCETIP: TStringField
      FieldName = 'CONTRCETIP'
      Origin = 'FUNDOINVEST.CONTRCETIP'
      Visible = False
      Size = 30
    end
  end
  object QryTipoCota: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDTIPOCOTA, DESCTIPOCOTA'
      'FROM'
      '   TIPOCOTA'
      'ORDER BY DESCTIPOCOTA'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 131
    Top = 143
    object QryTipoCotaDESCTIPOCOTA: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldName = 'DESCTIPOCOTA'
      Origin = 'BASEDADOS.TIPOCOTA.DESCTIPOCOTA'
      Size = 40
    end
    object QryTipoCotaIDTIPOCOTA: TFloatField
      FieldName = 'IDTIPOCOTA'
      Origin = 'BASEDADOS.TIPOCOTA.IDTIPOCOTA'
      Visible = False
    end
  end
  object qryVerificaDados: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   DATAREFERENCIA'
      'FROM'
      '   PATRIMONIOFUNDO'
      'WHERE'
      '   (DATAREFERENCIA = :DATAREFERENCIA) AND'
      '   (IDTIPOCOTA = :IDTIPOCOTA) AND'
      '   (IDFUNDOINVEST = :IDFUNDOINVEST)'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 227
    Top = 95
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAREFERENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOCOTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptUnknown
      end>
    object qryVerificaDadosDATAREFERENCIA: TDateTimeField
      FieldName = 'DATAREFERENCIA'
      Origin = 'BASEDADOS.PATRIMONIOFUNDO.DATAREFERENCIA'
    end
  end
end
