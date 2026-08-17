inherited FrmCadProcesso: TFrmCadProcesso
  Left = 17
  Top = 85
  Caption = 'Cadastro de Tipo de Processos'
  ClientHeight = 404
  ClientWidth = 764
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 764
    Height = 318
    inherited pnlMestre: TPanel
      Width = 754
      Height = 108
      object Label1: TLabel
        Left = 8
        Top = 8
        Width = 33
        Height = 13
        Caption = 'Nome'
        FocusControl = edNome
      end
      object Label2: TLabel
        Left = 384
        Top = 8
        Width = 58
        Height = 13
        Caption = 'Descrição'
        FocusControl = edNome
      end
      object Label6: TLabel
        Left = 96
        Top = 56
        Width = 109
        Height = 13
        Caption = 'Grupo de Processo'
        FocusControl = edNome
      end
      object Label12: TLabel
        Left = 8
        Top = 56
        Width = 62
        Height = 13
        Caption = 'Nº de Dias'
        FocusControl = edNome
      end
      object edNome: TDBEdit
        Left = 8
        Top = 24
        Width = 358
        Height = 21
        DataField = 'NOME'
        DataSource = ds
        TabOrder = 0
      end
      object memDesc: TDBMemo
        Left = 384
        Top = 24
        Width = 361
        Height = 69
        DataField = 'DESCRICAO'
        DataSource = ds
        MaxLength = 200
        TabOrder = 2
      end
      object spNDias: TSpinEdit
        Left = 8
        Top = 72
        Width = 80
        Height = 22
        MaxLength = 3
        MaxValue = 365
        MinValue = 1
        TabOrder = 1
        Value = 1
      end
      object dblcGrpProc: TCMDBLookupCombo
        Left = 96
        Top = 72
        Width = 273
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCGRUPOPROCESSO'#9'60'#9'Descrição')
        DataField = 'IDGRUPOPROCESSO'
        DataSource = ds
        LookupTable = qryGrpProc
        LookupField = 'IDGRUPOPROCESSO'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 113
      Width = 754
      Height = 200
      Tabs.Strings = (
        'Etapas'
        'Observações'
        'Restrições'
        'Gerenciamento')
      detdbGrids.Strings = (
        'dbgrdDet'
        ''
        ''
        '')
      inherited pgctrlDetalhe: TPageControl
        Width = 656
        Height = 141
        inherited tbsDet: TTabSheet
          inherited pnlControlesDet: TPanel [0]
            Width = 648
            Height = 113
            object Label4: TLabel
              Left = 288
              Top = 8
              Width = 45
              Height = 13
              Caption = 'Sistema'
              FocusControl = edNome
            end
            object Label3: TLabel
              Left = 5
              Top = 8
              Width = 34
              Height = 13
              Caption = 'Etapa'
              FocusControl = edNome
            end
            object Label9: TLabel
              Left = 544
              Top = 8
              Width = 62
              Height = 13
              Caption = 'Nº de Dias'
              FocusControl = edNome
            end
            object chkInicial: TDBCheckBox
              Left = 8
              Top = 64
              Width = 273
              Height = 17
              Caption = 'Será a etapa inical deste processo'
              DataField = 'FLGINICIAL'
              DataSource = dsDet
              TabOrder = 3
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object dblcModulo: TCMDBLookupCombo
              Left = 288
              Top = 24
              Width = 241
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMEMODULO'#9'50'#9'Nome')
              DataField = 'IDMODULO'
              DataSource = dsDet
              LookupTable = qryModulo
              LookupField = 'IDMODULO'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
              OnCloseUp = dblcModuloCloseUp
            end
            object dblcEtapa: TCMDBLookupCombo
              Left = 5
              Top = 24
              Width = 268
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'30'#9'Descrição')
              DataField = 'IDTIPOETAPA'
              DataSource = dsDet
              LookupTable = qryEtapa
              LookupField = 'IDTIPOETAPA'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object chkFinal: TDBCheckBox
              Left = 256
              Top = 64
              Width = 273
              Height = 17
              Caption = 'Poderá ser ultima etapa do processo'
              DataField = 'FLGFINAL'
              DataSource = dsDet
              TabOrder = 4
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object spNdiaEtapa: TSpinEdit
              Left = 544
              Top = 23
              Width = 105
              Height = 22
              MaxLength = 3
              MaxValue = 365
              MinValue = 1
              TabOrder = 2
              Value = 1
            end
          end
          inherited dbgrdDet: TwwDBGrid [1]
            Width = 648
            Height = 113
            Selected.Strings = (
              'FLGINICIAL'#9'1'#9'Inicial'
              'FLGFINAL'#9'1'#9'Final'
              'DESCETAPA'#9'30'#9'Etapa'
              'NOMEMODULO'#9'30'#9'Sistema'
              'NUMDIASPREVISTO'#9'10'#9'N º de Dias~Previsto')
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            TitleLines = 2
          end
        end
        object TbsOBS: TTabSheet
          Caption = 'Observação'
          object memOBS: TDBMemo
            Left = 0
            Top = 0
            Width = 648
            Height = 113
            Align = alClient
            DataField = 'OBSPROC'
            DataSource = ds
            MaxLength = 200
            TabOrder = 0
          end
        end
        object tabRestricao: TTabSheet
          Caption = 'tabRestricao'
          object Label11: TLabel
            Left = 8
            Top = 8
            Width = 167
            Height = 13
            Caption = 'Grau para Grupo de Produtos'
          end
          object edGaruGrp: TDBRealEdit
            Left = 8
            Top = 24
            Width = 121
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0')
            TabOrder = 0
            WordWrap = False
            OnExit = edGaruGrpExit
            IntDigits = 10
            DecDigits = 0
            NumberFormat = iNumber
            Signal = False
            DataField = 'GRAUGRUPPROD'
            DataSource = ds
          end
          object GroupBox1: TGroupBox
            Left = 192
            Top = 8
            Width = 449
            Height = 102
            Caption = ' Obriga o preenchimento dos campos na geração do proccesso '
            TabOrder = 1
            object DBCheckBox1: TDBCheckBox
              Left = 16
              Top = 16
              Width = 281
              Height = 17
              Caption = 'Centro de Custo'
              DataField = 'FLGCENTCUST'
              DataSource = ds
              TabOrder = 0
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object DBCheckBox2: TDBCheckBox
              Left = 16
              Top = 32
              Width = 201
              Height = 17
              Caption = 'Centro de Responsabilidade'
              DataField = 'FLGCENTRESPON'
              DataSource = ds
              TabOrder = 1
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object DBCheckBox3: TDBCheckBox
              Left = 16
              Top = 48
              Width = 193
              Height = 17
              Caption = 'Grupo de Produto'
              DataField = 'FLGGRUPPROD'
              DataSource = ds
              TabOrder = 2
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object DBCheckBox4: TDBCheckBox
              Left = 16
              Top = 64
              Width = 177
              Height = 17
              Caption = 'Atividade/Projeto'
              DataField = 'FLGUNIDNEGOC'
              DataSource = ds
              TabOrder = 3
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object DBCheckBox5: TDBCheckBox
              Left = 16
              Top = 80
              Width = 97
              Height = 17
              Caption = 'Valor'
              DataField = 'FLGVALOR'
              DataSource = ds
              TabOrder = 4
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
          end
        end
        object TabGer: TTabSheet
          Caption = 'Gerenciamento'
          object Label7: TLabel
            Left = 8
            Top = 8
            Width = 112
            Height = 13
            Caption = 'Gestor do Processo'
          end
          object Label8: TLabel
            Left = 8
            Top = 56
            Width = 243
            Height = 13
            Caption = 'Grupo Autorizado disponível para consulta'
          end
          object Label5: TLabel
            Left = 376
            Top = 8
            Width = 149
            Height = 13
            Caption = 'Grupo para criar Processo'
          end
          object Label10: TLabel
            Left = 376
            Top = 56
            Width = 63
            Height = 13
            Caption = 'Referência'
          end
          object dblcGrpResp: TCMDBLookupCombo
            Left = 8
            Top = 24
            Width = 353
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'30'#9'Descrição')
            DataField = 'IDGRPGESTOR'
            DataSource = ds
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
          object dblcGrpConsulta: TCMDBLookupCombo
            Left = 8
            Top = 72
            Width = 353
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMEGRUPOAUT'#9'38'#9'Descrição')
            DataField = 'IDGRPCONSULTA'
            DataSource = ds
            LookupTable = qryGrpAut
            LookupField = 'IDGRUPOAUTORIZA'
            Options = [loTitles]
            Style = csDropDownList
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object dblcGrpInst: TCMDBLookupCombo
            Left = 376
            Top = 24
            Width = 282
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'30'#9'Descrição')
            DataField = 'IDGRPCRIAPROCESSO'
            DataSource = ds
            LookupTable = qryGrpInst
            LookupField = 'IDGRPRESPON'
            Options = [loTitles]
            Style = csDropDownList
            TabOrder = 2
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object dblcReferencia: TCMDBLookupCombo
            Left = 376
            Top = 72
            Width = 281
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCREFERENCIA'#9'50'#9'Descrição')
            DataField = 'IDREFERENCIA'
            DataSource = ds
            LookupTable = qryReferencia
            LookupField = 'IDREFERENCIA'
            Options = [loTitles]
            Style = csDropDownList
            TabOrder = 3
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
        end
      end
      inherited Dock973: TDock97
        Width = 746
      end
      inherited Dock974: TDock97
        Left = 660
        Height = 141
      end
    end
  end
  inherited Dock972: TDock97
    Width = 764
  end
  inherited Dock971: TDock97
    Top = 365
    Width = 764
    inherited tb97Fundo: TToolbar97
      Left = 594
      DockPos = 594
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 426
      DockPos = 426
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '     IDTIPOPROCESSO,'
      '     NOME,'
      '     IDREFERENCIA,'
      '     DESCRICAO,'
      '     IDGRPGESTOR,'
      '     IDGRPCONSULTA,'
      '     NUMDIASPREVISTO,'
      '     OBSPROC,'
      '     IDGRPCRIAPROCESSO,'
      '     GRAUGRUPPROD,'
      '     IDGRUPOPROCESSO,'
      '     FLGCENTCUST,'
      '     FLGCENTRESPON,'
      '     FLGGRUPPROD,'
      '     FLGUNIDNEGOC,'
      '     FLGVALOR'
      'FROM'
      '     RADTIPOPROCESSO'
      'WHERE'
      '     (IDTIPOPROCESSO = :pIDPROC)'
      ''
      '')
    Left = 315
    Top = 0
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDPROC'
        ParamType = ptUnknown
      end>
    object qryIDTIPOPROCESSO: TFloatField
      FieldName = 'IDTIPOPROCESSO'
    end
    object qryIDREFERENCIA: TFloatField
      FieldName = 'IDREFERENCIA'
    end
    object qryDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 200
    end
    object qryIDGRPGESTOR: TFloatField
      FieldName = 'IDGRPGESTOR'
    end
    object qryIDGRPCONSULTA: TFloatField
      FieldName = 'IDGRPCONSULTA'
    end
    object qryNUMDIASPREVISTO: TFloatField
      FieldName = 'NUMDIASPREVISTO'
    end
    object qryNOME: TStringField
      FieldName = 'NOME'
      Origin = 'RADTIPOPROCESSO.NOME'
      Size = 60
    end
    object qryOBSPROC: TStringField
      FieldName = 'OBSPROC'
      Origin = 'RADTIPOPROCESSO.OBSPROC'
      Size = 200
    end
    object qryIDGRPCRIAPROCESSO: TFloatField
      FieldName = 'IDGRPCRIAPROCESSO'
      Origin = 'RADTIPOPROCESSO.IDGRPCRIAPROCESSO'
    end
    object qryGRAUGRUPPROD: TFloatField
      FieldName = 'GRAUGRUPPROD'
      Origin = 'RADTIPOPROCESSO.GRAUGRUPPROD'
    end
    object qryIDGRUPOPROCESSO: TFloatField
      FieldName = 'IDGRUPOPROCESSO'
    end
    object qryFLGCENTCUST: TStringField
      FieldName = 'FLGCENTCUST'
      Size = 1
    end
    object qryFLGCENTRESPON: TStringField
      FieldName = 'FLGCENTRESPON'
      Size = 1
    end
    object qryFLGGRUPPROD: TStringField
      FieldName = 'FLGGRUPPROD'
      Size = 1
    end
    object qryFLGUNIDNEGOC: TStringField
      FieldName = 'FLGUNIDNEGOC'
      Size = 1
    end
    object qryFLGVALOR: TStringField
      FieldName = 'FLGVALOR'
      Size = 1
    end
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 362
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 771
    Top = 65531
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update RADTIPOPROCESSO'
      'set'
      '  IDTIPOPROCESSO = :IDTIPOPROCESSO,'
      '  NOME = :NOME,'
      '  IDREFERENCIA = :IDREFERENCIA,'
      '  DESCRICAO = :DESCRICAO,'
      '  IDGRPGESTOR = :IDGRPGESTOR,'
      '  IDGRPCONSULTA = :IDGRPCONSULTA,'
      '  NUMDIASPREVISTO = :NUMDIASPREVISTO,'
      '  OBSPROC = :OBSPROC,'
      '  IDGRPCRIAPROCESSO = :IDGRPCRIAPROCESSO,'
      '  GRAUGRUPPROD = :GRAUGRUPPROD,'
      '  IDGRUPOPROCESSO = :IDGRUPOPROCESSO,'
      '  FLGCENTCUST = :FLGCENTCUST,'
      '  FLGCENTRESPON = :FLGCENTRESPON,'
      '  FLGGRUPPROD = :FLGGRUPPROD,'
      '  FLGUNIDNEGOC = :FLGUNIDNEGOC,'
      '  FLGVALOR = :FLGVALOR'
      'where'
      '  IDTIPOPROCESSO = :OLD_IDTIPOPROCESSO')
    InsertSQL.Strings = (
      'insert into RADTIPOPROCESSO'
      
        '  (IDTIPOPROCESSO, NOME, IDREFERENCIA, DESCRICAO, IDGRPGESTOR, I' +
        'DGRPCONSULTA, '
      
        '   NUMDIASPREVISTO, OBSPROC, IDGRPCRIAPROCESSO, GRAUGRUPPROD, ID' +
        'GRUPOPROCESSO, '
      
        '   FLGCENTCUST, FLGCENTRESPON, FLGGRUPPROD, FLGUNIDNEGOC, FLGVAL' +
        'OR)'
      'values'
      
        '  (:IDTIPOPROCESSO, :NOME, :IDREFERENCIA, :DESCRICAO, :IDGRPGEST' +
        'OR, :IDGRPCONSULTA, '
      
        '   :NUMDIASPREVISTO, :OBSPROC, :IDGRPCRIAPROCESSO, :GRAUGRUPPROD' +
        ', :IDGRUPOPROCESSO, '
      
        '   :FLGCENTCUST, :FLGCENTRESPON, :FLGGRUPPROD, :FLGUNIDNEGOC, :F' +
        'LGVALOR)')
    DeleteSQL.Strings = (
      'delete from RADTIPOPROCESSO'
      'where'
      '  IDTIPOPROCESSO = :OLD_IDTIPOPROCESSO')
    Left = 281
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'RADTIPOPROCESSO.NOME')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição do Processo')
    Tabelas.Strings = (
      'RADTIPOPROCESSO')
    CamposChave.Strings = (
      'RADTIPOPROCESSO.IDTIPOPROCESSO')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '30')
    Left = 703
    Top = 5
  end
  inherited ds: TwwDataSource
    Left = 249
    Top = 0
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 358
  end
  inherited CmeDetalhe: TCmEventosCadastro
    AfterConfirma = CmeDetalheAfterConfirma
    Left = 408
    Top = 108
  end
  object qryDet: TwwQuery
    Active = True
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      EXP.IDTIPOPROCESSO,'
      '      EXP.IDTIPOETAPA,'
      '      EXP.IDMODULO,'
      '      EXP.FLGINICIAL,'
      '      EXP.FLGFINAL,'
      '      EXP.NUMDIASPREVISTO,'
      '      E.NOME AS DESCETAPA,'
      '      M.NOMEMODULO'
      'FROM'
      '      RADTIPOETAPAXPROC EXP,'
      '      MODULO M,'
      '      RADTIPOETAPA E'
      'WHERE'
      '        (EXP.IDTIPOPROCESSO = :pIDPROC)'
      '    AND (EXP.IDTIPOETAPA = E.IDTIPOETAPA)'
      '    AND (EXP.IDMODULO = M.IDMODULO)'
      'ORDER BY E.NOME')
    UpdateObject = updDet
    ControlType.Strings = (
      'FLGINICIAL;CheckBox;S;N'
      'FLGFINAL;CheckBox;S;N')
    ValidateWithMask = True
    Left = 448
    Top = 7
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDPROC'
        ParamType = ptUnknown
      end>
    object qryDetFLGINICIAL: TStringField
      DisplayLabel = 'Inicial'
      DisplayWidth = 1
      FieldName = 'FLGINICIAL'
      Size = 1
    end
    object qryDetFLGFINAL: TStringField
      DisplayLabel = 'Final'
      DisplayWidth = 1
      FieldName = 'FLGFINAL'
      Size = 1
    end
    object qryDetDESCETAPA: TStringField
      DisplayLabel = 'Etapa'
      DisplayWidth = 30
      FieldName = 'DESCETAPA'
      Origin = 'RADTIPOETAPA.NOME'
      Size = 60
    end
    object qryDetNOMEMODULO: TStringField
      DisplayLabel = 'Sistema'
      DisplayWidth = 30
      FieldName = 'NOMEMODULO'
      Size = 50
    end
    object qryDetNUMDIASPREVISTO: TFloatField
      DisplayLabel = 'N º de Dias~Previsto'
      DisplayWidth = 10
      FieldName = 'NUMDIASPREVISTO'
    end
    object qryDetIDTIPOPROCESSO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOPROCESSO'
      Visible = False
    end
    object qryDetIDTIPOETAPA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOETAPA'
      Visible = False
    end
    object qryDetIDMODULO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDMODULO'
      Visible = False
    end
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update RADTIPOETAPAXPROC'
      'set'
      '  IDTIPOPROCESSO = :IDTIPOPROCESSO,'
      '  IDTIPOETAPA = :IDTIPOETAPA,'
      '  IDMODULO = :IDMODULO,'
      '  FLGINICIAL = :FLGINICIAL,'
      '  FLGFINAL = :FLGFINAL,'
      '  NUMDIASPREVISTO = :NUMDIASPREVISTO'
      'where'
      '  IDTIPOPROCESSO = :OLD_IDTIPOPROCESSO and'
      '  IDTIPOETAPA = :OLD_IDTIPOETAPA')
    InsertSQL.Strings = (
      'insert into RADTIPOETAPAXPROC'
      '  (IDTIPOPROCESSO, IDTIPOETAPA, IDMODULO, FLGINICIAL, FLGFINAL, '
      'NUMDIASPREVISTO)'
      'values'
      
        '  (:IDTIPOPROCESSO, :IDTIPOETAPA, :IDMODULO, :FLGINICIAL, :FLGFI' +
        'NAL, '
      ':NUMDIASPREVISTO)')
    DeleteSQL.Strings = (
      'delete from RADTIPOETAPAXPROC'
      'where'
      '  IDTIPOPROCESSO = :OLD_IDTIPOPROCESSO and'
      '  IDTIPOETAPA = :OLD_IDTIPOETAPA')
    Left = 400
    Top = 7
  end
  object qryEtapa: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '            IDTIPOETAPA,'
      '            NOME'
      'FROM'
      '           RADTIPOETAPA'
      'ORDER BY 2')
    ValidateWithMask = True
    Left = 565
    Top = 8
  end
  object qryModulo: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '            IDMODULO,'
      '            NOMEMODULO'
      'FROM'
      '           MODULO'
      'ORDER BY 2')
    ValidateWithMask = True
    Left = 501
    Top = 8
  end
  object qryWkFlow: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '            IDWORKFLOW,'
      '            DESCWORKFLOW'
      'FROM'
      '           WORKFLOW'
      'WHERE '
      '           (IDMODULO = :pIDMDL)'
      'ORDER BY 2')
    ValidateWithMask = True
    Left = 629
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDMDL'
        ParamType = ptUnknown
      end>
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
    Left = 120
    Top = 17
  end
  object qryGrpAut: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    Constrained = True
    SQL.Strings = (
      'SELECT'
      '        GRP.IDGRUPOAUTORIZA ,'
      '        GRP.NOMEGRUPOAUT'
      'FROM'
      '        RADGRUPOAUTORIZA GRP'
      'ORDER BY GRP.NOMEGRUPOAUT'
      ''
      '')
    UpdateMode = upWhereKeyOnly
    ValidateWithMask = True
    Left = 678
    Top = 58
    object qryGrpAutIDGRUPOAUTORIZA: TFloatField
      FieldName = 'IDGRUPOAUTORIZA'
      Visible = False
    end
    object qryGrpAutNOMEGRUPOAUT: TStringField
      FieldName = 'NOMEGRUPOAUT'
      Origin = '"CM.RADGRUPOAUTORIZA".NOMEGRUPOAUT'
      Size = 60
    end
  end
  object qryGrpInst: TwwQuery
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
    Left = 32
    Top = 9
  end
  object qryReferencia: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '            IDREFERENCIA,'
      '            DESCREFERENCIA'
      'FROM'
      '           RADREFERENCIA'
      'ORDER BY 2  ')
    ValidateWithMask = True
    Left = 224
    Top = 49
  end
  object qryGrpProc: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      IDGRUPOPROCESSO,'
      '      DESCGRUPOPROCESSO'
      'FROM'
      '      RADGRUPOPROCESSO'
      'ORDER BY 2')
    ValidateWithMask = True
    Left = 469
    Top = 124
    object qryGrpProcDESCGRUPOPROCESSO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'DESCGRUPOPROCESSO'
      Origin = '"CM.RADGRUPOPROCESSO".DESCGRUPOPROCESSO'
      Size = 60
    end
    object qryGrpProcIDGRUPOPROCESSO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDGRUPOPROCESSO'
      Origin = '"CM.RADGRUPOPROCESSO".IDGRUPOPROCESSO'
      Visible = False
    end
  end
end
