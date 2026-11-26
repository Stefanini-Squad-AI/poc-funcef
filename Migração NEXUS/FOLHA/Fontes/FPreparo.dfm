inherited frmPreparo: TfrmPreparo
  Left = 147
  Top = 29
  HelpContext = 180004
  Caption = 'Preparo da Folha de Benefícios'
  ClientHeight = 536
  ClientWidth = 784
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  object Label3: TLabel [0]
    Left = 400
    Top = 232
    Width = 39
    Height = 13
    Caption = 'Label3'
  end
  inherited pnlFundo: TPanel
    Width = 784
    Height = 497
    object pnlInformacoes: TPanel
      Left = 1
      Top = 1
      Width = 782
      Height = 120
      Align = alTop
      BevelOuter = bvLowered
      TabOrder = 0
      object btnCommit: TButton
        Left = 656
        Top = 8
        Width = 75
        Height = 25
        Caption = 'Efetiva'
        TabOrder = 0
        Visible = False
        OnClick = btnCommitClick
      end
      object Panel9: TPanel
        Left = 1
        Top = 1
        Width = 780
        Height = 51
        Align = alTop
        TabOrder = 2
        object RdgTpFolha: TRadioGroup
          Left = 1
          Top = 1
          Width = 778
          Height = 49
          Hint = 'Opções de Geração dos Tipos de Folha de Benefício'
          Align = alClient
          Caption = ' Selecione o Tipo de Cálculo '
          Columns = 4
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -15
          Font.Name = 'Arial'
          Font.Style = []
          ItemIndex = 0
          Items.Strings = (
            'Normal'
            'Abono'
            'Antecipação Abono'
            'Resgate Parcelado')
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 0
          OnClick = RdgTpFolhaClick
        end
      end
      object Panel2: TPanel
        Left = 1
        Top = 52
        Width = 780
        Height = 67
        Align = alClient
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
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
        object Label2: TLabel
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
        object Label4: TLabel
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
        object Label5: TLabel
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
          OnExit = cmbLoteChange
        end
      end
    end
    object pnlOpcoes: TPanel
      Left = 1
      Top = 121
      Width = 782
      Height = 375
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 1
      object pgcOpcoes: TPageControl
        Left = 1
        Top = 1
        Width = 780
        Height = 373
        ActivePage = tbsOpcoes
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
            Height = 314
            Cursor = crHSplit
          end
          object Panel1: TPanel
            Left = 0
            Top = 31
            Width = 345
            Height = 314
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
              Height = 147
              Align = alClient
              Caption = 'Panel4'
              TabOrder = 0
              object chklstPlano: TCheckListBox
                Left = 1
                Top = 23
                Width = 341
                Height = 123
                Hint = 'Planos Disponíveis para o Preparo da Folha de Benefícios'
                OnClickCheck = chklstPlanoClickCheck
                Align = alClient
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ItemHeight = 13
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
                object Image2: TImage
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
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -12
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ItemHeight = 13
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
                object Image1: TImage
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
            Width = 423
            Height = 314
            Align = alClient
            Caption = 'Panel3'
            TabOrder = 1
            object chklstBenef: TCheckListBox
              Left = 1
              Top = 23
              Width = 421
              Height = 290
              Hint = 'Benefícios disponiveis para o Preparo'
              Align = alClient
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ItemHeight = 13
              ParentFont = False
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
            end
            object PnlBeneficio: TPanel
              Left = 1
              Top = 1
              Width = 421
              Height = 22
              Align = alTop
              Alignment = taLeftJustify
              BevelInner = bvRaised
              BevelOuter = bvLowered
              Caption = '   Benefícios'
              TabOrder = 1
              object Image3: TImage
                Left = 402
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
                OnClick = chklstPlanoClickCheck
              end
            end
          end
          object Panel8: TPanel
            Left = 0
            Top = 0
            Width = 772
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
          end
        end
        object tbsIndividual: TTabSheet
          Caption = 'Individual'
          ImageIndex = 2
          inline frameBenef: TfrmFrameListaBenef
            Width = 772
            Height = 345
            Align = alClient
            inherited Panel3: TPanel
              Width = 772
              inherited Dock971: TDock97
                Width = 776
                inherited TB97oKCancelar: TToolbar97
                  inherited bbtnIncluiBenef: TBitBtn
                    Font.Height = -12
                  end
                  inherited bbtnIncluiLista: TBitBtn
                    Font.Height = -12
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
              Width = 772
              Height = 311
            end
          end
        end
        object tbsResultado: TTabSheet
          Caption = 'Resultado'
          object Panel7: TPanel
            Left = 0
            Top = 0
            Width = 778
            Height = 345
            Align = alClient
            Caption = 'Panel7'
            TabOrder = 0
            object PnlProgress: TPanel
              Left = 1
              Top = 231
              Width = 776
              Height = 113
              Align = alBottom
              BevelInner = bvRaised
              BorderStyle = bsSingle
              TabOrder = 0
              Visible = False
              object lblTitLote: TLabel
                Left = 4
                Top = 8
                Width = 747
                Height = 16
                Alignment = taCenter
                Anchors = [akLeft, akTop, akRight]
                AutoSize = False
                Caption = 'Processando os Cálculos'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -15
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object Mensagem: TLabel
                Left = 6
                Top = 56
                Width = 407
                Height = 13
                AutoSize = False
                Caption = 'Mensagem'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object lblPatro: TLabel
                Left = 3
                Top = 29
                Width = 748
                Height = 13
                Alignment = taCenter
                Anchors = [akLeft, akTop, akRight]
                AutoSize = False
                Caption = 'Patrocinadora'
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWhite
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = [fsBold]
                ParentFont = False
              end
              object lblContagem: TLabel
                Left = 6
                Top = 93
                Width = 741
                Height = 13
                Anchors = [akLeft, akTop, akRight]
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clNavy
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
              object ProgressBar1: TProgressBar
                Left = 8
                Top = 76
                Width = 740
                Height = 13
                Anchors = [akLeft, akTop, akRight]
                Min = 0
                Max = 100
                Step = 1
                TabOrder = 0
              end
            end
            object memResult: TMemo
              Left = 1
              Top = 1
              Width = 776
              Height = 230
              Align = alClient
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -12
              Font.Name = 'Courier New'
              Font.Style = []
              ParentFont = False
              ReadOnly = True
              TabOrder = 1
            end
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 497
    Width = 784
    inherited tb97Fundo: TToolbar97
      Left = 261
      DockPos = 467
      ParentFont = False
      inherited sep1: TToolbarSep97
        Left = 516
      end
      inherited sep3: TToolbarSep97
        Left = 228
      end
      object ToolbarSep972: TToolbarSep97 [2]
        Left = 0
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      object ToolbarSep973: TToolbarSep97 [3]
        Left = 432
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      object ToolbarSep974: TToolbarSep97 [4]
        Left = 348
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      object ToolbarSep975: TToolbarSep97 [5]
        Left = 120
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      inherited bbtnSair: TBitBtn
        Left = 351
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 435
      end
      object bbtnOutro: TBitBtn
        Left = 231
        Top = 0
        Width = 117
        Height = 33
        Caption = '&Processar Outro'
        TabOrder = 2
        Visible = False
        OnClick = bbtnOutroClick
        NumGlyphs = 2
        Spacing = 2
      end
      object bbtnPreparo: TBitBtn
        Left = 3
        Top = 0
        Width = 117
        Height = 33
        Caption = '&Processar'
        TabOrder = 3
        OnClick = bbtnPreparoClick
        Kind = bkOK
        Spacing = 2
      end
      object bbtnSavlar: TBitBtn
        Left = 123
        Top = 0
        Width = 105
        Height = 33
        Caption = 'S&alvar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        Visible = False
        OnClick = bbtnSalvarClick
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777770000000000007770330770000330777033077000033077703307700003
          30777033000000033077703333333333307770330000000330777030FFFFFFF0
          30777030FCCCCFF030777030FFCCCFF030777037FCCCCFF000777077CCCFCFF0
          8077777CCC777700007777CCC77777777777777C777777777777}
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 92
      DockPos = 187
      inherited bbtnConfirmar: TBitBtn
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 716
    Top = 107
    TargetsData = (
      1
      2
      (
        ''
        'Text'
        0)
      (
        ''
        'Filter'
        0))
  end
  object qryPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.IDPESSOA, P.NOME'
      'FROM PESSOA P, PATRO PT'
      'WHERE (PT.IDFUNDACAO = :IDFUNDACAO)'
      'AND (P.IDPESSOA = PT.IDPESSOA)'
      'ORDER BY P.NOME'
      ' ')
    ValidateWithMask = True
    Left = 35
    Top = 214
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object qryBenef: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '')
    ValidateWithMask = True
    Left = 738
    Top = 174
  end
  object qryPlano: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 35
    Top = 347
  end
  object qryAux2: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 466
    Top = 391
  end
  object SaveDlg: TSaveDialog
    DefaultExt = '.txt'
    Filter = 'Arquivos texto|*.txt|Todos os arquivos|*.*'
    InitialDir = 'c:\'
    Title = 'Salvar Relatório do Preparo de Benefícios'
    Left = 744
    Top = 107
  end
  object qryAuxReserva: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 154
    Top = 426
  end
  object qryPreparosAnt: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDLOTE,FLGIDATMP,IDPESSOA,CODPORTFORMA,FLGVOLTATMP,FLGIDA' +
        'INTERFACE,'
      
        '       FLGVOLTAINTERFACE,FLGEMITIUCC,DATAIDATMP,DATAVOLTATMP,DAT' +
        'AIDAINTERFACE,'
      
        '       DATAVOLTAINTERFA,DATAEMITIUCC,NUMREG,VLRTOTAL,MESREFERENC' +
        'IA,TIPO,'
      '       FLGPREPARADO,DATAPREPARO,DESCRICAO,FLGATRASODEVOL'
      'FROM   CTRLINTERFACE'
      'WHERE  MESREFERENCIA = :psMesReferencia'
      'AND    FLGPREPARADO = 1'
      'AND    TIPO = '#39'B'#39)
    ControlType.Strings = (
      'FLGIDATMP;CheckBox;1;0')
    PictureMasks.Strings = (
      
        'VLRTOTAL'#9'{{{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]#[#' +
        '][#]]],({{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]#[#][' +
        '#]]]),[-]{{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]#[#]' +
        '[#]]]}'#9'T'#9'T')
    ValidateWithMask = True
    Left = 685
    Top = 210
    ParamData = <
      item
        DataType = ftString
        Name = 'psMesReferencia'
        ParamType = ptUnknown
      end>
  end
  object dsPreparosAnt: TwwDataSource
    DataSet = qryPreparosAnt
    Left = 638
    Top = 186
  end
  object qryBeneficio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT BB.NUMEROPROCESSO,BB.IDTITULAR,BB.IDPESSOA,BPP.IDREGRACAL' +
        'CULO,'
      
        'BPP.IDREGRAPAGAMENTO,BB.CODPORTFORMA,BB.IDPLANOPREV,BB.IDPESSJUR' +
        ','
      
        'BB.IDBENEFICIO,BB.DATAINICIOFUND AS DATAINICIO,BB.DATAFINAL,PP.N' +
        'OME AS PLANO,'
      'BPP.IDREGRAREAJBENEF,BPP.INDICEREAJBENEF,BB.VALORATUAL,'
      'BB.SEQPROPOSTA,P.NOME,BPP.IDREGRACALCABONO,'
      'BPP.FLGABONOFINALBEN,BPP.FLGPOSSUIABONO,BB.ULTMESREAJUSTE,'
      
        'B.NOME AS BENEFICIO,TP.QTDEMESES,PPP.VALORINFINSS,BPP.MESREAJBEN' +
        'EF,'
      
        'BPP.IDREGRAPRIMPAGTO,BPP.FLGCALCTODOMES,PR.DTDIREITO,PR.DTEVENTO' +
        ','
      'PA.NOME AS PATROCINADORA,BPP.IDREGRABENEFICIA,BB.VALORCOTAS,'
      
        'B.FLGBENEFPROV,NVL(BB.VALORTOTAL,0) AS VALORTOTAL ,BPP.FLGREFERE' +
        'NCIA,'
      
        'BB.FONTEPAGADORA,BPP.IDRUBABONO,BPP.IDRUBANTECABONO,BPP.IDRUBABO' +
        'NOFIM,'
      'BB.ULTVALORBRUTO'
      'FROM   PESSOA P, (SELECT IDPESSOA,NOME FROM PESSOA PO,PATRO PT'
      'WHERE PO.IDPESSOA = PT.IDPESSOA) PA,'
      
        'TPPAGTOBENEFICIO TPB, TPPERIODICIDADE TP, BENEFICIO B, PLANPREV ' +
        'PP,'
      
        'BENEFPLANPREV BPP, PROCESSOBENEF PR, BENEFBFCIARIO BB, PARTPREVP' +
        'LAN PPP'
      'WHERE  (BB.IDSITBENEFICIO       =  1)'
      
        'AND    (BB.DATAINICIOFUND <= LAST_DAY(TO_DATE(:mesref,'#39'YYYY/MM'#39')' +
        '))'
      'AND    (((BB.DATAFINAL          >= TO_DATE(:mesref,'#39'YYYY/MM'#39')))'
      'OR      (BB.DATAFINAL          IS NULL))'
      'AND    (BB.FLGFORMAPAGTO        = '#39'F'#39')'
      'AND    (TPB.FLGFREQUENCIA <> '#39'U'#39')'
      'AND    (BB.IDPLANOPREV IN (:StrPlano))'
      'AND    (BB.IDBENEFICIO = :Benef)'
      'AND    (BB.IDPESSJUR = :Patro)'
      'AND    (PA.IDPESSOA             = BB.IDPESSJUR)'
      'AND    (PP.IDPLANOPREV          = BB.IDPLANOPREV)'
      'AND    (P.IDPESSOA              = BB.IDPESSOA)'
      'AND    (B.IDBENEFICIO           = BB.IDBENEFICIO)'
      'AND    (BPP.IDBENEFICIO         = BB.IDBENEFICIO)'
      'AND    (BPP.IDPLANOPREV         = BB.IDPLANOPREV)'
      'AND    (PPP.IDPESSOA            = BB.IDTITULAR)'
      'AND    (PPP.IDPLANOPREV         = BB.IDPLANOPREV)'
      'AND    (PPP.IDPESSJUR           = BB.IDPESSJUR)'
      'AND    (PR.NUMEROPROCESSO       = BB.NUMEROPROCESSO)'
      'AND    (TPB.IDTPPAGTOBENEFIC    = BB.IDTPPAGTOBENEFIC)'
      'AND    (TP.IDTPPERIODICIDADE(+) = TPB.IDTPPERIODICIDADE)'
      'ORDER BY BB.IDPESSJUR,BB.IDPLANOPREV,BB.IDBENEFICIO,BB.IDTITULAR'
      ' ')
    ValidateWithMask = True
    Left = 32
    Top = 425
    ParamData = <
      item
        DataType = ftString
        Name = 'mesref'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'mesref'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'StrPlano'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'Benef'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'Patro'
        ParamType = ptUnknown
      end>
  end
  object qryUpdUltPgto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE BENEFBFCIARIO BB'
      'SET    BB.IDSITBENEFICIO = :IDSITBENEFICIO,'
      '       BB.VALORATUAL = :VALORATUAL'
      'WHERE  (BB.IDTITULAR      = :IdTitular)'
      'AND    (BB.NUMEROPROCESSO = :NumeroProcesso)'
      'AND    (BB.SEQPROPOSTA    = :SeqProposta)'
      'AND    (BB.IDPESSJUR      = :IdPessJur)'
      'AND    (BB.IDPLANOPREV    = :IdPlanoPrev)'
      'AND    (BB.IDBENEFICIO    = :IdBeneficio)'
      'AND    (BB.IDPESSOA       = :IdPessoa)'
      ' ')
    ValidateWithMask = True
    Left = 386
    Top = 13
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDSITBENEFICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'VALORATUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IdTitular'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'NumeroProcesso'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SeqProposta'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IdPessJur'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IdPlanoPrev'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IdBeneficio'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IdPessoa'
        ParamType = ptUnknown
      end>
  end
  object qryUpdBenefBfciario: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE BENEFBFCIARIO'
      
        'SET ULTMESPREPARO = :pULTMESPREPARO, ULTVALORBRUTO = :pULTVALORA' +
        'TUAL'
      'WHERE (IDPLANOPREV = :pIDPLANOPREV)'
      'AND (IDPLANOORIGEM = :pIDPLANOORIGEM)'
      'AND (IDPESSJUR = :pIDPESSJUR)'
      'AND (IDTITULAR = :pIDTITULAR)'
      'AND (IDBENEFICIO = :pIDBENEFICIO)'
      'AND (NUMEROPROCESSO = :pNUMEROPROCESSO)'
      'AND (IDPESSOA = :pIDPESSOA)'
      'AND (SEQPROPOSTA = :pSEQPROPOSTA)'
      ''
      ' ')
    ValidateWithMask = True
    Left = 124
    Top = 261
    ParamData = <
      item
        DataType = ftString
        Name = 'pULTMESPREPARO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pULTVALORATUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDPLANOORIGEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDBENEFICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pNUMEROPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pSEQPROPOSTA'
        ParamType = ptUnknown
      end>
  end
  object qryInsHstBfciario: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO HSTBENEFBFCIARIO'
      
        ' (IDTITULAR, IDPESSOA, IDPESSJUR, MES,MESREFERENCIA, IDMOTIVO, I' +
        'DPLANOPREV,'
      
        '  NUMEROPROCESSO, SEQPROPOSTA, IDBENEFICIO, IDREGRACALCULO, VALO' +
        'RPREV,'
      
        '  VALORCALCULADO, DATAPAGAMENTO, IDLOTE, FLGENVIADO,FONTEPAGADOR' +
        'A,SEQBENEFICIO,'
      
        '  CODPORTFORMA,VALORINTEGRAL, VALORTOTAL, VALORSRB, FLGDESCIRMES' +
        ', FLGPROVISORIO,'
      '  VALOROP1, VALOROP2, VALOROP3, FLGDEVOLUCAO)'
      'VALUES'
      
        ' (:pIdTitular,:pIdPessoa,:pIdPessJur,:pMesPag,:pMesRef,:pIdMotiv' +
        'o,:pIdPlanoPrev,'
      
        '  :pNumeroProcesso,:pSeqProposta,:pIdBeneficio,:pIdRegraCalculo,' +
        ':pVALORPREV,'
      
        '  :pVALORCALCULADO,:pDATAPAGAMENTO,:pIdLote, :flgenviado, :iFont' +
        'ePagadora,:SeqBeneficio,'
      
        '  :pCODPORTFORMA,:pVALORINTEGRAL,:pValorTotal, :pValorSRB, :pflg' +
        'descirmes, :pFlgprovisorio,'
      '  :pVALOROP1, :pVALOROP2, :pVALOROP3, :PFLGDEVOLUCAO)'
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 563
    Top = 333
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pIdTitular'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIdPessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIdPessJur'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pMesPag'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pMesRef'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIdMotivo'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIdPlanoPrev'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pNumeroProcesso'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pSeqProposta'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIdBeneficio'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIdRegraCalculo'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pVALORPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pVALORCALCULADO'
        ParamType = ptUnknown
      end
      item
        DataType = ftDateTime
        Name = 'pDATAPAGAMENTO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIdLote'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'flgenviado'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'iFontePagadora'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'SeqBeneficio'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pCODPORTFORMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pVALORINTEGRAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pValorTotal'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pValorSRB'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pflgdescirmes'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pFlgprovisorio'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pVALOROP1'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pVALOROP2'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pVALOROP3'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PFLGDEVOLUCAO'
        ParamType = ptUnknown
      end>
  end
  object qryBenefBfciario: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT   H.IDPESSJUR,H.IDTITULAR,H.MES,H.MESREFERENCIA,H.IDPLANO' +
        'PREV,'
      
        '         H.IDMOTIVO,H.VALORCALCULADO,H.VALORPREV,H.NUMEROPROCESS' +
        'O,'
      '         H.IDBENEFICIO,H.IDPESSOA'
      'FROM     HSTBENEFBFCIARIO H'
      'WHERE    (H.NUMEROPROCESSO = :pNumeroProcesso)'
      'AND      (H.SEQPROPOSTA    = :pSeqProposta)'
      'AND      (H.IDTITULAR      = :pIdTitular)'
      'AND      (H.IDPESSOA       = :pIdPessoa)'
      'AND      (H.IDPLANOPREV    = :pIdPlanoPrev)'
      'AND      (H.IDPESSJUR      = :pIdPessJur)'
      'AND      (H.IDBENEFICIO    = :pIdBeneficio)'
      'ORDER BY H.MES DESC'
      ' ')
    ValidateWithMask = True
    Left = 93
    Top = 425
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pNumeroProcesso'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pSeqProposta'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIdTitular'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIdPessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIdPlanoPrev'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIdPessJur'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIdBeneficio'
        ParamType = ptUnknown
      end>
  end
  object qryUltPgto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT BBF.IDPESSOA, BBF.DATAINICIOFUND AS DATAINICIO, BBF.DATAF' +
        'INAL,'
      
        '       BBF.VALORATUAL, BPP.IDREGRAPRIMPAGTO, BPP.IDREGRAULTPAGTO' +
        ','
      
        '       BBF.NUMEROPROCESSO, BBF.SEQPROPOSTA, BBF.IDSITBENEFICIO, ' +
        'PES.NOME, '
      '       BPP.IDBENEFICIO, BNF.FLGBENEFPROV'
      
        'FROM BENEFBFCIARIO BBF, BENEFPLANPREV BPP, PESSOA PES, BENEFICIO' +
        ' BNF'
      'WHERE (BBF.IDTITULAR = :IDTITULAR)'
      'AND (BBF.NUMEROPROCESSO = :NUMEROPROCESSO)'
      'AND (BBF.IDPESSJUR = :IDPESSJUR)'
      'AND (BBF.IDPLANOPREV = :IDPLANOPREV)'
      'AND (BBF.SEQPROPOSTA = :SEQPROPOSTA)'
      'AND (BBF.IDBENEFICIO = :IDBENEFICIO)'
      'AND (BPP.IDBENEFICIO = BBF.IDBENEFICIO)'
      'AND (BPP.IDPLANOPREV = BBF.IDPLANOPREV)'
      'AND (BBF.IDBENEFICIO = BNF.IDBENEFICIO)'
      'AND (PES.IDPESSOA    = BBF.IDPESSOA)'
      '')
    ValidateWithMask = True
    Left = 255
    Top = 341
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'NUMEROPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDBENEFICIO'
        ParamType = ptUnknown
      end>
  end
  object qryUpdHstBfciario: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'update HSTBENEFBFCIARIO'
      'set VALORPREV = :VALORPREV'
      'where IDPESSJUR = :IDPESSJUR'
      'and IDPLANOPREV = :IDPLANOPREV'
      'and IDBENEFICIO = :IDBENEFICIO'
      'and IDMOTIVO = :IDMOTIVO'
      'and NUMEROPROCESSO = :NUMEROPROCESSO'
      'and SEQPROPOSTA = :SEQPROPOSTA'
      'and SEQBENEFICIO = :SEQBENEFICIO'
      'and IDTITULAR = :IDTITULAR'
      'and IDPESSOA = :IDPESSOA'
      'and MES = :MES'
      'and MESREFERENCIA = :MESREFERENCIA'
      ''
      ' ')
    ValidateWithMask = True
    Left = 495
    Top = 13
    ParamData = <
      item
        DataType = ftFloat
        Name = 'VALORPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDBENEFICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDMOTIVO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'NUMEROPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SEQBENEFICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MES'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MESREFERENCIA'
        ParamType = ptUnknown
      end>
  end
  object qryReajBeneficio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      'IDPLANOPREV,    '
      'IDBENEFICIO,    '
      'MESREAJ,        '
      'IDRGREAJ'
      'FROM '
      'REAJBENEFICIO'
      'WHERE IDPLANOPREV = :idplanoprev'
      'AND   IDBENEFICIO = :idbeneficio'
      'AND   MESREAJ     = :mesref ')
    ValidateWithMask = True
    Left = 415
    Top = 281
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idplanoprev'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'idbeneficio'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'mesref'
        ParamType = ptUnknown
      end>
  end
  object qryReajuste: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPLANOPREV, IDBENEFICIO, MESREAJ, IDRGREAJ '
      'FROM REAJBENEFICIO'
      'WHERE MESREAJ = :mesreaj')
    ValidateWithMask = True
    Left = 445
    Top = 281
    ParamData = <
      item
        DataType = ftString
        Name = 'mesreaj'
        ParamType = ptUnknown
      end>
  end
  object qryReajINSS: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MESREAJ,        '
      'IDRGREAJ FROM REAJINSS'
      'WHERE MESREAJ = :mesreaj')
    ValidateWithMask = True
    Left = 385
    Top = 281
    ParamData = <
      item
        DataType = ftString
        Name = 'mesreaj'
        ParamType = ptUnknown
      end>
  end
  object qryContribAssistido1: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 476
    Top = 235
  end
  object qryAntecipacaoAbono: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDTITULAR, IDPESSOA, IDPESSJUR, MES, MESREFERENCIA, IDMOT' +
        'IVO,'
      '       IDPLANOPREV, IDBENEFICIO, VALORPREV, VALORCALCULADO'
      'FROM   BENEFBFCIARIO BF,  HSTBENEFBFCIARIO HSTBF'
      'WHERE  HSTBF.IDMOTIVO                  =  :prmIdMotivoAbono'
      'AND    BF.SITBENEFICIO                 =  1'
      'AND    SUBSTR(HSTBF.MESREFERENCIA,1,4) =  :AnoCorrente'
      'AND    SUBSTR(HSTBF.MES,6,2)           <> 12'
      'AND    BF.IDPESSOA                     = HSTBF.IDPESSOA'
      'AND    BF.IDBENEFICIO                  = HSTBF.IDBENEFICIO')
    ValidateWithMask = True
    Left = 123
    Top = 425
    ParamData = <
      item
        DataType = ftInteger
        Name = 'prmIdMotivoAbono'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'AnoCorrente'
        ParamType = ptUnknown
      end>
  end
  object qryRetidos: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 183
    Top = 426
  end
  object qryPreparoContrib: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 415
    Top = 235
  end
  object qryUpdBenefbfciarioAbono: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE BENEFBFCIARIO'
      'SET  VALORABONO13      = :pULTVALORATUAL'
      'WHERE  (IDPLANOPREV      = :pIDPLANOPREV)'
      'AND    (IDPLANOORIGEM = :pIDPLANOORIGEM)'
      'AND    (IDPESSJUR        = :pIDPESSJUR)'
      'AND    (IDTITULAR        = :pIDTITULAR)'
      'AND    (IDBENEFICIO      = :pIDBENEFICIO)'
      'AND    (NUMEROPROCESSO   = :pNUMEROPROCESSO)'
      'AND    (IDPESSOA         = :pIDPESSOA)'
      'AND    (SEQPROPOSTA      = :pSEQPROPOSTA)'
      '')
    ValidateWithMask = True
    Left = 265
    Top = 253
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pULTVALORATUAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDPLANOORIGEM'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDBENEFICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pNUMEROPROCESSO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pSEQPROPOSTA'
        ParamType = ptUnknown
      end>
  end
  object regPreparoContrib: TRegra
    QueryIn = qryPreparoContrib
    DatabaseName = 'BaseDados'
    IdCalculo = 0
    IdEmpresa = -1
    ExibeMensagens = False
    Left = 687
    Top = 107
  end
  object qryTitularGrupo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT BB.IDTITULAR'
      'FROM BENEFBFCIARIO BB, TPPAGTOBENEFICIO TPB'
      'WHERE (BB.IDSITBENEFICIO in (1,2))'
      'AND ('
      '      ('
      
        '        ( (BB.FLGDATAPREVISTA = 0) OR (BB.FLGDATAPREVISTA IS NUL' +
        'L) )'
      '        AND'
      '        (BB.DATAFINAL >= TO_DATE(:MESREF || '#39'/01'#39','#39'YYYY/MM/DD'#39'))'
      '        AND'
      '        (BB.DATAFINAL <= LAST_DAY(TO_DATE(:MESREF,'#39'YYYY/MM'#39')))'
      '      )'
      '      OR'
      '      ( (BB.FLGDATAPREVISTA = 1)'
      '        AND'
      
        '        (BB.DATAFINALPREVISTA >= TO_DATE(:MESREF || '#39'/01'#39','#39'YYYY/' +
        'MM/DD'#39'))'
      '        AND'
      
        '        (BB.DATAFINALPREVISTA <= LAST_DAY(TO_DATE(:MESREF, '#39'YYYY' +
        '/MM'#39')))'
      '      )'
      '    )'
      'AND (BB.FLGFORMAPAGTO = '#39'F'#39')                        '
      'AND (TPB.FLGFREQUENCIA <> '#39'U'#39')            '
      'AND (TPB.IDTPPAGTOBENEFIC = BB.IDTPPAGTOBENEFIC)  ')
    ValidateWithMask = True
    Left = 63
    Top = 425
    ParamData = <
      item
        DataType = ftString
        Name = 'MESREF'
        ParamType = ptUnknown
        Value = '1999/12'
      end
      item
        DataType = ftString
        Name = 'MESREF'
        ParamType = ptUnknown
        Value = '1999/12'
      end
      item
        DataType = ftString
        Name = 'MESREF'
        ParamType = ptUnknown
        Value = '1999/12'
      end
      item
        DataType = ftString
        Name = 'MESREF'
        ParamType = ptUnknown
        Value = '1999/12'
      end>
  end
  object QryPrinc: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 594
    Top = 333
  end
  object qryBeneficioAnterior: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT BF.IDPESSJUR, BF.IDTITULAR, BF.IDPESSOA, BF.DATAINICIOFUN' +
        'D AS DATAINICIO, BF.DATAFINAL,'
      
        '       BF.IDSITBENEFICIO, BF.IDBENEFICIO, BF.VALORATUAL, BF.VALO' +
        'RTOTAL,'
      
        '       BF.NUMEROPROCESSO, P.DTEVENTO, BF.ULTMESREAJUSTE, B.IDTPP' +
        'AGTOBENEFIC,'
      '       BF.FLGBENEFMIN'
      'FROM BENEFBFCIARIO BF, PROCESSOBENEF P, BENEFICIO B'
      'WHERE BF.IDTITULAR = :IDTITULAR'
      'AND BF.IDPLANOPREV = :IDPLANOPREV'
      'AND BF.IDPESSJUR = :IDPESSJUR'
      'AND (   BF.DATAFINAL = TO_DATE(:DATAFINAL, '#39'DD/MM/YYYY'#39')'
      '     OR BF.DATAFINAL+1 = TO_DATE(:DATAFINAL, '#39'DD/MM/YYYY'#39'))'
      'AND P.NUMEROPROCESSO = BF.NUMEROPROCESSO'
      'AND B.IDBENEFICIO = BF.IDBENEFICIO'
      'AND B.NUMORDEMEVENTO = 1'
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 533
    Top = 333
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAFINAL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'DATAFINAL'
        ParamType = ptUnknown
      end>
  end
  object qryprocreajuste1: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '')
    ValidateWithMask = True
    Left = 415
    Top = 189
  end
  object qryproccargoext1: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '')
    ValidateWithMask = True
    Left = 386
    Top = 189
  end
  object qryContribIndividual: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CPP.IDCONTRIBUICAO,'
      '       CP.IDCONTRIBPAI, CP.IDCONTRIBPAI2, CP.IDCONTRIBPAI3,'
      '       CPP.VALORBASE1, CPP.VALORBASE2, CPP.VALORBASE3,'
      '       CP.IDREGRACALCULO, CP.IDREGRAULTPAGTO,'
      '       CP.IDREGRACALCULO13, CP.IDREGRAULTPGTO13,'
      '       CP.PERCCALCULO, C.NOME'
      'FROM CONTRIBPREVPARTP CPP, CONTPREV CP, CONTRIBUICAO C'
      'WHERE (CPP.IDPESSOA = :PIDPESSOA)'
      'AND (CPP.IDPESSJUR = :PIDPESSJUR)'
      'AND (CPP.IDPLANOPREV = :PIDPLANOPREV)'
      'AND (CPP.ULTMESPREPARO < :PMESREF OR CPP.ULTMESPREPARO IS NULL)'
      'AND (CPP.SEQPROPOSTA = 1)'
      'AND (CPP.FLGCOBRA = 1)'
      'AND (CPP.FLGDESCFOLHA = 1)'
      'AND (CP.IDPLANOPREV = CPP.IDPLANOPREV)'
      'AND (CP.IDCONTRIBUICAO = CPP.IDCONTRIBUICAO)'
      'AND (CP.FLGINTERNO = '#39'AS'#39')'
      'AND (C.IDCONTRIBUICAO = CP.IDCONTRIBUICAO)'
      'ORDER BY CP.ORDEMCALCULO'
      ''
      ' ')
    ValidateWithMask = True
    Left = 445
    Top = 235
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PMESREF'
        ParamType = ptUnknown
      end>
  end
  object qryContaContrib: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT DECODE(CPPAT.IDPESSJUR,         NULL, 0,                 ' +
        '      CPPAT.IDPESSJUR)         IDPESSJUR,'
      '       CPREV.IDPLANOPREV,'
      '       CPREV.IDCONTRIBUICAO,'
      
        '       DECODE(CPPAT.PLACONTAC,         NULL, CPREV.PLACONTAC,   ' +
        '      CPPAT.PLACONTAC)         PLACONTAC,'
      
        '       DECODE(CPPAT.CODCENTROCUSTOC,   NULL, CPREV.CODCENTROCUST' +
        'OC,   CPPAT.CODCENTROCUSTOC)   CODCENTROCUSTOC,'
      
        '       DECODE(CPPAT.UNIDNEGOC,         NULL, CPREV.UNIDNEGOC,   ' +
        '      CPPAT.UNIDNEGOC)         UNIDNEGOC,'
      
        '       DECODE(CPPAT.CODCENTRORESPON,   NULL, CPREV.CODCENTRORESP' +
        'ON,   CPPAT.CODCENTRORESPON)   CODCENTRORESPON,'
      
        '       DECODE(CPPAT.CODSUBCONTA,       NULL, CPREV.CODSUBCONTA, ' +
        '      CPPAT.CODSUBCONTA)       CODSUBCONTA,'
      
        '       DECODE(CPPAT.PLACONTAC13,       NULL, CPREV.PLACONTAC13, ' +
        '      CPPAT.PLACONTAC13)       PLACONTAC13,'
      
        '       DECODE(CPPAT.CODCENTROCUSTOC13, NULL, CPREV.CODCENTROCUST' +
        'OC13, CPPAT.CODCENTROCUSTOC13) CODCENTROCUSTOC13,'
      
        '       DECODE(CPPAT.UNIDNEGOC13,       NULL, CPREV.UNIDNEGOC13, ' +
        '      CPPAT.UNIDNEGOC13)       UNIDNEGOC13,'
      
        '       DECODE(CPPAT.CODCENTRORESPON13, NULL, CPREV.CODCENTRORESP' +
        'ON13, CPPAT.CODCENTRORESPON13) CODCENTRORESPON13,'
      
        '       DECODE(CPPAT.CODSUBCONTA13,     NULL, CPREV.CODSUBCONTA13' +
        ',     CPPAT.CODSUBCONTA13)     CODSUBCONTA13,'
      
        '       DECODE(CPPAT.CODTIPDESEMBCAR,   NULL, CPREV.CODTIPDESEMBC' +
        'AR,   CPPAT.CODTIPDESEMBCAR)   CODTIPDESEMBCAR,'
      
        '       DECODE(CPPAT.RECPAGDEVOL,       NULL, CPREV.RECPAGDEVOL, ' +
        '      CPPAT.RECPAGDEVOL)       RECPAGDEVOL'
      'FROM CONTPLANPATRO CPPAT, CONTPREV CPREV'
      'WHERE CPPAT.IDPLANOPREV(+) = CPREV.IDPLANOPREV'
      'AND CPPAT.IDCONTRIBUICAO(+) = CPREV.IDCONTRIBUICAO'
      'AND CPREV.FLGINTERNO = '#39'AS'#39
      'AND CPREV.FLGPAGADOR = '#39'C'#39
      'ORDER BY IDPESSJUR, CPREV.IDPLANOPREV, CPREV.IDCONTRIBUICAO'
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 385
    Top = 235
  end
  object qryCtrlInterface: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDLOTE, DATAPAGAMENTO, DATAPREPARO, VLRTOTAL, NUMREG, MES' +
        'REFERENCIA,'
      
        '       DESCRICAO, SUBSTR(MESREFERENCIA,6,2)||'#39'/'#39'||SUBSTR(MESREFE' +
        'RENCIA,1,4) AS MESREF '
      'FROM CTRLINTERFACE'
      'WHERE (FLGPREPARADO = 0 OR FLGPREPARADO IS NULL)'
      'AND (TIPO = '#39'B'#39')'
      'AND (IDREFERENCIA IS NULL)'
      'AND (FLGVOLTATMP = 0 OR FLGVOLTATMP IS NULL)  '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 144
    Top = 16
  end
  object dsCtrlinterface: TDataSource
    DataSet = qryCtrlInterface
    Left = 174
    Top = 16
  end
  object qryGravasalauxdoenca: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'update partprevplan'
      'set salauxdoenca  = :valorsalario,'
      '    MesUltReajSal = :MesRef'
      'where'
      '     IDPESSJUR = :PIDPESSJUR AND'
      '     IDPESSOA  = :PIDPESSOA  AND'
      '     IDPLANOPREV = :PIDPLANOPREV AND'
      '     SEQPROPOSTA = 1'
      ' ')
    ValidateWithMask = True
    Left = 706
    Top = 279
    ParamData = <
      item
        DataType = ftFloat
        Name = 'valorsalario'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'MesRef'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object qryValorNucleo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT SUM(H.VALORPREV) AS VALORPREV, SUM(H.VALORINTEGRAL) AS VA' +
        'LORINTEGRAL'
      'FROM HSTBENEFBFCIARIO H, BFCIARIOTITPLAN BFC, NUCLEOFAMILIAR NF,'
      '     BENEFPLANPREV B, PATRO PT'
      'WHERE H.IDLOTE = :PIDLOTE'
      'AND H.IDPESSJUR = :PIDPESSJUR'
      'AND H.IDPLANOPREV = :PIDPLANOPREV'
      'AND H.IDPLANOPREV = BFC.IDPLANOPREV'
      'AND H.IDTITULAR = BFC.IDTITULAR'
      'AND H.IDPESSOA = BFC.IDPESSOA'
      'AND H.IDBENEFICIO = BFC.IDBENEFICIO'
      'AND B.IDBENEFICIO = H.IDBENEFICIO'
      'AND B.IDPLANOPREV = H.IDPLANOPREV'
      'AND B.FLGREFERENCIA = 0'
      'AND BFC.IDNUCLEOFAMILIAR = NF.IDNUCLEOFAMILIAR'
      'AND NF.IDRESPNUCLEO = :PIDRESPNUCLEO'
      'AND PT.IDPESSOA = H.IDPESSJUR'
      'AND PT.IDFUNDACAO = :PIDFUNDACAO'
      'AND H.IDMOTIVO = :PIDMOTIVO')
    ValidateWithMask = True
    Left = 693
    Top = 363
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDLOTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDPLANOPREV'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDRESPNUCLEO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDFUNDACAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDMOTIVO'
        ParamType = ptUnknown
      end>
  end
  object qryContribNucleo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CPN.IDCONTRIBUICAO,'
      '       CTP.IDCONTRIBPAI, CTP.IDCONTRIBPAI2, CTP.IDCONTRIBPAI3,'
      '       0 AS VALORBASE1, 0 AS VALORBASE2, 0 AS VALORBASE3,'
      '       CTP.IDREGRACALCULO, CTP.IDREGRAULTPAGTO,'
      '       CTP.IDREGRACALCULO13, CTP.IDREGRAULTPGTO13,'
      '       CPN.DATAINICIO, CPN.DATAFINAL,'
      
        '       BFC.IDPESSJUR, BFC.IDPLANOPREV, BFC.IDBENEFICIO, BFC.IDTI' +
        'TULAR,'
      
        '       CTP.PERCCALCULO, CTP.FLGCOBRADECTERC, CON.NOME ,CTP.FLGPA' +
        'GADOR'
      
        'FROM BFCIARIOTITPLAN BFC, CONTRIBPREVNUCLEO CPN, NUCLEOFAMILIAR ' +
        'NF,'
      '     CONTPREV CTP, CONTRIBUICAO CON, PATRO PT'
      'WHERE BFC.IDPLANOPREV = :PIDPLANO'
      'AND BFC.IDTITULAR = :PIDTITULAR'
      'AND BFC.IDPESSOA = :PIDPESSOA'
      'AND BFC.IDBENEFICIO = :PIDBENEFICIO'
      'AND NF.IDRESPNUCLEO = BFC.IDRESPONSAVEL'
      'AND BFC.IDNUCLEOFAMILIAR = NF.IDNUCLEOFAMILIAR'
      'AND BFC.IDNUCLEOFAMILIAR = CPN.IDNUCLEOFAMILIAR'
      'AND CPN.ULTMESPREPARO < :PULTMESPREPARO'
      'AND CPN.IDCONTRIBUICAO = CTP.IDCONTRIBUICAO'
      'AND CPN.FLGCOBRA = 1'
      'AND BFC.IDPLANOPREV = CTP.IDPLANOPREV'
      'AND CPN.IDCONTRIBUICAO = CON.IDCONTRIBUICAO'
      'AND PT.IDPESSOA = BFC.IDPESSJUR'
      'AND PT.IDFUNDACAO = :PIDFUNDACAO'
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 725
    Top = 363
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIdPlano'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIdTitular'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIdBeneficio'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'pUltMespreparo'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'PIDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object qryPercentual: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PERCENTUAL'
      'FROM BFCIARIOTITPLAN'
      'WHERE (IDTITULAR = :pIdTitular)'
      'AND (IDPESSJUR = :pIdPessJur)'
      'AND (IDPLANOPREV = :pIdPlanoPrev)'
      'AND (IDPESSOA = :pIdPessoa)'
      'AND (IDBENEFICIO = :pIdBeneficio)')
    ValidateWithMask = True
    Left = 363
    Top = 423
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIdTitular'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIdPessJur'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIdPlanoPrev'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIdPessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIdBeneficio'
        ParamType = ptUnknown
      end>
  end
  object qryPercAnterior: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT PERCENTUAL'
      'FROM BFCIARIOTITPLAN BF, BENEFPLANPREV BP, PARTPREVPLAN PP'
      'WHERE BF.IDTITULAR = :pIdTitular'
      'AND BF.IDPESSJUR = :pIdPessJur'
      'AND BF.IDPESSOA = :pIdPessoa'
      'AND BF.IDBENEFICIO = BP.IDBENEFICIO'
      'AND BF.IDPLANOPREV = BP.IDPLANOPREV'
      'AND BP.FLGREFERENCIA = 0'
      'AND BF.IDPLANOPREV = PP.IDPLANOPREV'
      'AND BF.IDTITULAR = PP.IDPESSOA'
      'AND BF.IDPESSJUR = PP.IDPESSJUR'
      'AND PP.FLGDESATIVADO = 1')
    ValidateWithMask = True
    Left = 275
    Top = 423
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIdTitular'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIdPessJur'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIdPessoa'
        ParamType = ptUnknown
      end>
  end
  object qryaux3: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 530
    Top = 391
  end
  object qryAux4: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 463
    Top = 444
  end
  object qryAux5: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 527
    Top = 444
  end
  object qryBeneficiario: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT COUNT(DISTINCT IDPESSOA)'
      'FROM BENEFBFCIARIO'
      'WHERE (IDTITULAR = :pIDTITULAR)'
      'AND IDSITBENEFICIO IN (1,2)')
    ValidateWithMask = True
    Left = 219
    Top = 195
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pIDTITULAR'
        ParamType = ptUnknown
      end>
  end
  object qryAux6: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 647
    Top = 444
  end
  object QryVerifica: TQuery
    DatabaseName = 'BaseDados'
    Left = 302
    Top = 154
  end
  object QryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 118
    Top = 178
  end
end
