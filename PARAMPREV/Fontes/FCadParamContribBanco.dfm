inherited frmCadParamContribBanco: TfrmCadParamContribBanco
  Left = 225
  Top = 119
  Caption = 'Parametrização para Cobranças via Banco (CAP/CAR)'
  ClientHeight = 382
  ClientWidth = 385
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 385
    Height = 296
    object Label1: TLabel
      Left = 24
      Top = 12
      Width = 118
      Height = 13
      Caption = 'Plano Previdenciário'
    end
    object dbedNome: TwwDBEdit
      Left = 24
      Top = 28
      Width = 337
      Height = 21
      Color = clMenu
      DataField = 'NOME'
      DataSource = ds
      ReadOnly = True
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object DBRadioGroup2: TDBRadioGroup
      Left = 22
      Top = 124
      Width = 342
      Height = 52
      Caption = ' Tipo de Contabilização ( Apenas para Mantidos )'
      DataField = 'FLGCONTABMANTIDO'
      DataSource = ds
      Items.Strings = (
        'Contabilizar no Envio para CAP/CAR'
        'Contabilizar no Recebimento do CAP/CAR')
      TabOrder = 1
      Values.Strings = (
        '0'
        '1')
    end
    object GroupBox10: TGroupBox
      Left = 21
      Top = 56
      Width = 342
      Height = 65
      Caption = 'Texto para Cobrança em Boleta [Padrão]'
      TabOrder = 2
      object dbedMens1: TwwDBEdit
        Left = 8
        Top = 13
        Width = 323
        Height = 21
        DataField = 'MENSCOBR'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 69
        ParentFont = False
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbedMens2: TwwDBEdit
        Left = 8
        Top = 38
        Width = 323
        Height = 21
        DataField = 'MENSCOBR2'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 69
        ParentFont = False
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    object dbrgrpFLGAGRUPABOLETA: TDBRadioGroup
      Left = 22
      Top = 178
      Width = 342
      Height = 52
      Caption = ' Tipo de Agrupamento para Cobrança em Boleta '
      DataField = 'FLGAGRUPABOLETA'
      DataSource = ds
      Items.Strings = (
        'Emitir uma boleta para cada mês de referência'
        'Agrupar meses de referência em uma única boleta')
      TabOrder = 3
      Values.Strings = (
        '0'
        '1')
    end
    object GroupBox1: TGroupBox
      Left = 22
      Top = 231
      Width = 342
      Height = 52
      Caption = ' Tipo de Alterador para Baixa de Documentos não Pagos '
      TabOrder = 4
      object dblkpcmbAlterador: TwwDBLookupCombo
        Left = 8
        Top = 21
        Width = 323
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'35'#9'Tipo de Alterador'#9'F')
        DataField = 'CODALTBAIXANPAGO'
        DataSource = ds
        LookupTable = qryTipoAlterador
        LookupField = 'CODALTERADOR'
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
    end
  end
  inherited Dock972: TDock97
    Width = 385
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 343
    Width = 385
    inherited tb97Fundo: TToolbar97
      Left = 213
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 44
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 291
    Top = 65534
  end
  inherited ds: TwwDataSource
    Left = 342
    Top = 1
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PLANPREV'
      'set'
      '  MENSCOBR = :MENSCOBR,'
      '  MENSCOBR2 = :MENSCOBR2,'
      '  FLGCONTABMANTIDO = :FLGCONTABMANTIDO,'
      '  FLGAGRUPABOLETA = :FLGAGRUPABOLETA,'
      '  CODALTBAIXANPAGO = :CODALTBAIXANPAGO'
      'where'
      '  IDPLANOPREV = :OLD_IDPLANOPREV')
    InsertSQL.Strings = (
      'insert into PLANPREV'
      
        '  (MENSCOBR, MENSCOBR2, FLGCONTABMANTIDO, FLGAGRUPABOLETA, CODAL' +
        'TBAIXANPAGO)'
      'values'
      
        '  (:MENSCOBR, :MENSCOBR2, :FLGCONTABMANTIDO, :FLGAGRUPABOLETA, :' +
        'CODALTBAIXANPAGO)')
    DeleteSQL.Strings = (
      'delete from PLANPREV'
      'where'
      '  IDPLANOPREV = :OLD_IDPLANOPREV')
    Left = 289
    Top = 94
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Plano Previdenciário'
    Colunas.Strings = (
      'NOME'
      'IDPLANOPREV')
    TipodeDado.Strings = (
      'C'
      'N')
    Descricao.Strings = (
      'Nome do Plano'
      'Código do Plano')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'PLANPREV')
    CamposChave.Strings = (
      'IDPLANOPREV')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '40'
      '10')
    ExibePergunta = False
    Left = 530
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 8
    Top = 355
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 339
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT IDPLANOPREV, NOME,'
      '       MENSCOBR,'
      '       MENSCOBR2,'
      '       NVL( FLGCONTABMANTIDO,0) FLGCONTABMANTIDO,'
      '       NVL( FLGAGRUPABOLETA, 0)  FLGAGRUPABOLETA,'
      '       CODALTBAIXANPAGO'
      'FROM   PLANPREV'
      'WHERE  IDPLANOPREV = :IDPLANOPREV'
      ''
      ''
      ''
      ''
      ' '
      ' '
      ' ')
    Left = 289
    Top = 52
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object qryTipoAlterador: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODALTERADOR, DESCRICAO, ACRESDECRES'
      'FROM TIPOALTERADOR ')
    ValidateWithMask = True
    Left = 364
    Top = 310
  end
end
