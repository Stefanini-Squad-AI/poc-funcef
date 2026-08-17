inherited frmCadDisponibXUsuMT: TfrmCadDisponibXUsuMT
  Top = 142
  Caption = 'Bloqueio de Usuários'
  ClientHeight = 438
  ClientWidth = 686
  WindowState = wsMaximized
  OnClick = FormClick
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 686
    Height = 399
    object pgcPrincipal: TPageControl
      Left = 1
      Top = 69
      Width = 684
      Height = 329
      ActivePage = tbsUsuarios
      Align = alClient
      TabOrder = 1
      object tbsUsuarios: TTabSheet
        Caption = 'Usuários'
        object pnlUsuSistema: TPanel
          Left = 0
          Top = 0
          Width = 265
          Height = 301
          Align = alLeft
          TabOrder = 0
          object dbgUsuSistema: TwwDBGrid
            Left = 1
            Top = 60
            Width = 263
            Height = 240
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsUsuBloqueado
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
            OnKeyDown = dbgUsuSistemaKeyDown
            OnKeyPress = dbgUsuSistemaKeyPress
            IndicatorColor = icBlack
          end
          object pnlGrupoUsu: TPanel
            Left = 1
            Top = 1
            Width = 263
            Height = 59
            Align = alTop
            TabOrder = 1
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
              Selected.Strings = (
                'NOMEGRUPO'#9'20'#9'Nome do Grupo'#9'F')
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
        end
        object Panel1: TPanel
          Left = 265
          Top = 0
          Width = 411
          Height = 301
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 1
          object pnlButtons: TPanel
            Left = 1
            Top = 1
            Width = 48
            Height = 299
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
              OnClick = IncluirExcluirUsu
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
              OnClick = IncluirExcluirTodosUsu
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
              OnClick = IncluirExcluirTodosUsu
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
              OnClick = IncluirExcluirUsu
            end
          end
          object pnlUsuDisp: TPanel
            Left = 49
            Top = 1
            Width = 361
            Height = 299
            Align = alClient
            TabOrder = 1
            object dbgUsuDiponib: TwwDBGrid
              Left = 1
              Top = 25
              Width = 359
              Height = 273
              IniAttributes.Delimiter = ';;'
              TitleColor = clBtnFace
              FixedCols = 0
              ShowHorzScrollBar = True
              Align = alClient
              DataSource = dsUsuLiberado
              Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
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
              OnKeyDown = dbgUsuDiponibKeyDown
              OnKeyPress = dbgUsuDiponibKeyPress
              IndicatorColor = icBlack
            end
            object Panel2: TPanel
              Left = 1
              Top = 1
              Width = 359
              Height = 24
              Align = alTop
              TabOrder = 1
              object Label2: TLabel
                Left = 9
                Top = 4
                Width = 109
                Height = 13
                Caption = 'Usuários Liberados'
              end
            end
          end
        end
      end
    end
    object Panel3: TPanel
      Left = 1
      Top = 1
      Width = 684
      Height = 68
      Align = alTop
      TabOrder = 0
      object Label4: TLabel
        Left = 8
        Top = 7
        Width = 99
        Height = 13
        Caption = 'Data do Bloqueio'
      end
      object edDataBloqDisp: TCMDateTimePicker
        Left = 8
        Top = 23
        Width = 160
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        Epoch = 1950
        ButtonGlyph.Data = {
          06050000424D06050000000000003604000028000000100000000D0000000100
          080000000000D000000000000000000000000001000000000000000000000000
          80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
          A6000020400000206000002080000020A0000020C0000020E000004000000040
          20000040400000406000004080000040A0000040C0000040E000006000000060
          20000060400000606000006080000060A0000060C0000060E000008000000080
          20000080400000806000008080000080A0000080C0000080E00000A0000000A0
          200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
          200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
          200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
          20004000400040006000400080004000A0004000C0004000E000402000004020
          20004020400040206000402080004020A0004020C0004020E000404000004040
          20004040400040406000404080004040A0004040C0004040E000406000004060
          20004060400040606000406080004060A0004060C0004060E000408000004080
          20004080400040806000408080004080A0004080C0004080E00040A0000040A0
          200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
          200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
          200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
          20008000400080006000800080008000A0008000C0008000E000802000008020
          20008020400080206000802080008020A0008020C0008020E000804000008040
          20008040400080406000804080008040A0008040C0008040E000806000008060
          20008060400080606000806080008060A0008060C0008060E000808000008080
          20008080400080806000808080008080A0008080C0008080E00080A0000080A0
          200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
          200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
          200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
          2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
          2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
          2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
          2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
          2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
          2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
          2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
          000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
          A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
          A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
          A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
          FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
          04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
          000000000000000000FF}
        ShowButton = True
        TabOrder = 0
        DisplayFormat = 'dd/mm/yyyy hh:nn'
        OnExit = edDataBloqDispExit
      end
      object bbtnBloqueia: TBitBtn
        Left = 176
        Top = 16
        Width = 113
        Height = 33
        Caption = '&Desbloqueia'
        Default = True
        ModalResult = 1
        TabOrder = 1
        OnClick = bbtnBloqueiaClick
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
      object BitBtn4: TBitBtn
        Left = 488
        Top = 71
        Width = 62
        Height = 33
        Caption = 'Sel'
        Default = True
        ModalResult = 1
        TabOrder = 2
        Visible = False
        OnClick = BitBtn4Click
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
    end
  end
  inherited Dock971: TDock97
    Top = 399
    Width = 686
    inherited tb97Fundo: TToolbar97
      Left = 367
      inherited sep1: TToolbarSep97
        Left = 246
      end
      inherited sep3: TToolbarSep97
        Left = 162
      end
      inherited bbtnSair: TBitBtn
        Left = 81
        Caption = 'Sair'
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 165
        Caption = 'Ajuda'
      end
      object bt_Imprime: TBitBtn
        Left = 0
        Top = 0
        Width = 81
        Height = 33
        Caption = 'Imprimir'
        TabOrder = 2
        Visible = False
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          0003377777777777777308888888888888807F33333333333337088888888888
          88807FFFFFFFFFFFFFF7000000000000000077777777777777770F8F8F8F8F8F
          8F807F333333333333F708F8F8F8F8F8F9F07F333333333337370F8F8F8F8F8F
          8F807FFFFFFFFFFFFFF7000000000000000077777777777777773330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3F37F3733333330F08F0F0333333337F7337F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
        NumGlyphs = 2
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        Caption = 'OK'
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Caption = 'Cancelar'
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 467
    Top = 51
  end
  object dsUsuBloqueado: TwwDataSource
    AutoEdit = False
    DataSet = CdsUsuBloqueado
    Left = 136
    Top = 176
  end
  object CdsUsuLiberado: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    Left = 416
    Top = 136
    object CdsUsuLiberadoNOMEUSUARIO: TStringField
      DisplayLabel = 'Nome do Usuário'
      DisplayWidth = 46
      FieldName = 'NOMEUSUARIO'
      FixedChar = True
      Size = 46
    end
    object CdsUsuLiberadoIDUSUARIO: TFloatField
      FieldName = 'IDUSUARIO'
      Visible = False
    end
    object CdsUsuLiberadoFLGDISPFINANC: TStringField
      FieldName = 'FLGDISPFINANC'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object CmeCadastro: TCmEventosCadastro
    Operacao = opIdle
    RepetirInsert = True
    DataSource = dsUsuBloqueado
    OpenDsAutomatico = False
    Left = 416
    Top = 48
  end
  object CdsGrupoAcesso: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    Left = 59
    Top = 101
    object CdsGrupoAcessoIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
    end
    object CdsGrupoAcessoNOMEGRUPO: TStringField
      FieldName = 'NOMEGRUPO'
      FixedChar = True
    end
  end
  object CdsUsuBloqueado: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    Left = 44
    Top = 173
    object CdsUsuBloqueadoNOMEUSUARIO: TStringField
      DisplayLabel = 'Nome do Usuário'
      DisplayWidth = 32
      FieldName = 'NOMEUSUARIO'
      FixedChar = True
      Size = 32
    end
    object CdsUsuBloqueadoFLGDISPFINANC: TStringField
      FieldName = 'FLGDISPFINANC'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object CdsUsuBloqueadoIDUSUARIO: TFloatField
      FieldName = 'IDUSUARIO'
      Visible = False
    end
  end
  object dsUsuLiberado: TwwDataSource
    AutoEdit = False
    DataSet = CdsUsuLiberado
    Left = 416
    Top = 184
  end
  object dsp: TDataSetProvider
    DataSet = qry
    Constraints = True
    Left = 523
    Top = 134
  end
  object qry: TwwQuery
    DatabaseName = 'Refer'
    SQL.Strings = (
      'SELECT                           '
      '   USU.IDUSUARIO, USU.NOMEUSUARIO,USU.FLGDISPFINANC'
      'FROM                             '
      '   USUARIOSISTEMA USU,           '
      '   DISPONIBXUSU DIP              '
      'WHERE                            '
      '   DIP.IDUSUARIO = USU.IDUSUARIO '
      '')
    ValidateWithMask = True
    Left = 523
    Top = 94
  end
  object CMSqlGrupoAcesso: TCMSqlParams
    SQL.Strings = (
      'SELECT IDGRUPO,NOMEGRUPO'
      'FROM  GRUPOACESSO       '
      'ORDER BY NOMEGRUPO      '
      '                                       ')
    ClientDataSet = CdsGrupoAcesso
    Left = 246
    Top = 107
  end
  object CdsParamFinanc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspParamFinanc'
    Left = 48
    Top = 24
  end
  object CMSqlUsuBloqueado: TCMSqlParams
    SQL.Strings = (
      'SELECT IDUSUARIO,'
      '       P.NOME AS NOMEUSUARIO,'
      '       FLGDISPFINANC'
      'FROM USUARIOSISTEMA U'
      'JOIN PESSOA P ON P.IDPESSOA = U.IDUSUARIO'
      '                                       ')
    ClientDataSet = CdsUsuBloqueado
    Left = 244
    Top = 175
  end
  object qryParamFinanc: TwwQuery
    DatabaseName = 'Refer'
    SQL.Strings = (
      'SELECT DATABLOQDISPFINAN,FLGDISPBLOQ'
      'FROM PARAMFINANC')
    ValidateWithMask = True
    Left = 115
    Top = 21
  end
  object dspParamFinanc: TDataSetProvider
    DataSet = qryParamFinanc
    Constraints = True
    Left = 203
    Top = 21
  end
  object CdsDispFinanc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'DataSetProvider1'
    Left = 426
    Top = 328
  end
  object Cds: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    Left = 522
    Top = 248
  end
  object CdsRateioDispFinanc: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    Left = 522
    Top = 328
  end
  object qryDispSintetica: TwwQuery
    DatabaseName = 'Refer'
    SQL.Strings = (
      'SELECT'
      'PP.NOME||'#39' - '#39' ||P.RAZAOSOCIAL AS NOMEPLANOPATRO,'
      'U2.DATADISPFINANC,'
      'U2.SALDOANT,'
      'U2.IDPLANO,'
      'U2.IDPATRO,'
      'U2.VALORPAG AS DESENBOLSOS,'
      'U2.VALORREC AS RECEBIMENTOS,'
      'U2.SALDOATUAL AS SALDODIA'
      'FROM'
      '   PESSOA P, PLANPREVCONTABIL PP,'
      '('
      'SELECT'
      'U.IDPLANO,U.IDPATRO,U.IDPESSOA,'
      'U.DATADISPFINANC,'
      'SUM(U.SALDOANT) AS SALDOANT,'
      'SUM(U.VALORPAG) AS VALORPAG,'
      'SUM(U.VALORREC) AS VALORREC,'
      'SUM(U.SALDOANT + U.VALORREC - U.VALORPAG) AS SALDOATUAL'
      'FROM'
      '('
      '(SELECT'
      'RI.IDPLANO,RI.IDPATRO,RI.IDPESSOA,DI.DATADISPFINANC,'
      'SUM(DI.VLRDISPFINANC) AS SALDOANT,'
      '0 AS VALORPAG,'
      '0 AS VALORREC,'
      '0 AS SALDOATUAL'
      'FROM'
      'DISPFINANC DI, RATEIODISPFINANC RI'
      'WHERE'
      'DI.IDDISPFINANC = RI.IDDISPFINANC'
      'AND (DI.DATADISPFINANC = TO_DATE('#39'15/01/2003'#39','#39'DD/MM/YYYY'#39'))'
      'AND (RI.IDPESSOA = 2)'
      'AND (DI.TIPOREG='#39'A'#39')'
      'GROUP BY'
      'RI.IDPLANO,RI.IDPATRO,RI.IDPESSOA,DI.DATADISPFINANC )'
      ''
      'UNION ALL'
      ''
      '(SELECT'
      'RI.IDPLANO,RI.IDPATRO,RI.IDPESSOA,DI.DATADISPFINANC,'
      '0 AS SALDOANT,'
      
        'DECODE(SIGN(SUM(DI.VLRDISPFINANC)),-1,SUM(DI.VLRDISPFINANC),0) A' +
        'S VALORPAG,'
      
        'DECODE(SIGN(SUM(DI.VLRDISPFINANC)),-1,0,SUM(DI.VLRDISPFINANC)) A' +
        'S VALORREC,'
      '0 AS SALDOATUAL'
      'FROM'
      'DISPFINANC DI, RATEIODISPFINANC RI'
      'WHERE'
      'DI.IDDISPFINANC = RI.IDDISPFINANC'
      'AND (DI.DATADISPFINANC = TO_DATE('#39'15/01/2003'#39','#39'DD/MM/YYYY'#39'))'
      'AND (RI.IDPESSOA = 2)'
      'AND (DI.TIPOREG='#39'F'#39')'
      'GROUP BY'
      'RI.IDPLANO,RI.IDPATRO,RI.IDPESSOA,DI.DATADISPFINANC )'
      ''
      'UNION ALL'
      ''
      '(SELECT'
      'RI.IDPLANO,RI.IDPATRO,RI.IDPESSOA,DI.DATADISPFINANC,'
      '0 AS SALDOANT,'
      'SUM(DI.VLRDISPFINANC)*-1 AS VALORPAG,'
      '0 AS VALORREC,'
      '0 AS SALDOATUAL'
      'FROM'
      'DISPFINANC DI, RATEIODISPFINANC RI'
      'WHERE'
      'DI.IDDISPFINANC = RI.IDDISPFINANC'
      'AND (DI.DATADISPFINANC = TO_DATE('#39'15/01/2003'#39','#39'DD/MM/YYYY'#39'))'
      'AND (RI.IDPESSOA = 2)'
      'AND (DI.TIPOREG='#39'P'#39')'
      'GROUP BY'
      'RI.IDPLANO,RI.IDPATRO,RI.IDPESSOA,DI.DATADISPFINANC )'
      ''
      'UNION ALL'
      ''
      '(SELECT'
      'RI.IDPLANO,RI.IDPATRO,RI.IDPESSOA,DI.DATADISPFINANC,'
      '0 AS SALDOANT,'
      '0 AS VALORPAG,'
      'SUM(DI.VLRDISPFINANC) AS VALORREC,'
      '0 AS SALDOATUAL'
      'FROM'
      'DISPFINANC DI, RATEIODISPFINANC RI'
      'WHERE'
      'DI.IDDISPFINANC = RI.IDDISPFINANC'
      ''
      'AND (DI.DATADISPFINANC = TO_DATE('#39'15/01/2003'#39','#39'DD/MM/YYYY'#39'))'
      'AND (RI.IDPESSOA = 2)'
      'AND (DI.TIPOREG='#39'R'#39')'
      'GROUP BY'
      'RI.IDPLANO,RI.IDPATRO,RI.IDPESSOA,DI.DATADISPFINANC )'
      ') U'
      'GROUP BY                                                      '
      '    U.IDPLANO,U.IDPATRO,U.IDPESSOA,                           '
      '    U.DATADISPFINANC                                          '
      ') U2'
      'WHERE'
      '(U2.IDPATRO = P.IDPESSOA(+))'
      'AND (U2.IDPLANO = PP.IDPLANOPREV(+))'
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 327
    Top = 241
    object qryDispSinteticaNOMEPLANOPATRO: TStringField
      FieldName = 'NOMEPLANOPATRO'
      Size = 113
    end
    object qryDispSinteticaDATADISPFINANC: TDateTimeField
      FieldName = 'DATADISPFINANC'
    end
    object qryDispSinteticaSALDOANT: TFloatField
      FieldName = 'SALDOANT'
    end
    object qryDispSinteticaIDPLANO: TFloatField
      FieldName = 'IDPLANO'
    end
    object qryDispSinteticaIDPATRO: TFloatField
      FieldName = 'IDPATRO'
    end
    object qryDispSinteticaDESENBOLSOS: TFloatField
      FieldName = 'DESENBOLSOS'
    end
    object qryDispSinteticaRECEBIMENTOS: TFloatField
      FieldName = 'RECEBIMENTOS'
    end
    object qryDispSinteticaSALDODIA: TFloatField
      FieldName = 'SALDODIA'
    end
  end
  object dspDispSintetica: TDataSetProvider
    DataSet = qryDispSintetica
    Constraints = True
    Left = 227
    Top = 241
  end
  object CdsDispSintetica: TCMClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspDispSintetica'
    Left = 56
    Top = 239
    object CdsDispSinteticaNOMEPLANOPATRO: TStringField
      DisplayLabel = 'Plano / Patrocinadora'
      DisplayWidth = 50
      FieldName = 'NOMEPLANOPATRO'
      Size = 113
    end
    object CdsDispSinteticaSALDOANT: TFloatField
      DisplayLabel = 'Saldo Anterior'
      DisplayWidth = 19
      FieldName = 'SALDOANT'
      DisplayFormat = '#,##0.00'
    end
    object CdsDispSinteticaDESENBOLSOS: TFloatField
      DisplayLabel = 'Desembolsos'
      DisplayWidth = 17
      FieldName = 'DESENBOLSOS'
      DisplayFormat = '#,##0.00'
    end
    object CdsDispSinteticaRECEBIMENTOS: TFloatField
      DisplayLabel = 'Recebimentos'
      DisplayWidth = 17
      FieldName = 'RECEBIMENTOS'
      DisplayFormat = '#,##0.00'
    end
    object CdsDispSinteticaSALDODIA: TFloatField
      DisplayLabel = 'Saldo do Dia'
      DisplayWidth = 20
      FieldName = 'SALDODIA'
      DisplayFormat = '#,##0.00'
    end
    object CdsDispSinteticaDATADISPFINANC: TDateTimeField
      FieldName = 'DATADISPFINANC'
      Visible = False
    end
    object CdsDispSinteticaIDPLANO: TFloatField
      FieldName = 'IDPLANO'
      Visible = False
    end
    object CdsDispSinteticaIDPATRO: TFloatField
      FieldName = 'IDPATRO'
      Visible = False
    end
  end
  object CdsDispAnalitica: TCMClientDataSet
    Aggregates = <>
    Filtered = True
    Params = <>
    ProviderName = 'dspDispAnalitica'
    Left = 56
    Top = 293
    object CdsDispAnaliticaNOMEPLANOPATRO: TStringField
      DisplayLabel = 'Plano / Patrocinadora'
      DisplayWidth = 39
      FieldName = 'NOMEPLANOPATRO'
      Size = 113
    end
    object CdsDispAnaliticaHISTORICO: TStringField
      DisplayLabel = 'Documento'
      DisplayWidth = 32
      FieldName = 'HISTORICO'
      Size = 100
    end
    object CdsDispAnaliticaNOMEFORCLI: TStringField
      DisplayLabel = 'Fornecedor / Cliente'
      DisplayWidth = 40
      FieldName = 'NOMEFORCLI'
      Size = 60
    end
    object CdsDispAnaliticaVALOR: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 15
      FieldName = 'VALOR'
      DisplayFormat = '#,##0.00'
    end
    object CdsDispAnaliticaIDPLANO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANO'
      Visible = False
    end
    object CdsDispAnaliticaIDPATRO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPATRO'
      Visible = False
    end
    object CdsDispAnaliticaDATADISPFINANC: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATADISPFINANC'
      Visible = False
    end
  end
  object dsDispSintetica: TwwDataSource
    AutoEdit = False
    DataSet = CdsDispSintetica
    Left = 144
    Top = 240
  end
  object dsDispAnalitica: TwwDataSource
    DataSet = CdsDispAnalitica
    Left = 144
    Top = 296
  end
  object qryAux: TwwQuery
    DatabaseName = 'Refer'
    ValidateWithMask = True
    Left = 523
    Top = 191
  end
  object dspDispAnalitica: TDataSetProvider
    DataSet = qryDispAnalitica
    Constraints = True
    Left = 227
    Top = 297
  end
  object qryDispAnalitica: TwwQuery
    DatabaseName = 'Refer'
    SQL.Strings = (
      'SELECT'
      '   U.IDPLANO,'
      '   U.IDPATRO,'
      '   U.DATADISPFINANC,'
      '   U.HISTORICO,'
      '   U.VLRDISPFINANC AS VALOR,'
      '   PT.NOME||'#39' - '#39' ||P.RAZAOSOCIAL AS NOMEPLANOPATRO,'
      '   U.NOMEFORCLI'
      'FROM'
      '   PESSOA P,'
      '   PLANPREVCONTABIL PT,'
      '       ('
      '        SELECT'
      '           R.IDPLANO,'
      '           R.IDPATRO,'
      '           D.DATADISPFINANC,'
      '           D.TIPOREG,'
      '           D.HISTORICO,'
      '           D.VLRDISPFINANC,'
      '           P.NOME AS NOMEFORCLI'
      '        FROM'
      '           DISPFINANC D,'
      '           RATEIODISPFINANC R,'
      '           PESSOA P'
      '        WHERE'
      '           D.IDDISPFINANC = R.IDDISPFINANC'
      '           AND R.IDFORCLI = P.IDPESSOA'
      '           AND R.IDPESSOA = 2'
      
        '           AND DATADISPFINANC = TO_DATE('#39'15/01/2003'#39','#39'DD/MM/YYYY' +
        #39')'
      ''
      '        UNION'
      ''
      '        SELECT'
      '           R.IDPLANO,'
      '           R.IDPATRO,'
      '           D.DATADISPFINANC,'
      '           '#39'S'#39' AS TIPOREG,'
      '           '#39'Saldo Final'#39' AS HISTORICO,'
      '           SUM(D.VLRDISPFINANC) AS VLRDISPFINANC,'
      '           '#39#39' AS NOMEFORCLI'
      '        FROM'
      '           DISPFINANC D,'
      '           RATEIODISPFINANC R'
      '        WHERE'
      '           D.IDDISPFINANC = R.IDDISPFINANC'
      '           AND R.IDPESSOA = 2'
      
        '           AND D.DATADISPFINANC = TO_DATE('#39'15/01/2003'#39','#39'DD/MM/YY' +
        'YY'#39')'
      '        GROUP BY'
      '           R.IDPLANO, R.IDPATRO,D.DATADISPFINANC'
      '       )U'
      'WHERE'
      '   U.IDPATRO = P.IDPESSOA'
      '   AND U.IDPLANO = PT.IDPLANOPREV'
      'ORDER BY U.IDPLANO,U.IDPATRO,U.TIPOREG'
      ' '
      '')
    ValidateWithMask = True
    Left = 324
    Top = 296
    object qryDispAnaliticaIDPLANO: TFloatField
      FieldName = 'IDPLANO'
    end
    object qryDispAnaliticaIDPATRO: TFloatField
      FieldName = 'IDPATRO'
    end
    object qryDispAnaliticaDATADISPFINANC: TDateTimeField
      FieldName = 'DATADISPFINANC'
    end
    object qryDispAnaliticaHISTORICO: TStringField
      FieldName = 'HISTORICO'
      Size = 100
    end
    object qryDispAnaliticaVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object qryDispAnaliticaNOMEPLANOPATRO: TStringField
      FieldName = 'NOMEPLANOPATRO'
      Size = 113
    end
    object qryDispAnaliticaNOMEFORCLI: TStringField
      FieldName = 'NOMEFORCLI'
      Size = 60
    end
  end
end
