inherited frmAlimReservasReplan: TfrmAlimReservasReplan
  Left = 195
  Top = 165
  HelpContext = 3360026
  Caption = 'Alimentação RÁPIDA de reservas Replan '
  ClientHeight = 313
  ClientWidth = 397
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 397
    Height = 274
    object Label1: TLabel
      Left = 53
      Top = 25
      Width = 89
      Height = 13
      Caption = 'Ano/Mês inicial'
    end
    object Label2: TLabel
      Left = 53
      Top = 49
      Width = 80
      Height = 13
      Caption = 'Ano/Mês final'
    end
    object spedAnoCobIni: TSpinEdit
      Left = 153
      Top = 21
      Width = 67
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 4
      MaxValue = 0
      MinValue = 0
      ParentFont = False
      TabOrder = 0
      Value = 1998
    end
    object spedAnoCobFim: TSpinEdit
      Left = 153
      Top = 47
      Width = 67
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      MaxLength = 4
      MaxValue = 0
      MinValue = 0
      ParentFont = False
      TabOrder = 1
      Value = 1998
    end
    object GroupBox2: TGroupBox
      Left = 1
      Top = 92
      Width = 395
      Height = 181
      Align = alBottom
      Caption = ' Escolher um Participante '
      TabOrder = 2
      object lblParticip: TLabel
        Left = 11
        Top = 19
        Width = 56
        Height = 13
        Caption = 'Participante'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label3: TLabel
        Left = 11
        Top = 58
        Width = 97
        Height = 13
        Caption = 'Plano Previdenciário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblPatro: TLabel
        Left = 11
        Top = 97
        Width = 66
        Height = 13
        Caption = 'Patrocinadora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblMatricula: TLabel
        Left = 205
        Top = 97
        Width = 45
        Height = 13
        Caption = 'Matrícula'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object edNome: TEdit
        Left = 11
        Top = 34
        Width = 304
        Height = 24
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object edPlano: TEdit
        Left = 11
        Top = 74
        Width = 304
        Height = 24
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object edPatro: TEdit
        Left = 11
        Top = 114
        Width = 188
        Height = 24
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object edMatricula: TEdit
        Left = 205
        Top = 114
        Width = 110
        Height = 24
        Color = clSilver
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
      object bbtnProcurar: TBitBtn
        Left = 12
        Top = 141
        Width = 88
        Height = 37
        Hint = 'Procurar participante'
        Caption = '&Procurar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        OnClick = bbtnProcurarClick
        Glyph.Data = {
          4E010000424D4E01000000000000760000002800000012000000120000000100
          040000000000D800000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
          DDDDDD000000DDDDDDDDDDDDDDDDDD000000D000000000000DD00D000000D0FF
          FFFFFFFF0D000D000000D0FFFFFFF0000800DD000000D0FFFFFF0877808DDD00
          0000D0FFFFF0877E880DDD000000D0FFFFF07777870DDD000000D0FFFFF07E77
          870DDD000000D0FFFFF08EE7880DDD000000D0FFFFFF087780DDDD000000D0FF
          FFFFF0000DDDDD000000D0FFFFFFFFFF0DDDDD000000D0FFFFFFF0000DDDDD00
          0000D0FFFFFFF070DDDDDD000000D0FFFFFFF00DDDDDDD000000DD00000000DD
          DDDDDD000000DDDDDDDDDDDDDDDDDD000000}
      end
      object btndesfazselec: TBitBtn
        Left = 102
        Top = 141
        Width = 88
        Height = 37
        Hint = 'Procurar participante'
        Caption = 'Limpar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 5
        OnClick = btndesfazselecClick
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
    end
    object cmbMesCobIni: TComboBox
      Left = 225
      Top = 21
      Width = 96
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 3
      Text = 'janeiro'
      Items.Strings = (
        'janeiro'
        'fevereiro'
        'março'
        'abril'
        'maio'
        'junho'
        'julho'
        'agosto'
        'setembro '
        'outubro'
        'novembro'
        'dezembro')
    end
    object cmbMesCobFim: TComboBox
      Left = 225
      Top = 47
      Width = 96
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 4
      Text = 'janeiro'
      Items.Strings = (
        'janeiro'
        'fevereiro'
        'março'
        'abril'
        'maio'
        'junho'
        'julho'
        'agosto'
        'setembro '
        'outubro'
        'novembro'
        'dezembro')
    end
  end
  inherited Dock971: TDock97
    Top = 274
    Width = 397
    inherited tb97Fundo: TToolbar97
      Left = 225
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 56
      inherited bbtnConfirmar: TBitBtn
        ModalResult = 0
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 65531
    Top = 115
  end
  object StrProcAlimenta: TStoredProc
    DatabaseName = 'BaseDados'
    StoredProcName = 'SP_EXEC_ALIMENTARESERVAS'
    Left = 32
    Top = 144
    ParamData = <
      item
        DataType = ftString
        Name = 'PMESINI'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'PMESFIM'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDPESSOA'
        ParamType = ptInput
      end>
  end
  object MontaSelectPart: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'ELEGPATRO.MATRICULA'
      'PESSOA.NOME'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PLANPREV.NOME'
      'PATRO.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Participante'
      'N° de Inscrição'
      'Plano Previdenciário'
      'Patrocinadora')
    SensivelACaixa.Strings = (
      'S'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'ELEGIVEL'
      'PESSOA'
      'ELEGPATRO'
      'PARTPREVPLAN'
      'PESSOA PATRO'
      'PLANPREV')
    CamposChave.Strings = (
      'ELEGPATRO.IDPESSOA'
      'ELEGPATRO.IDPESSJUR'
      'PESSOA.NOME'
      'ELEGPATRO.MATRICULA'
      'PATRO.NOME AS PATRO'
      'PARTPREVPLAN.IDPLANOPREV'
      'PLANPREV.NOME'
      'PARTPREVPLAN.SEQPROPOSTA')
    Filtro.Strings = (
      'PESSOA.IDPESSOA=ELEGIVEL.IDPESSOA'
      'ELEGIVEL.IDPESSOA = ELEGPATRO.IDPESSOA'
      'ELEGPATRO.IDPESSOA = PARTPREVPLAN.IDPESSOA'
      'ELEGPATRO.IDPESSJUR = PARTPREVPLAN.IDPESSJUR'
      'PATRO.IDPESSOA = ELEGPATRO.IDPESSJUR'
      'PARTPREVPLAN.IDPLANOPREV = PLANPREV.IDPLANOPREV')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '10'
      '30'
      '10'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 72
    Top = 136
  end
end
