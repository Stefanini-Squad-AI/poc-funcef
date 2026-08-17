inherited frmCadGrupoFuncional: TfrmCadGrupoFuncional
  Left = 169
  Top = 252
  HelpContext = 160143
  Caption = 'Cadastro de Grupo de Função'
  ClientHeight = 448
  ClientWidth = 702
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 702
    Height = 362
    inherited pnlMestre: TPanel
      Width = 700
      Height = 122
      object lblCodigo: TLabel
        Left = 11
        Top = 36
        Width = 40
        Height = 13
        Caption = 'Código'
      end
      object lblNome: TLabel
        Left = 11
        Top = 76
        Width = 33
        Height = 13
        Caption = 'Nome'
      end
      object Panel1: TPanel
        Left = 0
        Top = 0
        Width = 700
        Height = 33
        Align = alTop
        TabOrder = 0
        object stPatro: TStaticText
          Left = 8
          Top = 8
          Width = 112
          Height = 23
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
          Width = 98
          Height = 23
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
      object dbeCodigo: TDBEdit
        Left = 11
        Top = 52
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
        TabOrder = 1
      end
      object dbeNome: TDBEdit
        Left = 11
        Top = 91
        Width = 393
        Height = 21
        DataField = 'NOME'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 123
      Width = 700
      Tabs.Strings = (
        'Faixas do Grupo')
      inherited pgctrlDetalhe: TPageControl
        Width = 602
        inherited tbsDet: TTabSheet
          Caption = 'Faixas do Grupo'
          inherited pnlControlesDet: TPanel [0]
            Width = 594
            BevelOuter = bvLowered
            object lblDtEfetivacao: TLabel
              Left = 24
              Top = 12
              Width = 93
              Height = 13
              Caption = 'Data Efetivação'
            end
            object lblValor: TLabel
              Left = 216
              Top = 12
              Width = 30
              Height = 13
              Caption = 'Valor'
            end
            object Label1: TLabel
              Left = 216
              Top = 54
              Width = 96
              Height = 13
              Caption = 'Piso de Mercado'
            end
            object Label2: TLabel
              Left = 216
              Top = 100
              Width = 162
              Height = 13
              Caption = 'Piso de Mercado Licenciado'
            end
            object dbeValor: TDBEdit
              Left = 216
              Top = 28
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
            object dbdeDataEfetivacao: TCMDateTimePicker
              Left = 24
              Top = 26
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
            object dbePisoMercado: TDBEdit
              Left = 216
              Top = 70
              Width = 121
              Height = 21
              DataField = 'PISOMERCADO'
              DataSource = dsDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
            end
            object dbePisoMercadoLic: TDBEdit
              Left = 216
              Top = 116
              Width = 121
              Height = 21
              DataField = 'PISOMERCADOLIC'
              DataSource = dsDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 3
            end
          end
          inherited dbgrdDet: TwwDBGrid [1]
            Width = 594
            Selected.Strings = (
              'DATAEFETIVACAO'#9'14'#9'Data Efetivação'
              'VALORNAOPCC'#9'15'#9'Valor'
              'VALORPCC'#9'15'#9'Valor PCC'
              'PISOMERCADO'#9'10'#9'Piso de Mercado'
              'PISOMERCADOLIC'#9'10'#9'Piso de Mercado dos Lic.'#9'F')
          end
        end
      end
      inherited Dock973: TDock97
        Width = 692
      end
      inherited Dock974: TDock97
        Left = 606
      end
    end
  end
  inherited Dock972: TDock97
    Width = 702
  end
  inherited Dock971: TDock97
    Top = 409
    Width = 702
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 14
    Top = 368
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 374
    Top = 4
  end
  inherited ds: TwwDataSource
    Left = 331
    Top = 4
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update GRUPOFUNC'
      'set'
      '  CODIGO = :CODIGO,'
      '  NOME = :NOME'
      'where'
      '  IDGRUPOFUNC = :OLD_IDGRUPOFUNC and'
      '  IDPESSJUR = :OLD_IDPESSJUR')
    InsertSQL.Strings = (
      'insert into GRUPOFUNC'
      '  (IDGRUPOFUNC, IDPESSJUR, CODIGO, NOME)'
      'values'
      '  (:IDGRUPOFUNC, :IDPESSJUR, :CODIGO, :NOME)')
    DeleteSQL.Strings = (
      'delete from GRUPOFUNC'
      'where'
      '  IDGRUPOFUNC = :OLD_IDGRUPOFUNC and'
      '  IDPESSJUR = :OLD_IDPESSJUR')
    Left = 289
    Top = 4
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Grupo de Função '
    Colunas.Strings = (
      'GRUPOFUNC.CODIGO'
      'GRUPOFUNC.NOME')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Nome')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'GRUPOFUNC')
    CamposChave.Strings = (
      'GRUPOFUNC.IDPESSJUR'
      'GRUPOFUNC.IDGRUPOFUNC')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '15'
      '60')
    ExibePergunta = False
    Left = 374
    Top = 91
  end
  inherited ImlPadrao: TImageList
    Left = 56
    Top = 368
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 459
    Top = 91
  end
  inherited qry: TwwQuery
    AfterScroll = qryAfterScroll
    SQL.Strings = (
      'SELECT GF.IDGRUPOFUNC,'
      '       GF.IDPESSJUR,'
      '       GF.CODIGO,'
      '       GF.NOME,'
      '       NVL(CE.FLGPCC,0) AS FLGPCC'
      'FROM   GRUPOFUNC GF, GRUPOCARGOEXT GC, CARGOEXT CE'
      'WHERE GF.IDPESSJUR   = :IDPESSJUR'
      '  AND GF.IDGRUPOFUNC = :IDGRUPOFUNC'
      '  AND GF.IDGRUPOFUNC = GC.IDGRUPOFUNC(+)'
      '  AND GC.IDCARGOEXT  = CE.IDCARGOEXT(+)'
      ''
      ' ')
    Left = 246
    Top = 4
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDGRUPOFUNC'
        ParamType = ptUnknown
      end>
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 459
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    AfterOpen = qryDetAfterOpen
    BeforePost = qryDetBeforePost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT TABVALOR.IDFAIXASALEXT,'
      '       TABVALOR.DATAEFETIVACAO,'
      '       TABVALOR.IDGRUPOFUNC,'
      '       TABVALOR.IDPESSJUR,'
      '       TABFUNC.FLGPCC,'
      '       DECODE(TABFUNC.FLGPCC, 1, TABVALOR.VALOR,0 ) AS VALORPCC,'
      
        '       DECODE(TABFUNC.FLGPCC, 1, 0, TABVALOR.VALOR) AS VALORNAOP' +
        'CC,'
      '       TABVALOR.VALOR,'
      
        '    -- NVL(DECODE(TABFUNC.FLGPCC, 1, TABVALOR.PISOMERCADO , 0), ' +
        '0) AS PISOMERCADO,'
      '       NVL(TABVALOR.PISOMERCADO, 0) AS PISOMERCADO,'
      
        '    -- NVL(DECODE(TABFUNC.FLGPCC, 1, TABVALOR.PISOMERCADOLIC, 0)' +
        ', 0) AS PISOMERCADOLIC'
      '       NVL(TABVALOR.PISOMERCADOLIC, 0) AS PISOMERCADOLIC'
      'FROM   GRUPOCARGOEXT TABGRUPO,'
      '             FAIXAGRUPO TABVALOR,'
      '             CARGOEXT  TABFUNC'
      'WHERE  TABVALOR.IDGRUPOFUNC       = :IDGRUPOFUNC'
      '      AND  TABVALOR.IDPESSJUR             = :IDPESSJUR'
      '      AND  TABGRUPO.IDPESSJUR(+)        = TABVALOR.IDPESSJUR'
      '      AND  TABGRUPO.IDGRUPOFUNC(+)  = TABVALOR.IDGRUPOFUNC'
      '      AND  TABGRUPO.IDPESSJUR            = TABFUNC.IDPESSJUR(+)'
      '      AND  TABGRUPO.IDCARGOEXT         = TABFUNC.IDCARGOEXT(+)'
      'ORDER BY TABVALOR.DATAEFETIVACAO DESC'
      ' '
      ''
      ' '
      ' '
      ' ')
    UpdateObject = updDet
    ValidateWithMask = True
    Left = 416
    Top = 4
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDGRUPOFUNC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end>
    object qryDetDATAEFETIVACAO: TDateTimeField
      DisplayLabel = 'Data Efetivação'
      DisplayWidth = 14
      FieldName = 'DATAEFETIVACAO'
    end
    object qryDetVALORNAOPCC: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 15
      FieldName = 'VALORNAOPCC'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryDetVALORPCC: TFloatField
      DisplayLabel = 'Valor PCC'
      DisplayWidth = 15
      FieldName = 'VALORPCC'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryDetPISOMERCADO: TFloatField
      DisplayLabel = 'Piso de Mercado'
      DisplayWidth = 10
      FieldName = 'PISOMERCADO'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryDetPISOMERCADOLIC: TFloatField
      DisplayLabel = 'Piso de Mercado dos Lic.'
      DisplayWidth = 10
      FieldName = 'PISOMERCADOLIC'
      DisplayFormat = '###,###,###,##0.00'
    end
    object qryDetIDFAIXASALEXT: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFAIXASALEXT'
      Visible = False
    end
    object qryDetIDGRUPOFUNC: TFloatField
      DisplayWidth = 10
      FieldName = 'IDGRUPOFUNC'
      Visible = False
    end
    object qryDetIDPESSJUR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSJUR'
      Visible = False
    end
    object qryDetFLGPCC: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGPCC'
      Visible = False
    end
    object qryDetVALOR: TFloatField
      DisplayWidth = 10
      FieldName = 'VALOR'
      Visible = False
      DisplayFormat = '###,###,###,##0.00'
    end
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update FAIXAGRUPO'
      'set'
      '  DATAEFETIVACAO = :DATAEFETIVACAO,'
      '  VALOR = :VALOR, '
      '  PISOMERCADO = :PISOMERCADO,'
      '  PISOMERCADOLIC = :PISOMERCADOLIC'
      'where'
      '  IDGRUPOFUNC  = :OLD_IDGRUPOFUNC and'
      '  IDPESSJUR        = :OLD_IDPESSJUR        and'
      '  IDFAIXASALEXT = :OLD_IDFAIXASALEXT')
    InsertSQL.Strings = (
      'insert into FAIXAGRUPO'
      
        '  (IDGRUPOFUNC, IDPESSJUR, IDFAIXASALEXT, DATAEFETIVACAO, VALOR,' +
        ' PISOMERCADO, PISOMERCADOLIC)'
      'values'
      
        '  (:IDGRUPOFUNC, :IDPESSJUR, :IDFAIXASALEXT, :DATAEFETIVACAO, :V' +
        'ALOR, :PISOMERCADO, :PISOMERCADOLIC)')
    DeleteSQL.Strings = (
      'delete from FAIXAGRUPO'
      'where'
      '  IDGRUPOFUNC = :OLD_IDGRUPOFUNC and'
      '  IDPESSJUR = :OLD_IDPESSJUR and'
      '  IDFAIXASALEXT = :OLD_IDFAIXASALEXT')
    Left = 459
    Top = 4
  end
end
