inherited FrmCadDadosMes: TFrmCadDadosMes
  Left = 394
  Top = 196
  HelpContext = 790139
  Caption = 'Recursos Garantidores'
  ClientHeight = 361
  ClientWidth = 381
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 381
    Height = 275
    inherited pnlMestre: TPanel
      Width = 379
      Height = 68
      object Label1: TLabel
        Left = 21
        Top = 8
        Width = 93
        Height = 13
        Caption = 'Empresa Própria'
      end
      object DbLkcEmpresa: TwwDBLookupCombo
        Left = 20
        Top = 24
        Width = 330
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEEMPRESA'#9'40'#9'Empresa Propria')
        LookupTable = qry
        LookupField = 'IDPESSOA'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 69
      Width = 379
      Height = 205
      Tabs.Strings = (
        'Recursos Garantidores')
      inherited pgctrlDetalhe: TPageControl
        Width = 281
        Height = 146
        inherited tbsDet: TTabSheet
          Caption = 'Eventos '
          inherited pnlControlesDet: TPanel [0]
            Width = 273
            Height = 118
            object LbLValor: TLabel
              Left = 9
              Top = 18
              Width = 30
              Height = 13
              Caption = 'Valor'
            end
            object Label4: TLabel
              Left = 172
              Top = 18
              Width = 28
              Height = 13
              Caption = 'Data'
            end
            object dbreValor: TDBRealEdit
              Left = 9
              Top = 34
              Width = 121
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 0
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLRRECURGARAN'
              DataSource = dsDet
            end
            object DBData: TMaskEdit
              Left = 172
              Top = 35
              Width = 73
              Height = 21
              EditMask = '99/9999;0;_'
              MaxLength = 7
              TabOrder = 1
            end
          end
          inherited dbgrdDet: TwwDBGrid [1]
            Width = 273
            Height = 118
            Selected.Strings = (
              'MESTELA'#9'21'#9'Mes de Referência'
              'VLRRECURGARAN'#9'18'#9'Valor ')
          end
        end
      end
      inherited Dock974: TDock97 [1]
        Left = 285
        Height = 146
        inherited tb97Detalhe: TToolbar97
          inherited bbtnCancelarDet: TBitBtn
            Height = 30
          end
          inherited bbtnVoltarDet: TBitBtn
            Top = 57
          end
        end
      end
      inherited Dock973: TDock97 [2]
        Width = 371
      end
    end
  end
  inherited Dock972: TDock97
    Width = 381
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
  inherited Dock971: TDock97
    Top = 322
    Width = 381
    inherited tb97Fundo: TToolbar97
      Left = 199
      DockPos = 199
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 30
      DockPos = 30
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited dsDet: TwwDataSource
    AutoEdit = True
    DataSet = QryDetalhe
    Left = 236
    Top = 108
  end
  inherited ds: TwwDataSource
    Left = 269
    Top = 56
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update DADOSMESPROP'
      'set'
      '  MES = :MES,'
      '  VLRRECURGARAN = :VLRRECURGARAN'
      'where'
      '  IDEMPRESAPROP = :OLD_IDEMPRESAPROP')
    InsertSQL.Strings = (
      'insert into DADOSMESPROP'
      '  (MES, VLRRECURGARAN)'
      'values'
      '  (:MES, :VLRRECURGARAN)')
    DeleteSQL.Strings = (
      'delete from DADOSMESPROP'
      'where'
      '  IDEMPRESAPROP = :OLD_IDEMPRESAPROP')
    Left = 209
    Top = 56
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'EMPRESAPROP.NOMEEMPRESA'
      'DADOSMESPROP.MES'
      'DADOSMESPROP.VLRRECURGARAN')
    TipodeDado.Strings = (
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Empresa'
      'Data'
      'Valor')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'EMPRESAPROP'
      'DADOSMESPROP')
    CamposChave.Strings = (
      'DADOSMESPROP.MES'
      'DADOSMESPROP.IDEMPRESAPROP')
    Filtro.Strings = (
      'EMPRESAPROP.IDPESSOA = DADOSMESPROP.IDEMPRESAPROP')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '6'
      '10')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1')
    Left = 315
    Top = 56
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT IDPESSOA, NOMEEMPRESA'
      ''
      'FROM EMPRESAPROP'
      '')
    Left = 239
    Top = 56
    object qryNOMEEMPRESA: TStringField
      DisplayLabel = 'Empresa Propria'
      DisplayWidth = 40
      FieldName = 'NOMEEMPRESA'
      Origin = 'EMPRESAPROP.NOMEEMPRESA'
      Size = 60
    end
    object qryIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'EMPRESAPROP.IDPESSOA'
      Visible = False
    end
  end
  object QryDetalhe: TwwQuery
    CachedUpdates = True
    AfterPost = QryDetalheAfterPost
    AfterCancel = QryDetalheAfterCancel
    AfterDelete = QryDetalheAfterDelete
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'SELECT IDEMPRESAPROP,'
      '       SUBSTR(MES,1,2)||'#39'/'#39'||SUBSTR(MES,3,4) AS MESTELA,'
      '       MES,'
      '       VLRRECURGARAN'
      ''
      'FROM DADOSMESPROP'
      ''
      'WHERE (IDEMPRESAPROP = :IDPESSOA)'
      ''
      ' '
      ' '
      ' ')
    UpdateObject = UpdtDet
    ValidateWithMask = True
    Left = 205
    Top = 108
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object QryDetalheMESTELA: TStringField
      DisplayLabel = 'Mes de Referência'
      DisplayWidth = 21
      FieldName = 'MESTELA'
      Size = 7
    end
    object QryDetalheVLRRECURGARAN: TFloatField
      DisplayLabel = 'Valor '
      DisplayWidth = 18
      FieldName = 'VLRRECURGARAN'
      DisplayFormat = '#,###.00'
    end
    object QryDetalheIDEMPRESAPROP: TFloatField
      FieldName = 'IDEMPRESAPROP'
      Visible = False
    end
    object QryDetalheMES: TStringField
      FieldName = 'MES'
      Visible = False
      FixedChar = True
      Size = 6
    end
  end
  object UpdtDet: TUpdateSQL
    ModifySQL.Strings = (
      'update DADOSMESPROP'
      'set'
      '  IDEMPRESAPROP = :IDEMPRESAPROP,'
      '  MES = :MES,'
      '  VLRRECURGARAN = :VLRRECURGARAN'
      'where'
      '  MES = :OLD_MES')
    InsertSQL.Strings = (
      'insert into DADOSMESPROP'
      '  (IDEMPRESAPROP, MES, VLRRECURGARAN)'
      'values'
      '  (:IDEMPRESAPROP, :MES, :VLRRECURGARAN)')
    DeleteSQL.Strings = (
      'delete from DADOSMESPROP'
      'where'
      '  MES = :OLD_MES')
    Left = 268
    Top = 108
  end
end
