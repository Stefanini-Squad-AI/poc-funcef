inherited frmResFol: TfrmResFol
  Left = 191
  Top = 88
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsToolWindow
  Caption = 'Resumo de Folha de Pagamento'
  ClientHeight = 424
  ClientWidth = 451
  Font.Style = []
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 451
    Height = 385
    BorderWidth = 2
    object Paginas: TPageControl
      Left = 12
      Top = 12
      Width = 427
      Height = 170
      ActivePage = tbshTipoFolha
      HotTrack = True
      TabOrder = 0
      object tbshTipoFolha: TTabSheet
        Caption = '&Tipos de Folha'
        object chklstTipoFolha: TCheckListBox
          Left = 1
          Top = 1
          Width = 281
          Height = 140
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
          OnDrawItem = chklstTipoFolhaDrawItem
          OnKeyDown = chklstTipoFolhaKeyDown
        end
      end
      object tbsRubrica: TTabSheet
        Caption = 'Rubricas'
        ImageIndex = 2
        object Label1: TLabel
          Left = 0
          Top = 101
          Width = 159
          Height = 13
          Caption = 'Procura por Rubricas pelo Código'
        end
        object chklstRubrica: TCheckListBox
          Left = 2
          Top = 2
          Width = 281
          Height = 95
          OnClickCheck = chklstRubricaClickCheck
          ItemHeight = 13
          Style = lbOwnerDrawFixed
          TabOrder = 0
          OnDrawItem = chklstTipoFolhaDrawItem
          OnKeyDown = chklstTipoFolhaKeyDown
        end
        object edCodRubricas: TEdit
          Left = 0
          Top = 115
          Width = 310
          Height = 21
          Hint = 
            'Digite aqui o código das Rubricas a procurar separados por vírgu' +
            'la'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
        end
        object sbtnMarcarRub: TBitBtn
          Left = 312
          Top = 111
          Width = 103
          Height = 28
          Caption = '   &Marcar'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          TabOrder = 2
          TabStop = False
          OnClick = sbtnMarcarRubClick
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
      object tbshCCusto: TTabSheet
        Caption = '&Centros de Custo'
        object chklstCCusto: TCheckListBox
          Left = 1
          Top = 1
          Width = 281
          Height = 140
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
          OnDrawItem = chklstTipoFolhaDrawItem
          OnKeyDown = chklstCCustoKeyDown
        end
      end
    end
    object spbtSelTodos: TBitBtn
      Left = 302
      Top = 39
      Width = 131
      Height = 25
      Caption = '   Seleciona Todos'
      TabOrder = 1
      TabStop = False
      OnClick = spbtSelTodosClick
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
    object spbtInvSelecao: TBitBtn
      Left = 302
      Top = 66
      Width = 131
      Height = 25
      Caption = '   Inverte Seleção'
      TabOrder = 2
      TabStop = False
      OnClick = spbtInvSelecaoClick
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
    object gbxEstab: TGroupBox
      Left = 12
      Top = 185
      Width = 233
      Height = 45
      Caption = 'Estabelecimento'
      TabOrder = 3
      object dblkcbEstab: TwwDBLookupCombo
        Left = 9
        Top = 15
        Width = 215
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'Estabelecimento')
        LookupTable = qryEstab
        LookupField = 'IDPESSOA'
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnChange = dblkcbEstabChange
      end
    end
    object rgProcesso: TRadioGroup
      Left = 251
      Top = 185
      Width = 188
      Height = 45
      Caption = 'Processo'
      Columns = 2
      ItemIndex = 1
      Items.Strings = (
        'Prévia'
        'Final')
      TabOrder = 4
      TabStop = True
    end
    object rgRubApoio: TRadioGroup
      Left = 12
      Top = 232
      Width = 233
      Height = 45
      Caption = 'Incluir Rubricas de Apoio?'
      Columns = 2
      ItemIndex = 1
      Items.Strings = (
        'Sim'
        'Não')
      TabOrder = 5
      TabStop = True
    end
    object rgImprimeTipoProcesso: TRadioGroup
      Left = 251
      Top = 232
      Width = 188
      Height = 45
      Caption = 'Impimir Tipo do Processo?'
      Columns = 2
      ItemIndex = 1
      Items.Strings = (
        'Sim'
        'Não')
      TabOrder = 6
    end
    object gbxAnoMesRef: TGroupBox
      Left = 12
      Top = 279
      Width = 233
      Height = 94
      Caption = 'Ano e Mês de Referência'
      TabOrder = 7
      object lblPerIni: TLabel
        Left = 12
        Top = 42
        Width = 27
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Inicial'
      end
      object lblPerFin: TLabel
        Left = 12
        Top = 67
        Width = 27
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Final'
      end
      object cmbMesIni: TComboBox
        Left = 46
        Top = 39
        Width = 112
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
      object speAnoIni: TSpinEdit
        Left = 165
        Top = 39
        Width = 58
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 1
        Value = 0
        OnChange = dblkcbEstabChange
      end
      object cmbMesFin: TComboBox
        Left = 46
        Top = 64
        Width = 112
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 2
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
      object speAnoFin: TSpinEdit
        Left = 165
        Top = 64
        Width = 58
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 3
        Value = 0
        OnChange = dblkcbEstabChange
      end
      object chkTipoIntervalo: TCheckBox
        Left = 16
        Top = 18
        Width = 104
        Height = 17
        Caption = 'Utiliza Intervalo?'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 4
        OnClick = chkTipoIntervaloClick
      end
    end
    object rgAutoriza: TRadioGroup
      Left = 251
      Top = 279
      Width = 188
      Height = 47
      Caption = 'Inclui Rodapé de Autorizações?'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Sim'
        'Não')
      TabOrder = 8
      TabStop = True
    end
    object gbxAgruparPor: TGroupBox
      Left = 251
      Top = 328
      Width = 188
      Height = 45
      Caption = 'Agrupar por'
      TabOrder = 9
      object cmbAgruparPor: TComboBox
        Left = 9
        Top = 15
        Width = 171
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        Items.Strings = (
          'Não Agrupar'
          'Centro de Custo'
          'Centro de Custo Sintético'
          'Programa')
      end
    end
  end
  inherited Dock971: TDock97
    Top = 385
    Width = 451
    inherited tb97Fundo: TToolbar97
      Left = 203
      DockPos = 271
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
    Left = 106
    Top = 39
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
    Left = 26
    Top = 39
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EMPRESA'
        ParamType = ptUnknown
      end>
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  PR.MASCARACC, CC.CODCENTROCUSTO, CC.NOME'
      'FROM'
      '  CENTCUST CC, PARAMGLOBAL PR'
      'WHERE'
      '  (CC.IDEMPRESA      = :IDEMPRESA) AND'
      '  (CC.STATUSGRUPOCDC = '#39'S'#39')        AND'
      '  (CC.IDEMPRESA      = PR.IDPESSOA)'
      'ORDER BY'
      '  TO_NUMBER(CC.CODCENTROCUSTO) ')
    ValidateWithMask = True
    Left = 64
    Top = 39
    ParamData = <
      item
        DataType = ftString
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end>
  end
end
