inherited frmHstEvol: TfrmHstEvol
  Left = 14
  Top = 177
  ActiveControl = dbgrEvol
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Histórico da Evolução Funcional'
  ClientHeight = 307
  ClientWidth = 752
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Top = 46
    Width = 752
    Height = 222
    BevelInner = bvNone
    BevelOuter = bvNone
    BorderWidth = 1
    object dbgrEvol: TwwDBGrid
      Left = 1
      Top = 1
      Width = 750
      Height = 220
      Selected.Strings = (
        'DATAALTERFUNC'#9'10'#9'Data Efet.'
        'DESCRICAO'#9'50'#9'Tipo de Evento'
        'SALARIO'#9'10'#9'Salário'
        'TIPOPAGAMENTO'#9'1'#9'Freq.'
        'PERC_REAJ'#9'10'#9'% Reaj.'
        'TITULO'#9'40'#9'Cargo'
        'FUNCAO'#9'40'#9'Cargo Alternativo ou Função'
        'CCUSTO'#9'30'#9'Centro de Custo'#9'F')
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
    Width = 752
    inherited tb97Fundo: TToolbar97
      Left = 586
      DockPos = 594
    end
  end
  object Panel2: TPanel [2]
    Left = 0
    Top = 0
    Width = 752
    Height = 46
    Align = alTop
    BevelInner = bvRaised
    BevelOuter = bvLowered
    TabOrder = 1
    object Label1: TLabel
      Left = 11
      Top = 16
      Width = 55
      Height = 13
      Caption = 'Matrícula'
    end
    object Label2: TLabel
      Left = 164
      Top = 16
      Width = 33
      Height = 13
      Caption = 'Nome'
    end
    object sbtnProcurar: TSpeedButton
      Left = 641
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
      Left = 569
      Top = 13
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
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 339
    Top = 131
  end
  object ds: TwwDataSource
    DataSet = qry
    Left = 260
    Top = 78
  end
  object dsDet: TwwDataSource
    DataSet = qryDet
    Left = 256
    Top = 129
  end
  object qryDet: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  EVOLFUNC.DATAALTERFUNC, MOTIVO.DESCRICAO,'
      '  EVOLFUNC.SALARIO, EVOLFUNC.TIPOPAGAMENTO,'
      '  EVOLFUNC.PERC_REAJ, CARGO.TITULO,'
      '  C2.TITULO AS FUNCAO,'
      '  CC.NOME AS CCUSTO'
      'FROM'
      '  EVOLFUNC, MOTIVO, CARGO, CARGO C2, CENTCUST CC'
      'WHERE'
      '  (EVOLFUNC.IDPESSOA       = :IDPESSOA)          AND'
      '  (EVOLFUNC.IDMOTIVO       = MOTIVO.IDMOTIVO(+)) AND'
      '  (EVOLFUNC.IDCARGO        = CARGO.IDCARGO(+))   AND'
      '  (EVOLFUNC.IDFUNCAO       = C2.IDCARGO(+))      AND'
      '  (EVOLFUNC.CODCENTROCUSTO = CC.CODCENTROCUSTO(+))'
      'ORDER BY'
      '  EVOLFUNC.DATAALTERFUNC DESC'
      ' ')
    ValidateWithMask = True
    Left = 225
    Top = 129
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryDetDATAALTERFUNC: TDateTimeField
      DisplayLabel = 'Data Efet.'
      DisplayWidth = 10
      FieldName = 'DATAALTERFUNC'
    end
    object qryDetDESCRICAO: TStringField
      DisplayLabel = 'Tipo de Evento'
      DisplayWidth = 50
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object qryDetSALARIO: TFloatField
      DisplayLabel = 'Salário'
      DisplayWidth = 10
      FieldName = 'SALARIO'
      DisplayFormat = '#,0.00;#,0.00'
    end
    object qryDetTIPOPAGAMENTO: TStringField
      DisplayLabel = 'Freq.'
      DisplayWidth = 1
      FieldName = 'TIPOPAGAMENTO'
      Size = 1
    end
    object qryDetPERC_REAJ: TFloatField
      DisplayLabel = '% Reaj.'
      DisplayWidth = 10
      FieldName = 'PERC_REAJ'
      DisplayFormat = '#,0.00;#,0.00'
    end
    object qryDetTITULO: TStringField
      DisplayLabel = 'Cargo'
      DisplayWidth = 40
      FieldName = 'TITULO'
      Size = 40
    end
    object qryDetFUNCAO: TStringField
      DisplayLabel = 'Cargo Alternativo ou Função'
      DisplayWidth = 40
      FieldName = 'FUNCAO'
      Size = 40
    end
    object qryDetCCUSTO: TStringField
      DisplayLabel = 'Centro de Custo'
      DisplayWidth = 30
      FieldName = 'CCUSTO'
      Size = 30
    end
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
    Left = 342
    Top = 79
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
    Left = 227
    Top = 78
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = 10329
      end>
  end
  object qryParamRH: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  FLGDOISCARGOS'
      'FROM'
      '  PARAMRH')
    ValidateWithMask = True
    Left = 443
    Top = 129
  end
end
