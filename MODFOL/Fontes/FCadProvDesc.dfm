inherited frmCadProvDesc: TfrmCadProvDesc
  Left = 16
  Top = 105
  HelpContext = 210022
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Rubricas Salariais (Proventos e Descontos)'
  ClientHeight = 438
  ClientWidth = 766
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 766
    Height = 352
    BorderWidth = 2
    inherited pnlMestre: TPanel
      Left = 2
      Top = 2
      Width = 762
      Height = 161
      object Label2: TLabel
        Left = 9
        Top = 39
        Width = 124
        Height = 13
        Caption = 'Descrição da Rubrica'
      end
      object Label4: TLabel
        Left = 9
        Top = 120
        Width = 209
        Height = 13
        Caption = 'Rubrica Padrão CLT Correspondente'
      end
      object lblRegraNormal: TLabel
        Left = 338
        Top = 3
        Width = 99
        Height = 13
        Caption = 'Regra de Cálculo'
      end
      object Label6: TLabel
        Left = 338
        Top = 39
        Width = 138
        Height = 13
        Caption = 'Informe de Rendimentos'
      end
      object Label8: TLabel
        Left = 338
        Top = 75
        Width = 129
        Height = 13
        Caption = 'Natureza da Operação'
      end
      object Label9: TLabel
        Left = 10
        Top = 3
        Width = 84
        Height = 13
        Caption = 'Código Interno'
      end
      object Label11: TLabel
        Left = 146
        Top = 3
        Width = 66
        Height = 13
        Caption = 'Seu Código'
      end
      object dbedDescr: TwwDBEdit
        Left = 9
        Top = 53
        Width = 319
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object gbxOpcoes: TGroupBox
        Left = 610
        Top = 6
        Width = 136
        Height = 103
        Caption = 'Opções'
        TabOrder = 7
        object dbchkObrigaFavorecido: TDBCheckBox
          Left = 6
          Top = 49
          Width = 122
          Height = 14
          Hint = 'Exige a Indicação de um Favorecido ?'
          Caption = 'Exige Favorecido '
          DataField = 'FLGOBRIGAFAVOREC'
          DataSource = ds
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbchkConstaFolha: TDBCheckBox
          Left = 6
          Top = 20
          Width = 118
          Height = 17
          Hint = 'Consta na Folha de Pagamento ?'
          Caption = 'Consta na Folha'
          DataField = 'FLGCONSTAFOLHA'
          DataSource = ds
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbchkEspecial: TDBCheckBox
          Left = 6
          Top = 75
          Width = 75
          Height = 17
          Hint = 'Especial Não Recbe Lançamentos Manuais'
          Caption = 'Especial'
          DataField = 'FLGESPECIAL'
          DataSource = ds
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
      end
      object gbxTipoRub: TDBRadioGroup
        Left = 9
        Top = 82
        Width = 319
        Height = 35
        Caption = 'Tipo de Rubrica'
        Columns = 3
        DataField = 'FLGDESCONTO'
        DataSource = ds
        Items.Strings = (
          'Provento'
          'Desconto'
          'Outro')
        TabOrder = 1
        TabStop = True
        Values.Strings = (
          '0'
          '1'
          '2')
      end
      object gbxSeqCalc: TGroupBox
        Left = 338
        Top = 111
        Width = 262
        Height = 43
        Caption = 'Sequência de Cálculo'
        TabOrder = 6
        object dbedSeqCalc: TwwDBSpinEdit
          Left = 95
          Top = 15
          Width = 81
          Height = 21
          Increment = 1
          DataField = 'NUMPRIORIDADE'
          DataSource = ds
          TabOrder = 0
          UnboundDataType = wwDefault
        end
      end
      object dblcRegraNormal: TwwDBLookupCombo
        Left = 338
        Top = 17
        Width = 262
        Height = 21
        DropDownAlignment = taRightJustify
        Selected.Strings = (
          'NOMEREGRA'#9'60'#9'Regra')
        DataField = 'IDREGRA'
        DataSource = ds
        LookupTable = CdsRegra
        LookupField = 'IDREGRA'
        Style = csDropDownList
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        AllowClearKey = True
      end
      object dblcInforme: TwwDBLookupCombo
        Left = 338
        Top = 53
        Width = 262
        Height = 21
        DropDownAlignment = taRightJustify
        Selected.Strings = (
          'NOMEINFORME'#9'60'#9'NOMEINFORME')
        DataField = 'IDINFORME'
        DataSource = ds
        LookupTable = CdsInforme
        LookupField = 'IDINFORME'
        Style = csDropDownList
        TabOrder = 4
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        AllowClearKey = True
      end
      object dblkcmbRubCLT: TwwDBLookupCombo
        Left = 9
        Top = 134
        Width = 319
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'40'#9'DESCRICAO')
        DataField = 'CODRUBCLT'
        DataSource = ds
        LookupTable = CdsRubCLT
        LookupField = 'CODRUBCLT'
        Style = csDropDownList
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        AllowClearKey = True
      end
      object dblcNaturOper: TwwDBLookupCombo
        Left = 338
        Top = 89
        Width = 262
        Height = 21
        DropDownAlignment = taRightJustify
        Selected.Strings = (
          'DESCRICAO'#9'60'#9'DESCRICAO')
        DataField = 'CODIRRFDARF'
        DataSource = ds
        LookupTable = CdsNaturOper
        LookupField = 'CODNATUREZA'
        Style = csDropDownList
        TabOrder = 5
        AutoDropDown = True
        ShowButton = True
        UseTFields = False
        AllowClearKey = True
      end
      object edCodInterno: TEdit
        Left = 10
        Top = 17
        Width = 127
        Height = 21
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 9
      end
      object edSeuCod: TEdit
        Left = 146
        Top = 17
        Width = 182
        Height = 21
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 10
      end
      object gbxFontePagadora: TGroupBox
        Left = 610
        Top = 111
        Width = 136
        Height = 45
        Caption = 'Fonte Pagadora'
        TabOrder = 8
        object dbcmbFontePagadora: TwwDBComboBox
          Left = 9
          Top = 15
          Width = 119
          Height = 21
          ShowButton = True
          Style = csDropDownList
          MapList = True
          AllowClearKey = True
          AutoDropDown = True
          DataField = 'CODFONTEPAGADORA'
          DataSource = ds
          DropDownCount = 8
          ItemHeight = 13
          Items.Strings = (
            'Fundação'#9'0'
            'INSS'#9'2'
            'Patrocinadora'#9'1')
          Sorted = False
          TabOrder = 0
          UnboundDataType = wwDefault
        end
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Left = 2
      Top = 163
      Width = 762
      Height = 187
      Tabs.Strings = (
        'Incidência em Eventos'
        'Incidência em Outras Rubricas'
        'Incidência de Outras Rubricas'
        'Incidência em Afastamentos')
      detdbGrids.Strings = (
        ''
        'dbgrdDet'
        'dbgrdIncidDeOutRub'
        'dbgrdIncidAfast')
      inherited pgctrlDetalhe: TPageControl
        Width = 664
        Height = 128
        ActivePage = tbsIncidEv
        TabOrder = 2
        object tbsIncidEv: TTabSheet [0]
          Caption = 'tbsIncidEv'
          object lblRegra13: TLabel
            Left = 356
            Top = 55
            Width = 151
            Height = 13
            Caption = 'Regra de Cálculo para 13º'
          end
          object lblRegraFerias: TLabel
            Left = 186
            Top = 55
            Width = 102
            Height = 13
            Caption = 'Regra para Férias'
          end
          object lblRegraResc: TLabel
            Left = 526
            Top = 55
            Width = 120
            Height = 13
            Caption = 'Regra para Rescisão'
          end
          object dbrgNormal: TDBRadioGroup
            Left = 16
            Top = 0
            Width = 160
            Height = 40
            Caption = 'Folha Normal'
            Columns = 2
            DataField = 'FLGSALFAMILIA'
            DataSource = ds
            Items.Strings = (
              'Sim'
              'Não')
            TabOrder = 0
            Values.Strings = (
              '1'
              '0')
          end
          object dbrgFerias: TDBRadioGroup
            Left = 186
            Top = 0
            Width = 160
            Height = 40
            Caption = 'Férias'
            Columns = 2
            DataField = 'FLGFERIAS'
            DataSource = ds
            Items.Strings = (
              'Sim'
              'Não')
            TabOrder = 1
            Values.Strings = (
              '1'
              '0')
            OnChange = dbrgFeriasChange
          end
          object dbrg13: TDBRadioGroup
            Left = 356
            Top = 0
            Width = 160
            Height = 40
            Caption = 'Décimo Terceiro'
            Columns = 2
            DataField = 'FLGDECIMOTERCEIRO'
            DataSource = ds
            Items.Strings = (
              'Sim'
              'Não')
            TabOrder = 2
            Values.Strings = (
              '1'
              '0')
            OnChange = dbrg13Change
          end
          object dbrgRescisao: TDBRadioGroup
            Left = 526
            Top = 0
            Width = 160
            Height = 40
            Caption = 'Rescisão'
            Columns = 2
            DataField = 'FLGRESCISAO'
            DataSource = ds
            Items.Strings = (
              'Sim'
              'Não')
            TabOrder = 3
            Values.Strings = (
              '1'
              '0')
            OnChange = dbrgRescisaoChange
          end
          object dblcRegraFerias: TwwDBLookupCombo
            Left = 186
            Top = 69
            Width = 160
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOMEREGRA'#9'60'#9'Regra')
            DataField = 'IDREGRAFERIAS'
            DataSource = ds
            LookupTable = CdsRegra
            LookupField = 'IDREGRA'
            Style = csDropDownList
            TabOrder = 4
            AutoDropDown = True
            ShowButton = True
            UseTFields = False
            AllowClearKey = True
          end
          object dblcRegra13: TwwDBLookupCombo
            Left = 356
            Top = 69
            Width = 160
            Height = 21
            DropDownAlignment = taRightJustify
            Selected.Strings = (
              'NOMEREGRA'#9'60'#9'Regra')
            DataField = 'IDREGRA13'
            DataSource = ds
            LookupTable = CdsRegra
            LookupField = 'IDREGRA'
            Style = csDropDownList
            TabOrder = 5
            AutoDropDown = True
            ShowButton = True
            UseTFields = False
            AllowClearKey = True
          end
          object dblcRegraResc: TwwDBLookupCombo
            Left = 526
            Top = 69
            Width = 160
            Height = 21
            DropDownAlignment = taRightJustify
            Selected.Strings = (
              'NOMEREGRA'#9'60'#9'Regra')
            DataField = 'IDREGRARESCISAO'
            DataSource = ds
            LookupTable = CdsRegra
            LookupField = 'IDREGRA'
            Style = csDropDownList
            TabOrder = 6
            AutoDropDown = True
            ShowButton = True
            UseTFields = False
            AllowClearKey = True
          end
        end
        inherited tbsDet: TTabSheet
          Caption = 'tbsDet'
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 656
            Height = 100
            ControlType.Strings = (
              'FLGBASECALC;CheckBox;0;1'
              'FLGTIPOFOLHA;CheckBox;0;1'
              'FLGACAOINCIDE;CheckBox;0;1')
            Selected.Strings = (
              'DESCRICAO'#9'38'#9'Nome da Rubrica'#9'F'
              'IDRUBSECUND'#9'6'#9'Código'
              'FLGBASECALC'#9'12'#9'Valor Calculado?'
              'FLGTIPOFOLHA'#9'10'#9'Mesma Folha?'
              'INDPERIODO'#9'10'#9'Período Incid.'
              'FLGACAOINCIDE'#9'5'#9'Soma?'
              'NUMPRIORIDADE'#9'10'#9'Seq.')
            DataSource = dsRubxRubEm
            Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect]
            UseTFields = False
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 656
            Height = 100
            object Label5: TLabel
              Left = 2
              Top = 9
              Width = 199
              Height = 13
              Caption = 'Rubrica em que incide esta rubrica'
            end
            object Label3: TLabel
              Left = 433
              Top = 9
              Width = 219
              Height = 13
              Caption = 'Período da Incidência (Zero = Mesmo)'
            end
            object dbclkcmbRubIncid1: TwwDBLookupCombo
              Left = 2
              Top = 24
              Width = 423
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'130'#9'DESCRICAO')
              DataField = 'IDRUBSECUND'
              DataSource = dsRubxRubEm
              LookupTable = CdsRubIncid
              LookupField = 'IDPROVENTO'
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
              OnCloseUp = dbclkcmbRubIncid1CloseUp
            end
            object dbrgFlg: TDBRadioGroup
              Left = 2
              Top = 62
              Width = 271
              Height = 37
              Caption = 'Incidência Composta Pelo Valor'
              Columns = 2
              DataField = 'FLGBASECALC'
              DataSource = dsRubxRubEm
              Items.Strings = (
                'Calculado'
                'Base ou Informado')
              TabOrder = 1
              Values.Strings = (
                '0'
                '1')
            end
            object dbrgFlgTipoFolha: TDBRadioGroup
              Left = 276
              Top = 62
              Width = 197
              Height = 37
              Caption = 'Incide no Mesmo Tipo de Folha'
              Columns = 2
              DataField = 'FLGTIPOFOLHA'
              DataSource = dsRubxRubEm
              Items.Strings = (
                'Sim'
                'Não')
              TabOrder = 2
              Values.Strings = (
                '0'
                '1')
            end
            object dbspPeriodo1: TwwDBSpinEdit
              Left = 433
              Top = 24
              Width = 190
              Height = 21
              Increment = 1
              MaxValue = 99
              MinValue = -99
              Value = -99
              DataField = 'INDPERIODO'
              DataSource = dsRubxRubEm
              TabOrder = 3
              UnboundDataType = wwDefault
            end
            object dbrgTipoAcao: TDBRadioGroup
              Left = 476
              Top = 62
              Width = 176
              Height = 37
              Caption = 'Tipo de Ação'
              Columns = 2
              DataField = 'FLGACAOINCIDE'
              DataSource = dsRubxRubEm
              Items.Strings = (
                'Soma'
                'Subtração')
              TabOrder = 4
              Values.Strings = (
                '0'
                '1')
            end
          end
        end
        object tbsIncidDeOutRub: TTabSheet
          Caption = 'tbsIncidDeOutRub'
          object dbgrdIncidDeOutRub: TwwDBGrid
            Left = 0
            Top = 0
            Width = 656
            Height = 100
            ControlType.Strings = (
              'FLGBASECALC;CheckBox;0;1'
              'FLGTIPOFOLHA;CheckBox;0;1'
              'FLGACAOINCIDE;CheckBox;0;1')
            Selected.Strings = (
              'DESCRICAO'#9'38'#9'Nome da Rubrica'#9'F'
              'IDRUBPRINC'#9'6'#9'Código'
              'FLGBASECALC'#9'12'#9'Valor Calculado?'
              'FLGTIPOFOLHA'#9'10'#9'Mesma Folha?'
              'INDPERIODO'#9'10'#9'Período Incid.'
              'FLGACAOINCIDE'#9'5'#9'Soma?'
              'NUMPRIORIDADE'#9'10'#9'Seq.')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsRubxRubDe
            Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect]
            TabOrder = 1
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            UseTFields = False
            IndicatorColor = icBlack
          end
          object Panel1: TPanel
            Left = 0
            Top = 0
            Width = 656
            Height = 100
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Label1: TLabel
              Left = 2
              Top = 9
              Width = 186
              Height = 13
              Caption = 'Rubrica que incide nesta rubrica'
            end
            object Label7: TLabel
              Left = 433
              Top = 9
              Width = 219
              Height = 13
              Caption = 'Período da Incidência (Zero = Mesmo)'
            end
            object dbclkcmbRubIncid2: TwwDBLookupCombo
              Left = 2
              Top = 24
              Width = 423
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'130'#9'DESCRICAO')
              DataField = 'IDRUBPRINC'
              DataSource = dsRubxRubDe
              LookupTable = CdsRubIncid
              LookupField = 'IDPROVENTO'
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
              OnCloseUp = dbclkcmbRubIncid2CloseUp
            end
            object DBRadioGroup1: TDBRadioGroup
              Left = 2
              Top = 62
              Width = 271
              Height = 37
              Caption = 'Incidência Composta Pelo Valor'
              Columns = 2
              DataField = 'FLGBASECALC'
              DataSource = dsRubxRubDe
              Items.Strings = (
                'Calculado'
                'Base ou Informado')
              TabOrder = 1
              Values.Strings = (
                '0'
                '1')
            end
            object DBRadioGroup2: TDBRadioGroup
              Left = 276
              Top = 62
              Width = 197
              Height = 37
              Caption = 'Incide no Mesmo Tipo de Folha'
              Columns = 2
              DataField = 'FLGTIPOFOLHA'
              DataSource = dsRubxRubDe
              Items.Strings = (
                'Sim'
                'Não')
              TabOrder = 2
              Values.Strings = (
                '0'
                '1')
            end
            object dbspPeriodo2: TwwDBSpinEdit
              Left = 433
              Top = 24
              Width = 190
              Height = 21
              Increment = 1
              MaxValue = 99
              MinValue = -99
              Value = -99
              DataField = 'INDPERIODO'
              DataSource = dsRubxRubDe
              TabOrder = 3
              UnboundDataType = wwDefault
            end
            object DBRadioGroup3: TDBRadioGroup
              Left = 476
              Top = 62
              Width = 176
              Height = 37
              Caption = 'Tipo de Ação'
              Columns = 2
              DataField = 'FLGACAOINCIDE'
              DataSource = dsRubxRubDe
              Items.Strings = (
                'Soma'
                'Subtração')
              TabOrder = 4
              Values.Strings = (
                '0'
                '1')
            end
          end
        end
        object tbsIncidAfast: TTabSheet
          Caption = 'tbsIncidAfast'
          object dbgrdIncidAfast: TwwDBGrid
            Left = 0
            Top = 0
            Width = 656
            Height = 100
            Selected.Strings = (
              'DESCRICAO'#9'100'#9'Nome da Rubrica'#9'No')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsDet
            Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgRowSelect]
            TabOrder = 1
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            UseTFields = False
            IndicatorColor = icBlack
          end
          object Panel2: TPanel
            Left = 0
            Top = 0
            Width = 656
            Height = 100
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Label10: TLabel
              Left = 52
              Top = 22
              Width = 313
              Height = 13
              Caption = 'Situação de afastamento em que se aplica esta rubrica'
            end
            object dblcSitFunc: TwwDBLookupCombo
              Left = 52
              Top = 43
              Width = 350
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'30'#9'DESCRICAO')
              DataField = 'IDSITFUNC'
              DataSource = dsDet
              LookupTable = CdsSituacao
              LookupField = 'IDSITFUNC'
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              OrderByDisplay = False
              UseTFields = False
              AllowClearKey = True
              ShowMatchText = True
              OnCloseUp = dblcSitFuncCloseUp
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 754
      end
      inherited Dock974: TDock97
        Left = 668
        Height = 128
      end
    end
  end
  inherited Dock972: TDock97
    Width = 766
  end
  inherited Dock971: TDock97
    Top = 399
    Width = 766
    inherited tb97Fundo: TToolbar97
      Left = 596
      DockPos = 769
      inherited sep1: TToolbarSep97
        Left = 164
        SizeHorz = 2
      end
      inherited sep3: TToolbarSep97
        SizeHorz = 2
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 83
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 428
      DockPos = 440
      inherited ToolbarSep971: TToolbarSep97
        SizeHorz = 2
      end
      inherited bbtnCancelar: TBitBtn
        Left = 83
      end
    end
    object Toolbar972: TToolbar97
      Left = 0
      Top = 0
      Caption = 'TB97oKCancelar'
      DockPos = 0
      TabOrder = 2
      object bbtnCopiarRub: TBitBtn
        Left = 0
        Top = 0
        Width = 143
        Height = 33
        Caption = '&Copiar Rubrica'
        TabOrder = 0
        OnClick = bbtnCopiarRubClick
        Glyph.Data = {
          36010000424D3601000000000000760000002800000011000000100000000100
          040000000000C000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          55555000000055555550005555555000000055800850B058005550000000553B
          03033000330550000000553B0333F0B3330550000000700BB0338303F8005000
          000003303FFBBFBB3033000000000333FB000008B033000000003F3FB77F7703
          FBFB000000003333F77F8707B800500000005503FF7F770FB30550000000553F
          BB7F8703FB05500000005553377877073755500000005555557FF80555555000
          0000555555577755555550000000555555555555555550000000}
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 668
    Top = 1
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 270
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 726
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 537
    Top = 13
  end
  inherited Cds: TCMClientDataSet
    AfterInsert = CdsAfterInsert
    Left = 242
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Rubricas Salariais'
    Colunas.Strings = (
      'PROVDESC.DESCRICAO'
      'PROVDESC.IDPROVENTO'
      'RUBRICAXPESS.CODPROVDESC'
      'PROVDESC.CODRUBCLT'
      'PROVDESC.IDREGRA'
      'PROVDESC.IDREGRAFERIAS'
      'PROVDESC.IDREGRA13'
      'PROVDESC.IDREGRARESCISAO'
      'PROVDESC.NUMPRIORIDADE')
    TipodeDado.Strings = (
      'C'
      'N'
      'C'
      'C'
      'N'
      'N'
      'N'
      'N'
      'N')
    Descricao.Strings = (
      'Nome da Rubrica'
      'Cód. Interno'
      'Seu Código'
      'Cód. Rubrica CLT'
      'Cod. Regra Principal'
      'Cod. Regra Férias'
      'Cod. Regra 13º'
      'Cod. Regra Rescisão'
      'Sequência de Cálculo')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PROVDESC'
      'RUBRICAXPESS')
    CamposChave.Strings = (
      'PROVDESC.IDPROVENTO'
      'RUBRICAXPESS.CODPROVDESC')
    Filtro.Strings = (
      'PROVDESC.FLGTPRUBRICA LIKE ('#39'%F%'#39')'
      'PROVDESC.IDPROVENTO = RUBRICAXPESS.IDRUBRICA(+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '55'
      '12'
      '12'
      '5'
      '10'
      '10'
      '10'
      '10'
      '10')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 604
    Top = 1
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 537
    Top = 1
  end
  inherited dsDet: TwwDataSource
    DataSet = CdsRubSit
    OnStateChange = dsDetStateChange
    Left = 306
    Top = 15
  end
  object dsRubxRubDe: TwwDataSource
    AutoEdit = False
    DataSet = CdsRubxRubDe
    OnStateChange = dsRubxRubDeStateChange
    Left = 461
    Top = 15
  end
  object dsRubxRubEm: TwwDataSource
    AutoEdit = False
    DataSet = CdsRubxRubEm
    OnStateChange = dsRubxRubEmStateChange
    Left = 376
    Top = 15
  end
  object CdsRubSit: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDPROVENTO'
        DataType = ftFloat
      end
      item
        Name = 'IDSITFUNC'
        DataType = ftFloat
      end
      item
        Name = 'DESCRICAO'
        DataType = ftString
        Size = 60
      end>
    IndexDefs = <
      item
        Name = 'CdsRubSitIndex'
        CaseInsFields = 'DESCRICAO'
        Fields = 'DESCRICAO'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'CdsRubSitIndex'
    Params = <>
    StoreDefs = True
    AfterInsert = CdsRubSitAfterInsert
    Left = 306
    Top = 1
  end
  object CdsRegra: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'CdsRegraIndex'
        CaseInsFields = 'NOMEREGRA'
        Fields = 'NOMEREGRA'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'CdsRegraIndex'
    Params = <>
    StoreDefs = True
    Left = 186
    Top = 392
  end
  object CdsRubCLT: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'CdsRubCLTIndex'
        CaseInsFields = 'DESCRICAO'
        Fields = 'DESCRICAO'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'CdsRubCLTIndex'
    Params = <>
    StoreDefs = True
    Left = 186
    Top = 379
  end
  object CdsInforme: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'CdsInformeIndex'
        CaseInsFields = 'NOMEINFORME'
        Fields = 'NOMEINFORME'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'CdsInformeIndex'
    Params = <>
    StoreDefs = True
    Left = 186
    Top = 365
  end
  object CdsRubIncid: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'CdsRubIncidIndex'
        CaseInsFields = 'DESCRICAO'
        Fields = 'DESCRICAO'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'CdsRubIncidIndex'
    Params = <>
    StoreDefs = True
    Left = 255
    Top = 392
  end
  object CdsNaturOper: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'CdsNaturOperIndex'
        CaseInsFields = 'DESCRICAO'
        Fields = 'DESCRICAO'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'CdsNaturOperIndex'
    Params = <>
    StoreDefs = True
    Left = 255
    Top = 378
  end
  object CdsSituacao: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'CdsSituacaoIndex'
        CaseInsFields = 'DESCRICAO'
        Fields = 'DESCRICAO'
        Options = [ixCaseInsensitive]
      end>
    Params = <>
    StoreDefs = True
    Left = 255
    Top = 365
  end
  object CdsRubxRubEm: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterInsert = CdsRubxRubEmAfterInsert
    Left = 376
    Top = 1
  end
  object CdsRubxRubDe: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterInsert = CdsRubxRubDeAfterInsert
    Left = 461
    Top = 1
  end
end
