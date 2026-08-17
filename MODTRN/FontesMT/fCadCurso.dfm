inherited frmCadCurso: TfrmCadCurso
  Left = 226
  Top = 72
  Caption = 'Cadastro de Cursos'
  ClientWidth = 684
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 684
    inherited pnlMestre: TPanel
      Width = 682
      Height = 132
      object Label1: TLabel
        Left = 15
        Top = 9
        Width = 40
        Height = 13
        Caption = 'Código'
        FocusControl = dbedCodigo
      end
      object Label6: TLabel
        Left = 112
        Top = 9
        Width = 35
        Height = 13
        Caption = 'Título'
        FocusControl = dbedDescr
      end
      object Label7: TLabel
        Left = 581
        Top = 89
        Width = 94
        Height = 13
        Caption = 'Nome Abreviado'
        FocusControl = dbedAbrev
        Visible = False
      end
      object Label2: TLabel
        Left = 15
        Top = 49
        Width = 100
        Height = 13
        Caption = 'Atividade/Projeto'
      end
      object Label4: TLabel
        Left = 288
        Top = 49
        Width = 127
        Height = 13
        Caption = 'Grupo de Treinamento'
      end
      object Label5: TLabel
        Left = 288
        Top = 88
        Width = 41
        Height = 13
        Caption = 'Pacote'
      end
      object Label8: TLabel
        Left = 15
        Top = 88
        Width = 158
        Height = 13
        Caption = 'Empresa/Entidade/Instrutor'
      end
      object Label9: TLabel
        Left = 580
        Top = 9
        Width = 84
        Height = 13
        Caption = 'Valor do Curso'
      end
      object Label10: TLabel
        Left = 580
        Top = 49
        Width = 84
        Height = 13
        Caption = 'Horas Práticas'
      end
      object Label11: TLabel
        Left = 580
        Top = 88
        Width = 87
        Height = 13
        Caption = 'Horas Teóricas'
      end
      object Label16: TLabel
        Left = 472
        Top = 9
        Width = 29
        Height = 13
        Caption = 'Sigla'
      end
      object dbedCodigo: TDBEdit
        Left = 15
        Top = 24
        Width = 91
        Height = 21
        TabStop = False
        Color = clGray
        DataField = 'IDCURSO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object dbedDescr: TDBEdit
        Left = 112
        Top = 24
        Width = 354
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = ds
        MaxLength = 100
        TabOrder = 1
      end
      object dbedAbrev: TDBEdit
        Left = 582
        Top = 104
        Width = 72
        Height = 21
        DataField = 'ABREV'
        DataSource = ds
        TabOrder = 2
        Visible = False
      end
      object dblcUnidNegocio: TwwDBLookupCombo
        Left = 15
        Top = 63
        Width = 262
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'25'#9'NOME'#9'F')
        DataField = 'UNIDNEGOC'
        DataSource = ds
        LookupTable = cdsUnidNegocio
        LookupField = 'UNIDNEGOC'
        Style = csDropDownList
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
        AllowClearKey = True
      end
      object wwDBLookupCombo1: TwwDBLookupCombo
        Left = 288
        Top = 63
        Width = 277
        Height = 21
        DropDownAlignment = taRightJustify
        DataField = 'CODGRPTREIN'
        DataSource = ds
        LookupTable = CdsGrupoTr
        LookupField = 'CODGRPTREIN'
        Style = csDropDownList
        TabOrder = 4
        AutoDropDown = True
        ShowButton = True
        SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
        AllowClearKey = True
      end
      object dblcPacote: TwwDBLookupCombo
        Left = 288
        Top = 102
        Width = 277
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'30'#9'DESCRICAO')
        DataField = 'IDPACOTE'
        DataSource = ds
        LookupTable = CdsPacote
        LookupField = 'IDPACOTE'
        Style = csDropDownList
        TabOrder = 5
        AutoDropDown = True
        ShowButton = True
        SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
        AllowClearKey = True
      end
      object dblcEntid: TwwDBLookupCombo
        Left = 15
        Top = 102
        Width = 262
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'UPNOME'#9'60'#9'UPNOME'#9'F')
        DataField = 'IDENTIDINSTR'
        DataSource = ds
        LookupTable = CdsEntid
        LookupField = 'IDPESSOA'
        Style = csDropDownList
        TabOrder = 6
        AutoDropDown = True
        ShowButton = True
        SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
        AllowClearKey = True
        OnEnter = dblcEntidEnter
      end
      object dbedValor: TDBRealEdit
        Left = 580
        Top = 24
        Width = 84
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 7
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'VALOR'
        DataSource = ds
      end
      object dbedDurPrat: TDBRealEdit
        Left = 580
        Top = 63
        Width = 84
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 8
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'DUR_PRAT'
        DataSource = ds
      end
      object dbedDurTeor: TDBRealEdit
        Left = 580
        Top = 102
        Width = 84
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 9
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'DUR_TEOR'
        DataSource = ds
      end
      object dblcSigla: TwwDBLookupCombo
        Left = 472
        Top = 24
        Width = 92
        Height = 21
        DropDownAlignment = taRightJustify
        Selected.Strings = (
          'SIGLA'#9'5'#9'Sigla'#9'F')
        DataField = 'IDSIGLACURSO'
        DataSource = ds
        LookupTable = CdsSiglas
        LookupField = 'IDSIGLACURSO'
        Style = csDropDownList
        TabOrder = 10
        AutoDropDown = True
        ShowButton = True
        SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
        AllowClearKey = True
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 133
      Width = 682
      Height = 226
      Tabs.Strings = (
        'Conteúdo e Observações'
        'Competências Trabalhadas'
        'Avaliações Aplicáveis')
      detdbGrids.Strings = (
        ''
        ''
        'dbgrdDet'
        'dbgrdDet2')
      inherited pgctrlDetalhe: TPageControl
        Width = 584
        Height = 167
        object tbshObserv: TTabSheet [0]
          Caption = 'Conteúdo e Observações'
          ImageIndex = 1
          object Label12: TLabel
            Left = 10
            Top = 3
            Width = 133
            Height = 13
            Caption = 'Conteúdo Programático'
          end
          object Label3: TLabel
            Left = 332
            Top = 3
            Width = 75
            Height = 13
            Caption = 'Observações'
          end
          object dbedObserv: TDBMemo
            Left = 10
            Top = 18
            Width = 300
            Height = 145
            DataField = 'OBSERVACAO'
            DataSource = ds
            ScrollBars = ssVertical
            TabOrder = 0
          end
          object dbedObserv2: TDBMemo
            Left = 332
            Top = 18
            Width = 300
            Height = 145
            DataField = 'OBSERVACAO2'
            DataSource = ds
            ScrollBars = ssVertical
            TabOrder = 1
          end
        end
        inherited tbsDet: TTabSheet
          Caption = 'Competências Trabalhadas'
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 576
            Height = 139
            Selected.Strings = (
              'DESCRFATORAVAL'#9'75'#9'DESCRFATORAVAL')
            Options = [dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgWordWrap]
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 576
            Height = 139
            object Label13: TLabel
              Left = 175
              Top = 39
              Width = 125
              Height = 13
              Caption = 'Fator de Competência'
            end
            object dblcFator: TwwDBLookupCombo
              Left = 175
              Top = 53
              Width = 323
              Height = 21
              DropDownAlignment = taRightJustify
              Selected.Strings = (
                'DESCRFATORAVAL'#9'60'#9'DESCRFATORAVAL'#9'F')
              DataField = 'IDFATORAVAL'
              DataSource = dsDet
              LookupTable = CdsFator
              LookupField = 'IDFATORAVAL'
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
              AllowClearKey = True
            end
          end
        end
        object tbshAvalAplic: TTabSheet
          Caption = 'Avaliações Aplicáveis'
          ImageIndex = 3
          object pnlControlesDet2: TPanel
            Left = 0
            Top = 0
            Width = 576
            Height = 139
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Label14: TLabel
              Left = 175
              Top = 39
              Width = 200
              Height = 13
              Caption = 'Fator de Avaliação de Treinamento'
            end
            object dblcFatorAvalCurso: TwwDBLookupCombo
              Left = 175
              Top = 53
              Width = 323
              Height = 21
              DropDownAlignment = taRightJustify
              Selected.Strings = (
                'DESCRICAO'#9'60'#9'Descrição'#9'F'
                'APLICACAO'#9'10'#9'Aplicação'#9'F')
              DataField = 'IDFATORAVAL'
              DataSource = dsDet2
              LookupTable = CdsFatorAvalCurso
              LookupField = 'IDFATORAVAL'
              Options = [loColLines, loTitles]
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
              AllowClearKey = True
            end
          end
          object dbgrdDet2: TwwDBGrid
            Left = 0
            Top = 0
            Width = 576
            Height = 139
            Selected.Strings = (
              'IDFATORAVAL'#9'10'#9'Código'
              'FATORAVAL'#9'60'#9'Descrição'
              'APLICACAO'#9'6'#9'Aplicação')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsDet2
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgWordWrap]
            TabOrder = 1
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            OnDblClick = dbgrdDetDblClick
            IndicatorColor = icBlack
          end
        end
      end
      inherited Dock973: TDock97
        Width = 674
        inherited tb97BotoesDetalhe: TToolbar97
          inherited sbtnAltDet: TToolbarButton97
            Visible = False
          end
        end
      end
      inherited Dock974: TDock97
        Left = 588
        Height = 167
      end
    end
  end
  inherited Dock972: TDock97
    Width = 684
  end
  inherited Dock971: TDock97
    Width = 684
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 290
    Top = 47
    TargetsData = (
      1
      2
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        'TDBMemo'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 342
    Top = 65535
  end
  inherited ImlPadrao: TImageList
    Left = 288
    Top = 65535
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 392
    Top = 65535
  end
  inherited Cds: TCMClientDataSet
    Left = 340
    Top = 47
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona o Curso'
    Colunas.Strings = (
      'DESCRICAO'
      'IDCURSO'
      'ABREV')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Título'
      'Código'
      'Nome Abreviado')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CURSO')
    CamposChave.Strings = (
      'IDCURSO')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '15'
      '20')
    ExibePergunta = False
    Left = 392
    Top = 47
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 435
    Top = 65535
  end
  inherited dsDet: TwwDataSource
    DataSet = CdsDet
    Left = 317
    Top = 87
  end
  object CdsEntid: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 486
    Top = 1
  end
  object CdsGrupoTr: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 539
    Top = 1
  end
  object CdsTipCurso: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 599
  end
  object CdsPacote: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 654
  end
  object CdsDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 28
    Top = 87
  end
  object CdsFator: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 564
    Top = 39
  end
  object dsDet2: TwwDataSource
    AutoEdit = False
    DataSet = CdsDet2
    Left = 317
    Top = 135
  end
  object CdsDet2: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 28
    Top = 135
  end
  object CdsFatorAvalCurso: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 636
    Top = 183
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      'SELECT IDFATORAVAL, DESCRICAO AS FATORAVAL,'
      ' DECODE(NVL(INDAPLICACAO,0), 0, '#39'Cursos'#39','
      '                          1,'#39'Alunos'#39','#39'Ambos'#39') AS APLICACAO'
      'FROM FATORAVALCURSO')
    ClientDataSet = CdsDet2
    Left = 541
    Top = 279
  end
  object cdsUnidNegocio: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 625
    Top = 48
  end
  object CdsSiglas: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'Dsp'
    Left = 166
    Top = 297
  end
  object DsSiglas: TwwDataSource
    AutoEdit = False
    DataSet = CdsSiglas
    Left = 101
    Top = 305
  end
end
