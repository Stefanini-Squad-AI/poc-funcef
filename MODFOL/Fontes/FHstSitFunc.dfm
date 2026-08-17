inherited frmHstSitFunc: TfrmHstSitFunc
  Left = 35
  Top = 172
  ActiveControl = dbgrHistorico
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 
    'Histórico da Situação Funcional (Alterações Ocorridas na Situaçã' +
    'o do Empregado)'
  ClientHeight = 307
  ClientWidth = 712
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Top = 46
    Width = 712
    Height = 222
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderWidth = 1
    object dbgrHistorico: TwwDBGrid
      Left = 1
      Top = 1
      Width = 710
      Height = 220
      Selected.Strings = (
        'DATASITFUNC'#9'10'#9'Data da Alteração'
        'DESCRICAO'#9'35'#9'Situação'
        'DESCMOT1'#9'50'#9'Motivo da Alteração')
      IniAttributes.Delimiter = ';;'
      TitleColor = clGray
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = dsDet
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      TitleAlignment = taCenter
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWhite
      TitleFont.Height = -11
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      IndicatorColor = icYellow
    end
  end
  inherited Dock971: TDock97
    Top = 268
    Width = 712
    inherited tb97Fundo: TToolbar97
      Left = 542
      DockPos = 542
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 344
      DockPos = 344
      inherited ToolbarSep971: TToolbarSep97
        Left = 110
        Visible = False
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 110
        Caption = '  &Atualizar'
        OnClick = bbtnConfirmarClick
        Glyph.Data = {
          6E020000424D6E02000000000000760000002800000036000000120000000100
          040000000000F801000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
          7777777777777FFFFFF777777777777777777777770077777770000007777777
          777FF888888F7777777777777777777777007777700111111077017777F88777
          77787F8777777700000077777700777701111111110011777F877FFFFF7788F8
          7777004444440770470077701119999911111177F877F88888F777F877704444
          4444400447007701119777779111117F877F8777778F77F8770444CCCCC44444
          47007701197777777111117F87F87777777877F870444C77777C444447007700
          0977777711111177888877777F8FFFF87044C777777744444700777777777779
          99999977FFFFF777788888887000C77777744444470070000007777777777778
          888887777777FFF77777777777CCCCCCC7007044444C777777000C787777F877
          7777888800000077777777777700704444C7777777044C7877778777777F87F8
          011111C77777700097007044440077777044C778777788FFFFF8778701111C77
          7777701197007044444400000444C7787FF7778888877F870111100777770119
          7700704CC4444444444C7778F88FF777777FF8770111111000001119770077C7
          7CC444444CC7777787788FFFFFF88777019911111111119777007777777CCCCC
          C777777777777888888777777977991111119977770077777777777777777777
          777777777777777777777799999977777700}
        NumGlyphs = 3
      end
      inherited bbtnCancelar: TBitBtn
        Left = 113
        Enabled = False
        Visible = False
        OnClick = bbtnSairClick
      end
    end
  end
  object Panel2: TPanel [2]
    Left = 0
    Top = 0
    Width = 712
    Height = 46
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object Label1: TLabel
      Left = 12
      Top = 16
      Width = 55
      Height = 13
      Caption = 'Matrícula'
    end
    object Label2: TLabel
      Left = 166
      Top = 16
      Width = 33
      Height = 13
      Caption = 'Nome'
    end
    object sbtnProcurar: TSpeedButton
      Left = 601
      Top = 9
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
      Left = 526
      Top = 13
      Width = 68
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
    object dbedMat: TwwDBEdit
      Left = 71
      Top = 13
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
      Left = 202
      Top = 13
      Width = 317
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
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 317
    Top = 139
  end
  object ds: TwwDataSource
    DataSet = qry
    Left = 236
    Top = 86
  end
  object dsDet: TwwDataSource
    DataSet = qryDet
    Left = 232
    Top = 137
  end
  object qryDet: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  HST.DATASITFUNC, ST.DESCRICAO, MO.DESCRICAO AS DESCMOT1'
      'FROM'
      '  HSTSITFUNC HST, SITFUNC ST, MOTIVO MO'
      'WHERE'
      '  (HST.IDPESSOA     = :IDPESSOA)    AND'
      '  (HST.IDSITFUNC    = ST.IDSITFUNC) AND'
      '  (HST.IDMOTIVOOFIC = MO.IDMOTIVO(+))'
      'ORDER BY'
      '  HST.DATASITFUNC DESC')
    ValidateWithMask = True
    Left = 202
    Top = 137
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = 10329
      end>
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
    Left = 203
    Top = 86
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = 10329
      end>
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
    Left = 318
    Top = 87
  end
end
