inherited ParamRelFinanc: TParamRelFinanc
  Left = 265
  Top = 116
  BorderStyle = bsDialog
  Caption = 'ParamRelFinanc'
  ClientHeight = 561
  ClientWidth = 823
  DefaultMonitor = dmDesktop
  FormStyle = fsNormal
  Visible = False
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 823
    Height = 522
    object LabMatricula: TLabel
      Left = 7
      Top = 10
      Width = 55
      Height = 13
      Caption = 'Matrícula'
    end
    object LabNome: TLabel
      Left = 110
      Top = 10
      Width = 33
      Height = 13
      Caption = 'Nome'
    end
    object EdtMatricula: TEdit
      Left = 8
      Top = 25
      Width = 97
      Height = 21
      Color = clGrayText
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object EdtNome: TEdit
      Left = 111
      Top = 25
      Width = 420
      Height = 21
      Color = clGrayText
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object btPesquisa: TBitBtn
      Left = 532
      Top = 22
      Width = 32
      Height = 25
      TabOrder = 2
      OnClick = btPesquisaClick
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        1800000000000003000000000000000000000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF848484848484FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00
        0000000000FFFFFF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FF000000000000FFFFFFFFFFFFFFFFFF000000FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF000000000000FFFFFFFFFFFFFF
        FFFFFFFFFFFFFFFFFFFFFF000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFF000000FF00
        FFFF00FFFF00FFFF00FF000084FF00FFFF00FF848484FFFFFFFFFFFFFF0000FF
        0000FF0000FFFFFFFFFFFFFFFFFF000000FF00FFFF00FFFF00FF000084000084
        FF00FFFF00FF848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFF0000
        00FF00FFFF00FFFF00FF000084000084000084FF00FF848484FFFFFFFFFFFFFF
        0000FF0000FF0000FFFFFFFFFFFFFFFFFF000000FF00FFFF00FFFF00FF000084
        000084000084000000000000000000000000FFFFFFFFFFFFFFFFFFFF0000FFFF
        FFFFFFFF000000FF00FFFF00FFFF00FF000084000000FFFF00FF00FFFFFF00FF
        00FF000000848400FF0000FFFFFFFFFFFFFFFFFFFFFFFF000000FF00FFFF00FF
        000000FFFF00FF00FFFFFF00FF00FFFFFF00FF00FF000000FFFFFFFFFFFFFFFF
        FF848484848484FF00FFFF00FFFF00FF000000FF00FFFFFF00FF00FFFFFF00FF
        00FFFFFF00000000FFFFFF848484848484FF00FFFF00FFFF00FFFF00FFFF00FF
        000000FFFF00FF00FFFFFF00FF00FFFFFF00FF00FF000000848484FF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FF000000FF00FFFFFF00FF00FFFFFF00FF
        00FFFFFF00000000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FF000000FF00FFFFFF00FF00FFFFFF00000000FF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF00000000000000000000
        0000FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
    end
    object btClear: TBitBtn
      Left = 567
      Top = 22
      Width = 32
      Height = 25
      TabOrder = 3
      OnClick = btClearClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
        555557777F777555F55500000000555055557777777755F75555005500055055
        555577F5777F57555555005550055555555577FF577F5FF55555500550050055
        5555577FF77577FF555555005050110555555577F757777FF555555505099910
        555555FF75777777FF555005550999910555577F5F77777775F5500505509990
        3055577F75F77777575F55005055090B030555775755777575755555555550B0
        B03055555F555757575755550555550B0B335555755555757555555555555550
        BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
        50BB555555555555575F555555555555550B5555555555555575}
      NumGlyphs = 2
    end
    object GBCobranca1: TGroupBox
      Left = 9
      Top = 49
      Width = 170
      Height = 54
      Caption = 'Ano/Mês Cobrança Inicial'
      TabOrder = 4
      object EdtCobranca1: TMaskEdit
        Left = 53
        Top = 18
        Width = 76
        Height = 21
        EditMask = '!9999/99;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 7
        ParentFont = False
        TabOrder = 0
        Text = '    /  '
      end
    end
    object GBCobranca2: TGroupBox
      Left = 185
      Top = 49
      Width = 170
      Height = 54
      Caption = 'Ano/Mês Cobrança Final'
      TabOrder = 5
      object EdtCobranca2: TMaskEdit
        Left = 53
        Top = 18
        Width = 76
        Height = 21
        EditMask = '!9999/99;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 7
        ParentFont = False
        TabOrder = 0
        Text = '    /  '
      end
    end
    object GBReferencia1: TGroupBox
      Left = 9
      Top = 105
      Width = 170
      Height = 54
      Caption = 'Ano/Mês Referência Inicial'
      TabOrder = 6
      object EdtReferencia1: TMaskEdit
        Left = 53
        Top = 18
        Width = 76
        Height = 21
        EditMask = '!9999/99;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 7
        ParentFont = False
        TabOrder = 0
        Text = '    /  '
      end
    end
    object GBReferencia2: TGroupBox
      Left = 185
      Top = 105
      Width = 170
      Height = 54
      Caption = 'Ano/Mês Referência Final'
      TabOrder = 7
      object EdtReferencia2: TMaskEdit
        Left = 53
        Top = 18
        Width = 76
        Height = 21
        EditMask = '!9999/99;1;_'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        MaxLength = 7
        ParentFont = False
        TabOrder = 0
        Text = '    /  '
      end
    end
    object pnListas: TPanel
      Left = 8
      Top = 160
      Width = 803
      Height = 357
      TabOrder = 8
      object pnPatrocinadora: TPanel
        Left = 6
        Top = 8
        Width = 788
        Height = 77
        TabOrder = 0
        object LabPatrocinadoras: TLabel
          Left = 5
          Top = 3
          Width = 86
          Height = 13
          Caption = 'Patrocinadoras'
        end
        object chkListPatro: TCheckListBox
          Left = 175
          Top = 4
          Width = 455
          Height = 68
          OnClickCheck = chkListPatroClickCheck
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          Style = lbOwnerDrawFixed
          TabOrder = 0
          OnDrawItem = chkListPatroDrawItem
        end
        object btSelTudoPatro: TBitBtn
          Left = 636
          Top = 5
          Width = 140
          Height = 25
          Caption = 'Seleciona Tudo '
          TabOrder = 1
          OnClick = btSelTudoPatroClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000
            000FFFFFFFF88888888FFFFFFFF07797770FFFFFFFF8FF7FFF8FFFFFF0007999
            770FFFFFF888F777FF8FFFFFF0709979970FFFFFF8F877F77F8FFFF000709777
            990FFFF888F87FFF778FFFF070907777799FFFF8F878FFFFF77FF00070900000
            0099F888F87888888877F070907777799FFFF8F878FFFFF77FFFF07090000000
            99FFF8F87888888877FFF0907777799FFFFFF878FFFFF77FFFFFF09000000099
            FFFFF87888888877FFFFF07777799FFFFFFFF8FFFFF77FFFFFFFF000000099FF
            FFFFF888888877FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          NumGlyphs = 2
        end
        object btDesSelTudoPatro: TBitBtn
          Left = 636
          Top = 32
          Width = 140
          Height = 25
          Caption = 'Inverte Seleção'
          TabOrder = 2
          OnClick = btSelTudoPatroClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000FFFFFFFF88888888FFFFFFFF0777
            7770FFFFFFFF8FFFFFF8FFF000FF07777770FFF788FF8FFFFFF8FFF0FFFF0777
            7770FFF8FFFF8FFFFFF8FF000FFF07777770FF778FFF8FFFFFF8FFF0FFFF0777
            7770FFF8FFFF8FFFFFF8FFFFFFFF00000000FFFFFFFF8888888800000000FFFF
            FFFF88888888FFFFFFFF07797770FFFF0FFF8FF7FFF8FFFF8FFF07999770FFF0
            00FF8F777FF8FFF877FF09979970FFFF0FFF877F77F8FFFF8FFF09777990FF00
            0FFF87FFF778FF887FFF07777799FFFFFFFF8FFFFF77FFFFFFFF000000099FFF
            FFFF888888877FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          NumGlyphs = 2
        end
      end
      object pnPlanosContabeis: TPanel
        Left = 6
        Top = 86
        Width = 788
        Height = 77
        TabOrder = 1
        object LabPlanosContabeis: TLabel
          Left = 4
          Top = 3
          Width = 99
          Height = 13
          Caption = 'Planos Contábeis'
        end
        object chkListPlanos: TCheckListBox
          Left = 175
          Top = 4
          Width = 455
          Height = 68
          OnClickCheck = chkListPlanosClickCheck
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          Style = lbOwnerDrawFixed
          TabOrder = 0
          OnDrawItem = chkListPlanosDrawItem
        end
        object btSelTudoPlanos: TBitBtn
          Left = 636
          Top = 5
          Width = 140
          Height = 25
          Caption = 'Seleciona Tudo '
          TabOrder = 1
          OnClick = btSelTudoPatroClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000
            000FFFFFFFF88888888FFFFFFFF07797770FFFFFFFF8FF7FFF8FFFFFF0007999
            770FFFFFF888F777FF8FFFFFF0709979970FFFFFF8F877F77F8FFFF000709777
            990FFFF888F87FFF778FFFF070907777799FFFF8F878FFFFF77FF00070900000
            0099F888F87888888877F070907777799FFFF8F878FFFFF77FFFF07090000000
            99FFF8F87888888877FFF0907777799FFFFFF878FFFFF77FFFFFF09000000099
            FFFFF87888888877FFFFF07777799FFFFFFFF8FFFFF77FFFFFFFF000000099FF
            FFFFF888888877FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          NumGlyphs = 2
        end
        object btDesSelTudoPlanos: TBitBtn
          Left = 636
          Top = 32
          Width = 140
          Height = 25
          Caption = 'Inverte Seleção'
          TabOrder = 2
          OnClick = btSelTudoPatroClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000FFFFFFFF88888888FFFFFFFF0777
            7770FFFFFFFF8FFFFFF8FFF000FF07777770FFF788FF8FFFFFF8FFF0FFFF0777
            7770FFF8FFFF8FFFFFF8FF000FFF07777770FF778FFF8FFFFFF8FFF0FFFF0777
            7770FFF8FFFF8FFFFFF8FFFFFFFF00000000FFFFFFFF8888888800000000FFFF
            FFFF88888888FFFFFFFF07797770FFFF0FFF8FF7FFF8FFFF8FFF07999770FFF0
            00FF8F777FF8FFF877FF09979970FFFF0FFF877F77F8FFFF8FFF09777990FF00
            0FFF87FFF778FF887FFF07777799FFFFFFFF8FFFFF77FFFFFFFF000000099FFF
            FFFF888888877FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          NumGlyphs = 2
        end
      end
      object pnSituacoesDosPagamentos: TPanel
        Left = 6
        Top = 164
        Width = 788
        Height = 77
        TabOrder = 2
        object LabSituacoesDosParticipantes: TLabel
          Left = 4
          Top = 3
          Width = 163
          Height = 13
          Caption = 'Situações dos Participantes '
        end
        object chkListSituacoes: TCheckListBox
          Left = 175
          Top = 4
          Width = 455
          Height = 69
          OnClickCheck = chkListSituacoesClickCheck
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          Style = lbOwnerDrawFixed
          TabOrder = 0
          OnDrawItem = chkListSituacoesDrawItem
        end
        object btSelTudoSituacoes: TBitBtn
          Left = 636
          Top = 5
          Width = 140
          Height = 25
          Caption = 'Seleciona Tudo '
          TabOrder = 1
          OnClick = btSelTudoPatroClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000
            000FFFFFFFF88888888FFFFFFFF07797770FFFFFFFF8FF7FFF8FFFFFF0007999
            770FFFFFF888F777FF8FFFFFF0709979970FFFFFF8F877F77F8FFFF000709777
            990FFFF888F87FFF778FFFF070907777799FFFF8F878FFFFF77FF00070900000
            0099F888F87888888877F070907777799FFFF8F878FFFFF77FFFF07090000000
            99FFF8F87888888877FFF0907777799FFFFFF878FFFFF77FFFFFF09000000099
            FFFFF87888888877FFFFF07777799FFFFFFFF8FFFFF77FFFFFFFF000000099FF
            FFFFF888888877FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          NumGlyphs = 2
        end
        object btDesSelTudoSituacoes: TBitBtn
          Left = 636
          Top = 32
          Width = 140
          Height = 25
          Caption = 'Inverte Seleção'
          TabOrder = 2
          OnClick = btSelTudoPatroClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000FFFFFFFF88888888FFFFFFFF0777
            7770FFFFFFFF8FFFFFF8FFF000FF07777770FFF788FF8FFFFFF8FFF0FFFF0777
            7770FFF8FFFF8FFFFFF8FF000FFF07777770FF778FFF8FFFFFF8FFF0FFFF0777
            7770FFF8FFFF8FFFFFF8FFFFFFFF00000000FFFFFFFF8888888800000000FFFF
            FFFF88888888FFFFFFFF07797770FFFF0FFF8FF7FFF8FFFF8FFF07999770FFF0
            00FF8F777FF8FFF877FF09979970FFFF0FFF877F77F8FFFF8FFF09777990FF00
            0FFF87FFF778FF887FFF07777799FFFFFFFF8FFFFF77FFFFFFFF000000099FFF
            FFFF888888877FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          NumGlyphs = 2
        end
      end
      object pnContribuicoes: TPanel
        Left = 6
        Top = 243
        Width = 788
        Height = 111
        TabOrder = 3
        object LabContribuicoes: TLabel
          Left = 4
          Top = 3
          Width = 78
          Height = 13
          Caption = 'Contribuições'
        end
        object chkListContribuicoes: TCheckListBox
          Left = 175
          Top = 4
          Width = 455
          Height = 89
          OnClickCheck = chkListContribuicoesClickCheck
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
          ParentFont = False
          Style = lbOwnerDrawFixed
          TabOrder = 0
          OnDrawItem = chkListContribuicoesDrawItem
        end
        object btSelTudoContribuicoes: TBitBtn
          Left = 636
          Top = 5
          Width = 140
          Height = 25
          Caption = 'Seleciona Tudo '
          TabOrder = 1
          OnClick = btSelTudoPatroClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00000
            000FFFFFFFF88888888FFFFFFFF07797770FFFFFFFF8FF7FFF8FFFFFF0007999
            770FFFFFF888F777FF8FFFFFF0709979970FFFFFF8F877F77F8FFFF000709777
            990FFFF888F87FFF778FFFF070907777799FFFF8F878FFFFF77FF00070900000
            0099F888F87888888877F070907777799FFFF8F878FFFFF77FFFF07090000000
            99FFF8F87888888877FFF0907777799FFFFFF878FFFFF77FFFFFF09000000099
            FFFFF87888888877FFFFF07777799FFFFFFFF8FFFFF77FFFFFFFF000000099FF
            FFFFF888888877FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          NumGlyphs = 2
        end
        object btDesSelTudoContribuicoes: TBitBtn
          Left = 636
          Top = 32
          Width = 140
          Height = 25
          Caption = 'Inverte Seleção'
          TabOrder = 2
          OnClick = btSelTudoPatroClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00FFFFFFFFFFFF
            FFFFFFFFFFFFFFFFFFFFFFFFFFFF00000000FFFFFFFF88888888FFFFFFFF0777
            7770FFFFFFFF8FFFFFF8FFF000FF07777770FFF788FF8FFFFFF8FFF0FFFF0777
            7770FFF8FFFF8FFFFFF8FF000FFF07777770FF778FFF8FFFFFF8FFF0FFFF0777
            7770FFF8FFFF8FFFFFF8FFFFFFFF00000000FFFFFFFF8888888800000000FFFF
            FFFF88888888FFFFFFFF07797770FFFF0FFF8FF7FFF8FFFF8FFF07999770FFF0
            00FF8F777FF8FFF877FF09979970FFFF0FFF877F77F8FFFF8FFF09777990FF00
            0FFF87FFF778FF887FFF07777799FFFFFFFF8FFFFF77FFFFFFFF000000099FFF
            FFFF888888877FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF}
          NumGlyphs = 2
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 522
    Width = 823
    inherited tb97Fundo: TToolbar97
      Left = 651
      DockPos = 711
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 482
      DockPos = 541
      inherited bbtnConfirmar: TBitBtn
        ModalResult = 0
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 747
    Top = 83
    TargetsData = (
      1
      2
      (
        ''
        'Filter'
        0)
      (
        ''
        'Title'
        0))
  end
  object MontaSelect1: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'ELEGPATRO.MATRICULA'
      'PESSOA.NOME'
      'PESSOA.NUMDOCUMENTO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Nome'
      'CPF')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'ELEGPATRO'
      'PESSOA')
    CamposChave.Strings = (
      'ELEGPATRO.MATRICULA'
      'PESSOA.NOME'
      'PESSOA.IDPESSOA')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = ELEGPATRO.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '13'
      '60'
      '18')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1')
    ApenasLetraENum.Strings = (
      'N'
      'N'
      'N')
    ComparaMaiuscula.Strings = (
      ''
      ''
      '')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      '')
    Left = 664
    Top = 80
  end
end
