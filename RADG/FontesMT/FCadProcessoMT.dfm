inherited frmCadProcessoMT: TfrmCadProcessoMT
  Left = 12
  Top = 57
  HelpContext = 110025
  Caption = 'Cadastro de Tipo de Processos'
  ClientHeight = 451
  ClientWidth = 763
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 763
    Height = 365
    inherited pnlMestre: TPanel
      Width = 761
      Height = 100
      object lblNome: TLabel
        Left = 8
        Top = 8
        Width = 33
        Height = 13
        Caption = 'Nome'
        FocusControl = edNome
      end
      object Label3: TLabel
        Left = 8
        Top = 56
        Width = 62
        Height = 13
        Caption = 'Nº de Dias'
        FocusControl = edNome
      end
      object Label14: TLabel
        Left = 96
        Top = 56
        Width = 109
        Height = 13
        Caption = 'Grupo de Processo'
        FocusControl = edNome
      end
      object Label15: TLabel
        Left = 384
        Top = 8
        Width = 58
        Height = 13
        Caption = 'Descrição'
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
        LookupTable = cdsGrupoProc
        LookupField = 'IDGRUPOPROCESSO'
        Options = [loTitles]
        Style = csDropDownList
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object memDesc: TDBMemo
        Left = 384
        Top = 24
        Width = 361
        Height = 69
        DataField = 'DESCRICAO'
        DataSource = ds
        MaxLength = 200
        TabOrder = 3
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 101
      Width = 761
      Height = 263
      Tabs.Strings = (
        'Etapas'
        'Observação'
        'Restrições'
        'Gerenciamento')
      detdbGrids.Strings = (
        'dbgrdDet'
        ''
        ''
        '')
      inherited pgctrlDetalhe: TPageControl
        Width = 663
        Height = 204
        inherited tbsDet: TTabSheet
          Caption = 'Etapas'
          ImageIndex = 1
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 655
            Height = 176
            Selected.Strings = (
              'FLGINICIAL'#9'1'#9'Inicial'#9'F'
              'FLGFINAL'#9'1'#9'Final'#9'F'
              'DESCETAPA'#9'40'#9'Etapa'#9'F'
              'NOMEMODULO'#9'35'#9'Sistema'#9'F'
              'NUMDIASPREVISTO'#9'10'#9'N º de Dias~Previsto'#9'F')
            TitleLines = 2
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 655
            Height = 176
            object Label2: TLabel
              Left = 5
              Top = 8
              Width = 34
              Height = 13
              Caption = 'Etapa'
              FocusControl = edNome
            end
            object Label4: TLabel
              Left = 288
              Top = 8
              Width = 45
              Height = 13
              Caption = 'Sistema'
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
              LookupTable = cdsTipoEtapa
              LookupField = 'IDTIPOETAPA'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object chkInicial: TDBCheckBox
              Left = 8
              Top = 64
              Width = 224
              Height = 17
              Caption = 'Será a etapa inicial deste processo'
              DataField = 'FLGINICIAL'
              DataSource = dsDet
              TabOrder = 1
              ValueChecked = 'S'
              ValueUnchecked = 'N'
            end
            object chkFinal: TDBCheckBox
              Left = 256
              Top = 64
              Width = 233
              Height = 17
              Caption = 'Poderá ser última etapa do processo'
              DataField = 'FLGFINAL'
              DataSource = dsDet
              TabOrder = 2
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
              LookupTable = cdsModulo
              LookupField = 'IDMODULO'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object spNDiaEtapa: TwwDBSpinEdit
              Left = 544
              Top = 24
              Width = 99
              Height = 21
              Increment = 1
              DataField = 'NUMDIASPREVISTO'
              DataSource = dsDet
              TabOrder = 4
              UnboundDataType = wwDefault
            end
          end
        end
        object tbsObservacao: TTabSheet
          Caption = 'tbsObservacao'
          ImageIndex = 1
          object memOBS: TDBMemo
            Left = 0
            Top = 0
            Width = 655
            Height = 176
            Align = alClient
            DataField = 'OBSPROC'
            DataSource = ds
            MaxLength = 200
            TabOrder = 0
          end
        end
        object tbsRestricao: TTabSheet
          Caption = 'tbsRestricao'
          ImageIndex = 2
          object Label6: TLabel
            Left = 8
            Top = 8
            Width = 167
            Height = 13
            Caption = 'Grau para Grupo de Produtos'
          end
          object Label1: TLabel
            Left = 9
            Top = 62
            Width = 153
            Height = 13
            Caption = 'Valor mínimo para geração'
          end
          object edGaruGrp: TDBRealEdit
            Left = 8
            Top = 24
            Width = 164
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0')
            TabOrder = 0
            WordWrap = False
            IntDigits = 10
            DecDigits = 0
            NumberFormat = iNumber
            Signal = False
            DataField = 'GRAUGRUPPROD'
            DataSource = ds
          end
          object GroupBox1: TGroupBox
            Left = 192
            Top = 3
            Width = 449
            Height = 102
            Caption = ' Obriga o preenchimento dos campos na geração do processo '
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
          object dbrValMinimo: TDBRealEdit
            Left = 8
            Top = 75
            Width = 164
            Height = 21
            Alignment = taRightJustify
            Lines.Strings = (
              '0')
            TabOrder = 2
            WordWrap = False
            IntDigits = 10
            DecDigits = 0
            NumberFormat = iNumber
            Signal = False
            DataField = 'valminimo'
            DataSource = ds
          end
        end
        object tbsGerenciamento: TTabSheet
          Caption = 'tbsGerenciamento'
          ImageIndex = 3
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
          object Label13: TLabel
            Left = 360
            Top = 8
            Width = 149
            Height = 13
            Caption = 'Grupo para criar Processo'
          end
          object Bevel1: TBevel
            Left = 358
            Top = 52
            Width = 292
            Height = 119
          end
          object Label16: TLabel
            Left = 364
            Top = 56
            Width = 63
            Height = 13
            Caption = 'Referência'
          end
          object Label5: TLabel
            Left = 364
            Top = 100
            Width = 58
            Height = 13
            Caption = 'Descrição'
          end
          object dblcGrpResp: TCMDBLookupCombo
            Left = 8
            Top = 24
            Width = 341
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'30'#9'Descrição')
            DataField = 'IDGRPGESTOR'
            DataSource = ds
            LookupTable = cdsGrupoRespon
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
            Width = 341
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMEGRUPOAUT'#9'38'#9'Descrição')
            DataField = 'IDGRPCONSULTA'
            DataSource = ds
            LookupTable = cdsGrupoAut
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
            Left = 360
            Top = 24
            Width = 282
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'30'#9'Descrição')
            DataField = 'IDGRPCRIAPROCESSO'
            DataSource = ds
            LookupTable = cdsGrupoRespon
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
            Left = 364
            Top = 72
            Width = 281
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCREFERENCIA'#9'50'#9'Descrição')
            DataField = 'IDREFERENCIA'
            DataSource = ds
            LookupTable = cdsReferencia
            LookupField = 'IDREFERENCIA'
            Options = [loTitles]
            Style = csDropDownList
            TabOrder = 3
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = True
            ShowMatchText = True
          end
          object DbmDescricao: TDBMemo
            Left = 364
            Top = 116
            Width = 281
            Height = 49
            DataField = 'DESCRICAO'
            DataSource = dsReferencia
            ReadOnly = True
            TabOrder = 4
          end
        end
      end
      inherited Dock973: TDock97
        Width = 753
      end
      inherited Dock974: TDock97
        Left = 667
        Height = 204
      end
    end
  end
  inherited Dock972: TDock97
    Width = 763
  end
  inherited Dock971: TDock97
    Top = 412
    Width = 763
    inherited tb97Fundo: TToolbar97
      Left = 367
      inherited bbtnSair: TBitBtn
        Tag = 99
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 110025
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnCancelar: TBitBtn
        Tag = 99
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 77
    Top = 18
    TargetsData = (
      1
      3
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        'TwwDBRichEditMSWord'
        'Text'
        0)
      (
        'TDBMemo'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 174
    Top = 18
  end
  inherited ImlPadrao: TImageList
    Left = 15
    Top = 15
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 274
    Top = 18
  end
  inherited Cds: TCMClientDataSet
    Left = 223
    Top = 18
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'RADTIPOPROCESSO.NOME')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Nome do Processo')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'RADTIPOPROCESSO')
    CamposChave.Strings = (
      'RADTIPOPROCESSO.IDTIPOPROCESSO')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    ExibePergunta = False
    Left = 412
    Top = 18
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 338
    Top = 18
  end
  inherited dsDet: TwwDataSource
    DataSet = cdsDet
    Left = 496
    Top = 18
  end
  object cdsGrupoAut: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 595
    Top = 69
  end
  object cdsGrupoRespon: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 195
    Top = 69
  end
  object cdsModulo: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 419
    Top = 69
  end
  object cdsTipoEtapa: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 291
    Top = 69
  end
  object sqlModulo: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '            IDMODULO,'
      '            NOMEMODULO'
      'FROM'
      '            MODULO'
      'ORDER BY NOMEMODULO')
    ClientDataSet = cdsModulo
    Left = 429
    Top = 120
  end
  object cdsReferencia: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 603
    Top = 133
  end
  object sqlReferencia: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '     IDREFERENCIA,'
      '     DESCREFERENCIA,'
      '     DESCRICAO'
      'FROM'
      '     RADREFERENCIA'
      'ORDER BY DESCREFERENCIA ')
    ClientDataSet = cdsReferencia
    Left = 685
    Top = 136
  end
  object qryDet: TwwQuery
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
  end
  object cdsGrupoProc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 507
    Top = 77
  end
  object cdsDet: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ValidateWithMask = True
    Left = 624
    Top = 8
  end
  object dsReferencia: TwwDataSource
    DataSet = cdsReferencia
    Left = 606
    Top = 173
  end
  object cdsAux: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 545
    Top = 339
  end
end
