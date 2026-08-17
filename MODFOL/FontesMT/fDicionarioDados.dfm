inherited frmDicionarioDados: TfrmDicionarioDados
  Left = 19
  Top = 56
  HelpContext = 210054
  ActiveControl = btnConsultar
  Caption = 'Dicionário de Dados'
  ClientHeight = 464
  ClientWidth = 755
  Constraints.MinHeight = 491
  Constraints.MinWidth = 763
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 755
    Height = 425
    BorderWidth = 2
    object Bevel1: TBevel
      Left = 5
      Top = 5
      Width = 745
      Height = 28
      Anchors = [akLeft, akTop, akRight]
      Style = bsRaised
    end
    object lblVisao: TfcLabel
      Left = 8
      Top = 7
      Width = 738
      Height = 22
      Anchors = [akLeft, akTop, akRight]
      AutoSize = False
      Caption = 'Grupos de Dados'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TextOptions.Alignment = taCenter
      TextOptions.Shadow.Enabled = True
      TextOptions.Shadow.XOffset = 2
      TextOptions.Shadow.YOffset = 2
      TextOptions.VAlignment = vaTop
    end
    object pnlBotoes: TPanel
      Left = 5
      Top = 377
      Width = 745
      Height = 43
      Anchors = [akLeft, akRight, akBottom]
      TabOrder = 0
      object bbtnCadGrupo: TBitBtn
        Left = 333
        Top = 5
        Width = 116
        Height = 33
        Caption = 'Cadastrar &Grupos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        OnClick = bbtnCadGrupoClick
      end
      object bbtnVisao: TBitBtn
        Left = 107
        Top = 5
        Width = 100
        Height = 33
        Caption = 'Alterar &Visão'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = bbtnVisaoClick
      end
      object btnCadCampos: TBitBtn
        Left = 454
        Top = 5
        Width = 116
        Height = 33
        Caption = 'Cadastrar &Campos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = btnCadCamposClick
      end
      object btnConsultar: TBitBtn
        Left = 5
        Top = 5
        Width = 97
        Height = 33
        Caption = '&Consultar'
        Default = True
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnClick = btnConsultarClick
      end
      object btnAtualizar: TBitBtn
        Left = 212
        Top = 5
        Width = 116
        Height = 33
        Caption = 'Atualizar &Dados'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        OnClick = btnAtualizarClick
      end
      object btnAssociarCamposGrupos: TBitBtn
        Left = 575
        Top = 5
        Width = 164
        Height = 33
        Caption = 'A&ssociar Campos/Grupos'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        OnClick = btnAssociarCamposGruposClick
      end
    end
    object pnlFundo2: TPanel
      Left = 5
      Top = 34
      Width = 745
      Height = 342
      Anchors = [akLeft, akTop, akRight, akBottom]
      BevelOuter = bvNone
      TabOrder = 1
      object Splitter1: TSplitter
        Left = 273
        Top = 0
        Width = 3
        Height = 342
        Cursor = crHSplit
        Color = clBlack
        ParentColor = False
        ResizeStyle = rsLine
      end
      object pnlGrupo: TPanel
        Left = 0
        Top = 0
        Width = 273
        Height = 342
        Align = alLeft
        BevelInner = bvSpace
        BevelOuter = bvNone
        TabOrder = 0
        object dbgrPrincipal: TwwDBGrid
          Left = 4
          Top = 4
          Width = 265
          Height = 334
          Selected.Strings = (
            'DESCRICAO'#9'40'#9'DESCRICAO')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 1
          ShowHorzScrollBar = True
          Anchors = [akLeft, akTop, akRight, akBottom]
          DataSource = dsGrupos
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
          UseTFields = False
          IndicatorColor = icBlack
        end
      end
      object pnlCampos: TPanel
        Left = 276
        Top = 0
        Width = 469
        Height = 342
        Align = alClient
        BevelInner = bvSpace
        BevelOuter = bvNone
        TabOrder = 1
        object lblCampos: TLabel
          Left = 4
          Top = 3
          Width = 460
          Height = 26
          Alignment = taCenter
          Anchors = [akLeft, akTop, akRight]
          AutoSize = False
          Caption = 'Campos'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -20
          Font.Name = 'Arial Narrow'
          Font.Style = [fsBold]
          ParentColor = False
          ParentFont = False
        end
        object dbgrdCampos: TwwDBGrid
          Left = 4
          Top = 32
          Width = 461
          Height = 306
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
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 1
          ShowHorzScrollBar = True
          Anchors = [akLeft, akTop, akRight, akBottom]
          DataSource = dsCmpBd
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          UseTFields = False
          IndicatorColor = icBlack
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 425
    Width = 755
    inherited tb97Fundo: TToolbar97
      Left = 589
      DockPos = 637
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 109
    Top = 322
  end
  object dsGrupos: TwwDataSource
    AutoEdit = False
    DataSet = CdsGrupos
    OnDataChange = dsGruposDataChange
    Left = 88
    Top = 80
  end
  object dsTable: TwwDataSource
    AutoEdit = False
    DataSet = CdsTable
    OnDataChange = dsTableDataChange
    Left = 149
    Top = 80
  end
  object dsCmpBd: TwwDataSource
    AutoEdit = False
    DataSet = CdsCmpBd
    Left = 399
    Top = 133
  end
  object dsCampos: TwwDataSource
    AutoEdit = False
    DataSet = CdsCampos
    Left = 338
    Top = 133
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
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
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 35
    Top = 322
  end
  object CdsGrupos: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'CdsGruposIndex'
        CaseInsFields = 'DESCRICAO'
        Fields = 'DESCRICAO'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'CdsGruposIndex'
    Params = <>
    StoreDefs = True
    Left = 88
    Top = 67
  end
  object CdsTable: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'CdsTableIndex'
        CaseInsFields = 'DESCRICAO'
        Fields = 'DESCRICAO'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'CdsTableIndex'
    Params = <>
    StoreDefs = True
    Left = 149
    Top = 67
  end
  object CdsCmpBd: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'CdsCmpBdIndex'
        CaseInsFields = 'DESCGRUPOARQUIVO'
        Fields = 'IDCAMPO;DESCGRUPOARQUIVO'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'CdsCmpBdIndex'
    Params = <>
    StoreDefs = True
    Left = 399
    Top = 120
  end
  object CdsCampos: TCMClientDataSet
    Aggregates = <>
    FieldDefs = <>
    IndexDefs = <
      item
        Name = 'CdsCamposIndex'
        CaseInsFields = 'DESCGRUPOARQUIVO'
        Fields = 'IDCAMPO;DESCGRUPOARQUIVO'
        Options = [ixCaseInsensitive]
      end>
    IndexName = 'CdsCamposIndex'
    Params = <>
    StoreDefs = True
    Left = 338
    Top = 120
  end
end
