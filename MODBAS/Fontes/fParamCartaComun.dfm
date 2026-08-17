inherited frmParamCartaComun: TfrmParamCartaComun
  Left = 201
  Top = 180
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsToolWindow
  Caption = 'Cartas ou Comunicados'
  ClientHeight = 277
  ClientWidth = 425
  Font.Style = []
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 425
    Height = 238
    BorderWidth = 2
    object rgSelecao: TRadioGroup
      Left = 13
      Top = 7
      Width = 152
      Height = 100
      Caption = 'Endereçar a'
      ItemIndex = 1
      Items.Strings = (
        'Uma só Pessoa'
        'Pessoas a Selecionar')
      TabOrder = 0
      OnClick = rgSelecaoClick
    end
    object gbxNome: TGroupBox
      Left = 173
      Top = 7
      Width = 240
      Height = 100
      Caption = 'Destinatário'
      TabOrder = 1
      Visible = False
      object sbtnProcurar: TSpeedButton
        Left = 72
        Top = 64
        Width = 103
        Height = 28
        Hint = 'Procurar por registro|'
        AllowAllUp = True
        GroupIndex = 1
        Caption = '   &Procurar'
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
        ShowHint = True
        Spacing = 0
        OnClick = sbtnProcurarClick
      end
      object memNome: TMemo
        Left = 8
        Top = 16
        Width = 224
        Height = 40
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
    end
    object rgNossoNome: TRadioGroup
      Left = 13
      Top = 111
      Width = 152
      Height = 114
      Caption = 'Nosso Nome'
      ItemIndex = 3
      Items.Strings = (
        'No Cabeçalho'
        'No Rodapé'
        'No Cabeçalho e Rodapé'
        'Em Nenhum Lugar')
      TabOrder = 2
    end
    object rgNomeEnd: TRadioGroup
      Left = 173
      Top = 111
      Width = 240
      Height = 64
      Caption = 'Cabeçalho'
      ItemIndex = 1
      Items.Strings = (
        'Data, Nome, Endereço e Assunto'
        'Só o que Tiver Substituição no Texto')
      TabOrder = 3
    end
    object gbxTipoPapel: TGroupBox
      Left = 173
      Top = 179
      Width = 240
      Height = 46
      Caption = 'Tipo de Papel'
      TabOrder = 4
      object cmbTipoPapel: TComboBox
        Left = 7
        Top = 16
        Width = 226
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
      end
    end
  end
  inherited Dock971: TDock97
    Top = 238
    Width = 425
    inherited tb97Fundo: TToolbar97
      Left = 174
      DockPos = 255
      inherited sep1: TToolbarSep97
        Left = 164
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 80
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      inherited bbtnSair: TBitBtn
        Left = 83
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 166
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
    Top = 231
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Destinatário'
    Colunas.Strings = (
      'PESSOA.NOME'
      'PESSOA.RAZAOSOCIAL'
      'FUNCIONARIO.MATRICULA'
      'PESSOA.NUMDOCUMENTO'
      'PESSOA.TIPO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nome da Pessoa'
      'Razão Social'
      'Matrícula'
      'CPF ou CNPJ'
      'Tipo de Pessoa')
    SensivelACaixa.Strings = (
      'S'
      'N'
      'S'
      'S'
      'S')
    Tabelas.Strings = (
      'PESSOA'
      'FUNCIONARIO')
    CamposChave.Strings = (
      'PESSOA.IDPESSOA'
      'PESSOA.NOME')
    Filtro.Strings = (
      'PESSOA.IDPESSOA  = FUNCIONARIO.IDPESSOA(+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '40'
      '50'
      '15'
      '15'
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 80
    Top = 231
  end
end
