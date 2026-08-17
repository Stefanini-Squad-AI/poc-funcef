inherited frmParamRelTxtCCheque: TfrmParamRelTxtCCheque
  Left = 418
  Top = 71
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsToolWindow
  Caption = 'Demonstrativo de Pagamento'
  ClientHeight = 518
  ClientWidth = 482
  Font.Style = []
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  object townTipoImpressaoFuncef: TToolWindow97 [0]
    Left = 6
    Top = 155
    Caption = 'Tipo de Contracheque Desejado'
    CloseButton = False
    ClientAreaHeight = 212
    ClientAreaWidth = 463
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -9
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    Resizable = False
    TabOrder = 2
    Visible = False
    object btnFecharTipoCCheque: TBitBtn
      Left = 182
      Top = 174
      Width = 99
      Height = 30
      Caption = ' &Fechar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      OnClick = btnFecharTipoCChequeClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777000007
        7777777700919190077777789919191910777789919191919107778918F919F8
        190778919FFF9FFF9190789919FFFFF919107891919FFF919190789919FFFFF9
        191078919FFF9FFF9190778918F919F819077789919191919107777899191919
        1077777788999998877777777788888777777777777777777777}
      Spacing = 2
    end
    object rgTipoImpressaoFuncef: TRadioGroup
      Left = 10
      Top = 7
      Width = 444
      Height = 41
      Hint = 'Imprime Cabeçalho com o Nome e Endereço da Empresa?'
      Caption = 'Escolha o Tipo'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Impressão Direta Frente e Verso'
        'Arquivo Texto para Xerox')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = rgTipoImpressaoFuncefClick
    end
    object gbxFiguras: TGroupBox
      Left = 10
      Top = 56
      Width = 444
      Height = 111
      Caption = 'Figuras para o Verso do Contracheque'
      TabOrder = 2
      object Label1: TLabel
        Left = 8
        Top = 20
        Width = 6
        Height = 13
        Caption = '1'
      end
      object Label2: TLabel
        Left = 8
        Top = 50
        Width = 6
        Height = 13
        Caption = '2'
      end
      object Label3: TLabel
        Left = 8
        Top = 80
        Width = 6
        Height = 13
        Caption = '3'
      end
      object edFigura1: TEdit
        Left = 20
        Top = 18
        Width = 385
        Height = 21
        Hint = 'Arquivo imagem da figura 1'
        TabStop = False
        Color = clInfoBk
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 0
      end
      object bbtnFigura1: TBitBtn
        Left = 409
        Top = 15
        Width = 27
        Height = 26
        Hint = 'Localizar a Imagem Associada à figura 1'
        Default = True
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = bbtnFigura1Click
        Glyph.Data = {
          66010000424D6601000000000000760000002800000013000000140000000100
          040000000000F000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          888888800000888888888888888888800000888008888888888888800000880F
          108888888888888000008809F108888888888880000088809F00888888888880
          0000888809F0000788888880000088888090FFF0788888800000887000088888
          00888880000088007B0F8F8F0B0888800000880F0708F8F8070888800000880B
          0B708F807B7088800000880F70B70007B7B088800000880BF07B7B7B7B7B0880
          0000880FBF0007B7B7B708800000880BFBFBF000000088800000880FBFBFBFBF
          B088888000008870000000000788888000008888888888888888888000008888
          88888888888888800000}
        Spacing = 2
      end
      object edFigura2: TEdit
        Left = 20
        Top = 48
        Width = 385
        Height = 21
        Hint = 'Arquivo imagem da figura 2'
        TabStop = False
        Color = clInfoBk
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 2
      end
      object bbtnFigura2: TBitBtn
        Left = 409
        Top = 46
        Width = 27
        Height = 26
        Hint = 'Localizar a Imagem Associada à figura 2'
        Default = True
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = bbtnFigura2Click
        Glyph.Data = {
          66010000424D6601000000000000760000002800000013000000140000000100
          040000000000F000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          888888800000888888888888888888800000888008888888888888800000880F
          108888888888888000008809F108888888888880000088809F00888888888880
          0000888809F0000788888880000088888090FFF0788888800000887000088888
          00888880000088007B0F8F8F0B0888800000880F0708F8F8070888800000880B
          0B708F807B7088800000880F70B70007B7B088800000880BF07B7B7B7B7B0880
          0000880FBF0007B7B7B708800000880BFBFBF000000088800000880FBFBFBFBF
          B088888000008870000000000788888000008888888888888888888000008888
          88888888888888800000}
        Spacing = 2
      end
      object edFigura3: TEdit
        Left = 20
        Top = 78
        Width = 385
        Height = 21
        Hint = 'Arquivo imagem da figura 3'
        TabStop = False
        Color = clInfoBk
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 4
      end
      object bbtnFigura3: TBitBtn
        Left = 409
        Top = 75
        Width = 27
        Height = 26
        Hint = 'Localizar a Imagem Associada à figura 3'
        Default = True
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        OnClick = bbtnFigura3Click
        Glyph.Data = {
          66010000424D6601000000000000760000002800000013000000140000000100
          040000000000F000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          888888800000888888888888888888800000888008888888888888800000880F
          108888888888888000008809F108888888888880000088809F00888888888880
          0000888809F0000788888880000088888090FFF0788888800000887000088888
          00888880000088007B0F8F8F0B0888800000880F0708F8F8070888800000880B
          0B708F807B7088800000880F70B70007B7B088800000880BF07B7B7B7B7B0880
          0000880FBF0007B7B7B708800000880BFBFBF000000088800000880FBFBFBFBF
          B088888000008870000000000788888000008888888888888888888000008888
          88888888888888800000}
        Spacing = 2
      end
    end
  end
  inherited pnlFundo: TPanel
    Width = 482
    Height = 479
    BorderWidth = 2
    object pnlOpcoes: TPanel
      Left = 2
      Top = 215
      Width = 478
      Height = 262
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 3
      object cbkDbc: TCheckBox
        Left = 9
        Top = 6
        Width = 101
        Height = 17
        Caption = 'Débito em Conta'
        TabOrder = 0
        OnClick = cbkDbcClick
      end
      object cbkDbcExcesso: TCheckBox
        Left = 128
        Top = 6
        Width = 133
        Height = 17
        Caption = 'Excesso de Débito'
        TabOrder = 1
        OnClick = cbkDbcExcessoClick
      end
      object cbkDbcferias: TCheckBox
        Left = 260
        Top = 6
        Width = 129
        Height = 17
        Caption = 'Pagamento de Férias'
        TabOrder = 2
        OnClick = cbkDbcferiasClick
      end
      object gbxFunc: TGroupBox
        Left = 9
        Top = 27
        Width = 461
        Height = 160
        Caption = 'Empregados e Rubricas'
        TabOrder = 3
        object Paginas: TPageControl
          Left = 6
          Top = 15
          Width = 447
          Height = 139
          ActivePage = tbshListaFunc
          HotTrack = True
          TabOrder = 0
          object tbshListaFunc: TTabSheet
            Caption = '&Lista'
            object chklstFunc: TColorCheckListBox
              Left = 2
              Top = 2
              Width = 297
              Height = 105
              OnClickCheck = chklstFuncClickCheck
              ItemHeight = 13
              Style = lbOwnerDrawFixed
              TabOrder = 0
            end
            object bbtnSelTodosFunc: TBitBtn
              Left = 304
              Top = 2
              Width = 131
              Height = 25
              Caption = '   Seleciona Todos'
              TabOrder = 1
              TabStop = False
              OnClick = bbtnSelTodosFuncClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                3333333333333333333333333333333333333333333333333333333333300000
                0003333333388888888333333330FF9FFF0333333338FF7FFF8333333000F999
                FF0333333888F777FF83333330F099F99F03333338F877F77F83333000F09FFF
                9903333888F87FFF77833330F090FFFFF9933338F878FFFFF7733000F0900000
                00993888F8788888887730F090FFFFF9933338F878FFFFF7733330F090000000
                993338F87888888877333090FFFFF99333333878FFFFF7733333309000000099
                3333387888888877333330FFFFF99333333338FFFFF773333333300000009933
                3333388888887733333333333333333333333333333333333333}
              NumGlyphs = 2
              Spacing = 0
            end
            object bbtnInverteSelFunc: TBitBtn
              Left = 304
              Top = 28
              Width = 131
              Height = 25
              Caption = '   Inverte Seleção'
              TabOrder = 2
              TabStop = False
              OnClick = bbtnInverteSelFuncClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                3333333333333333333333333333000000003333333388888888333333330FFF
                FFF0333333338FFFFFF8333000330FFFFFF0333788338FFFFFF8333033330FFF
                FFF0333833338FFFFFF8330003330FFFFFF0337783338FFFFFF8333033330FFF
                FFF0333833338FFFFFF833333333000000003333333388888888000000003333
                333388888888333333330FF9FFF0333303338FF7FFF8333383330F999FF03330
                00338F777FF833387733099F99F033330333877F77F83333833309FFF9903300
                033387FFF778338873330FFFFF99333333338FFFFF7733333333000000099333
                3333888888877333333333333333333333333333333333333333}
              NumGlyphs = 2
              Spacing = 0
            end
            object edtSelEmpregados: TEdit
              Left = 304
              Top = 61
              Width = 132
              Height = 21
              Hint = 'A-E ... '
              ParentShowHint = False
              ShowHint = True
              TabOrder = 3
            end
            object btnSelEmpregados: TBitBtn
              Left = 336
              Top = 83
              Width = 68
              Height = 25
              Caption = '   &Marcar'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -12
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ParentShowHint = False
              ShowHint = False
              TabOrder = 4
              TabStop = False
              OnClick = btnSelEmpregadosClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                88888888888888FF8888888888888778888888888888F77F8888888888800F08
                8888888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0
                88888887788888F7F8888887FFFFFCF088888887FFF887878F888811111CCFFF
                08888877777F788F7F8881999991FFCF088887777777F87878F8998999991CFF
                F088778777777F88F78F99F899991FFCFF0877F877777F87887899FF89991CCF
                FFF077FF87777F7888F799F9F8891FFFF77877F7F8877F88F77899F99FF81FF7
                788877F77FF878F7788889999991777888888777777787788888889999988888
                8888887777788888888888888888888888888888888888888888}
              NumGlyphs = 2
              Spacing = 0
            end
          end
          object tbshFiltroFunc: TTabSheet
            Caption = '&Tipos de Contrato / Situações'
            object gbxTipContra: TGroupBox
              Left = 5
              Top = 1
              Width = 220
              Height = 90
              Caption = 'Tipo de Contrato'
              ParentShowHint = False
              ShowHint = False
              TabOrder = 0
              OnEnter = gbxTipContraEnter
              OnExit = gbxTipContraExit
              object cbxEfetivos: TCheckBox
                Left = 9
                Top = 17
                Width = 64
                Height = 13
                Caption = 'Efetivos'
                Checked = True
                ParentShowHint = False
                ShowHint = False
                State = cbChecked
                TabOrder = 0
                OnClick = ValidaAutonomos
              end
              object cbxEspeciais: TCheckBox
                Left = 9
                Top = 35
                Width = 90
                Height = 13
                Caption = 'LEF'
                Checked = True
                ParentShowHint = False
                ShowHint = False
                State = cbChecked
                TabOrder = 1
                OnClick = ValidaAutonomos
              end
              object cbxTemporarios: TCheckBox
                Left = 9
                Top = 52
                Width = 85
                Height = 13
                Caption = 'Terceirizado'
                Checked = True
                ParentShowHint = False
                ShowHint = False
                State = cbChecked
                TabOrder = 2
                OnClick = ValidaAutonomos
              end
              object cbxEstagiarios: TCheckBox
                Left = 9
                Top = 69
                Width = 74
                Height = 13
                Caption = 'Estagiários'
                Checked = True
                ParentShowHint = False
                ShowHint = False
                State = cbChecked
                TabOrder = 3
                OnClick = ValidaAutonomos
              end
              object cbxTerceiros: TCheckBox
                Left = 113
                Top = 17
                Width = 66
                Height = 13
                Caption = 'Cessão'
                ParentShowHint = False
                ShowHint = False
                TabOrder = 4
                OnClick = ValidaAutonomos
              end
              object cbxPropDirSemVinc: TCheckBox
                Left = 113
                Top = 35
                Width = 97
                Height = 13
                Caption = 'Prop/Dir s/ Vinc'
                ParentShowHint = False
                ShowHint = False
                TabOrder = 5
                OnClick = ValidaAutonomos
              end
              object cbxAutonomos: TCheckBox
                Left = 113
                Top = 52
                Width = 75
                Height = 13
                Caption = 'Autônomos'
                ParentShowHint = False
                ShowHint = False
                TabOrder = 6
                OnClick = cbxAutonomosClick
              end
            end
            object gbxSituacao: TGroupBox
              Left = 253
              Top = 1
              Width = 111
              Height = 77
              Caption = 'Situação Funcional'
              ParentShowHint = False
              ShowHint = False
              TabOrder = 1
              OnEnter = gbxSituacaoEnter
              OnExit = gbxSituacaoExit
              object cbxAtivos: TCheckBox
                Left = 9
                Top = 17
                Width = 52
                Height = 13
                Caption = 'Ativos'
                Checked = True
                ParentShowHint = False
                ShowHint = False
                State = cbChecked
                TabOrder = 0
              end
              object cbxAfastados: TCheckBox
                Left = 9
                Top = 36
                Width = 69
                Height = 13
                Caption = 'Afastados'
                ParentShowHint = False
                ShowHint = False
                TabOrder = 1
              end
              object cbxDemitidos: TCheckBox
                Tag = 2
                Left = 9
                Top = 56
                Width = 69
                Height = 13
                Caption = 'Demitidos'
                ParentShowHint = False
                ShowHint = False
                TabOrder = 2
              end
            end
          end
          object Rubricas: TTabSheet
            Caption = 'Rubricas'
            ImageIndex = 2
            object chklstRubrica: TColorCheckListBox
              Left = 2
              Top = 2
              Width = 320
              Height = 105
              OnClickCheck = chklstRubricaClickCheck
              ItemHeight = 13
              Style = lbOwnerDrawFixed
              TabOrder = 0
            end
            object bbtnSelTodosRub: TBitBtn
              Left = 326
              Top = 2
              Width = 109
              Height = 35
              Caption = 'Seleciona Todas'
              TabOrder = 1
              TabStop = False
              OnClick = bbtnSelTodosRubClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                3333333333333333333333333333333333333333333333333333333333300000
                0003333333388888888333333330FF9FFF0333333338FF7FFF8333333000F999
                FF0333333888F777FF83333330F099F99F03333338F877F77F83333000F09FFF
                9903333888F87FFF77833330F090FFFFF9933338F878FFFFF7733000F0900000
                00993888F8788888887730F090FFFFF9933338F878FFFFF7733330F090000000
                993338F87888888877333090FFFFF99333333878FFFFF7733333309000000099
                3333387888888877333330FFFFF99333333338FFFFF773333333300000009933
                3333388888887733333333333333333333333333333333333333}
              Layout = blGlyphTop
              NumGlyphs = 2
              Spacing = 0
            end
            object bbtnInverteSelRub: TBitBtn
              Left = 326
              Top = 39
              Width = 109
              Height = 35
              Caption = 'Inverte Seleção'
              TabOrder = 2
              TabStop = False
              OnClick = bbtnInverteSelRubClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                3333333333333333333333333333000000003333333388888888333333330FFF
                FFF0333333338FFFFFF8333000330FFFFFF0333788338FFFFFF8333033330FFF
                FFF0333833338FFFFFF8330003330FFFFFF0337783338FFFFFF8333033330FFF
                FFF0333833338FFFFFF833333333000000003333333388888888000000003333
                333388888888333333330FF9FFF0333303338FF7FFF8333383330F999FF03330
                00338F777FF833387733099F99F033330333877F77F83333833309FFF9903300
                033387FFF778338873330FFFFF99333333338FFFFF7733333333000000099333
                3333888888877333333333333333333333333333333333333333}
              Layout = blGlyphTop
              NumGlyphs = 2
              Spacing = 0
            end
          end
          object tbshEstabelecimento: TTabSheet
            Caption = 'Estabelecimentos'
            ImageIndex = 3
            object chklstEstab: TColorCheckListBox
              Left = 0
              Top = 4
              Width = 302
              Height = 104
              OnClickCheck = chklstEstabClickCheck
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ItemHeight = 13
              ParentFont = False
              ParentShowHint = False
              ShowHint = False
              Style = lbOwnerDrawFixed
              TabOrder = 0
            end
            object bbtnSelTodosEstab: TBitBtn
              Left = 305
              Top = 4
              Width = 131
              Height = 25
              Caption = '   Seleciona Todos'
              TabOrder = 1
              TabStop = False
              OnClick = bbtnSelTodosEstabClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                3333333333333333333333333333333333333333333333333333333333300000
                0003333333388888888333333330FF9FFF0333333338FF7FFF8333333000F999
                FF0333333888F777FF83333330F099F99F03333338F877F77F83333000F09FFF
                9903333888F87FFF77833330F090FFFFF9933338F878FFFFF7733000F0900000
                00993888F8788888887730F090FFFFF9933338F878FFFFF7733330F090000000
                993338F87888888877333090FFFFF99333333878FFFFF7733333309000000099
                3333387888888877333330FFFFF99333333338FFFFF773333333300000009933
                3333388888887733333333333333333333333333333333333333}
              NumGlyphs = 2
              Spacing = 0
            end
            object bbtnInverteSelEstab: TBitBtn
              Left = 305
              Top = 32
              Width = 131
              Height = 25
              Caption = '   Inverte Seleção'
              TabOrder = 2
              TabStop = False
              OnClick = bbtnInverteSelEstabClick
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                80000080000000808000800000008000800080800000C0C0C000808080000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
                3333333333333333333333333333000000003333333388888888333333330FFF
                FFF0333333338FFFFFF8333000330FFFFFF0333788338FFFFFF8333033330FFF
                FFF0333833338FFFFFF8330003330FFFFFF0337783338FFFFFF8333033330FFF
                FFF0333833338FFFFFF833333333000000003333333388888888000000003333
                333388888888333333330FF9FFF0333303338FF7FFF8333383330F999FF03330
                00338F777FF833387733099F99F033330333877F77F83333833309FFF9903300
                033387FFF778338873330FFFFF99333333338FFFFF7733333333000000099333
                3333888888877333333333333333333333333333333333333333}
              NumGlyphs = 2
              Spacing = 0
            end
          end
        end
      end
      object gbxOrdImpress: TGroupBox
        Left = 9
        Top = 189
        Width = 461
        Height = 43
        Caption = 'Ordem de Impressão'
        TabOrder = 4
        object cmbOrderBy: TComboBox
          Left = 9
          Top = 14
          Width = 444
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 0
          Items.Strings = (
            'Nome do Funcionário'
            'Centro de Custo, Nome'
            'Centro de Custo, Matrícula'
            'Matrícula do Funcionário')
        end
      end
      object edNomeArqFrente: TEdit
        Left = 9
        Top = 238
        Width = 424
        Height = 21
        Hint = 'Arquivo imagem do demonstrativo'
        TabStop = False
        Color = clInfoBk
        ParentShowHint = False
        ReadOnly = True
        ShowHint = True
        TabOrder = 5
      end
    end
    object pnlPeriodo: TPanel
      Left = 2
      Top = 76
      Width = 478
      Height = 90
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 1
      object gbxMesAnoRef: TGroupBox
        Left = 9
        Top = 1
        Width = 203
        Height = 86
        Caption = 'Mês e Ano de Referência'
        TabOrder = 0
        object lblMesIni: TLabel
          Left = 8
          Top = 41
          Width = 35
          Height = 13
          Caption = 'Inicial'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        object lblMesFim: TLabel
          Left = 15
          Top = 65
          Width = 28
          Height = 13
          Caption = 'Final'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        object cmbMes: TComboBox
          Left = 46
          Top = 34
          Width = 96
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 1
          OnChange = cmbMesChange
          Items.Strings = (
            'Janeiro'
            'Fevereiro'
            'Março'
            'Abril'
            'Maio'
            'Junho'
            'Julho'
            'Agosto'
            'Setembro'
            'Outubro'
            'Novembro'
            'Dezembro')
        end
        object speAno: TSpinEdit
          Left = 147
          Top = 34
          Width = 51
          Height = 22
          MaxValue = 0
          MinValue = 0
          TabOrder = 2
          Value = 0
          OnChange = speAnoChange
        end
        object ckbIntervalo: TCheckBox
          Left = 16
          Top = 16
          Width = 113
          Height = 17
          Caption = 'Utiliza Intervalo?'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          OnClick = ckbIntervaloClick
        end
        object cmbMesF: TComboBox
          Left = 46
          Top = 60
          Width = 96
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 3
          Visible = False
          Items.Strings = (
            'Janeiro'
            'Fevereiro'
            'Março'
            'Abril'
            'Maio'
            'Junho'
            'Julho'
            'Agosto'
            'Setembro'
            'Outubro'
            'Novembro'
            'Dezembro')
        end
        object speAnoF: TSpinEdit
          Left = 147
          Top = 60
          Width = 51
          Height = 22
          MaxValue = 0
          MinValue = 0
          TabOrder = 4
          Value = 0
          Visible = False
        end
      end
      object gbxDatas: TGroupBox
        Left = 217
        Top = 1
        Width = 108
        Height = 43
        Caption = 'Data de Pagto.'
        TabOrder = 1
        object dtPagamento: TCMDateTimePicker
          Left = 7
          Top = 15
          Width = 94
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          ButtonStyle = cbsCustom
          Epoch = 1950
          ButtonGlyph.Data = {
            06050000424D06050000000000003604000028000000100000000D0000000100
            080000000000D000000000000000000000000001000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
            A6000020400000206000002080000020A0000020C0000020E000004000000040
            20000040400000406000004080000040A0000040C0000040E000006000000060
            20000060400000606000006080000060A0000060C0000060E000008000000080
            20000080400000806000008080000080A0000080C0000080E00000A0000000A0
            200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
            200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
            200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
            20004000400040006000400080004000A0004000C0004000E000402000004020
            20004020400040206000402080004020A0004020C0004020E000404000004040
            20004040400040406000404080004040A0004040C0004040E000406000004060
            20004060400040606000406080004060A0004060C0004060E000408000004080
            20004080400040806000408080004080A0004080C0004080E00040A0000040A0
            200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
            200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
            200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
            20008000400080006000800080008000A0008000C0008000E000802000008020
            20008020400080206000802080008020A0008020C0008020E000804000008040
            20008040400080406000804080008040A0008040C0008040E000806000008060
            20008060400080606000806080008060A0008060C0008060E000808000008080
            20008080400080806000808080008080A0008080C0008080E00080A0000080A0
            200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
            200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
            200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
            2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
            2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
            2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
            2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
            2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
            2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
            2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
            000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
            A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
            A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
            A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
            FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
            04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
            000000000000000000FF}
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ShowButton = True
          TabOrder = 0
        end
      end
      object rgProcesso: TRadioGroup
        Left = 330
        Top = 1
        Width = 140
        Height = 43
        Caption = 'Processo'
        Columns = 2
        ItemIndex = 1
        Items.Strings = (
          'Prévia'
          'Final')
        TabOrder = 2
      end
    end
    object gbxTipPag: TGroupBox
      Left = 2
      Top = 2
      Width = 478
      Height = 74
      Align = alTop
      Caption = 'Tipo(s) de Pagamento'
      TabOrder = 0
      object chklstTipoFolha: TColorCheckListBox
        Left = 9
        Top = 13
        Width = 316
        Height = 54
        OnClickCheck = chklstTipoFolhaClickCheck
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        ParentShowHint = False
        ShowHint = False
        Style = lbOwnerDrawFixed
        TabOrder = 0
      end
      object bbtnSelTodosTipoFolha: TBitBtn
        Left = 333
        Top = 12
        Width = 131
        Height = 25
        Caption = '   Seleciona Todos'
        TabOrder = 1
        TabStop = False
        OnClick = bbtnSelTodosTipoFolhaClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333333333333333333333333333333333333333300000
          0003333333388888888333333330FF9FFF0333333338FF7FFF8333333000F999
          FF0333333888F777FF83333330F099F99F03333338F877F77F83333000F09FFF
          9903333888F87FFF77833330F090FFFFF9933338F878FFFFF7733000F0900000
          00993888F8788888887730F090FFFFF9933338F878FFFFF7733330F090000000
          993338F87888888877333090FFFFF99333333878FFFFF7733333309000000099
          3333387888888877333330FFFFF99333333338FFFFF773333333300000009933
          3333388888887733333333333333333333333333333333333333}
        NumGlyphs = 2
        Spacing = 0
      end
      object bbtnInvSelTipoFolha: TBitBtn
        Left = 333
        Top = 38
        Width = 131
        Height = 25
        Caption = '   Inverte Seleção'
        TabOrder = 2
        TabStop = False
        OnClick = bbtnInvSelTipoFolhaClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333333333000000003333333388888888333333330FFF
          FFF0333333338FFFFFF8333000330FFFFFF0333788338FFFFFF8333033330FFF
          FFF0333833338FFFFFF8330003330FFFFFF0337783338FFFFFF8333033330FFF
          FFF0333833338FFFFFF833333333000000003333333388888888000000003333
          333388888888333333330FF9FFF0333303338FF7FFF8333383330F999FF03330
          00338F777FF833387733099F99F033330333877F77F83333833309FFF9903300
          033387FFF778338873330FFFFF99333333338FFFFF7733333333000000099333
          3333888888877333333333333333333333333333333333333333}
        NumGlyphs = 2
        Spacing = 0
      end
    end
    object bbtnImagem: TBitBtn
      Left = 442
      Top = 417
      Width = 27
      Height = 26
      Hint = 'Localizar a Imagem Associada ao Demonstrativo'
      Default = True
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = bbtnImagemClick
      Glyph.Data = {
        66010000424D6601000000000000760000002800000013000000140000000100
        040000000000F000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        888888800000888888888888888888800000888008888888888888800000880F
        108888888888888000008809F108888888888880000088809F00888888888880
        0000888809F0000788888880000088888090FFF0788888800000887000088888
        00888880000088007B0F8F8F0B0888800000880F0708F8F8070888800000880B
        0B708F807B7088800000880F70B70007B7B088800000880BF07B7B7B7B7B0880
        0000880FBF0007B7B7B708800000880BFBFBF000000088800000880FBFBFBFBF
        B088888000008870000000000788888000008888888888888888888000008888
        88888888888888800000}
      Spacing = 2
    end
    object pnlAltura: TPanel
      Left = 2
      Top = 166
      Width = 478
      Height = 49
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 2
      object rgImprCab: TRadioGroup
        Left = 9
        Top = 3
        Width = 314
        Height = 41
        Hint = 'Imprime Cabeçalho com o Nome e Endereço da Empresa?'
        Caption = 'Imprime Nome/Endereço da Empresa?'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Sim'
          'Não')
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
      object rgAltura: TRadioGroup
        Left = 330
        Top = 3
        Width = 140
        Height = 41
        Caption = 'Altura do Formulário'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          '5,5"'
          '6,0"')
        TabOrder = 1
      end
    end
  end
  inherited Dock971: TDock97
    Top = 479
    Width = 482
    inherited tb97Fundo: TToolbar97
      Left = 108
      DockPos = 119
      inherited sep1: TToolbarSep97
        Left = 287
      end
      object ToolbarSep973: TToolbarSep97 [1]
        Left = 186
        Top = 0
        Blank = True
        SizeHorz = 20
      end
      object ToolbarSep974: TToolbarSep97 [2]
        Left = 75
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 206
        ModalResult = 2
        TabOrder = 2
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 289
        TabOrder = 3
      end
      object bbtnGerar: TBitBtn
        Left = 77
        Top = 0
        Width = 109
        Height = 33
        Hint = 'Gravar Arquivo Texto'
        Cancel = True
        Caption = ' &Gerar Arquivo'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = bbtnGerarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333330070
          7700333333337777777733333333008088003333333377F73377333333330088
          88003333333377FFFF7733333333000000003FFFFFFF77777777000000000000
          000077777777777777770FFFFFFF0FFFFFF07F3333337F3333370FFFFFFF0FFF
          FFF07F3FF3FF7FFFFFF70F00F0080CCC9CC07F773773777777770FFFFFFFF039
          99337F3FFFF3F7F777F30F0000F0F09999937F7777373777777F0FFFFFFFF999
          99997F3FF3FFF77777770F00F000003999337F773777773777F30FFFF0FF0339
          99337F3FF7F3733777F30F08F0F0337999337F7737F73F7777330FFFF0039999
          93337FFFF7737777733300000033333333337777773333333333}
        NumGlyphs = 2
        Spacing = 2
      end
      object rbtnImprimir: TBitBtn
        Left = 0
        Top = 0
        Width = 75
        Height = 33
        Cancel = True
        Caption = 'Imprimir'
        TabOrder = 0
        OnClick = rbtnImprimirClick
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888880008
          8888888888888F7778FF8888000088888800877008888888888F7787F778FF88
          0000888800880007700888888F778F7778F778FF000088008800877007700888
          778F7787F778F778000080880088877770077087FF778887F88778F700008700
          888887777770008777888887FF888777000080888888F77777777087F8888F77
          78FF88870000878888FF888777777087F88F77888778FF8700008788FF888888
          87777087FF778888888778F7000087FF88899888888770877788888888888777
          000087888AA88888808880878FF8888888FFF8F700008877F888888FF0877888
          778FF88FF77787780000888877F87FFFFF08888888778F77788878F800008888
          88777FFFFFF088888888777FF888878F00008888888877FFFFFF008888888877
          8F888F77000088888888887FFF7788888888888878FF77880000888888888887
          7788888888888888877788880000888888888888888888888888888888888888
          0000}
        NumGlyphs = 2
        Spacing = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 127
    Top = 21
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object GImp: TGImp
    DataBaseName = 'BASEDADOS'
    TipoFonte = TfNormal
    MostraPrinterSetup = True
    EjetarPagina = False
    Condensado = True
    Sublinhado = False
    SaltodeLinhaCondensado = True
    RegConfigImpressora.ValueNameId = 'IdImpressora'
    RegConfigImpressora.ValueNamePrinter = 'Impressora\Porta'
    Left = 89
    Top = 21
  end
  object svArquivo: TSaveDialog
    DefaultExt = 'TXT'
    FileName = 'DemPag.TXT'
    Filter = 'Arquivo Texto (*.TXT)|*.TXT'
    Left = 290
    Top = 21
  end
  object opArquivo: TOpenPictureDialog
    DefaultExt = '*.bmp'
    Filter = 
      'Todos os Arquivos (*.*)|*.*|Arquivos PRN (*.prn)|*.prn|Bitmaps (' +
      '*.bmp)|*.bmp'
    Options = [ofExtensionDifferent, ofPathMustExist]
    Left = 239
    Top = 21
  end
  object opAplicativo: TOpenDialog
    Left = 183
    Top = 21
  end
  object CdsEstab: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 42
    Top = 35
  end
  object CdsParamRH: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 58
    Top = 21
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 408
    Top = 208
  end
end
