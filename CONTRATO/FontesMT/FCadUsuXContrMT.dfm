inherited frmCadUsuXContrMT: TfrmCadUsuXContrMT
  Left = 231
  Top = 207
  Width = 658
  Height = 447
  HelpContext = 120011
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  BorderStyle = bsSizeable
  Caption = 'Cadastro de Usuários X Contratos'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 650
    Height = 334
    object pnlDados: TPanel
      Left = 1
      Top = 85
      Width = 648
      Height = 248
      Align = alClient
      TabOrder = 0
      object pnlContratosDisp: TPanel
        Left = 1
        Top = 1
        Width = 280
        Height = 246
        Align = alLeft
        TabOrder = 0
        object pnlTituloContratosDisp: TPanel
          Left = 1
          Top = 1
          Width = 278
          Height = 32
          Align = alTop
          BevelOuter = bvNone
          Caption = 'Contratos Disponíveis'
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object grdDisponiveis: TwwDBGrid
          Left = 1
          Top = 33
          Width = 278
          Height = 212
          Selected.Strings = (
            'NOMECONTRATO'#9'35'#9'Nome do Contrato')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsDisponiveis
          Options = [dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          ReadOnly = True
          TabOrder = 1
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 2
          TitleButtons = False
          OnCalcCellColors = grdCalcCellColors
          IndicatorColor = icBlack
        end
      end
      object pnlSeparacao: TPanel
        Left = 281
        Top = 1
        Width = 60
        Height = 246
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 1
        object BtnAdicionaTudo: TSpeedButton
          Left = 10
          Top = 56
          Width = 40
          Height = 34
          Hint = 'Adiciona Todos'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888FFFFF8888888888000008888888888F777778FF888888006666600
            88888887788888778F88887666666666088888788888888878F887E666666666
            608887F88F888F8887F887E6F666F6666088878878F878F8878F7E66FF66FF66
            66087F88778F778F887F7E66FFF6FFF666087F8877787778F87F7E66FFFFFFFF
            66087F8877777777887F7E66FFF6FFF666087F8877787778887F7E66FF66FF66
            660878F877887788887887E6F666F666608887F87888788887F887E666666666
            6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
            8888888778FFFF77888888888777778888888888877777888888}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = BtnAdicionaTudoClick
        end
        object btnAdiciona: TSpeedButton
          Left = 10
          Top = 98
          Width = 40
          Height = 34
          Hint = 'Adiciona'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888FFFFF8888888888000008888888888F777778FF888888006666600
            88888887788888778F88887666666666088888788888888878F887E666666666
            608887F8888F888887F887E666F66666608887888878F888878F7E6666FF6666
            66087F8888778F88887F7E6666FFF66666087F88887778F8887F7E6666FFFF66
            66087F8888777788887F7E6666FFF66666087F8888777888887F7E6666FF6666
            660878F888778888887887E666F66666608887F88878888887F887E666666666
            6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
            8888888778FFFF77888888888777778888888888877777888888}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = btnAdicionaClick
        end
        object BtnRemove: TSpeedButton
          Left = 10
          Top = 141
          Width = 40
          Height = 34
          Hint = 'Remove'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888FFFFF8888888888000008888888888F777778FF888888006666600
            88888887788888778F88887666666666088888788888888878F887E666666666
            608887F888888F8887F887E66666F6666088878888887F88878F7E66666FF666
            66087F8888877F88887F7E6666FFF66666087F8888777F88887F7E666FFFF666
            66087F8887777F88887F7E6666FFF66666087F8888777F88887F7E66666FF666
            660878F888877F88887887E66666F666608887F88888788887F887E666666666
            6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
            8888888778FFFF77888888888777778888888888877777888888}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = BtnRemoveClick
        end
        object btnRemoveTudo: TSpeedButton
          Left = 10
          Top = 184
          Width = 40
          Height = 34
          Hint = 'Remove Todos'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888FFFFF8888888888000008888888888F777778FF888888006666600
            88888887788888778F88887666666666088888788888888878F887E666666666
            608887F8888F888F87F887E666F666F660888788887F887F878F7E666FF66FF6
            66087F88877F877F887F7E66FFF6FFF666087F88777F777F887F7E6FFFFFFFF6
            66087F877777777F887F7E66FFF6FFF666087F88777F777F887F7E666FF66FF6
            660878F8877F877F887887E666F666F6608887F88878887887F887E666666666
            6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
            8888888778FFFF77888888888777778888888888877777888888}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = btnRemoveTudoClick
        end
      end
      object Panel2: TPanel
        Left = 341
        Top = 1
        Width = 306
        Height = 246
        Align = alClient
        TabOrder = 2
        object pnlTituloContratosSel: TPanel
          Left = 1
          Top = 1
          Width = 304
          Height = 32
          Align = alTop
          BevelOuter = bvNone
          Caption = 'Contratos Selecionados'
          Color = clGray
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object grdSelecionados: TwwDBGrid
          Left = 1
          Top = 33
          Width = 304
          Height = 212
          Selected.Strings = (
            'NOMECONTRATO'#9'60'#9'NOMECONTRATO')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = ds
          Options = [dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          ReadOnly = True
          TabOrder = 1
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 2
          TitleButtons = False
          OnCalcCellColors = grdCalcCellColors
          IndicatorColor = icBlack
        end
      end
    end
    object pnlTopo: TPanel
      Left = 1
      Top = 1
      Width = 648
      Height = 84
      Align = alTop
      TabOrder = 1
      object Label1: TLabel
        Left = 16
        Top = 16
        Width = 44
        Height = 13
        Caption = 'Usuário'
      end
      object EdUsuario: TEdit
        Left = 16
        Top = 32
        Width = 601
        Height = 21
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
    end
  end
  inherited Dock972: TDock97
    Width = 650
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Caption = '&Atualizar'
      end
      inherited sbtnAlterar: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 381
    Width = 650
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 426
    Top = 7
  end
  inherited ds: TwwDataSource
    AutoEdit = False
    Left = 494
    Top = 239
  end
  inherited ImlPadrao: TImageList
    Left = 600
    Top = 7
  end
  inherited CmeCadastro: TCmEventosCadastro
    RepetirInsert = False
    OnFind = CmeCadastroFind
    Left = 264
    Top = 65535
  end
  inherited Cds: TCMClientDataSet
    IndexFieldNames = 'NOMECONTRATO'
    Left = 460
    Top = 239
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'USUARIOSISTEMA.NOMEUSUARIO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Usuário')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'USUARIOSISTEMA')
    CamposChave.Strings = (
      'USUARIOSISTEMA.IDUSUARIO'
      'USUARIOSISTEMA.NOMEUSUARIO')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    Left = 488
    Top = 7
  end
  object spTeste: TCMSqlParams
    SQL.Strings = (
      'SELECT A.CODARTIGO, P.DESCPROD'
      'FROM ARTIGO A, PRODUTO P'
      'WHERE A.CODPRODUTO=P.CODPRODUTO'
      'ORDER BY P.DESCPROD')
    Left = 544
    Top = 7
  end
  object cdsDisponiveis: TCMClientDataSet
    Aggregates = <>
    IndexFieldNames = 'NOMECONTRATO'
    Params = <>
    Left = 92
    Top = 239
  end
  object dsDisponiveis: TwwDataSource
    AutoEdit = False
    DataSet = cdsDisponiveis
    Left = 166
    Top = 239
  end
end
