inherited frmCadMsgBoleto: TfrmCadMsgBoleto
  Left = 139
  Top = 27
  HelpContext = 640013
  Caption = 'Mensagens Padrão para Boletos Bancários'
  ClientHeight = 423
  ClientWidth = 541
  PixelsPerInch = 96
  TextHeight = 13
  object Label14: TLabel [0]
    Left = 12
    Top = 284
    Width = 48
    Height = 13
    Caption = '<totpar>'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label15: TLabel [1]
    Left = 99
    Top = 284
    Width = 112
    Height = 13
    Caption = '= Total de Parcelas'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clBlue
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited pnlFundo: TPanel
    Width = 541
    Height = 355
    inherited dbGrd: TwwDBGrid [0]
      Width = 539
      Height = 353
      Selected.Strings = (
        'MSGDESCRICAO'#9'72'#9'Descrição')
    end
    inherited pnlControles: TPanel [1]
      Width = 539
      Height = 353
      object Label1: TLabel
        Left = 16
        Top = 10
        Width = 140
        Height = 13
        Caption = 'Descrição da Mensagem'
      end
      object Bevel1: TBevel
        Left = 16
        Top = 58
        Width = 505
        Height = 3
        Shape = bsTopLine
      end
      object Label2: TLabel
        Left = 16
        Top = 76
        Width = 47
        Height = 13
        Caption = 'Linha 1:'
      end
      object Label3: TLabel
        Left = 16
        Top = 97
        Width = 47
        Height = 13
        Caption = 'Linha 2:'
      end
      object Label4: TLabel
        Left = 16
        Top = 118
        Width = 47
        Height = 13
        Caption = 'Linha 3:'
      end
      object Label5: TLabel
        Left = 16
        Top = 139
        Width = 47
        Height = 13
        Caption = 'Linha 4:'
      end
      object Label6: TLabel
        Left = 16
        Top = 160
        Width = 47
        Height = 13
        Caption = 'Linha 5:'
      end
      object Label7: TLabel
        Left = 16
        Top = 181
        Width = 47
        Height = 13
        Caption = 'Linha 6:'
      end
      object Label8: TLabel
        Left = 16
        Top = 202
        Width = 47
        Height = 13
        Caption = 'Linha 7:'
      end
      object Label9: TLabel
        Left = 16
        Top = 223
        Width = 47
        Height = 13
        Caption = 'Linha 8:'
      end
      object Label10: TLabel
        Left = 16
        Top = 244
        Width = 47
        Height = 13
        Caption = 'Linha 9:'
      end
      object Bevel3: TBevel
        Left = 14
        Top = 335
        Width = 507
        Height = 3
        Shape = bsTopLine
      end
      object Label23: TLabel
        Left = 12
        Top = 267
        Width = 57
        Height = 13
        Caption = '<parcela>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label24: TLabel
        Left = 81
        Top = 267
        Width = 94
        Height = 13
        Caption = '= Nr. da Parcela'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label49: TLabel
        Left = 258
        Top = 267
        Width = 42
        Height = 13
        Caption = '<juros>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label25: TLabel
        Left = 333
        Top = 267
        Width = 93
        Height = 13
        Caption = '= Valor do Juros'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label11: TLabel
        Left = 258
        Top = 284
        Width = 45
        Height = 13
        Caption = '<multa>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label27: TLabel
        Left = 333
        Top = 284
        Width = 94
        Height = 13
        Caption = '= Valor da Multa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label12: TLabel
        Left = 258
        Top = 301
        Width = 57
        Height = 13
        Caption = '<periodo>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label13: TLabel
        Left = 333
        Top = 301
        Width = 187
        Height = 13
        Caption = '= Periodicidade do juros de mora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label17: TLabel
        Left = 81
        Top = 284
        Width = 112
        Height = 13
        Caption = '= Total de Parcelas'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label16: TLabel
        Left = 12
        Top = 284
        Width = 63
        Height = 13
        Caption = '<parcelas>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label18: TLabel
        Left = 12
        Top = 300
        Width = 58
        Height = 13
        Caption = '<perparc>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label19: TLabel
        Left = 81
        Top = 300
        Width = 154
        Height = 13
        Caption = '= Periodicidade da Parcela'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label20: TLabel
        Left = 12
        Top = 316
        Width = 51
        Height = 13
        Caption = '<imovel>'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label21: TLabel
        Left = 81
        Top = 316
        Width = 145
        Height = 13
        Caption = '= Nome do Imóvel Mestre'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbedDescricao: TDBEdit
        Left = 16
        Top = 24
        Width = 505
        Height = 21
        DataField = 'MSGDESCRICAO'
        DataSource = ds
        TabOrder = 0
      end
      object DBedtLinha1: TDBEdit
        Left = 72
        Top = 72
        Width = 449
        Height = 21
        DataField = 'TEXTOLINHA_1'
        DataSource = ds
        TabOrder = 1
      end
      object DBedtLinha2: TDBEdit
        Left = 72
        Top = 93
        Width = 449
        Height = 21
        DataField = 'TEXTOLINHA_2'
        DataSource = ds
        TabOrder = 2
      end
      object DBedtLinha3: TDBEdit
        Left = 72
        Top = 114
        Width = 449
        Height = 21
        DataField = 'TEXTOLINHA_3'
        DataSource = ds
        TabOrder = 3
      end
      object DBedtLinha4: TDBEdit
        Left = 72
        Top = 135
        Width = 449
        Height = 21
        DataField = 'TEXTOLINHA_4'
        DataSource = ds
        TabOrder = 4
      end
      object DBedtLinha5: TDBEdit
        Left = 72
        Top = 156
        Width = 449
        Height = 21
        DataField = 'TEXTOLINHA_5'
        DataSource = ds
        TabOrder = 5
      end
      object DBedtLinha6: TDBEdit
        Left = 72
        Top = 177
        Width = 449
        Height = 21
        DataField = 'TEXTOLINHA_6'
        DataSource = ds
        TabOrder = 6
      end
      object DBedtLinha7: TDBEdit
        Left = 72
        Top = 198
        Width = 449
        Height = 21
        DataField = 'TEXTOLINHA_7'
        DataSource = ds
        TabOrder = 7
      end
      object DBedtLinha8: TDBEdit
        Left = 72
        Top = 219
        Width = 449
        Height = 21
        DataField = 'TEXTOLINHA_8'
        DataSource = ds
        TabOrder = 8
      end
      object DBedtLinha9: TDBEdit
        Left = 72
        Top = 240
        Width = 449
        Height = 21
        DataField = 'TEXTOLINHA_9'
        DataSource = ds
        TabOrder = 9
      end
    end
  end
  inherited Dock972: TDock97
    Width = 541
    inherited Toolbar971: TToolbar97
      inherited ToolbarSep972: TToolbarSep97
        Visible = False
      end
      inherited btnRefresh: TToolbarButton97
        Enabled = False
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 390
    Width = 541
    inherited tb97Fundo: TToolbar97
      Left = 369
      DockPos = 389
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 197
      DockPos = 217
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    OnDataChange = dsDataChange
    Left = 488
    Top = 53
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update MSGBOLETO'
      'set'
      '  MSGDESCRICAO = :MSGDESCRICAO,'
      '  IDDOCUMENTO = :IDDOCUMENTO,'
      '  IDMODULO = :IDMODULO'
      'where'
      '  IDMSGBOLETO = :OLD_IDMSGBOLETO')
    InsertSQL.Strings = (
      'insert into MSGBOLETO'
      '  (IDMSGBOLETO, MSGDESCRICAO, IDDOCUMENTO, IDMODULO)'
      'values'
      '  (:IDMSGBOLETO, :MSGDESCRICAO, :IDDOCUMENTO, :IDMODULO)')
    DeleteSQL.Strings = (
      'delete from MSGBOLETO'
      'where'
      '  IDMSGBOLETO = :OLD_IDMSGBOLETO')
    Left = 424
    Top = 53
  end
  inherited MontaSelect: TMontaSelect
    Left = 984
    Top = 64
  end
  inherited ImlPadrao: TImageList
    Left = 985
    Top = 6
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 326
    Top = 50
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '   M.IDMSGBOLETO, M.MSGDESCRICAO, M.IDDOCUMENTO, M.IDMODULO, '
      '   L1.LMBNUMLINHA AS LINHA_1, L1.LMBTEXTOLINHA AS TEXTOLINHA_1,'
      '   L2.LMBNUMLINHA AS LINHA_2, L2.LMBTEXTOLINHA AS TEXTOLINHA_2,'
      '   L3.LMBNUMLINHA AS LINHA_3, L3.LMBTEXTOLINHA AS TEXTOLINHA_3,'
      '   L4.LMBNUMLINHA AS LINHA_4, L4.LMBTEXTOLINHA AS TEXTOLINHA_4,'
      '   L5.LMBNUMLINHA AS LINHA_5, L5.LMBTEXTOLINHA AS TEXTOLINHA_5,'
      '   L6.LMBNUMLINHA AS LINHA_6, L6.LMBTEXTOLINHA AS TEXTOLINHA_6,'
      '   L7.LMBNUMLINHA AS LINHA_7, L7.LMBTEXTOLINHA AS TEXTOLINHA_7,'
      '   L8.LMBNUMLINHA AS LINHA_8, L8.LMBTEXTOLINHA AS TEXTOLINHA_8,'
      '   L9.LMBNUMLINHA AS LINHA_9, L9.LMBTEXTOLINHA AS TEXTOLINHA_9'
      ''
      'FROM'
      '   MSGBOLETO M,'
      ''
      '   ('
      '   SELECT   IDMSGBOLETO, LMBNUMLINHA, LMBTEXTOLINHA'
      '   FROM     LINHAMSGBOLETO'
      '   WHERE    LMBNUMLINHA = 1'
      '   ) L1,'
      ''
      '   ('
      '   SELECT   IDMSGBOLETO, LMBNUMLINHA, LMBTEXTOLINHA'
      '   FROM     LINHAMSGBOLETO'
      '   WHERE    LMBNUMLINHA = 2'
      '   ) L2,'
      ''
      '   ('
      '   SELECT   IDMSGBOLETO, LMBNUMLINHA, LMBTEXTOLINHA'
      '   FROM     LINHAMSGBOLETO'
      '   WHERE    LMBNUMLINHA = 3'
      '   ) L3,'
      ''
      '   ('
      '   SELECT   IDMSGBOLETO, LMBNUMLINHA, LMBTEXTOLINHA'
      '   FROM     LINHAMSGBOLETO'
      '   WHERE    LMBNUMLINHA = 4'
      '   ) L4,'
      ''
      '   ('
      '   SELECT   IDMSGBOLETO, LMBNUMLINHA, LMBTEXTOLINHA'
      '   FROM     LINHAMSGBOLETO'
      '   WHERE    LMBNUMLINHA = 5'
      '   ) L5,'
      ''
      '   ('
      '   SELECT   IDMSGBOLETO, LMBNUMLINHA, LMBTEXTOLINHA'
      '   FROM     LINHAMSGBOLETO'
      '   WHERE    LMBNUMLINHA = 6'
      '   ) L6,'
      ''
      '   ('
      '   SELECT   IDMSGBOLETO, LMBNUMLINHA, LMBTEXTOLINHA'
      '   FROM     LINHAMSGBOLETO'
      '   WHERE    LMBNUMLINHA = 7'
      '   ) L7,'
      ''
      '   ('
      '   SELECT   IDMSGBOLETO, LMBNUMLINHA, LMBTEXTOLINHA'
      '   FROM     LINHAMSGBOLETO'
      '   WHERE    LMBNUMLINHA = 8'
      '   ) L8,'
      ''
      '   ('
      '   SELECT   IDMSGBOLETO, LMBNUMLINHA, LMBTEXTOLINHA'
      '   FROM     LINHAMSGBOLETO'
      '   WHERE    LMBNUMLINHA = 9'
      '   ) L9'
      ''
      'WHERE'
      '   ( M.IDDOCUMENTO IS NULL )'
      '   AND ( M.IDMODULO = :PIDMODULO )'
      '   AND ( M.IDMSGBOLETO = L1.IDMSGBOLETO(+) )'
      '   AND ( M.IDMSGBOLETO = L2.IDMSGBOLETO(+) )'
      '   AND ( M.IDMSGBOLETO = L3.IDMSGBOLETO(+) )'
      '   AND ( M.IDMSGBOLETO = L4.IDMSGBOLETO(+) )'
      '   AND ( M.IDMSGBOLETO = L5.IDMSGBOLETO(+) )'
      '   AND ( M.IDMSGBOLETO = L6.IDMSGBOLETO(+) )'
      '   AND ( M.IDMSGBOLETO = L7.IDMSGBOLETO(+) )'
      '   AND ( M.IDMSGBOLETO = L8.IDMSGBOLETO(+) )'
      '   AND ( M.IDMSGBOLETO = L9.IDMSGBOLETO(+) )'
      ''
      'ORDER BY'
      '   M.MSGDESCRICAO'
      ''
      '')
    Left = 456
    Top = 53
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDMODULO'
        ParamType = ptUnknown
      end>
    object qryMSGDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 72
      FieldName = 'MSGDESCRICAO'
      Size = 60
    end
    object qryIDMSGBOLETO: TFloatField
      FieldName = 'IDMSGBOLETO'
      Visible = False
    end
    object qryIDDOCUMENTO: TFloatField
      FieldName = 'IDDOCUMENTO'
      Visible = False
    end
    object qryLINHA_1: TFloatField
      FieldName = 'LINHA_1'
      Visible = False
    end
    object qryTEXTOLINHA_1: TStringField
      FieldName = 'TEXTOLINHA_1'
      Visible = False
      Size = 69
    end
    object qryLINHA_2: TFloatField
      FieldName = 'LINHA_2'
      Visible = False
    end
    object qryTEXTOLINHA_2: TStringField
      FieldName = 'TEXTOLINHA_2'
      Visible = False
      Size = 69
    end
    object qryLINHA_3: TFloatField
      FieldName = 'LINHA_3'
      Visible = False
    end
    object qryTEXTOLINHA_3: TStringField
      FieldName = 'TEXTOLINHA_3'
      Visible = False
      Size = 69
    end
    object qryLINHA_4: TFloatField
      FieldName = 'LINHA_4'
      Visible = False
    end
    object qryTEXTOLINHA_4: TStringField
      FieldName = 'TEXTOLINHA_4'
      Visible = False
      Size = 69
    end
    object qryLINHA_5: TFloatField
      FieldName = 'LINHA_5'
      Visible = False
    end
    object qryTEXTOLINHA_5: TStringField
      FieldName = 'TEXTOLINHA_5'
      Visible = False
      Size = 69
    end
    object qryLINHA_6: TFloatField
      FieldName = 'LINHA_6'
      Visible = False
    end
    object qryTEXTOLINHA_6: TStringField
      FieldName = 'TEXTOLINHA_6'
      Visible = False
      Size = 69
    end
    object qryLINHA_7: TFloatField
      FieldName = 'LINHA_7'
      Visible = False
    end
    object qryTEXTOLINHA_7: TStringField
      FieldName = 'TEXTOLINHA_7'
      Visible = False
      Size = 69
    end
    object qryLINHA_8: TFloatField
      FieldName = 'LINHA_8'
      Visible = False
    end
    object qryTEXTOLINHA_8: TStringField
      FieldName = 'TEXTOLINHA_8'
      Visible = False
      Size = 69
    end
    object qryLINHA_9: TFloatField
      FieldName = 'LINHA_9'
      Visible = False
    end
    object qryTEXTOLINHA_9: TStringField
      FieldName = 'TEXTOLINHA_9'
      Visible = False
      Size = 69
    end
    object qryIDMODULO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDMODULO'
      Visible = False
    end
  end
  object qryDeleteLinha: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM'
      '   LINHAMSGBOLETO'
      'WHERE'
      '   ( IDMSGBOLETO =:MSG )'
      '   AND ( LMBNUMLINHA =:LINHA )')
    ValidateWithMask = True
    Left = 448
    Top = 212
    ParamData = <
      item
        DataType = ftInteger
        Name = 'MSG'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'LINHA'
        ParamType = ptUnknown
      end>
  end
  object qryUpdateLinha: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   LINHAMSGBOLETO'
      'SET'
      '   LMBTEXTOLINHA =:TEXTO'
      'WHERE'
      '   ( IDMSGBOLETO =:MSG )'
      '   AND ( LMBNUMLINHA =:LINHA )')
    ValidateWithMask = True
    Left = 448
    Top = 200
    ParamData = <
      item
        DataType = ftString
        Name = 'TEXTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'MSG'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'LINHA'
        ParamType = ptUnknown
      end>
  end
  object qryInsertLinha: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO'
      '   LINHAMSGBOLETO'
      '   (IDMSGBOLETO, LMBNUMLINHA, LMBTEXTOLINHA)'
      'VALUES'
      '   (:MSG, :LINHA, :TEXTO)')
    ValidateWithMask = True
    Left = 448
    Top = 188
    ParamData = <
      item
        DataType = ftInteger
        Name = 'MSG'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'LINHA'
        ParamType = ptUnknown
      end
      item
        DataType = ftSmallint
        Name = 'TEXTO'
        ParamType = ptUnknown
      end>
  end
  object qryVerificaOcorrencia: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDMSGBOLETO, MSGDESCRICAO'
      'FROM'
      '  MSGBOLETO'
      'WHERE'
      '  ( LOWER(MSGDESCRICAO) =:DESCRICAO )')
    ValidateWithMask = True
    Left = 200
    Top = 52
    ParamData = <
      item
        DataType = ftString
        Name = 'DESCRICAO'
        ParamType = ptUnknown
      end>
  end
  object qryVerificaLinha: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO'
      '   LINHAMSGBOLETO'
      '   (IDMSGBOLETO, LMBNUMLINHA, LMBTEXTOLINHA)'
      'VALUES'
      '   (:MSG, :LINHA, :TEXTO)')
    ValidateWithMask = True
    Left = 448
    Top = 176
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'MSG'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'LINHA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'TEXTO'
        ParamType = ptUnknown
      end>
  end
end
