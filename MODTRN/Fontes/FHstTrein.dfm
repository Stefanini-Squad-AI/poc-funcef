inherited frmHstTrein: TfrmHstTrein
  Left = 59
  Top = 160
  Caption = 'Histórico de Treinamento'
  ClientHeight = 327
  ClientWidth = 715
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Top = 46
    Width = 715
    Height = 242
  end
  inherited Dock971: TDock97
    Top = 288
    Width = 715
    inherited tb97Fundo: TToolbar97
      Left = 545
      DockPos = 553
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 378
      DockPos = 386
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnSairClick
      end
    end
  end
  object Panel2: TPanel [2]
    Left = 0
    Top = 0
    Width = 715
    Height = 46
    Align = alTop
    TabOrder = 1
    object lblSituacao: TLabel
      Left = 511
      Top = 22
      Width = 49
      Height = 13
      Caption = '(Efetivo)'
    end
    object sbtnProcurar: TSpeedButton
      Left = 603
      Top = 7
      Width = 60
      Height = 33
      Hint = 'Procurar por registro|'
      AllowAllUp = True
      GroupIndex = 1
      Caption = '&Procurar'
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333CCCCC33
        33333FFFF77777FFFFFFCCCCCC808CCCCCC3777777F7F777777F008888070888
        8003777777777777777F0F0770F7F0770F0373F33337F333337370FFFFF7FFFF
        F07337F33337F33337F370FFFB99FBFFF07337F33377F33337F330FFBF99BFBF
        F033373F337733333733370BFBF7FBFB0733337F333FF3337F33370FBF98BFBF
        0733337F3377FF337F333B0BFB990BFB03333373FF777FFF73333FB000B99000
        B33333377737777733333BFBFBFB99FBF33333333FF377F333333FBF99BF99BF
        B333333377F377F3333333FB99FB99FB3333333377FF77333333333FB9999FB3
        333333333777733333333333FBFBFB3333333333333333333333}
      Layout = blGlyphTop
      NumGlyphs = 2
      ParentShowHint = False
      ShowHint = True
      Spacing = 0
      OnClick = sbtnProcurarClick
    end
    object Label1: TLabel
      Left = 6
      Top = 3
      Width = 57
      Height = 13
      Caption = 'Id.Pessoa'
    end
    object Label2: TLabel
      Left = 102
      Top = 3
      Width = 33
      Height = 13
      Caption = 'Nome'
    end
    object dbedMatric: TDBEdit
      Left = 6
      Top = 19
      Width = 82
      Height = 21
      DataField = 'MATRICULA'
      DataSource = ds
      TabOrder = 0
    end
    object dbedNome: TDBEdit
      Left = 102
      Top = 19
      Width = 388
      Height = 21
      DataField = 'NOME'
      DataSource = ds
      TabOrder = 1
    end
  end
  object dbgrTrein: TwwDBGrid [3]
    Left = 0
    Top = 46
    Width = 715
    Height = 242
    IniAttributes.Delimiter = ';;'
    TitleColor = clActiveCaption
    FixedCols = 0
    ShowHorzScrollBar = True
    Align = alClient
    DataSource = ds2
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = []
    ParentFont = False
    TabOrder = 2
    TitleAlignment = taCenter
    TitleFont.Charset = DEFAULT_CHARSET
    TitleFont.Color = clWhite
    TitleFont.Height = -11
    TitleFont.Name = 'MS Sans Serif'
    TitleFont.Style = []
    TitleLines = 1
    TitleButtons = False
    Visible = False
    IndicatorColor = icYellow
  end
  object ds2: TwwDataSource
    DataSet = qryTrein
    Left = 432
    Top = 129
  end
  object qryTrein: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select TABMOTAC.DESCRICAO,HSTCON.DAT_PLAN,HSTCON.DAT_REAL,'
      'HSTCON.AVALIACAO,HSTCON.AVALIADOR from TABMOTAC,HSTCON where '
      
        'HSTCON.MATRICULA = 1059805 and HSTCON.TIPO_ENTR = TABMOTAC.COD_M' +
        'OTAC')
    ValidateWithMask = True
    Left = 483
    Top = 126
  end
  object MontaSelectFunc: TMontaSelect
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
    Tabelas.Strings = (
      'FUNCIONARIO'
      'EMPRESAPROP'
      'PESSOA '
      'CARGO')
    CamposChave.Strings = (
      'PESSOA.NOME'
      'FUNCIONARIO.MATRICULA'
      'PESSOA.NUMDOCUMENTO'
      'CARGO.TITULO'
      'EMPRESAPROP.NOMEEMPRESA'
      'EMPRESAPROP.IDPESSOA'
      'FUNCIONARIO.IDPESSOA')
    Filtro.Strings = (
      'FUNCIONARIO.IDEMPRESA = EMPRESAPROP.IDPESSOA'
      'FUNCIONARIO.IDPESSOA = PESSOA.IDPESSOA'
      'FUNCIONARIO.IDCARGO = CARGO.IDCARGO')
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
    Left = 342
    Top = 135
  end
  object MontaSelectCand: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PESSOA.NOME'
      'PESSOA.NUMDOCUMENTO'
      'CARGO.TITULO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nome da Pessoa'
      'CPF (ou equivalente)'
      'Cargo')
    Tabelas.Strings = (
      'CANDIDAT'
      'PESSOA '
      'CARGO')
    CamposChave.Strings = (
      'PESSOA.NOME'
      'PESSOA.NUMDOCUMENTO'
      'CARGO.TITULO'
      'CANDIDAT.IDPESSOA')
    Filtro.Strings = (
      'CANDIDAT.IDPESSOA = PESSOA.IDPESSOA'
      'CANDIDAT.IDCARGO = CARGO.IDCARGO')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '22'
      '40')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 369
    Top = 183
  end
  object qryPessoa: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 179
    Top = 134
  end
  object ds: TwwDataSource
    DataSet = qryPessoa
    Left = 64
    Top = 136
  end
end
