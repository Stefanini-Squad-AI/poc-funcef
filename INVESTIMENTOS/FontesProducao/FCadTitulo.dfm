inherited frmCadTitulo: TfrmCadTitulo
  Caption = 'Cadastro de Mneômonio'
  OnKeyDown = FormKeyDown
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    object Label1: TLabel
      Left = 24
      Top = 80
      Width = 44
      Height = 13
      Caption = 'Emissor'
    end
    object Label2: TLabel
      Left = 24
      Top = 128
      Width = 112
      Height = 13
      Caption = 'Tipo de Renda Fixa'
    end
    object Label3: TLabel
      Left = 24
      Top = 32
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object dblEmissor: TwwDBLookupCombo
      Left = 24
      Top = 96
      Width = 233
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'SIGLAEMISSOR'#9'25'#9'Descrição')
      DataField = 'IDEMISSOR'
      DataSource = ds
      LookupTable = qryEmissor
      LookupField = 'IDEMISSOR'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
    end
    object dblTipoRendaFixa: TwwDBLookupCombo
      Left = 24
      Top = 144
      Width = 233
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'CODTIPRENFIXA'#9'5'#9'Descrição'
        'DATAEMTITRENFIX'#9'10'#9'Emissão'
        'DATAVENCTITRENFIX'#9'10'#9'Vencimento')
      DataField = 'CODTIPRENFIXA'
      DataSource = ds
      LookupTable = qryTipRenFixa
      LookupField = 'CODTIPRENFIXA'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
    end
    object dbeDescricao: TwwDBEdit
      Left = 24
      Top = 48
      Width = 441
      Height = 21
      DataField = 'DESCTITULO'
      DataSource = ds
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 14
  end
  inherited ds: TwwDataSource
    Top = 14
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TITULO'
      'set'
      '  IDTITULO = :IDTITULO,'
      '  IDEMISSOR = :IDEMISSOR,'
      '  CODTIPRENFIXA = :CODTIPRENFIXA,'
      '  DESCTITULO = :DESCTITULO'
      'where'
      '  IDTITULO = :OLD_IDTITULO')
    InsertSQL.Strings = (
      'insert into TITULO'
      '  (IDTITULO, IDEMISSOR, CODTIPRENFIXA, DESCTITULO)'
      'values'
      '  (:IDTITULO, :IDEMISSOR, :CODTIPRENFIXA, :DESCTITULO)')
    DeleteSQL.Strings = (
      'delete from TITULO'
      'where'
      '  IDTITULO = :OLD_IDTITULO')
    Top = 14
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TITULO.DESCTITULO'
      'TITULO.CODTIPRENFIXA'
      'EMISSOR.SIGLAEMISSOR')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Título'
      'Cód. Tipo Renda Fixa'
      'Sigla Emissor')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'TITULO'
      'EMISSOR')
    CamposChave.Strings = (
      'TITULO.IDTITULO')
    Filtro.Strings = (
      'EMISSOR.IDEMISSOR = TITULO.IDEMISSOR')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '30'
      '5'
      '15')
    Top = 14
  end
  inherited ImlPadrao: TImageList
    Top = 14
  end
  inherited CmeCadastro: TCmEventosCadastro
    Top = 14
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT TITULO.IDTITULO,'
      '       TITULO.IDEMISSOR,'
      '       TITULO.CODTIPRENFIXA,'
      '       TITULO.DESCTITULO,'
      '       EMISSOR.SIGLAEMISSOR'
      'FROM TITULO TITULO,'
      '     EMISSOR EMISSOR'
      'WHERE '
      '    (EMISSOR.IDEMISSOR = TITULO.IDEMISSOR) AND'
      '    (TITULO.IDTITULO = :P_IDTITULO)')
    Top = 14
    ParamData = <
      item
        DataType = ftInteger
        Name = 'P_IDTITULO'
        ParamType = ptUnknown
      end>
    object qryIDTITULO: TFloatField
      FieldName = 'IDTITULO'
      Origin = '"CM.TITULO".IDTITULO'
    end
    object qryIDEMISSOR: TFloatField
      FieldName = 'IDEMISSOR'
      Origin = '"CM.TITULO".IDEMISSOR'
    end
    object qryCODTIPRENFIXA: TStringField
      FieldName = 'CODTIPRENFIXA'
      Origin = '"CM.TITULO".CODTIPRENFIXA'
      Size = 5
    end
    object qryDESCTITULO: TStringField
      FieldName = 'DESCTITULO'
      Origin = '"CM.TITULO".DESCTITULO'
      Size = 30
    end
    object qrySIGLAEMISSOR: TStringField
      FieldName = 'SIGLAEMISSOR'
      Origin = '"CM.EMISSOR".SIGLAEMISSOR'
      Size = 15
    end
  end
  object qryEmissor: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDEMISSOR, '
      '              SIGLAEMISSOR'
      'FROM EMISSOR')
    ValidateWithMask = True
    Left = 96
    Top = 23
    object qryEmissorSIGLAEMISSOR: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 25
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
  object qryTipRenFixa: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    CODTIPRENFIXA,'
      '    DATAEMTITRENFIX,'
      '    DATAVENCTITRENFIX,'
      '    IDTITRENFIXA'
      'FROM TITRENFIXA'
      'ORDER BY  CODTIPRENFIXA,  DATAEMTITRENFIX,  DATAVENCTITRENFIX'
      '')
    ValidateWithMask = True
    Left = 448
    Top = 55
    object qryTipRenFixaCODTIPRENFIXA: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 5
      FieldName = 'CODTIPRENFIXA'
      Origin = '"CM.TITRENFIXA".CODTIPRENFIXA'
      Size = 5
    end
    object qryTipRenFixaDATAEMTITRENFIX: TDateTimeField
      DisplayLabel = 'Emissão'
      DisplayWidth = 10
      FieldName = 'DATAEMTITRENFIX'
    end
    object qryTipRenFixaDATAVENCTITRENFIX: TDateTimeField
      DisplayLabel = 'Vencimento'
      DisplayWidth = 10
      FieldName = 'DATAVENCTITRENFIX'
    end
    object qryTipRenFixaIDTITRENFIXA: TFloatField
      FieldName = 'IDTITRENFIXA'
      Origin = '"CM.TITRENFIXA".IDTITRENFIXA'
      Visible = False
    end
  end
end
