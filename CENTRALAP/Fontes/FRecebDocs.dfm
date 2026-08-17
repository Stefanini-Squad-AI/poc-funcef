inherited FrmRecebDocs: TFrmRecebDocs
  Left = 11
  Top = 56
  HelpContext = 190010
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  Caption = 'Recebimento de Documentos'
  ClientHeight = 455
  ClientWidth = 778
  Position = poMainFormCenter
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 778
    Height = 369
    object Bevel1: TBevel
      Left = 8
      Top = 51
      Width = 761
      Height = 309
      Anchors = [akLeft, akTop, akRight, akBottom]
    end
    object Label1: TLabel
      Left = 19
      Top = 6
      Width = 55
      Height = 13
      Caption = 'Matrícula'
    end
    object Label2: TLabel
      Left = 260
      Top = 55
      Width = 91
      Height = 13
      Caption = 'Data de Receb.'
    end
    object Label3: TLabel
      Left = 136
      Top = 6
      Width = 33
      Height = 13
      Caption = 'Nome'
    end
    object Label5: TLabel
      Left = 15
      Top = 54
      Width = 109
      Height = 13
      Caption = 'Benefício/Serviço '
    end
    object BtnInclui: TSpeedButton
      Left = 380
      Top = 173
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
      OnClick = BtnIncluiClick
    end
    object BtnIncluiTodos: TSpeedButton
      Tag = 1
      Left = 380
      Top = 205
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
      OnClick = BtnIncluiTodosClick
    end
    object BtnExcluiTodos: TSpeedButton
      Tag = 1
      Left = 380
      Top = 237
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
      OnClick = BtnExcluiTodosClick
    end
    object BtnExclui: TSpeedButton
      Left = 380
      Top = 269
      Width = 25
      Height = 25
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
      OnClick = BtnExcluiClick
    end
    object Label6: TLabel
      Left = 420
      Top = 6
      Width = 51
      Height = 13
      Caption = 'Situação'
    end
    object Label7: TLabel
      Left = 15
      Top = 91
      Width = 51
      Height = 13
      Caption = 'Situação'
    end
    object Label4: TLabel
      Left = 414
      Top = 298
      Width = 27
      Height = 13
      Anchors = [akLeft, akBottom]
      Caption = 'Obs.'
    end
    object Bevel2: TBevel
      Left = 375
      Top = 52
      Width = 2
      Height = 307
      Anchors = [akLeft, akTop, akBottom]
    end
    object Bevel3: TBevel
      Left = 407
      Top = 52
      Width = 2
      Height = 307
      Anchors = [akLeft, akTop, akBottom]
    end
    object Label8: TLabel
      Left = 674
      Top = 6
      Width = 84
      Height = 13
      Anchors = [akTop, akRight]
      Caption = 'Num. R.U.B.S.'
    end
    object DBEditMatr: TwwDBEdit
      Left = 17
      Top = 21
      Width = 109
      Height = 21
      Color = clGray
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object DBEditNome: TwwDBEdit
      Left = 134
      Top = 21
      Width = 277
      Height = 21
      Color = clGray
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbdataInclusao: TCMDateTimePicker
      Left = 259
      Top = 69
      Width = 109
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
      TabOrder = 2
    end
    object GrdTipDesemb: TwwDBGrid
      Left = 412
      Top = 81
      Width = 353
      Height = 212
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Anchors = [akLeft, akTop, akRight, akBottom]
      DataSource = DSTipoDocXrub
      MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
      Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgMultiSelect]
      ParentShowHint = False
      ReadOnly = True
      ShowHint = True
      TabOrder = 3
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
    object Panel5: TPanel
      Left = 10
      Top = 134
      Width = 362
      Height = 26
      BevelInner = bvLowered
      Caption = 'Documentos'
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 4
    end
    object PnlTitDesemb: TPanel
      Left = 411
      Top = 55
      Width = 355
      Height = 26
      Anchors = [akLeft, akTop, akRight]
      BevelInner = bvLowered
      Caption = 'Documentos Recebidos'
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -13
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 5
    end
    object DBEditSituacao: TwwDBEdit
      Left = 418
      Top = 21
      Width = 248
      Height = 21
      Anchors = [akLeft, akTop, akRight]
      Color = clGray
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 6
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dblkBeneficio: TwwDBLookupCombo
      Left = 13
      Top = 68
      Width = 234
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'60'#9'NOME'#9'F')
      LookupTable = QryBeneficio
      LookupField = 'IDSERVICOS'
      TabOrder = 7
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
      OnChange = dblkBeneficioChange
      OnCloseUp = dblkBeneficioCloseUp
    end
    object dblkSitBenef: TwwDBLookupCombo
      Left = 13
      Top = 106
      Width = 354
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'60'#9'DESCRICAO'#9'F')
      LookupTable = qrySitBenef
      LookupField = 'IDSITBENEF'
      Enabled = False
      TabOrder = 8
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
      ShowMatchText = True
      OnChange = dblkSitBenefChange
    end
    object DbRichEditOBS: TwwDBRichEdit
      Left = 412
      Top = 312
      Width = 353
      Height = 43
      Anchors = [akLeft, akRight, akBottom]
      AutoURLDetect = False
      DataField = 'OBS'
      DataSource = DSTipoDocXrub
      PrintJobName = 'Delphi 5'
      TabOrder = 9
      EditorCaption = 'Edit Rich Text'
      EditorPosition.Left = 0
      EditorPosition.Top = 0
      EditorPosition.Width = 0
      EditorPosition.Height = 0
      MeasurementUnits = muInches
      PrintMargins.Top = 1
      PrintMargins.Bottom = 1
      PrintMargins.Left = 1
      PrintMargins.Right = 1
      RichEditVersion = 2
      Data = {
        830000007B5C727466315C616E73695C616E7369637067313235325C64656666
        305C6465666C616E67313034367B5C666F6E7474626C7B5C66305C666E696C20
        4D532053616E732053657269663B7D7D0D0A5C766965776B696E64345C756331
        5C706172645C625C66305C6673313420446252696368456469744F42535C7061
        720D0A7D0D0A00}
    end
    object DBEditNumRUBS: TwwDBEdit
      Left = 673
      Top = 21
      Width = 94
      Height = 21
      Anchors = [akTop, akRight]
      AutoSize = False
      Color = clGray
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 10
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  inherited Dock972: TDock97
    Width = 778
    inherited Toolbar971: TToolbar97
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 416
    Width = 778
    inherited TB97oKCancelar: TToolbar97
      inherited ToolbarSep971: TToolbarSep97
        Left = 162
      end
      inherited bbtnCancelar: TBitBtn
        Left = 81
      end
    end
  end
  object GrdDocsSel: TwwDBGrid [3]
    Left = 11
    Top = 207
    Width = 360
    Height = 195
    IniAttributes.Delimiter = ';;'
    TitleColor = clBtnFace
    FixedCols = 0
    ShowHorzScrollBar = True
    Anchors = [akLeft, akTop, akBottom]
    DataSource = DSdocsXbenef
    MultiSelectOptions = [msoAutoUnselect, msoShiftSelect]
    Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgMultiSelect]
    ParentShowHint = False
    ShowHint = True
    TabOrder = 3
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
  inherited ivTradutor: TIvExtendedTranslator
    Left = 304
    Top = 6
    TargetsData = (
      1
      1
      (
        'TwwDBRichEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 427
    Top = 6
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update RUBS'
      'set'
      '  IDRUBS = :IDRUBS,'
      '  FLGSTATUS = :FLGSTATUS,'
      '  IDASSUNTOXATEND = :IDASSUNTOXATEND,'
      '  IDHISTLANCTO = :IDHISTLANCTO,'
      '  IDHISTBAIXA = :IDHISTBAIXA,'
      '  IDCANCELAMENTO = :IDCANCELAMENTO,'
      '  IDCONFIGRUBS = :IDCONFIGRUBS,'
      '  DATAGERACAO = :DATAGERACAO'
      'where'
      '  IDRUBS = :OLD_IDRUBS')
    InsertSQL.Strings = (
      'insert into RUBS'
      
        '  (IDRUBS, FLGSTATUS, IDASSUNTOXATEND, IDHISTLANCTO, IDHISTBAIXA' +
        ', '
      'IDCANCELAMENTO, '
      '   IDCONFIGRUBS, DATAGERACAO)'
      'values'
      
        '  (:IDRUBS, :FLGSTATUS, :IDASSUNTOXATEND, :IDHISTLANCTO, :IDHIST' +
        'BAIXA, '
      '   :IDCANCELAMENTO, :IDCONFIGRUBS, :DATAGERACAO)')
    DeleteSQL.Strings = (
      'delete from RUBS'
      'where'
      '  IDRUBS = :OLD_IDRUBS')
    Left = 467
    Top = 6
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Participante/Dependente'
    Colunas.Strings = (
      'RUBXBENEFICIO.IDRUBS'
      'VWPARTICIPDEPEN.MATRICULA'
      'VWPARTICIPDEPEN.NOME'
      'VWPARTICIPDEPEN.NUMDOCUMENTO'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PLANPREV.NOME'
      'PJ.NOME')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'C'
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'R.U.B.S.'
      'Matr. do Titular'
      'Nome'
      'CPF'
      'Inscrição'
      'Plano'
      'Patrocinadora')
    SensivelACaixa.Strings = (
      'S'
      'S'
      'S'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'PESSOA PJ'
      'ELEGPATRO'
      'PLANPREV'
      'PARTPREVPLAN'
      'SITPART'
      'VWPARTICIPDEPEN'
      'RUBXBENEFICIO')
    CamposChave.Strings = (
      'RUBXBENEFICIO.IDRUBS'
      'PESSOA.NOME'
      'PESSOA.NUMDOCUMENTO'
      'ELEGPATRO.MATRICULA'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PLANPREV.NOME'
      'PJ.NOME'
      'PJ.IDPESSOA'
      'VWPARTICIPDEPEN.IDTITULAR'
      'SITPART.DESCRICAO'
      'VWPARTICIPDEPEN.IDPESSOA'
      'PLANPREV.IDPLANOPREV'
      'PARTPREVPLAN.SEQPROPOSTA'
      'PESSOA.EMAIL'
      'VWPARTICIPDEPEN.NOME'
      'VWPARTICIPDEPEN.MATRICSHOW')
    Filtro.Strings = (
      'VWPARTICIPDEPEN.IDTITULAR  = ELEGPATRO.IDPESSOA '
      'ELEGPATRO.IDPESSJUR              =  PJ.IDPESSOA(+)'
      'PARTPREVPLAN.IDPESSOA(+)     = ELEGPATRO.IDPESSOA'
      'PARTPREVPLAN.IDPESSJUR (+)  = ELEGPATRO.IDPESSJUR'
      'PARTPREVPLAN.IDPLANOPREV  = PLANPREV.IDPLANOPREV(+) '
      'PARTPREVPLAN.IDSITPART        = SITPART.IDSITPART(+)'
      'VWPARTICIPDEPEN.IDTITULAR  = PESSOA.IDPESSOA'
      'RUBXBENEFICIO.IDPESSOA         = VWPARTICIPDEPEN.IDPESSOA'
      'VWPARTICIPDEPEN.FLGDESATIVADO = PARTPREVPLAN.FLGDESATIVADO')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '10'
      '35'
      '18'
      '10'
      '40'
      '30')
    Left = 605
    Top = 30
  end
  inherited ImlPadrao: TImageList
    Left = 345
    Top = 6
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    AfterConfirma = CmeCadastroAfterConfirma
    Left = 524
    Top = 6
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'select'
      '  IDRUBS, '
      '  FLGSTATUS,'
      '  IDASSUNTOXATEND,'
      '  IDHISTLANCTO, '
      '  IDHISTBAIXA,'
      '  IDCANCELAMENTO,'
      '  IDCONFIGRUBS,'
      '  DATAGERACAO'
      'from  RUBS'
      'where 1=2'
      '')
    Left = 386
    Top = 6
    object qryIDRUBS: TFloatField
      FieldName = 'IDRUBS'
      Origin = 'BASEDADOS.RUBS.IDRUBS'
    end
    object qryFLGSTATUS: TStringField
      FieldName = 'FLGSTATUS'
      Origin = 'BASEDADOS.RUBS.FLGSTATUS'
      FixedChar = True
      Size = 1
    end
    object qryIDASSUNTOXATEND: TFloatField
      FieldName = 'IDASSUNTOXATEND'
      Origin = 'BASEDADOS.RUBS.IDASSUNTOXATEND'
    end
    object qryIDHISTLANCTO: TFloatField
      FieldName = 'IDHISTLANCTO'
      Origin = 'BASEDADOS.RUBS.IDHISTLANCTO'
    end
    object qryIDHISTBAIXA: TFloatField
      FieldName = 'IDHISTBAIXA'
      Origin = 'BASEDADOS.RUBS.IDHISTBAIXA'
    end
    object qryIDCANCELAMENTO: TFloatField
      FieldName = 'IDCANCELAMENTO'
      Origin = 'BASEDADOS.RUBS.IDCANCELAMENTO'
    end
    object qryIDCONFIGRUBS: TFloatField
      FieldName = 'IDCONFIGRUBS'
      Origin = 'BASEDADOS.RUBS.IDCONFIGRUBS'
    end
    object qryDATAGERACAO: TDateTimeField
      FieldName = 'DATAGERACAO'
      Origin = 'BASEDADOS.RUBS.DATAGERACAO'
    end
  end
  object DSBeneficio: TwwDataSource
    DataSet = QryBeneficio
    Left = 45
    Top = 147
  end
  object QryBeneficio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   BE.IDBENEFICIO AS IDSERVICOS,'
      '   BE.NOME'
      'FROM'
      '    BENEFICIO BE'
      'WHERE BE.DESCRUB IS NOT NULL'
      'UNION'
      'SELECT'
      '  SE.IDSERVICOS,'
      '   SE.NOME'
      'FROM'
      '  SERVICO SE'
      'ORDER BY NOME'
      '')
    ValidateWithMask = True
    Left = 29
    Top = 155
    object QryBeneficioIDSERVICOS: TFloatField
      FieldName = 'IDSERVICOS'
    end
    object QryBeneficioNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
  end
  object DSsitBenef: TwwDataSource
    DataSet = qrySitBenef
    Left = 181
    Top = 131
  end
  object qrySitBenef: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  TB.IDSITBENEF, '
      '  DESCRICAO '
      'FROM'
      '  SITUACAOXBENEF TB,'
      '  SITBENEF TP'
      'WHERE'
      '  (TB.IDPESSJUR   = :idpessoa)     AND'
      '  (TB.IDPLANOPREV = :idplanoprev)  AND'
      '  (TB.IDBENEFICIO = :idbeneficio)  AND'
      '  (TB.IDSITBENEF  = TP.IDSITBENEF)'
      'ORDER BY DESCRICAO'
      ' ')
    ValidateWithMask = True
    Left = 221
    Top = 131
    ParamData = <
      item
        DataType = ftFloat
        Name = 'idpessoa'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'idplanoprev'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'idbeneficio'
        ParamType = ptInput
      end>
    object qrySitBenefIDSITBENEF: TFloatField
      FieldName = 'IDSITBENEF'
      Origin = 'BASEDADOS.SITUACAOXBENEF.IDSITBENEF'
    end
    object qrySitBenefDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.SITBENEF.DESCRICAO'
      Size = 60
    end
  end
  object QrydocsXbenef: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      ' SELECT'
      ' TP.IDDOCUMENTO,'
      ' TP.NOMEDOCUMENTO,'
      ' TB.IDBENEFICIO,'
      ' TB.IDSITBENEF'
      'FROM'
      '  DOCUMENTOS TP,'
      '  TIPODOCXBENEF TB'
      'WHERE'
      '(TB.IDPESSOA    = :IDPESSOA) AND'
      '(TB.IDPLANOPREV = :IDPLANOPREV) AND'
      '(TB.IDDOCUMENTO = TP.IDDOCUMENTO) AND'
      '(TB.IDBENEFICIO = :IDBENEFICIO) AND'
      '(TB.IDSITBENEF = :IDSITBENEF)'
      'ORDER  BY  TP.NOMEDOCUMENTO'
      '')
    UpdateObject = UpdDocsXBenef
    ValidateWithMask = True
    Left = 189
    Top = 243
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDBENEFICIO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDSITBENEF'
        ParamType = ptInput
      end>
    object QrydocsXbenefNOMEDOCUMENTO: TStringField
      DisplayLabel = 'Nome do Documento'
      DisplayWidth = 100
      FieldName = 'NOMEDOCUMENTO'
      Origin = 'BASEDADOS.DOCUMENTOS.NOMEDOCUMENTO'
      Size = 100
    end
    object QrydocsXbenefIDBENEFICIO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDBENEFICIO'
      Origin = 'BASEDADOS.TIPODOCXBENEF.IDBENEFICIO'
      Visible = False
    end
    object QrydocsXbenefIDSITBENEF: TFloatField
      DisplayWidth = 10
      FieldName = 'IDSITBENEF'
      Origin = 'BASEDADOS.TIPODOCXBENEF.IDSITBENEF'
      Visible = False
    end
    object QrydocsXbenefIDDOCUMENTO: TFloatField
      FieldName = 'IDDOCUMENTO'
      Origin = 'BASEDADOS.DOCUMENTOS.IDDOCUMENTO'
    end
  end
  object DSdocsXbenef: TwwDataSource
    DataSet = QrydocsXbenef
    Left = 216
    Top = 265
  end
  object UpdQryRubxBenef: TUpdateSQL
    ModifySQL.Strings = (
      'update RUBXBENEFICIO'
      'set'
      '  IDRUBXBENEFICIO = :IDRUBXBENEFICIO,'
      '  IDPESSJUR = :IDPESSJUR,'
      '  IDPESSOA = :IDPESSOA,'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  IDBENEFICIO = :IDBENEFICIO,'
      '  IDRUBS = :IDRUBS,'
      '  IDSITBENEF = :IDSITBENEF,'
      '  IDTITULAR = :IDTITULAR'
      'where'
      '  IDRUBXBENEFICIO = :OLD_IDRUBXBENEFICIO')
    InsertSQL.Strings = (
      'insert into RUBXBENEFICIO'
      
        '  (IDRUBXBENEFICIO, IDPESSJUR, IDPESSOA, IDPLANOPREV, IDBENEFICI' +
        'O, '
      'IDRUBS, '
      '   IDSITBENEF, IDTITULAR)'
      'values'
      
        '  (:IDRUBXBENEFICIO, :IDPESSJUR, :IDPESSOA, :IDPLANOPREV, :IDBEN' +
        'EFICIO, '
      '   :IDRUBS, :IDSITBENEF, :IDTITULAR)')
    DeleteSQL.Strings = (
      'delete from RUBXBENEFICIO'
      'where'
      '  IDRUBXBENEFICIO = :OLD_IDRUBXBENEFICIO')
    Left = 280
    Top = 352
  end
  object QryRubxBenef: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select '
      '  IDRUBXBENEFICIO,'
      '  IDPESSJUR, '
      '  IDPESSOA, '
      '  IDPLANOPREV, '
      '  IDBENEFICIO, '
      '  IDRUBS, '
      '  IDSITBENEF,'
      '  IDTITULAR'
      'from RUBXBENEFICIO'
      'where 1=2')
    UpdateObject = UpdQryRubxBenef
    ValidateWithMask = True
    Left = 277
    Top = 332
    object QryRubxBenefIDRUBXBENEFICIO: TFloatField
      FieldName = 'IDRUBXBENEFICIO'
      Origin = 'BASEDADOS.RUBXBENEFICIO.IDRUBXBENEFICIO'
    end
    object QryRubxBenefIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
      Origin = 'BASEDADOS.RUBXBENEFICIO.IDPESSJUR'
    end
    object QryRubxBenefIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.RUBXBENEFICIO.IDPESSOA'
    end
    object QryRubxBenefIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.RUBXBENEFICIO.IDPLANOPREV'
    end
    object QryRubxBenefIDBENEFICIO: TFloatField
      FieldName = 'IDBENEFICIO'
      Origin = 'BASEDADOS.RUBXBENEFICIO.IDBENEFICIO'
    end
    object QryRubxBenefIDRUBS: TFloatField
      FieldName = 'IDRUBS'
      Origin = 'BASEDADOS.RUBXBENEFICIO.IDRUBS'
    end
    object QryRubxBenefIDSITBENEF: TFloatField
      FieldName = 'IDSITBENEF'
      Origin = 'BASEDADOS.RUBXBENEFICIO.IDSITBENEF'
    end
    object QryRubxBenefIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
    end
  end
  object UpdHistRubs: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTMOVRUBS'
      'set'
      '  IDHISTMOVRUBS = :IDHISTMOVRUBS,'
      '  IDRUBS = :IDRUBS,'
      '  FLGSTATUS = :FLGSTATUS,'
      '  HISTORICO = :HISTORICO,'
      '  DATAMOV = :DATAMOV'
      'where'
      '  IDHISTMOVRUBS = :OLD_IDHISTMOVRUBS')
    InsertSQL.Strings = (
      'insert into HISTMOVRUBS'
      '  (IDHISTMOVRUBS, IDRUBS, FLGSTATUS, HISTORICO, DATAMOV)'
      'values'
      '  (:IDHISTMOVRUBS, :IDRUBS, :FLGSTATUS, :HISTORICO, :DATAMOV)')
    DeleteSQL.Strings = (
      'delete from HISTMOVRUBS'
      'where'
      '  IDHISTMOVRUBS = :OLD_IDHISTMOVRUBS')
    Left = 544
    Top = 304
  end
  object qryTipodocXrub: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    RequestLive = True
    SQL.Strings = (
      'select'
      '    RB.IDPESSOA, '
      '    RB.IDRUBS, '
      '    RB.IDBENEFICIO, '
      '    RB.IDSITBENEF, '
      '    DOC.NOMEDOCUMENTO,'
      '    TP.IDRUBXBENEFICIO,'
      '    TP.IDTIPODOCXRUB, '
      '    TP.IDDOCUMENTO,'
      '    TP.DATARECEB,'
      '    TP.FLGRECEBIDO,'
      '    TP.IDGRUPO,'
      '    TP.OBS,'
      '    GA.NOMEGRUPO'
      
        'from TIPODOCXRUB TP, RUBXBENEFICIO RB, DOCUMENTOS DOC, GRUPOACES' +
        'SO GA'
      'where 1=2  AND '
      '           DOC.IDDOCUMENTO = TP.IDDOCUMENTO AND'
      '           TP.IDGRUPO = GA.IDGRUPO'
      '                    ')
    UpdateObject = UpdqryTipoDocXrub
    ValidateWithMask = True
    Left = 592
    Top = 184
    object qryTipodocXrubNOMEDOCUMENTO: TStringField
      DisplayLabel = 'Documento'
      DisplayWidth = 35
      FieldName = 'NOMEDOCUMENTO'
      Origin = 'BASEDADOS.DOCUMENTOS.NOMEDOCUMENTO'
      Size = 100
    end
    object qryTipodocXrubNOMEGRUPO: TStringField
      DisplayLabel = 'Gr. de Acesso'
      DisplayWidth = 20
      FieldName = 'NOMEGRUPO'
      Origin = 'BASEDADOS.GRUPOACESSO.NOMEGRUPO'
      FixedChar = True
    end
    object qryTipodocXrubIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.RUBXBENEFICIO.IDPESSOA'
      Visible = False
    end
    object qryTipodocXrubIDRUBS: TFloatField
      FieldName = 'IDRUBS'
      Origin = 'BASEDADOS.RUBXBENEFICIO.IDRUBS'
      Visible = False
    end
    object qryTipodocXrubIDBENEFICIO: TFloatField
      FieldName = 'IDBENEFICIO'
      Origin = 'BASEDADOS.RUBXBENEFICIO.IDBENEFICIO'
      Visible = False
    end
    object qryTipodocXrubIDSITBENEF: TFloatField
      FieldName = 'IDSITBENEF'
      Origin = 'BASEDADOS.RUBXBENEFICIO.IDSITBENEF'
      Visible = False
    end
    object qryTipodocXrubIDRUBXBENEFICIO: TFloatField
      FieldName = 'IDRUBXBENEFICIO'
      Origin = 'BASEDADOS.TIPODOCXRUB.IDRUBXBENEFICIO'
      Visible = False
    end
    object qryTipodocXrubIDTIPODOCXRUB: TFloatField
      FieldName = 'IDTIPODOCXRUB'
      Origin = 'BASEDADOS.TIPODOCXRUB.IDTIPODOCXRUB'
      Visible = False
    end
    object qryTipodocXrubIDDOCUMENTO: TFloatField
      FieldName = 'IDDOCUMENTO'
      Origin = 'BASEDADOS.TIPODOCXRUB.IDDOCUMENTO'
      Visible = False
    end
    object qryTipodocXrubDATARECEB: TDateTimeField
      FieldName = 'DATARECEB'
      Origin = 'BASEDADOS.TIPODOCXRUB.DATARECEB'
      Visible = False
    end
    object qryTipodocXrubFLGRECEBIDO: TStringField
      FieldName = 'FLGRECEBIDO'
      Origin = 'BASEDADOS.TIPODOCXRUB.FLGRECEBIDO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryTipodocXrubIDGRUPO: TFloatField
      FieldName = 'IDGRUPO'
      Origin = 'BASEDADOS.TIPODOCXRUB.IDGRUPO'
      Visible = False
    end
    object qryTipodocXrubOBS: TStringField
      FieldName = 'OBS'
      Origin = 'BASEDADOS.TIPODOCXRUB.OBS'
      Visible = False
      Size = 60
    end
  end
  object qryHistRubs: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select'
      '  IDHISTMOVRUBS, '
      '  IDRUBS, '
      '  FLGSTATUS, '
      '  HISTORICO, '
      '  DATAMOV'
      'from  HISTMOVRUBS'
      'where 1=2')
    UpdateObject = UpdHistRubs
    ValidateWithMask = True
    Left = 584
    Top = 312
    object qryHistRubsIDHISTMOVRUBS: TFloatField
      FieldName = 'IDHISTMOVRUBS'
      Origin = 'BASEDADOS.HISTMOVRUBS.IDHISTMOVRUBS'
    end
    object qryHistRubsIDRUBS: TFloatField
      FieldName = 'IDRUBS'
      Origin = 'BASEDADOS.HISTMOVRUBS.IDRUBS'
    end
    object qryHistRubsFLGSTATUS: TStringField
      FieldName = 'FLGSTATUS'
      Origin = 'BASEDADOS.HISTMOVRUBS.FLGSTATUS'
      Size = 2
    end
    object qryHistRubsHISTORICO: TMemoField
      FieldName = 'HISTORICO'
      Origin = 'BASEDADOS.HISTMOVRUBS.HISTORICO'
      BlobType = ftMemo
      Size = 1000
    end
    object qryHistRubsDATAMOV: TDateTimeField
      FieldName = 'DATAMOV'
      Origin = 'BASEDADOS.HISTMOVRUBS.DATAMOV'
    end
  end
  object QryDocAssoc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '   TP.IDDOCUMENTO , TP.NOMEDOCUMENTO'
      'FROM'
      '   TIPODOCXBENEF TB, DOCUMENTOS TP'
      'WHERE'
      '   1 = 2')
    ValidateWithMask = True
    Left = 653
    Top = 262
    object QryDocAssocIDDOCUMENTO: TFloatField
      DisplayLabel = 'Código'
      DisplayWidth = 10
      FieldName = 'IDDOCUMENTO'
    end
    object QryDocAssocNOMEDOCUMENTO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 100
      FieldName = 'NOMEDOCUMENTO'
      Size = 100
    end
  end
  object qryConfigRubTitular: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDCONFIGRUBS, DESCRUB'
      'FROM CONFIGRUBS '
      ''
      'ORDER BY DESCRUB')
    ValidateWithMask = True
    Left = 704
    Top = 8
    object qryConfigRubTitularDESCRUB: TStringField
      DisplayWidth = 60
      FieldName = 'DESCRUB'
      Origin = 'BASEDADOS.CONFIGRUBS.DESCRUB'
      Size = 60
    end
    object qryConfigRubTitularIDCONFIGRUBS: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONFIGRUBS'
      Origin = 'BASEDADOS.CONFIGRUBS.IDCONFIGRUBS'
      Visible = False
    end
  end
  object UpdqryTipoDocXrub: TUpdateSQL
    ModifySQL.Strings = (
      'update TIPODOCXRUB'
      'set'
      '  IDRUBXBENEFICIO = :IDRUBXBENEFICIO,'
      '  IDTIPODOCXRUB = :IDTIPODOCXRUB,'
      '  IDDOCUMENTO = :IDDOCUMENTO,'
      '  DATARECEB = :DATARECEB,'
      '  FLGRECEBIDO = :FLGRECEBIDO,'
      '  IDGRUPO = :IDGRUPO,'
      '  OBS = :OBS'
      'where'
      '  IDTIPODOCXRUB = :OLD_IDTIPODOCXRUB')
    InsertSQL.Strings = (
      'insert into TIPODOCXRUB'
      '  (IDRUBXBENEFICIO, IDTIPODOCXRUB, IDDOCUMENTO, DATARECEB, '
      'FLGRECEBIDO, '
      '   IDGRUPO, OBS)'
      'values'
      '  (:IDRUBXBENEFICIO, :IDTIPODOCXRUB, :IDDOCUMENTO, :DATARECEB, '
      ':FLGRECEBIDO, '
      '   :IDGRUPO, :OBS)')
    DeleteSQL.Strings = (
      'delete from TIPODOCXRUB'
      'where'
      '  IDTIPODOCXRUB = :OLD_IDTIPODOCXRUB')
    Left = 528
    Top = 200
  end
  object qryConfigRubDepend: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDCONFIGRUBS, DESCRUB'
      'FROM CONFIGRUBS '
      ''
      'ORDER BY DESCRUB')
    ValidateWithMask = True
    Left = 702
    Top = 168
    object qryConfigRubDependDESCRUB: TStringField
      DisplayWidth = 60
      FieldName = 'DESCRUB'
      Origin = 'BASEDADOS.CONFIGRUBS.DESCRUB'
      Size = 60
    end
    object qryConfigRubDependIDCONFIGRUBS: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONFIGRUBS'
      Origin = 'BASEDADOS.CONFIGRUBS.IDCONFIGRUBS'
      Visible = False
    end
  end
  object DSTipoDocXrub: TwwDataSource
    DataSet = qryTipodocXrub
    Left = 552
    Top = 119
  end
  object UpdDocsXBenef: TUpdateSQL
    Left = 288
    Top = 248
  end
  object qryDocs: TwwQuery
    SQL.Strings = (
      'SELECT'
      ' TP.IDDOCUMENTO,'
      ' TP.NOMEDOCUMENTO'
      'FROM'
      '  DOCUMENTOS TP')
    ValidateWithMask = True
    Left = 64
    Top = 328
  end
  object Dsdocs: TwwDataSource
    DataSet = qryDocs
    Left = 80
    Top = 328
  end
  object MsGrupoUsu: TMontaSelect
    Template.IdConsulta = 0
    Caption = 
      'Selecione o Grupo de Acesso (seção) para onde o(s) Documento(s) ' +
      'será(ão) Enviado(s)'
    Colunas.Strings = (
      'GRUPOACESSO.IDGRUPO'
      'GRUPOACESSO.NOMEGRUPO')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Código do Grupo'
      'Nome do Grupo')
    SensivelACaixa.Strings = (
      'N'
      'S')
    Tabelas.Strings = (
      'GRUPOACESSO')
    CamposChave.Strings = (
      'GRUPOACESSO.IDGRUPO'
      'GRUPOACESSO.NOMEGRUPO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '20')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 328
    Top = 55
  end
  object MsParticipDepen: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Participante/Dependente'
    Colunas.Strings = (
      'VWPARTICIPDEPEN.MATRICULA'
      'VWPARTICIPDEPEN.MATRICULADEP'
      'VWPARTICIPDEPEN.NOME'
      'VWPARTICIPDEPEN.PLANO'
      
        'DECODE (VWPARTICIPDEPEN.FLGDESATIVADO, NULL, '#39' '#39',  1, '#39'NÃO'#39', 0, ' +
        #39'SIM'#39')'
      'VWPARTICIPDEPEN.INSCRICAONUMERO'
      'VWPARTICIPDEPEN.PATRO'
      'VWPARTICIPDEPEN.NUMDOCUMENTO'
      'VWPARTICIPDEPEN.DESCRICAO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C'
      'N'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Matr. Titular'
      'Matr. Depen.'
      'Nome'
      'Plano'
      'Ativo no Plano'
      'Inscrição'
      'Patrocinadora'
      'CPF'
      'Situação do Participante')
    SensivelACaixa.Strings = (
      'S'
      'S'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'VWPARTICIPDEPEN')
    CamposChave.Strings = (
      'VWPARTICIPDEPEN.NOME'
      'VWPARTICIPDEPEN.NUMDOCUMENTO'
      'VWPARTICIPDEPEN.MATRICULA'
      'VWPARTICIPDEPEN.INSCRICAONUMERO'
      'VWPARTICIPDEPEN.PLANO'
      'VWPARTICIPDEPEN.PATRO'
      'VWPARTICIPDEPEN.IDPESSJUR'
      'VWPARTICIPDEPEN.IDTITULAR'
      'VWPARTICIPDEPEN.DESCRICAO'
      'VWPARTICIPDEPEN.IDPESSOA'
      'VWPARTICIPDEPEN.IDPLANOPREV'
      'VWPARTICIPDEPEN.SEQPROPOSTA'
      'VWPARTICIPDEPEN.EMAIL'
      'VWPARTICIPDEPEN.SITFUND'
      'VWPARTICIPDEPEN.MATRICSHOW')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '15'
      '15'
      '35'
      '35'
      '6'
      '10'
      '30'
      '18'
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 643
    Top = 140
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 120
    Top = 224
  end
  object qryTipoDocxRubAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  TP.IDTIPODOCXRUB, TP.IDGRUPO '
      'FROM TIPODOCXRUB TP, RUBXBENEFICIO RB '
      
        'WHERE TP.IDRUBXBENEFICIO = RB.IDRUBXBENEFICIO AND RB.IDRUBS = :i' +
        'drubs')
    ValidateWithMask = True
    Left = 472
    Top = 279
    ParamData = <
      item
        DataType = ftInteger
        Name = 'idrubs'
        ParamType = ptInput
      end>
  end
end
