inherited frmSolicServico: TfrmSolicServico
  Top = 202
  HelpContext = 4170027
  Caption = 'Solicitação de Serviços/Produtos de Manutenção'
  ClientHeight = 318
  ClientWidth = 475
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 475
    Height = 279
    object sbtnProcurar: TSpeedButton
      Left = 186
      Top = 70
      Width = 103
      Height = 28
      Hint = 'Procurar o Serviço ou Produto Desejado'
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
      ShowHint = False
      Spacing = 0
      OnClick = sbtnProcurarClick
    end
    object Label2: TLabel
      Left = 8
      Top = 8
      Width = 157
      Height = 13
      Caption = 'Tipo de Serviço ou Produto'
    end
    object Bevel1: TBevel
      Left = 5
      Top = 104
      Width = 465
      Height = 2
    end
    object gbxObserv: TGroupBox
      Left = 10
      Top = 112
      Width = 450
      Height = 154
      Caption = 'Observações'
      TabOrder = 0
      object edObserv: TMemo
        Left = 15
        Top = 16
        Width = 420
        Height = 129
        TabOrder = 0
      end
    end
    object edDescricao: TMemo
      Left = 9
      Top = 22
      Width = 456
      Height = 43
      TabStop = False
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
  end
  inherited Dock971: TDock97
    Top = 279
    Width = 475
    inherited tb97Fundo: TToolbar97
      Left = 305
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 4170027
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 138
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'DESCSERVICO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'SERVICOMANUT')
    CamposChave.Strings = (
      'IDSERVICOMANUT'
      'DESCSERVICO')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '200')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 318
    Top = 47
  end
  object qry: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  ('#39'  '#39' || P.NOME) AS NOME,  P.IDPESSOA, ST.TIPOSIT, F.MATRICULA' +
        ','
      
        '  DECODE(ST.TIPOSIT,'#39'A'#39','#39'(Ativ'#39', '#39'F'#39','#39'(Afastad'#39', '#39'D'#39','#39'(Demitid'#39')' +
        ' ||'
      '    DECODE(PEFIS.SEXO,'#39'F'#39','#39'a)'#39','#39'o)'#39') AS SITUACAO'
      'FROM'
      '  PESSOA P, PESSOAFISICA PEFIS, FUNCIONARIO F, SITFUNC ST'
      'WHERE'
      '  (P.IDPESSOA  = :IDPESSOA)    AND'
      '  (P.IDPESSOA  = F.IDPESSOA)   AND'
      '  (F.IDSITFUNC = ST.IDSITFUNC) AND'
      '  (F.IDPESSOA  = PEFIS.IDPESSOA)')
    ValidateWithMask = True
    Left = 379
    Top = 54
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = 10329
      end>
  end
  object ds: TwwDataSource
    DataSet = qry
    Left = 428
    Top = 54
  end
end
