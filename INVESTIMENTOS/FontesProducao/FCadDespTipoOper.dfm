inherited FrmCadDespTipoOper: TFrmCadDespTipoOper
  Left = 227
  Top = 94
  HelpContext = 790132
  Caption = 'Rubricas por Tipo de Operação '
  ClientHeight = 449
  ClientWidth = 493
  PixelsPerInch = 96
  TextHeight = 13
  inherited Dock971: TDock97 [0]
    Top = 410
    Width = 493
  end
  inherited Dock972: TDock97
    Width = 493
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Enabled = False
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Enabled = False
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Enabled = False
        Visible = False
      end
    end
  end
  inherited pnlFundo: TPanel [2]
    Width = 493
    Height = 363
    object Label5: TLabel [0]
      Left = 32
      Top = 8
      Width = 120
      Height = 13
      Caption = 'Tipo de Investimento'
    end
    object Label1: TLabel [1]
      Left = 29
      Top = 49
      Width = 107
      Height = 13
      Caption = 'Tipo de Operação '
    end
    inherited pnlMestre: TPanel
      Left = 456
      Top = 8
      Width = 25
      Height = 17
      Align = alNone
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 100
      Width = 491
      Height = 262
      Align = alBottom
      TabOrder = 3
      Tabs.Strings = (
        'Rubricas')
      inherited pgctrlDetalhe: TPageControl
        Width = 393
        Height = 203
        inherited tbsDet: TTabSheet
          Caption = 'Rubricas'
          inherited dbgrdDet: TwwDBGrid
            Width = 385
            Height = 175
            Selected.Strings = (
              'DESCTIPODESPINV'#9'45'#9'Descrição da Rubrica'
              'FLGCALCDIARIO'#9'8'#9'Diário')
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          end
          inherited pnlControlesDet: TPanel
            Width = 385
            Height = 175
            object Bevel1: TBevel
              Left = 10
              Top = 49
              Width = 359
              Height = 48
            end
            object Label2: TLabel
              Left = 16
              Top = 3
              Width = 92
              Height = 13
              Caption = 'Tipo de Rubrica'
            end
            object Label3: TLabel
              Left = 16
              Top = 52
              Width = 99
              Height = 13
              Caption = 'Regra de Cálculo'
            end
            object Label4: TLabel
              Left = 192
              Top = 52
              Width = 123
              Height = 13
              Caption = 'Regra de Vencimento'
            end
            object Label6: TLabel
              Left = 16
              Top = 138
              Width = 112
              Height = 13
              Caption = 'Tipo de Documento'
              Visible = False
            end
            object DbLkcDespesa: TwwDBLookupCombo
              Left = 16
              Top = 19
              Width = 348
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCTIPODESPINV'#9'40'#9'Tipo de Rubrica')
              DataField = 'IDTIPODESPINVEST'
              DataSource = dsDet
              LookupTable = QryDespesa
              LookupField = 'IDTIPODESPINVEST'
              Options = [loColLines, loRowLines, loTitles]
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object DBLkRegraCalc: TwwDBLookupCombo
              Left = 16
              Top = 67
              Width = 172
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMEREGRA'#9'40'#9'Regra')
              DataField = 'IDREGRACALCDESP'
              DataSource = dsDet
              LookupTable = QryRegra
              LookupField = 'IDREGRA'
              Options = [loColLines, loRowLines, loTitles]
              Style = csDropDownList
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object DBLKRegraVenc: TwwDBLookupCombo
              Left = 192
              Top = 67
              Width = 172
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMEREGRA'#9'40'#9'Regra')
              DataField = 'IDREGRADATAVENC'
              DataSource = dsDet
              LookupTable = QryRegra
              LookupField = 'IDREGRA'
              Options = [loColLines, loRowLines, loTitles]
              Style = csDropDownList
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object DBCheckBox2: TDBCheckBox
              Left = 16
              Top = 101
              Width = 88
              Height = 17
              Caption = 'Contabiliza'
              DataField = 'FLGGERACONTAB'
              DataSource = dsDet
              TabOrder = 3
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCheckBox3: TDBCheckBox
              Left = 16
              Top = 119
              Width = 129
              Height = 17
              Caption = 'Integra CaP/CaR'
              DataField = 'FLGGERACAPCAR'
              DataSource = dsDet
              TabOrder = 4
              ValueChecked = '1'
              ValueUnchecked = '0'
              OnClick = DBCheckBox3Click
            end
            object DbCmbRecPag: TwwDBComboBox
              Left = 144
              Top = 117
              Width = 129
              Height = 21
              ShowButton = True
              Style = csDropDown
              MapList = True
              AllowClearKey = True
              AutoDropDown = True
              DataField = 'RECPAG'
              DataSource = dsDet
              DropDownCount = 8
              ItemHeight = 0
              Items.Strings = (
                'Recebimento'#9'R'
                'Desconto'#9'D'
                'Pagamento'#9'P'
                'Dedução '#9'U')
              Sorted = False
              TabOrder = 5
              UnboundDataType = wwDefault
              Visible = False
              OnChange = DbCmbRecPagChange
            end
            object DbLkcTipoDoc: TwwDBLookupCombo
              Left = 16
              Top = 152
              Width = 348
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'40'#9'Descrição')
              DataField = 'CODTIPDOC'
              DataSource = dsDet
              LookupTable = QryTipoDoc
              LookupField = 'CODTIPDOC'
              Options = [loColLines, loRowLines, loTitles]
              TabOrder = 6
              Visible = False
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
          end
        end
      end
      inherited Dock974: TDock97 [1]
        Left = 397
        Height = 203
      end
      inherited Dock973: TDock97 [2]
        Width = 483
      end
    end
    object DBLkTipoOper: TwwDBLookupCombo
      Left = 31
      Top = 66
      Width = 430
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCTIPOOPERACAO'#9'40'#9'Tipo de Operação')
      LookupTable = qry
      LookupField = 'IDTIPOOPERACAO'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 2
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object DbLkTipoInvest: TwwDBLookupCombo
      Left = 31
      Top = 24
      Width = 430
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCTIPOINVEST'#9'40'#9'Tipo de Investimento')
      LookupTable = QryInvestimento
      LookupField = 'IDTIPOINVEST'
      Options = [loColLines, loRowLines, loTitles]
      TabOrder = 1
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      OnChange = DbLkTipoInvestChange
      OnEnter = DbLkTipoInvestEnter
      OnExit = DbLkTipoInvestExit
    end
  end
  inherited dsDet: TwwDataSource
    AutoEdit = True
    DataSet = QryDetalhe
    Left = 454
    Top = 169
  end
  inherited ds: TwwDataSource
    Left = 373
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TIPOOPERACAO'
      'set'
      '  IDTIPOOPERACAO = :IDTIPOOPERACAO,'
      '  IDTIPOINVEST = :IDTIPOINVEST,'
      '  IDMERCADO = :IDMERCADO,'
      '  DESCTIPOOPERACAO = :DESCTIPOOPERACAO,'
      '  NATUREZAOPERACAO = :NATUREZAOPERACAO,'
      '  TIPOCUSTODIA = :TIPOCUSTODIA,'
      '  FLGAUMENTA = :FLGAUMENTA,'
      '  VENCIMENTO = :VENCIMENTO'
      'where'
      '  IDTIPOOPERACAO = :OLD_IDTIPOOPERACAO and'
      '  IDTIPOINVEST = :OLD_IDTIPOINVEST')
    InsertSQL.Strings = (
      'insert into TIPOOPERACAO'
      '  (IDTIPOOPERACAO, IDTIPOINVEST, IDMERCADO, DESCTIPOOPERACAO, '
      'NATUREZAOPERACAO, '
      '   TIPOCUSTODIA, FLGAUMENTA, VENCIMENTO)'
      'values'
      
        '  (:IDTIPOOPERACAO, :IDTIPOINVEST, :IDMERCADO, :DESCTIPOOPERACAO' +
        ', '
      ':NATUREZAOPERACAO, '
      '   :TIPOCUSTODIA, :FLGAUMENTA, :VENCIMENTO)')
    DeleteSQL.Strings = (
      'delete from TIPOOPERACAO'
      'where'
      '  IDTIPOOPERACAO = :OLD_IDTIPOOPERACAO and'
      '  IDTIPOINVEST = :OLD_IDTIPOINVEST')
    Left = 313
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TIPOINVEST.DESCTIPOINVEST'
      'TIPOOPERACAO.DESCTIPOOPERACAO')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Tipo de Investimento '
      'Tipo de Operação ')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'TIPOOPERACAO'
      'TIPOINVEST')
    CamposChave.Strings = (
      'TIPOOPERACAO.IDTIPOINVEST'
      'TIPOOPERACAO.IDTIPOOPERACAO')
    Filtro.Strings = (
      'TIPOINVEST.IDTIPOINVEST=TIPOOPERACAO.IDTIPOINVEST')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '40'
      '40')
    Left = 403
  end
  inherited qry: TwwQuery
    AfterScroll = qryAfterScroll
    DataSource = DsInvestimento
    SQL.Strings = (
      'SELECT'
      '   IDTIPOINVEST, IDTIPOOPERACAO, IDMERCADO, DESCTIPOOPERACAO,'
      '   NATUREZAOPERACAO, TIPOCUSTODIA,  VENCIMENTO'
      'FROM'
      '   TIPOOPERACAO'
      'WHERE'
      '   (IDTIPOINVEST = :IDTIPOINVEST) AND'
      '   ((STAATIVO = '#39'S'#39') OR (STAATIVO IS NULL))'
      'ORDER BY DESCTIPOOPERACAO'
      ''
      ' ')
    UpdateObject = nil
    Left = 343
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDTIPOINVEST'
        ParamType = ptUnknown
      end>
    object qryDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Tipo de Operação'
      DisplayWidth = 40
      FieldName = 'DESCTIPOOPERACAO'
      Origin = 'TIPOOPERACAO.DESCTIPOOPERACAO'
      Size = 60
    end
    object qryIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Origin = 'TIPOOPERACAO.IDTIPOINVEST'
      Visible = False
    end
    object qryIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'TIPOOPERACAO.IDTIPOOPERACAO'
      Visible = False
    end
    object qryIDMERCADO: TFloatField
      FieldName = 'IDMERCADO'
      Origin = 'TIPOOPERACAO.IDMERCADO'
      Visible = False
    end
    object qryNATUREZAOPERACAO: TStringField
      FieldName = 'NATUREZAOPERACAO'
      Origin = 'TIPOOPERACAO.NATUREZAOPERACAO'
      Visible = False
      Size = 1
    end
    object qryTIPOCUSTODIA: TStringField
      FieldName = 'TIPOCUSTODIA'
      Origin = 'TIPOOPERACAO.TIPOCUSTODIA'
      Visible = False
      Size = 1
    end
    object qryVENCIMENTO: TFloatField
      FieldName = 'VENCIMENTO'
      Origin = 'TIPOOPERACAO.VENCIMENTO'
      Visible = False
    end
  end
  object QryDetalhe: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      
        'SELECT '#9'DO.IDTIPOINVEST, DO.IDTIPOOPERACAO, DO.IDTIPODESPINVEST,' +
        ' DO.IDREGRACALCDESP, '
      #9'DO.IDREGRADATAVENC, DO.FLGCALCDIARIO, TD.DESCTIPODESPINV,'
      #9'DO.FLGGERACONTAB, DO.FLGGERACAPCAR, DO.CODTIPDOC, DO.RECPAG'
      ''
      'FROM '#9'DESPESASXTIPOOPER DO, TIPODESPINVEST TD'
      ''
      'WHERE '#9'DO.IDTIPODESPINVEST = TD.IDTIPODESPINVEST  AND'
      #9'DO.IDTIPOINVEST         = :IDTIPOINVEST   '#9' AND '
      #9'DO.IDTIPOOPERACAO  =  :IDTIPOOPERACAO'
      '')
    UpdateObject = UpdDetalhe
    ControlType.Strings = (
      'FLGCALCDIARIO;CheckBox;1;0')
    ValidateWithMask = True
    Left = 424
    Top = 169
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDTIPOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDTIPOOPERACAO'
        ParamType = ptUnknown
      end>
    object QryDetalheDESCTIPODESPINV: TStringField
      DisplayLabel = 'Descrição da Rubrica'
      DisplayWidth = 45
      FieldName = 'DESCTIPODESPINV'
      Size = 60
    end
    object QryDetalheFLGCALCDIARIO: TFloatField
      Alignment = taCenter
      DisplayLabel = 'Diário'
      DisplayWidth = 8
      FieldName = 'FLGCALCDIARIO'
    end
    object QryDetalheIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Visible = False
    end
    object QryDetalheIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Visible = False
    end
    object QryDetalheIDTIPODESPINVEST: TFloatField
      FieldName = 'IDTIPODESPINVEST'
      Visible = False
    end
    object QryDetalheIDREGRACALCDESP: TFloatField
      FieldName = 'IDREGRACALCDESP'
      Visible = False
    end
    object QryDetalheIDREGRADATAVENC: TFloatField
      FieldName = 'IDREGRADATAVENC'
      Visible = False
    end
    object QryDetalheFLGGERACONTAB: TFloatField
      FieldName = 'FLGGERACONTAB'
      Visible = False
    end
    object QryDetalheFLGGERACAPCAR: TFloatField
      FieldName = 'FLGGERACAPCAR'
      Visible = False
    end
    object QryDetalheCODTIPDOC: TFloatField
      FieldName = 'CODTIPDOC'
      Visible = False
    end
    object QryDetalheRECPAG: TStringField
      FieldName = 'RECPAG'
      Visible = False
      Size = 1
    end
  end
  object QryTipoOperacao: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'select        TpO.IdTipoInvest,'
      '                 TpO.IdTipoOperacao, '
      '                 TpO.IdMercado, '
      '                 TpO.DescTipoOperacao,'
      '                 TpO.NaturezaOperacao,'
      '                 Tpo.TipoCustodia'
      ''
      'from           TipoOperacao TpO'
      ''
      'Where     TPO.IdTipoInvest = :Investimento and '
      #9'TPO.IDTIPOOPERACAO > 0 ')
    ValidateWithMask = True
    Left = 408
    Top = 331
    ParamData = <
      item
        DataType = ftFloat
        Name = 'Investimento'
        ParamType = ptUnknown
      end>
  end
  object QryDespesa: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT IDTIPODESPINVEST, DESCTIPODESPINV'
      ''
      'FROM TIPODESPINVEST'
      ''
      'ORDER BY DESCTIPODESPINV')
    ValidateWithMask = True
    Left = 408
    Top = 299
    object QryDespesaDESCTIPODESPINV: TStringField
      DisplayLabel = 'Tipo de Rubrica'
      DisplayWidth = 40
      FieldName = 'DESCTIPODESPINV'
      Origin = 'TIPODESPINVEST.DESCTIPODESPINV'
      Size = 60
    end
    object QryDespesaIDTIPODESPINVEST: TFloatField
      FieldName = 'IDTIPODESPINVEST'
      Origin = 'TIPODESPINVEST.IDTIPODESPINVEST'
      Visible = False
    end
  end
  object QryRegra: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT'
      '   A.IDREGRA,'
      '   A.NOMEREGRA'
      'FROM'
      '    REGRA A'
      'ORDER BY A.NOMEREGRA'
      ''
      ' ')
    ValidateWithMask = True
    Left = 444
    Top = 299
    object QryRegraIDREGRA: TFloatField
      FieldName = 'IDREGRA'
      Origin = 'REGRA.IDREGRA'
    end
    object QryRegraNOMEREGRA: TStringField
      FieldName = 'NOMEREGRA'
      Origin = 'REGRA.NOMEREGRA'
      Size = 60
    end
  end
  object UpdDetalhe: TUpdateSQL
    ModifySQL.Strings = (
      'update DESPESASXTIPOOPER'
      'set'
      '  IDTIPOINVEST = :IDTIPOINVEST,'
      '  IDTIPOOPERACAO = :IDTIPOOPERACAO,'
      '  IDTIPODESPINVEST = :IDTIPODESPINVEST,'
      '  IDREGRACALCDESP = :IDREGRACALCDESP,'
      '  IDREGRADATAVENC = :IDREGRADATAVENC,'
      '  RECPAG = :RECPAG,'
      '  FLGCALCDIARIO = :FLGCALCDIARIO,'
      '  FLGGERACONTAB = :FLGGERACONTAB,'
      '  FLGGERACAPCAR = :FLGGERACAPCAR,'
      '  CODTIPDOC = :CODTIPDOC'
      'where'
      '  IDTIPOINVEST = :OLD_IDTIPOINVEST and'
      '  IDTIPOOPERACAO = :OLD_IDTIPOOPERACAO and'
      '  IDTIPODESPINVEST = :OLD_IDTIPODESPINVEST')
    InsertSQL.Strings = (
      'insert into DESPESASXTIPOOPER'
      
        '  (IDTIPOINVEST, IDTIPOOPERACAO, IDTIPODESPINVEST, IDREGRACALCDE' +
        'SP, IDREGRADATAVENC, '
      
        '   RECPAG, FLGCALCDIARIO, FLGGERACONTAB, FLGGERACAPCAR, CODTIPDO' +
        'C)'
      'values'
      
        '  (:IDTIPOINVEST, :IDTIPOOPERACAO, :IDTIPODESPINVEST, :IDREGRACA' +
        'LCDESP, '
      
        '   :IDREGRADATAVENC, :RECPAG, :FLGCALCDIARIO, :FLGGERACONTAB, :F' +
        'LGGERACAPCAR, '
      '   :CODTIPDOC)')
    DeleteSQL.Strings = (
      'delete from DESPESASXTIPOOPER'
      'where'
      '  IDTIPOINVEST = :OLD_IDTIPOINVEST and'
      '  IDTIPOOPERACAO = :OLD_IDTIPOOPERACAO and'
      '  IDTIPODESPINVEST = :OLD_IDTIPODESPINVEST')
    Left = 394
    Top = 169
  end
  object QryInvestimento: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT'#9'TI.IDTIPOINVEST, TI.DESCTIPOINVEST'
      ''
      'FROM     '#9'TIPOINVEST TI'
      ''
      'WHERE '#9'TI.IDTIPOINVEST  IN            '
      #9#9'(SELECT  TPO.IDTIPOINVEST FROM TIPOOPERACAO TPO )')
    ValidateWithMask = True
    Left = 253
    Top = 8
    object QryInvestimentoIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
    end
    object QryInvestimentoDESCTIPOINVEST: TStringField
      FieldName = 'DESCTIPOINVEST'
      Size = 60
    end
  end
  object DsInvestimento: TwwDataSource
    DataSet = QryInvestimento
    Left = 283
    Top = 8
  end
  object QryTipoDoc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CODTIPDOC, RECPAG, DESCRICAO, DEBCRE'
      'FROM'
      '   TIPODOCRECPAG'
      'WHERE'
      '  ( RECPAG =:RECPAG ) AND'
      '  ( DEBCRE =:DEBCRE )'
      'ORDER BY'
      '   DESCRICAO')
    ValidateWithMask = True
    Left = 445
    Top = 330
    ParamData = <
      item
        DataType = ftString
        Name = 'RECPAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DEBCRE'
        ParamType = ptUnknown
      end>
    object QryTipoDocDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 40
      FieldName = 'DESCRICAO'
      Origin = 'TIPODOCRECPAG.DESCRICAO'
      Size = 35
    end
    object QryTipoDocCODTIPDOC: TFloatField
      FieldName = 'CODTIPDOC'
      Origin = 'TIPODOCRECPAG.CODTIPDOC'
      Visible = False
    end
  end
end
