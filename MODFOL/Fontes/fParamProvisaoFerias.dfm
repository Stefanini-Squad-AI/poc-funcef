inherited frmParamProvisaoFerias: TfrmParamProvisaoFerias
  Left = 57
  Top = 138
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsToolWindow
  Caption = 'Relatório de Provisão de Férias (Vencidas e Proporcionais)'
  ClientHeight = 373
  ClientWidth = 700
  Font.Style = []
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 700
    Height = 334
    BorderWidth = 2
    object gbxEstab: TGroupBox
      Left = 10
      Top = 6
      Width = 314
      Height = 45
      Caption = 'Estabelecimento'
      TabOrder = 0
      object dblkcbEstab: TwwDBLookupCombo
        Left = 6
        Top = 15
        Width = 301
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'Estabelecimento')
        LookupTable = qryEstab
        LookupField = 'IDPESSOA'
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        OnChange = dblkcbEstabChange
      end
    end
    object gbxFunc: TGroupBox
      Left = 10
      Top = 52
      Width = 314
      Height = 220
      Caption = 'Empregados'
      TabOrder = 1
      object pgctrlEmpregados: TPageControl
        Left = 6
        Top = 15
        Width = 302
        Height = 200
        ActivePage = tbshListaFunc
        HotTrack = True
        TabOrder = 0
        object tbshListaFunc: TTabSheet
          Caption = '&Lista'
          object chklstFunc: TCheckListBox
            Left = 2
            Top = 2
            Width = 289
            Height = 139
            OnClickCheck = chklstFuncClickCheck
            ItemHeight = 13
            Style = lbOwnerDrawFixed
            TabOrder = 0
            OnDrawItem = chklstRubricaDrawItem
            OnKeyDown = chklstFuncKeyDown
          end
          object bbtnSelTodos: TBitBtn
            Left = 2
            Top = 144
            Width = 131
            Height = 25
            Caption = '   Seleciona Todos'
            TabOrder = 1
            TabStop = False
            OnClick = bbtnSelTodosClick
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
          object bbtnInverteSel: TBitBtn
            Left = 160
            Top = 144
            Width = 131
            Height = 25
            Caption = '   Inverte Seleção'
            TabOrder = 2
            TabStop = False
            OnClick = bbtnInverteSelClick
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
            Left = 5
            Top = 14
            Width = 111
            Height = 141
            Hint = '"Tique" Uma ou Mais Alternativas'
            Caption = 'Tipo de Contrato'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            OnEnter = gbxTipContraEnter
            OnExit = gbxTipContraExit
            object cbxEfetivos: TCheckBox
              Left = 9
              Top = 16
              Width = 64
              Height = 13
              Caption = 'Efetivos'
              Checked = True
              State = cbChecked
              TabOrder = 0
            end
            object cbxEspeciais: TCheckBox
              Left = 9
              Top = 34
              Width = 90
              Height = 13
              Caption = 'Efet. Especiais'
              Checked = True
              State = cbChecked
              TabOrder = 1
            end
            object cbxTemporarios: TCheckBox
              Left = 9
              Top = 51
              Width = 85
              Height = 13
              Caption = 'Temporários'
              TabOrder = 2
            end
            object cbxEstagiarios: TCheckBox
              Left = 9
              Top = 68
              Width = 74
              Height = 13
              Caption = 'Estagiários'
              TabOrder = 3
            end
            object cbxTerceiros: TCheckBox
              Left = 9
              Top = 85
              Width = 66
              Height = 13
              Caption = 'Terceiros'
              TabOrder = 4
            end
            object cbxPropDirSemVinc: TCheckBox
              Left = 9
              Top = 102
              Width = 97
              Height = 13
              Caption = 'Prop/Dir s/ Vinc'
              TabOrder = 5
            end
            object cbxAutonomos: TCheckBox
              Left = 9
              Top = 119
              Width = 75
              Height = 13
              Caption = 'Autônomos'
              TabOrder = 6
            end
          end
          object gbxSituacao: TGroupBox
            Left = 141
            Top = 14
            Width = 111
            Height = 57
            Hint = '"Tique" Uma ou Mais Alternativas'
            Caption = 'Situação Funcional'
            ParentShowHint = False
            ShowHint = True
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
              State = cbChecked
              TabOrder = 0
            end
            object cbxAfastados: TCheckBox
              Left = 9
              Top = 36
              Width = 69
              Height = 13
              Caption = 'Afastados'
              TabOrder = 1
            end
          end
        end
      end
    end
    object gbxRubricas: TGroupBox
      Left = 329
      Top = 6
      Width = 360
      Height = 266
      Caption = 'Rubrica(s) que Compõe(m) a Provisão'
      TabOrder = 2
      object Label1: TLabel
        Left = 8
        Top = 216
        Width = 100
        Height = 13
        Caption = 'Procura por Rubricas'
      end
      object chklstRubrica: TCheckListBox
        Left = 6
        Top = 15
        Width = 348
        Height = 196
        OnClickCheck = chklstRubricaClickCheck
        ItemHeight = 13
        Style = lbOwnerDrawFixed
        TabOrder = 0
        OnDrawItem = chklstRubricaDrawItem
        OnKeyDown = chklstRubricaKeyDown
      end
      object edCodRubricas: TEdit
        Left = 8
        Top = 232
        Width = 238
        Height = 21
        Hint = 
          'Digite aqui o código das Rubricas a procurar separados por vírgu' +
          'la'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
      object sbtnMarcarRub: TBitBtn
        Left = 250
        Top = 228
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
    object gbxEncargo: TGroupBox
      Left = 10
      Top = 277
      Width = 78
      Height = 46
      Caption = 'Encargos (%)'
      TabOrder = 3
      object rePercent: TRealEdit
        Left = 9
        Top = 16
        Width = 59
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,00')
        TabOrder = 0
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
      end
    end
    object gbxDataBase: TGroupBox
      Left = 93
      Top = 277
      Width = 96
      Height = 46
      Caption = 'Data Base'
      TabOrder = 4
      object dtedDataBase: TCMDateTimePicker
        Left = 7
        Top = 16
        Width = 82
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
        ShowButton = True
        TabOrder = 0
        OnChange = dtedDataBaseChange
      end
    end
    object rgTipoCalc: TRadioGroup
      Left = 194
      Top = 277
      Width = 89
      Height = 46
      Caption = 'Tipo de Cálculo'
      ItemIndex = 0
      Items.Strings = (
        'Saldo'
        'Incremento')
      TabOrder = 5
    end
    object rg13: TRadioGroup
      Left = 288
      Top = 277
      Width = 63
      Height = 46
      Caption = 'Soma 1/3'
      ItemIndex = 0
      Items.Strings = (
        'Sim'
        'Não')
      TabOrder = 6
    end
    object gbxOrdem: TGroupBox
      Left = 356
      Top = 277
      Width = 166
      Height = 46
      Caption = 'Ordem de Impressão'
      TabOrder = 7
      object cmbOrderBy: TComboBox
        Left = 7
        Top = 16
        Width = 152
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
    object gbxTipoPapel: TGroupBox
      Left = 527
      Top = 277
      Width = 162
      Height = 46
      Caption = 'Tipo de Papel'
      TabOrder = 8
      object cmbTipoPapel: TComboBox
        Left = 6
        Top = 16
        Width = 150
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
      end
    end
  end
  inherited Dock971: TDock97
    Top = 334
    Width = 700
    inherited tb97Fundo: TToolbar97
      Left = 452
      DockPos = 530
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
    Left = 391
    Top = 24
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
    Left = 345
    Top = 24
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EMPRESA'
        ParamType = ptUnknown
      end>
  end
end
