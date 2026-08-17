inherited FrmCadGrupoAut: TFrmCadGrupoAut
  Left = 24
  Top = 65
  Caption = 'Grupo de Autorização'
  ClientHeight = 433
  ClientWidth = 715
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel [0]
    Left = 8
    Top = 8
    Width = 157
    Height = 13
    Caption = 'Grupo de Responsabilidade'
    FocusControl = edDesc
  end
  inherited pnlFundo: TPanel
    Width = 715
    Height = 347
    inherited pnlMestre: TPanel
      Width = 705
      Height = 60
      object Label1: TLabel
        Left = 16
        Top = 8
        Width = 58
        Height = 13
        Caption = 'Descrição'
        FocusControl = edDesc
      end
      object edDesc: TDBEdit
        Left = 16
        Top = 24
        Width = 441
        Height = 21
        DataField = 'NOMEGRUPOAUT'
        DataSource = ds
        TabOrder = 0
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 65
      Width = 705
      Height = 277
      Tabs.Strings = (
        'Grupos de Responsabilidade')
      inherited pgctrlDetalhe: TPageControl
        Width = 607
        Height = 218
        inherited tbsDet: TTabSheet
          Caption = 'Grupos de Responsabilidade'
          inherited pnlControlesDet: TPanel [0]
            Width = 599
            Height = 190
            object Label2: TLabel
              Left = 16
              Top = 8
              Width = 157
              Height = 13
              Caption = 'Grupo de Responsabilidade'
              FocusControl = edDesc
            end
            object Label4: TLabel
              Left = 304
              Top = 8
              Width = 92
              Height = 13
              Caption = 'Centro de Custo'
              FocusControl = edDesc
            end
            object Label5: TLabel
              Left = 16
              Top = 152
              Width = 67
              Height = 13
              Caption = 'Valor inicial'
              FocusControl = edDesc
            end
            object Label6: TLabel
              Left = 16
              Top = 56
              Width = 160
              Height = 13
              Caption = 'Centro de Responsabilidade'
              FocusControl = edDesc
            end
            object Label7: TLabel
              Left = 304
              Top = 56
              Width = 107
              Height = 13
              Caption = 'Grupo de Produtos'
              FocusControl = edDesc
            end
            object Label8: TLabel
              Left = 16
              Top = 104
              Width = 108
              Height = 13
              Caption = 'Atividade / Projeto'
              FocusControl = edDesc
            end
            object Label9: TLabel
              Left = 448
              Top = 104
              Width = 130
              Height = 13
              Caption = 'Nº  Ordem das Autoriz.'
              FocusControl = edDesc
            end
            object Label10: TLabel
              Left = 145
              Top = 172
              Width = 15
              Height = 13
              Caption = 'de'
              FocusControl = edDesc
            end
            object Label11: TLabel
              Left = 168
              Top = 152
              Width = 61
              Height = 13
              Caption = 'Valor Final'
              FocusControl = edDesc
            end
            object Label12: TLabel
              Left = 304
              Top = 152
              Width = 39
              Height = 13
              Caption = 'Moeda'
              FocusControl = edDesc
            end
            object Label13: TLabel
              Left = 304
              Top = 104
              Width = 110
              Height = 13
              Caption = 'Nº de Autorizações'
              FocusControl = edDesc
            end
            object dblcGrpResp: TCMDBLookupCombo
              Left = 16
              Top = 24
              Width = 273
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'30'#9'Descrição')
              DataField = 'IDGRPRESPON'
              DataSource = dsDet
              LookupTable = qryGrpResp
              LookupField = 'IDGRPRESPON'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object dblcCentCust: TCMDBLookupCombo
              Left = 304
              Top = 24
              Width = 289
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'30'#9'Descrição'
                'CODCENTROCUSTO'#9'10'#9'Código')
              DataField = 'CODCENTROCUSTO'
              DataSource = dsDet
              LookupTable = qryCentCust
              LookupField = 'CODCENTROCUSTO'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object edValor: TDBRealEdit
              Left = 16
              Top = 168
              Width = 121
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 6
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLRINICIAL'
              DataSource = dsDet
            end
            object dblcCentResp: TCMDBLookupCombo
              Left = 16
              Top = 72
              Width = 273
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'30'#9'Descrição'
                'CODCENTRORESPON'#9'10'#9'Código')
              DataField = 'CODCENTRORESPON'
              DataSource = dsDet
              LookupTable = qryCentResp
              LookupField = 'CODCENTRORESPON'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object dblcGrpProd: TCMDBLookupCombo
              Left = 304
              Top = 72
              Width = 289
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCGRUPOPROD'#9'30'#9'Descrição'
                'CODGRUPOPROD'#9'10'#9'Código')
              DataField = 'CODGRUPOPROD'
              DataSource = dsDet
              LookupTable = qryGrpProd
              LookupField = 'CODGRUPOPROD'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object dblcUnNegoc: TCMDBLookupCombo
              Left = 16
              Top = 120
              Width = 273
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'25'#9'Descrição'
                'UNECODIGO'#9'10'#9'Código')
              DataField = 'UNIDNEGOC'
              DataSource = dsDet
              LookupTable = qryUnNegoc
              LookupField = 'UNIDNEGOC'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 4
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object dbreNumAuto: TDBRealEdit
              Left = 304
              Top = 120
              Width = 137
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0')
              TabOrder = 5
              WordWrap = False
              IntDigits = 10
              DecDigits = 0
              NumberFormat = fNumber
              Signal = False
              DataField = 'NUMAUTORIZACAO'
              DataSource = dsDet
            end
            object DBRealEdit1: TDBRealEdit
              Left = 168
              Top = 168
              Width = 120
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 7
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLRFINAL'
              DataSource = dsDet
            end
            object dblcMoeda: TCMDBLookupCombo
              Left = 304
              Top = 168
              Width = 289
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'MOEDESC'#9'20'#9'Descrição'
                'MOECODIGO'#9'10'#9'Código')
              DataField = 'MOECODIGO'
              DataSource = dsDet
              LookupTable = qryMoeda
              LookupField = 'MOECODIGO'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 8
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object edSeqAut: TDBRealEdit
              Left = 448
              Top = 120
              Width = 145
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0')
              TabOrder = 9
              WordWrap = False
              IntDigits = 10
              DecDigits = 0
              NumberFormat = fNumber
              Signal = False
              DataField = 'SEQAUTORIZACAO'
              DataSource = dsDet
            end
          end
          inherited dbgrdDet: TwwDBGrid [1]
            Width = 599
            Height = 190
            Selected.Strings = (
              'SEQAUTORIZACAO'#9'2'#9' '#9'F'
              'DESCGRPRESPON'#9'30'#9'Grupo~Responsabilidade'#9'F'
              'DESCUNIDNEG'#9'25'#9'Atividade/Projeto'#9'F'
              'NUMAUTORIZACAO'#9'10'#9'Nº de Autorizações'#9'F'
              'NOME'#9'30'#9'Centro de Custo'#9'F'
              'DESCGRUPOPROD'#9'30'#9'Grupo de Produtos'#9'F'
              'DESCCENTRESP'#9'30'#9'Centro~Responsabilidade'#9'F'
              'VLRINICIAL'#9'10'#9'Valor~Inicial'#9'F'
              'VLRFINAL'#9'10'#9'Valor~Final'#9'F')
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            TitleAlignment = taCenter
            TitleLines = 2
          end
        end
      end
      inherited Dock973: TDock97
        Width = 697
      end
      inherited Dock974: TDock97
        Left = 611
        Height = 218
      end
    end
  end
  inherited Dock972: TDock97
    Width = 715
  end
  inherited Dock971: TDock97
    Top = 394
    Width = 715
    inherited tb97Fundo: TToolbar97
      Left = 545
      DockPos = 545
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 377
      DockPos = 377
    end
  end
  inherited qry: TwwQuery
    AutoCalcFields = False
    SQL.Strings = (
      'SELECT'
      '      IDGRUPOAUTORIZA,'
      '      NOMEGRUPOAUT'
      'FROM'
      '      RADGRUPOAUTORIZA'
      'WHERE'
      '     (IDGRUPOAUTORIZA = :pIDAUT)'
      '           ')
    Left = 319
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDAUT'
        ParamType = ptUnknown
      end>
    object qryIDGRUPOAUTORIZA: TFloatField
      FieldName = 'IDGRUPOAUTORIZA'
      Origin = 'RADGRUPOAUTORIZA.IDGRUPOAUTORIZA'
    end
    object qryNOMEGRUPOAUT: TStringField
      FieldName = 'NOMEGRUPOAUT'
      Origin = 'RADGRUPOAUTORIZA.NOMEGRUPOAUT'
      Size = 60
    end
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 466
    Top = 9
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 779
    Top = 65523
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update RADGRUPOAUTORIZA'
      'set'
      '  IDGRUPOAUTORIZA = :IDGRUPOAUTORIZA,'
      '  NOMEGRUPOAUT = :NOMEGRUPOAUT'
      'where'
      '  IDGRUPOAUTORIZA = :OLD_IDGRUPOAUTORIZA')
    InsertSQL.Strings = (
      'insert into RADGRUPOAUTORIZA'
      '  (IDGRUPOAUTORIZA, NOMEGRUPOAUT)'
      'values'
      '  (:IDGRUPOAUTORIZA, :NOMEGRUPOAUT)')
    DeleteSQL.Strings = (
      'delete from RADGRUPOAUTORIZA'
      'where'
      '  IDGRUPOAUTORIZA = :OLD_IDGRUPOAUTORIZA')
    Left = 281
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'RADGRUPOAUTORIZA.NOMEGRUPOAUT')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição do Grupo')
    Tabelas.Strings = (
      'RADGRUPOAUTORIZA')
    CamposChave.Strings = (
      'RADGRUPOAUTORIZA.IDGRUPOAUTORIZA')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    Left = 647
    Top = 5
  end
  inherited ds: TwwDataSource
    Left = 245
    Top = 9
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    AfterConfirma = CmeCadastroAfterConfirma
    Left = 358
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 408
    Top = 108
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      AUT.IDGRPRESPON,'
      '      AUT.IDGRUPOAUTORIZA,'
      '      AUT.CODCENTRORESPON,'
      '      AUT.IDPESSOA,'
      '      AUT.CODGRUPOPROD,'
      '      AUT.CODCENTROCUSTO,'
      '      AUT.IDEMPRESA,'
      '      AUT.UNIDNEGOC,'
      '      AUT.NUMAUTORIZACAO,'
      '      AUT.VLRINICIAL,'
      '      AUT.VLRFINAL,'
      '      AUT.MOECODIGO,'
      '      AUT.SEQAUTORIZACAO,'
      '      CC.NOME,'
      '      GP.DESCGRUPOPROD,'
      '      CR.NOME AS DESCCENTRESP,'
      '      UN.NOME AS DESCUNIDNEG,'
      '      GRP.NOME AS DESCGRPRESPON'
      'FROM'
      '    RADGRAUTXGRRESPON AUT,'
      '    CENTCUST CC,'
      '    GRUPPROD GP,'
      '    CENTRESPON CR,'
      '    UNIDNEGOCIO UN,'
      '    RADGRPRESPON GRP'
      'WHERE'
      '              ( AUT.IDGRUPOAUTORIZA = :pIDAUT)'
      '    AND  ( AUT. IDPESSOA = :piDPESS) '
      '    AND  ( AUT. IDEMPRESA = CC.IDEMPRESA(+))'
      '    AND  ( AUT. IDPESSOA = CR.IDPESSOA(+))'
      '    AND  ( AUT. IDPESSOA = UN.IDPESSOA(+))'
      '    AND  ( AUT.IDGRPRESPON = GRP.IDGRPRESPON)'
      '    AND  ( AUT. CODCENTROCUSTO = CC.CODCENTROCUSTO(+))'
      '    AND  ( AUT. CODGRUPOPROD = GP.CODGRUPOPROD(+))'
      '    AND  ( AUT. CODCENTRORESPON = CR.CODCENTRORESPON(+))'
      '    AND  ( AUT. UNIDNEGOC = UN.UNIDNEGOC(+))'
      'ORDER BY AUT.SEQAUTORIZACAO'
      ''
      ' ')
    UpdateObject = updDet
    ValidateWithMask = True
    Left = 384
    Top = 9
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDAUT'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'piDPESS'
        ParamType = ptUnknown
      end>
    object qryDetSEQAUTORIZACAO: TFloatField
      DisplayLabel = ' '
      DisplayWidth = 2
      FieldName = 'SEQAUTORIZACAO'
    end
    object qryDetDESCGRPRESPON: TStringField
      DisplayLabel = 'Grupo~Responsabilidade'
      DisplayWidth = 30
      FieldName = 'DESCGRPRESPON'
      Size = 30
    end
    object qryDetDESCUNIDNEG: TStringField
      DisplayLabel = 'Atividade/Projeto'
      DisplayWidth = 25
      FieldName = 'DESCUNIDNEG'
      Size = 25
    end
    object qryDetNUMAUTORIZACAO: TFloatField
      DisplayLabel = 'Nº de Autorizações'
      DisplayWidth = 10
      FieldName = 'NUMAUTORIZACAO'
    end
    object qryDetNOME: TStringField
      DisplayLabel = 'Centro de Custo'
      DisplayWidth = 30
      FieldName = 'NOME'
      Size = 30
    end
    object qryDetDESCGRUPOPROD: TStringField
      DisplayLabel = 'Grupo de Produtos'
      DisplayWidth = 30
      FieldName = 'DESCGRUPOPROD'
      Size = 30
    end
    object qryDetDESCCENTRESP: TStringField
      DisplayLabel = 'Centro~Responsabilidade'
      DisplayWidth = 30
      FieldName = 'DESCCENTRESP'
      Size = 30
    end
    object qryDetVLRINICIAL: TFloatField
      DisplayLabel = 'Valor~Inicial'
      DisplayWidth = 10
      FieldName = 'VLRINICIAL'
      DisplayFormat = '#,##0.00'
    end
    object qryDetVLRFINAL: TFloatField
      DisplayLabel = 'Valor~Final'
      DisplayWidth = 10
      FieldName = 'VLRFINAL'
      DisplayFormat = '#,##0.00'
    end
    object qryDetMOECODIGO: TFloatField
      DisplayLabel = 'Moeda'
      DisplayWidth = 10
      FieldName = 'MOECODIGO'
      Visible = False
    end
    object qryDetIDGRPRESPON: TFloatField
      DisplayWidth = 10
      FieldName = 'IDGRPRESPON'
      Visible = False
    end
    object qryDetIDGRUPOAUTORIZA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDGRUPOAUTORIZA'
      Visible = False
    end
    object qryDetCODCENTRORESPON: TStringField
      DisplayWidth = 10
      FieldName = 'CODCENTRORESPON'
      Visible = False
      Size = 10
    end
    object qryDetIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryDetCODGRUPOPROD: TStringField
      DisplayWidth = 10
      FieldName = 'CODGRUPOPROD'
      Visible = False
      Size = 10
    end
    object qryDetCODCENTROCUSTO: TStringField
      DisplayWidth = 10
      FieldName = 'CODCENTROCUSTO'
      Visible = False
      Size = 10
    end
    object qryDetIDEMPRESA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDEMPRESA'
      Visible = False
    end
    object qryDetUNIDNEGOC: TFloatField
      DisplayWidth = 10
      FieldName = 'UNIDNEGOC'
      Visible = False
    end
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update RADGRAUTXGRRESPON'
      'set'
      '  IDGRPRESPON = :IDGRPRESPON,'
      '  IDGRUPOAUTORIZA = :IDGRUPOAUTORIZA,'
      '  CODCENTRORESPON = :CODCENTRORESPON,'
      '  IDPESSOA = :IDPESSOA,'
      '  CODGRUPOPROD = :CODGRUPOPROD,'
      '  CODCENTROCUSTO = :CODCENTROCUSTO,'
      '  IDEMPRESA = :IDEMPRESA,'
      '  UNIDNEGOC = :UNIDNEGOC,'
      '  NUMAUTORIZACAO = :NUMAUTORIZACAO,'
      '  VLRINICIAL = :VLRINICIAL,'
      '  VLRFINAL = :VLRFINAL,'
      '  MOECODIGO = :MOECODIGO,'
      '  SEQAUTORIZACAO = :SEQAUTORIZACAO'
      'where'
      '  IDGRPRESPON = :OLD_IDGRPRESPON and'
      '  IDGRUPOAUTORIZA = :OLD_IDGRUPOAUTORIZA')
    InsertSQL.Strings = (
      'insert into RADGRAUTXGRRESPON'
      '  (IDGRPRESPON, IDGRUPOAUTORIZA, CODCENTRORESPON, IDPESSOA, '
      'CODGRUPOPROD, '
      '   CODCENTROCUSTO, IDEMPRESA, UNIDNEGOC, NUMAUTORIZACAO, '
      'VLRINICIAL, VLRFINAL, '
      '   MOECODIGO, SEQAUTORIZACAO)'
      'values'
      '  (:IDGRPRESPON, :IDGRUPOAUTORIZA, :CODCENTRORESPON, :IDPESSOA, '
      ':CODGRUPOPROD, '
      '   :CODCENTROCUSTO, :IDEMPRESA, :UNIDNEGOC, :NUMAUTORIZACAO, '
      ':VLRINICIAL, '
      '   :VLRFINAL, :MOECODIGO, :SEQAUTORIZACAO)')
    DeleteSQL.Strings = (
      'delete from RADGRAUTXGRRESPON'
      'where'
      '  IDGRPRESPON = :OLD_IDGRPRESPON and'
      '  IDGRUPOAUTORIZA = :OLD_IDGRUPOAUTORIZA')
    Left = 429
    Top = 9
  end
  object qryGrpResp: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '            IDGRPRESPON,'
      '            NOME'
      'FROM'
      '           RADGRPRESPON'
      'ORDER BY 2  ')
    ValidateWithMask = True
    Left = 472
    Top = 57
  end
  object qryCentCust: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '            CODCENTROCUSTO,'
      '            NOME'
      'FROM'
      '            CENTCUST'
      'WHERE'
      '          (IDEMPRESA = :pIDPESS)'
      'ORDER BY 1')
    ValidateWithMask = True
    Left = 536
    Top = 57
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDPESS'
        ParamType = ptUnknown
      end>
  end
  object qryCentResp: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '            CODCENTRORESPON,'
      '            NOME'
      'FROM'
      '            CENTRESPON'
      'WHERE'
      '          (IDPESSOA = :pIDPESS)'
      'ORDER BY 1')
    ValidateWithMask = True
    Left = 600
    Top = 57
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDPESS'
        ParamType = ptUnknown
      end>
  end
  object qryGrpProd: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '            CODGRUPOPROD,'
      '            DESCGRUPOPROD'
      'FROM'
      '            GRUPPROD'
      'ORDER BY 1')
    ValidateWithMask = True
    Left = 664
    Top = 57
  end
  object qryUnNegoc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '            UNIDNEGOC,'
      '            UNECODIGO,'
      '            NOME'
      'FROM'
      '           UNIDNEGOCIO'
      'WHERE'
      '           (IDPESSOA = :pIDPESSOA) AND'
      '           (UNETIPO = '#39'A'#39')'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 472
    Top = 113
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryMoeda: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      MOECODIGO,'
      '      MOEDESC,'
      '      FATORCONVERSAO,'
      '      MOEDAREFERENCIA'
      'FROM'
      '      MOEDA'
      'ORDER BY MOEDESC'
      '')
    ValidateWithMask = True
    Left = 520
    Top = 9
    object qryMoedaMOEDESC: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 20
      FieldName = 'MOEDESC'
      Origin = 'MOEDA.MOEDESC'
    end
    object qryMoedaMOECODIGO: TFloatField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'MOECODIGO'
      Origin = 'MOEDA.MOECODIGO'
    end
    object qryMoedaFATORCONVERSAO: TFloatField
      DisplayWidth = 10
      FieldName = 'FATORCONVERSAO'
      Origin = 'MOEDA.FATORCONVERSAO'
      Visible = False
    end
    object qryMoedaMOEDAREFERENCIA: TFloatField
      DisplayWidth = 10
      FieldName = 'MOEDAREFERENCIA'
      Origin = 'MOEDA.MOEDAREFERENCIA'
      Visible = False
    end
  end
end
