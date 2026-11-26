inherited FrmCadRubXPensaoAlimenticiaRI: TFrmCadRubXPensaoAlimenticiaRI
  Left = 303
  Top = 154
  BorderIcons = []
  BorderStyle = bsSingle
  Caption = 'Cadastro de Rubricas Incidentes na Pensão Alimentícia'
  ClientHeight = 495
  ClientWidth = 826
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 826
    Height = 456
    object Splitter1: TSplitter
      Left = 349
      Top = 1
      Width = 3
      Height = 454
      Cursor = crHSplit
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 348
      Height = 454
      Align = alLeft
      Caption = 'Panel1'
      TabOrder = 0
      object SrcLabel: TLabel
        Left = 1
        Top = 1
        Width = 346
        Height = 29
        Align = alTop
        AutoSize = False
        Caption = 'Rubricas Disponíveis'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
      end
      object wwDBGrid2: TwwDBGrid
        Left = 1
        Top = 30
        Width = 346
        Height = 423
        MemoAttributes = []
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dsRubricasDisponiveis
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        KeyOptions = []
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs]
        ParentFont = False
        TabOrder = 0
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Arial'
        TitleFont.Style = [fsBold]
        TitleLines = 2
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object btnProcurarRubricaDisponivel: TBitBtn
        Left = 256
        Top = 5
        Width = 84
        Height = 22
        Hint = 'Procurar Rubrica'
        Caption = 'Procurar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = btnProcurarRubricaDisponivelClick
        Glyph.Data = {
          4E010000424D4E01000000000000760000002800000012000000120000000100
          040000000000D800000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
          DDDDDD000000DDDDDDDDDDDDDDDDDD000000D000000000000DD00D000000D0FF
          FFFFFFFF0D000D000000D0FFFFFFF0000800DD000000D0FFFFFF0877808DDD00
          0000D0FFFFF0877E880DDD000000D0FFFFF07777870DDD000000D0FFFFF07E77
          870DDD000000D0FFFFF08EE7880DDD000000D0FFFFFF087780DDDD000000D0FF
          FFFFF0000DDDDD000000D0FFFFFFFFFF0DDDDD000000D0FFFFFFF0000DDDDD00
          0000D0FFFFFFF070DDDDDD000000D0FFFFFFF00DDDDDDD000000DD00000000DD
          DDDDDD000000DDDDDDDDDDDDDDDDDD000000}
      end
    end
    object Panel2: TPanel
      Left = 352
      Top = 1
      Width = 473
      Height = 454
      Align = alClient
      TabOrder = 1
      object DstLabel: TLabel
        Left = 1
        Top = 1
        Width = 471
        Height = 29
        Align = alTop
        AutoSize = False
        Caption = 'Rubricas que formarão a base de exclusão da Consignação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clTeal
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentFont = False
        Layout = tlCenter
        WordWrap = True
      end
      object wwDBGrid1: TwwDBGrid
        Left = 41
        Top = 30
        Width = 431
        Height = 423
        Selected.Strings = (
          'CODPROVDESC'#9'8'#9'Código~Externo'
          'IDPROVENTO'#9'8'#9'Código~Interno'
          'DESCRICAO'#9'40'#9'Descrição')
        MemoAttributes = []
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dsRubricasAssociadas
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        KeyOptions = []
        Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs]
        ParentFont = False
        TabOrder = 0
        TitleAlignment = taCenter
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'Arial'
        TitleFont.Style = [fsBold]
        TitleLines = 2
        TitleButtons = False
        IndicatorColor = icBlack
      end
      object Panel3: TPanel
        Left = 1
        Top = 30
        Width = 40
        Height = 423
        Align = alLeft
        TabOrder = 1
        object sbtnAssocia: TSpeedButton
          Left = 6
          Top = 13
          Width = 27
          Height = 26
          Hint = 'Associar rubrica selecionada'
          Caption = '>'
          ParentShowHint = False
          ShowHint = True
          OnClick = sbtnAssociaClick
        end
        object sbtnDesassocia: TSpeedButton
          Left = 6
          Top = 78
          Width = 27
          Height = 26
          Hint = 'Desativar rubrica selecionada'
          Caption = '<'
          ParentShowHint = False
          ShowHint = True
          OnClick = sbtnDesassociaClick
        end
        object sbtnDesassociaTodas: TSpeedButton
          Left = 6
          Top = 110
          Width = 27
          Height = 26
          Hint = 'Desativar todas as rubricas'
          Caption = '<<'
          ParentShowHint = False
          ShowHint = True
          OnClick = sbtnDesassociaTodasClick
        end
        object sbtnAssociaTodas: TSpeedButton
          Left = 6
          Top = 46
          Width = 27
          Height = 26
          Hint = 'Associar todas as rubricas'
          Caption = '>>'
          ParentShowHint = False
          ShowHint = True
          OnClick = sbtnAssociaTodasClick
        end
      end
      object btnProcurarRubricaAssociada: TBitBtn
        Left = 349
        Top = 5
        Width = 84
        Height = 22
        Hint = 'Procurar Rubrica'
        Caption = 'Procurar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = btnProcurarRubricaAssociadaClick
        Glyph.Data = {
          4E010000424D4E01000000000000760000002800000012000000120000000100
          040000000000D800000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
          DDDDDD000000DDDDDDDDDDDDDDDDDD000000D000000000000DD00D000000D0FF
          FFFFFFFF0D000D000000D0FFFFFFF0000800DD000000D0FFFFFF0877808DDD00
          0000D0FFFFF0877E880DDD000000D0FFFFF07777870DDD000000D0FFFFF07E77
          870DDD000000D0FFFFF08EE7880DDD000000D0FFFFFF087780DDDD000000D0FF
          FFFFF0000DDDDD000000D0FFFFFFFFFF0DDDDD000000D0FFFFFFF0000DDDDD00
          0000D0FFFFFFF070DDDDDD000000D0FFFFFFF00DDDDDDD000000DD00000000DD
          DDDDDD000000DDDDDDDDDDDDDDDDDD000000}
      end
    end
  end
  inherited Dock971: TDock97
    Top = 456
    Width = 826
    inherited tb97Fundo: TToolbar97
      Left = 421
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 549
    Top = 38
  end
  object qryRubricasDisponiveis: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'select idprovento, descricao, substr(nvl(codprovdesc,idprovento)' +
        ',1,200) codprovdesc'
      'from provdesc'
      'where flgdesconto in (0,1)'
      'and idprovento not in (select idrubrica'
      '                       from rubxpensaoalim'
      '                       where idempresa       = :pidempresa'
      '                       and   idtitular       = :pidtitular'
      '                       and   idpessoa        = :pidpessoa'
      '                       and   idfavorecido    = :pidfavorecido'
      
        '                       and   seqrubricaindiv = :pseqrubricaindiv' +
        ')'
      'order by codprovdesc')
    ValidateWithMask = True
    Left = 52
    Top = 224
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pidempresa'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pidtitular'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pidpessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pidfavorecido'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pseqrubricaindiv'
        ParamType = ptUnknown
      end>
  end
  object qryRubricasAssociadas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select p.idprovento, p.descricao,'
      
        '       substr(nvl(p.codprovdesc, p.idprovento),1,200) as codprov' +
        'desc'
      'from rubxpensaoalim r, provdesc p'
      'where r.idempresa       = :pidempresa'
      'and   r.idtitular       = :pidtitular'
      'and   r.idpessoa        = :pidpessoa'
      'and   r.idfavorecido    = :pidfavorecido'
      'and   r.seqrubricaindiv = :pseqrubricaindiv'
      'and   r.idrubrica       = p.idprovento'
      'order by codprovdesc')
    ValidateWithMask = True
    Left = 468
    Top = 192
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pidempresa'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pidtitular'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pidpessoa'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pidfavorecido'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'pseqrubricaindiv'
        ParamType = ptUnknown
      end>
  end
  object dsRubricasAssociadas: TwwDataSource
    DataSet = qryRubricasAssociadas
    Left = 468
    Top = 144
  end
  object dsRubricasDisponiveis: TwwDataSource
    DataSet = qryRubricasDisponiveis
    Left = 52
    Top = 176
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 704
    Top = 193
  end
  object MontaBuscaRubrica: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'P.DESCRICAO'
      'P.DESCRPROVDESC'
      'P.CODPROVDESC')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Descrição Interna'
      'Descrição Externa'
      'Código Externo')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PROVDESC P')
    CamposChave.Strings = (
      'P.IDPROVENTO'
      'P.DESCRICAO'
      'P.CODPROVDESC'
      'P.DESCRPROVDESC'
      'P.FLGDESCONTO'
      'P.FLGOBRIGAFAVOREC')
    Filtro.Strings = (
      'FLGTPRUBRICA LIKE '#39'%B%'#39)
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '50'
      '50'
      '7')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 193
    Top = 8
  end
end
