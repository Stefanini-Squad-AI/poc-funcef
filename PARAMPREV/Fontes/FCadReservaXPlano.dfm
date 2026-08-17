inherited frmCadReservaXPlano: TfrmCadReservaXPlano
  Left = 316
  Top = 145
  HelpContext = 160121
  Caption = 'Cadastro de Reservas por Plano'
  ClientHeight = 480
  ClientWidth = 746
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 746
    Height = 394
    object pnlCadastro: TPanel
      Left = 381
      Top = 1
      Width = 364
      Height = 392
      Align = alRight
      BevelInner = bvRaised
      BevelOuter = bvNone
      TabOrder = 0
      object Label23: TLabel
        Left = 16
        Top = 90
        Width = 231
        Height = 13
        Caption = 'Índice de Valorização da Reserva (Cota)'
      end
      object Label8: TLabel
        Left = 16
        Top = 130
        Width = 178
        Height = 13
        Caption = 'Índice de Correção da Reserva'
      end
      object Label2: TLabel
        Left = 16
        Top = 10
        Width = 89
        Height = 13
        Caption = 'Cód. Hierarquia'
      end
      object Label4: TLabel
        Left = 16
        Top = 50
        Width = 48
        Height = 13
        Caption = 'Reserva'
      end
      object Label3: TLabel
        Left = 144
        Top = 10
        Width = 72
        Height = 13
        Caption = 'Identificador'
      end
      object lblRegra: TLabel
        Left = 16
        Top = 210
        Width = 294
        Height = 13
        Caption = 'Indique a Regra de Cálculo da Reserva Matemática'
      end
      object Label1: TLabel
        Left = 16
        Top = 250
        Width = 120
        Height = 13
        Caption = 'Modo de Atualização'
      end
      object dblkcmbIndiceReajuste: TwwDBLookupCombo
        Left = 16
        Top = 104
        Width = 337
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'MOEDESC'#9'20'#9'Índice'#9'F')
        DataField = 'INDICEREAJUSTE'
        DataSource = ds
        LookupTable = qryMoeda
        LookupField = 'MOECODIGO'
        Options = [loTitles]
        ParentFont = False
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
      object dblkcmbRegraCorrecao: TwwDBLookupCombo
        Left = 16
        Top = 144
        Width = 337
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'MOEDESC'#9'20'#9'Índice'#9'F')
        DataField = 'INDICECORRECAO'
        DataSource = ds
        LookupTable = qryMoedaCorr
        LookupField = 'MOECODIGO'
        Options = [loTitles]
        ParentFont = False
        TabOrder = 4
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
      object dbedReserva: TDBEdit
        Left = 16
        Top = 64
        Width = 337
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
      object dbrgrpFlgColetiva: TDBRadioGroup
        Left = 16
        Top = 288
        Width = 105
        Height = 65
        Caption = ' Tipo Controle '
        DataField = 'FLGCOLETIVA'
        DataSource = ds
        Items.Strings = (
          'Coletivo'
          'Individual')
        TabOrder = 7
        TabStop = True
        Values.Strings = (
          '1'
          '0')
        OnClick = dbrgrpFlgColetivaClick
      end
      object dbrgrpFlgControle: TDBRadioGroup
        Left = 272
        Top = 8
        Width = 81
        Height = 49
        Caption = ' Reserva '
        DataField = 'FLGCONTROLE'
        DataSource = ds
        Items.Strings = (
          'Ativa'
          'Controle')
        TabOrder = 1
        Values.Strings = (
          '0'
          '1')
      end
      object dbedIdTipoReserva: TDBEdit
        Left = 144
        Top = 24
        Width = 113
        Height = 21
        TabStop = False
        Color = clSilver
        DataField = 'IDTIPORESERVA'
        DataSource = ds
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 11
      end
      object rgTitularidade: TRadioGroup
        Left = 128
        Top = 288
        Width = 113
        Height = 65
        Caption = ' Titularidade '
        Items.Strings = (
          'Patrocinadora'
          'Fundação'
          'Participante')
        TabOrder = 9
        TabStop = True
      end
      object dbedCodHierarquia: TwwDBEdit
        Left = 16
        Top = 24
        Width = 113
        Height = 21
        DataField = 'CODHIERARQUIA'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
        OnExit = dbedCodHierarquiaExit
      end
      object dbrgrpReservaMatematica: TDBRadioGroup
        Left = 200
        Top = 168
        Width = 153
        Height = 35
        Caption = ' Reserva Matemática '
        Columns = 2
        DataField = 'FLGTIPORESERVA'
        DataSource = ds
        Items.Strings = (
          'Não'
          'Sim')
        TabOrder = 6
        TabStop = True
        Values.Strings = (
          '0'
          '1')
        OnClick = dbrgrpReservaMatematicaClick
      end
      object dbrgrpReservaTransf: TDBRadioGroup
        Left = 16
        Top = 168
        Width = 177
        Height = 35
        Caption = ' Reserva de Transferência '
        Columns = 2
        DataField = 'FLGTRANSFERENCIA'
        DataSource = ds
        Items.Strings = (
          'Não'
          'Sim')
        TabOrder = 5
        TabStop = True
        Values.Strings = (
          '0'
          '1')
      end
      object dbrgrpDescIRRF: TDBRadioGroup
        Left = 248
        Top = 288
        Width = 105
        Height = 65
        Caption = 'Desconta IRRF'
        DataField = 'FLGDESCIRRF'
        DataSource = ds
        Items.Strings = (
          'Não'
          'Sim')
        TabOrder = 10
        TabStop = True
        Values.Strings = (
          '0'
          '1')
      end
      object dblkpcmbRegra: TwwDBLookupCombo
        Left = 16
        Top = 224
        Width = 337
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEREGRA'#9'60'#9'Regra'#9'F'
          'IDREGRA'#9'10'#9'Código'#9'F')
        DataField = 'IDREGRAPAGTORESE'
        DataSource = ds
        LookupTable = qryRegra
        LookupField = 'IDREGRA'
        Options = [loTitles]
        ParentFont = False
        TabOrder = 12
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
      object dbcModoAtualiza: TwwDBComboBox
        Left = 16
        Top = 264
        Width = 337
        Height = 21
        ShowButton = True
        Style = csDropDown
        MapList = True
        AllowClearKey = False
        DataField = 'FLGMODATUALIZACAO'
        DataSource = ds
        DropDownCount = 8
        ItemHeight = 0
        Items.Strings = (
          'RESERVA EM COTAS'#9'0'
          'RESERVA EM VALOR MONETÁRIO(ÍNDICE)'#9'1')
        Sorted = False
        TabOrder = 8
        UnboundDataType = wwDefault
      end
      object cbxFLGREGRESSIVA: TDBCheckBox
        Left = 24
        Top = 355
        Width = 329
        Height = 17
        Caption = 'Sujeita à aplicação de Tabela Regressiva de IRRF'
        DataField = 'FLGREGRESSIVA'
        DataSource = ds
        TabOrder = 13
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object cbxFLGDEFICIT: TDBCheckBox
        Left = 24
        Top = 371
        Width = 185
        Height = 17
        Caption = 'Reserva pertence ao Déficit'
        DataField = 'FLGDEFICIT'
        DataSource = ds
        TabOrder = 14
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
    end
    object pnlTitulo: TPanel
      Left = 1
      Top = 1
      Width = 384
      Height = 24
      Caption = 'Reservas do Plano'
      Color = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
    object cmtvTipoReserva: TCMTreeView
      Left = 1
      Top = 24
      Width = 384
      Height = 353
      PodeNavegar = True
      DataSource = ds
      CampoChave = qryCODHIERARQUIA
      CampoDescricao = qryNOME
      CampoTipo = qryANALITICOSINTETI
      OnChanging = cmtvTipoReservaChanging
    end
  end
  inherited Dock972: TDock97
    Width = 746
  end
  inherited Dock971: TDock97
    Top = 441
    Width = 746
    inherited tb97Fundo: TToolbar97
      Left = 569
      DockPos = 569
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 400
      DockPos = 400
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 992
    Top = 0
    TargetsData = (
      1
      3
      (
        'TMemo'
        'Text'
        0)
      (
        ''
        'Items'
        0)
      (
        ''
        'DisplayLabel'
        0))
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 256
    Top = 0
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update RESERVAXPLANO'
      'set'
      '  ANALITICOSINTETI = :ANALITICOSINTETI,'
      '  CODHIERARQUIA = :CODHIERARQUIA,'
      '  FLGCOLETIVA = :FLGCOLETIVA,'
      '  FLGCONTROLE = :FLGCONTROLE,'
      '  FLGDESCIRRF = :FLGDESCIRRF,'
      '  FLGTITULARCOLET = :FLGTITULARCOLET,'
      '  FLGTRANSFERENCIA = :FLGTRANSFERENCIA,'
      '  IDREGRAPAGTORESE = :IDREGRAPAGTORESE,'
      '  INDICEREAJUSTE = :INDICEREAJUSTE,'
      '  NOME = :NOME,'
      '  FLGTIPORESERVA = :FLGTIPORESERVA,'
      '  INDICECORRECAO = :INDICECORRECAO,'
      '  FLGMODATUALIZACAO = :FLGMODATUALIZACAO,'
      '  FLGREGRESSIVA = :FLGREGRESSIVA,'
      '  FLGDEFICIT =:FLGDEFICIT'
      'where'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDTIPORESERVA = :OLD_IDTIPORESERVA')
    InsertSQL.Strings = (
      'insert into RESERVAXPLANO'
      '  (ANALITICOSINTETI, CODHIERARQUIA, FLGCOLETIVA, FLGCONTROLE, '
      'FLGDESCIRRF, '
      '   FLGTITULARCOLET, FLGTRANSFERENCIA, IDREGRAPAGTORESE, '
      'INDICEREAJUSTE, '
      '   NOME, FLGTIPORESERVA, INDICECORRECAO, FLGMODATUALIZACAO, '
      'FLGREGRESSIVA, IDPLANOPREV, IDTIPORESERVA, FLGDEFICIT)'
      'values'
      
        '  (:ANALITICOSINTETI, :CODHIERARQUIA, :FLGCOLETIVA, :FLGCONTROLE' +
        ', '
      ':FLGDESCIRRF, '
      '   :FLGTITULARCOLET, :FLGTRANSFERENCIA, :IDREGRAPAGTORESE, '
      ':INDICEREAJUSTE, '
      '   :NOME, :FLGTIPORESERVA, :INDICECORRECAO, :FLGMODATUALIZACAO, '
      ':FLGREGRESSIVA, :IDPLANOPREV, :IDTIPORESERVA, :FLGDEFICIT)'
      ' '
      ' ')
    DeleteSQL.Strings = (
      'delete from RESERVAXPLANO'
      'where'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDTIPORESERVA = :OLD_IDTIPORESERVA')
    Left = 320
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Reserva'
    Colunas.Strings = (
      'CODHIERARQUIA'
      'NOME')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'RESERVAXPLANO')
    CamposChave.Strings = (
      'IDPLANOPREV'
      'IDTIPORESERVA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '50')
    OperComparador.Strings = (
      '-1'
      '-1')
    ApenasLetraENum.Strings = (
      'N'
      'N')
    ComparaMaiuscula.Strings = (
      ''
      '')
    ExibePergunta = False
    LookupSQL.Strings = (
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      '')
    Left = 384
    Top = 0
  end
  inherited ImlPadrao: TImageList
    Left = 936
    Top = 0
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 456
    Top = 0
  end
  inherited qry: TwwQuery
    BeforePost = qryBeforePost
    AfterScroll = qryAfterScroll
    SQL.Strings = (
      'SELECT'
      
        '   ANALITICOSINTETI, CODHIERARQUIA,  FLGCOLETIVA, FLGCONTROLE, F' +
        'LGDESCIRRF,'
      '   FLGTITULARCOLET, FLGTRANSFERENCIA,'
      '   IDPLANOPREV, IDREGRAPAGTORESE,'
      '   IDTIPORESERVA, INDICEREAJUSTE,'
      
        '   NOME, FLGTIPORESERVA, INDICECORRECAO, FLGMODATUALIZACAO,FLGDE' +
        'FICIT,'
      '   NVL(FLGREGRESSIVA, 0) AS FLGREGRESSIVA'
      'FROM'
      '   RESERVAXPLANO'
      'WHERE'
      '   IDPLANOPREV =:IDPLANOPREV'
      'ORDER BY'
      '   CODHIERARQUIA')
    Left = 288
    Top = 0
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
    object qryANALITICOSINTETI: TStringField
      FieldName = 'ANALITICOSINTETI'
      Origin = 'BASEDADOS.RESERVAXPLANO.ANALITICOSINTETI'
      FixedChar = True
      Size = 1
    end
    object qryCODHIERARQUIA: TStringField
      FieldName = 'CODHIERARQUIA'
      Origin = 'BASEDADOS.RESERVAXPLANO.CODHIERARQUIA'
      FixedChar = True
      Size = 8
    end
    object qryFLGCOLETIVA: TFloatField
      FieldName = 'FLGCOLETIVA'
      Origin = 'BASEDADOS.RESERVAXPLANO.FLGCOLETIVA'
    end
    object qryFLGCONTROLE: TFloatField
      FieldName = 'FLGCONTROLE'
      Origin = 'BASEDADOS.RESERVAXPLANO.FLGCONTROLE'
    end
    object qryFLGDESCIRRF: TFloatField
      FieldName = 'FLGDESCIRRF'
      Origin = 'BASEDADOS.RESERVAXPLANO.FLGDESCIRRF'
    end
    object qryFLGTITULARCOLET: TStringField
      FieldName = 'FLGTITULARCOLET'
      Origin = 'BASEDADOS.RESERVAXPLANO.FLGTITULARCOLET'
      FixedChar = True
      Size = 1
    end
    object qryFLGTRANSFERENCIA: TFloatField
      FieldName = 'FLGTRANSFERENCIA'
      Origin = 'BASEDADOS.RESERVAXPLANO.FLGTRANSFERENCIA'
    end
    object qryIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.RESERVAXPLANO.IDPLANOPREV'
    end
    object qryIDREGRAPAGTORESE: TFloatField
      FieldName = 'IDREGRAPAGTORESE'
      Origin = 'BASEDADOS.RESERVAXPLANO.IDREGRAPAGTORESE'
    end
    object qryIDTIPORESERVA: TFloatField
      FieldName = 'IDTIPORESERVA'
      Origin = 'BASEDADOS.RESERVAXPLANO.IDTIPORESERVA'
    end
    object qryINDICEREAJUSTE: TFloatField
      FieldName = 'INDICEREAJUSTE'
      Origin = 'BASEDADOS.RESERVAXPLANO.INDICEREAJUSTE'
    end
    object qryNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.RESERVAXPLANO.NOME'
      FixedChar = True
      Size = 50
    end
    object qryFLGTIPORESERVA: TFloatField
      FieldName = 'FLGTIPORESERVA'
      Origin = 'BASEDADOS.RESERVAXPLANO.FLGTIPORESERVA'
    end
    object qryINDICECORRECAO: TFloatField
      FieldName = 'INDICECORRECAO'
      Origin = 'BASEDADOS.RESERVAXPLANO.INDICECORRECAO'
    end
    object qryFLGMODATUALIZACAO: TFloatField
      FieldName = 'FLGMODATUALIZACAO'
      Origin = 'BASEDADOS.RESERVAXPLANO.FLGMODATUALIZACAO'
    end
    object qryFLGREGRESSIVA: TFloatField
      FieldName = 'FLGREGRESSIVA'
      Origin = 'BASEDADOS.RESERVAXPLANO.FLGREGRESSIVA'
    end
    object qryFLGDEFICIT: TFloatField
      FieldName = 'FLGDEFICIT'
      Origin = 'BASEDADOS.RESERVAXPLANO.FLGDEFICIT'
    end
  end
  object qryMoeda: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MOECODIGO, MOEDESC '
      'FROM MOEDA'
      'ORDER BY MOEDESC')
    ValidateWithMask = True
    Left = 32
    Top = 152
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 104
    Top = 88
  end
  object qryMoedaCorr: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MOECODIGO, MOEDESC '
      'FROM MOEDA'
      'ORDER BY MOEDESC')
    ValidateWithMask = True
    Left = 32
    Top = 88
  end
  object qryRPart: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDTIPORESERVA,'
      '   IDPLANOPREV,'
      '   IDPESSOA,'
      '   IDPESSJUR,'
      '   DATAREFERENCIASA,'
      '   SEQPROPOSTA,'
      '   VALORRESERVA,'
      '   PERCENTUALSAQUE,'
      '   FLGATIVO,'
      '   DATADESATIV,'
      '   IDPARTICIPANTE'
      'FROM'
      '   RESERVAPART'
      'WHERE'
      '   IDPLANOPREV =:IDPLANOPREV')
    UpdateObject = updRPart
    ValidateWithMask = True
    Left = 176
    Top = 192
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
    object qryRPartIDTIPORESERVA: TFloatField
      FieldName = 'IDTIPORESERVA'
      Origin = 'BASEDADOS.RESERVAPART.IDTIPORESERVA'
    end
    object qryRPartIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.RESERVAPART.IDPLANOPREV'
    end
    object qryRPartIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.RESERVAPART.IDPESSOA'
    end
    object qryRPartIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
      Origin = 'BASEDADOS.RESERVAPART.IDPESSJUR'
    end
    object qryRPartDATAREFERENCIASA: TDateTimeField
      FieldName = 'DATAREFERENCIASA'
      Origin = 'BASEDADOS.RESERVAPART.DATAREFERENCIASA'
    end
    object qryRPartSEQPROPOSTA: TFloatField
      FieldName = 'SEQPROPOSTA'
      Origin = 'BASEDADOS.RESERVAPART.SEQPROPOSTA'
    end
    object qryRPartVALORRESERVA: TFloatField
      FieldName = 'VALORRESERVA'
      Origin = 'BASEDADOS.RESERVAPART.VALORRESERVA'
    end
    object qryRPartPERCENTUALSAQUE: TFloatField
      FieldName = 'PERCENTUALSAQUE'
      Origin = 'BASEDADOS.RESERVAPART.PERCENTUALSAQUE'
    end
    object qryRPartFLGATIVO: TFloatField
      FieldName = 'FLGATIVO'
      Origin = 'BASEDADOS.RESERVAPART.FLGATIVO'
    end
    object qryRPartDATADESATIV: TDateTimeField
      FieldName = 'DATADESATIV'
      Origin = 'BASEDADOS.RESERVAPART.DATADESATIV'
    end
    object qryRPartIDPARTICIPANTE: TFloatField
      FieldName = 'IDPARTICIPANTE'
      Origin = 'BASEDADOS.RESERVAPART.IDPARTICIPANTE'
    end
  end
  object qryRegra: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDREGRA, NOMEREGRA'
      'FROM REGRA'
      'ORDER BY NOMEREGRA')
    ValidateWithMask = True
    Left = 104
    Top = 136
  end
  object dsRPart: TDataSource
    DataSet = qryRPart
    Left = 176
    Top = 136
  end
  object updRPart: TUpdateSQL
    ModifySQL.Strings = (
      'update RESERVAPART'
      'set'
      '  DATAREFERENCIASA = :DATAREFERENCIASA,'
      '  SEQPROPOSTA = :SEQPROPOSTA,'
      '  VALORRESERVA = :VALORRESERVA,'
      '  PERCENTUALSAQUE = :PERCENTUALSAQUE,'
      '  FLGATIVO = :FLGATIVO,'
      '  DATADESATIV = :DATADESATIV,'
      '  IDPARTICIPANTE = :IDPARTICIPANTE'
      'where'
      '  IDTIPORESERVA = :OLD_IDTIPORESERVA and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDPESSJUR = :OLD_IDPESSJUR')
    InsertSQL.Strings = (
      'insert into RESERVAPART'
      '  (IDTIPORESERVA, IDPLANOPREV, IDPESSOA, IDPESSJUR, '
      'DATAREFERENCIASA, SEQPROPOSTA, '
      '   VALORRESERVA, PERCENTUALSAQUE, FLGATIVO, DATADESATIV, '
      'IDPARTICIPANTE)'
      'values'
      '  (:IDTIPORESERVA, :IDPLANOPREV, :IDPESSOA, :IDPESSJUR, '
      ':DATAREFERENCIASA, '
      '   :SEQPROPOSTA, :VALORRESERVA, :PERCENTUALSAQUE, :FLGATIVO, '
      ':DATADESATIV, '
      '   :IDPARTICIPANTE)')
    DeleteSQL.Strings = (
      'delete from RESERVAPART'
      'where'
      '  IDTIPORESERVA = :OLD_IDTIPORESERVA and'
      '  IDPLANOPREV = :OLD_IDPLANOPREV and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDPESSJUR = :OLD_IDPESSJUR')
    Left = 176
    Top = 88
  end
end
