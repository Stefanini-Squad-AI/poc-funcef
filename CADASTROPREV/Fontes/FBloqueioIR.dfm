inherited frmBloqueioIR: TfrmBloqueioIR
  Left = 304
  Top = 130
  Caption = 'Bloqueio Alteração IR'
  ClientHeight = 396
  ClientWidth = 641
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 641
    Height = 310
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 639
      Height = 308
      Align = alClient
      BevelOuter = bvNone
      BorderWidth = 2
      TabOrder = 0
      object Label1: TLabel
        Left = 16
        Top = 10
        Width = 607
        Height = 13
        Caption = 
          'Bloqueio de alteração de "Data Opção IR" e "Tabela Opção de IR" ' +
          'do cadastro de elegível e participante'
      end
      object sbtnAdicionar: TSpeedButton
        Left = 303
        Top = 103
        Width = 39
        Height = 34
        Hint = 'Adicionar'
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888006666600
          88888887788888778F88880666666666088888788888F88878F880E6666F6666
          608887F888878F8887F880E6666FF66660888788888778F8878F0E66666FFF66
          66087F88FFF7778F887F0E6FFFFFFFF666087F8777777778F87F0E6FFFFFFFFF
          66087F8777777777887F0E6FFFFFFFF666087F8777777778887F0E66666FFF66
          660878F888877788887880E6666FF666608887F88887788887F880E6666F6666
          6088878F888788888788880EE666666608888878FF888888788888800EEEEE00
          8888888778FFFF77888888888000008888888888877777888888}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = sbtnAdicionarClick
      end
      object sbtnRemover: TSpeedButton
        Left = 303
        Top = 189
        Width = 39
        Height = 34
        Hint = 'Remover'
        Flat = True
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888006666600
          88888887788888778F88880666666666088888788888F88878F880E6666F6666
          608887F88887F88887F880E666FF6666608887888877F888878F0E666FFF6666
          66087F888777FFFFF87F0E66FFFFFFFF66087F8877777777F87F0E6FFFFFFFFF
          66087F8777777777F87F0E66FFFFFFFF66087F8877777777887F0E666FFF6666
          660878F88777F888887880E666FF6666608887F88877F88887F880E6666F6666
          6088878F888788888788880EE666666608888878FF888888788888800EEEEE00
          8888888778FFFF77888888888000008888888888877777888888}
        NumGlyphs = 2
        ParentShowHint = False
        ShowHint = True
        OnClick = sbtnRemoverClick
      end
      object sbtnAdicionarTudo: TSpeedButton
        Left = 303
        Top = 146
        Width = 39
        Height = 34
        Hint = 'Adicionar Todas'
        Flat = True
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
        OnClick = sbtnAdicionarTudoClick
      end
      object sbtnRemoverTudo: TSpeedButton
        Left = 303
        Top = 232
        Width = 39
        Height = 34
        Hint = 'Remover Todas'
        Flat = True
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
        OnClick = sbtnRemoverTudoClick
      end
      object Panel2: TPanel
        Left = 11
        Top = 51
        Width = 286
        Height = 28
        BevelInner = bvLowered
        Caption = 'Usuários bloqueados'
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object Panel3: TPanel
        Left = 346
        Top = 52
        Width = 279
        Height = 27
        BevelInner = bvLowered
        Caption = 'Usuários liberados'
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
      object dbgdEstabHab: TCMDbListView
        Left = 346
        Top = 76
        Width = 279
        Height = 229
        Columns = <
          item
            Caption = 'Nome Usuário'
            Width = 170
          end
          item
            Caption = 'Nome'
            Width = 105
          end>
        ReadOnly = True
        RowSelect = True
        TabOrder = 2
        ViewStyle = vsReport
        DataSource = dsLiberado
        AutoCreateColumns = False
        AddFieldsAsSubItems = False
        CloseDataSet = False
      end
    end
  end
  inherited Dock972: TDock97
    Width = 641
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        DropdownArrow = True
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        DropdownArrow = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 357
    Width = 641
  end
  object dbgdEstabNaoHab: TCMDbListView [3]
    Left = 14
    Top = 128
    Width = 283
    Height = 224
    Columns = <
      item
        Caption = 'Nome Usuário'
        Width = 170
      end
      item
        Caption = 'Nome'
        Width = 109
      end>
    ReadOnly = True
    RowSelect = True
    TabOrder = 3
    ViewStyle = vsReport
    DataSource = dsBloqueado
    AutoCreateColumns = False
    AddFieldsAsSubItems = False
    CloseDataSet = False
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 168
    Top = 14
    TargetsData = (
      1
      1
      (
        ''
        'Items'
        0))
  end
  inherited ds: TwwDataSource
    DataSet = nil
    Left = 315
    Top = 14
  end
  inherited upd: TUpdateSQL
    Left = 411
    Top = 14
  end
  inherited MontaSelect: TMontaSelect
    Left = 493
    Top = 6
  end
  inherited ImlPadrao: TImageList
    Left = 257
    Top = 14
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 556
    Top = 6
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      
        'SELECT  U.NOMEUSUARIO, P.NOME,U.IDUSUARIO FROM USUARIOSISTEMA U,' +
        ' PESSOA P '
      'WHERE FLGBLOQUEIOALTIR = 1'
      '      AND P.IDPESSOA = U.IDUSUARIO'
      'ORDER BY U.NOMEUSUARIO    ')
    Left = 226
    Top = 286
  end
  object cdsBloqueado: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ValidateWithMask = True
    Left = 97
    Top = 288
  end
  object dsLiberado: TwwDataSource
    DataSet = cdsLibeado
    Left = 385
    Top = 280
  end
  object cdsLibeado: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ValidateWithMask = True
    Left = 481
    Top = 280
  end
  object qryLiberado: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT  U.NOMEUSUARIO, P.NOME,U.IDUSUARIO FROM USUARIOSISTEMA U,' +
        ' PESSOA P '
      'WHERE FLGBLOQUEIOALTIR = 0'
      '      AND P.IDPESSOA = U.IDUSUARIO'
      'ORDER BY U.NOMEUSUARIO    ')
    ValidateWithMask = True
    Left = 553
    Top = 280
  end
  object dsBloqueado: TwwDataSource
    DataSet = cdsBloqueado
    Left = 161
    Top = 256
  end
end
