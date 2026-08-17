inherited frmCadTipoPagamento: TfrmCadTipoPagamento
  Left = 226
  Top = 148
  HelpContext = 160167
  Caption = 'Cadastro de Forma de Pagamento'
  ClientHeight = 311
  ClientWidth = 449
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 449
    Height = 225
    object Label1: TLabel
      Left = 354
      Top = 12
      Width = 40
      Height = 13
      Caption = 'Código'
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 12
      Top = 12
      Width = 199
      Height = 13
      Caption = 'Descrição da Forma de Pagamento'
      FocusControl = dbedNome
    end
    object lbPeriodicidade: TLabel
      Left = 12
      Top = 106
      Width = 78
      Height = 13
      Caption = 'Periodicidade'
    end
    object lblQtdeMeses: TLabel
      Left = 15
      Top = 156
      Width = 90
      Height = 13
      Caption = 'Qtde. de Meses'
      Visible = False
    end
    object DBEdit1: TDBEdit
      Left = 354
      Top = 27
      Width = 84
      Height = 21
      Color = clSilver
      DataField = 'IDTPPAGTOBENEFIC'
      DataSource = ds
      ReadOnly = True
      TabOrder = 0
    end
    object dbedNome: TDBEdit
      Left = 12
      Top = 27
      Width = 334
      Height = 21
      DataField = 'NOME'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
    end
    object dbrgrpTpPagto: TDBRadioGroup
      Left = 12
      Top = 58
      Width = 425
      Height = 41
      Caption = 'Tipo de Pagamento'
      Columns = 3
      DataField = 'FLGFREQUENCIA'
      DataSource = ds
      Items.Strings = (
        '&Unico'
        '&Indeterminado'
        '&Determinado')
      TabOrder = 2
      TabStop = True
      Values.Strings = (
        'U'
        'I'
        'D')
      OnClick = dbrgrpTpPagtoClick
    end
    object dblkcmbPeriodicidade: TwwDBLookupCombo
      Left = 12
      Top = 122
      Width = 334
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'30'#9'Periodicidade')
      DataField = 'IDTPPERIODICIDADE'
      DataSource = ds
      LookupTable = qryPeriodicidade
      LookupField = 'IDTPPERIODICIDADE'
      Options = [loTitles]
      ParentFont = False
      TabOrder = 3
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = False
    end
    object dbedQtdeMeses: TDBEdit
      Left = 15
      Top = 171
      Width = 121
      Height = 21
      DataField = 'QTDEMESES'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 4
      Visible = False
    end
  end
  inherited Dock972: TDock97
    Width = 449
  end
  inherited Dock971: TDock97
    Top = 272
    Width = 449
    inherited tb97Fundo: TToolbar97
      Left = 277
      DockPos = 280
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 108
      DockPos = 111
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 6
    Top = 288
  end
  inherited ds: TwwDataSource
    Left = 336
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TPPAGTOBENEFICIO'
      'set'
      '  IDTPPAGTOBENEFIC = :IDTPPAGTOBENEFIC,'
      '  NOME = :NOME,'
      '  IDTPPERIODICIDADE = :IDTPPERIODICIDADE,'
      '  FLGFREQUENCIA = :FLGFREQUENCIA,'
      '  FLGPRAZOCERTO = :FLGPRAZOCERTO,'
      '  QTDEMESES = :QTDEMESES'
      'where'
      '  IDTPPAGTOBENEFIC = :OLD_IDTPPAGTOBENEFIC')
    InsertSQL.Strings = (
      'insert into TPPAGTOBENEFICIO'
      
        '  (IDTPPAGTOBENEFIC, NOME, IDTPPERIODICIDADE, FLGFREQUENCIA, FLG' +
        'PRAZOCERTO, '
      '   QTDEMESES)'
      'values'
      
        '  (:IDTPPAGTOBENEFIC, :NOME, :IDTPPERIODICIDADE, :FLGFREQUENCIA,' +
        ' :FLGPRAZOCERTO, '
      '   :QTDEMESES)')
    DeleteSQL.Strings = (
      'delete from TPPAGTOBENEFICIO'
      'where'
      '  IDTPPAGTOBENEFIC = :OLD_IDTPPAGTOBENEFIC')
    Left = 261
    Top = 5
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Tipo de Pagamento'
    Colunas.Strings = (
      'NOME')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Tipo de Pagamento')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'TPPAGTOBENEFICIO')
    CamposChave.Strings = (
      'IDTPPAGTOBENEFIC')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    ExibePergunta = False
    Top = 5
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
    Top = 58
  end
  inherited qry: TwwQuery
    BeforePost = qryBeforePost
    AfterScroll = qryAfterScroll
    SQL.Strings = (
      'SELECT IDTPPAGTOBENEFIC, NOME, IDTPPERIODICIDADE, FLGFREQUENCIA,'
      '       FLGPRAZOCERTO, QTDEMESES'
      'FROM   TPPAGTOBENEFICIO'
      'WHERE  IDTPPAGTOBENEFIC = :IDTPPAGTOBENEFIC')
    Left = 300
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTPPAGTOBENEFIC'
        ParamType = ptUnknown
      end>
  end
  object qryPeriodicidade: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select * from TPPERIODICIDADE')
    ValidateWithMask = True
    Left = 383
    Top = 178
  end
end
