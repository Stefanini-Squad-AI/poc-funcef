inherited frmCRelInadimplencia: TfrmCRelInadimplencia
  Left = 450
  Top = 231
  Caption = 'Relatório de Inadimplência'
  ClientHeight = 288
  ClientWidth = 563
  PixelsPerInch = 96
  TextHeight = 13
  object Label4: TLabel [0]
    Left = 112
    Top = 74
    Width = 55
    Height = 13
    Caption = 'Matrícula'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  inherited pnlFundo: TPanel
    Width = 563
    Height = 249
    object Label2: TLabel
      Left = 16
      Top = 50
      Width = 49
      Height = 13
      Caption = 'Contrato'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label1: TLabel
      Left = 208
      Top = 50
      Width = 79
      Height = 13
      Caption = 'N°Documento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label5: TLabel
      Left = 112
      Top = 50
      Width = 53
      Height = 13
      Caption = 'Matricula'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object edtDcoumento: TEdit
      Left = 208
      Top = 64
      Width = 161
      Height = 21
      TabOrder = 2
      OnKeyPress = edtIdContratoKeyPress
    end
    object btnBuscaContrato: TBitBtn
      Left = 368
      Top = 64
      Width = 24
      Height = 21
      Hint = 'Busca um Contrato'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
      OnClick = btnBuscaContratoClick
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
    object btnLimpaContrato: TBitBtn
      Left = 392
      Top = 64
      Width = 24
      Height = 21
      Hint = 'Limpa a seleção de Contrato'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = btnLimpaContratoClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        88888888888FF8888888888888008888888888888F77F8888888888800F08888
        8888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0888
        88887788888F788888887FFFFFCF888888887F88FF7888FF88887FFCCCF88008
        888878F777888778F88887FFFF880110888887F88F8878878F8887FFC8809991
        0888878F7887F88878F8887FF88099991088887F88878F88878F887FF8880999
        03088878F88878F878788887F8888090B03088878F888787878788887888880B
        0B038888788888787878888888888880B0B38888888888878788888888888888
        0BBB88888888888878F888888888888880BB8888888888888788}
      NumGlyphs = 2
    end
    object edtIdContrato: TEdit
      Left = 16
      Top = 64
      Width = 97
      Height = 21
      TabOrder = 0
      OnKeyPress = edtIdContratoKeyPress
    end
    object edtMatricula: TEdit
      Left = 112
      Top = 64
      Width = 97
      Height = 21
      ReadOnly = True
      TabOrder = 1
    end
    object GroupBox1: TGroupBox
      Left = 16
      Top = 88
      Width = 465
      Height = 137
      Caption = 'Indique o Periodo'
      TabOrder = 5
      object Label3: TLabel
        Left = 8
        Top = 34
        Width = 65
        Height = 13
        Caption = 'Data Limite'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dtDataLimite: TwwDBDateTimePicker
        Left = 8
        Top = 48
        Width = 97
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        Epoch = 1950
        ButtonWidth = 20
        ButtonGlyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          88888888888888888888800000000000000880FFFFFFFFFFFF0880F878787978
          7F0880F7878797978F0880F8787879787F0880F7878787878F0880F878787878
          7F0880F7878787878F0880FFFFFFFFFFFF0880F4C4C4C7777F0880FC4C4C4777
          7F0880FFFFFFFFFFFF0880000000000000088888888888888888}
        ShowButton = True
        TabOrder = 0
        UnboundDataType = wwDTEdtDate
        DisplayFormat = 'dd/mm/yyyy'
      end
      object ckbFlgConsiderarContratoad: TCheckBox
        Left = 16
        Top = 96
        Width = 353
        Height = 17
        Caption = 'Considerar APENAS Contratos do arquivo CONTRATADO'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
      object ckbGerarRelExcel: TCheckBox
        Left = 128
        Top = 49
        Width = 201
        Height = 17
        Caption = 'Gerar Relatório em Excel'
        TabOrder = 1
      end
    end
  end
  inherited Dock971: TDock97
    Top = 249
    Width = 563
    inherited tb97Fundo: TToolbar97
      Left = 367
      inherited bbtnAjuda: TmaHelpBitBtn
        ClickHelpContext = 230030
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited ToolbarSep971: TToolbarSep97
        Left = 162
      end
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 81
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 11
    Top = 3
    TargetsData = (
      1
      2
      (
        ''
        'Filter'
        0)
      (
        ''
        'DisplayLabel'
        0))
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'C.IDCONTRATOEMPTMO'
      'D.MATRICULA'
      'H.CODDOCUMENTO')
    TipodeDado.Strings = (
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Contrato'
      'Matricula'
      'N°Documento')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'DEPENTIT D'
      'CONTRATOEMPTMO C'
      'HISTMOVEMPTMO H')
    CamposChave.Strings = (
      'C.IDCONTRATOEMPTMO'
      'D.MATRICULA'
      'H.CODDOCUMENTO'
      'C.IDBENEF')
    Filtro.Strings = (
      'C.IDCONTRATOEMPTMO = H.IDCONTRATOEMPTMO'
      'H.CODDOCUMENTO IS NOT NULL'
      'C.FLGSITUACAO NOT IN ('#39'C'#39','#39'Q'#39')'
      'C.IDPESSOA = D.IDTITULAR'
      'C.IDBENEF  = D.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '15'
      '10'
      '3')
    OperComparador.Strings = (
      '0'
      '0'
      '0')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = True
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    BeforeOpenCds = MontaSelectBeforeOpenCds
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
    Left = 232
    Top = 5
  end
  object qryConsulta: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 202
    Top = 4
  end
  object qryAUX1: TADOQuery
    Connection = ADOConnection1
    Parameters = <>
    Left = 264
    Top = 4
  end
  object ADOConnection1: TADOConnection
    LoginPrompt = False
    Left = 268
    Top = 132
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 336
    Top = 8
  end
end
