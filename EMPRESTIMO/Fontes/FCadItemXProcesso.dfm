inherited frmCadItemXProcesso: TfrmCadItemXProcesso
  Left = 317
  Top = 263
  HelpContext = 150109
  Caption = 'Itens por Processo'
  ClientHeight = 342
  ClientWidth = 507
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 507
    Height = 274
    inherited dbGrd: TwwDBGrid [0]
      Width = 505
      Height = 272
      Selected.Strings = (
        'DESC_PROCESSO'#9'22'#9'Processo'
        'DESCRICAO'#9'22'#9'Descriçao'
        'ITEDESCRICAO'#9'22'#9'Item'
        'TCEDESCRICAO'#9'60'#9'Tipo de Contrato'#9'F')
    end
    inherited pnlControles: TPanel [1]
      Width = 505
      Height = 272
      object Label1: TLabel
        Left = 16
        Top = 90
        Width = 25
        Height = 13
        Caption = 'Item'
      end
      object Label2: TLabel
        Left = 16
        Top = 50
        Width = 96
        Height = 13
        Caption = 'Tipo de Contrato'
      end
      object Label3: TLabel
        Left = 16
        Top = 130
        Width = 53
        Height = 13
        Caption = 'Processo'
      end
      object Label5: TLabel
        Left = 16
        Top = 10
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object Label4: TLabel
        Left = 16
        Top = 170
        Width = 98
        Height = 13
        Caption = 'Natureza do Item'
      end
      object DBcboItem: TwwDBLookupCombo
        Left = 16
        Top = 104
        Width = 473
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'ITEDESCRICAO'#9'40'#9'ITEDESCRICAO'#9'F')
        DataField = 'IDITEMEMPTMO'
        DataSource = ds
        LookupTable = qryLookItem
        LookupField = 'IDITEMEMPTMO'
        Style = csDropDownList
        DropDownWidth = 8
        Enabled = False
        TabOrder = 2
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
      object DBcboTipoContrato: TwwDBLookupCombo
        Left = 16
        Top = 64
        Width = 473
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'TCEDESCRICAO'#9'60'#9'TCEDESCRICAO'#9'F')
        DataField = 'IDTIPOCONTREMPTMO'
        DataSource = ds
        LookupTable = dtmLookEmptmo.qryLookTipoContr
        LookupField = 'IDTIPOCONTREMPTMO'
        DropDownWidth = 8
        ParentFont = False
        TabOrder = 1
        AutoDropDown = False
        ShowButton = True
        UseTFields = False
        AllowClearKey = False
        ShowMatchText = True
        OnCloseUp = DBcboTipoContratoCloseUp
        OnExit = DBcboTipoContratoExit
      end
      object DBcboProcesso: TwwDBComboBox
        Left = 16
        Top = 144
        Width = 473
        Height = 21
        ShowButton = True
        Style = csDropDownList
        MapList = True
        AllowClearKey = False
        DataField = 'IDPROCESSO'
        DataSource = ds
        DropDownCount = 8
        ItemHeight = 0
        Items.Strings = (
          'Alteração Contratual'#9'17'
          'Alteração de Concessão'#9'13'
          'Amortização/Refinanciamento'#9'2'
          'Atualização de Saldo (Diária)'#9'5'
          'Cancelamento de Amortização'#9'52'
          'Cancelamento de Concessão'#9'16'
          'Cancelamento de Quitação'#9'53'
          'Concessão/Renovação'#9'0'
          'Consulta de Contratos'#9'15'
          'Contabilização em Lote de Ajustes'#9'47'
          'Contabilização em Lote de Amortização'#9'43'
          'Contabilização em Lote de Atualização Diária'#9'46'
          'Contabilização em Lote de Concessão'#9'41'
          'Contabilização em Lote de Encargos'#9'45'
          'Contabilização em Lote de Prestação'#9'42'
          'Contabilização em Lote de Quitação'#9'44'
          'Desfazer Contabilização em Lote de Ajustes'#9'77'
          'Desfazer Contabilização em Lote de Amortização'#9'73'
          'Desfazer Contabilização em Lote de Atualização Diária'#9'76'
          'Desfazer Contabilização em Lote de Concessão'#9'71'
          'Desfazer Contabilização em Lote de Encargos'#9'75'
          'Desfazer Contabilização em Lote de Prestação'#9'72'
          'Desfazer Contabilização em Lote de Quitação'#9'74'
          'Desfazer Envio de Concessão em Lote'#9'63'
          'Desfazer Envio de Seguros em Lote'#9'64'
          'Desfazer Envio'#9'61'
          'Desfazer Geração de Parcelas'#9'51'
          'Desfazer Recebimento'#9'62'
          'Entrada Manual'#9'12'
          'Envio de Concessão em Lote'#9'23'
          'Envio de Seguros em Lote'#9'24'
          'Envio'#9'19'
          'Geração de Parcelas'#9'1'
          'Importação/Migração'#9'9'
          'Lançamento de Prestações Atualizadas'#9'21'
          'Liberação de Concessão'#9'18'
          'Quitação Antecipada'#9'3'
          'Quitação por Morte/Invalidez'#9'8'
          'Quitação por Resgate'#9'10'
          'Recálculo Diário'#9'6'
          'Recebimento'#9'11'
          'Relatórios / Outros'#9'999'
          'Tratamento de Divergências'#9'4'
          'Tratamento de Itens não Recebidos'#9'20'
          'Tratamento de Valores Não Programados'#9'14'
          'Tratamento Individual'#9'7')
        Sorted = True
        TabOrder = 3
        UnboundDataType = wwDefault
      end
      object DBchkEnvio: TDBCheckBox
        Left = 24
        Top = 240
        Width = 385
        Height = 17
        Caption = 'Item deve ser enviado no processo'
        DataField = 'FLGENVIO'
        DataSource = ds
        TabOrder = 5
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBchkNegativo: TDBCheckBox
        Left = 24
        Top = 216
        Width = 385
        Height = 17
        Caption = 'Considerar como valor negativo para efeito do processo'
        DataField = 'FLGNEGATIVO'
        DataSource = ds
        TabOrder = 4
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object DBedtDescricao: TDBEdit
        Left = 16
        Top = 24
        Width = 473
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 0
      end
      object DBcboTipoItem: TwwDBComboBox
        Left = 16
        Top = 184
        Width = 473
        Height = 21
        ShowButton = True
        Style = csDropDownList
        MapList = True
        AllowClearKey = False
        DataField = 'FLGTIPOITEM'
        DataSource = ds
        DropDownCount = 8
        ItemHeight = 0
        Items.Strings = (
          'Correção Monetária'#9'3'
          'I.O.F.'#9'4'
          'Juros'#9'2'
          'Multa'#9'1'
          'Seguro'#9'5')
        Sorted = True
        TabOrder = 6
        UnboundDataType = wwDefault
      end
    end
  end
  inherited Dock972: TDock97
    Width = 507
    inherited Toolbar971: TToolbar97
      inherited sbtnProcurar: TToolbarButton97
        Width = 25
      end
      inherited ToolbarSep972: TToolbarSep97
        Left = 280
      end
      inherited btnRefresh: TToolbarButton97
        Left = 286
        Width = 25
        Enabled = False
        Visible = False
      end
      inherited btnTrazer: TToolbarButton97
        Left = 311
        Width = 25
      end
    end
  end
  inherited Dock971: TDock97
    Top = 309
    Width = 507
    inherited tb97Fundo: TToolbar97
      Left = 335
      inherited bbtnAjuda: TmaHelpBitBtn
        ClickHelpContext = 150056
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 163
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        ''
        'Items'
        0))
  end
  inherited ds: TwwDataSource
    Left = 408
    Top = 0
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update ITEMXPROCESSOEP'
      'set'
      '  DESCRICAO = :DESCRICAO,'
      '  IDITEMEMPTMO = :IDITEMEMPTMO,'
      '  IDTIPOCONTREMPTMO = :IDTIPOCONTREMPTMO,'
      '  IDPROCESSO = :IDPROCESSO,'
      '  FLGENVIO = :FLGENVIO,'
      '  FLGNEGATIVO = :FLGNEGATIVO,'
      '  FLGTIPOITEM = :FLGTIPOITEM,'
      '  IDREGRA = :IDREGRA'
      'where'
      '  IDITEMEMPTMO = :OLD_IDITEMEMPTMO and'
      '  IDTIPOCONTREMPTMO = :OLD_IDTIPOCONTREMPTMO and'
      '  IDPROCESSO = :OLD_IDPROCESSO')
    InsertSQL.Strings = (
      'insert into ITEMXPROCESSOEP'
      '  (DESCRICAO, IDITEMEMPTMO, IDTIPOCONTREMPTMO, IDPROCESSO, '
      'FLGENVIO, FLGNEGATIVO, '
      '   FLGTIPOITEM, IDREGRA)'
      'values'
      '  (:DESCRICAO, :IDITEMEMPTMO, :IDTIPOCONTREMPTMO, :IDPROCESSO, '
      ':FLGENVIO, '
      '   :FLGNEGATIVO, :FLGTIPOITEM, :IDREGRA)')
    DeleteSQL.Strings = (
      'delete from ITEMXPROCESSOEP'
      'where'
      '  IDITEMEMPTMO = :OLD_IDITEMEMPTMO and'
      '  IDTIPOCONTREMPTMO = :OLD_IDTIPOCONTREMPTMO and'
      '  IDPROCESSO = :OLD_IDPROCESSO')
    Left = 344
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Left = 664
    Top = 8
  end
  inherited ImlPadrao: TImageList
    Left = 977
    Top = 6
  end
  inherited CmeCadastro: TCmEventosCadastro
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 456
    Top = 0
  end
  inherited qry: TwwQuery
    AfterScroll = qryAfterScroll
    SQL.Strings = (
      'SELECT'
      '   IXP.DESCRICAO,'
      '   IXP.IDITEMEMPTMO, ITE.ITEDESCRICAO,'
      '   IXP.IDTIPOCONTREMPTMO, TCE.TCEDESCRICAO,'
      '   IXP.IDPROCESSO,'
      ''
      '   DECODE(IXP.IDPROCESSO,'
      '           0, '#39'Concessão/Renovação'#39','
      '           1, '#39'Geração de Parcelas'#39','
      '           2, '#39'Amortização/Refinanciamento'#39','
      '           3, '#39'Quitação Antecipada'#39','
      '           4, '#39'Tratamento de Divergências'#39','
      '           5, '#39'Atualização de Saldo (Diária)'#39','
      '           6, '#39'Recálculo Diário'#39','
      '           7, '#39'Tratamento Individual'#39','
      '           8, '#39'Quitação por Morte/Invalidez'#39','
      '           9, '#39'Importação/Migração'#39','
      '          10, '#39'Quitação por Resgate'#39','
      '          11, '#39'Recebimento'#39','
      '          12, '#39'Entrada Manual'#39','
      '          13, '#39'Alteração de Concessão'#39','
      '          14, '#39'Tratamento de Valores Não Programados'#39','
      '          15, '#39'Consulta de Contratos'#39','
      '          16, '#39'Cancelamento de Concessão'#39','
      '          17, '#39'Alteração Contratual'#39','
      '          18, '#39'Liberação de Concessão'#39','
      '          19, '#39'Envio'#39','
      '          20, '#39'Tratamento de Itens não Recebidos'#39','
      '          21, '#39'Lançamento de Prestações Atualizadas'#39','
      '          23, '#39'Envio de Concessão em Lote'#39','
      '          24, '#39'Envio de Seguros em Lote'#39','
      '          41, '#39'Contabilização em Lote de Concessão'#39','
      '          42, '#39'Contabilização em Lote de Prestação'#39','
      '          43, '#39'Contabilização em Lote de Amortização'#39','
      '          44, '#39'Contabilização em Lote de Quitação'#39','
      '          45, '#39'Contabilização em Lote de Encargos'#39','
      '          46, '#39'Contabilização em Lote de Atualização Diária'#39','
      '          47, '#39'Contabilização em Lote de Ajustes'#39','
      '          51, '#39'Desfazer Geração de Parcelas'#39','
      '          52, '#39'Cancelamento de Amortização'#39','
      '          53, '#39'Cancelamento de Quitação'#39','
      '          61, '#39'Desfazer Envio'#39','
      '          62, '#39'Desfazer Recebimento'#39','
      '          63, '#39'Desfazer Envio de Concessão em Lote'#39','
      '          64, '#39'Desfazer Envio de Seguros em Lote'#39','
      '          71, '#39'Desfazer Contabilização em Lote de Concessão'#39','
      '          72, '#39'Desfazer Contabilização em Lote de Prestação'#39','
      '          73, '#39'Desfazer Contabilização em Lote de Amortização'#39','
      '          74, '#39'Desfazer Contabilização em Lote de Quitação'#39','
      '          75, '#39'Desfazer Contabilização em Lote de Encargos'#39','
      
        '          76, '#39'Desfazer Contabilização em Lote de Atualização Di' +
        'ária'#39','
      '          77, '#39'Desfazer Contabilização em Lote de Ajustes'#39','
      '         999, '#39'Relatórios / Outros'#39','
      '              '#39'NÃO CADASTRADO'#39
      '         ) AS DESC_PROCESSO,'
      ''
      '   IXP.FLGENVIO, IXP.FLGNEGATIVO, IXP.FLGTIPOITEM,'
      '   IXP.IDREGRA'
      ''
      'FROM'
      '   ITEMXPROCESSOEP IXP,'
      '   ITEMEMPTMO      ITE,'
      '   TIPOCONTREMPTMO TCE,'
      '   TIPOEMPTMO      TEP'
      ''
      'WHERE'
      '       TEP.IDEMPRESAPROP      =:PIDEMPRESAPROP'
      ''
      '   AND IXP.IDITEMEMPTMO       = ITE.IDITEMEMPTMO'
      '   AND IXP.IDTIPOCONTREMPTMO  = TCE.IDTIPOCONTREMPTMO'
      '   AND TCE.IDTIPOEMPTMO       = TEP.IDTIPOEMPTMO'
      ''
      'ORDER BY'
      '   DECODE(IXP.IDPROCESSO,'
      '           0, '#39'Concessão/Renovação'#39','
      '           1, '#39'Geração de Parcelas'#39','
      '           2, '#39'Amortização/Refinanciamento'#39','
      '           3, '#39'Quitação Antecipada'#39','
      '           4, '#39'Tratamento de Divergências'#39','
      '           5, '#39'Atualização de Saldo (Diária)'#39','
      '           6, '#39'Recálculo Diário'#39','
      '           7, '#39'Tratamento Individual'#39','
      '           8, '#39'Quitação por Morte/Invalidez'#39','
      '           9, '#39'Importação/Migração'#39','
      '          10, '#39'Quitação por Resgate'#39','
      '          11, '#39'Recebimento'#39','
      '          12, '#39'Entrada Manual'#39','
      '          13, '#39'Alteração de Concessão'#39','
      '          14, '#39'Tratamento de Valores Não Programados'#39','
      '          15, '#39'Consulta de Contratos'#39','
      '          16, '#39'Cancelamento de Concessão'#39','
      '          17, '#39'Alteração Contratual'#39','
      '          18, '#39'Liberação de Concessão'#39','
      '          19, '#39'Envio'#39','
      '          20, '#39'Tratamento de Itens não Recebidos'#39','
      '          21, '#39'Lançamento de Prestações Atualizadas'#39','
      '          23, '#39'Envio de Concessão em Lote'#39','
      '          24, '#39'Envio de Seguros em Lote'#39','
      '          41, '#39'Contabilização em Lote de Concessão'#39','
      '          42, '#39'Contabilização em Lote de Prestação'#39','
      '          43, '#39'Contabilização em Lote de Amortização'#39','
      '          44, '#39'Contabilização em Lote de Quitação'#39','
      '          45, '#39'Contabilização em Lote de Encargos'#39','
      '          46, '#39'Contabilização em Lote de Atualização Diária'#39','
      '          47, '#39'Contabilização em Lote de Ajustes'#39','
      '          51, '#39'Desfazer Geração de Parcelas'#39','
      '          52, '#39'Cancelamento de Amortização'#39','
      '          53, '#39'Cancelamento de Quitação'#39','
      '          61, '#39'Desfazer Envio'#39','
      '          62, '#39'Desfazer Recebimento'#39','
      '          63, '#39'Desfazer Envio de Concessão em Lote'#39','
      '          64, '#39'Desfazer Envio de Seguros em Lote'#39','
      '          71, '#39'Desfazer Contabilização em Lote de Concessão'#39','
      '          72, '#39'Desfazer Contabilização em Lote de Prestação'#39','
      '          73, '#39'Desfazer Contabilização em Lote de Amortização'#39','
      '          74, '#39'Desfazer Contabilização em Lote de Quitação'#39','
      '          75, '#39'Desfazer Contabilização em Lote de Encargos'#39','
      
        '          76, '#39'Desfazer Contabilização em Lote de Atualização Di' +
        'ária'#39','
      '          77, '#39'Desfazer Contabilização em Lote de Ajustes'#39','
      '         999, '#39'Relatórios / Outros'#39','
      '              '#39'NÃO CADASTRADO'#39
      '         ),'
      '   IXP.DESCRICAO')
    Left = 376
    Top = 0
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDEMPRESAPROP'
        ParamType = ptInput
      end>
    object qryDESC_PROCESSO: TStringField
      DisplayLabel = 'Processo'
      DisplayWidth = 22
      FieldName = 'DESC_PROCESSO'
      Size = 53
    end
    object qryDESCRICAO: TStringField
      DisplayLabel = 'Descriçao'
      DisplayWidth = 22
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object qryITEDESCRICAO: TStringField
      DisplayLabel = 'Item'
      DisplayWidth = 22
      FieldName = 'ITEDESCRICAO'
      Size = 40
    end
    object qryTCEDESCRICAO: TStringField
      DisplayLabel = 'Tipo de Contrato'
      DisplayWidth = 60
      FieldName = 'TCEDESCRICAO'
      Size = 60
    end
    object qryFLGENVIO: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGENVIO'
      Visible = False
    end
    object qryFLGNEGATIVO: TFloatField
      DisplayWidth = 12
      FieldName = 'FLGNEGATIVO'
      Visible = False
    end
    object qryFLGTIPOITEM: TFloatField
      DisplayWidth = 11
      FieldName = 'FLGTIPOITEM'
      Visible = False
    end
    object qryIDITEMEMPTMO: TFloatField
      DisplayWidth = 13
      FieldName = 'IDITEMEMPTMO'
      Visible = False
    end
    object qryIDPROCESSO: TFloatField
      DisplayWidth = 11
      FieldName = 'IDPROCESSO'
      Visible = False
    end
    object qryIDREGRA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDREGRA'
      Visible = False
    end
    object qryIDTIPOCONTREMPTMO: TFloatField
      DisplayWidth = 15
      FieldName = 'IDTIPOCONTREMPTMO'
      Visible = False
    end
  end
  object qryLookItem: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   ITE.IDITEMEMPTMO, ITE.ITEDESCRICAO'
      'FROM'
      '   ITEMEMPTMO      ITE,'
      '   ITEMXTIPOCONTR  ITC'
      'WHERE'
      '       ITC.IDTIPOCONTREMPTMO =:PIDTIPOCONTREMPTMO'
      '   AND ITE.IDITEMEMPTMO      = ITC.IDITEMEMPTMO'
      'ORDER BY'
      '   ITE.ITEDESCRICAO')
    ValidateWithMask = True
    Left = 248
    Top = 128
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptUnknown
      end>
    object qryLookItemITEDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldName = 'ITEDESCRICAO'
      Origin = 'BASEDADOS.ITEMEMPTMO.ITEDESCRICAO'
      Size = 40
    end
    object qryLookItemIDITEMEMPTMO: TFloatField
      DisplayLabel = 'Código do Item'
      DisplayWidth = 10
      FieldName = 'IDITEMEMPTMO'
      Origin = 'BASEDADOS.ITEMEMPTMO.IDITEMEMPTMO'
      Visible = False
    end
  end
end
