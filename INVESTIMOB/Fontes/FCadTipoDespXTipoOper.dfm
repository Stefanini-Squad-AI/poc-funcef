inherited FrmCadTipoDespXTipoOper: TFrmCadTipoDespXTipoOper
  Left = 48
  Caption = 'FrmCadTipoDespXTipoOper'
  ClientHeight = 367
  ClientWidth = 710
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 710
    Height = 332
    inherited Panel1: TPanel
      Width = 700
      object Label1: TLabel
        Left = 24
        Top = 12
        Width = 107
        Height = 13
        Caption = 'Tipo de Operação '
      end
      object DBcboTipoOperacao: TwwDBLookupCombo
        Left = 24
        Top = 28
        Width = 321
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCTIPOOPERACAO'#9'60'#9'DESCTIPOOPERACAO')
        LookupTable = dtmLookImobiliario.qryLookTipoOperInvest
        LookupField = 'IDTIPOOPERACAO'
        Style = csDropDownList
        DropDownWidth = 8
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
        OnChange = DBcboTipoOperacaoChange
      end
      object rdoRecPag: TRadioGroup
        Left = 378
        Top = 12
        Width = 297
        Height = 41
        Columns = 2
        Items.Strings = (
          'a Pagar'
          'a Receber')
        TabOrder = 1
      end
    end
    inherited pgc: TPageControl
      Width = 700
      Height = 262
      inherited tbs: TTabSheet
        inherited Dock973: TDock97
          Width = 692
        end
        inherited pnlControles: TPanel
          Width = 385
          Height = 221
          Align = alLeft
          object Label3: TLabel
            Left = 8
            Top = 8
            Width = 92
            Height = 13
            Caption = 'Tipo de Rubrica'
          end
          object Label2: TLabel
            Left = 8
            Top = 181
            Width = 112
            Height = 13
            Caption = 'Tipo de Documento'
          end
          object DBcboTipoDespesa: TwwDBLookupCombo
            Left = 8
            Top = 24
            Width = 321
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCTIPODESPINV'#9'60'#9'DESCTIPODESPINV')
            DataField = 'IDTIPODESPINVEST'
            DataSource = ds
            LookupTable = qryLookTipoDespesa
            LookupField = 'IDTIPODESPINVEST'
            Style = csDropDownList
            DropDownWidth = 8
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
          end
          object DBrdgRecPagDesp: TDBRadioGroup
            Left = 8
            Top = 47
            Width = 321
            Height = 51
            Hint = 
              'Dedução diminui Contas a Pagar'#13#10'Desconto diminui Contas a Recebe' +
              'r'
            Columns = 2
            DataField = 'RECPAG'
            DataSource = ds
            Items.Strings = (
              'a Pagar'
              'Dedução'
              'a Receber'
              'Desconto')
            TabOrder = 1
            Values.Strings = (
              'P'
              'U'
              'R'
              'D')
          end
          object GroupBox1: TGroupBox
            Left = 8
            Top = 100
            Width = 321
            Height = 77
            TabOrder = 2
            object DBchkGeraContab: TDBCheckBox
              Left = 12
              Top = 33
              Width = 297
              Height = 17
              Caption = 'Contabilizar Rubrica'
              DataField = 'FLGGERACONTAB'
              DataSource = ds
              TabOrder = 1
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBCheckBox1: TDBCheckBox
              Left = 12
              Top = 53
              Width = 297
              Height = 17
              Caption = 'Agregar valor / contabilizar pelo Ativo Fixo'
              DataField = 'FLGGERACAF'
              DataSource = ds
              TabOrder = 2
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
            object DBchkGeraCAPCAR: TDBCheckBox
              Left = 12
              Top = 13
              Width = 297
              Height = 17
              Caption = 'Gerar Documento de Contas a Pagar / Receber'
              DataField = 'FLGGERACAPCAR'
              DataSource = ds
              TabOrder = 0
              ValueChecked = '1'
              ValueUnchecked = '0'
            end
          end
          object DBcboTipoDoc: TwwDBLookupCombo
            Left = 8
            Top = 197
            Width = 321
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'35'#9'DESCRICAO')
            DataField = 'CODTIPDOC'
            DataSource = ds
            LookupTable = qryLookTipoDoc
            LookupField = 'CODTIPDOC'
            Style = csDropDownList
            DropDownCount = 5
            DropDownWidth = 8
            TabOrder = 3
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
          end
        end
        inherited pnlGrd: TPanel
          Left = 385
          Top = 31
          Width = 878
          Height = 221
          Align = alLeft
          inherited DBgrd: TwwDBGrid
            Left = 0
            Top = 0
            Width = 878
            Height = 221
            Selected.Strings = (
              'DESCTIPODESPINV'#9'60'#9'Rubrica')
            Align = alClient
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 332
    Width = 710
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update DESPESASXTIPOOPER'
      'set'
      '  IDTIPOINVEST = :IDTIPOINVEST,'
      '  IDTIPOOPERACAO = :IDTIPOOPERACAO,'
      '  IDTIPODESPINVEST = :IDTIPODESPINVEST,'
      '  IDREGRACALCDESP = :IDREGRACALCDESP,'
      '  CODTIPDOC = :CODTIPDOC,'
      '  IDREGRADATAVENC = :IDREGRADATAVENC,'
      '  FLGCALCDIARIO = :FLGCALCDIARIO,'
      '  FLGGERACONTAB = :FLGGERACONTAB,'
      '  FLGGERACAPCAR = :FLGGERACAPCAR,'
      '  RECPAG = :RECPAG,'
      '  FLGGERACAF = :FLGGERACAF'
      'where'
      '  IDTIPOINVEST = :OLD_IDTIPOINVEST and'
      '  IDTIPOOPERACAO = :OLD_IDTIPOOPERACAO and'
      '  IDTIPODESPINVEST = :OLD_IDTIPODESPINVEST')
    InsertSQL.Strings = (
      'insert into DESPESASXTIPOOPER'
      
        '  (IDTIPOINVEST, IDTIPOOPERACAO, IDTIPODESPINVEST, IDREGRACALCDE' +
        'SP, CODTIPDOC, '
      
        '   IDREGRADATAVENC, FLGCALCDIARIO, FLGGERACONTAB, FLGGERACAPCAR,' +
        ' RECPAG, '
      '   FLGGERACAF)'
      'values'
      
        '  (:IDTIPOINVEST, :IDTIPOOPERACAO, :IDTIPODESPINVEST, :IDREGRACA' +
        'LCDESP, '
      
        '   :CODTIPDOC, :IDREGRADATAVENC, :FLGCALCDIARIO, :FLGGERACONTAB,' +
        ' :FLGGERACAPCAR, '
      '   :RECPAG, :FLGGERACAF)')
    DeleteSQL.Strings = (
      'delete from DESPESASXTIPOOPER'
      'where'
      '  IDTIPOINVEST = :OLD_IDTIPOINVEST and'
      '  IDTIPOOPERACAO = :OLD_IDTIPOOPERACAO and'
      '  IDTIPODESPINVEST = :OLD_IDTIPODESPINVEST')
    Left = 240
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '   X.IDTIPOINVEST, X.IDTIPOOPERACAO, X.IDTIPODESPINVEST,'
      '   X.IDREGRACALCDESP, X.IDREGRADATAVENC, X.FLGCALCDIARIO,'
      '   X.FLGGERACONTAB, X.FLGGERACAPCAR, X.RECPAG, X.CODTIPDOC,'
      '   X.FLGGERACAF,'
      '   D.DESCTIPODESPINV'
      'FROM'
      '   DESPESASXTIPOOPER X, TIPODESPINVEST D'
      'WHERE'
      '   ('
      '   ( IDTIPOINVEST =:PIDTIPOINVEST ) AND'
      '   ( IDTIPOOPERACAO =:PIDTIPOOPERACAO )'
      '   )'
      '   AND'
      '   ( X.IDTIPODESPINVEST = D.IDTIPODESPINVEST )'
      'ORDER BY'
      '   D.DESCTIPODESPINV'
      ' ')
    Left = 272
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDTIPOINVEST'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOOPERACAO'
        ParamType = ptUnknown
      end>
    object qryDESCTIPODESPINV: TStringField
      DisplayLabel = 'Rubrica'
      DisplayWidth = 60
      FieldName = 'DESCTIPODESPINV'
      Origin = 'BASEDADOS.TIPODESPINVEST.DESCTIPODESPINV'
      Size = 60
    end
    object qryIDTIPOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOINVEST'
      Origin = 'BASEDADOS.DESPESASXTIPOOPER.IDTIPOINVEST'
      Visible = False
    end
    object qryIDTIPOOPERACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOOPERACAO'
      Origin = 'BASEDADOS.DESPESASXTIPOOPER.IDTIPOOPERACAO'
      Visible = False
    end
    object qryIDTIPODESPINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPODESPINVEST'
      Origin = 'BASEDADOS.DESPESASXTIPOOPER.IDTIPODESPINVEST'
      Visible = False
    end
    object qryIDREGRACALCDESP: TFloatField
      DisplayWidth = 10
      FieldName = 'IDREGRACALCDESP'
      Origin = 'BASEDADOS.DESPESASXTIPOOPER.IDREGRACALCDESP'
      Visible = False
    end
    object qryIDREGRADATAVENC: TFloatField
      DisplayWidth = 10
      FieldName = 'IDREGRADATAVENC'
      Origin = 'BASEDADOS.DESPESASXTIPOOPER.IDREGRADATAVENC'
      Visible = False
    end
    object qryFLGCALCDIARIO: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGCALCDIARIO'
      Origin = 'BASEDADOS.DESPESASXTIPOOPER.FLGCALCDIARIO'
      Visible = False
    end
    object qryFLGGERACONTAB: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGGERACONTAB'
      Origin = 'BASEDADOS.DESPESASXTIPOOPER.FLGGERACONTAB'
      Visible = False
    end
    object qryFLGGERACAPCAR: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGGERACAPCAR'
      Origin = 'BASEDADOS.DESPESASXTIPOOPER.FLGGERACAPCAR'
      Visible = False
    end
    object qryRECPAG: TStringField
      DisplayWidth = 1
      FieldName = 'RECPAG'
      Origin = 'BASEDADOS.DESPESASXTIPOOPER.RECPAG'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryCODTIPDOC: TFloatField
      DisplayWidth = 10
      FieldName = 'CODTIPDOC'
      Origin = 'BASEDADOS.DESPESASXTIPOOPER.CODTIPDOC'
      Visible = False
    end
    object qryFLGGERACAF: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGGERACAF'
      Origin = 'BASEDADOS.DESPESASXTIPOOPER.FLGGERACAF'
      Visible = False
    end
  end
  inherited ds: TwwDataSource
    Left = 304
  end
  inherited CmeCadastro: TCmEventosCadastro
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 485
    Top = 21
  end
  object qryLookTipoDespesa: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   IDTIPODESPINVEST, DESCTIPODESPINV'
      'FROM'
      '   TIPODESPINVEST'
      'ORDER BY'
      '   DESCTIPODESPINV')
    ValidateWithMask = True
    Left = 248
    Top = 99
    object qryLookTipoDespesaDESCTIPODESPINV: TStringField
      DisplayWidth = 60
      FieldName = 'DESCTIPODESPINV'
      Origin = '"CM.TIPODESPINVEST".DESCTIPODESPINV'
      Size = 60
    end
    object qryLookTipoDespesaIDTIPODESPINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPODESPINVEST'
      Origin = '"CM.TIPODESPINVEST".IDTIPODESPINVEST'
      Visible = False
    end
  end
  object qryLookTipoDoc: TwwQuery
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
    Left = 248
    Top = 272
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
    object qryLookTipoDocDESCRICAO: TStringField
      DisplayWidth = 35
      FieldName = 'DESCRICAO'
      Origin = 'TIPODOCRECPAG.DESCRICAO'
      Size = 35
    end
    object qryLookTipoDocCODTIPDOC: TFloatField
      DisplayWidth = 10
      FieldName = 'CODTIPDOC'
      Origin = 'TIPODOCRECPAG.CODTIPDOC'
      Visible = False
    end
    object qryLookTipoDocRECPAG: TStringField
      DisplayWidth = 1
      FieldName = 'RECPAG'
      Origin = 'TIPODOCRECPAG.RECPAG'
      Visible = False
      Size = 1
    end
    object qryLookTipoDocDEBCRE: TStringField
      DisplayWidth = 1
      FieldName = 'DEBCRE'
      Origin = 'TIPODOCRECPAG.DEBCRE'
      Visible = False
      Size = 1
    end
  end
end
