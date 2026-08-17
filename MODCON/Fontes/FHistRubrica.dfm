inherited frmHistRubrica: TfrmHistRubrica
  Left = 275
  Top = 132
  Caption = 'Histórico de Rubricas'
  ClientHeight = 325
  ClientWidth = 468
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 468
    Height = 286
    object pnlIdentificacao: TPanel
      Left = 5
      Top = 5
      Width = 458
      Height = 92
      Align = alTop
      TabOrder = 0
      object Label1: TLabel
        Left = 10
        Top = 11
        Width = 72
        Height = 13
        Caption = 'Contra-Parte'
      end
      object Label2: TLabel
        Left = 10
        Top = 37
        Width = 45
        Height = 13
        Caption = 'Rubrica'
      end
      object Label3: TLabel
        Left = 10
        Top = 65
        Width = 60
        Height = 13
        Caption = 'Paradigma'
      end
      object edNome: TEdit
        Left = 90
        Top = 7
        Width = 350
        Height = 21
        TabStop = False
        Color = clBackground
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object edRubrica: TEdit
        Left = 90
        Top = 35
        Width = 350
        Height = 21
        TabStop = False
        Color = clBackground
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object edParadigma: TEdit
        Left = 90
        Top = 62
        Width = 350
        Height = 21
        TabStop = False
        Color = clBackground
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object bbtnBuscaEmpregado: TBitBtn
        Left = 409
        Top = 60
        Width = 30
        Height = 25
        Hint = 'Busca Outro Empregado como Paradigma'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        OnClick = bbtnBuscaEmpregadoClick
        Glyph.Data = {
          42020000424D4202000000000000420000002800000010000000100000000100
          1000030000000002000000000000000000000000000000000000007C0000E003
          00001F0000001F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C104210421F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000FF7F00001F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000FF7FFF7FFF7F00001F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C00000000FF7FFF7FFF7FFF7FFF7FFF7F00001F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1042FF7FFF7FFF7FFF7FFF7F1F00FF7F00001F7C
          1F7C1F7C1F7C00401F7C1F7C1042FF7FFF7F1F001F001F00FF7FFF7FFF7F0000
          1F7C1F7C1F7C004000401F7C1F7C1042FF7FFF7FFF7FFF7FFF7F1F00FF7F0000
          1F7C1F7C1F7C0040004000401F7C1042FF7FFF7F1F001F001F00FF7FFF7FFF7F
          00001F7C1F7C1F7C0040004000400000000000000000FF7FFF7FFF7F1F00FF7F
          FF7F00001F7C1F7C1F7C00400000FF031F7CFF031F7C000010021F00FF7FFF7F
          FF7FFF7F00001F7C1F7C0000FF031F7CFF031F7CFF031F7C0000FF7FFF7FFF7F
          104210421F7C1F7C1F7C00001F7CFF031F7CFF031F7CFF030000FF7F10421042
          1F7C1F7C1F7C1F7C1F7C0000FF031F7CFF031F7CFF031F7C000010421F7C1F7C
          1F7C1F7C1F7C1F7C1F7C00001F7CFF031F7CFF031F7CFF0300001F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C00001F7CFF031F7CFF0300001F7C1F7C1F7C1F7C
          1F7C1F7C1F7C1F7C1F7C1F7C1F7C00000000000000001F7C1F7C1F7C1F7C1F7C
          1F7C1F7C1F7C}
      end
    end
    object wwDBGrid1: TwwDBGrid
      Left = 5
      Top = 97
      Width = 458
      Height = 184
      Selected.Strings = (
        'MES'#9'17'#9'Mês de Referência'
        'VALORPROVENTO'#9'20'#9'Valor da Contra-Parte'
        'VALPARA'#9'21'#9'Valor do Paradigma')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = ds
      TabOrder = 1
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      IndicatorColor = icBlack
    end
  end
  inherited Dock971: TDock97
    Top = 286
    Width = 468
    inherited tb97Fundo: TToolbar97
      Left = 302
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 611
    Top = 19
  end
  object ds: TwwDataSource
    DataSet = qry
    Left = 192
    Top = 144
  end
  object qry: TwwQuery
    Active = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT H.MES, H.VALORPROVENTO, P.VALORPROVENTO AS VALPARA'
      'FROM HISTRUBSAL H,'
      '     (SELECT MES, VALORPROVENTO'
      '      FROM HISTRUBSAL'
      '      WHERE IDPESSOA   = :IDPARADIGMA'
      '      AND       IDRUBRICA = :IDRUBRICA)  P'
      'WHERE H.IDPESSOA   = :IDPESSOA'
      'AND       H.IDRUBRICA = :IDRUBRICA'
      'AND      H.MES              = P.MES(+)'
      'ORDER BY H.MES DESC')
    ValidateWithMask = True
    Left = 280
    Top = 144
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPARADIGMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDRUBRICA'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDRUBRICA'
        ParamType = ptUnknown
      end>
  end
  object MontaSelectFunc: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'upper(PESSOA.NOME)'
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
    Left = 346
    Top = 66
  end
end
