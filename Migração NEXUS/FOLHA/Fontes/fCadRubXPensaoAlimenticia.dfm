inherited FrmCadRubXPensaoAlimenticia: TFrmCadRubXPensaoAlimenticia
  Left = 5
  Top = 106
  Caption = 'Cadastro de Rubricas Incidentes na Pensão Alimentícia'
  ClientHeight = 437
  ClientWidth = 773
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 773
    Height = 398
    object Splitter1: TSplitter
      Left = 353
      Top = 5
      Width = 3
      Height = 388
      Cursor = crHSplit
    end
    object Panel1: TPanel
      Left = 5
      Top = 5
      Width = 348
      Height = 388
      Align = alLeft
      Caption = 'Panel1'
      TabOrder = 0
      object SrcLabel: TLabel
        Left = 1
        Top = 1
        Width = 346
        Height = 29
        Align = alTop
        Alignment = taCenter
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
        Height = 357
        Selected.Strings = (
          'CODPROVDESC'#9'8'#9'Código~Externo'
          'IDPROVENTO'#9'8'#9'Código~Interno'
          'DESCRICAO'#9'36'#9'Descrição'#9'F')
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
    end
    object Panel2: TPanel
      Left = 356
      Top = 5
      Width = 412
      Height = 388
      Align = alClient
      TabOrder = 1
      object DstLabel: TLabel
        Left = 1
        Top = 1
        Width = 410
        Height = 29
        Align = alTop
        Alignment = taCenter
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
        Width = 370
        Height = 357
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
        Height = 357
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
    end
  end
  inherited Dock971: TDock97
    Top = 398
    Width = 773
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 549
    Top = 38
  end
  object qryRubricasDisponiveis: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'select idprovento, descricao, nvl(codprovdesc,idprovento) codpro' +
        'vdesc'
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
    Left = 49
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
      '       nvl(p.codprovdesc, p.idprovento) as codprovdesc'
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
end
