inherited frmCadEmissorXTitulo: TfrmCadEmissorXTitulo
  Left = 287
  Top = 134
  Caption = 'Cadastro de Emissor e Título'
  ClientWidth = 427
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 427
    inherited pnlMestre: TPanel
      Width = 417
      Height = 68
      object lblEmissor: TLabel
        Left = 16
        Top = 16
        Width = 98
        Height = 13
        Caption = 'Nome do Emissor'
      end
      object DbLkcEmissor: TwwDBLookupCombo
        Left = 16
        Top = 32
        Width = 384
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'SIGLAEMISSOR'#9'15'#9'Emissor')
        LookupTable = qryEmissor
        LookupField = 'IDEMISSOR'
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnCloseUp = DbLkcEmissorCloseUp
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 73
      Width = 417
      Height = 260
      Tabs.Strings = (
        'Tipos de Renda Fixa')
      inherited pgctrlDetalhe: TPageControl
        Width = 324
        Height = 201
        inherited tbsDet: TTabSheet
          Caption = 'Tipos de Renda Fixa'
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 316
            Height = 173
            Selected.Strings = (
              'MNEMONICO'#9'45'#9'Nome do Título'
              'DESCTIPRENFIXA'#9'40'#9'Tipo de Título')
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            ParentFont = False
            TitleAlignment = taCenter
            TitleFont.Color = clMaroon
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 316
            Height = 173
            object lblClasse: TLabel
              Left = 6
              Top = 13
              Width = 150
              Height = 13
              Caption = 'Tipo de Título Renda Fixa'
            end
            object lblNomeTitulo: TLabel
              Left = 6
              Top = 74
              Width = 89
              Height = 13
              Caption = 'Nome do Título'
            end
            object DbLkcTipoTitRenFix: TwwDBLookupCombo
              Left = 6
              Top = 34
              Width = 303
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCTIPRENFIXA'#9'60'#9'Tipo de Título')
              DataField = 'CODTIPRENFIXA'
              DataSource = dsDet
              LookupTable = qryTipoTitulo
              LookupField = 'CODTIPRENFIXA'
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              ShowMatchText = True
            end
            object dbeNomeTitulo: TwwDBEdit
              Left = 6
              Top = 95
              Width = 252
              Height = 21
              DataField = 'MNEMONICO'
              DataSource = dsDet
              TabOrder = 1
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 409
        inherited tb97BotoesDetalhe: TToolbar97
          inherited sbtnAltDet: TToolbarButton97
            Enabled = False
          end
          inherited sbtnExcluiDet: TToolbarButton97
            Enabled = False
          end
        end
      end
      inherited Dock974: TDock97
        Left = 328
        Height = 201
        inherited tb97Detalhe: TToolbar97
          inherited bbtnOkDet: TBitBtn
            Default = True
          end
          inherited bbtnCancelarDet: TBitBtn
            OnClick = bbtnVoltarDetClick
          end
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 427
  end
  inherited Dock971: TDock97
    Width = 427
    inherited tb97Fundo: TToolbar97
      Left = 254
      DockPos = 254
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 86
      DockPos = 86
    end
  end
  inherited qry: TwwQuery
    Left = 245
    Top = 5
    object qryCODTIPRENFIXA: TStringField
      FieldName = 'CODTIPRENFIXA'
      Origin = 'TIPOTITRENFIXA.CODTIPRENFIXA'
      Size = 5
    end
    object qryDESCTIPRENFIXA: TStringField
      FieldName = 'DESCTIPRENFIXA'
      Origin = 'TIPOTITRENFIXA.DESCTIPRENFIXA'
      Size = 60
    end
    object qryFLGAPURAIR: TStringField
      FieldName = 'FLGAPURAIR'
      Origin = 'TIPOTITRENFIXA.FLGAPURAIR'
      Size = 1
    end
    object qryIDCLASSETIT: TFloatField
      FieldName = 'IDCLASSETIT'
      Origin = 'TIPOTITRENFIXA.IDCLASSETIT'
    end
  end
  inherited dsDet: TwwDataSource
    AutoEdit = True
    DataSet = qryDet
    OnStateChange = dsDetStateChange
    Left = 253
    Top = 332
  end
  inherited upd: TUpdateSQL
    InsertSQL.Strings = (
      '')
    Left = 309
    Top = 5
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Título X Emissor'
    Colunas.Strings = (
      'EMISSOR.SIGLAEMISSOR')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Emissor')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'EMISSORXTITULO'
      'EMISSOR'
      'TIPOTITULO')
    CamposChave.Strings = (
      'EMISSOR.IDEMISSOR')
    Filtro.Strings = (
      'TIPOTITULO.IDTIPOINVEST = 1'
      'TIPOTITULO.CODTIPTITULO = EMISSORXTITULO.CODTIPRENFIXA'
      'EMISSOR.IDEMISSOR = EMISSORXTITULO.IDEMISSOR')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '100')
    UsaDistinct = True
    Left = 368
  end
  inherited ds: TwwDataSource
    AutoEdit = True
    Left = 277
    Top = 5
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 358
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 408
    Top = 108
  end
  object qryEmissor: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDEMISSOR,'
      '              SIGLAEMISSOR      '
      'FROM   EMISSOR'
      'ORDER BY SIGLAEMISSOR'
      '')
    ValidateWithMask = True
    Left = 213
    Top = 76
    object qryEmissorSIGLAEMISSOR: TStringField
      DisplayLabel = 'Emissor'
      DisplayWidth = 15
      FieldName = 'SIGLAEMISSOR'
      Origin = 'EMISSOR.SIGLAEMISSOR'
      Size = 15
    end
    object qryEmissorIDEMISSOR: TFloatField
      FieldName = 'IDEMISSOR'
      Origin = 'EMISSOR.IDEMISSOR'
      Visible = False
    end
  end
  object qryDet: TwwQuery
    Tag = 5
    Active = True
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT ET.IDEMISSORXTITULO, '
      '       ET.IDEMISSOR,'
      '       ET.CODTIPRENFIXA,'
      '       ET.MNEMONICO,'
      '       EM.SIGLAEMISSOR,'
      '       TR.DESCTIPRENFIXA'
      ''
      'FROM EMISSORXTITULO ET,'
      '     EMISSOR EM,'
      '     TIPOTITULO TT,'
      '      TIPOTITRENFIXA TR'
      ''
      'WHERE (ET.IDEMISSOR = EM.IDEMISSOR) AND'
      '      (ET.CODTIPRENFIXA = TT.CODTIPTITULO) AND'
      '      (ET.CODTIPRENFIXA = TR.CODTIPRENFIXA) AND'
      '      (TT.IDTIPOINVEST = 1) AND '
      '      (ET.IDEMISSOR = :IDEMISSOR)'
      ''
      'ORDER BY'
      '      EM.SIGLAEMISSOR, ET.CODTIPRENFIXA, ET.MNEMONICO')
    UpdateObject = updDet
    ValidateWithMask = True
    Left = 195
    Top = 333
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDEMISSOR'
        ParamType = ptUnknown
      end>
    object qryDetMNEMONICO: TStringField
      DisplayLabel = 'Nome do Título'
      DisplayWidth = 45
      FieldName = 'MNEMONICO'
      Origin = 'EMISSORXTITULO.MNEMONICO'
      Size = 30
    end
    object qryDetDESCTIPRENFIXA: TStringField
      DisplayLabel = 'Tipo de Título'
      DisplayWidth = 40
      FieldName = 'DESCTIPRENFIXA'
      Origin = 'TIPOTITRENFIXA.DESCTIPRENFIXA'
      Size = 60
    end
    object qryDetCODTIPRENFIXA: TStringField
      DisplayLabel = 'Tipo do Título'
      DisplayWidth = 8
      FieldName = 'CODTIPRENFIXA'
      Origin = 'EMISSORXTITULO.CODTIPRENFIXA'
      Visible = False
      Size = 5
    end
    object qryDetSIGLAEMISSOR: TStringField
      DisplayLabel = 'Emissor'
      DisplayWidth = 15
      FieldName = 'SIGLAEMISSOR'
      Origin = 'EMISSOR.SIGLAEMISSOR'
      Visible = False
      Size = 15
    end
    object qryDetIDEMISSOR: TFloatField
      DisplayLabel = 'ID Emissor'
      DisplayWidth = 10
      FieldName = 'IDEMISSOR'
      Origin = 'EMISSORXTITULO.IDEMISSOR'
      Visible = False
    end
    object qryDetIDEMISSORXTITULO: TFloatField
      FieldName = 'IDEMISSORXTITULO'
      Origin = 'EMISSORXTITULO.IDEMISSORXTITULO'
      Visible = False
    end
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update EMISSORXTITULO'
      'set'
      '  IDEMISSORXTITULO = :IDEMISSORXTITULO,'
      '  IDEMISSOR = :IDEMISSOR,'
      '  CODTIPRENFIXA = :CODTIPRENFIXA,'
      '  MNEMONICO = :MNEMONICO'
      'where'
      '  IDEMISSORXTITULO = :OLD_IDEMISSORXTITULO')
    InsertSQL.Strings = (
      'insert into EMISSORXTITULO'
      '  (IDEMISSORXTITULO, IDEMISSOR, CODTIPRENFIXA, MNEMONICO)'
      'values'
      '  (:IDEMISSORXTITULO, :IDEMISSOR, :CODTIPRENFIXA, :MNEMONICO)')
    DeleteSQL.Strings = (
      'delete from EMISSORXTITULO'
      'where'
      '  IDEMISSORXTITULO = :OLD_IDEMISSORXTITULO')
    Left = 310
    Top = 332
  end
  object qryTipoTitulo: TwwQuery
    Tag = 5
    Active = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  CODTIPRENFIXA,'
      '                DESCTIPRENFIXA'
      'FROM     TIPOTITRENFIXA'
      'ORDER BY CODTIPRENFIXA')
    ValidateWithMask = True
    Left = 253
    Top = 204
    object qryTipoTituloDESCTIPRENFIXA: TStringField
      DisplayLabel = 'Tipo de Título'
      DisplayWidth = 60
      FieldName = 'DESCTIPRENFIXA'
      Origin = 'TIPOTITRENFIXA.DESCTIPRENFIXA'
      Size = 60
    end
    object qryTipoTituloCODTIPRENFIXA: TStringField
      DisplayWidth = 5
      FieldName = 'CODTIPRENFIXA'
      Origin = 'TIPOTITRENFIXA.CODTIPRENFIXA'
      Visible = False
      Size = 5
    end
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDEMISSORXTITULO'
      'FROM EMISSORXTITULO'
      'WHERE ( IDEMISSOR = :pEMISSOR ) AND'
      '               ( CODTIPRENFIXA = :pTIPRENFIXA ) ')
    ValidateWithMask = True
    Left = 366
    Top = 271
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pEMISSOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pTIPRENFIXA'
        ParamType = ptUnknown
      end>
  end
end
