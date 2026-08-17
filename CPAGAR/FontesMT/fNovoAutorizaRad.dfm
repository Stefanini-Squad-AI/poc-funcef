inherited frmNovoAutorizaRad: TfrmNovoAutorizaRad
  Left = 5
  Top = 5
  BorderStyle = bsSingle
  Caption = 'Autorização de Processos RAD'
  ClientHeight = 531
  ClientWidth = 787
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 787
    Height = 492
    object PageControl1: TPageControl
      Left = 1
      Top = 1
      Width = 785
      Height = 490
      ActivePage = TabSheet1
      Align = alClient
      TabOrder = 0
      OnChange = PageControl1Change
      object TabSheet1: TTabSheet
        Caption = 'Processos Rad'
        object pnlProcessos: TPanel
          Left = 0
          Top = 0
          Width = 777
          Height = 462
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 0
          object Panel7: TPanel
            Left = 0
            Top = 0
            Width = 777
            Height = 462
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Splitter2: TSplitter
              Left = 246
              Top = 0
              Width = 4
              Height = 462
              Cursor = crHSplit
              Beveled = True
              Color = clBtnFace
              ParentColor = False
              ResizeStyle = rsUpdate
            end
            object Panel8: TPanel
              Left = 0
              Top = 0
              Width = 246
              Height = 462
              Align = alLeft
              BevelOuter = bvNone
              TabOrder = 0
              object Panel2: TPanel
                Left = 0
                Top = 379
                Width = 246
                Height = 83
                Align = alBottom
                BevelOuter = bvNone
                TabOrder = 0
                object GroupBox1: TGroupBox
                  Left = 0
                  Top = 1
                  Width = 244
                  Height = 78
                  Caption = 'Exibir'
                  TabOrder = 0
                  object Panel6: TPanel
                    Left = 6
                    Top = 13
                    Width = 113
                    Height = 26
                    Hint = 
                      'Mostra na Grade os processos em atraso, dependentes de sua aprov' +
                      'ação'
                    BevelInner = bvLowered
                    BevelOuter = bvNone
                    Color = 12049407
                    ParentShowHint = False
                    ShowHint = True
                    TabOrder = 0
                    object CheckBox4: TCheckBox
                      Left = 6
                      Top = 5
                      Width = 100
                      Height = 17
                      Caption = 'Em Atraso'
                      Checked = True
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      ParentShowHint = False
                      ShowHint = False
                      State = cbChecked
                      TabOrder = 0
                    end
                  end
                  object Panel5: TPanel
                    Left = 124
                    Top = 13
                    Width = 113
                    Height = 26
                    Hint = 
                      'Mostra na Grade os processos em dia, dependentes de sua aprovaçã' +
                      'o'
                    BevelInner = bvLowered
                    BevelOuter = bvNone
                    Color = 14680031
                    ParentShowHint = False
                    ShowHint = True
                    TabOrder = 1
                    object CheckBox3: TCheckBox
                      Left = 6
                      Top = 5
                      Width = 100
                      Height = 17
                      Caption = 'Em Dia'
                      Checked = True
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      ParentShowHint = False
                      ShowHint = True
                      State = cbChecked
                      TabOrder = 0
                    end
                  end
                  object Panel4: TPanel
                    Left = 6
                    Top = 45
                    Width = 113
                    Height = 26
                    Hint = 
                      'Mostra na Grade os processos atrasados, dependente da aprovação ' +
                      'de terceiros'
                    BevelInner = bvLowered
                    BevelOuter = bvNone
                    Color = 16777183
                    ParentShowHint = False
                    ShowHint = True
                    TabOrder = 2
                    object CheckBox2: TCheckBox
                      Left = 6
                      Top = 4
                      Width = 100
                      Height = 20
                      Caption = 'Atraso Terceiros'
                      Checked = True
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      State = cbChecked
                      TabOrder = 0
                    end
                  end
                  object Panel3: TPanel
                    Left = 124
                    Top = 45
                    Width = 113
                    Height = 26
                    Hint = 
                      'Mostra na Grade os processos em que você autoriza como substitut' +
                      'o'
                    BevelInner = bvLowered
                    BevelOuter = bvNone
                    Color = 14155775
                    ParentShowHint = False
                    ShowHint = True
                    TabOrder = 3
                    object CheckBox1: TCheckBox
                      Left = 6
                      Top = 5
                      Width = 100
                      Height = 17
                      Caption = 'Substituição'
                      Checked = True
                      Font.Charset = DEFAULT_CHARSET
                      Font.Color = clWindowText
                      Font.Height = -9
                      Font.Name = 'MS Sans Serif'
                      Font.Style = []
                      ParentFont = False
                      State = cbChecked
                      TabOrder = 0
                    end
                  end
                end
              end
              object Panel9: TPanel
                Left = 0
                Top = 0
                Width = 246
                Height = 17
                Align = alTop
                Alignment = taLeftJustify
                BevelOuter = bvNone
                Caption = ' Processos pendentes de liberação'
                Color = clGray
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 1
              end
              object wwDBGrid1: TwwDBGrid
                Left = 0
                Top = 17
                Width = 246
                Height = 362
                ControlType.Strings = (
                  'AUTORIZA;CheckBox;S;N'
                  'RESSALVA;CheckBox;S;N'
                  'RECUSA;CheckBox;S;N')
                PictureMasks.Strings = (
                  'VLRPROC'#9'#,##0.00;(#,##0.00)'#9'T'#9'T')
                Selected.Strings = (
                  'IDPROCESSO'#9'7'#9'Processo'#9'F'
                  'NOME'#9'35'#9'Descrição'#9'F'
                  'DATAINIPROCESSO'#9'16'#9'Início'#9'F'
                  'DATAFIMPREV'#9'16'#9'Fim (previsto)'#9'F'
                  'VLRPROC'#9'10'#9'Valor'#9'F'
                  'NOMEUSUARIO'#9'20'#9'Usuário'#9'F'
                  'OBS'#9'35'#9'Observação'#9'F'
                  'NOMEETAPA'#9'35'#9'Etapa'#9'F'
                  'DATAINIETAPA'#9'16'#9'Início da Etapa'#9'F'
                  'DATAPROGRAMADA'#9'14'#9'Data Programada'#9'F'
                  'FORNECEDOR'#9'35'#9'Fornecedor'#9'F')
                IniAttributes.Delimiter = ';;'
                TitleColor = clBtnFace
                FixedCols = 0
                ShowHorzScrollBar = True
                Align = alClient
                DataSource = dtsRAD
                MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
                Options = [dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap, dgMultiSelect]
                ReadOnly = True
                TabOrder = 2
                TitleAlignment = taLeftJustify
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -9
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = [fsBold]
                TitleLines = 1
                TitleButtons = False
                OnDrawDataCell = wwDBGrid1DrawDataCell
                IndicatorColor = icBlack
              end
            end
            object Panel1: TPanel
              Left = 250
              Top = 0
              Width = 527
              Height = 462
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 1
              object Label1: TLabel
                Left = 8
                Top = 24
                Width = 53
                Height = 13
                Caption = 'Processo'
                FocusControl = DBEdit1
              end
              object Label3: TLabel
                Left = 153
                Top = 24
                Width = 34
                Height = 13
                Caption = 'Início'
                FocusControl = DBEdit3
              end
              object Label4: TLabel
                Left = 281
                Top = 24
                Width = 77
                Height = 13
                Caption = 'Fim (previsto)'
              end
              object Label5: TLabel
                Left = 8
                Top = 80
                Width = 58
                Height = 13
                Caption = 'Descrição'
                FocusControl = DBEdit5
              end
              object Label6: TLabel
                Left = 409
                Top = 136
                Width = 99
                Height = 13
                Caption = 'Data Programada'
                FocusControl = DBEdit6
              end
              object Label8: TLabel
                Left = 8
                Top = 264
                Width = 69
                Height = 13
                Caption = 'Observação'
              end
              object Label10: TLabel
                Left = 8
                Top = 200
                Width = 34
                Height = 13
                Caption = 'Etapa'
                FocusControl = DBEdit10
              end
              object Label11: TLabel
                Left = 409
                Top = 200
                Width = 89
                Height = 13
                Caption = 'Início da Etapa'
                FocusControl = DBEdit11
              end
              object Label2: TLabel
                Left = 9
                Top = 136
                Width = 65
                Height = 13
                Caption = 'Fornecedor'
                FocusControl = DBEdit2
              end
              object Label7: TLabel
                Left = 281
                Top = 136
                Width = 30
                Height = 13
                Caption = 'Valor'
                FocusControl = DBEdit7
              end
              object Label19: TLabel
                Left = 408
                Top = 24
                Width = 44
                Height = 13
                Caption = 'Usuário'
              end
              object DBEdit1: TDBEdit
                Left = 8
                Top = 40
                Width = 100
                Height = 21
                Color = 15658734
                DataField = 'IDPROCESSO'
                DataSource = dtsRAD
                ReadOnly = True
                TabOrder = 0
              end
              object DBEdit3: TDBEdit
                Left = 153
                Top = 40
                Width = 113
                Height = 21
                Color = 15658734
                DataField = 'DATAINIPROCESSO'
                DataSource = dtsRAD
                MaxLength = 16
                ReadOnly = True
                TabOrder = 1
              end
              object DBEdit5: TDBEdit
                Left = 8
                Top = 96
                Width = 516
                Height = 21
                Color = 15658734
                DataField = 'NOME'
                DataSource = dtsRAD
                ReadOnly = True
                TabOrder = 2
              end
              object DBEdit6: TDBEdit
                Left = 408
                Top = 152
                Width = 113
                Height = 21
                Color = 15658734
                DataField = 'DATAPROGRAMADA'
                DataSource = dtsRAD
                ReadOnly = True
                TabOrder = 3
              end
              object DBEdit10: TDBEdit
                Left = 8
                Top = 216
                Width = 386
                Height = 21
                Color = 15658734
                DataField = 'NOMEETAPA'
                DataSource = dtsRAD
                ReadOnly = True
                TabOrder = 4
              end
              object DBEdit11: TDBEdit
                Left = 409
                Top = 216
                Width = 113
                Height = 21
                Color = 15658734
                DataField = 'DATAINIETAPA'
                DataSource = dtsRAD
                MaxLength = 16
                ReadOnly = True
                TabOrder = 5
              end
              object Panel10: TPanel
                Left = 0
                Top = 0
                Width = 527
                Height = 17
                Align = alTop
                Alignment = taLeftJustify
                BevelOuter = bvNone
                Caption = ' Detalhes do(s) processo(s) selecionados'
                Color = clGray
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 6
              end
              object DBMemo1: TDBMemo
                Left = 8
                Top = 280
                Width = 516
                Height = 105
                Color = 15658734
                DataField = 'OBS'
                DataSource = dtsRAD
                ReadOnly = True
                ScrollBars = ssVertical
                TabOrder = 7
              end
              object DBEdit2: TDBEdit
                Left = 8
                Top = 152
                Width = 258
                Height = 21
                Color = 15658734
                DataField = 'FORNECEDOR'
                DataSource = dtsRAD
                ReadOnly = True
                TabOrder = 8
              end
              object DBEdit7: TDBEdit
                Left = 281
                Top = 152
                Width = 113
                Height = 21
                Color = 15658734
                DataField = 'VLRPROC'
                DataSource = dtsRAD
                ReadOnly = True
                TabOrder = 9
              end
              object DBEdit4: TDBEdit
                Left = 281
                Top = 40
                Width = 113
                Height = 21
                Color = 15658734
                DataField = 'DATAFIMPREV'
                DataSource = dtsRAD
                MaxLength = 16
                ReadOnly = True
                TabOrder = 10
              end
              object DBEdit12: TDBEdit
                Left = 408
                Top = 40
                Width = 113
                Height = 21
                Color = 15658734
                DataField = 'NOMEUSUARIO'
                DataSource = dtsRAD
                ReadOnly = True
                TabOrder = 11
              end
            end
          end
        end
      end
      object TabSheet2: TTabSheet
        Caption = 'Consultas'
        ImageIndex = 1
        object Panel12: TPanel
          Left = 0
          Top = 0
          Width = 777
          Height = 42
          Align = alTop
          BevelOuter = bvLowered
          TabOrder = 0
          object Label14: TLabel
            Left = 4
            Top = 2
            Width = 53
            Height = 13
            Caption = 'Processo'
          end
          object Label15: TLabel
            Left = 121
            Top = 2
            Width = 58
            Height = 13
            Caption = 'Descrição'
          end
          object Label16: TLabel
            Left = 533
            Top = 2
            Width = 65
            Height = 13
            Caption = 'Data Início'
          end
          object Label12: TLabel
            Left = 662
            Top = 2
            Width = 77
            Height = 13
            Caption = 'Fim (previsto)'
          end
          object wwDBEdit1: TwwDBEdit
            Left = 4
            Top = 16
            Width = 100
            Height = 21
            Color = 15658734
            DataField = 'IDPROCESSO'
            DataSource = dtsRAD
            ReadOnly = True
            TabOrder = 0
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object wwDBEdit2: TwwDBEdit
            Left = 120
            Top = 16
            Width = 393
            Height = 21
            Color = 15658734
            DataField = 'NOME'
            DataSource = dtsRAD
            ReadOnly = True
            TabOrder = 1
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object DBEdit8: TDBEdit
            Left = 662
            Top = 16
            Width = 113
            Height = 21
            Color = 15658734
            DataField = 'DATAFIMPREV'
            DataSource = dtsRAD
            MaxLength = 16
            ReadOnly = True
            TabOrder = 2
          end
          object wwDBEdit3: TwwDBEdit
            Left = 532
            Top = 16
            Width = 113
            Height = 21
            Color = 15658734
            DataField = 'DATAINIETAPA'
            DataSource = dtsRAD
            MaxLength = 16
            ReadOnly = True
            TabOrder = 3
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
        end
        object pnlSub: TPanel
          Left = 0
          Top = 42
          Width = 777
          Height = 420
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'Fluxo'
        ImageIndex = 2
        object Panel15: TPanel
          Left = 0
          Top = 0
          Width = 777
          Height = 462
          Align = alClient
          BevelOuter = bvNone
          BorderWidth = 5
          TabOrder = 0
          object Panel13: TPanel
            Left = 5
            Top = 47
            Width = 767
            Height = 410
            Align = alClient
            BevelOuter = bvNone
            TabOrder = 0
            object Splitter1: TSplitter
              Left = 0
              Top = 257
              Width = 767
              Height = 4
              Cursor = crVSplit
              Align = alTop
              Beveled = True
              ResizeStyle = rsUpdate
            end
            object Panel14: TPanel
              Left = 0
              Top = 0
              Width = 767
              Height = 257
              Align = alTop
              BevelOuter = bvNone
              Constraints.MinHeight = 75
              ParentColor = True
              TabOrder = 0
              object Panel17: TPanel
                Left = 0
                Top = 0
                Width = 767
                Height = 17
                Align = alTop
                Alignment = taLeftJustify
                BevelOuter = bvNone
                Caption = ' Etapas do processo selecionado'
                Color = clGray
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
                TabOrder = 0
              end
              object GrdEtapa: TwwDBGrid
                Left = 0
                Top = 17
                Width = 767
                Height = 240
                Selected.Strings = (
                  'NOMETAPA'#9'53'#9'Etapa'#9'F'
                  'DATAINIETAPA'#9'17'#9'Início'
                  'DATAFIMPREV'#9'17'#9'Término (Previsto)'
                  'DATAFIMETAPA'#9'17'#9'Término (Efetivo)')
                IniAttributes.Delimiter = ';;'
                TitleColor = clBtnFace
                FixedCols = 0
                ShowHorzScrollBar = True
                Align = alClient
                DataSource = dsEtapa
                Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
                TabOrder = 1
                TitleAlignment = taLeftJustify
                TitleFont.Charset = DEFAULT_CHARSET
                TitleFont.Color = clWindowText
                TitleFont.Height = -9
                TitleFont.Name = 'MS Sans Serif'
                TitleFont.Style = [fsBold]
                TitleLines = 2
                TitleButtons = False
                IndicatorColor = icBlack
              end
            end
            object Panel16: TPanel
              Left = 0
              Top = 261
              Width = 767
              Height = 149
              Align = alClient
              BevelOuter = bvNone
              TabOrder = 1
              object Splitter3: TSplitter
                Left = 497
                Top = 0
                Width = 4
                Height = 149
                Cursor = crHSplit
                Beveled = True
                ResizeStyle = rsUpdate
              end
              object plnBem: TPanel
                Left = 501
                Top = 0
                Width = 266
                Height = 149
                Align = alClient
                BevelInner = bvLowered
                TabOrder = 0
                object memOBS: TDBMemo
                  Left = 2
                  Top = 19
                  Width = 262
                  Height = 128
                  Align = alClient
                  Color = 14811135
                  DataField = 'OBSAUTORIZA'
                  DataSource = dsAut
                  MaxLength = 200
                  ReadOnly = True
                  ScrollBars = ssVertical
                  TabOrder = 0
                end
                object Panel20: TPanel
                  Left = 2
                  Top = 2
                  Width = 262
                  Height = 17
                  Align = alTop
                  Alignment = taLeftJustify
                  BevelOuter = bvNone
                  Caption = 'Observações da autorização selecionada'
                  Color = clGray
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWhite
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 1
                end
              end
              object Panel18: TPanel
                Left = 0
                Top = 0
                Width = 497
                Height = 149
                Align = alLeft
                BevelOuter = bvNone
                TabOrder = 1
                object Panel19: TPanel
                  Left = 0
                  Top = 0
                  Width = 497
                  Height = 17
                  Align = alTop
                  Alignment = taLeftJustify
                  BevelOuter = bvNone
                  Caption = ' Autorizações da etapa selecionada'
                  Color = clGray
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWhite
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                  TabOrder = 0
                end
                object GrdAut: TwwDBGrid
                  Left = 0
                  Top = 17
                  Width = 497
                  Height = 132
                  Selected.Strings = (
                    'DATAAUTORIZACAO'#9'18'#9'Data de Autorização'#9'F'
                    'NOMEUSUARIO'#9'25'#9'Usuário'#9'F'
                    'STATUS'#9'23'#9'Status'#9'F')
                  IniAttributes.Delimiter = ';;'
                  TitleColor = clBtnFace
                  FixedCols = 0
                  ShowHorzScrollBar = True
                  Align = alClient
                  DataSource = dsAut
                  Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
              end
            end
          end
          object Panel21: TPanel
            Left = 5
            Top = 5
            Width = 767
            Height = 42
            Align = alTop
            BevelOuter = bvLowered
            TabOrder = 1
            object Label9: TLabel
              Left = 4
              Top = 2
              Width = 53
              Height = 13
              Caption = 'Processo'
            end
            object Label13: TLabel
              Left = 121
              Top = 2
              Width = 58
              Height = 13
              Caption = 'Descrição'
            end
            object Label17: TLabel
              Left = 533
              Top = 2
              Width = 65
              Height = 13
              Caption = 'Data Início'
            end
            object Label18: TLabel
              Left = 662
              Top = 2
              Width = 77
              Height = 13
              Caption = 'Fim (previsto)'
            end
            object wwDBEdit4: TwwDBEdit
              Left = 4
              Top = 16
              Width = 100
              Height = 21
              Color = 15658734
              DataField = 'IDPROCESSO'
              DataSource = dtsRAD
              ReadOnly = True
              TabOrder = 0
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object wwDBEdit5: TwwDBEdit
              Left = 120
              Top = 16
              Width = 393
              Height = 21
              Color = 15658734
              DataField = 'NOME'
              DataSource = dtsRAD
              ReadOnly = True
              TabOrder = 1
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object DBEdit9: TDBEdit
              Left = 662
              Top = 16
              Width = 113
              Height = 21
              Color = 15658734
              DataField = 'DATAFIMPREV'
              DataSource = dtsRAD
              MaxLength = 16
              ReadOnly = True
              TabOrder = 2
            end
            object wwDBEdit6: TwwDBEdit
              Left = 532
              Top = 16
              Width = 113
              Height = 21
              Color = 15658734
              DataField = 'DATAINIETAPA'
              DataSource = dtsRAD
              MaxLength = 16
              ReadOnly = True
              TabOrder = 3
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
          end
        end
      end
    end
    object Panel11: TPanel
      Left = 256
      Top = 2
      Width = 530
      Height = 18
      Anchors = [akTop, akRight]
      BevelOuter = bvNone
      TabOrder = 1
      object DBNavigator1: TDBNavigator
        Left = 547
        Top = 0
        Width = 66
        Height = 18
        DataSource = dtsRAD
        VisibleButtons = [nbPrior, nbNext]
        Flat = True
        Hints.Strings = (
          'First record'
          'Registro Anrterior'
          'Próximo Registro'
          'Last record'
          'Insert record'
          'Delete record'
          'Edit record'
          'Post edit'
          'Cancel edit'
          'Refresh data')
        ParentShowHint = False
        ConfirmDelete = False
        ShowHint = True
        TabOrder = 0
      end
      object DBNavigator2: TDBNavigator
        Left = 490
        Top = 0
        Width = 40
        Height = 18
        DataSource = dtsRAD
        VisibleButtons = [nbPrior, nbNext]
        Align = alRight
        Flat = True
        TabOrder = 1
      end
    end
  end
  inherited Dock971: TDock97
    Top = 492
    Width = 787
    inherited tb97Fundo: TToolbar97
      Left = 615
      DockPos = 689
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited ToolbarSep971: TToolbarSep97
        Left = 240
        SizeHorz = 5
      end
      object ToolbarSep972: TToolbarSep97 [1]
        Left = 365
        Top = 0
        Blank = True
        SizeHorz = 15
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 120
        Caption = '&Executar Etapa'
        Default = False
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 245
        Width = 120
        Caption = '&Recusar RAD'
        OnClick = bbtnCancelarClick
      end
      object BitBtn1: TBitBtn
        Left = 120
        Top = 0
        Width = 120
        Height = 33
        Caption = '&Voltar Etapa'
        ModalResult = 1
        TabOrder = 2
        OnClick = BitBtn1Click
        Glyph.Data = {
          36060000424D3606000000000000360000002800000020000000100000000100
          1800000000000006000000000000000000000000000000000000C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0FFFFFFFFFFFFFF
          FFFFFFFFFFFFFFFFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0000000000000000000000000000000C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0FFFFFFFFFFFFC0C0C080808080
          8080808080808080808080FFFFFFC0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C000000000000093C9FF93C9FF93C9FF93C9FF93C9FF000000000000C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0FFFFFFC0C0C0808080808080C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0808080808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          00000093C9FF93C9FF93C9FF93C9FF93C9FF93C9FF93C9FF93C9FF93C9FF8080
          80C0C0C0C0C0C0C0C0C0C0C0C0FFFFFFC0C0C0808080C0C0C0C0C0C0C0C0C0C0
          C0C0FFFFFFFFFFFFFFFFFFC0C0C0C0C0C0808080C0C0C0C0C0C0C0C0C0000000
          93C9FF93C9FF93C9FF93C9FF93C9FF93C9FF80808000000080808093C9FFFFFF
          FF808080C0C0C0C0C0C0C0C0C0FFFFFF808080C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0FFFFFF808080808080808080C0C0C0FFFFFF808080C0C0C0C0C0C0000000
          93C9FF93C9FF93C9FF93C9FF93C9FF93C9FF00000000000000000093C9FFFFFF
          FF808080C0C0C0C0C0C0FFFFFFC0C0C0808080C0C0C0FFFFFFC0C0C0C0C0C0C0
          C0C0FFFFFF808080808080808080C0C0C0C0C0C0808080C0C0C000000093C9FF
          93C9FF93C9FF00000093C9FF93C9FF93C9FF00000000000000000093C9FF93C9
          FFFFFFFF808080C0C0C0FFFFFF808080C0C0C0C0C0C0FFFFFF808080C0C0C0C0
          C0C0FFFFFF808080808080808080C0C0C0C0C0C0FFFFFF80808000000093C9FF
          93C9FF93C9FF00000000000093C9FF80808000000000000000000093C9FF93C9
          FFFFFFFF808080C0C0C0FFFFFF808080C0C0C0C0C0C0FFFFFF808080808080C0
          C0C0808080808080808080808080C0C0C0C0C0C0FFFFFF80808000000093C9FF
          93C9FF93C9FF00000000000000000000000000000000000093C9FF93C9FF93C9
          FFFFFFFF808080C0C0C0FFFFFF808080C0C0C0C0C0C0FFFFFF80808080808080
          8080808080808080808080C0C0C0C0C0C0C0C0C0FFFFFF80808000000093C9FF
          93C9FF93C9FF00000000000000000000000080808093C9FF93C9FF93C9FF93C9
          FFFFFFFF808080C0C0C0FFFFFF808080C0C0C0C0C0C0FFFFFF80808080808080
          8080808080808080C0C0C0C0C0C0C0C0C0C0C0C0FFFFFF80808000000093C9FF
          93C9FF93C9FF00000000000000000000000000000093C9FF93C9FF93C9FF93C9
          FFFFFFFF808080C0C0C0C0C0C0808080C0C0C0C0C0C0FFFFFF80808080808080
          8080808080808080C0C0C0C0C0C0C0C0C0FFFFFFC0C0C0808080C0C0C0000000
          93C9FF93C9FF80808000000000000000000000000000000093C9FF93C9FFFFFF
          FF808080C0C0C0C0C0C0C0C0C0FFFFFF808080C0C0C0C0C0C080808080808080
          8080808080808080808080C0C0C0C0C0C0FFFFFF808080C0C0C0C0C0C0000000
          93C9FF93C9FF93C9FF93C9FF93C9FF93C9FF93C9FF93C9FF93C9FF93C9FFFFFF
          FF808080C0C0C0C0C0C0C0C0C0C0C0C0808080C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0FFFFFFC0C0C0808080C0C0C0C0C0C0C0C0C0
          00000093C9FF93C9FF93C9FF93C9FF93C9FF93C9FF93C9FFFFFFFFFFFFFF8080
          80C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0808080FFFFFFC0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0FFFFFFFFFFFFC0C0C0808080C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0808080808080FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF808080808080C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0808080808080FFFFFFFF
          FFFFFFFFFFFFFFFFC0C0C0808080808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0808080808080808080808080808080C0C0C0C0C0C0C0C0
          C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0C080808080
          8080808080808080808080C0C0C0C0C0C0C0C0C0C0C0C0C0C0C0}
        NumGlyphs = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 65507
    Top = 65507
    TargetsData = (
      1
      2
      (
        'TDBMemo'
        'Text'
        0)
      (
        'TMemo'
        'Text'
        0))
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      'DISTINCT'
      '   RADINSTPROCESSO.IDPROCESSO,'
      '   RADINSTPROCESSO.DATAINIPROCESSO,'
      '   RADINSTPROCESSO.DATAFIMPREV,'
      '   RADTIPOPROCESSO.NOME,'
      '   RADINSTPROCESSO.VLRPROC,'
      '   RADINSTPROCESSO.OBS,'
      '   RADTIPOETAPA.NOME NOMEETAPA,'
      '   RADINSTETAPA.DATAINIETAPA,'
      '   DOCUMENTO.DATAPROGRAMADA, '
      '   PESSOA.NOME AS FORNECEDOR, '
      '   USUARIOSISTEMA.NOMEUSUARIO '
      'FROM'
      '   RADGRPRESPON,'
      '   RADRESPONXGRP,'
      '   RADGRAUTXGRRESPON,'
      '   RADGRUPOAUTORIZA,'
      '   RADETAPAXGRPRESP,'
      '   RADINSTETAPA,'
      '   RADINSTPROCESSO,'
      '   RADTIPOPROCESSO,'
      '   RADTIPOETAPA,'
      '   RADAUTORIZACAO,'
      '   RADTIPOETAPAXPROC,'
      '   PROCESSO,'
      '   DOCUMENTO,'
      '   PESSOA,'
      '   USUARIOSISTEMA'
      'WHERE'
      
        '   ( RADGRPRESPON.IDGRPRESPON       = RADRESPONXGRP.IDGRPRESPON ' +
        ') AND'
      
        '   ( RADGRPRESPON.IDGRPRESPON       = RADGRAUTXGRRESPON.IDGRPRES' +
        'PON ) AND'
      
        '   ( RADGRAUTXGRRESPON.IDGRUPOAUTORIZA = RADGRUPOAUTORIZA.IDGRUP' +
        'OAUTORIZA ) AND'
      
        '   ( RADGRUPOAUTORIZA.IDGRUPOAUTORIZA = RADETAPAXGRPRESP.IDGRUPO' +
        'AUTORIZA ) AND'
      
        '   ( RADETAPAXGRPRESP.IDTIPOETAPA = RADINSTETAPA.IDTIPOETAPA ) A' +
        'ND'
      
        '   ( RADETAPAXGRPRESP.IDTIPOPROCESSO = RADINSTPROCESSO.IDTIPOPRO' +
        'CESSO ) AND'
      
        '   ( RADINSTPROCESSO.IDTIPOPROCESSO = RADTIPOPROCESSO.IDTIPOPROC' +
        'ESSO ) AND'
      '   ( RADINSTPROCESSO.IDPROCESSO = RADINSTETAPA.IDPROCESSO ) AND'
      '   ( RADINSTETAPA.IDTIPOETAPA = RADTIPOETAPA.IDTIPOETAPA ) AND'
      
        '   ( RADINSTETAPA.IDPROCESSO = RADAUTORIZACAO.IDPROCESSO(+) ) AN' +
        'D'
      '   ( RADINSTETAPA.IDETAPA = RADAUTORIZACAO.IDETAPA(+) ) AND'
      
        '   ( RADTIPOETAPAXPROC.IDTIPOPROCESSO = RADTIPOPROCESSO.IDTIPOPR' +
        'OCESSO ) AND'
      
        '   ( RADTIPOETAPAXPROC.IDTIPOETAPA = RADTIPOETAPA.IDTIPOETAPA ) ' +
        'AND'
      '   ( RADINSTPROCESSO.IDPROCESSO = PROCESSO.IDPROCESSO(+) ) AND'
      '   ( RADINSTETAPA.DATAFIMETAPA IS NULL ) AND'
      
        '   ( (RADGRAUTXGRRESPON.CODTIPDOC = RADINSTPROCESSO.CODTIPDOC) O' +
        'R (RADGRAUTXGRRESPON.CODTIPDOC IS NULL AND RADINSTPROCESSO.CODTI' +
        'PDOC IS NOT NULL) OR (RADGRAUTXGRRESPON.CODTIPDOC IS NULL AND RA' +
        'DINSTPROCESSO.CODTIPDOC IS NULL) ) AND'
      
        '   ( (RADGRAUTXGRRESPON.UNIDNEGOC = RADINSTPROCESSO.UNIDNEGOC) O' +
        'R (RADGRAUTXGRRESPON.UNIDNEGOC IS NULL AND RADINSTPROCESSO.UNIDN' +
        'EGOC IS NOT NULL) OR (RADGRAUTXGRRESPON.UNIDNEGOC IS NULL AND RA' +
        'DINSTPROCESSO.UNIDNEGOC IS NULL) ) AND'
      
        '   ( (RADGRAUTXGRRESPON.CODCENTROCUSTO = RADINSTPROCESSO.CODCENT' +
        'ROCUSTO) OR (RADGRAUTXGRRESPON.CODCENTROCUSTO IS NULL AND RADINS' +
        'TPROCESSO.CODCENTROCUSTO IS NOT NULL) OR (RADGRAUTXGRRESPON.CODC' +
        'ENTROCUSTO IS NULL AND RADINSTPROCESSO.CODCENTROCUSTO IS NULL) )' +
        ' AND'
      
        '   ( (RADGRAUTXGRRESPON.CODCENTRORESPON = RADINSTPROCESSO.CODCEN' +
        'TRORESPON) OR (RADGRAUTXGRRESPON.CODCENTRORESPON IS NULL AND RAD' +
        'INSTPROCESSO.CODCENTRORESPON IS NOT NULL) OR (RADGRAUTXGRRESPON.' +
        'CODCENTRORESPON IS NULL AND RADINSTPROCESSO.CODCENTRORESPON IS N' +
        'ULL) ) AND'
      
        '   ( (RADGRAUTXGRRESPON.VLRINICIAL <= RADINSTPROCESSO.VLRPROC ) ' +
        'OR ( RADGRAUTXGRRESPON.VLRINICIAL = 0 ) OR ( RADGRAUTXGRRESPON.V' +
        'LRINICIAL IS NULL ) ) AND'
      
        '   ( (RADGRAUTXGRRESPON.VLRFINAL   >= RADINSTPROCESSO.VLRPROC ) ' +
        'OR ( RADGRAUTXGRRESPON.VLRFINAL = 0 ) OR ( RADGRAUTXGRRESPON.VLR' +
        'FINAL IS NULL ) ) AND'
      '   ( RADINSTPROCESSO.FLGOK = '#39'N'#39' ) AND'
      '   ( RADINSTPROCESSO.DATAFIMPROCESSO IS NULL ) AND'
      '   ( RADTIPOETAPAXPROC.IDMODULO = 3 ) AND'
      '   ( RADRESPONXGRP.IDUSUARIO = 3 ) AND '
      '   ( RADINSTPROCESSO.IDPROCESSO = DOCUMENTO.IDPROCESSO ) AND'
      '   ( DOCUMENTO.IDFORCLI = PESSOA.IDPESSOA ) AND'
      '   ( RADINSTPROCESSO.IDUSUARIO = USUARIOSISTEMA.IDUSUARIO  )'
      'ORDER BY RADINSTPROCESSO.IDPROCESSO ASC'
      ' '
      ' '
      ' '
      ' '
      ' ')
    ClientDataSet = cdsRad
    Left = 21
    Top = 193
  end
  object cdsRad: TCMClientDataSet
    Active = True
    Aggregates = <>
    FieldDefs = <
      item
        Name = 'IDPROCESSO'
        Attributes = [faUnNamed]
        DataType = ftFloat
      end
      item
        Name = 'DATAINIPROCESSO'
        Attributes = [faUnNamed]
        DataType = ftDateTime
      end
      item
        Name = 'DATAFIMPREV'
        Attributes = [faUnNamed]
        DataType = ftDateTime
      end
      item
        Name = 'NOME'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 36
      end
      item
        Name = 'VLRPROC'
        Attributes = [faUnNamed]
        DataType = ftFloat
      end
      item
        Name = 'OBS'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 26
      end
      item
        Name = 'NOMEETAPA'
        Attributes = [faUnNamed, faFixed]
        DataType = ftString
        Size = 18
      end
      item
        Name = 'DATAINIETAPA'
        Attributes = [faUnNamed]
        DataType = ftDateTime
      end
      item
        Name = 'DATAPROGRAMADA'
        Attributes = [faUnNamed]
        DataType = ftDateTime
      end
      item
        Name = 'FORNECEDOR'
        Attributes = [faUnNamed]
        DataType = ftString
        Size = 39
      end
      item
        Name = 'NOMEUSUARIO'
        Attributes = [faUnNamed, faFixed]
        DataType = ftString
        Size = 20
      end>
    IndexDefs = <>
    Params = <>
    StoreDefs = True
    AfterOpen = cdsRadAfterOpen
    Left = 53
    Top = 193
    Data = {
      C00900009619E0BD01000000180000000B000D000000030000005E010A494450
      524F434553534F08000400100000000F44415441494E4950524F434553534F08
      000800100000000B4441544146494D505245560800080010000000044E4F4D45
      010049001000010005574944544802000200240007564C5250524F4308000400
      10000000034F42530100490010000100055749445448020002001A00094E4F4D
      45455441504101004900100002000753554254595045020049000A0046697865
      6443686172000557494454480200020012000C44415441494E49455441504108
      000800100000000E4441544150524F4752414D41444108000800100000000A46
      4F524E454345444F5201004900100001000557494454480200020027000B4E4F
      4D455553554152494F01004900100002000753554254595045020049000A0046
      6978656443686172000557494454480200020014000100044C43494402000100
      0908000000000000000080D2DF4000009ED939C8CC420000CC6C3CC8CC422441
      55544F52495A4143414F20444520504147414D454E544F202D20444F43554D45
      4E544F000000000070A74019446F63756D656E746F204EBA3A20353436353435
      34202D2044124155544F52495A4120504147414D454E544F00009ED939C8CC42
      00009ED939C8CC421C434D20534F4C55434F455320494E464F524D4154494341
      204C5444410D4C554349414E412E414C564553000000000000000000D5DF4000
      009ED939C8CC420000CC6C3CC8CC42244155544F52495A4143414F2044452050
      4147414D454E544F202D20444F43554D454E544F000000000070A7401A446F63
      756D656E746F204EBA3A203338383937383937202D2065124155544F52495A41
      20504147414D454E544F00009ED939C8CC4200009ED939C8CC421C434D20534F
      4C55434F455320494E464F524D4154494341204C5444410B4A4F414E412E5349
      4C5641000000000000000040D6DF400000CC6C3CC8CC420000FAFF3EC8CC4224
      4155544F52495A4143414F20444520504147414D454E544F202D20444F43554D
      454E544F0000000000A0844016446F63756D656E746F204EBA3A20353030202D
      203530124155544F52495A4120504147414D454E544F0000CC6C3CC8CC420000
      CC6C3CC8CC421C434D20534F4C55434F455320494E464F524D4154494341204C
      5444410B4D41524349412E4C494D41000000000000000040DEDF400000FAFF3E
      C8CC42000084B946C8CC42244155544F52495A4143414F20444520504147414D
      454E544F202D20444F43554D454E544F000000000088B34018446F63756D656E
      746F204EBA3A2034353435343534202D20124155544F52495A4120504147414D
      454E544F0000FAFF3EC8CC420000FAFF3EC8CC4221414E5449444941204A554E
      43414C20444F532053414E544F53205249424549524F0B4D41524349412E4C49
      4D410000000000000000C0DEDF40000084B946C8CC420000B24C49C8CC422441
      55544F52495A4143414F20444520504147414D454E544F202D20444F43554D45
      4E544F333333333333234017446F63756D656E746F204EBA3A20323531353733
      202D20124155544F52495A4120504147414D454E544F000084B946C8CC420000
      84B946C8CC421D53454352455441524941204441205245434549544120464544
      4552414C09414E412E4D41524941000000000000000000DFDF40000084B946C8
      CC420000B24C49C8CC42244155544F52495A4143414F20444520504147414D45
      4E544F202D20444F43554D454E544FA4703D0AD78B674017446F63756D656E74
      6F204EBA3A20323531353739202D20124155544F52495A4120504147414D454E
      544F000084B946C8CC42000084B946C8CC421D53454352455441524941204441
      2052454345495441204645444552414C0B4D41524349412E4C494D4100000000
      0000000040DFDF40000084B946C8CC420000B24C49C8CC42244155544F52495A
      4143414F20444520504147414D454E544F202D20444F43554D454E544F000000
      000000694017446F63756D656E746F204EBA3A20323531353832202D20124155
      544F52495A4120504147414D454E544F000084B946C8CC42000084B946C8CC42
      1D534543524554415249412044412052454345495441204645444552414C0B4A
      4F414E412E53494C5641000000000000000080DFDF400000F4525BC8CC420000
      22E65DC8CC4213524550524F4752414D41C7C34F204445204150C3F5285C8FDC
      88401A446F63756D656E746F204EBA3A20313037353531383739202D20124155
      544F52495A4120504147414D454E544F0000F4525BC8CC420000CCD5F2C6CC42
      0D41424E20414D524F205245414C09414E412E4D415249410000000000000000
      C0DFDF400000F4525BC8CC42000022E65DC8CC4213524550524F4752414D41C7
      C34F2044452041503D0AD7A370B576401A446F63756D656E746F204EBA3A2031
      3037353631343832202D20124155544F52495A4120504147414D454E544F0000
      F4525BC8CC420000CCD5F2C6CC420742414E455350410D43415449412E504544
      524F5341000000000000000080E3DF400000507960C8CC4200007E0C63C8CC42
      244155544F52495A4143414F20444520504147414D454E544F202D20444F4355
      4D454E544F52B81E85EB51D83F14446F63756D656E746F204EBA3A2037333220
      2D20124155544F52495A4120504147414D454E544F0000507960C8CC420000C0
      1275C8CC420D41424E20414D524F205245414C0D434C41554449412E534F555A
      41000000000000000080E4DF400000507960C8CC4200007E0C63C8CC42244155
      544F52495A4143414F20444520504147414D454E544F202D20444F43554D454E
      544F666666666666FE3F14446F63756D656E746F204EBA3A20373333202D2012
      4155544F52495A4120504147414D454E544F0000507960C8CC420000C01275C8
      CC420D41424E20414D524F205245414C0D434C41554449412E534F555A410000
      000000000000C0E4DF400000507960C8CC4200007E0C63C8CC4213524550524F
      4752414D41C7C34F20444520415000000000A0FDFE4017446F63756D656E746F
      204EBA3A20323531373330202D20124155544F52495A4120504147414D454E54
      4F0000507960C8CC420000507960C8CC421D4153534F43494143414F20444F53
      2041504F53454E5441444F532056520B4D41524349412E4C494D410000000000
      00000000E5DF400000507960C8CC4200007E0C63C8CC4213524550524F475241
      4D41C7C34F2044452041500000000000B4B94017446F63756D656E746F204EBA
      3A20323531373331202D20124155544F52495A4120504147414D454E544F0000
      507960C8CC420000507960C8CC422753494E44494341544F20444F53204D4554
      414C55524749434F532044452056205245444F4E44410D43415449412E504544
      524F5341}
    object cdsRadIDPROCESSO: TFloatField
      DisplayLabel = 'Processo'
      DisplayWidth = 7
      FieldName = 'IDPROCESSO'
    end
    object cdsRadNOME: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 35
      FieldName = 'NOME'
      Size = 60
    end
    object cdsRadDATAINIPROCESSO: TDateTimeField
      DisplayLabel = 'Início'
      DisplayWidth = 16
      FieldName = 'DATAINIPROCESSO'
      DisplayFormat = 'dd/mm/yyyy hh:nn'
      EditMask = 'dd/mm/yyyy hh:nn'
    end
    object cdsRadDATAFIMPREV: TDateTimeField
      DisplayLabel = 'Fim (previsto)'
      DisplayWidth = 16
      FieldName = 'DATAFIMPREV'
      DisplayFormat = 'dd/mm/yyyy hh:nn'
      EditMask = 'dd/mm/yyyy hh:nn'
    end
    object cdsRadVLRPROC: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 10
      FieldName = 'VLRPROC'
      DisplayFormat = '#,##0.00'
      EditFormat = '#,##0.00'
    end
    object cdsRadNOMEUSUARIO: TStringField
      DisplayLabel = 'Usuário'
      DisplayWidth = 20
      FieldName = 'NOMEUSUARIO'
      FixedChar = True
    end
    object cdsRadOBS: TStringField
      DisplayLabel = 'Observação'
      DisplayWidth = 35
      FieldName = 'OBS'
      Size = 200
    end
    object cdsRadNOMEETAPA: TStringField
      DisplayLabel = 'Etapa'
      DisplayWidth = 35
      FieldName = 'NOMEETAPA'
      Size = 60
    end
    object cdsRadDATAINIETAPA: TDateTimeField
      DisplayLabel = 'Início da Etapa'
      DisplayWidth = 16
      FieldName = 'DATAINIETAPA'
      DisplayFormat = 'dd/mm/yyyy hh:nn'
      EditMask = 'dd/mm/yyyy hh:nn'
    end
    object cdsRadDATAPROGRAMADA: TDateTimeField
      DisplayLabel = 'Data Programada'
      DisplayWidth = 14
      FieldName = 'DATAPROGRAMADA'
    end
    object cdsRadFORNECEDOR: TStringField
      DisplayLabel = 'Fornecedor'
      DisplayWidth = 35
      FieldName = 'FORNECEDOR'
      Size = 60
    end
  end
  object dtsRAD: TwwDataSource
    DataSet = cdsRad
    Left = 85
    Top = 193
  end
  object SqlObjRad: TCMSqlParams
    SQL.Strings = (
      'SELECT OBJ.NOMEOBJETO, ORDEM'
      '  FROM RADOBJETOXETAPA OXE,'
      '       RADOBJETO OBJ'
      ' WHERE ( OXE.IDTIPOPROCESSO = :pIDTPPROC )'
      '   AND ( OXE.IDTIPOETAPA    = :pIDTPETAPA )'
      '   AND ( OBJ.IDMODULO       = :pIDMODULO )'
      '   AND ( OXE.IDOBJETO       = OBJ.IDOBJETO )'
      ' ORDER BY ORDEM')
    ClientDataSet = CdsObjRad
    Left = 17
    Top = 225
  end
  object CdsObjRad: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 49
    Top = 228
  end
  object DsImagem: TwwDataSource
    AutoEdit = False
    DataSet = CdsImagem
    Left = 725
    Top = 98
  end
  object CdsImagem: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 669
    Top = 98
  end
  object SqlImagem: TCMSqlParams
    SQL.Strings = (
      'SELECT I.IDIMAGEM, I.IMAGEM, I. DESCRIMAGEM'
      '  FROM RADINSTPROCESSO R, IMAGENS I'
      ' WHERE R.IDPROCESSO = :pIDPROCESSO'
      '   AND I.IDIMAGEM = R.IDIMAGEM')
    ClientDataSet = CdsImagem
    Left = 629
    Top = 98
  end
  object CdsProc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 601
    Top = 98
  end
  object CdsVerifUsr: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 609
    Top = 42
  end
  object SqlVerifUsr: TCMSqlParams
    SQL.Strings = (
      'SELECT TP.IDTIPOPROCESSO'
      '  FROM RADTIPOPROCESSO TP,'
      '       RADRESPONXGRP GRP,'
      '       RADGRAUTXGRRESPON AUT,'
      '       RADRESPONXGRP GRPAUT'
      ' WHERE ( TP.IDTIPOPROCESSO = :pIDTIPOPROCESSO )'
      
        '   AND ( ( GRP.IDUSUARIO = :pIDUSUARIO ) OR ( GRPAUT.IDUSUARIO =' +
        ' :pIDUSUARIO ) )'
      '   AND ( TP.IDGRPGESTOR = GRP.IDGRPRESPON )'
      '   AND ( TP.IDGRPCONSULTA = AUT.IDGRUPOAUTORIZA )'
      '   AND ( AUT.IDGRPRESPON = GRPAUT.IDGRPRESPON )'
      '')
    ClientDataSet = CdsVerifUsr
    Left = 437
    Top = 42
  end
  object SqlProc: TCMSqlParams
    SQL.Strings = (
      
        'SELECT IDPROCESSO, IDTIPOPROCESSO, UNIDNEGOC, IDPESSOA, IDEMPRES' +
        'A, VLRPROC,'
      
        '       CODCENTROCUSTO, IDUSUARIO, CODGRUPOPROD, CODCENTRORESPON,' +
        ' FLGOK,'
      
        '       DATAINIPROCESSO, DATAFIMPROCESSO, OBS, DATAFIMPREV, IDPES' +
        'SRESP, IDIMAGEM'
      '  FROM RADINSTPROCESSO'
      ' WHERE IDPROCESSO = :pIDPROCESSO')
    ClientDataSet = CdsProc
    Left = 437
    Top = 98
  end
  object dsEtapa: TwwDataSource
    AutoEdit = False
    DataSet = CdsEtapa
    Left = 393
    Top = 354
  end
  object dsAut: TwwDataSource
    AutoEdit = False
    DataSet = CdsAut
    Left = 345
    Top = 442
  end
  object CdsAut: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 297
    Top = 442
    Data = {
      870100009619E0BD010000001800000005000400000003000000D50007494445
      5441504108000400000000000F444154414155544F52495A4143414F08000800
      000000000B4E4F4D455553554152494F01004900000002000753554254595045
      020049000A004669786564436861720005574944544802000200140006535441
      5455530100490000000100055749445448020002000A000B4F42534155544F52
      495A4104004B0000000200075355425459504502004900050054657874000557
      4944544802000200F4010100044C434944040001000908000000000000000000
      A060FD40000022E65DC8CC4202434D0A4155544F52495A41444F020000004F4B
      00000000000000B060FD40000022E65DC8CC4207434230303439300945584543
      555441444F0A0000005245544F524E414E444F00000000000000D060FD400000
      22E65DC8CC4202434D0A4155544F52495A41444F020000004F4B000000000000
      00E060FD40000022E65DC8CC42074342303034393008524543555341444F0900
      0000524550524F5641444F}
    object CdsAutIDETAPA: TFloatField
      FieldName = 'IDETAPA'
    end
    object CdsAutDATAAUTORIZACAO: TDateTimeField
      FieldName = 'DATAAUTORIZACAO'
      DisplayFormat = 'dd/mm/yyyy hh:nn'
      EditMask = 'dd/mm/yyyy hh:nn'
    end
    object CdsAutNOMEUSUARIO: TStringField
      FieldName = 'NOMEUSUARIO'
      FixedChar = True
    end
    object CdsAutSTATUS: TStringField
      FieldName = 'STATUS'
      Size = 10
    end
    object CdsAutOBSAUTORIZA: TMemoField
      FieldName = 'OBSAUTORIZA'
      BlobType = ftMemo
      Size = 500
    end
  end
  object CdsEtapa: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    AfterScroll = CdsEtapaAfterScroll
    Left = 361
    Top = 354
    Data = {
      880100009619E0BD010000001800000005000400000003000000AC0007494445
      5441504108000400000000000C4441544146494D455441504108000800000000
      000C44415441494E49455441504108000800000000000B4441544146494D5052
      45560800080000000000084E4F4D455441504101004900000001000557494454
      48020002003C0002000D44454641554C545F4F52444552020082000200000003
      000100044C434944040001000908000000000000000000A060FD40000022E65D
      C8CC42000022E65DC8CC420000507960C8CC42124155544F52495A4120504147
      414D454E544F00000000000000B060FD40000022E65DC8CC42000022E65DC8CC
      420000507960C8CC42144155544F52495A4120434F4E5452415441C7C34F0000
      0000000000D060FD40000022E65DC8CC42000022E65DC8CC420000507960C8CC
      42124155544F52495A4120504147414D454E544F00000000000000E060FD4000
      0022E65DC8CC42000022E65DC8CC420000507960C8CC42144155544F52495A41
      20434F4E5452415441C7C34F}
    object CdsEtapaNOMETAPA: TStringField
      DisplayLabel = 'Etapa'
      DisplayWidth = 53
      FieldName = 'NOMETAPA'
      Origin = 'BASEDADOS.RADTIPOETAPA.NOME'
      Size = 60
    end
    object CdsEtapaDATAINIETAPA: TDateTimeField
      DisplayLabel = 'Início'
      DisplayWidth = 17
      FieldName = 'DATAINIETAPA'
      Origin = 'BASEDADOS.RADINSTETAPA.DATAINIETAPA'
      DisplayFormat = 'dd/mm/yyyy hh:nn'
      EditMask = 'dd/mm/yyyy hh:nn'
    end
    object CdsEtapaDATAFIMPREV: TDateTimeField
      DisplayLabel = 'Término (Previsto)'
      DisplayWidth = 17
      FieldName = 'DATAFIMPREV'
      Origin = 'BASEDADOS.RADINSTETAPA.DATAFIMPREV'
      DisplayFormat = 'dd/mm/yyyy hh:nn'
      EditMask = 'dd/mm/yyyy hh:nn'
    end
    object CdsEtapaDATAFIMETAPA: TDateTimeField
      DisplayLabel = 'Término (Efetivo)'
      DisplayWidth = 17
      FieldName = 'DATAFIMETAPA'
      Origin = 'BASEDADOS.RADINSTETAPA.DATAFIMETAPA'
      DisplayFormat = 'dd/mm/yyyy hh:nn'
      EditMask = 'dd/mm/yyyy hh:nn'
    end
    object CdsEtapaIDETAPA: TFloatField
      DisplayLabel = 'Id. Etapa'
      DisplayWidth = 10
      FieldName = 'IDETAPA'
      Origin = 'BASEDADOS.RADINSTETAPA.IDETAPA'
      Visible = False
    end
  end
  object SqlEtapa: TCMSqlParams
    SQL.Strings = (
      'SELECT IE.IDETAPA,'
      '       IE.DATAFIMETAPA,'
      '       IE.DATAINIETAPA,'
      '       IE.DATAFIMPREV,'
      '       TE.NOME AS NOMETAPA'
      '  FROM RADTIPOETAPA TE,'
      '       RADINSTETAPA IE'
      ' WHERE ( IE.IDPROCESSO = 32648 )'
      '   AND ( IE.IDTIPOETAPA = TE.IDTIPOETAPA )'
      ' ORDER BY IE.DATAINIETAPA, IE.IDETAPA')
    ClientDataSet = CdsEtapa
    Left = 329
    Top = 354
  end
  object SqlAut: TCMSqlParams
    SQL.Strings = (
      'SELECT AUT.IDETAPA, '
      '       AUT.DATAAUTORIZACAO,'
      '       USU.NOMEUSUARIO,'
      
        '       DECODE( AUT.FLGSTATUS, '#39'R'#39', '#39'RECUSADO'#39', DECODE( AUT.FLGST' +
        'ATUS, '#39'S'#39', '#39'AUTORIZADO'#39', '#39'EXECUTADO'#39' ) ) AS STATUS,'
      '       AUT.OBSAUTORIZA'
      '  FROM RADAUTORIZACAO AUT,'
      '       RADINSTETAPA IE,'
      '       USUARIOSISTEMA USU'
      ' WHERE'
      '       ( AUT.IDPROCESSO = 32648 )'
      '   AND ( AUT.IDUSUARIO    =  USU.IDUSUARIO )'
      '   AND ( AUT.IDPROCESSO = IE.IDPROCESSO )'
      '   AND ( AUT.IDETAPA = IE.IDETAPA )')
    ClientDataSet = CdsAut
    Left = 249
    Top = 442
  end
end
