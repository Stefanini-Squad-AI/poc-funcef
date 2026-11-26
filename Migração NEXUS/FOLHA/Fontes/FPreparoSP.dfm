inherited frmPreparoSP: TfrmPreparoSP
  Left = 326
  Top = 116
  BorderStyle = bsNone
  Caption = 'Preparo da Folha de Benefícios'
  ClientHeight = 574
  ClientWidth = 954
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 954
    Height = 535
    object pgcOpcoes: TPageControl
      Left = 1
      Top = 129
      Width = 952
      Height = 405
      ActivePage = tbsResultado
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object tbsOpcoes: TTabSheet
        Caption = 'Opções'
        object Splitter1: TSplitter
          Left = 345
          Top = 31
          Width = 4
          Height = 346
          Cursor = crHSplit
        end
        object Panel1: TPanel
          Left = 0
          Top = 31
          Width = 345
          Height = 346
          Align = alLeft
          Caption = 'Panel1'
          TabOrder = 0
          object Label1: TLabel
            Left = 13
            Top = 5
            Width = 66
            Height = 13
            Caption = 'Patrocinadora'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
          end
          object Splitter2: TSplitter
            Left = 1
            Top = 161
            Width = 343
            Height = 5
            Cursor = crVSplit
            Align = alTop
          end
          object Panel4: TPanel
            Left = 1
            Top = 166
            Width = 343
            Height = 179
            Align = alClient
            Caption = 'Panel4'
            TabOrder = 0
            object chklstPlano: TCheckListBox
              Left = 1
              Top = 23
              Width = 341
              Height = 155
              Hint = 'Planos Disponíveis para o Preparo da Folha de Benefícios'
              OnClickCheck = chklstPlanoClickCheck
              Align = alClient
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Courier New'
              Font.Style = []
              ItemHeight = 15
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
            object PnlPlano: TPanel
              Left = 1
              Top = 1
              Width = 341
              Height = 22
              Align = alTop
              Alignment = taLeftJustify
              BevelInner = bvRaised
              BevelOuter = bvLowered
              Caption = '   Planos das Patrocinadoras selecionadas'
              TabOrder = 1
              object imgSelPlano: TImage
                Left = 322
                Top = 2
                Width = 17
                Height = 18
                Hint = 'Inverter seleção'
                Align = alRight
                ParentShowHint = False
                Picture.Data = {
                  07544269746D6170E6000000424DE60000000000000076000000280000000E00
                  00000E0000000100040000000000700000000000000000000000100000001000
                  0000000000000000BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0
                  C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
                  FF00333333333333330033333333333333003333333333333300333330003333
                  3300333330F033333300333330F033333300330000F000033300330FFFFFFF03
                  3300330000F000033300333330F033333300333330F033333300333330003333
                  330033333333333333003333333333333300}
                ShowHint = True
                Stretch = True
                OnClick = PnlPlanoClick
              end
            end
          end
          object Panel5: TPanel
            Left = 1
            Top = 1
            Width = 343
            Height = 160
            Align = alTop
            Caption = 'Panel5'
            TabOrder = 1
            object chklstPatro: TCheckListBox
              Left = 1
              Top = 23
              Width = 341
              Height = 136
              Hint = 'Patrocinadoras Disponíveis para o Preparo'
              OnClickCheck = chklstPatroClickCheck
              Align = alClient
              Columns = 2
              Font.Charset = ANSI_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Courier New'
              Font.Style = []
              ItemHeight = 15
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
            object PnlPatrocinadora: TPanel
              Left = 1
              Top = 1
              Width = 341
              Height = 22
              Align = alTop
              Alignment = taLeftJustify
              BevelInner = bvRaised
              BevelOuter = bvLowered
              Caption = '    Patrocinadora com Assistidos'
              TabOrder = 1
              object imgSelPatro: TImage
                Left = 322
                Top = 2
                Width = 17
                Height = 18
                Hint = 'Inverter seleção'
                Align = alRight
                ParentShowHint = False
                Picture.Data = {
                  07544269746D6170E6000000424DE60000000000000076000000280000000E00
                  00000E0000000100040000000000700000000000000000000000100000001000
                  0000000000000000BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0
                  C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
                  FF00333333333333330033333333333333003333333333333300333330003333
                  3300333330F033333300333330F033333300330000F000033300330FFFFFFF03
                  3300330000F000033300333330F033333300333330F033333300333330003333
                  330033333333333333003333333333333300}
                ShowHint = True
                Stretch = True
                OnClick = PnlPatrocinadoraClick
              end
            end
          end
        end
        object Panel3: TPanel
          Left = 349
          Top = 31
          Width = 595
          Height = 346
          Align = alClient
          Caption = 'Panel3'
          TabOrder = 1
          object chklstBenef: TCheckListBox
            Left = 1
            Top = 23
            Width = 593
            Height = 322
            Hint = 'Benefícios disponiveis para o Preparo'
            OnClickCheck = chklstBenefClickCheck
            Align = alClient
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Courier New'
            Font.Style = []
            ItemHeight = 15
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
          end
          object PnlBeneficio: TPanel
            Left = 1
            Top = 1
            Width = 593
            Height = 22
            Align = alTop
            Alignment = taLeftJustify
            BevelInner = bvRaised
            BevelOuter = bvLowered
            Caption = '   Benefícios'
            TabOrder = 1
            object imgSelBenef: TImage
              Left = 574
              Top = 2
              Width = 17
              Height = 18
              Hint = 'Inverter seleção'
              Align = alRight
              ParentShowHint = False
              Picture.Data = {
                07544269746D6170E6000000424DE60000000000000076000000280000000E00
                00000E0000000100040000000000700000000000000000000000100000001000
                0000000000000000BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0
                C000808080000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFF
                FF00333333333333330033333333333333003333333333333300333330003333
                3300333330F033333300333330F033333300330000F000033300330FFFFFFF03
                3300330000F000033300333330F033333300333330F033333300333330003333
                330033333333333333003333333333333300}
              ShowHint = True
              Stretch = True
              OnClick = PnlBeneficioClick
            end
            object chkreferencia: TCheckBox
              Left = 96
              Top = 3
              Width = 193
              Height = 17
              Caption = 'Inclusive os de referência'
              Checked = True
              State = cbChecked
              TabOrder = 0
              OnClick = chkreferenciaClick
            end
          end
        end
        object Panel8: TPanel
          Left = 0
          Top = 0
          Width = 944
          Height = 31
          Align = alTop
          TabOrder = 2
          object cboxIndividual: TCheckBox
            Left = 14
            Top = 8
            Width = 225
            Height = 17
            Caption = 'Utiliza Lista Individual de Processamento'
            TabOrder = 0
            OnClick = cboxIndividualClick
          end
          object chkSelTodos: TCheckBox
            Left = 602
            Top = 8
            Width = 369
            Height = 17
            Caption = 
              'Selecionar todas as Patrocinadoras, Planos Previdenciários e Ben' +
              'efícios'
            Checked = True
            State = cbChecked
            TabOrder = 3
            OnClick = chkSelTodosClick
          end
          object chkProcessaContrib: TCheckBox
            Left = 248
            Top = 8
            Width = 145
            Height = 17
            Caption = 'Processa Contribuições'
            Checked = True
            State = cbChecked
            TabOrder = 1
          end
          object chkProcessaContribDefict: TCheckBox
            Left = 402
            Top = 8
            Width = 191
            Height = 17
            Caption = 'Processa Contribuições de Déficit'
            Checked = True
            State = cbChecked
            TabOrder = 2
          end
        end
      end
      object tbsIndividual: TTabSheet
        Caption = 'Individual'
        ImageIndex = 2
        inline frameBenef: TfrmFrameListaBenef
          Width = 944
          Height = 377
          Align = alClient
          inherited Panel3: TPanel
            Width = 944
            inherited Dock971: TDock97
              Width = 788
              inherited TB97oKCancelar: TToolbar97
                inherited bbtnIncluiBenef: TBitBtn
                  Font.Height = -12
                  OnClick = frameBenefbbtnIncluiBenefClick
                end
                inherited bbtnIncluiLista: TBitBtn
                  Font.Height = -12
                  OnClick = frameBenefbbtnIncluiListaClick
                end
                inherited bbtnExcluiTudo: TBitBtn
                  Font.Height = -12
                end
                inherited bbtnExcluiCorrente: TBitBtn
                  Font.Height = -12
                end
              end
            end
          end
          inherited dbgrdPessoas: TwwDBGrid
            Width = 944
            Height = 343
          end
          inherited qryLista: TwwQuery
            Left = 27
          end
          inherited dsLista: TwwDataSource
            OnDataChange = frameBenefdsListaDataChange
            Left = 75
          end
          inherited qryAux: TwwQuery
            Top = 130
          end
          inherited MSLista: TMontaSelect
            Descricao.Strings = (
              'Nome da Lista de Benef.')
            SensivelACaixa.Strings = (
              'S')
            OperComparador.Strings = (
              '0')
            Top = 139
          end
          inherited qrybuscaLista: TwwQuery
            Top = 136
          end
        end
      end
      object tbsResultado: TTabSheet
        Caption = 'Resultado'
        object Panel7: TPanel
          Left = 0
          Top = 0
          Width = 944
          Height = 377
          Align = alClient
          Caption = 'Panel7'
          TabOrder = 0
          object memResult: TMemo
            Left = 1
            Top = 1
            Width = 942
            Height = 375
            Align = alClient
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'Courier New'
            Font.Style = []
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
        end
      end
    end
    object RdgTpFolha: TRadioGroup
      Left = 1
      Top = 1
      Width = 952
      Height = 48
      Hint = 'Opções de Geração dos Tipos de Folha de Benefício'
      Align = alTop
      Caption = ' Selecione o Tipo de Cálculo '
      Columns = 6
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -15
      Font.Name = 'Arial'
      Font.Style = []
      ItemIndex = 0
      Items.Strings = (
        'Normal'
        'Abono'
        'Antecipação Abono FUNCEF'
        'Antecipação Abono INSS'
        'Resgate Parcelado'
        'Desfazer Preparo')
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = RdgTpFolhaClick
    end
    object Panel2: TPanel
      Left = 1
      Top = 92
      Width = 952
      Height = 37
      Align = alTop
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      object lblDescLote: TLabel
        Left = 9
        Top = 12
        Width = 97
        Height = 17
        Caption = 'Escolha o Lote'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object lblMesRef: TLabel
        Left = 8
        Top = 41
        Width = 106
        Height = 17
        Caption = 'Mês Referência:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object lbldtPagamento: TLabel
        Left = 251
        Top = 41
        Width = 114
        Height = 17
        Caption = 'Data Pagamento:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object lbldtCriacaoLote: TLabel
        Left = 509
        Top = 41
        Width = 142
        Height = 17
        Caption = 'Data Criação do Lote:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object dbtDescricao: TDBText
        Left = 231
        Top = 11
        Width = 540
        Height = 18
        Color = clWhite
        DataField = 'DESCRICAO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object dbtMesref: TDBText
        Left = 123
        Top = 40
        Width = 113
        Height = 18
        Alignment = taCenter
        Color = clWhite
        DataField = 'MESREF'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clRed
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object dbtDataPagto: TDBText
        Left = 377
        Top = 40
        Width = 113
        Height = 18
        Alignment = taCenter
        Color = clWhite
        DataField = 'DATAPAGAMENTO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object dbtDatacria: TDBText
        Left = 659
        Top = 40
        Width = 113
        Height = 18
        Alignment = taCenter
        Color = clWhite
        DataField = 'DATAPREPARO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object cmbLote: TwwDBLookupCombo
        Left = 115
        Top = 7
        Width = 107
        Height = 26
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'IDLOTE'#9'10'#9'Lote'#9'F'
          'MESREFERENCIA'#9'7'#9'Mês'#9'F'
          'NUMREG'#9'10'#9'N.Reg.'#9'F'
          'VLRTOTAL'#9'10'#9'Valor'#9'F'
          'DESCRICAO'#9'40'#9'Descrição'#9'F')
        LookupTable = qryCtrlInterface
        LookupField = 'IDLOTE'
        Options = [loColLines, loRowLines, loTitles]
        ParentFont = False
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnChange = cmbLoteChange
      end
    end
    object pnlAbono: TPanel
      Left = 1
      Top = 49
      Width = 952
      Height = 43
      Align = alTop
      TabOrder = 3
      object gbAbono: TGroupBox
        Left = 1
        Top = 1
        Width = 950
        Height = 39
        Align = alTop
        Caption = 'Abono'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -15
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        object chkAbonoFuncef: TCheckBox
          Left = 11
          Top = 18
          Width = 81
          Height = 17
          Caption = 'FUNCEF'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
        end
        object chkAbonoINSS: TCheckBox
          Left = 109
          Top = 18
          Width = 56
          Height = 17
          Caption = 'INSS'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
          TabOrder = 1
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 535
    Width = 954
    inherited tb97Fundo: TToolbar97
      Left = 622
      DockPos = 622
      inherited sep1: TToolbarSep97
        Left = 285
      end
      inherited sep3: TToolbarSep97
        Left = 201
      end
      object ToolbarSep972: TToolbarSep97 [2]
        Left = 117
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      inherited bbtnSair: TBitBtn
        Left = 120
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 204
      end
      object btnProcessar: TBitBtn
        Left = 0
        Top = 0
        Width = 117
        Height = 33
        Caption = '&Processar'
        Enabled = False
        TabOrder = 2
        OnClick = btnProcessarClick
        Kind = bkOK
        Spacing = 2
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      Visible = False
      inherited bbtnConfirmar: TBitBtn
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      3
      (
        ''
        'Filter'
        0)
      (
        ''
        'DisplayLabel'
        0)
      (
        'TMemo'
        'Text'
        0))
  end
  object qryPatro: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT p.idpessoa, p.nome'
      'FROM patro pt'
      '     JOIN pessoa p ON pt.idpessoa = p.idpessoa'
      'WHERE EXISTS (SELECT 1'
      '              FROM Planprevpatro pp'
      
        '                   JOIN benefplanprev bpp ON pp.idplanoprev = bp' +
        'p.idplanoprev'
      '              WHERE pp.idpessjur = pt.idpessoa)'
      ' ORDER BY p.nome')
    ValidateWithMask = True
    Left = 205
    Top = 240
  end
  object qryPlano: TwwQuery
    DatabaseName = 'BASEDADOS'
    ValidateWithMask = True
    Left = 248
    Top = 248
  end
  object qryBenef: TwwQuery
    DatabaseName = 'BASEDADOS'
    ValidateWithMask = True
    Left = 576
    Top = 240
  end
  object qryCtrlInterface: TwwQuery
    DatabaseName = 'BASEDADOS'
    ValidateWithMask = True
    Left = 304
    Top = 24
  end
  object dsCtrlInterface: TDataSource
    DataSet = qryCtrlInterface
    Left = 376
    Top = 40
  end
  object qryInsertPreparoBenef: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      
        'INSERT INTO PREPAROBENEF (IDPREPAROBENEF, IDTIPOPREPAROBENEF, ID' +
        'LOTE, IDLISTA, FLGCONTRIBUICAO, FLGPREPAROTOTAL, '
      
        '                          DATAINICIO, DATATERMINO, FLGCONTRIBDEF' +
        'ICT) VALUES '
      
        '                         (:IDPREPAROBENEF,  :IDTIPOPREPAROBENEF,' +
        ' :IDLOTE, :IDLISTA, :FLGCONTRIBUICAO, :FLGPREPAROTOTAL, '
      
        '                          :DATAINICIO, :DATATERMINO, :FLGCONTRIB' +
        'DEFICT) ')
    ValidateWithMask = True
    Left = 576
    Top = 304
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPREPAROBENEF'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDTIPOPREPAROBENEF'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDLOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDLISTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FLGCONTRIBUICAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FLGPREPAROTOTAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATAINICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATATERMINO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'FLGCONTRIBDEFICT'
        ParamType = ptUnknown
      end>
  end
  object qryAux: TwwQuery
    DatabaseName = 'BASEDADOS'
    ValidateWithMask = True
    Left = 496
    Top = 240
  end
  object qryInsertListaBenefPreparo: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'INSERT INTO LISTABENEFICIOPREPARO '
      
        '           (IDLISTABENEFICIOPREPARO, IDPREPAROBENEF, IDPATRO, ID' +
        'PLANOPREV, IDBENEFICIO)'
      '     VALUES'
      
        '           (:IDLISTABENEFICIOPREPARO, :IDPREPAROBENEF, :IDPATRO,' +
        ' :IDPLANOPREV, :IDBENEFICIO) ')
    ValidateWithMask = True
    Left = 448
    Top = 320
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDLISTABENEFICIOPREPARO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPREPAROBENEF'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPATRO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDBENEFICIO'
        ParamType = ptUnknown
      end>
  end
  object spPreparo: TwwStoredProc
    DatabaseName = 'BASEDADOS'
    StoredProcName = 'CM.SP_FB_PREPARO_FOLHA_BENEF'
    ValidateWithMask = True
    Left = 400
    Top = 224
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IN_IDPREPAROBENEF'
        ParamType = ptInput
      end>
  end
  object qryPreparoBenef: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT * FROM PREPAROBENEF'
      '  WHERE IDPREPAROBENEF = :IDPREPAROBENEF')
    ValidateWithMask = True
    Left = 576
    Top = 368
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPREPAROBENEF'
        ParamType = ptUnknown
      end>
  end
  object qryLogPreparo: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      ''
      ' '
      'SELECT b.tipobeneficio, d.matricula, l.observacoes'
      '  FROM logpreparo l'
      '  left join Beneficio b'
      '    on b.idbeneficio = l.idbeneficio'
      '  left join depentit d'
      '    on d.idpessoa = l.idpessoa'
      'where l.idpreparobenef = :IDPREPAROBENEF'
      
        ' ORDER BY d.matricula desc, b.tipobeneficio desc, l.idlogpreparo' +
        ' asc')
    ValidateWithMask = True
    Left = 392
    Top = 272
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPREPAROBENEF'
        ParamType = ptUnknown
      end>
  end
  object MSBenef: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'VWPARTICIPDEPEN.MATRICULA'
      'VWPARTICIPDEPEN.MATRICULADEP'
      'VWPARTICIPDEPEN.NUMDOCUMENTO'
      'VWPARTICIPDEPEN.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Matric. Titular'
      'Matric. Benef.'
      'CPF'
      'Nome')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'S')
    Tabelas.Strings = (
      'VWPARTICIPDEPEN')
    CamposChave.Strings = (
      'VWPARTICIPDEPEN.IDPESSOA'
      'VWPARTICIPDEPEN.MATRICULA'
      'VWPARTICIPDEPEN.MATRICULADEP'
      'VWPARTICIPDEPEN.MATRICSHOW'
      'VWPARTICIPDEPEN.SITPATRO'
      'VWPARTICIPDEPEN.IDTITULAR'
      'VWPARTICIPDEPEN.NOME'
      'VWPARTICIPDEPEN.IDDEPENDENCIA'
      'VWPARTICIPDEPEN.NUMDOCUMENTO'
      'VWPARTICIPDEPEN.IDPESSJUR'
      'VWPARTICIPDEPEN.INSCRICAONUMERO'
      'VWPARTICIPDEPEN.IDPLANOPREV'
      'VWPARTICIPDEPEN.IDSITPART'
      'VWPARTICIPDEPEN.SEQPROPOSTA'
      'VWPARTICIPDEPEN.FLGDESATIVADO'
      'VWPARTICIPDEPEN.PLANO'
      'VWPARTICIPDEPEN.PATRO'
      'VWPARTICIPDEPEN.DESCRICAO'
      'VWPARTICIPDEPEN.SITFUND')
    Filtro.Strings = (
      'IDPLANOPREV IS NOT NULL')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '15'
      '15'
      '18'
      '60')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      '')
    Left = 64
    Top = 344
  end
end
