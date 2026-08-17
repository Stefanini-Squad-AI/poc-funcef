inherited frmCustomParamFichaProc: TfrmCustomParamFichaProc
  Left = 167
  Top = 219
  HelpContext = 760027
  BorderStyle = bsToolWindow
  Caption = 'Ficha do Processo'
  ClientHeight = 190
  ClientWidth = 443
  Font.Style = []
  PixelsPerInch = 96
  TextHeight = 13
  object Label1: TLabel [0]
    Left = 11
    Top = 60
    Width = 37
    Height = 13
    Caption = 'Número'
  end
  object Label2: TLabel [1]
    Left = 101
    Top = 60
    Width = 57
    Height = 13
    Caption = 'Reclamante'
  end
  inherited pnlFundo: TPanel
    Width = 443
    Height = 151
    BorderWidth = 2
    object Label3: TLabel
      Left = 15
      Top = 10
      Width = 37
      Height = 13
      Caption = 'Número'
    end
    object Label4: TLabel
      Left = 100
      Top = 10
      Width = 55
      Height = 13
      Caption = 'Contraparte'
    end
    object sbtnProcurar: TSpeedButton
      Left = 401
      Top = 22
      Width = 27
      Height = 26
      AllowAllUp = True
      GroupIndex = 1
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
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = False
      Spacing = 0
      OnClick = sbtnProcurarClick
    end
    object edNumero: TEdit
      Left = 16
      Top = 25
      Width = 77
      Height = 21
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
    object edNomeContraparte: TEdit
      Left = 100
      Top = 25
      Width = 296
      Height = 21
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
    end
    object rgImprimirHonor: TRadioGroup
      Left = 16
      Top = 51
      Width = 200
      Height = 40
      Caption = 'Imprimir Honorários'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Sim'
        'Não')
      TabOrder = 2
    end
    object rgImprimirObserv: TRadioGroup
      Left = 229
      Top = 51
      Width = 200
      Height = 40
      Caption = 'Imprimir Observações das Etapas'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Sim'
        'Não')
      TabOrder = 3
    end
  end
  inherited Dock971: TDock97
    Top = 151
    Width = 443
    inherited tb97Fundo: TToolbar97
      Left = 273
      DockPos = 425
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 106
      DockPos = 199
      inherited ToolbarSep971: TToolbarSep97
        Visible = False
      end
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Enabled = False
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 80
    Top = 143
  end
  inherited Cmp_Padrao: TCmParamReport
    Left = 16
    Top = 143
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Processo'
    Colunas.Strings = (
      'PESSOA.NOME'
      'PROCESSOTRAB.DATANOTIF'
      'PROCESSOTRAB.PROCJCJNUM'
      'VARAJUSTICA.DESCRICAO'
      'PROCESSOTRAB.NUMVARAJUSTICA'
      'PROCESSOTRAB.PROCTRTNUM'
      'PROCESSOTRAB.PROCTSTNUM'
      'ADVOG.NOME'
      'PROCESSOTRAB.NUMPROCTRAB')
    TipodeDado.Strings = (
      'C'
      'D'
      'C'
      'C'
      'N'
      'C'
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Nome Contraparte'
      'Data de Notificação'
      'Número Proc. na 1a Inst.'
      'Vara de Justiça'
      'Número da Vara'
      'Número Proc. na 2a Inst.'
      'Número Proc. na 3a Inst.'
      'Nosso Escritório/Adv.'
      'Número Proc. Interno')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'PROCESSOTRAB'
      'VARAJUSTICA')
    CamposChave.Strings = (
      'PROCESSOTRAB.NUMPROCTRAB'
      'PESSOA.NOME'
      'PESSOA.TIPO'
      'ADVOG.NOME')
    Filtro.Strings = (
      'PROCESSOTRAB.IDRECLAMANTE  = PESSOA.IDPESSOA'
      'PROCESSOTRAB.IDVARAJUSTICA = VARAJUSTICA.IDVARAJUSTICA(+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '50'
      '12'
      '15'
      '40'
      '15'
      '15'
      '15'
      '50'
      '15')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 219
    Top = 141
  end
end
