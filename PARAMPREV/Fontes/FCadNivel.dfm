inherited frmCadNivel: TfrmCadNivel
  Left = 394
  Top = 109
  HelpContext = 160144
  Caption = 'Cadastro de Níveis de Cargo'
  ClientHeight = 414
  ClientWidth = 513
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 513
    Height = 328
    inherited pnlMestre: TPanel
      Width = 511
      Height = 100
      object lblCodigo: TLabel
        Left = 16
        Top = 48
        Width = 93
        Height = 13
        Caption = 'Código do Nível'
      end
      object dbeCodigo: TDBEdit
        Left = 16
        Top = 64
        Width = 121
        Height = 21
        DataField = 'CODIGO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 511
        Height = 41
        Align = alTop
        TabOrder = 1
        object stPatro: TStaticText
          Left = 8
          Top = 8
          Width = 124
          Height = 22
          Caption = 'Patrocinadora :'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindow
          Font.Height = -16
          Font.Name = 'Bookman Old Style'
          Font.Style = [fsItalic]
          ParentColor = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 0
        end
        object stNomePatro: TStaticText
          Left = 133
          Top = 8
          Width = 100
          Height = 22
          Caption = 'stNomePatro'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindow
          Font.Height = -16
          Font.Name = 'Bookman Old Style'
          Font.Style = [fsItalic]
          ParentColor = False
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 1
        end
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 100
      Width = 511
      Height = 227
      Align = alBottom
      Tabs.Strings = (
        'Faixas do Nível')
      inherited pgctrlDetalhe: TPageControl
        Width = 413
        Height = 168
        inherited tbsDet: TTabSheet
          Caption = 'Faixas do Nível'
          inherited pnlControlesDet: TPanel [0]
            Width = 405
            Height = 140
            BevelInner = bvLowered
            object lblDataReferencia: TLabel
              Left = 8
              Top = 12
              Width = 93
              Height = 13
              Caption = 'Data Efetivação'
            end
            object lblValor: TLabel
              Left = 240
              Top = 12
              Width = 30
              Height = 13
              Caption = 'Valor'
            end
            object dbdeDataEfetivacao: TCMDateTimePicker
              Left = 8
              Top = 30
              Width = 121
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAEFETIVACAO'
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
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ShowButton = True
              TabOrder = 0
            end
            object dbeValor: TDBEdit
              Left = 240
              Top = 30
              Width = 121
              Height = 21
              DataField = 'VALOR'
              DataSource = dsDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
            end
          end
          inherited dbgrdDet: TwwDBGrid [1]
            Width = 405
            Height = 140
            Selected.Strings = (
              'DATAEFETIVACAO'#9'10'#9'Data Efetivação'#9'No'
              'VALOR'#9'10'#9'Valor'#9'No')
            Font.Style = []
            ParentFont = False
          end
        end
      end
      inherited Dock973: TDock97
        Width = 503
      end
      inherited Dock974: TDock97
        Left = 417
        Height = 168
      end
    end
  end
  inherited Dock972: TDock97
    Width = 513
  end
  inherited Dock971: TDock97
    Top = 375
    Width = 513
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      2
      (
        ''
        'Text'
        0)
      (
        ''
        'Filter'
        0))
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 383
    Top = 10
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update NIVEL'
      'set'
      '  IDPESSJUR = :IDPESSJUR,'
      '  IDNIVEL = :IDNIVEL,'
      '  CODIGO = :CODIGO'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDNIVEL = :OLD_IDNIVEL')
    InsertSQL.Strings = (
      'insert into NIVEL'
      '  (IDPESSJUR, IDNIVEL, CODIGO)'
      'values'
      '  (:IDPESSJUR, :IDNIVEL, :CODIGO)')
    DeleteSQL.Strings = (
      'delete from NIVEL'
      'where'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDNIVEL = :OLD_IDNIVEL')
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'NIVEL.CODIGO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Código')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'NIVEL')
    CamposChave.Strings = (
      'NIVEL.IDPESSJUR'
      'NIVEL.IDNIVEL')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '15')
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 310
    Top = 4
  end
  inherited qry: TwwQuery
    BeforePost = qryBeforePost
    AfterScroll = qryAfterScroll
    SQL.Strings = (
      'SELECT IDPESSJUR, IDNIVEL, CODIGO'
      'FROM   NIVEL'
      'WHERE  IDPESSJUR = :IDPESSJUR'
      'AND    IDNIVEL   = :IDNIVEL')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDNIVEL'
        ParamType = ptUnknown
      end>
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 408
    Top = 108
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update FAIXANIVEL'
      'set'
      '  IDNIVEL = :IDNIVEL,'
      '  IDPESSJUR = :IDPESSJUR,'
      '  IDFAIXASALEXT = :IDFAIXASALEXT,'
      '  DATAEFETIVACAO = :DATAEFETIVACAO,'
      '  VALOR = :VALOR'
      'where'
      '  IDNIVEL = :OLD_IDNIVEL and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDFAIXASALEXT = :OLD_IDFAIXASALEXT and'
      '  DATAEFETIVACAO = :OLD_DATAEFETIVACAO')
    InsertSQL.Strings = (
      'insert into FAIXANIVEL'
      '  (IDNIVEL, IDPESSJUR, IDFAIXASALEXT, DATAEFETIVACAO, VALOR)'
      'values'
      
        '  (:IDNIVEL, :IDPESSJUR, :IDFAIXASALEXT, :DATAEFETIVACAO, :VALOR' +
        ')')
    DeleteSQL.Strings = (
      'delete from FAIXANIVEL'
      'where'
      '  IDNIVEL = :OLD_IDNIVEL and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDFAIXASALEXT = :OLD_IDFAIXASALEXT and'
      '  DATAEFETIVACAO = :OLD_DATAEFETIVACAO')
    Left = 416
    Top = 9
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    BeforePost = qryDetBeforePost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  IDPESSJUR, IDNIVEL, IDFAIXASALEXT, DATAEFETIVACAO, VALOR'
      'FROM    FAIXANIVEL'
      'WHERE   IDPESSJUR = :IDPESSJUR'
      'AND     IDNIVEL   = :IDNIVEL'
      'ORDER BY DATAEFETIVACAO DESC')
    UpdateObject = updDet
    ValidateWithMask = True
    Left = 456
    Top = 9
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
        Value = '91008'
      end
      item
        DataType = ftFloat
        Name = 'IDNIVEL'
        ParamType = ptUnknown
        Value = 1832
      end>
    object qryDetDATAEFETIVACAO: TDateTimeField
      DisplayLabel = 'Data Efetivação'
      DisplayWidth = 10
      FieldName = 'DATAEFETIVACAO'
      Origin = 'FAIXANIVEL.DATAEFETIVACAO'
    end
    object qryDetVALOR: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 10
      FieldName = 'VALOR'
      Origin = 'FAIXANIVEL.VALOR'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryDetIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
      Origin = 'FAIXANIVEL.IDPESSJUR'
      Visible = False
    end
    object qryDetIDNIVEL: TFloatField
      FieldName = 'IDNIVEL'
      Origin = 'FAIXANIVEL.IDNIVEL'
      Visible = False
    end
    object qryDetIDFAIXASALEXT: TFloatField
      FieldName = 'IDFAIXASALEXT'
      Origin = 'FAIXANIVEL.IDFAIXASALEXT'
      Visible = False
    end
  end
  object qryFaixaAux: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  IDPESSJUR, IDNIVEL, IDFAIXASALEXT, DATAEFETIVACAO, VALOR'
      'FROM    FAIXANIVEL'
      'WHERE   IDPESSJUR = :IDPESSJUR'
      'AND     IDNIVEL   = :IDNIVEL'
      'ORDER BY DATAEFETIVACAO DESC')
    UpdateObject = updFaixaAux
    ValidateWithMask = True
    Left = 261
    Top = 107
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDNIVEL'
        ParamType = ptUnknown
      end>
  end
  object updFaixaAux: TUpdateSQL
    ModifySQL.Strings = (
      'update FAIXANIVEL'
      'set'
      '  IDNIVEL = :IDNIVEL,'
      '  IDPESSJUR = :IDPESSJUR,'
      '  IDFAIXASALEXT = :IDFAIXASALEXT,'
      '  DATAEFETIVACAO = :DATAEFETIVACAO,'
      '  VALOR = :VALOR'
      'where'
      '  IDNIVEL = :OLD_IDNIVEL and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDFAIXASALEXT = :OLD_IDFAIXASALEXT and'
      '  DATAEFETIVACAO = :OLD_DATAEFETIVACAO')
    InsertSQL.Strings = (
      'insert into FAIXANIVEL'
      '  (IDNIVEL, IDPESSJUR, IDFAIXASALEXT, DATAEFETIVACAO, VALOR)'
      'values'
      
        '  (:IDNIVEL, :IDPESSJUR, :IDFAIXASALEXT, :DATAEFETIVACAO, :VALOR' +
        ')')
    DeleteSQL.Strings = (
      'delete from FAIXANIVEL'
      'where'
      '  IDNIVEL = :OLD_IDNIVEL and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDFAIXASALEXT = :OLD_IDFAIXASALEXT and'
      '  DATAEFETIVACAO = :OLD_DATAEFETIVACAO')
    Left = 373
    Top = 91
  end
  object dsFaixaAux: TwwDataSource
    AutoEdit = False
    DataSet = qryFaixaAux
    Left = 316
    Top = 100
  end
  object qryVerificaNivel: TQuery
    DatabaseName = 'BaseDados'
    Left = 153
    Top = 128
  end
end
