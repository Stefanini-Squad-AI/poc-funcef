inherited frmExecutaFormaCalc: TfrmExecutaFormaCalc
  Left = 82
  Top = 79
  ActiveControl = edtNumero
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Execução de Regras ou Formas de Cálculo'
  ClientHeight = 449
  ClientWidth = 615
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 615
    Height = 410
    BorderWidth = 2
    object Bevel3: TBevel
      Left = 4
      Top = 4
      Width = 453
      Height = 117
    end
    object fcLabel1: TfcLabel
      Left = 8
      Top = 123
      Width = 597
      Height = 22
      AutoSize = False
      Caption = 'Dados de Entrada'
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TextOptions.Alignment = taCenter
      TextOptions.Shadow.Enabled = True
      TextOptions.Shadow.XOffset = 1
      TextOptions.Shadow.YOffset = 2
      TextOptions.VAlignment = vaTop
    end
    object Label11: TLabel
      Left = 14
      Top = 260
      Width = 42
      Height = 16
      Caption = 'Nome'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object sbtnProcurarEmpregado: TSpeedButton
      Left = 14
      Top = 306
      Width = 129
      Height = 28
      AllowAllUp = True
      Caption = ' &Procurar Empregado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
        777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
        77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
        77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
        077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
        FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
        F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
        7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
        777777787FFF8777777777770000777777777777888877777777}
      NumGlyphs = 2
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      Spacing = 0
      OnClick = sbtnProcurarEmpregadoClick
    end
    object Bevel2: TBevel
      Left = 6
      Top = 340
      Width = 604
      Height = 65
      Shape = bsFrame
      Style = bsRaised
    end
    object fcLabel2: TfcLabel
      Left = 14
      Top = 343
      Width = 585
      Height = 22
      AutoSize = False
      Caption = 'Resultado'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentFont = False
      TextOptions.Alignment = taCenter
      TextOptions.Shadow.Enabled = True
      TextOptions.Shadow.XOffset = 1
      TextOptions.Shadow.YOffset = 2
      TextOptions.VAlignment = vaTop
    end
    object Label9: TLabel
      Left = 12
      Top = 45
      Width = 193
      Height = 13
      Caption = 'Nome da Regra/Forma de Cálculo'
    end
    object Label3: TLabel
      Left = 151
      Top = 8
      Width = 186
      Height = 13
      Caption = 'Tipo de Regra/Forma de Cálculo'
    end
    object Bevel1: TBevel
      Left = 459
      Top = 4
      Width = 152
      Height = 117
    end
    object Label12: TLabel
      Left = 80
      Top = 89
      Width = 35
      Height = 13
      Caption = 'Regra'
    end
    object Label13: TLabel
      Left = 242
      Top = 89
      Width = 99
      Height = 13
      Caption = 'Forma de Cálculo'
    end
    object Label2: TLabel
      Left = 13
      Top = 8
      Width = 40
      Height = 13
      Caption = 'Código'
    end
    object Label1: TLabel
      Left = 14
      Top = 189
      Width = 64
      Height = 16
      Caption = 'Matrícula'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 134
      Top = 189
      Width = 111
      Height = 16
      Caption = 'Valor Informado'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label7: TLabel
      Left = 266
      Top = 189
      Width = 78
      Height = 16
      Caption = 'Valor Base'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label8: TLabel
      Left = 383
      Top = 189
      Width = 63
      Height = 16
      Caption = 'Parcelas'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label10: TLabel
      Left = 500
      Top = 189
      Width = 85
      Height = 16
      Caption = 'Ocorrências'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label14: TLabel
      Left = 134
      Top = 227
      Width = 111
      Height = 16
      Caption = 'Total Proventos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label15: TLabel
      Left = 266
      Top = 227
      Width = 102
      Height = 16
      Caption = 'Tot Descontos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object bbtnLimpar: TBitBtn
      Left = 14
      Top = 150
      Width = 129
      Height = 31
      Caption = '  &Limpar'
      TabOrder = 0
      OnClick = bbtnLimparClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00559999999995
        5555557777777775F5555559999999505555555777777757FFF5555555555550
        0955555555555FF7775F55555555995501955555555577557F75555555555555
        01995555555555557F5755555555555501905555555555557F57555555555555
        0F905555555555557FF75555555555500005555555555557777555555555550F
        F05555555555557F57F5555555555008F05555555555F775F755555555570000
        05555555555775577555555555700007555555555F755F775555555570000755
        55555555775F77555555555700075555555555F75F7755555555570007555555
        5555577F77555555555500075555555555557777555555555555}
      NumGlyphs = 2
    end
    object rgRescisao: TRadioGroup
      Left = 169
      Top = 147
      Width = 185
      Height = 33
      Caption = 'Rescisão?'
      Columns = 2
      ItemIndex = 1
      Items.Strings = (
        'Sim'
        'Não')
      TabOrder = 1
    end
    object rgTemLanc: TRadioGroup
      Left = 387
      Top = 147
      Width = 185
      Height = 33
      Caption = 'Tem Lançamento?'
      Columns = 2
      ItemIndex = 1
      Items.Strings = (
        'Sim'
        'Não')
      TabOrder = 2
    end
    object edNome: TEdit
      Left = 14
      Top = 276
      Width = 586
      Height = 25
      TabStop = False
      AutoSize = False
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 6
      ParentFont = False
      ReadOnly = True
      TabOrder = 3
    end
    object edtResultRegra: TEdit
      Left = 216
      Top = 370
      Width = 179
      Height = 25
      TabStop = False
      AutoSize = False
      Color = clAqua
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MaxLength = 6
      ParentFont = False
      ReadOnly = True
      TabOrder = 4
    end
    object btnConsultar: TBitBtn
      Left = 468
      Top = 6
      Width = 135
      Height = 28
      Caption = 'Consultar        '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
      OnClick = btnConsultarClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
        777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
        77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
        77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
        077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
        FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
        F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
        7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
        777777787FFF8777777777770000777777777777888877777777}
      NumGlyphs = 2
    end
    object bbtnExecutar: TBitBtn
      Left = 468
      Top = 34
      Width = 135
      Height = 28
      Caption = 'Executar       '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      OnClick = bbtnExecutarClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888088888888888888800888888888888880B0888888888888880B088
        8888888800000B088888888880BBBBB08888888880BBB00008888888880BBB08
        88888880000BFBF088888880BFBFB000088888880BFBF088888888880FBFBF08
        8888888880FBFBF0888888888000000088888888888888888888}
    end
    object bbtnPassoAPasso: TBitBtn
      Left = 468
      Top = 62
      Width = 135
      Height = 28
      Caption = 'Passo a Passo'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 7
      OnClick = bbtnExecutarClick
      Glyph.Data = {
        06020000424D0602000000000000760000002800000028000000140000000100
        0400000000009001000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        333333333333333333333333333333333333333333333333333333FFFFFFFFFF
        FFFF333330000000000000033333377777777777777F333330FEFEFEFEFEFE03
        333337F333333333337F333330EFEFEFEFEFEF03333337F3FFFF3333337F3333
        30F4444EFEFEFE0333F337F777733333337F303330EFEFEFEFEFEF0337FF37F3
        33FFFFFFF37F300330FEF4444444FE03377FF7F337777777337F300030999999
        99999903377737F333333333337F300330999FFFFFF99903377337F333333333
        337F30333099999999999903373337F333FFFFFFF37F333330FEF4444444FE03
        333337F337777777337F333330EFEFEFEFEFEF03333337F3FFFF333FFF7F3333
        30F4444EFE000003333337F7777333777773333330EFEFEFEF0FE033333337F3
        3333337F3733333330FEFEFEFE0E0333333337F33333337F7333333330EFEFEF
        EF003333333337FFFFFFFF773333333330000000000333333333377777777773
        3333333333333333333333333333333333333333333333333333333333333333
        33333333333333333333}
      NumGlyphs = 2
    end
    object edtTipo: TPanel
      Left = 151
      Top = 22
      Width = 301
      Height = 21
      Alignment = taLeftJustify
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
    end
    object edtNome: TPanel
      Left = 12
      Top = 60
      Width = 439
      Height = 21
      Alignment = taLeftJustify
      BevelOuter = bvNone
      BorderStyle = bsSingle
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 9
    end
    object cbxRegra: TCheckBox
      Left = 61
      Top = 87
      Width = 16
      Height = 17
      TabStop = False
      Enabled = False
      TabOrder = 10
    end
    object cbxForma: TCheckBox
      Left = 221
      Top = 87
      Width = 16
      Height = 17
      TabStop = False
      Enabled = False
      TabOrder = 11
    end
    object bbtnPassos: TBitBtn
      Left = 468
      Top = 90
      Width = 135
      Height = 28
      Caption = 'Passos          '
      Font.Charset = ANSI_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 12
      OnClick = bbtnExecutarClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888870000000
        000088887FFFFFFFFFF088887F77777777F048887FFFFFFFFFF044887F777777
        77F044487BBBBBBBBBB044487BBBBBBBBBB044887BBBBBBBBBB048887F777777
        77F088887FFFFFFFFFF048887F7777FFFFF044887FFFFFFF000044487FFFFFFF
        0F0844487FFFFFFF008844887777777708884888888888888888}
    end
    object edtNumero: TEdit
      Left = 12
      Top = 22
      Width = 121
      Height = 21
      TabStop = False
      TabOrder = 13
      OnExit = edtNumeroExit
    end
    object edMatric: TEdit
      Left = 14
      Top = 205
      Width = 100
      Height = 21
      TabOrder = 14
      OnExit = edMatricExit
    end
    object redValorInfo: TRealEdit
      Left = 134
      Top = 205
      Width = 111
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 15
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
    end
    object redValorBase: TRealEdit
      Left = 266
      Top = 205
      Width = 100
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 16
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
    end
    object redParcelas: TRealEdit
      Left = 383
      Top = 205
      Width = 100
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 17
      WordWrap = False
      IntDigits = 10
      DecDigits = 0
      NumberFormat = fNumber
      Signal = False
    end
    object redOcorrencias: TRealEdit
      Left = 500
      Top = 205
      Width = 100
      Height = 21
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      TabOrder = 18
      WordWrap = False
      IntDigits = 10
      DecDigits = 0
      NumberFormat = fNumber
      Signal = False
    end
    object redTotProv: TRealEdit
      Left = 134
      Top = 243
      Width = 111
      Height = 21
      Hint = 'Simula Total Acumulado de Proventos'
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 19
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
    end
    object redTotDesc: TRealEdit
      Left = 266
      Top = 243
      Width = 100
      Height = 21
      Hint = 'Simula Total Acumulado de Descontos'
      Alignment = taRightJustify
      Lines.Strings = (
        '      0,00')
      ParentShowHint = False
      ShowHint = True
      TabOrder = 20
      WordWrap = False
      IntDigits = 10
      DecDigits = 2
      NumberFormat = fNumber
      Signal = False
    end
  end
  inherited Dock971: TDock97
    Top = 410
    Width = 615
    inherited tb97Fundo: TToolbar97
      Left = 449
      DockPos = 457
      inherited bbtnSair: TBitBtn
        ModalResult = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 556
    Top = 350
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object MontaSelectFormaCalc: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Forma de Cálculo'
    Colunas.Strings = (
      'REGRA.IDREGRA'
      'REGRA.NOMEREGRA'
      'TIPOREGRA.DESCREGRA')
    TipodeDado.Strings = (
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Número'
      'Nome'
      'Tipo')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'REGRA'
      'TIPOREGRA')
    CamposChave.Strings = (
      'REGRA.IDREGRA'
      'REGRA.NOMEREGRA'
      'TIPOREGRA.DESCREGRA'
      'TIPOREGRA.SQLREGRA'
      'TIPOREGRA.IDTIPOREGRA')
    Filtro.Strings = (
      'REGRA.IDTIPOREGRA = TIPOREGRA.IDTIPOREGRA')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '60'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
    MultiSelect = False
    Left = 146
    Top = 337
  end
  object MontaSelectFunc: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Empregado'
    Colunas.Strings = (
      'PESSOA.NOME'
      'FUNCIONARIO.MATRICULA'
      'PESSOA.NUMDOCUMENTO'
      'CARGO.TITULO'
      'EMPRESAPROP.NOMEEMPRESA')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nome da Pessoa'
      'Matrícula'
      'CPF (ou equivalente)'
      'Cargo'
      'Empresa')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'FUNCIONARIO'
      'CARGO'
      'EMPRESAPROP')
    CamposChave.Strings = (
      'PESSOA.NOME'
      'FUNCIONARIO.MATRICULA'
      'PESSOA.NUMDOCUMENTO'
      'CARGO.TITULO'
      'EMPRESAPROP.NOMEEMPRESA'
      'EMPRESAPROP.IDPESSOA'
      'FUNCIONARIO.IDPESSOA')
    Filtro.Strings = (
      'EMPRESAPROP.IDPESSOA = FUNCIONARIO.IDEMPRESA'
      'CARGO.IDCARGO        = FUNCIONARIO.IDCARGO'
      'FUNCIONARIO.IDPESSOA = PESSOA.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '22'
      '22'
      '40'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 42
    Top = 337
  end
end
