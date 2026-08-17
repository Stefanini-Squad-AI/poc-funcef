inherited frmSolicBenef: TfrmSolicBenef
  HelpContext = 4170022
  Caption = 'Solicitação de Benefício APCEF'
  ClientHeight = 315
  ClientWidth = 475
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 475
    Height = 276
    object sbtnProcurar: TSpeedButton
      Left = 361
      Top = 49
      Width = 103
      Height = 28
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
    object dbtxtSituacao: TDBText
      Left = 204
      Top = 53
      Width = 67
      Height = 21
      Alignment = taCenter
      DataField = 'SITUACAO'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -15
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object Label1: TLabel
      Left = 11
      Top = 6
      Width = 55
      Height = 13
      Caption = 'Matrícula'
    end
    object Label2: TLabel
      Left = 103
      Top = 6
      Width = 33
      Height = 13
      Caption = 'Nome'
    end
    object Bevel1: TBevel
      Left = 5
      Top = 80
      Width = 465
      Height = 2
    end
    object dbedMat: TwwDBEdit
      Left = 11
      Top = 19
      Width = 84
      Height = 21
      Color = clGray
      DataField = 'MATRICULA'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbedNome: TwwDBEdit
      Left = 103
      Top = 19
      Width = 361
      Height = 21
      Color = clGray
      DataField = 'NOME'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      ReadOnly = True
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object rgTipoAcao: TRadioGroup
      Left = 10
      Top = 91
      Width = 320
      Height = 41
      Caption = 'Tipo de Ação'
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'Inclusão'
        'Manutenção'
        'Exclusão')
      TabOrder = 2
    end
    object gbxDepen: TGroupBox
      Left = 344
      Top = 91
      Width = 115
      Height = 41
      Caption = 'Dependentes'
      TabOrder = 3
      object spedDepen: TSpinEdit
        Left = 27
        Top = 14
        Width = 60
        Height = 22
        MaxValue = 0
        MinValue = 0
        TabOrder = 0
        Value = 0
      end
    end
    object gbxObserv: TGroupBox
      Left = 10
      Top = 183
      Width = 450
      Height = 80
      Caption = 'Observações'
      TabOrder = 4
      object edObserv: TMemo
        Left = 15
        Top = 16
        Width = 420
        Height = 55
        TabOrder = 0
      end
    end
    object rgOpcaoPlano: TRadioGroup
      Left = 10
      Top = 138
      Width = 320
      Height = 41
      Caption = 'Opção de Benefício'
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'Vida'
        'Saúde'
        'Clube')
      TabOrder = 5
    end
  end
  inherited Dock971: TDock97
    Top = 276
    Width = 475
    inherited tb97Fundo: TToolbar97
      Left = 305
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
    Left = 243
    Top = 46
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
    Left = 276
    Top = 46
  end
end
