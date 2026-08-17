inherited frmDicionarioDados: TfrmDicionarioDados
  Left = 22
  Top = 55
  Caption = 'Dicionário de Dados'
  ClientHeight = 437
  ClientWidth = 755
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 755
    Height = 398
    object lblVisao: TLabel
      Left = 5
      Top = 5
      Width = 745
      Height = 33
      Align = alTop
      Alignment = taCenter
      AutoSize = False
      Caption = 'Grupos de Dados'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -19
      Font.Name = 'Bookman Old Style'
      Font.Style = [fsItalic]
      ParentColor = False
      ParentFont = False
    end
    object Panel1: TPanel
      Left = 162
      Top = 38
      Width = 461
      Height = 355
      Align = alRight
      Caption = 'Panel1'
      TabOrder = 0
      object Panel4: TPanel
        Left = 1
        Top = 1
        Width = 459
        Height = 353
        Align = alClient
        Caption = 'Panel3'
        TabOrder = 0
        object lblCampos: TLabel
          Left = 1
          Top = 1
          Width = 457
          Height = 33
          Align = alTop
          Alignment = taCenter
          AutoSize = False
          Caption = 'Campos'
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindow
          Font.Height = -19
          Font.Name = 'Bookman Old Style'
          Font.Style = [fsItalic]
          ParentColor = False
          ParentFont = False
        end
        object dbgrd: TwwDBGrid
          Left = 1
          Top = 34
          Width = 457
          Height = 318
          Selected.Strings = (
            'IDCAMPO'#9'20'#9'IDCAMPO'
            'ENTIDADE'#9'30'#9'ENTIDADE'
            'NOMEDOCAMPO'#9'30'#9'NOMEDOCAMPO'
            'DESCRICAODOCAMPO'#9'60'#9'DESCRICAODOCAMPO'
            'CAMPODOBANCO'#9'10'#9'CAMPODOBANCO'
            'CHAVE'#9'10'#9'CHAVE'
            'FLGOBRIGATORIO'#9'10'#9'FLGOBRIGATORIO'
            'APELIDO'#9'30'#9'APELIDO'
            'TRGDTINCLUSAO'#9'10'#9'TRGDTINCLUSAO'
            'TRGUSERINCLUSAO'#9'30'#9'TRGUSERINCLUSAO'
            'IDTIPODADO'#9'10'#9'IDTIPODADO'
            'CODGRUPOARQUIVO'#9'6'#9'CODGRUPOARQUIVO'
            'DESCGRUPOARQUIVO'#9'40'#9'DESCGRUPOARQUIVO')
          TitleColor = clBtnFace
          FixedCols = 1
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsCmpBd
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          ParentFont = False
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          IndicatorColor = icBlack
          object dbgrdIButton: TwwIButton
            Left = 0
            Top = 0
            Width = 13
            Height = 25
            AllowAllUp = True
          end
        end
      end
    end
    object pnlBotoes: TPanel
      Left = 623
      Top = 38
      Width = 127
      Height = 355
      Align = alRight
      BevelInner = bvLowered
      TabOrder = 1
      object bbtnCadGrupo: TBitBtn
        Left = 6
        Top = 99
        Width = 115
        Height = 43
        Caption = 'Cadastrar Grupo'
        TabOrder = 0
        OnClick = bbtnCadGrupoClick
      end
      object bbtnVisao: TBitBtn
        Left = 6
        Top = 52
        Width = 115
        Height = 43
        Caption = 'Alterar Visão'
        TabOrder = 1
        OnClick = bbtnVisaoClick
      end
      object btnCadCampos: TBitBtn
        Left = 6
        Top = 194
        Width = 115
        Height = 43
        Caption = 'Cadastrar Campos'
        TabOrder = 2
        OnClick = btnCadCamposClick
      end
      object btnConsulta: TBitBtn
        Left = 6
        Top = 5
        Width = 115
        Height = 43
        Caption = 'Consulta'
        TabOrder = 3
        OnClick = btnConsultaClick
      end
      object btnAtualizar: TBitBtn
        Left = 6
        Top = 241
        Width = 115
        Height = 43
        Caption = 'Atualizar Dados'
        TabOrder = 4
        OnClick = btnAtualizarClick
      end
      object btnAssociarCamposGrupos: TBitBtn
        Left = 6
        Top = 147
        Width = 115
        Height = 43
        Caption = 'Associar Campos/Grupos'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial Narrow'
        Font.Style = []
        ParentFont = False
        TabOrder = 5
        OnClick = btnAssociarCamposGruposClick
      end
    end
    object dbgrPrincipal: TwwDBGrid
      Left = 5
      Top = 38
      Width = 157
      Height = 355
      Selected.Strings = (
        'DESCRICAO'#9'40'#9'DESCRICAO')
      TitleColor = clBtnFace
      FixedCols = 1
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = dsGrupos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      ParentFont = False
      TabOrder = 2
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
    Top = 398
    Width = 755
  end
  object QryGrupos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      CODGRUPOARQUIVO, DESCGRUPOARQUIVO  AS DESCRICAO'
      'FROM'
      '    GRPARQUIVO'
      'ORDER BY'
      '      DESCGRUPOARQUIVO')
    ValidateWithMask = True
    Left = 101
    Top = 77
  end
  object dsGrupos: TwwDataSource
    DataSet = QryGrupos
    OnDataChange = dsGruposDataChange
    Left = 101
    Top = 125
  end
  object QryTable: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      TABLENAME AS DESCRICAO'
      'FROM'
      '    DDTABLE'
      'ORDER BY'
      '      TABLENAME')
    ValidateWithMask = True
    Left = 37
    Top = 77
  end
  object dsTable: TwwDataSource
    DataSet = QryTable
    OnDataChange = dsTableDataChange
    Left = 37
    Top = 125
  end
  object QryCmpBd: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      C.* , CG.CODGRUPOARQUIVO , G.DESCGRUPOARQUIVO'
      'FROM'
      '    CMPBD C, CMPBDGRP CG, GRPARQUIVO G'
      'WHERE'
      '     (G.CODGRUPOARQUIVO = CG.CODGRUPOARQUIVO) AND'
      '     (CG.IDCAMPO = C.IDCAMPO) AND'
      '     (G.DESCGRUPOARQUIVO = :DESCRICAO) AND'
      '     (C.CAMPODOBANCO > 0)'
      'ORDER BY'
      '      C.IDCAMPO, G.DESCGRUPOARQUIVO')
    Params.Data = {010001000944455343524943414F0001020030000000}
    ControlType.Strings = (
      'CHAVE;CheckBox;1;0'
      'FLGOBRIGATORIO;CheckBox;1;0'
      'CAMPODOBANCO;CheckBox;1;2')
    ValidateWithMask = True
    Left = 101
    Top = 245
  end
  object dsCmpBd: TwwDataSource
    DataSet = QryCmpBd
    Left = 101
    Top = 197
  end
  object QryCampos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      C.*, CG.CODGRUPOARQUIVO, G.DESCGRUPOARQUIVO'
      'FROM'
      '    CMPBD C, CMPBDGRP CG, GRPARQUIVO G'
      'WHERE'
      '     (C.ENTIDADE = :DESCRICAO) AND'
      '     (G.CODGRUPOARQUIVO = CG.CODGRUPOARQUIVO) AND'
      '     (C.IDCAMPO = CG.IDCAMPO) AND'
      '     (C.CAMPODOBANCO > 0)'
      'ORDER BY'
      '      C.IDCAMPO, G.DESCGRUPOARQUIVO')
    Params.Data = {010001000944455343524943414F0001020030000000}
    ControlType.Strings = (
      'CAMPODOBANCO;CheckBox;1;2'
      'CHAVE;CheckBox;1;0'
      'FLGOBRIGATORIO;CheckBox;1;0')
    ValidateWithMask = True
    Left = 37
    Top = 245
  end
  object dsCampos: TwwDataSource
    DataSet = QryCampos
    Left = 37
    Top = 197
  end
  object MontaSelect1: TMontaSelect
    Caption = 'Seleciona'
    Colunas.Strings = (
      'CMPBDGRP.IDCAMPO'
      'CMPBD.DESCRICAODOCAMPO'
      'CMPBD.ENTIDADE'
      'GRPARQUIVO.CODGRUPOARQUIVO'
      'GRPARQUIVO.DESCGRUPOARQUIVO'
      'CMPBD.NOMEDOCAMPO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Identificador do Campo'
      'Descrição do Campo'
      'Entidade'
      'Cód. Grupo Arquivo'
      'Descrição do Grupo Arq.'
      'Nome do Campo')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'GRPARQUIVO'
      'CMPBDGRP'
      'CMPBD')
    CamposChave.Strings = (
      'GRPARQUIVO.CODGRUPOARQUIVO'
      'GRPARQUIVO.DESCGRUPOARQUIVO'
      'CMPBDGRP.IDCAMPO'
      'CMPBD.ENTIDADE')
    Filtro.Strings = (
      'GRPARQUIVO.CODGRUPOARQUIVO = CMPBDGRP.CODGRUPOARQUIVO'
      'CMPBD.CAMPODOBANCO > 0'
      'CMPBD.IDCAMPO = CMPBDGRP.IDCAMPO')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '12'
      '60'
      '30'
      '6'
      '40'
      '30')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    Left = 67
    Top = 31
  end
end
 
