inherited frmAcertaSaldoMT: TfrmAcertaSaldoMT
  Left = 243
  Top = 183
  HelpContext = 520001
  Caption = 'Acerta Saldo da Reserva/Compromisso'
  ClientHeight = 224
  ClientWidth = 469
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 469
    Height = 185
    object lblTipoSaldo: TLabel
      Left = 6
      Top = 102
      Width = 5
      Height = 13
    end
    object lblCodigoConta: TLabel
      Left = 24
      Top = 106
      Width = 95
      Height = 13
      Caption = 'Código da Conta'
    end
    object mmTela: TMemo
      Left = 1
      Top = 1
      Width = 467
      Height = 84
      TabStop = False
      Align = alTop
      Alignment = taCenter
      Color = clMenu
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -19
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Lines.Strings = (
        'Acerta o Saldo Orçamentário '
        'pelas Reservas e Compromissos '
        'Aguardando.')
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
    end
    object pbAguarde: TProgressBar
      Left = 1
      Top = 168
      Width = 467
      Height = 16
      Align = alBottom
      Min = 0
      Max = 100
      TabOrder = 1
    end
    object edtCodigoConta: TEdit
      Left = 24
      Top = 120
      Width = 105
      Height = 21
      TabOrder = 2
      OnExit = edtCodigoContaExit
    end
    object bbtnBuscaConta: TBitBtn
      Left = 128
      Top = 120
      Width = 25
      Height = 21
      Hint = 'Procura a Conta'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = bbtnBuscaContaClick
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
    end
    object edtNomeConta: TEdit
      Left = 168
      Top = 120
      Width = 281
      Height = 21
      TabStop = False
      Enabled = False
      ReadOnly = True
      TabOrder = 4
    end
  end
  inherited Dock971: TDock97
    Top = 185
    Width = 469
    inherited tb97Fundo: TToolbar97
      Left = 75
      DockPos = 75
      inherited sep1: TToolbarSep97
        Left = 80
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 163
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 82
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 165
        Hint = '520001'
        HelpContext = 520001
      end
      object bbtnConfirma: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Cancel = True
        Caption = '&OK'
        TabOrder = 2
        OnClick = bbtnConfirmaClick
        Glyph.Data = {
          42010000424D4201000000000000760000002800000011000000110000000100
          040000000000CC00000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555205555
          5555500000005555522205555555500000005555522205555555500000005555
          22222055555550000000555222A220755555500000005522AA5A220555555000
          000052AA5555A20755555000000055555055A220555550000000555500055A20
          7555500000005550505055A207555000000055555050555A2055500000005555
          00055555A207500000005550505555555AAA0000000055505050555555555000
          0000555500055555555550000000555550555555555550000000555555555555
          555550000000}
        Spacing = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 971
  end
  object MontaSelectConta: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'CONTASORCAMEN.IDCONTAORCAMEN'
      'CONTASORCAMEN.NOMECONTAORCAMEN'
      'CONTASORCAMEN.OBSERVACAO'
      'CONTASORCAMEN.TIPOCALCREALIZADO'
      'CONTASORCAMEN.TIPOCALCORCADO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código da Conta'
      'Nome da Conta'
      'Observação'
      'Tipo de Cálculo Realizado'
      'Tipo de Cálculo Orçado')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CONTASORCAMEN'
      'PARAMORCAMENTO')
    CamposChave.Strings = (
      'CONTASORCAMEN.IDPLANOORCAMEN'
      'CONTASORCAMEN.IDCONTAORCAMEN'
      'CONTASORCAMEN.NOMECONTAORCAMEN')
    Filtro.Strings = (
      'CONTASORCAMEN.IDPLANOORCAMEN=PARAMORCAMENTO.IDPLANOORCAMEN')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '25'
      '60'
      '60'
      '1'
      '1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 47
    Top = 32
  end
end
