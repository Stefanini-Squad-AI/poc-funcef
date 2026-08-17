inherited frmCadCotaFundo: TfrmCadCotaFundo
  Left = 241
  Top = 114
  HelpContext = 790201
  Caption = ''
  ClientHeight = 403
  ClientWidth = 398
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 398
    Height = 317
    object Bevel1: TBevel [0]
      Left = 1
      Top = 42
      Width = 396
      Height = 2
      Align = alTop
    end
    inherited pnlMestre: TPanel
      Top = 44
      Width = 396
      Height = 57
      BevelInner = bvRaised
      BevelOuter = bvLowered
      object Investimento: TLabel
        Left = 17
        Top = 7
        Width = 130
        Height = 13
        Caption = 'Fundo de Investimento'
      end
      object dblInvest: TwwDBLookupCombo
        Left = 17
        Top = 23
        Width = 352
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCFUNDOINVEST'#9'40'#9'Descrição'#9'F')
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
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 101
      Width = 396
      Height = 215
      Tabs.Strings = (
        'Cotas')
      inherited pgctrlDetalhe: TPageControl
        Width = 298
        Height = 156
        inherited tbsDet: TTabSheet
          Caption = 'Eventos'
          inherited pnlControlesDet: TPanel [0]
            Width = 290
            Height = 128
            object Label2: TLabel
              Left = 34
              Top = 6
              Width = 28
              Height = 13
              Caption = 'Data'
            end
            object Label3: TLabel
              Left = 34
              Top = 56
              Width = 78
              Height = 13
              Caption = 'Valor da Cota'
            end
            object dbdDta: TCMDateTimePicker
              Left = 34
              Top = 23
              Width = 102
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
            end
            object DbEdValorCota: TDBRealEdit
              Left = 34
              Top = 74
              Width = 202
              Height = 22
              Alignment = taRightJustify
              Lines.Strings = (
                '0,000000000')
              TabOrder = 1
              WordWrap = False
              OnExit = DbEdValorCotaExit
              IntDigits = 17
              DecDigits = 9
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLRCOTA'
              DataSource = dsDet
            end
          end
          inherited dbgrdDet: TwwDBGrid [1]
            Width = 290
            Height = 128
            Selected.Strings = (
              'DATACOTA'#9'16'#9'Data'#9'F'
              'VLRCOTA'#9'32'#9'Valor')
            Font.Color = clBlack
            ParentFont = False
            TitleAlignment = taCenter
            TitleFont.Color = clMaroon
            OnDblClick = dbgrdDetDblClick
          end
        end
      end
      inherited Dock973: TDock97
        Width = 388
        inherited tb97BotoesDetalhe: TToolbar97
          inherited sbtnInsDet: TToolbarButton97
            Tag = 10
            Width = 70
            Caption = '&Inserir'
            Enabled = False
          end
          inherited sbtnAltDet: TToolbarButton97
            Tag = 11
            Left = 70
            Width = 70
            Caption = '&Alterar'
            Enabled = False
          end
          inherited sbtnExcluiDet: TToolbarButton97
            Tag = 11
            Left = 140
            Width = 70
            Caption = '&Excluir'
            Enabled = False
          end
        end
      end
      inherited Dock974: TDock97
        Left = 302
        Height = 156
        inherited tb97Detalhe: TToolbar97
          inherited bbtnOkDet: TBitBtn
            Caption = '&OK'
          end
          inherited bbtnCancelarDet: TBitBtn
            Caption = '&Cancelar'
          end
          inherited bbtnVoltarDet: TBitBtn
            OnClick = bbtnCancelarDetClick
          end
        end
      end
    end
    object pnlTitulo: TPanel
      Left = 1
      Top = 1
      Width = 396
      Height = 41
      Align = alTop
      TabOrder = 2
      object lbNomItem: TfcLabel
        Left = 16
        Top = 8
        Width = 353
        Height = 24
        Caption = 'Cotas de Fundos de Investimentos'
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
    Width = 398
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
    Top = 364
    Width = 398
    inherited tb97Fundo: TToolbar97
      Left = 169
      DockPos = 169
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      DockPos = 0
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
    Left = 227
    Top = 5
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
    Left = 139
    Top = 120
  end
  inherited ds: TwwDataSource
    Left = 139
    Top = 164
  end
  inherited upd: TUpdateSQL
    Left = 169
    Top = 164
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'H.DESCFUNDOINVEST'
      'COTAFUNDO.DATACOTA'
      'COTAFUNDO.VLRCOTA')
    TipodeDado.Strings = (
      'C'
      'D'
      'N')
    Descricao.Strings = (
      'Fundo de Investimento'
      'Data da Cota'
      'Valor da Cota ')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'COTAFUNDO'
      'HISTFUNDOINVEST H'
      'TIPOFUNDOINVEST')
    CamposChave.Strings = (
      'COTAFUNDO.IDFUNDOINVEST'
      'COTAFUNDO.DATACOTA')
    Filtro.Strings = (
      'H.IDFUNDOINVEST = COTAFUNDO.IDFUNDOINVEST'
      'H.IDTIPOFUNDOINVEST = TIPOFUNDOINVEST.IDTIPOFUNDOINVEST'
      'TIPOFUNDOINVEST.IDTIPOINVEST <> 9')
    Mascaras.Strings = (
      ''
      ''
      '###,###,##0.000000000000000')
    Larguras.Strings = (
      '40'
      '10'
      '25')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1')
    UsaDistinct = True
    Left = 336
    Top = 3
  end
  inherited ImlPadrao: TImageList
    Left = 277
    Top = 4
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 61
    Top = 164
  end
  inherited qry: TwwQuery
    UpdateObject = nil
    Left = 112
    Top = 164
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 64
    Top = 120
  end
  object qryDetalhe: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM COTAFUNDO'
      'WHERE (IDFUNDOINVEST = :IDFUNDOINVEST ) AND'
      '      (IDTIPOCOTA IS NULL) AND'
      
        '      (((:DATACOTA IS NOT NULL) AND (DATACOTA = :DATACOTA)) OR (' +
        ':DATACOTA IS NULL))'
      'ORDER BY DATACOTA DESC'
      ' ')
    UpdateObject = updDet
    ValidateWithMask = True
    Left = 111
    Top = 120
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftDateTime
        Name = 'DATACOTA'
        ParamType = ptResult
      end
      item
        DataType = ftDateTime
        Name = 'DATACOTA'
        ParamType = ptResult
      end
      item
        DataType = ftDateTime
        Name = 'DATACOTA'
        ParamType = ptResult
      end>
    object qryDetalheDATACOTA: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 16
      FieldName = 'DATACOTA'
      Origin = 'COTAFUNDO.DATACOTA'
    end
    object qryDetalheVLRCOTA: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 32
      FieldName = 'VLRCOTA'
      Origin = 'COTAFUNDO.VLRCOTA'
      DisplayFormat = '#,##0.00000000000000'
    end
    object qryDetalheIDFUNDOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFUNDOINVEST'
      Origin = 'COTAFUNDO.IDFUNDOINVEST'
      Visible = False
    end
    object qryDetalheIDCOTAFUNDO: TFloatField
      FieldName = 'IDCOTAFUNDO'
      Origin = 'BASEDADOS.COTAFUNDO.IDCOTAFUNDO'
      Visible = False
    end
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
      '  FUN.DTAINIPROC'
      'FROM'
      '  HISTFUNDOINVEST FUN'
      
        'WHERE (IDFUNDOINVEST || TO_CHAR(DTAVIGENCIA,'#39'DD/MM/YYYY, HH24:MI' +
        ':SS'#39') IN'
      
        '      (SELECT F.IDFUNDOINVEST || TO_CHAR(MAX(F.DTAVIGENCIA),'#39'DD/' +
        'MM/YYYY, HH24:MI:SS'#39')'
      '       FROM HISTFUNDOINVEST F, TIPOFUNDOINVEST T'
      '       WHERE'
      '            T.IDTIPOFUNDOINVEST = F.IDTIPOFUNDOINVEST AND'
      
        '            (((:IDTIPOINVEST <> 0) AND (T.IDTIPOINVEST = :IDTIPO' +
        'INVEST)) OR (:IDTIPOINVEST = 0))'
      '       AND (T.IDTIPOINVEST <> 9)'
      '       GROUP BY F.IDFUNDOINVEST))'
      'ORDER BY FUN.DESCFUNDOINVEST'
      ' ')
    ValidateWithMask = True
    Left = 259
    Top = 111
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
      DisplayWidth = 40
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
    object QryFundoInvestDTAINIPROC: TDateTimeField
      FieldName = 'DTAINIPROC'
      Origin = 'BASEDADOS.FUNDOINVEST.DTAINIPROC'
      Visible = False
    end
  end
  object dsInvest: TwwDataSource
    AutoEdit = False
    DataSet = QryFundoInvest
    Left = 327
    Top = 111
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update CotaFundo'
      'set'
      '  IDFUNDOINVEST = :IDFUNDOINVEST,'
      '  DATACOTA = :DATACOTA,'
      '  VLRCOTA = :VLRCOTA'
      'where'
      '  IDCOTAFUNDO = :OLD_IDCOTAFUNDO')
    InsertSQL.Strings = (
      'insert into CotaFundo'
      '  (IDFUNDOINVEST, DATACOTA, VLRCOTA, IDCOTAFUNDO)'
      'values'
      '  (:IDFUNDOINVEST, :DATACOTA, :VLRCOTA, :IDCOTAFUNDO)')
    DeleteSQL.Strings = (
      'delete from CotaFundo'
      'where'
      '  IDCOTAFUNDO = :OLD_IDCOTAFUNDO')
    Left = 167
    Top = 120
  end
  object QryTipoFundoInvest: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *  FROM TIPOFUNDOINVEST WHERE'
      ''
      'IDTIPOFUNDOINVEST =:IDTIPOFUNDOINVEST  ')
    ValidateWithMask = True
    Left = 151
    Top = 48
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOFUNDOINVEST'
        ParamType = ptUnknown
      end>
    object QryTipoFundoInvestIDTIPOFUNDOINVEST: TFloatField
      FieldName = 'IDTIPOFUNDOINVEST'
      Origin = 'BASEDADOS.TIPOOPERACAO.IDTIPOINVEST'
    end
    object QryTipoFundoInvestIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'BASEDADOS.TIPOOPERACAO.IDTIPOOPERACAO'
    end
    object QryTipoFundoInvestDESCTIPOFUNDOINV: TStringField
      FieldName = 'DESCTIPOFUNDOINV'
      Origin = 'BASEDADOS.TIPOOPERACAO.IDMERCADO'
      Size = 80
    end
    object QryTipoFundoInvestDATAULTFECH: TDateTimeField
      FieldName = 'DATAULTFECH'
      Origin = 'BASEDADOS.TIPOOPERACAO.CODTIPDOC'
    end
    object QryTipoFundoInvestTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.DESCTIPOOPERACAO'
    end
    object QryTipoFundoInvestTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.TIPOOPERACAO.NATUREZAOPERACAO'
      Size = 30
    end
  end
  object QryAux: TwwQuery
    DatabaseName = 'basedados'
    ValidateWithMask = True
    Left = 277
    Top = 48
  end
end
