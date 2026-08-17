inherited frmCadCotasIntegralizar: TfrmCadCotasIntegralizar
  Left = 203
  Top = 64
  ClientHeight = 431
  ClientWidth = 439
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 439
    Height = 345
    inherited Bevel1: TBevel
      Width = 437
    end
    inherited pnlMestre: TPanel
      Width = 437
      BevelInner = bvRaised
      BevelOuter = bvLowered
      object Investimento: TLabel
        Left = 11
        Top = 14
        Width = 130
        Height = 13
        Caption = 'Fundo de Investimento'
      end
      object dblInvest: TwwDBLookupCombo
        Left = 11
        Top = 30
        Width = 385
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCFUNDOINVEST'#9'40'#9'Descrição'#9'F')
        LookupTable = qryInvest
        LookupField = 'IDFUNDOINVEST'
        Options = [loRowLines, loTitles]
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnCloseUp = dblInvestCloseUp
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Width = 437
      Height = 229
      Tabs.Strings = (
        'Cotas')
      inherited pgctrlDetalhe: TPageControl
        Width = 339
        Height = 170
        inherited tbsDet: TTabSheet
          inherited dbgrdDet: TwwDBGrid
            Width = 331
            Height = 142
            Selected.Strings = (
              'DATAINTEGRALIZAR'#9'20'#9'Data'
              'QTDINTEGRALIZAR'#9'32'#9'Quantidade')
            ParentFont = False
            TitleAlignment = taCenter
            TitleFont.Color = 4194432
          end
          inherited pnlControlesDet: TPanel
            Width = 331
            Height = 142
            object Label2: TLabel
              Left = 7
              Top = 9
              Width = 28
              Height = 13
              Caption = 'Data'
            end
            object Label1: TLabel
              Left = 7
              Top = 63
              Width = 120
              Height = 13
              Caption = 'Quantidade de Cotas'
            end
            object dbdDta: TCMDateTimePicker
              Left = 7
              Top = 26
              Width = 130
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAINTEGRALIZAR'
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
              Top = 83
              Width = 209
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '      0,00')
              TabOrder = 1
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'QTDINTEGRALIZAR'
              DataSource = dsDet
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 429
      end
      inherited Dock974: TDock97
        Left = 343
        Height = 170
      end
    end
    inherited pnlTitulo: TPanel
      Width = 437
      inherited lbNomItem: TfcLabel
        Width = 287
        Caption = 'Fluxo de Cotas a Integralizar'
      end
    end
  end
  inherited Dock972: TDock97
    Width = 439
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
    Top = 392
    Width = 439
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
    Left = 224
    Top = 176
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'FUNDOINVEST.DESCFUNDOINVEST'
      'COTAINTEGRALIZA.DATAINTEGRALIZAR'
      'COTAINTEGRALIZA.QTDINTEGRALIZAR')
    TipodeDado.Strings = (
      'C'
      'D'
      'N')
    Descricao.Strings = (
      'Fundo'
      'Data'
      'Quantidade')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'COTAINTEGRALIZA'
      'FUNDOINVEST')
    CamposChave.Strings = (
      'COTAINTEGRALIZA.IDFUNDOINVEST')
    Filtro.Strings = (
      'FUNDOINVEST.IDFUNDOINVEST = COTAINTEGRALIZA.IDFUNDOINVEST')
    Mascaras.Strings = (
      ''
      ''
      '###,###,###,###0.000000000')
    Larguras.Strings = (
      '40'
      '10'
      '23')
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 280
    Top = 176
  end
  inherited qryDetalhe: TwwQuery
    SQL.Strings = (
      'SELECT *'
      'FROM  COTAINTEGRALIZA'
      'WHERE IDFUNDOINVEST    =:IDFUNDOINVEST'
      'ORDER BY DATAINTEGRALIZAR DESC'
      ''
      ' '
      ' '
      ' ')
    Left = 176
    Top = 176
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptUnknown
      end>
    object qryDetalheDATAINTEGRALIZAR: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 20
      FieldName = 'DATAINTEGRALIZAR'
      Origin = 'BASEDADOS.COTAINTEGRALIZA.DATAINTEGRALIZAR'
    end
    object qryDetalheQTDINTEGRALIZAR: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 32
      FieldName = 'QTDINTEGRALIZAR'
      Origin = 'BASEDADOS.COTAINTEGRALIZA.QTDINTEGRALIZAR'
    end
    object qryDetalheIDCOTAINTEGRALIZA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCOTAINTEGRALIZA'
      Origin = 'BASEDADOS.COTAINTEGRALIZA.IDCOTAINTEGRALIZA'
      Visible = False
    end
    object qryDetalheIDFUNDOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFUNDOINVEST'
      Origin = 'BASEDADOS.COTAINTEGRALIZA.IDFUNDOINVEST'
      Visible = False
    end
  end
  inherited updDetalhe: TUpdateSQL
    ModifySQL.Strings = (
      'update COTAINTEGRALIZA'
      'set'
      '  IDCOTAINTEGRALIZA = :IDCOTAINTEGRALIZA,'
      '  IDFUNDOINVEST = :IDFUNDOINVEST,'
      '  DATAINTEGRALIZAR = :DATAINTEGRALIZAR,'
      '  QTDINTEGRALIZAR = :QTDINTEGRALIZAR'
      'where'
      '  IDCOTAINTEGRALIZA = :OLD_IDCOTAINTEGRALIZA')
    InsertSQL.Strings = (
      'insert into COTAINTEGRALIZA'
      
        '  (IDCOTAINTEGRALIZA, IDFUNDOINVEST, DATAINTEGRALIZAR, QTDINTEGR' +
        'ALIZAR)'
      'values'
      
        '  (:IDCOTAINTEGRALIZA, :IDFUNDOINVEST, :DATAINTEGRALIZAR, :QTDIN' +
        'TEGRALIZAR)')
    DeleteSQL.Strings = (
      'delete from COTAINTEGRALIZA'
      'where'
      '  IDCOTAINTEGRALIZA = :OLD_IDCOTAINTEGRALIZA')
    Left = 128
    Top = 176
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
      '  FUNDOINVEST FUN, TIPOFUNDOINVEST TPF'
      ''
      'WHERE'
      ''
      '  FUN.IDTIPOFUNDOINVEST = TPF.IDTIPOFUNDOINVEST AND'
      
        '  (((:IDTIPOINVEST <> 0) AND (TPF.IDTIPOINVEST = :IDTIPOINVEST))' +
        ' OR'
      '    (:IDTIPOINVEST = 0))'
      ''
      'ORDER BY'
      '  FUN.DESCFUNDOINVEST'
      ''
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 375
    Top = 128
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
    object qryInvestDESCFUNDOINVEST: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldName = 'DESCFUNDOINVEST'
      Size = 60
    end
    object qryInvestIDFUNDOINVEST: TFloatField
      FieldName = 'IDFUNDOINVEST'
      Visible = False
    end
    object qryInvestIDGESTORCARTEIRA: TFloatField
      FieldName = 'IDGESTORCARTEIRA'
      Visible = False
    end
    object qryInvestTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Visible = False
    end
    object qryInvestTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Visible = False
      Size = 30
    end
    object qryInvestMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Visible = False
    end
    object qryInvestIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Visible = False
    end
    object qryInvestIDTIPOFUNDOINVEST: TFloatField
      FieldName = 'IDTIPOFUNDOINVEST'
      Visible = False
    end
    object qryInvestCNPJFUNDO: TStringField
      FieldName = 'CNPJFUNDO'
      Visible = False
      Size = 25
    end
    object qryInvestSTAEXCLUSIVO: TStringField
      FieldName = 'STAEXCLUSIVO'
      Visible = False
      Size = 1
    end
    object qryInvestPZOCARENCIA: TFloatField
      FieldName = 'PZOCARENCIA'
      Visible = False
    end
    object qryInvestPZOANIVERSARIO: TFloatField
      FieldName = 'PZOANIVERSARIO'
      Visible = False
    end
    object qryInvestPZOLIQAPLIC: TFloatField
      FieldName = 'PZOLIQAPLIC'
      Visible = False
    end
    object qryInvestPZOLIQRESG: TFloatField
      FieldName = 'PZOLIQRESG'
      Visible = False
    end
    object qryInvestQTDDECQTD: TFloatField
      FieldName = 'QTDDECQTD'
      Visible = False
    end
    object qryInvestQTDDECVALOR: TFloatField
      FieldName = 'QTDDECVALOR'
      Visible = False
    end
    object qryInvestSTAFUNDO: TStringField
      FieldName = 'STAFUNDO'
      Visible = False
      Size = 1
    end
    object qryInvestPZOAMORTIZACAO: TFloatField
      FieldName = 'PZOAMORTIZACAO'
      Visible = False
    end
    object qryInvestPERCTXPERFORM: TFloatField
      FieldName = 'PERCTXPERFORM'
      Visible = False
    end
    object qryInvestPERCTXADM: TFloatField
      FieldName = 'PERCTXADM'
      Visible = False
    end
    object qryInvestCODFUNCETIP: TStringField
      FieldName = 'CODFUNCETIP'
      Visible = False
      Size = 30
    end
    object qryInvestSTAPROVISIONAIR: TStringField
      FieldName = 'STAPROVISIONAIR'
      Visible = False
      Size = 1
    end
    object qryInvestSTAPROVISIONAIOF: TStringField
      FieldName = 'STAPROVISIONAIOF'
      Visible = False
      Size = 1
    end
    object qryInvestCONTRCETIP: TStringField
      FieldName = 'CONTRCETIP'
      Visible = False
      Size = 30
    end
    object qryInvestDATAREFERENCIA: TStringField
      FieldName = 'DATAREFERENCIA'
      Visible = False
      Size = 4
    end
  end
  object dsInvest: TwwDataSource
    AutoEdit = False
    DataSet = qryInvest
    Left = 403
    Top = 128
  end
  object qryConsCotaFundo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT VLRCOTA'
      'FROM   COTAFUNDO'
      'WHERE  IDFUNDOINVEST = :IDFUNDOINVEST AND'
      '       DATACOTA      = :DATACOTA'
      'ORDER BY DATACOTA DESC'
      ' ')
    ValidateWithMask = True
    Left = 368
    Top = 176
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
  object qrySomaCota: TQuery
    DatabaseName = 'BaseDados'
    Left = 373
    Top = 293
  end
  object qryHistFundoInvest: TQuery
    DatabaseName = 'BaseDados'
    Left = 373
    Top = 341
  end
end
