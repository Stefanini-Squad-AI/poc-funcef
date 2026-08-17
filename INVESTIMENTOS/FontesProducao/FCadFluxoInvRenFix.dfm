inherited frmCadFluxoInvestRenFix: TfrmCadFluxoInvestRenFix
  Left = 691
  Top = 137
  HelpContext = 790253
  ClientHeight = 517
  ClientWidth = 420
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 420
    Height = 431
    inherited Bevel1: TBevel
      Width = 418
    end
    inherited pnlMestre: TPanel
      Width = 418
      Height = 129
      object lblCurva: TLabel
        Left = 16
        Top = 42
        Width = 30
        Height = 13
        Caption = 'Perfil'
      end
      object lblTitulo: TLabel
        Left = 16
        Top = 3
        Width = 73
        Height = 13
        Caption = 'Investimento'
      end
      object Label1: TLabel
        Left = 16
        Top = 82
        Width = 25
        Height = 13
        Caption = 'Item'
      end
      object dblCurva: TwwDBLookupCombo
        Left = 16
        Top = 58
        Width = 378
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCCURVARENFIX'#9'50'#9'Curva'#9'F')
        LookupTable = qryCurva
        LookupField = 'IDCURVARENFIX'
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnCloseUp = dblCurvaCloseUp
        OnExit = dblCurvaExit
      end
      object dblInvestimento: TwwDBLookupCombo
        Left = 16
        Top = 19
        Width = 378
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCINVESTIMENTO'#9'50'#9'Investimento'#9'F')
        LookupTable = qryInvestimento
        LookupField = 'IDINVESTIMENTO'
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnCloseUp = dblInvestimentoCloseUp
        OnExit = dblInvestimentoExit
      end
      object dblItem: TwwDBLookupCombo
        Left = 16
        Top = 98
        Width = 378
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCITEMRENFIX'#9'50'#9'Item'#9'F')
        LookupTable = qryItem
        LookupField = 'IDITEMRENFIX'
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnCloseUp = dblItemCloseUp
        OnExit = dblItemExit
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 173
      Width = 418
      Height = 257
      Tabs.Strings = (
        'Fluxo')
      inherited pgctrlDetalhe: TPageControl
        Width = 320
        Height = 198
        inherited tbsDet: TTabSheet
          inherited dbgrdDet: TwwDBGrid
            Width = 312
            Height = 170
            Selected.Strings = (
              'DATAFLUXOORIGINAL'#9'18'#9'Data do Fluxo'#9'F'
              'PERCFLUXO'#9'19'#9'Percentual do Fluxo'#9'F')
            TitleAlignment = taLeftJustify
          end
          inherited pnlControlesDet: TPanel
            Width = 312
            Height = 170
            object Label2: TLabel
              Left = 9
              Top = 22
              Width = 80
              Height = 13
              Caption = 'Data do Fluxo'
            end
            object Label3: TLabel
              Left = 144
              Top = 22
              Width = 62
              Height = 13
              Caption = 'Percentual'
            end
            object Label4: TLabel
              Left = 276
              Top = 43
              Width = 10
              Height = 13
              Caption = '%'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label5: TLabel
              Left = 9
              Top = 70
              Width = 124
              Height = 13
              Caption = 'Data de Recebimento'
            end
            object dbePercFluxo: TDBRealEdit
              Left = 144
              Top = 40
              Width = 129
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,000000000')
              TabOrder = 0
              WordWrap = False
              IntDigits = 10
              DecDigits = 9
              NumberFormat = fNumber
              Signal = False
              DataField = 'PERCFLUXO'
              DataSource = dsDet
            end
            object dbdtDataFluxoOriginal: TCMDateTimePicker
              Left = 8
              Top = 40
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAFLUXOORIGINAL'
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
              TabOrder = 1
              OnExit = dbdtDataFluxoOriginalExit
            end
            object dbdtDataFluxo: TDBEdit
              Left = 8
              Top = 88
              Width = 121
              Height = 21
              DataField = 'DATAFLUXO'
              DataSource = dsDet
              Enabled = False
              TabOrder = 2
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 410
        inherited tb97BotoesDetalhe: TToolbar97
          inherited sbtnConsDet: TToolbarButton97
            Visible = True
          end
        end
      end
      inherited Dock974: TDock97
        Left = 324
        Height = 198
      end
    end
    inherited pnlTitulo: TPanel
      Width = 418
      inherited lbNomItem: TfcLabel
        Width = 300
        Caption = 'Fluxo do Título de Renda Fixa'
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
    Top = 478
    Width = 420
    inherited TB97oKCancelar: TToolbar97
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
    TargetsData = (
      1
      1
      (
        ''
        'DisplayLabel'
        0))
  end
  inherited dsDet: TwwDataSource
    Left = 277
    Top = 240
  end
  inherited ds: TwwDataSource
    Left = 360
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      '')
    InsertSQL.Strings = (
      '')
    DeleteSQL.Strings = (
      '')
    Left = 371
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'INVESTIMENTO.DESCINVESTIMENTO'
      'CURVASRENFIX.DESCCURVARENFIX'
      'ITEMRENFIX.DESCITEMRENFIX')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Investimento'
      'Perfil'
      'Item')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'FLUXOINVESTRENFIX'
      'CURVASRENFIX'
      'ITEMRENFIX'
      'INVESTIMENTO')
    CamposChave.Strings = (
      'FLUXOINVESTRENFIX.IDINVESTIMENTO'
      'FLUXOINVESTRENFIX.IDCURVARENFIX'
      'FLUXOINVESTRENFIX.IDITEMRENFIX')
    Filtro.Strings = (
      'FLUXOINVESTRENFIX.IDINVESTIMENTO = INVESTIMENTO.IDINVESTIMENTO'
      'FLUXOINVESTRENFIX.IDCURVARENFIX = CURVASRENFIX.IDCURVARENFIX '
      'FLUXOINVESTRENFIX.IDITEMRENFIX = ITEMRENFIX.IDITEMRENFIX')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '40'
      '40'
      '40')
    UsaDistinct = True
  end
  inherited ImlPadrao: TImageList
    Left = 289
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 262
  end
  inherited qry: TwwQuery
    Left = 207
    Top = 11
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 152
    Top = 248
  end
  inherited qryDetalhe: TwwQuery
    SQL.Strings = (
      
        'SELECT IDINVESTIMENTO, IDCURVARENFIX, IDITEMRENFIX, DATAFLUXO,PE' +
        'RCFLUXO, IDFLUXOINVESTRENFIX,DATAFLUXOORIGINAL'
      'FROM   FLUXOINVESTRENFIX'
      'WHERE  IDINVESTIMENTO = :IDINVESTIMENTO AND'
      '       IDCURVARENFIX = :IDCURVARENFIX   AND'
      '       IDITEMRENFIX = :IDITEMRENFIX'
      'ORDER BY DATAFLUXO DESC'
      '    '
      ' '
      ' '
      ' '
      ' ')
    Left = 205
    Top = 240
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCURVARENFIX'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDITEMRENFIX'
        ParamType = ptResult
      end>
    object qryDetalheDATAFLUXO: TDateTimeField
      DisplayLabel = 'Data do Fluxo'
      DisplayWidth = 18
      FieldName = 'DATAFLUXO'
      Origin = 'BASEDADOS.FLUXOINVESTRENFIX.DATAFLUXO'
    end
    object qryDetalhePERCFLUXO: TFloatField
      DisplayLabel = 'Percentual do Fluxo'
      DisplayWidth = 19
      FieldName = 'PERCFLUXO'
      Origin = 'BASEDADOS.FLUXOINVESTRENFIX.PERCFLUXO'
      DisplayFormat = '###,###,###,##0.000000000'
    end
    object qryDetalheIDINVESTIMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINVESTIMENTO'
      Origin = 'BASEDADOS.FLUXOINVESTRENFIX.IDINVESTIMENTO'
      Visible = False
    end
    object qryDetalheIDCURVARENFIX: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCURVARENFIX'
      Origin = 'BASEDADOS.FLUXOINVESTRENFIX.IDCURVARENFIX'
      Visible = False
    end
    object qryDetalheIDITEMRENFIX: TFloatField
      DisplayWidth = 10
      FieldName = 'IDITEMRENFIX'
      Origin = 'BASEDADOS.FLUXOINVESTRENFIX.IDITEMRENFIX'
      Visible = False
    end
    object qryDetalheIDFLUXOINVESTRENFIX: TFloatField
      FieldName = 'IDFLUXOINVESTRENFIX'
      Origin = 'BASEDADOS."CM.FLUXOINVESTRENFIX".IDFLUXOINVESTRENFIX'
    end
    object qryDetalheDATAFLUXOORIGINAL: TDateTimeField
      FieldName = 'DATAFLUXOORIGINAL'
      Origin = 'BASEDADOS.FLUXOINVESTRENFIX.DATAFLUXOORIGINAL'
    end
  end
  inherited updDetalhe: TUpdateSQL
    ModifySQL.Strings = (
      'update FLUXOINVESTRENFIX'
      'set'
      '  PERCFLUXO = :PERCFLUXO'
      'where'
      '  DATAFLUXO = :OLD_DATAFLUXO and'
      '  IDINVESTIMENTO = :OLD_IDINVESTIMENTO and'
      '  IDCURVARENFIX = :OLD_IDCURVARENFIX and'
      '  IDITEMRENFIX = :OLD_IDITEMRENFIX'
      ' ')
    InsertSQL.Strings = (
      'insert into FLUXOINVESTRENFIX'
      
        '  (IDINVESTIMENTO, IDCURVARENFIX, IDITEMRENFIX, DATAFLUXO, PERCF' +
        'LUXO, IDFLUXOINVESTRENFIX,DATAFLUXOORIGINAL)'
      'values'
      
        '  (:IDINVESTIMENTO, :IDCURVARENFIX, :IDITEMRENFIX, :DATAFLUXO, :' +
        'PERCFLUXO, :IDFLUXOINVESTRENFIX,:DATAFLUXOORIGINAL)'
      ' '
      ' '
      ' ')
    DeleteSQL.Strings = (
      'delete from FLUXOINVESTRENFIX'
      'where'
      '  IDINVESTIMENTO = :OLD_IDINVESTIMENTO and'
      '  IDCURVARENFIX = :OLD_IDCURVARENFIX and'
      '  IDITEMRENFIX = :OLD_IDITEMRENFIX')
    Left = 249
    Top = 272
  end
  object qryCurva: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CR.IDCURVARENFIX, CR.DESCCURVARENFIX'
      'FROM'
      '   CURVASRENFIX CR, INVESTXCURVARENFIX IR'
      'WHERE'
      '   CR.IDCURVARENFIX = IR.IDCURVARENFIX AND'
      
        '   (((:IDINVESTIMENTO IS NOT NULL) AND (IR.IDINVESTIMENTO = :IDI' +
        'NVESTIMENTO)) OR'
      '     (:IDINVESTIMENTO IS NULL))'
      ''
      'ORDER BY DESCCURVARENFIX'
      ' ')
    ValidateWithMask = True
    Left = 353
    Top = 145
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
        Value = 255
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptResult
      end>
    object qryCurvaDESCCURVARENFIX: TStringField
      DisplayLabel = 'Curva'
      DisplayWidth = 50
      FieldName = 'DESCCURVARENFIX'
      Origin = 'BASEDADOS.CURVASRENFIX.DESCCURVARENFIX'
      Size = 60
    end
    object qryCurvaIDCURVARENFIX: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCURVARENFIX'
      Origin = 'BASEDADOS.CURVASRENFIX.IDCURVARENFIX'
      Visible = False
    end
  end
  object qryInvestimento: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IV.IDINVESTIMENTO, IV.DESCINVESTIMENTO, IV.IDCLASSETIT, I' +
        'V.IDEMISSOR'
      'FROM   INVESTIMENTO IV, CLASSETITRENFIX CL'
      'WHERE IDTIPOINVEST = 1'
      'AND IV.IDCLASSETIT = CL.IDCLASSETIT'
      'ORDER BY DESCINVESTIMENTO'
      ' ')
    ValidateWithMask = True
    Left = 353
    Top = 106
    object qryInvestimentoDESCINVESTIMENTO: TStringField
      DisplayLabel = 'Investimento'
      DisplayWidth = 50
      FieldName = 'DESCINVESTIMENTO'
      Size = 60
    end
    object qryInvestimentoIDINVESTIMENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINVESTIMENTO'
      Visible = False
    end
    object qryInvestimentoIDCLASSETIT: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCLASSETIT'
      Visible = False
    end
    object qryInvestimentoIDEMISSOR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDEMISSOR'
      Visible = False
    end
  end
  object qryItem: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT IT.IDITEMRENFIX, IT.DESCITEMRENFIX'
      'FROM   ITEMRENFIX IT, CURVASXITEMRENFIX CI'
      'WHERE  IT.IDITEMRENFIX = CI.IDITEMRENFIX AND'
      
        '       (((:IDCURVARENFIX IS NOT NULL) AND (CI.IDCURVARENFIX = :I' +
        'DCURVARENFIX)) OR'
      '         (:IDCURVARENFIX IS NULL))'
      'ORDER BY IT.DESCITEMRENFIX'
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 354
    Top = 185
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCURVARENFIX'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCURVARENFIX'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDCURVARENFIX'
        ParamType = ptResult
      end>
    object qryItemIDITEMRENFIX: TFloatField
      FieldName = 'IDITEMRENFIX'
      Origin = 'BASEDADOS.ITEMRENFIX.IDITEMRENFIX'
    end
    object qryItemDESCITEMRENFIX: TStringField
      FieldName = 'DESCITEMRENFIX'
      Origin = 'BASEDADOS.ITEMRENFIX.DESCITEMRENFIX'
      Size = 60
    end
  end
  object qryExcluiItem: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM FLUXOINVESTRENFIX'
      'WHERE DATAFLUXO = TO_DATE(:DATAFLUXO,'#39'DD/MM/YYYY'#39') AND'
      '      IDINVESTIMENTO = :IDINVESTIMENTO AND'
      '      IDCURVARENFIX = :IDCURVARENFIX AND'
      '      IDITEMRENFIX = :IDITEMRENFIX'
      ' ')
    ValidateWithMask = True
    Left = 306
    Top = 249
    ParamData = <
      item
        DataType = ftString
        Name = 'DATAFLUXO'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'IDCURVARENFIX'
        ParamType = ptOutput
      end
      item
        DataType = ftInteger
        Name = 'IDITEMRENFIX'
        ParamType = ptOutput
      end>
  end
  object qryOperXFluxo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDOPERRENFIX'
      'FROM'
      '   OPERRENFIX'
      'WHERE'
      '   (IDINVESTIMENTO = :IDINVESTIMENTO) AND'
      '   (IDTIPOOPERACAO = :IDTIPOOPERACAO) AND'
      '   (IDOPERRENFIXAPLIC = :IDOPERRENFIXAPLIC) AND'
      '   (DATAOPERACAO = TO_DATE(:dDataRef,'#39'DD/MM/YYYY'#39'))'
      ' ')
    ValidateWithMask = True
    Left = 212
    Top = 136
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDOPERRENFIXAPLIC'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dDataRef'
        ParamType = ptUnknown
      end>
    object FloatField2: TFloatField
      FieldName = 'IDOPERRENFIX'
    end
  end
  object qryOperAplic: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDOPERRENFIXAPLIC,DATAOPERACAO'
      'FROM'
      '   OPERRENFIX'
      'WHERE'
      '   (IDINVESTIMENTO = :IDINVESTIMENTO) AND'
      '   (IDTIPOOPERACAO = :IDTIPOOPERACAO) AND'
      '   (DATAOPERACAO >= TO_DATE(:dDataRef,'#39'DD/MM/YYYY'#39'))'
      '   '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 84
    Top = 136
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDINVESTIMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'dDataRef'
        ParamType = ptUnknown
      end>
    object qryOperAplicIDOPERRENFIXAPLIC: TFloatField
      FieldName = 'IDOPERRENFIXAPLIC'
      Origin = 'BASEDADOS.OPERRENFIX.IDOPERRENFIXAPLIC'
    end
    object qryOperAplicDATAOPERACAO: TDateTimeField
      FieldName = 'DATAOPERACAO'
    end
  end
end
