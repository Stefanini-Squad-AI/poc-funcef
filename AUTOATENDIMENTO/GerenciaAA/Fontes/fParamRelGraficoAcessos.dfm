inherited frmParamRelGraficoAcessos: TfrmParamRelGraficoAcessos
  Left = 279
  Top = 168
  BorderIcons = [biSystemMenu]
  BorderStyle = bsDialog
  Caption = 'Parâmetros do Gráfico de Acessos por Página'
  ClientHeight = 340
  ClientWidth = 452
  FormStyle = fsNormal
  Visible = False
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 452
    Height = 301
    object GroupBox1: TGroupBox
      Left = 13
      Top = 10
      Width = 295
      Height = 81
      Caption = 'Período'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object Label1: TLabel
        Left = 158
        Top = 48
        Width = 19
        Height = 13
        Caption = 'até'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rbPerTodos: TRadioButton
        Left = 8
        Top = 24
        Width = 65
        Height = 17
        Caption = 'Todos'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        TabStop = True
        OnClick = rbPerEspecClick
      end
      object rbPerEspec: TRadioButton
        Left = 8
        Top = 48
        Width = 41
        Height = 17
        Caption = 'De'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = rbPerEspecClick
      end
      object dtpckrDe: TwwDBDateTimePicker
        Left = 49
        Top = 45
        Width = 104
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        Epoch = 1950
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ShowButton = True
        TabOrder = 2
      end
      object dtpckrAte: TwwDBDateTimePicker
        Left = 183
        Top = 45
        Width = 104
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        Epoch = 1950
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ShowButton = True
        TabOrder = 3
      end
    end
    object GroupBox2: TGroupBox
      Left = 13
      Top = 98
      Width = 428
      Height = 81
      Caption = 'Interface'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      object btnPesqInterface: TSpeedButton
        Left = 388
        Top = 45
        Width = 23
        Height = 22
        Enabled = False
        Glyph.Data = {
          42020000424D4202000000000000420000002800000010000000100000000100
          1000030000000002000000000000000000000000000000000000007C0000E003
          00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C104210421F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000FF7F00001F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000FF7FFF7FFF7F00001F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C00000000FF7FFF7FFF7FFF7FFF7FFF7F00001F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1042FF7FFF7FFF7FFF7FFF7F1F00FF7F00001F7C
          1F7C1F7C1F7C00401F7C1F7C1042FF7FFF7F1F001F001F00FF7FFF7FFF7F0000
          1F7C1F7C1F7C004000401F7C1F7C1042FF7FFF7FFF7FFF7FFF7F1F00FF7F0000
          1F7C1F7C1F7C0040004000401F7C1042FF7FFF7F1F001F001F00FF7FFF7FFF7F
          00001F7C1F7C1F7C0040004000400000000000000000FF7FFF7FFF7F1F00FF7F
          FF7F00001F7C1F7C1F7C00400000FF031F7CFF031F7C000010021F00FF7FFF7F
          FF7FFF7F00001F7C1F7C0000FF031F7CFF031F7CFF031F7C0000FF7FFF7FFF7F
          104210421F7C1F7C1F7C00001F7CFF031F7CFF031F7CFF030000FF7F10421042
          1F7C1F7C1F7C1F7C1F7C0000FF031F7CFF031F7CFF031F7C000010421F7C1F7C
          1F7C1F7C1F7C1F7C1F7C00001F7CFF031F7CFF031F7CFF0300001F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C00001F7CFF031F7CFF0300001F7C1F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000000000001F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C}
        OnClick = btnPesqInterfaceClick
      end
      object rbIntTodas: TRadioButton
        Left = 8
        Top = 24
        Width = 65
        Height = 17
        Caption = 'Todas'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        TabStop = True
        OnClick = rbIntTodasClick
      end
      object rbIntEspec: TRadioButton
        Left = 8
        Top = 48
        Width = 81
        Height = 17
        Caption = 'Interface:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = rbIntTodasClick
      end
      object edtInterface: TEdit
        Left = 88
        Top = 46
        Width = 300
        Height = 21
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
    end
    object GroupBox3: TGroupBox
      Left = 13
      Top = 186
      Width = 428
      Height = 81
      Caption = 'Usuário:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 3
      object btnPesqUsuario: TSpeedButton
        Left = 388
        Top = 45
        Width = 23
        Height = 22
        Enabled = False
        Glyph.Data = {
          42020000424D4202000000000000420000002800000010000000100000000100
          1000030000000002000000000000000000000000000000000000007C0000E003
          00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C104210421F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000FF7F00001F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000FF7FFF7FFF7F00001F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C00000000FF7FFF7FFF7FFF7FFF7FFF7F00001F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1042FF7FFF7FFF7FFF7FFF7F1F00FF7F00001F7C
          1F7C1F7C1F7C00401F7C1F7C1042FF7FFF7F1F001F001F00FF7FFF7FFF7F0000
          1F7C1F7C1F7C004000401F7C1F7C1042FF7FFF7FFF7FFF7FFF7F1F00FF7F0000
          1F7C1F7C1F7C0040004000401F7C1042FF7FFF7F1F001F001F00FF7FFF7FFF7F
          00001F7C1F7C1F7C0040004000400000000000000000FF7FFF7FFF7F1F00FF7F
          FF7F00001F7C1F7C1F7C00400000FF031F7CFF031F7C000010021F00FF7FFF7F
          FF7FFF7F00001F7C1F7C0000FF031F7CFF031F7CFF031F7C0000FF7FFF7FFF7F
          104210421F7C1F7C1F7C00001F7CFF031F7CFF031F7CFF030000FF7F10421042
          1F7C1F7C1F7C1F7C1F7C0000FF031F7CFF031F7CFF031F7C000010421F7C1F7C
          1F7C1F7C1F7C1F7C1F7C00001F7CFF031F7CFF031F7CFF0300001F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C00001F7CFF031F7CFF0300001F7C1F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000000000001F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C}
        OnClick = btnPesqUsuarioClick
      end
      object rbUsuTodos: TRadioButton
        Left = 8
        Top = 24
        Width = 65
        Height = 17
        Caption = 'Todos'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        TabStop = True
        OnClick = rbUsuTodosClick
      end
      object rbUsuEspec: TRadioButton
        Left = 8
        Top = 48
        Width = 73
        Height = 17
        Caption = 'Usuário:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = rbUsuTodosClick
      end
      object edtUsuario: TEdit
        Left = 88
        Top = 46
        Width = 300
        Height = 21
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
    end
    object GroupBox5: TGroupBox
      Left = 321
      Top = 10
      Width = 119
      Height = 81
      Caption = 'Exibir'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      object rbTotais: TRadioButton
        Left = 16
        Top = 24
        Width = 65
        Height = 17
        Caption = 'Totais'
        Checked = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        TabStop = True
      end
      object rbPercentuais: TRadioButton
        Left = 16
        Top = 48
        Width = 89
        Height = 17
        Caption = 'Percentuais'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
    end
    object cbMesmaSessao: TCheckBox
      Left = 13
      Top = 272
      Width = 460
      Height = 17
      Caption = 'Considerar páginas acessadas na mesma sessão apenas uma vez.'
      TabOrder = 4
    end
  end
  inherited Dock971: TDock97
    Top = 301
    Width = 452
    inherited tb97Fundo: TToolbar97
      Left = 282
      inherited sep3: TToolbarSep97
        Visible = False
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Visible = False
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 115
      inherited ToolbarSep971: TToolbarSep97
        Visible = False
      end
      inherited bbtnConfirmar: TBitBtn
        ModalResult = 0
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 187
    Top = 195
  end
  object msInterface: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Interface...'
    Colunas.Strings = (
      'WEBINTERFACE.IDWEBINTERFACE'
      'WEBINTERFACE.NOMEINTERFACE')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Id. Interface'
      '')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'WEBINTERFACE')
    CamposChave.Strings = (
      'WEBINTERFACE.IDWEBINTERFACE'
      'WEBINTERFACE.NOMEINTERFACE')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '50')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 381
    Top = 106
  end
  object msUsuario: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Usuário...'
    Colunas.Strings = (
      'VWPARTICIPDEPEN.MATRICULA'
      'VWPARTICIPDEPEN.INSCRICAONUMERO'
      'WEBACESSO.LOGINPESSOAL'
      'VWPARTICIPDEPEN.NOME')
    TipodeDado.Strings = (
      'C'
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Inscrição'
      'Login'
      'Nome')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'VWPARTICIPDEPEN'
      'WEBACESSO')
    CamposChave.Strings = (
      'VWPARTICIPDEPEN.IDPESSOA'
      'VWPARTICIPDEPEN.NOME')
    Filtro.Strings = (
      'VWPARTICIPDEPEN.IDPESSOA = WEBACESSO.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '13'
      '10'
      '20'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 381
    Top = 194
  end
end
