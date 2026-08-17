inherited frmParamCAGEDMagnetico: TfrmParamCAGEDMagnetico
  Left = 30
  Top = 121
  HelpContext = 210088
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsToolWindow
  Caption = 'CAGED (Meio Magnético)'
  ClientHeight = 397
  ClientWidth = 718
  Font.Style = []
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 718
    Height = 358
    BorderWidth = 2
    object gbxEstab: TGroupBox
      Left = 9
      Top = 27
      Width = 472
      Height = 93
      Caption = 'Estabelecimento(s)'
      TabOrder = 0
      object chklstEstab: TCheckListBox
        Left = 8
        Top = 14
        Width = 321
        Height = 71
        OnClickCheck = chklstEstabClickCheck
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        Style = lbOwnerDrawFixed
        TabOrder = 0
        OnDrawItem = chklstEstabDrawItem
      end
      object bbtnSelTodos: TBitBtn
        Left = 334
        Top = 14
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
        Left = 334
        Top = 41
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
    object gbxAnoMesRef: TGroupBox
      Left = 486
      Top = 73
      Width = 221
      Height = 45
      Caption = 'Mês e Ano de Referência'
      TabOrder = 3
      object cmbMes: TComboBox
        Left = 54
        Top = 16
        Width = 94
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 1
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
        Left = 152
        Top = 16
        Width = 61
        Height = 22
        MaxLength = 4
        MaxValue = 3000
        MinValue = 1967
        TabOrder = 2
        Value = 1967
        OnChange = speAnoChange
      end
      object speDia: TSpinEdit
        Left = 8
        Top = 16
        Width = 41
        Height = 22
        MaxLength = 4
        MaxValue = 31
        MinValue = 1
        TabOrder = 0
        Value = 1
        Visible = False
      end
    end
    object gbxResp: TGroupBox
      Left = 9
      Top = 168
      Width = 267
      Height = 45
      Caption = 'Estabelecimento Responsável pela Informação'
      TabOrder = 7
      object dblkcbResp: TwwDBLookupCombo
        Left = 8
        Top = 16
        Width = 251
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'NOME')
        LookupTable = qryNomeResp
        LookupField = 'CODIGO'
        Style = csDropDownList
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        OnChange = speAnoChange
      end
    end
    object gbxNumAutoriz: TGroupBox
      Left = 600
      Top = 27
      Width = 108
      Height = 45
      Caption = 'Nº da Autorização'
      TabOrder = 2
      object mkedNumAutoriz: TMaskEdit
        Left = 16
        Top = 16
        Width = 74
        Height = 21
        Hint = 
          'Número da Autorização fornecido pelo Ministério do Trabalho e Em' +
          'prego'
        EditMask = '999999-9;0;_'
        MaxLength = 8
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
      end
    end
    object gbxAlteracao: TGroupBox
      Left = 487
      Top = 122
      Width = 221
      Height = 91
      Caption = 'Alteração de Dados Cadastrais do'
      TabOrder = 6
      object pgctrlAltCad: TPageControl
        Left = 6
        Top = 17
        Width = 209
        Height = 68
        ActivePage = tbshResponsavel
        TabOrder = 0
        object tbshResponsavel: TTabSheet
          Caption = '&Responsável'
          object cmbAlteracaoResp: TComboBox
            Left = 5
            Top = 9
            Width = 191
            Height = 19
            Style = csOwnerDrawFixed
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              'Nada a alterar'
              'Alterar dados cadastrais')
          end
        end
        object tbshEstab: TTabSheet
          Caption = '&Estabelecimentos'
          object cmbAlteracaoEstab: TComboBox
            Left = 5
            Top = 9
            Width = 191
            Height = 19
            Style = csOwnerDrawFixed
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              'Nada a alterar'
              'Alterar dados cadastrais'
              'Encerramento de Atividades')
          end
        end
      end
    end
    object rgTipoDeclarac: TRadioGroup
      Left = 9
      Top = 122
      Width = 267
      Height = 45
      Caption = 'Tipo de Declaração'
      Columns = 2
      ItemIndex = 1
      Items.Strings = (
        'Primeira Vez'
        'Já Declarou Antes')
      TabOrder = 4
    end
    object rgMeioInf: TRadioGroup
      Left = 282
      Top = 168
      Width = 199
      Height = 45
      Caption = 'Meio Informado'
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'Disquete'
        'Fita'
        'Outros')
      TabOrder = 8
    end
    object rgMicroEmpr: TRadioGroup
      Left = 282
      Top = 122
      Width = 199
      Height = 45
      Caption = 'Pequena / Micro Empresa ?'
      Columns = 2
      ItemIndex = 1
      Items.Strings = (
        'Sim'
        'Não')
      TabOrder = 5
    end
    object gbxRubSal: TGroupBox
      Left = 10
      Top = 216
      Width = 471
      Height = 132
      Caption = 
        'Rubricas que compõem o Salário (Nenhuma para considerar o Salári' +
        'o Contratual)'
      ParentShowHint = False
      ShowHint = False
      TabOrder = 9
      object Label1: TLabel
        Left = 8
        Top = 88
        Width = 159
        Height = 13
        Caption = 'Procura por Rubricas pelo Código'
      end
      object chklstRubrica: TCheckListBox
        Left = 8
        Top = 14
        Width = 455
        Height = 71
        OnClickCheck = chklstRubricaClickCheck
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
        OnDrawItem = chklstEstabDrawItem
      end
      object edCodRubricas: TEdit
        Left = 8
        Top = 103
        Width = 347
        Height = 21
        Hint = 
          'Digite aqui o código das Rubricas a procurar separados por vírgu' +
          'la'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
      end
      object sbtnMarcarRub: TBitBtn
        Left = 360
        Top = 99
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
    object gbxTipoFunc: TGroupBox
      Left = 487
      Top = 216
      Width = 221
      Height = 132
      Caption = 'Tipos de Funcionários a considerar'
      TabOrder = 10
      object cbxEfetivos: TCheckBox
        Left = 8
        Top = 20
        Width = 65
        Height = 17
        Caption = 'Efetivos'
        TabOrder = 0
        OnClick = speAnoChange
        OnExit = speAnoChange
      end
      object cbxEspeciais: TCheckBox
        Left = 8
        Top = 44
        Width = 110
        Height = 17
        Caption = 'Efetivos Especiais'
        TabOrder = 1
        OnClick = speAnoChange
        OnExit = speAnoChange
      end
      object cbxTemporarios: TCheckBox
        Left = 8
        Top = 68
        Width = 82
        Height = 17
        Caption = 'Temporários'
        TabOrder = 2
        OnClick = speAnoChange
        OnExit = speAnoChange
      end
      object cbxTerceiros: TCheckBox
        Left = 8
        Top = 92
        Width = 66
        Height = 17
        Caption = 'Terceiros'
        TabOrder = 3
        OnClick = speAnoChange
        OnExit = speAnoChange
      end
      object cbxEstagiarios: TCheckBox
        Left = 119
        Top = 20
        Width = 74
        Height = 17
        Caption = 'Estagiários'
        TabOrder = 4
        OnClick = speAnoChange
        OnExit = speAnoChange
      end
      object cbxProprietarios: TCheckBox
        Left = 119
        Top = 44
        Width = 97
        Height = 17
        Caption = 'Prop/Dir s/ Vinc'
        TabOrder = 5
        OnClick = speAnoChange
        OnExit = speAnoChange
      end
      object cbxAutonomos: TCheckBox
        Left = 119
        Top = 68
        Width = 75
        Height = 17
        Caption = 'Autônomos'
        TabOrder = 6
        OnClick = speAnoChange
        OnExit = speAnoChange
      end
    end
    object pnlHorario: TPanel
      Left = 5
      Top = 5
      Width = 708
      Height = 21
      BevelInner = bvLowered
      Caption = 'Tempo Decorrido'
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 11
    end
    object rgTipoInf: TRadioGroup
      Left = 486
      Top = 27
      Width = 108
      Height = 46
      Caption = 'Tipo de Informação'
      ItemIndex = 0
      Items.Strings = (
        'Normal'
        'Acerto')
      TabOrder = 1
      OnClick = rgTipoInfExit
      OnExit = rgTipoInfExit
    end
  end
  inherited Dock971: TDock97
    Top = 358
    Width = 718
    inherited tb97Fundo: TToolbar97
      Left = 413
      inherited sep1: TToolbarSep97
        Left = 219
      end
      object ToolbarSep972: TToolbarSep97 [1]
        Left = 109
        Top = 0
        Blank = True
        SizeHorz = 30
      end
      inherited bbtnSair: TBitBtn
        Left = 139
        TabOrder = 1
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 221
        TabOrder = 2
      end
      object rbtnGerar: TBitBtn
        Left = 0
        Top = 0
        Width = 109
        Height = 33
        Caption = '  &Gerar Arquivo'
        Default = True
        TabOrder = 0
        OnClick = rbtnGerarClick
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
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 311
    Top = 234
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object svdlgDialogo: TOpenDialog
    Filter = 'Arquivos Texto|*.TXT|Todos|*.*'
    InitialDir = 'C:\CAGED'
    Options = [ofHideReadOnly, ofPathMustExist, ofNoNetworkButton]
    Title = 'Escolha a Pasta para a Geração do CAGED Magnético'
    Left = 368
    Top = 234
  end
  object qryParamRH: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  NORMALINI, NORMALFIM, FERIASFIM, PGTO13FIM'
      'FROM'
      '  PARAMRH')
    ValidateWithMask = True
    Left = 43
    Top = 246
  end
  object qryCAGED: TwwQuery
    BeforeOpen = qryCAGEDBeforeOpen
    AfterOpen = qryCAGEDAfterOpen
    AfterScroll = qryCAGEDAfterScroll
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 43
    Top = 234
  end
  object qryNomeResp: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  PJ.IDPESSOA AS CODIGO, PJ.NOME'
      'FROM'
      '  PESSOA PJ, FILIALPESSOA FP'
      'WHERE'
      ''
      '  (PJ.IDGRUPO        = :EMPRESA) AND'
      '  (FP.IDFILIALPESSOA = PJ.IDPESSOA)')
    ValidateWithMask = True
    Left = 185
    Top = 246
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EMPRESA'
        ParamType = ptUnknown
      end>
  end
  object qryResp: TwwQuery
    BeforeOpen = qryRespBeforeOpen
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 185
    Top = 233
  end
  object qryNomeEstab: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  PJ.IDPESSOA AS CODIGO, PJ.NOME'
      'FROM'
      '  PESSOA PJ, FILIALPESSOA FP'
      'WHERE'
      ''
      '  (PJ.IDGRUPO        = :EMPRESA) AND'
      '  (FP.IDFILIALPESSOA = PJ.IDPESSOA)')
    ValidateWithMask = True
    Left = 112
    Top = 246
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EMPRESA'
        ParamType = ptUnknown
      end>
  end
  object qryEstab: TwwQuery
    BeforeOpen = qryEstabBeforeOpen
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 112
    Top = 234
  end
  object qryRubrica: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  RP.CODPROVDESC, RP.DESCRPROVDESC'
      'FROM'
      '  RUBRICAXPESS RP, PROVDESC PD'
      'WHERE'
      '  (RP.IDPESSOA   = :IDEMPRESA) AND'
      '  (PD.FLGTPRUBRICA LIKE '#39'%F%'#39') AND'
      '  (PD.IDPROVENTO = RP.IDRUBRICA)'
      'ORDER BY'
      '  UPPER(DESCRPROVDESC)')
    ValidateWithMask = True
    Left = 242
    Top = 235
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end>
  end
end
