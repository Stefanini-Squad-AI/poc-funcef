inherited frmReajusteBenef: TfrmReajusteBenef
  Left = 801
  Top = 108
  Caption = 'Reajuste Benefícios'
  ClientHeight = 582
  ClientWidth = 726
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 726
    Height = 541
    object pgcDadoBenef: TPageControl
      Left = 1
      Top = 1
      Width = 724
      Height = 539
      ActivePage = tsListaMatricula
      Align = alClient
      TabOrder = 0
      object tsDadosBenef: TTabSheet
        Caption = 'Dados para Reajuste'
        object lblPlanoPrevidenciario: TLabel
          Left = 7
          Top = 15
          Width = 118
          Height = 13
          Caption = 'Plano Previdenciário'
        end
        object lblPeriodoIndice: TLabel
          Left = 7
          Top = 71
          Width = 103
          Height = 13
          Caption = 'Período do Índice'
        end
        object lblFontePagadora: TLabel
          Left = 7
          Top = 167
          Width = 244
          Height = 13
          Caption = 'Selecionar Fonte Pagadora dos Benefícios'
        end
        object lblPercentualFRB: TLabel
          Left = 7
          Top = 143
          Width = 90
          Height = 13
          Caption = 'Percentual FRB'
        end
        object lblPeriodoRecal: TLabel
          Left = 7
          Top = 95
          Width = 125
          Height = 13
          Caption = 'Período do Recálculo'
        end
        object lblPeriodoAcerto: TLabel
          Left = 7
          Top = 119
          Width = 105
          Height = 13
          Caption = 'Período do Acerto'
        end
        object Label7: TLabel
          Left = 7
          Top = 207
          Width = 98
          Height = 13
          Caption = 'Filtrar Benefícios'
        end
        object lblObservacao: TLabel
          Left = 7
          Top = 398
          Width = 73
          Height = 13
          Caption = 'Observação:'
        end
        object Label15: TLabel
          Left = 240
          Top = 74
          Width = 8
          Height = 13
          Caption = 'a'
        end
        object Label16: TLabel
          Left = 240
          Top = 100
          Width = 8
          Height = 13
          Caption = 'a'
        end
        object lblPeriodo: TLabel
          Left = 240
          Top = 124
          Width = 8
          Height = 13
          Caption = 'a'
        end
        object lblMesCobrancaInss: TLabel
          Left = 7
          Top = 374
          Width = 252
          Height = 13
          Caption = 'Registrar mês cobrança Reembolso do INSS'
        end
        object chkAtualizaBenef: TCheckBox
          Left = 7
          Top = 39
          Width = 193
          Height = 17
          Caption = 'Apenas atualizar o Benefício'
          TabOrder = 1
          OnClick = chkAtualizaBenefClick
        end
        object chkListaMatricula: TCheckBox
          Left = 399
          Top = 15
          Width = 185
          Height = 17
          Caption = 'Indicar Lista de Matrículas'
          TabOrder = 0
          OnClick = chkListaMatriculaClick
        end
        object chkFRB: TCheckBox
          Left = 255
          Top = 144
          Width = 194
          Height = 17
          Caption = 'Utilizar apenas FRB'
          TabOrder = 9
        end
        object GroupBox1: TGroupBox
          Left = 351
          Top = 55
          Width = 153
          Height = 83
          TabOrder = 10
          object lblProcessarBenef: TLabel
            Left = 8
            Top = 11
            Width = 126
            Height = 13
            Caption = 'Processar Benefícios:'
          end
          object ckAtivo: TCheckBox
            Left = 40
            Top = 27
            Width = 97
            Height = 17
            Caption = 'Ativos'
            TabOrder = 0
          end
          object ckEncerrado: TCheckBox
            Left = 40
            Top = 60
            Width = 97
            Height = 17
            Caption = 'Encerrados'
            TabOrder = 2
          end
          object ckRetido: TCheckBox
            Left = 40
            Top = 44
            Width = 97
            Height = 17
            Caption = 'Retidos'
            TabOrder = 1
          end
        end
        object rbFuncef: TRadioButton
          Left = 23
          Top = 183
          Width = 65
          Height = 17
          Caption = 'Funcef'
          Checked = True
          TabOrder = 11
          TabStop = True
          OnClick = rbFuncefClick
        end
        object rbFontePagInss: TRadioButton
          Left = 109
          Top = 183
          Width = 57
          Height = 17
          Caption = 'INSS'
          TabOrder = 12
          OnClick = rbFontePagInssClick
        end
        object mObservacao: TMemo
          Left = 7
          Top = 422
          Width = 697
          Height = 89
          TabOrder = 16
        end
        object cbxTodosBenef: TCheckBox
          Left = 23
          Top = 350
          Width = 209
          Height = 17
          Caption = 'Selecionar todos os benefícios'
          TabOrder = 14
          OnClick = cbxTodosBenefClick
        end
        object ListBeneficios: TCheckListBox
          Left = 8
          Top = 224
          Width = 321
          Height = 121
          ItemHeight = 13
          TabOrder = 17
        end
        object edtIndiceIni: TMaskEdit
          Left = 151
          Top = 70
          Width = 81
          Height = 21
          EditMask = '!9999/99;1;'
          MaxLength = 7
          TabOrder = 2
          Text = '    /  '
        end
        object edtRecalculoIni: TMaskEdit
          Left = 151
          Top = 94
          Width = 81
          Height = 21
          EditMask = '!9999/99;1;'
          MaxLength = 7
          TabOrder = 4
          Text = '    /  '
        end
        object edtPeriodoAcertoInicio: TMaskEdit
          Left = 151
          Top = 118
          Width = 81
          Height = 21
          EditMask = '!9999/99;1;'
          MaxLength = 7
          TabOrder = 6
          Text = '    /  '
        end
        object edtPeriodoAcertoFim: TMaskEdit
          Left = 255
          Top = 118
          Width = 81
          Height = 21
          EditMask = '!9999/99;1;'
          MaxLength = 7
          TabOrder = 7
          Text = '    /  '
        end
        object edtRecalculoFim: TMaskEdit
          Left = 255
          Top = 94
          Width = 81
          Height = 21
          EditMask = '!9999/99;1;'
          MaxLength = 7
          TabOrder = 5
          Text = '    /  '
        end
        object edtIndiceFim: TMaskEdit
          Left = 255
          Top = 70
          Width = 81
          Height = 21
          EditMask = '!9999/99;1;'
          MaxLength = 7
          TabOrder = 3
          Text = '    /  '
        end
        object edtMesCobrancaInss: TMaskEdit
          Left = 271
          Top = 369
          Width = 81
          Height = 21
          EditMask = '!9999/99;1;'
          MaxLength = 7
          TabOrder = 15
          Text = '    /  '
        end
        object grpLote: TGroupBox
          Left = 344
          Top = 195
          Width = 361
          Height = 161
          TabOrder = 13
          object lblLote: TLabel
            Left = 8
            Top = 24
            Width = 26
            Height = 13
            Caption = 'Lote'
          end
          object lblMesFolha: TLabel
            Left = 8
            Top = 51
            Width = 77
            Height = 13
            Caption = 'Mês da Folha'
          end
          object lblMotivacao: TLabel
            Left = 8
            Top = 105
            Width = 39
            Height = 13
            Caption = 'Motivo'
          end
          object lblDataPagamento: TLabel
            Left = 8
            Top = 78
            Width = 113
            Height = 13
            Caption = 'Data de Pagamento'
          end
          object lblAlteradores: TLabel
            Left = 8
            Top = 131
            Width = 65
            Height = 13
            Caption = 'Alteradores'
          end
          object edtMedFolha: TMaskEdit
            Left = 283
            Top = 46
            Width = 67
            Height = 21
            Enabled = False
            MaxLength = 2
            TabOrder = 0
          end
          object cbxDataPagamento: TwwDBDateTimePicker
            Left = 246
            Top = 72
            Width = 106
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            Epoch = 1950
            Enabled = False
            ShowButton = True
            TabOrder = 1
          end
          object cbxAlteradores: TComboBox
            Left = 288
            Top = 128
            Width = 65
            Height = 21
            ItemHeight = 13
            TabOrder = 2
            Items.Strings = (
              'Não'
              'Sim')
          end
          object cbxLote: TComboBox
            Left = 40
            Top = 20
            Width = 313
            Height = 21
            ItemHeight = 13
            TabOrder = 3
            OnClick = cbxLoteClick
          end
          object cbxMotivo: TComboBox
            Left = 88
            Top = 100
            Width = 265
            Height = 21
            ItemHeight = 13
            TabOrder = 4
            OnClick = cbxMotivoClick
          end
        end
        object edtPercentualFRB: TRealEdit
          Left = 151
          Top = 144
          Width = 81
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '0,00')
          TabOrder = 8
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object cbxPlanoPrev: TComboBox
          Left = 136
          Top = 11
          Width = 257
          Height = 21
          ItemHeight = 13
          TabOrder = 18
          OnClick = cbxPlanoPrevClick
        end
      end
      object tsListaMatricula: TTabSheet
        Caption = 'Lista de Matrículas'
        ImageIndex = 1
        inline frmfrmlstbnf: TfrmFrameListaBenef
          Top = 57
          Width = 716
          Height = 454
          Align = alClient
          inherited Panel3: TPanel
            Width = 716
            Height = 33
            inherited Dock971: TDock97
              Top = -1
              Width = 714
              inherited TB97oKCancelar: TToolbar97
                inherited lblQuant: TLabel
                  Width = 5
                end
                inherited bbtnIncluiBenef: TBitBtn
                  OnClick = frmfrmlstbnfbbtnIncluiBenefClick
                end
                inherited bbtnIncluiLista: TBitBtn
                  OnClick = frmfrmlstbnfbbtnIncluiListaClick
                end
                inherited bbtnExcluiCorrente: TBitBtn
                  OnClick = frmfrmlstbnfbbtnExcluiCorrenteClick
                end
              end
            end
          end
          inherited dbgrdPessoas: TwwDBGrid
            Top = 33
            Width = 716
            Height = 421
          end
          inherited MSLista: TMontaSelect
            OperComparador.Strings = (
              '-1')
            LookupSQL.Strings = (
              '')
            LookupCampoChave.Strings = (
              '')
            LookupCampoExibe.Strings = (
              '')
          end
        end
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 716
          Height = 57
          Align = alTop
          TabOrder = 1
          object Label18: TLabel
            Left = 280
            Top = 4
            Width = 174
            Height = 13
            Caption = 'Informar arquivo de matrículas'
          end
          object edtBuscaArquivo: TEdit
            Left = 120
            Top = 21
            Width = 460
            Height = 21
            TabOrder = 0
          end
          object btnCarrega: TBitBtn
            Left = 584
            Top = 19
            Width = 105
            Height = 25
            Caption = 'Carregar'
            TabOrder = 1
            OnClick = btnCarregaClick
          end
          object BitBtn1: TBitBtn
            Left = 8
            Top = 19
            Width = 105
            Height = 25
            Caption = 'Procurar'
            TabOrder = 2
            OnClick = BitBtn1Click
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 541
    Width = 726
    Height = 41
    inherited tb97Fundo: TToolbar97
      Left = 367
      Visible = False
      inherited bbtnSair: TBitBtn
        Top = 1
        Visible = False
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Top = 1
        Visible = False
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      Visible = False
      inherited bbtnConfirmar: TBitBtn
        Top = 1
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Top = 1
        Visible = False
      end
    end
    object Toolbar971: TToolbar97
      Left = 539
      Top = 0
      Caption = 'tb97Fundo'
      Color = clNone
      CloseButton = False
      DefaultDock = Dock971
      DockPos = 539
      TabOrder = 2
      object ToolbarSep972: TToolbarSep97
        Left = 118
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      object ToolbarSep973: TToolbarSep97
        Left = 115
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      object BitBtn5: TBitBtn
        Left = 0
        Top = 0
        Width = 115
        Height = 35
        Caption = 'Efetuar Reajuste'
        Default = True
        TabOrder = 0
        OnClick = BitBtn5Click
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 523
    Top = 67
    TargetsData = (
      1
      5
      (
        'TMemo'
        'Text'
        0)
      (
        ''
        'Cells'
        0)
      (
        'TDBMemo'
        'Text'
        0)
      (
        'TRealEdit'
        'Text'
        0)
      (
        ''
        'Filter'
        0))
  end
  object IvExtendedTranslator1: TIvExtendedTranslator
    DictionaryName = 'CMDicionario'
    Left = 523
    Top = 67
    TargetsData = (
      1
      8
      (
        ''
        'Hint'
        0)
      (
        ''
        'Caption'
        0)
      (
        ''
        'Items'
        0)
      (
        'TMemo'
        'Text'
        0)
      (
        ''
        'Cells'
        0)
      (
        'TDBMemo'
        'Text'
        0)
      (
        'TRealEdit'
        'Text'
        0)
      (
        ''
        'Filter'
        0))
  end
  object qryBeneficios: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT DISTINCT B.IDBENEFICIO, B.NOME, BPP.IDPLANPREVCONTAB, BPP' +
        '.FLGREFERENCIA'
      'FROM BENEFICIO B'
      '     JOIN BENEFPLANPREV BPP ON B.IDBENEFICIO = BPP.IDBENEFICIO'
      
        'WHERE B.IDTPPAGTOBENEFIC = 1 AND --BENEFÍCIOS DE PAGAMENTO VITAL' +
        'ÍCIO'
      
        '      NVL(B.FLGRESGATE,0) = 0 AND --BENEFÍCIOS QUE NÃO SÃO DE RE' +
        'SGATE'
      
        '      BPP.FLGREFERENCIA = :FONTEPAGADORA  -- 0 PARA FONTE PAGADO' +
        'RA FUNCEF'
      '                          -- 1 PARA FONTE PAGADORA INSS'
      'ORDER BY B.NOME')
    ValidateWithMask = True
    Left = 685
    Top = 73
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'FONTEPAGADORA'
        ParamType = ptUnknown
      end>
  end
  object dsBeneficios: TwwDataSource
    DataSet = qryBeneficios
    Left = 685
    Top = 25
  end
  object dspBeneficio: TDataSetProvider
    Constraints = True
    ResolveToDataSet = True
    Exported = False
    Left = 293
    Top = 9
  end
  object dsLote: TwwDataSource
    AutoEdit = False
    DataSet = qryLote
    Left = 333
    Top = 249
  end
  object dsMotivo: TwwDataSource
    AutoEdit = False
    DataSet = qryMotivo
    Left = 408
    Top = 168
  end
  object dsAlteradores: TwwDataSource
    AutoEdit = False
    DataSet = qryReajuste
    Left = 664
    Top = 200
  end
  object qryLote: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BASEDADOS'
    Filtered = True
    SQL.Strings = (
      
        'SELECT C.IDLOTE, C.DESCRICAO, C.MESREFERENCIA, 0 AS FECHALOTE, N' +
        'VL(C.FLGINCLUIMESCONC,1) FLGINCLUIMESCONC, C.DATAPAGAMENTO'
      'FROM   CTRLINTERFACE C'
      'WHERE  C.FLGPREPARADO = 1'
      'AND    C.TIPO = '#39'B'#39
      'AND    C.FLGCONCESSAO =1'
      'AND    C.FLGIDATMP = 0'
      'AND    C. FLGRESGATE = 0 '
      'AND    C.FLGLOTEPROCESSADO = 0'
      'ORDER BY C.MESREFERENCIA DESC, C.IDLOTE DESC, C.DESCRICAO'
      '')
    ValidateWithMask = True
    Left = 640
    Top = 120
    object testeLoteIDLOTE: TFloatField
      FieldName = 'IDLOTE'
      Origin = 'BASEDADOS.CTRLINTERFACE.IDLOTE'
    end
    object strngfldLoteDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.CTRLINTERFACE.DESCRICAO'
      Size = 200
    end
  end
  object qryMotivo: TwwQuery
    DatabaseName = 'BASEDADOS'
    Filtered = True
    SQL.Strings = (
      'SELECT '
      '  IDMOTIVO,'
      '  DESCRICAO'
      ' FROM '
      '  MOTIVO'
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 528
    Top = 128
    object testeMotivoIDMOTIVO: TFloatField
      FieldName = 'IDMOTIVO'
      Origin = 'BASEDADOS.MOTIVO.IDMOTIVO'
    end
    object strngfldMotivoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.MOTIVO.DESCRICAO'
      Size = 50
    end
  end
  object qryReajuste: TwwQuery
    DatabaseName = 'BASEDADOS'
    Filtered = True
    SQL.Strings = (
      
        'SELECT MAX(IDREAJUSTEBENEFICIO) AS IDREAJUSTE FROM REAJUSTEBENEF' +
        'ICIO')
    ValidateWithMask = True
    Left = 288
    Top = 384
    object qryReajusteIDREAJUSTE: TFloatField
      FieldName = 'IDREAJUSTE'
    end
  end
  object qryPlanoPrev: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT '
      '  IDPLANOPREV,'
      '  NOME'
      'FROM PLANPREV'
      'WHERE IDPLANOPREV IN (2,66,74)'
      'ORDER BY '
      '  NOME   ')
    ValidateWithMask = True
    Left = 277
    Top = 177
    object testePlanoPrevIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.PLANPREV.IDPLANOPREV'
    end
    object strngfldPlanoPrevNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PLANPREV.NOME'
      Size = 50
    end
  end
  object dsPlanoPrev: TwwDataSource
    AutoEdit = False
    DataSet = qryPlanoPrev
    Left = 280
    Top = 248
  end
  object MontaSelect1: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 581
    Top = 25
  end
  object OpenDialog: TOpenDialog
    Left = 613
    Top = 201
  end
  object qryArquivo: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BASEDADOS'
    Filtered = True
    SQL.Strings = (
      'SELECT                            '
      ' D.MATRICULA AS MATRICULADEP, '
      ' P.NOME AS NOMEDEP,           '
      ' DT.MATRICULA AS MATRICULA,   '
      ' PT.NOME AS NOMETITULAR       '
      ' ,P.IDPESSOA AS IDPESSOA '
      ' ,PT.IDPESSOA AS IDTITULAR '
      ' FROM DEPENTIT D, PESSOA P,       '
      ' DEPENTIT DT, PESSOA PT       '
      ' WHERE P.IDPESSOA  = D.IDPESSOA     '
      ' AND DT.IDPESSOA = D.IDTITULAR    '
      ' AND PT.IDPESSOA = DT.IDTITULAR   ')
    ValidateWithMask = True
    Left = 685
    Top = 121
    object qryArquivoMATRICULADEP: TStringField
      FieldName = 'MATRICULADEP'
      Origin = 'BASEDADOS.DEPENTIT.MATRICULA'
      Size = 15
    end
    object qryArquivoNOMEDEP: TStringField
      FieldName = 'NOMEDEP'
      Origin = 'BASEDADOS.PESSOA.NOME'
      Size = 60
    end
    object qryArquivoMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Origin = 'BASEDADOS.DEPENTIT.MATRICULA'
      Size = 15
    end
    object qryArquivoNOMETITULAR: TStringField
      FieldName = 'NOMETITULAR'
      Origin = 'BASEDADOS.PESSOA.NOME'
      Size = 60
    end
    object qryArquivoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.PESSOA.IDPESSOA'
    end
    object qryArquivoIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
      Origin = 'BASEDADOS.PESSOA.IDPESSOA'
    end
  end
  object qryAux: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 581
    Top = 73
  end
  object qryInsert: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'INSERT INTO cm.REAJUSTEBENEFICIO'
      '  (IDREAJUSTEBENEFICIO,'
      '   IDPLANOPREV,'
      '   IDLISTA,'
      '   FLGAPATUALIZABENEF,'
      '   ANOMESINIINDICE,'
      '   ANOMESFIMINDICE,'
      '   ANOMESINICALC,'
      '   ANOMESFIMCALC,'
      '   ANOMESINIACERTO,'
      '   ANOMESFIMACERTO,'
      '   ANOMESCOMPREEM,'
      '   FLGAPPERCFRB,'
      '   PERCFRB,'
      '   FONTEPAGADORA,'
      '   FLGATIVO,'
      '   FLGRETIDO,'
      '   FLGENCERRADO,'
      '   IDLOTE,'
      '   IDMOTIVO,'
      '   FLGALTERADORES,'
      '   FLGREAJUSTETOTAL,'
      '   OBSERVACAO,'
      '   TRGDTINCLUSAO,'
      '   TRGUSERINCLUSAO)'
      'VALUES('
      '   :IDREAJUSTEBENEFICIO,'
      '   :IDPLANOPREV,'
      '   :IDLISTA,'
      '   :FLGAPATUALIZABENEF,'
      '   :ANOMESINIINDICE,'
      '   :ANOMESFIMINDICE,'
      '   :ANOMESINICALC,'
      '   :ANOMESFIMCALC,'
      '   :ANOMESINIACERTO,'
      '   :ANOMESFIMACERTO,'
      '   :ANOMESCOMPREEM,'
      '   :FLGAPPERCFRB,'
      '   TO_NUMBER(:PERCFRB),'
      '   :FONTEPAGADORA,'
      '   :FLGATIVO,'
      '   :FLGRETIDO,'
      '   :FLGENCERRADO,'
      '   :IDLOTE,'
      '   :IDMOTIVO,'
      '   :FLGALTERADORES,'
      '   :FLGREAJUSTETOTAL,'
      '   :OBSERVACAO,'
      '   :TRGDTINCLUSAO,'
      '   :TRGUSERINCLUSAO)')
    ValidateWithMask = True
    Left = 285
    Top = 449
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDREAJUSTEBENEFICIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDLISTA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FLGAPATUALIZABENEF'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ANOMESINIINDICE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ANOMESFIMINDICE'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ANOMESINICALC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ANOMESFIMCALC'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ANOMESINIACERTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ANOMESFIMACERTO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'ANOMESCOMPREEM'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'FLGAPPERCFRB'
        ParamType = ptInput
      end
      item
        DataType = ftOraBlob
        Name = 'PERCFRB'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FONTEPAGADORA'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FLGATIVO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FLGRETIDO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FLGENCERRADO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDLOTE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDMOTIVO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'FLGALTERADORES'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'FLGREAJUSTETOTAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftOraBlob
        Name = 'OBSERVACAO'
        ParamType = ptInput
      end
      item
        DataType = ftDateTime
        Name = 'TRGDTINCLUSAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TRGUSERINCLUSAO'
        ParamType = ptInput
      end>
  end
  object qryInsertListabenefReajust: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'INSERT INTO CM.LISTABENEFICIOREAJUSTE ('
      #9#9'IDLISTABENEFICIOREAJUSTE,'
      '        IDREAJUSTEBENEFICIO,'
      '        IDBENEFICIO,'
      '        TRGDTINCLUSAO,'
      '        TRGUSERINCLUSAO)'
      #9#9'VALUES('
      #9#9':IDLISTABENEFICIOREAJUSTE,'
      '        :IDREAJUSTEBENEFICIO,'
      '        :IDBENEFICIO,'
      '        :TRGDTINCLUSAO,'
      '        :TRGUSERINCLUSAO)')
    ValidateWithMask = True
    Left = 373
    Top = 457
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDLISTABENEFICIOREAJUSTE'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDREAJUSTEBENEFICIO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDBENEFICIO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'TRGDTINCLUSAO'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'TRGUSERINCLUSAO'
        ParamType = ptInput
      end>
  end
  object ProcReajuste: TStoredProc
    DatabaseName = 'BASEDADOS'
    StoredProcName = 'CM.SP_BF_REAJUSTE_BENEF'
    Left = 445
    Top = 81
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IN_IDREAJUSTEBENEFICIO'
        ParamType = ptInput
      end>
  end
  object wwQuery1: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'begin'
      '  -- Call the procedure'
      '  cm.sp_bf_reajuste_benef(:in_idreajustebeneficio);'
      'end;')
    ValidateWithMask = True
    Left = 477
    Top = 289
    ParamData = <
      item
        DataType = ftInteger
        Name = 'in_idreajustebeneficio'
        ParamType = ptInput
      end>
  end
  object ClientDataSet1: TClientDataSet
    Aggregates = <>
    Params = <>
    ReadOnly = True
    Left = 229
    Top = 49
  end
  object qryMesFolha: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MESREFERENCIA, DATAPAGAMENTO'
      'FROM   CTRLINTERFACE '
      'WHERE IDLOTE = :IDLOTE')
    ValidateWithMask = True
    Left = 589
    Top = 137
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDLOTE'
        ParamType = ptUnknown
      end>
  end
  object wwMatriculas: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'select * from cm.MatriculasContrib')
    ValidateWithMask = True
    Left = 613
    Top = 337
  end
  object wwTable1: TwwTable
    SyncSQLByRange = False
    NarrowSearch = False
    ValidateWithMask = True
    Left = 597
    Top = 393
  end
  object connTB: TADOConnection
    ConnectionString = 
      'Provider=tbprov.Tbprov.6;Cache Authentication=False;Encrypt Pass' +
      'word=False;Integrated Security="";Mask Password=False;Password=M' +
      'aster2018tb;Persist Encrypted=False;Persist Security Info=True;U' +
      'ser ID=dml_osni;Bind Flags=0;Initial Catalog="";Data Source=hom2' +
      ';Impersonation Level=Anonymous;Location="";Lock Owner="";Mode=Re' +
      'adWrite;Protection Level=None;Extended Properties="";Updatable C' +
      'ursor=False;Enlist=None;Max Pool Size=100;Min Pool Size=1;Connec' +
      't Lifetime=0'
    LoginPrompt = False
    Mode = cmReadWrite
    Provider = 'tbprov.Tbprov.6'
    Left = 24
    Top = 480
  end
  object AdoDsMatriculas: TADODataSet
    Connection = connTB
    CursorType = ctStatic
    LockType = ltBatchOptimistic
    ParamCheck = False
    Parameters = <>
    Prepared = True
    Left = 61
    Top = 481
  end
end
