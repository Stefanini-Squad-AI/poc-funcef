inherited frmCadPatrimonioFundo: TfrmCadPatrimonioFundo
  Left = 197
  Top = 96
  HelpContext = 790202
  Caption = 'Cadastro'
  ClientHeight = 417
  ClientWidth = 428
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 428
    Height = 331
    object Bevel1: TBevel [0]
      Left = 1
      Top = 42
      Width = 426
      Height = 2
      Align = alTop
    end
    inherited pnlMestre: TPanel
      Top = 44
      Width = 426
      Height = 54
      BevelInner = bvRaised
      BevelOuter = bvLowered
      object Investimento: TLabel
        Left = 16
        Top = 6
        Width = 130
        Height = 13
        Caption = 'Fundo de Investimento'
      end
      object dblInvest: TwwDBLookupCombo
        Left = 16
        Top = 22
        Width = 385
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCFUNDOINVEST'#9'22'#9'Investimento')
        LookupTable = qryInvest
        LookupField = 'IDFUNDOINVEST'
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnCloseUp = dblInvestCloseUp
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 98
      Width = 426
      Height = 232
      Tabs.Strings = (
        'Patrimônio')
      inherited pgctrlDetalhe: TPageControl
        Width = 328
        Height = 173
        inherited tbsDet: TTabSheet
          Caption = 'Eventos'
          inherited dbgrdDet: TwwDBGrid
            Width = 320
            Height = 145
            Selected.Strings = (
              'DATAREFERENCIA'#9'14'#9'Referência'
              'QTDCOTAS'#9'18'#9'Quantidade de Cotas'
              'VLRPATRIMONIO'#9'18'#9'Valor do Patrimônio')
            Font.Color = clBlack
            ParentFont = False
            TitleAlignment = taCenter
            TitleFont.Color = clMaroon
            OnDblClick = dbgrdDetDblClick
          end
          inherited pnlControlesDet: TPanel
            Width = 320
            Height = 145
            object Label2: TLabel
              Left = 7
              Top = 1
              Width = 28
              Height = 13
              Caption = 'Data'
            end
            object Label3: TLabel
              Left = 8
              Top = 46
              Width = 111
              Height = 13
              Caption = 'Valor do Patrimônio'
            end
            object Label1: TLabel
              Left = 7
              Top = 88
              Width = 120
              Height = 13
              Caption = 'Quantidade de Cotas'
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
            object DBECota: TDBRealEdit
              Left = 8
              Top = 103
              Width = 209
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '126.534.220,99')
              TabOrder = 2
              WordWrap = False
              OnExit = DBECotaExit
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'QTDCOTAS'
              DataSource = dsDet
            end
            object DBEValorPatrimonio: TDBRealEdit
              Left = 7
              Top = 60
              Width = 210
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '350.742.308,90')
              TabOrder = 1
              WordWrap = False
              OnExit = DBEValorPatrimonioExit
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLRPATRIMONIO'
              DataSource = dsDet
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 418
      end
      inherited Dock974: TDock97
        Left = 332
        Height = 173
      end
    end
    object pnlTitulo: TPanel
      Left = 1
      Top = 1
      Width = 426
      Height = 41
      Align = alTop
      TabOrder = 2
      object lbNomItem: TfcLabel
        Left = 16
        Top = 8
        Width = 236
        Height = 24
        Caption = 'Patrimônio dos Fundos'
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
    end
  end
  inherited Dock972: TDock97
    Width = 428
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
    Top = 378
    Width = 428
    inherited tb97Fundo: TToolbar97
      Left = 245
      DockPos = 245
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 76
      DockPos = 76
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
    Left = 400
    Top = 2
    TargetsData = (
      1
      2
      (
        'TRealEdit'
        'Text'
        0)
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDetalhe
    Left = 277
    Top = 200
  end
  inherited ds: TwwDataSource
    Left = 159
    Top = 106
  end
  inherited upd: TUpdateSQL
    Left = 131
    Top = 106
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Patrimonio de Fundo de Investimento'
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
      'Quantidade de Cotas'
      'Valor do Patrimônio')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'FUNDOINVEST'
      'PATRIMONIOFUNDO'
      'TIPOFUNDOINVEST')
    CamposChave.Strings = (
      'FUNDOINVEST.IDFUNDOINVEST'
      'FUNDOINVEST.DESCFUNDOINVEST')
    Filtro.Strings = (
      'FUNDOINVEST.IDFUNDOINVEST = PATRIMONIOFUNDO.IDFUNDOINVEST'
      
        'FUNDOINVEST.IDTIPOFUNDOINVEST = TIPOFUNDOINVEST.IDTIPOFUNDOINVES' +
        'T')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '40'
      '18'
      '10'
      '10')
    Left = 323
    Top = 2
  end
  inherited ImlPadrao: TImageList
    Left = 361
    Top = 2
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 254
    Top = 2
  end
  inherited qry: TwwQuery
    UpdateObject = nil
    Left = 103
    Top = 106
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 288
    Top = 3
  end
  object qryDetalhe: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM PATRIMONIOFUNDO'
      'WHERE   ( IDFUNDOINVEST = :IDFUNDOINVEST )'
      'ORDER BY DATAREFERENCIA DESC'
      ' ')
    UpdateObject = updDetalhe
    ValidateWithMask = True
    Left = 221
    Top = 200
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptResult
        Value = '3'
      end>
    object qryDetalheDATAREFERENCIA: TDateTimeField
      Alignment = taCenter
      DisplayLabel = 'Referência'
      DisplayWidth = 14
      FieldName = 'DATAREFERENCIA'
      Origin = 'PATRIMONIOFUNDO.DATAREFERENCIA'
    end
    object qryDetalheQTDCOTAS: TFloatField
      DisplayLabel = 'Quantidade de Cotas'
      DisplayWidth = 18
      FieldName = 'QTDCOTAS'
      Origin = 'PATRIMONIOFUNDO.QTDCOTAS'
    end
    object qryDetalheVLRPATRIMONIO: TFloatField
      DisplayLabel = 'Valor do Patrimônio'
      DisplayWidth = 18
      FieldName = 'VLRPATRIMONIO'
      Origin = 'PATRIMONIOFUNDO.VLRPATRIMONIO'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object qryDetalheIDFUNDOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFUNDOINVEST'
      Origin = 'PATRIMONIOFUNDO.IDFUNDOINVEST'
      Visible = False
    end
    object qryDetalheIDPATRIMONIOFDO: TFloatField
      FieldName = 'IDPATRIMONIOFDO'
      Origin = 'BASEDADOS.PATRIMONIOFUNDO.IDFUNDOINVEST'
      Visible = False
    end
  end
  object updDetalhe: TUpdateSQL
    ModifySQL.Strings = (
      'update PATRIMONIOFUNDO'
      'set'
      '  IDFUNDOINVEST = :IDFUNDOINVEST,'
      '  DATAREFERENCIA = :DATAREFERENCIA,'
      '  QTDCOTAS = :QTDCOTAS,'
      '  VLRPATRIMONIO = :VLRPATRIMONIO'
      'where'
      '  IDPATRIMONIOFDO = :OLD_IDPATRIMONIOFDO')
    InsertSQL.Strings = (
      'insert into PATRIMONIOFUNDO'
      '  (IDFUNDOINVEST, DATAREFERENCIA, QTDCOTAS, VLRPATRIMONIO,'
      'IDPATRIMONIOFDO)'
      'values'
      '  (:IDFUNDOINVEST, :DATAREFERENCIA, :QTDCOTAS, :VLRPATRIMONIO,'
      ':IDPATRIMONIOFDO)')
    DeleteSQL.Strings = (
      'delete from PATRIMONIOFUNDO'
      'where'
      '  IDPATRIMONIOFDO= :OLD_IDPATRIMONIOFDO')
    Left = 249
    Top = 200
  end
  object qryInvest: TwwQuery
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
      '  '#39'NULL'#39' AS DATAREFERENCIA'
      ''
      'FROM'
      '   FUNDOINVEST FUN,'
      '   TIPOFUNDOINVEST TPF'
      'WHERE'
      
        '  ( (FUN.STAEXCLUSIVO  <> '#39'S'#39')  OR (FUN.STAEXCLUSIVO IS NULL) ) ' +
        'AND'
      '  (FUN.IDTIPOFUNDOINVEST = TPF.IDTIPOFUNDOINVEST) AND'
      
        '  (((:IDTIPOINVEST <> 0) AND (TPF.IDTIPOINVEST = :IDTIPOINVEST))' +
        ' OR (:IDTIPOINVEST = 0)) AND'
      '  (IDTIPOINVEST <> 9)'
      ''
      'ORDER BY'
      '  FUN.DESCFUNDOINVEST'
      ' ')
    ValidateWithMask = True
    Left = 335
    Top = 72
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
    object qryInvestIDFUNDOINVEST: TFloatField
      FieldName = 'IDFUNDOINVEST'
    end
    object qryInvestDESCFUNDOINVEST: TStringField
      FieldName = 'DESCFUNDOINVEST'
      Size = 60
    end
    object qryInvestIDGESTORCARTEIRA: TFloatField
      FieldName = 'IDGESTORCARTEIRA'
    end
    object qryInvestTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
    end
    object qryInvestTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Size = 30
    end
    object qryInvestMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
    end
    object qryInvestIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
    end
    object qryInvestIDTIPOFUNDOINVEST: TFloatField
      FieldName = 'IDTIPOFUNDOINVEST'
    end
    object qryInvestCNPJFUNDO: TStringField
      FieldName = 'CNPJFUNDO'
      Size = 25
    end
    object qryInvestSTAEXCLUSIVO: TStringField
      FieldName = 'STAEXCLUSIVO'
      Size = 1
    end
    object qryInvestPZOCARENCIA: TFloatField
      FieldName = 'PZOCARENCIA'
    end
    object qryInvestPZOANIVERSARIO: TFloatField
      FieldName = 'PZOANIVERSARIO'
    end
    object qryInvestPZOLIQAPLIC: TFloatField
      FieldName = 'PZOLIQAPLIC'
    end
    object qryInvestPZOLIQRESG: TFloatField
      FieldName = 'PZOLIQRESG'
    end
    object qryInvestQTDDECQTD: TFloatField
      FieldName = 'QTDDECQTD'
    end
    object qryInvestQTDDECVALOR: TFloatField
      FieldName = 'QTDDECVALOR'
    end
    object qryInvestSTAFUNDO: TStringField
      FieldName = 'STAFUNDO'
      Size = 1
    end
    object qryInvestPZOAMORTIZACAO: TFloatField
      FieldName = 'PZOAMORTIZACAO'
    end
    object qryInvestPERCTXPERFORM: TFloatField
      FieldName = 'PERCTXPERFORM'
    end
    object qryInvestPERCTXADM: TFloatField
      FieldName = 'PERCTXADM'
    end
    object qryInvestCODFUNCETIP: TStringField
      FieldName = 'CODFUNCETIP'
      Size = 30
    end
    object qryInvestSTAPROVISIONAIR: TStringField
      FieldName = 'STAPROVISIONAIR'
      Size = 1
    end
    object qryInvestSTAPROVISIONAIOF: TStringField
      FieldName = 'STAPROVISIONAIOF'
      Size = 1
    end
    object qryInvestCONTRCETIP: TStringField
      FieldName = 'CONTRCETIP'
      Size = 30
    end
    object qryInvestDATAREFERENCIA: TStringField
      FieldName = 'DATAREFERENCIA'
      Size = 4
    end
  end
  object dsInvest: TwwDataSource
    AutoEdit = False
    DataSet = qryInvest
    Left = 363
    Top = 72
  end
  object qryConsCotaFundo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT VLRCOTA'
      'FROM COTAFUNDO'
      'WHERE IDFUNDOINVEST = :IDFUNDOINVEST AND'
      '               DATACOTA = :DATACOTA '
      'order by datacota desc')
    ValidateWithMask = True
    Left = 269
    Top = 263
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptResult
        Value = 5
      end
      item
        DataType = ftDateTime
        Name = 'DATACOTA'
        ParamType = ptResult
        Value = '17/08/2001'
      end>
  end
end
