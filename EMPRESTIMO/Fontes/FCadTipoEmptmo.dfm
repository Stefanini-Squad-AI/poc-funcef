inherited frmCadTipoEmptmo: TfrmCadTipoEmptmo
  Left = 244
  Top = 184
  HelpContext = 150059
  Caption = 'Tipos de Empréstimo'
  ClientHeight = 442
  ClientWidth = 551
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 551
    Height = 374
    inherited dbGrd: TwwDBGrid [0]
      Width = 549
      Height = 372
      Selected.Strings = (
        'DESCTIPOEMPTMO'#9'73'#9'Tipo de Empréstimo'#9'F')
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap]
      UseTFields = False
    end
    inherited pnlControles: TPanel [1]
      Width = 549
      Height = 372
      object Label1: TLabel
        Left = 72
        Top = 10
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object DBedtDescricao: TDBEdit
        Left = 72
        Top = 24
        Width = 401
        Height = 21
        DataField = 'DESCTIPOEMPTMO'
        DataSource = ds
        TabOrder = 0
      end
      object GroupBox1: TGroupBox
        Left = 72
        Top = 56
        Width = 401
        Height = 177
        TabOrder = 1
        object Bevel1: TBevel
          Left = 2
          Top = 66
          Width = 398
          Height = 2
          Shape = bsTopLine
        end
        object Label7: TLabel
          Left = 65
          Top = 44
          Width = 232
          Height = 13
          Alignment = taRightJustify
          Caption = 'Nº máximo de contratos por participante:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label6: TLabel
          Left = 61
          Top = 20
          Width = 236
          Height = 13
          Alignment = taRightJustify
          Caption = 'Nº máximo de inscrições por participante:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 35
          Top = 76
          Width = 262
          Height = 13
          Alignment = taRightJustify
          Caption = 'Prazo Mínimo (nº de parcelas) do Empréstimo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 34
          Top = 100
          Width = 263
          Height = 13
          Alignment = taRightJustify
          Caption = 'Prazo Máximo (nº de parcelas) do Empréstimo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 33
          Top = 124
          Width = 264
          Height = 13
          Alignment = taRightJustify
          Caption = 'Nº mínimo de parcelas pagas para renovação:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 44
          Top = 148
          Width = 253
          Height = 13
          Alignment = taRightJustify
          Caption = 'Nº mínimo de parcelas pagas para quitação:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object speNumCtr: TwwDBSpinEdit
          Left = 304
          Top = 40
          Width = 54
          Height = 21
          Increment = 1
          MaxValue = 999
          MinValue = 1
          Value = 1
          DataField = 'TEPMAXCONTRATO'
          DataSource = ds
          TabOrder = 1
          UnboundDataType = wwDefault
        end
        object wwDBSpinEdit1: TwwDBSpinEdit
          Left = 304
          Top = 16
          Width = 54
          Height = 21
          Increment = 1
          MaxValue = 999
          MinValue = 1
          Value = 1
          DataField = 'TEPMAXINSCR'
          DataSource = ds
          TabOrder = 0
          UnboundDataType = wwDefault
        end
        object wwDBSpinEdit2: TwwDBSpinEdit
          Left = 304
          Top = 72
          Width = 54
          Height = 21
          Increment = 1
          MaxValue = 999
          MinValue = 1
          Value = 1
          DataField = 'TEPMINPARC'
          DataSource = ds
          TabOrder = 2
          UnboundDataType = wwDefault
        end
        object wwDBSpinEdit3: TwwDBSpinEdit
          Left = 304
          Top = 96
          Width = 54
          Height = 21
          Increment = 1
          MaxValue = 999
          MinValue = 1
          Value = 1
          DataField = 'TEPMAXPARC'
          DataSource = ds
          TabOrder = 3
          UnboundDataType = wwDefault
        end
        object wwDBSpinEdit4: TwwDBSpinEdit
          Left = 304
          Top = 120
          Width = 54
          Height = 21
          Increment = 1
          MaxValue = 999
          DataField = 'TEPMINRENOVA'
          DataSource = ds
          TabOrder = 4
          UnboundDataType = wwDefault
        end
        object wwDBSpinEdit5: TwwDBSpinEdit
          Left = 304
          Top = 144
          Width = 54
          Height = 21
          Increment = 1
          MaxValue = 999
          DataField = 'TEPMINQUIT'
          DataSource = ds
          TabOrder = 5
          UnboundDataType = wwDefault
        end
      end
      inline molRegraDB1: TmolRegraDB
        Left = 64
        Top = 239
        Width = 417
        TabOrder = 2
        inherited Regra: TLabel
          Width = 129
          Caption = 'Regra de Elegibilidade'
        end
        inherited DBedtRegra: TDBEdit
          Width = 353
          DataField = 'NOMEREGRAELEG'
          DataSource = ds
        end
        inherited btnBuscaRegra: TBitBtn
          Left = 360
        end
        inherited btnLimpaRegra: TBitBtn
          Left = 384
        end
        inherited DBedtIDRegra: TDBEdit
          DataField = 'IDREGRAELEG'
          DataSource = ds
        end
      end
      inline molRegraDB2: TmolRegraDB
        Left = 64
        Top = 319
        Width = 417
        TabOrder = 4
        inherited Regra: TLabel
          Width = 237
          Caption = 'Regra de cálculo da Margem Consignável'
        end
        inherited DBedtRegra: TDBEdit
          Width = 353
          DataField = 'NOMEREGRAMARGEM'
          DataSource = ds
        end
        inherited btnBuscaRegra: TBitBtn
          Left = 360
        end
        inherited btnLimpaRegra: TBitBtn
          Left = 384
        end
        inherited DBedtIDRegra: TDBEdit
          DataField = 'IDREGRAMARGEM'
          DataSource = ds
        end
      end
      inline molRegraDB3: TmolRegraDB
        Left = 64
        Top = 279
        Width = 417
        TabOrder = 3
        inherited Regra: TLabel
          Width = 246
          Caption = 'Regra de cálculo da Reserva de Poupança'
        end
        inherited DBedtRegra: TDBEdit
          Width = 353
          DataField = 'NOMEREGRARESERVA'
          DataSource = ds
        end
        inherited btnBuscaRegra: TBitBtn
          Left = 360
        end
        inherited btnLimpaRegra: TBitBtn
          Left = 384
        end
        inherited DBedtIDRegra: TDBEdit
          DataField = 'IDREGRARESERVA'
          DataSource = ds
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 551
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
    Top = 409
    Width = 551
    inherited tb97Fundo: TToolbar97
      Left = 379
      inherited bbtnAjuda: TmaHelpBitBtn
        ClickHelpContext = 150056
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 207
    end
  end
  inherited ds: TwwDataSource
    Left = 360
    Top = 53
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TIPOEMPTMO'
      'set'
      '  IDEMPRESAPROP = :IDEMPRESAPROP,'
      '  DESCTIPOEMPTMO = :DESCTIPOEMPTMO,'
      '  IDREGRAELEG = :IDREGRAELEG,'
      '  IDREGRAMARGEM = :IDREGRAMARGEM,'
      '  IDREGRARESERVA = :IDREGRARESERVA,'
      '  TEPMAXCONTRATO = :TEPMAXCONTRATO,'
      '  TEPMAXINSCR = :TEPMAXINSCR,'
      '  TEPMAXPARC = :TEPMAXPARC,'
      '  TEPMINPARC = :TEPMINPARC,'
      '  TEPMINQUIT = :TEPMINQUIT,'
      '  TEPMINRENOVA = :TEPMINRENOVA'
      'where'
      '  IDTIPOEMPTMO = :OLD_IDTIPOEMPTMO'
      ' ')
    InsertSQL.Strings = (
      'insert into TIPOEMPTMO'
      '  (IDTIPOEMPTMO, IDEMPRESAPROP, DESCTIPOEMPTMO, IDREGRAELEG,'
      'IDREGRAMARGEM,'
      '   IDREGRARESERVA, TEPMAXCONTRATO, TEPMAXINSCR, TEPMAXPARC,'
      'TEPMINPARC,'
      '   TEPMINQUIT, TEPMINRENOVA)'
      'values'
      '  (:IDTIPOEMPTMO, :IDEMPRESAPROP, :DESCTIPOEMPTMO, :IDREGRAELEG,'
      ':IDREGRAMARGEM,'
      '   :IDREGRARESERVA, :TEPMAXCONTRATO, :TEPMAXINSCR, :TEPMAXPARC,'
      ':TEPMINPARC,'
      '   :TEPMINQUIT, :TEPMINRENOVA)'
      ' ')
    DeleteSQL.Strings = (
      'delete from TIPOEMPTMO'
      'where'
      '  IDTIPOEMPTMO = :OLD_IDTIPOEMPTMO')
    Left = 296
    Top = 53
  end
  inherited MontaSelect: TMontaSelect
    Left = 976
    Top = 56
  end
  inherited ImlPadrao: TImageList
    Left = 976
    Top = 8
  end
  inherited CmeCadastro: TCmEventosCadastro
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 424
    Top = 53
  end
  inherited qry: TwwQuery
    Tag = 0
    AfterScroll = qryAfterScroll
    SQL.Strings = (
      'SELECT'
      '   TE.IDTIPOEMPTMO,'
      '   TE.IDEMPRESAPROP,'
      '   TE.DESCTIPOEMPTMO,'
      '   TE.IDREGRAELEG,'
      '   TE.IDREGRAMARGEM,'
      '   TE.IDREGRARESERVA,'
      '   TE.TEPMAXCONTRATO,'
      '   TE.TEPMAXINSCR,'
      '   TE.TEPMAXPARC,'
      '   TE.TEPMINPARC,'
      '   TE.TEPMINQUIT,'
      '   TE.TEPMINRENOVA,'
      ''
      '   REGRAELEG.NOMEREGRA AS NOMEREGRAELEG,'
      '   REGRAMARGEM.NOMEREGRA AS NOMEREGRAMARGEM,'
      '   REGRARESERVA.NOMEREGRA AS NOMEREGRARESERVA'
      ''
      'FROM'
      '   REGRA REGRAELEG,'
      '   REGRA REGRAMARGEM,'
      '   REGRA REGRARESERVA,'
      ''
      '   TIPOEMPTMO TE'
      ''
      'WHERE'
      '   ( TE.IDEMPRESAPROP =:PIDEMPRESAPROP )'
      '   AND ( TE.IDREGRAELEG = REGRAELEG.IDREGRA(+) )'
      '   AND ( TE.IDREGRAMARGEM = REGRAMARGEM.IDREGRA(+) )'
      '   AND ( TE.IDREGRARESERVA = REGRARESERVA.IDREGRA(+) )'
      ''
      'ORDER BY'
      '   TE.DESCTIPOEMPTMO'
      ''
      ''
      ' '
      ' ')
    Left = 328
    Top = 53
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDEMPRESAPROP'
        ParamType = ptUnknown
      end>
    object qryIDTIPOEMPTMO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOEMPTMO'
    end
    object qryIDEMPRESAPROP: TFloatField
      DisplayWidth = 10
      FieldName = 'IDEMPRESAPROP'
    end
    object qryDESCTIPOEMPTMO: TStringField
      DisplayWidth = 60
      FieldName = 'DESCTIPOEMPTMO'
      Size = 60
    end
    object qryIDREGRAELEG: TFloatField
      DisplayWidth = 10
      FieldName = 'IDREGRAELEG'
    end
    object qryIDREGRAMARGEM: TFloatField
      DisplayWidth = 10
      FieldName = 'IDREGRAMARGEM'
    end
    object qryIDREGRARESERVA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDREGRARESERVA'
    end
    object qryTEPMAXCONTRATO: TFloatField
      DisplayWidth = 10
      FieldName = 'TEPMAXCONTRATO'
    end
    object qryTEPMAXINSCR: TFloatField
      DisplayWidth = 10
      FieldName = 'TEPMAXINSCR'
    end
    object qryTEPMAXPARC: TFloatField
      DisplayWidth = 10
      FieldName = 'TEPMAXPARC'
    end
    object qryTEPMINPARC: TFloatField
      DisplayWidth = 10
      FieldName = 'TEPMINPARC'
    end
    object qryTEPMINQUIT: TFloatField
      DisplayWidth = 10
      FieldName = 'TEPMINQUIT'
    end
    object qryTEPMINRENOVA: TFloatField
      FieldName = 'TEPMINRENOVA'
    end
    object qryNOMEREGRAELEG: TStringField
      DisplayWidth = 60
      FieldName = 'NOMEREGRAELEG'
      Size = 60
    end
    object qryNOMEREGRAMARGEM: TStringField
      DisplayWidth = 60
      FieldName = 'NOMEREGRAMARGEM'
      Size = 60
    end
    object qryNOMEREGRARESERVA: TStringField
      DisplayWidth = 60
      FieldName = 'NOMEREGRARESERVA'
      Size = 60
    end
  end
  object qryVerificaOcorrencia: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDTIPOEMPTMO, DESCTIPOEMPTMO'
      ''
      'FROM'
      '   TIPOEMPTMO'
      ''
      'WHERE'
      '  ( LOWER(DESCTIPOEMPTMO) =:DESCRICAO )'
      ' ')
    ValidateWithMask = True
    Left = 216
    Top = 53
    ParamData = <
      item
        DataType = ftString
        Name = 'DESCRICAO'
        ParamType = ptUnknown
      end>
  end
end
