inherited FrmImportaCxCotMovSAF: TFrmImportaCxCotMovSAF
  Left = 455
  Top = 184
  HelpContext = 790009
  Caption = 'Importação de Dados'
  ClientHeight = 398
  ClientWidth = 452
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 452
    Height = 359
    inherited bvlSepTit: TBevel
      Top = 49
      Width = 450
    end
    inherited pnlTitulo: TPanel
      Width = 450
      Height = 48
      inherited lbNomDescricao: TfcLabel
        Left = 15
        Top = 13
        Width = 127
        Caption = 'Caixa e Cota'
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 52
      Width = 450
      Height = 306
      Align = alClient
      TabOrder = 1
      object Label1: TLabel
        Left = 12
        Top = 112
        Width = 197
        Height = 13
        Caption = 'Indique o Caminho para o Arquivo '
      end
      object SB1: TSpeedButton
        Left = 407
        Top = 125
        Width = 22
        Height = 23
        Hint = 'Buscar Arquivo '
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
        Left = 12
        Top = 67
        Width = 123
        Height = 13
        Caption = 'Plano Contab X Patro'
      end
      object Label2: TLabel
        Left = 12
        Top = 23
        Width = 100
        Height = 13
        Caption = 'Bolsa de Valores '
      end
      object LblCaixaCota: TLabel
        Left = 3
        Top = 264
        Width = 9
        Height = 13
        Caption = '  '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtArquivo: TEdit
        Left = 12
        Top = 127
        Width = 390
        Height = 21
        TabOrder = 2
      end
      object DbLkcPatroPlano: TwwDBLookupCombo
        Left = 12
        Top = 82
        Width = 320
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'PLANPRVCONTABPATRO'#9'30'#9'Descrição'#9'F')
        LookupTable = QryPatroPlanPrevContab
        LookupField = 'IDPLANPREVCTBPATR'
        Options = [loRowLines, loTitles]
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
      end
      object ProgressBar1: TProgressBar
        Left = 1
        Top = 289
        Width = 448
        Height = 16
        Align = alBottom
        Min = 0
        Max = 100
        TabOrder = 4
      end
      object DbLkcBolsa: TwwDBLookupCombo
        Left = 12
        Top = 38
        Width = 293
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'SGLBOLSAVALORES'#9'40'#9'Sigla da Bolsa')
        LookupTable = QryBolsaValores
        LookupField = 'IDBOLSAVALORES'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
      end
      object RdgTabelas: TRadioGroup
        Left = 12
        Top = 168
        Width = 418
        Height = 81
        Caption = 'Tabelas'
        ItemIndex = 0
        Items.Strings = (
          'Cota'
          'Caixa')
        TabOrder = 3
      end
    end
  end
  inherited Dock971: TDock97
    Top = 359
    Width = 452
    inherited tb97Fundo: TToolbar97
      Left = 280
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 111
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 299
    Top = 115
    TargetsData = (
      1
      1
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  object OpenDialog1: TOpenDialog
    FileName = 'COTMECA.XLS'
    Filter = 'Excel|*.xls'
    InitialDir = 'C:\'
    Title = 'Busca Arquivo de Importação '
    Left = 294
    Top = 63
  end
  object QryImportacao: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 390
    Top = 119
  end
  object QryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 294
    Top = 7
  end
  object QryBolsaValores: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDBOLSAVALORES, SGLBOLSAVALORES '
      ''
      'FROM CM.BOLSAVALORES '
      ''
      'ORDER BY SGLBOLSAVALORES ')
    ValidateWithMask = True
    Left = 387
    Top = 15
    object QryBolsaValoresSGLBOLSAVALORES: TStringField
      DisplayLabel = 'Sigla da Bolsa'
      DisplayWidth = 40
      FieldName = 'SGLBOLSAVALORES'
      Origin = 'BOLSAVALORES.SGLBOLSAVALORES'
      Size = 10
    end
    object QryBolsaValoresIDBOLSAVALORES: TFloatField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'IDBOLSAVALORES'
      Origin = 'BOLSAVALORES.IDBOLSAVALORES'
      Visible = False
    end
  end
  object QryPatroPlanPrevContab: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   PA.IDPLANPREVCTBPATR,'
      '   PA.IDPLANOPREV,'
      '   PA.IDPATRO,'
      '   (PL.NOME ||'#39' - '#39'|| PE.NOME) AS PLANPRVCONTABPATRO'
      'FROM'
      '   PESSOA PE,'
      '   PLANPREVCONTABPATRO PA,'
      '   PLANPREVCONTABIL PL'
      'WHERE'
      '   (PA.IDPATRO = PE.IDPESSOA(+))  AND'
      '   (PA.IDPLANOPREV = PL.IDPLANOPREV)'
      ''
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 386
    Top = 70
    object QryPatroPlanPrevContabPLANPRVCONTABPATRO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 30
      FieldName = 'PLANPRVCONTABPATRO'
      Origin = 'BASEDADOS.PLANPREVCONTABIL.NOME'
      Size = 113
    end
    object QryPatroPlanPrevContabIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Origin = 'BASEDADOS.PLANPREVCONTABPATRO.IDPLANPREVCTBPATR'
      Visible = False
    end
    object QryPatroPlanPrevContabIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.PLANPREVCONTABPATRO.IDPLANOPREV'
      Visible = False
    end
    object QryPatroPlanPrevContabIDPATRO: TFloatField
      FieldName = 'IDPATRO'
      Origin = 'BASEDADOS.PLANPREVCONTABPATRO.IDPATRO'
      Visible = False
    end
  end
  object qryDetalhe: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM HISTCAIXA ORDER BY IDHISTCAIXA'
      ' '
      ' ')
    UpdateObject = updDetalhe
    ValidateWithMask = True
    Left = 221
    Top = 200
    object qryDetalheIDHISTCAIXA: TFloatField
      FieldName = 'IDHISTCAIXA'
      Origin = 'BASEDADOS.HISTCAIXA.IDHISTCAIXA'
    end
    object qryDetalheIDCARTEIRAXEVENTO: TFloatField
      FieldName = 'IDCARTEIRAXEVENTO'
      Origin = 'BASEDADOS.HISTCAIXA.IDCARTEIRAXEVENTO'
    end
    object qryDetalheIDPLANPREVCTBPATR: TFloatField
      FieldName = 'IDPLANPREVCTBPATR'
      Origin = 'BASEDADOS.HISTCAIXA.IDPLANPREVCTBPATR'
    end
    object qryDetalheDATAHISTCAIXA: TDateTimeField
      FieldName = 'DATAHISTCAIXA'
      Origin = 'BASEDADOS.HISTCAIXA.DATAHISTCAIXA'
    end
    object qryDetalheVLRHISTCAIXA: TFloatField
      FieldName = 'VLRHISTCAIXA'
      Origin = 'BASEDADOS.HISTCAIXA.VLRHISTCAIXA'
    end
    object qryDetalheSLDHISTCAIXA: TFloatField
      FieldName = 'SLDHISTCAIXA'
      Origin = 'BASEDADOS.HISTCAIXA.SLDHISTCAIXA'
    end
    object qryDetalheTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.HISTCAIXA.TRGDTINCLUSAO'
    end
    object qryDetalheTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.HISTCAIXA.TRGUSERINCLUSAO'
      Size = 30
    end
    object qryDetalheIDOPERACAOINVEST: TFloatField
      FieldName = 'IDOPERACAOINVEST'
      Origin = 'BASEDADOS.HISTCAIXA.IDOPERACAOINVEST'
    end
    object qryDetalheIDCARTEIRAINVEST: TFloatField
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'BASEDADOS.HISTCAIXA.IDCARTEIRAINVEST'
    end
    object qryDetalheIDCARTEIRAGERENC: TFloatField
      FieldName = 'IDCARTEIRAGERENC'
      Origin = 'BASEDADOS.HISTCAIXA.IDCARTEIRAGERENC'
    end
  end
  object updDetalhe: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTCAIXA'
      'set'
      '  IDHISTCAIXA = :IDHISTCAIXA,'
      '  IDCARTEIRAXEVENTO = :IDCARTEIRAXEVENTO,'
      '  IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR,'
      '  DATAHISTCAIXA = :DATAHISTCAIXA,'
      '  VLRHISTCAIXA = :VLRHISTCAIXA,'
      '  SLDHISTCAIXA = :SLDHISTCAIXA,'
      '  TRGDTINCLUSAO = :TRGDTINCLUSAO,'
      '  TRGUSERINCLUSAO = :TRGUSERINCLUSAO,'
      '  IDOPERACAOINVEST = :IDOPERACAOINVEST,'
      '  IDCARTEIRAINVEST = :IDCARTEIRAINVEST,'
      '  IDCARTEIRAGERENC = :IDCARTEIRAGERENC'
      'where'
      '  IDHISTCAIXA = :OLD_IDHISTCAIXA')
    InsertSQL.Strings = (
      'insert into HISTCAIXA'
      
        '  (IDHISTCAIXA, IDCARTEIRAXEVENTO, IDPLANPREVCTBPATR, DATAHISTCA' +
        'IXA, VLRHISTCAIXA, '
      
        '   SLDHISTCAIXA, TRGDTINCLUSAO, TRGUSERINCLUSAO, IDOPERACAOINVES' +
        'T, IDCARTEIRAINVEST, '
      '   IDCARTEIRAGERENC)'
      'values'
      
        '  (:IDHISTCAIXA, :IDCARTEIRAXEVENTO, :IDPLANPREVCTBPATR, :DATAHI' +
        'STCAIXA, '
      
        '   :VLRHISTCAIXA, :SLDHISTCAIXA, :TRGDTINCLUSAO, :TRGUSERINCLUSA' +
        'O, :IDOPERACAOINVEST, '
      '   :IDCARTEIRAINVEST, :IDCARTEIRAGERENC)')
    DeleteSQL.Strings = (
      'delete from HISTCAIXA'
      'where'
      '  IDHISTCAIXA = :OLD_IDHISTCAIXA')
    Left = 249
    Top = 200
  end
  object dsDet: TwwDataSource
    AutoEdit = False
    DataSet = qryDetalhe
    Left = 277
    Top = 200
  end
end
