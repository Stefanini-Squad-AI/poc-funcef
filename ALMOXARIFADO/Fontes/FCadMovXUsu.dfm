inherited frmCadMovXUsu: TfrmCadMovXUsu
  Left = 313
  Top = 130
  Caption = 'Bloqueio de Usuários'
  ClientHeight = 388
  ClientWidth = 608
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 608
    Height = 349
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 606
      Height = 34
      Align = alTop
      TabOrder = 0
      object Label4: TLabel
        Left = 8
        Top = 9
        Width = 224
        Height = 13
        Caption = 'Data limite para requisição de materiais'
      end
      object Label3: TLabel
        Left = 272
        Top = 9
        Width = 92
        Height = 13
        Caption = 'º dia útil do mês'
      end
      object lblMsgDia: TLabel
        Left = 430
        Top = 8
        Width = 122
        Height = 13
        Caption = 'A nova data foi salva'
        Visible = False
      end
      object sbtOK: TSpeedButton
        Left = 368
        Top = 4
        Width = 56
        Height = 22
        Caption = 'OK'
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888002222200
          88888887788888778F88887222222222088888788888888878F887A228822222
          208887F88FFF888887F887A2FFF8222220888788777FF888878F7A22FFFF8222
          22087F887777FF88887F7A22FFFFF82222087F8877777FF8887F7A22FF8FFF82
          22087F8877F777FF887F7A22FF82FFF822087F8877F8777F887F7A22FF222FF8
          220878F87788877FF87887A2222222FF208887F88888887787F887A222222222
          2088878F888888888788887AA222222208888878FF88888F788888877AAAAA77
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
        OnClick = sbtOKClick
      end
      object BitBtn4: TBitBtn
        Left = 488
        Top = 71
        Width = 62
        Height = 33
        Caption = 'Sel'
        Default = True
        ModalResult = 1
        TabOrder = 0
        Visible = False
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888002222200
          88888887788888778F88887222222222088888788888888878F887A228822222
          208887F88FFF888887F887A2FFF8222220888788777FF888878F7A22FFFF8222
          22087F887777FF88887F7A22FFFFF82222087F8877777FF8887F7A22FF8FFF82
          22087F8877F777FF887F7A22FF82FFF822087F8877F8777F887F7A22FF222FF8
          220878F87788877FF87887A2222222FF208887F88888887787F887A222222222
          2088878F888888888788887AA222222208888878FF88888F788888877AAAAA77
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
      end
      object edDiaUtil: TRealEdit
        Left = 236
        Top = 6
        Width = 33
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '0')
        TabOrder = 1
        WordWrap = False
        OnExit = edDiaUtilExit
        IntDigits = 10
        DecDigits = 0
        NumberFormat = iNumber
        Signal = False
      end
    end
    object pgcPrincipal: TPageControl
      Left = 1
      Top = 35
      Width = 606
      Height = 313
      ActivePage = tbsUsuarios
      Align = alClient
      TabOrder = 1
      object tbsUsuarios: TTabSheet
        Caption = 'Usuários'
        object pnlUsuSistema: TPanel
          Left = 0
          Top = 0
          Width = 265
          Height = 285
          Align = alLeft
          TabOrder = 0
          object pnlGrupoUsu: TPanel
            Left = 1
            Top = 1
            Width = 263
            Height = 59
            Align = alTop
            TabOrder = 0
            object lblUnidNegoc: TLabel
              Left = 9
              Top = 4
              Width = 104
              Height = 13
              Caption = 'Grupos de Acesso'
            end
            object Label1: TLabel
              Left = 10
              Top = 44
              Width = 120
              Height = 13
              Caption = 'Usuários Bloqueados'
            end
            object dblcUnidNegoc: TwwDBLookupCombo
              Left = 8
              Top = 20
              Width = 201
              Height = 21
              DropDownAlignment = taLeftJustify
              LookupTable = CdsGrupoAcesso
              LookupField = 'NOMEGRUPO'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
              OnChange = dblcUnidNegocChange
              OnExit = dblcUnidNegocExit
            end
          end
          object lvUsuBloq: TListView
            Left = 1
            Top = 60
            Width = 263
            Height = 224
            Align = alClient
            Columns = <
              item
                Caption = 'Nome do Usuário'
                Width = 250
              end
              item
                Caption = 'Código'
                Width = 0
              end>
            GridLines = True
            ReadOnly = True
            SortType = stText
            TabOrder = 1
            ViewStyle = vsReport
          end
        end
        object Panel1: TPanel
          Left = 265
          Top = 0
          Width = 333
          Height = 285
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 1
          object pnlButtons: TPanel
            Left = 1
            Top = 1
            Width = 48
            Height = 283
            Align = alLeft
            TabOrder = 0
            object BtnExcluir: TSpeedButton
              Left = 12
              Top = 103
              Width = 25
              Height = 25
              Hint = 'Selciona'
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
              OnClick = BtnExcluirClick
            end
            object BtnExcluirTodos: TSpeedButton
              Left = 12
              Top = 167
              Width = 25
              Height = 25
              Hint = 'Selciona Todos'
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
              OnClick = BtnExcluirTodosClick
            end
            object BtnIncluirTodos: TSpeedButton
              Left = 12
              Top = 135
              Width = 25
              Height = 25
              Hint = 'Exclui'
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
              OnClick = BtnIncluirTodosClick
            end
            object BtnIncluir: TSpeedButton
              Left = 12
              Top = 72
              Width = 25
              Height = 24
              Hint = 'Exclui Todos'
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
              OnClick = BtnIncluirClick
            end
          end
          object pnlUsuDisp: TPanel
            Left = 49
            Top = 1
            Width = 283
            Height = 283
            Align = alClient
            TabOrder = 1
            object Panel2: TPanel
              Left = 1
              Top = 1
              Width = 281
              Height = 24
              Align = alTop
              TabOrder = 0
              object Label2: TLabel
                Left = 9
                Top = 4
                Width = 109
                Height = 13
                Caption = 'Usuários Liberados'
              end
            end
            object lvUsuDesbloq: TListView
              Left = 1
              Top = 25
              Width = 281
              Height = 257
              Align = alClient
              Columns = <
                item
                  Caption = 'Nome do Usuário'
                  Width = 270
                end
                item
                  Caption = 'Código'
                  Width = 0
                end>
              GridLines = True
              ReadOnly = True
              SortType = stText
              TabOrder = 1
              ViewStyle = vsReport
            end
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 349
    Width = 608
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        Enabled = False
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Enabled = False
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 427
    Top = 155
    TargetsData = (
      1
      3
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        'TRealEdit'
        'Text'
        0)
      (
        ''
        'Items'
        0))
  end
  object CdsGrupoAcesso: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    Left = 24
    Top = 168
    object CdsGrupoAcessoIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
    end
    object CdsGrupoAcessoNOMEGRUPO: TStringField
      FieldName = 'NOMEGRUPO'
      FixedChar = True
    end
  end
  object CMSqlGrupoAcesso: TCMSqlParams
    SQL.Strings = (
      'SELECT IDGRUPO,NOMEGRUPO'
      'FROM  GRUPOACESSO       '
      'ORDER BY NOMEGRUPO      '
      '                                       ')
    ClientDataSet = CdsGrupoAcesso
    Left = 155
    Top = 173
  end
  object cdsUsuBloq: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    Left = 32
    Top = 296
  end
  object dsUsuBloq: TDataSource
    DataSet = cdsUsuBloq
    Left = 62
    Top = 296
  end
  object cdsUsuDes: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    Left = 496
    Top = 200
  end
  object dsUsuDes: TDataSource
    DataSet = cdsUsuDes
    Left = 525
    Top = 200
  end
end
