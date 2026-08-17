inherited frmFolhaNormal: TfrmFolhaNormal
  Left = 177
  Top = 28
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsToolWindow
  Caption = 'Folha de Pagamento Normal'
  ClientHeight = 482
  ClientWidth = 447
  Font.Style = []
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 447
    Height = 443
    BorderWidth = 2
    object gbxMesAnoRef: TGroupBox
      Left = 10
      Top = 111
      Width = 181
      Height = 44
      Caption = 'Mês e Ano de Referência'
      TabOrder = 0
      object cmbMes: TComboBox
        Left = 7
        Top = 15
        Width = 106
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
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
        Left = 119
        Top = 15
        Width = 55
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 1
        Value = 0
        OnChange = speAnoChange
      end
    end
    object gbxEstab: TGroupBox
      Left = 10
      Top = 157
      Width = 427
      Height = 43
      Caption = 'Estabelecimento'
      TabOrder = 2
      object dblkcbEstab: TwwDBLookupCombo
        Left = 7
        Top = 14
        Width = 412
        Height = 21
        Ctl3D = True
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'Estabelecimento')
        LookupTable = qryEstab
        LookupField = 'IDPESSOA'
        Style = csDropDownList
        ParentCtl3D = False
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        OrderByDisplay = False
        AllowClearKey = True
        OnChange = dblkcbEstabChange
      end
    end
    object gbxOrdem: TGroupBox
      Left = 10
      Top = 346
      Width = 237
      Height = 43
      Caption = 'Ordem de Impressão'
      TabOrder = 4
      object cmbOrderBy: TComboBox
        Left = 7
        Top = 14
        Width = 223
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        OnChange = cmbOrderByChange
        Items.Strings = (
          'Nome, Centro de Custo'
          'Matrícula, Centro de Custo'
          'Centro de Custo, Nome'
          'Centro de Custo, Matrícula')
      end
    end
    object rgProcesso: TRadioGroup
      Left = 198
      Top = 111
      Width = 239
      Height = 44
      Caption = 'Processo'
      Columns = 2
      ItemIndex = 1
      Items.Strings = (
        'Prévia'
        'Final')
      TabOrder = 1
    end
    object gbxTipoPapel: TGroupBox
      Left = 10
      Top = 391
      Width = 427
      Height = 43
      Caption = 'Tipo de Papel'
      TabOrder = 5
      object cmbTipoPapel: TComboBox
        Left = 7
        Top = 14
        Width = 412
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
      end
    end
    object gbxFunc: TGroupBox
      Left = 10
      Top = 202
      Width = 427
      Height = 141
      Caption = 'Empregados'
      TabOrder = 3
      object Paginas2: TPageControl
        Left = 7
        Top = 15
        Width = 412
        Height = 119
        ActivePage = tbshListaFunc
        HotTrack = True
        TabOrder = 0
        object tbshListaFunc: TTabSheet
          Caption = '&Lista'
          object chklstFunc: TCheckListBox
            Left = 1
            Top = 1
            Width = 264
            Height = 89
            OnClickCheck = chklstTipoFolhaClickCheck
            ItemHeight = 13
            Style = lbOwnerDrawFixed
            TabOrder = 0
            OnDrawItem = chklstFuncDrawItem
            OnKeyDown = chklstTipoFolhaKeyDown
          end
          object bbtnSelTodosFunc: TBitBtn
            Left = 270
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
            Left = 270
            Top = 29
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
        end
        object tbshFiltroFunc: TTabSheet
          Caption = '&Tipos / Situações'
          object gbxTipContra: TGroupBox
            Left = 13
            Top = -1
            Width = 220
            Height = 88
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
            end
            object cbxEspeciais: TCheckBox
              Left = 9
              Top = 35
              Width = 90
              Height = 13
              Caption = 'Efet. Especiais'
              Checked = True
              ParentShowHint = False
              ShowHint = False
              State = cbChecked
              TabOrder = 1
            end
            object cbxTemporarios: TCheckBox
              Left = 9
              Top = 52
              Width = 85
              Height = 13
              Caption = 'Temporários'
              Checked = True
              ParentShowHint = False
              ShowHint = False
              State = cbChecked
              TabOrder = 2
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
            end
            object cbxTerceiros: TCheckBox
              Left = 113
              Top = 17
              Width = 66
              Height = 13
              Caption = 'Terceiros'
              ParentShowHint = False
              ShowHint = False
              TabOrder = 4
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
            end
          end
          object gbxSituacao: TGroupBox
            Left = 245
            Top = -1
            Width = 111
            Height = 88
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
              Left = 9
              Top = 56
              Width = 69
              Height = 13
              Caption = 'Demititos'
              Checked = True
              ParentShowHint = False
              ShowHint = False
              State = cbChecked
              TabOrder = 2
            end
          end
        end
      end
    end
    object Paginas1: TPageControl
      Left = 10
      Top = 8
      Width = 427
      Height = 100
      ActivePage = tbshTipoFolha
      HotTrack = True
      TabOrder = 6
      object tbshTipoFolha: TTabSheet
        Caption = '&Tipos de Folha'
        object chklstTipoFolha: TCheckListBox
          Left = 1
          Top = 1
          Width = 280
          Height = 70
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
          OnDrawItem = chklstFuncDrawItem
          OnKeyDown = chklstTipoFolhaKeyDown
        end
      end
      object tbshCCusto: TTabSheet
        Caption = '&Centros de Custo'
        object chklstCCusto: TCheckListBox
          Left = 1
          Top = 1
          Width = 280
          Height = 70
          OnClickCheck = chklstCCustoClickCheck
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
          OnDrawItem = chklstFuncDrawItem
          OnKeyDown = chklstCCustoKeyDown
        end
      end
    end
    object spbtSelTodosTipFol: TBitBtn
      Left = 300
      Top = 37
      Width = 131
      Height = 25
      Caption = '   Seleciona Todos'
      TabOrder = 7
      TabStop = False
      OnClick = spbtSelTodosTipFolClick
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
    object spbtInvSelecaoTipFol: TBitBtn
      Left = 300
      Top = 64
      Width = 131
      Height = 25
      Caption = '   Inverte Seleção'
      TabOrder = 8
      TabStop = False
      OnClick = spbtInvSelecaoTipFolClick
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
    object rgAgruparPorCCusto: TRadioGroup
      Left = 252
      Top = 346
      Width = 185
      Height = 43
      Caption = 'Agrupar por Centro de Custo?'
      Columns = 2
      Enabled = False
      ItemIndex = 1
      Items.Strings = (
        'Sim'
        'Não')
      TabOrder = 9
      TabStop = True
    end
  end
  inherited Dock971: TDock97
    Top = 443
    Width = 447
    inherited tb97Fundo: TToolbar97
      Left = 199
      DockPos = 275
      inherited sep1: TToolbarSep97
        Left = 162
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 80
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 82
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 164
      end
      object bbtnConfirmar: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&OK'
        Default = True
        ModalResult = 1
        TabOrder = 2
        OnClick = bbtnConfirmarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888002222200
          88888887788888778F88887222222222088888788888888878F887A228822222
          208887F88FFF888887F887A2FFF8222220888788777FF888878F7A22FFFF8222
          22087F887777FF88887F7A22FFFFF82222087F8877777FF8887F7A22FF8FFF82
          22087F8877F777FF887F7A22FF82FFF822087F8877F8777F887F7A22FF222FF8
          220878F87788877FF87887A2222222FF208887F88888887787F887A222222222
          2088878F888888888788887AA222222208888878FF88888F788888877AAAAA77
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 245
    Top = 54
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryEstab: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  PJ.IDPESSOA, PJ.NOME'
      'FROM'
      '  PESSOA PJ, FILIALPESSOA FP'
      'WHERE'
      ''
      '  (PJ.IDGRUPO        = :EMPRESA) AND'
      '  (FP.IDFILIALPESSOA = PJ.IDPESSOA)')
    ValidateWithMask = True
    Left = 198
    Top = 54
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EMPRESA'
        ParamType = ptUnknown
      end>
  end
end
