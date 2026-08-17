inherited frmCadAssunto: TfrmCadAssunto
  Left = 141
  Top = 116
  HelpContext = 190030
  Caption = 'Cadastro de Assuntos'
  ClientHeight = 506
  ClientWidth = 715
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 715
    Height = 420
    inherited pnlMestre: TPanel
      Width = 713
      Height = 229
      Align = alClient
      object tpprocess: TLabel
        Left = 248
        Top = 48
        Width = 104
        Height = 13
        Caption = 'Tipo de Processo '
      end
      object Label1: TLabel
        Left = 20
        Top = 4
        Width = 100
        Height = 13
        Caption = 'Nome do Assunto'
      end
      object Label3: TLabel
        Left = 478
        Top = 48
        Width = 90
        Height = 13
        Caption = 'Modelo de RUB'
      end
      object Label4: TLabel
        Left = 369
        Top = 6
        Width = 102
        Height = 13
        Caption = 'Grupo do Assunto'
      end
      object Label5: TLabel
        Left = 20
        Top = 48
        Width = 33
        Height = 13
        Caption = 'Plano'
      end
      object Label6: TLabel
        Left = 372
        Top = 144
        Width = 110
        Height = 13
        Caption = 'Benefício/Serviço*'
      end
      object Label7: TLabel
        Left = 373
        Top = 182
        Width = 300
        Height = 39
        Caption = 
          '* Preenchido apenas para assuntos relacionados a benefício ou se' +
          'rviço e que se pretenda gerar RUBS omitindo a tela de geração.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object Label8: TLabel
        Left = 20
        Top = 93
        Width = 162
        Height = 13
        Caption = 'Página do Auto-Atendimento'
      end
      object Label9: TLabel
        Left = 21
        Top = 182
        Width = 278
        Height = 26
        Caption = '* Preenchido apenas para assuntos referentes a Empréstimo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
      object Label10: TLabel
        Left = 20
        Top = 144
        Width = 132
        Height = 13
        Caption = 'Evento de Empréstimo*'
      end
      object CmbGrupoAssunto: TwwDBLookupCombo
        Left = 369
        Top = 21
        Width = 329
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCGRUPOASSUNTO'#9'60'#9'Descrição')
        DataField = 'IDGRUPOASSUNTO'
        DataSource = ds
        LookupTable = QryGrupoAssunto
        LookupField = 'IDGRUPOASSUNTO'
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object ednome: TwwDBEdit
        Left = 20
        Top = 21
        Width = 328
        Height = 21
        DataField = 'NOME'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object CmbRub: TwwDBLookupCombo
        Left = 478
        Top = 63
        Width = 220
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRUB'#9'60'#9'Descrição')
        DataField = 'IDCONFIGRUBS'
        DataSource = ds
        LookupTable = QryRubs
        LookupField = 'IDCONFIGRUBS'
        TabOrder = 4
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object cmbprocesso: TwwDBLookupCombo
        Left = 248
        Top = 63
        Width = 220
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'Descrição')
        DataField = 'IDTIPOPROCESSO'
        DataSource = ds
        LookupTable = qryprocesso
        LookupField = 'IDTIPOPROCESSO'
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object CmbPlano: TwwDBLookupCombo
        Left = 20
        Top = 63
        Width = 220
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'50'#9'Nome')
        DataField = 'IDPLANOPREV'
        DataSource = ds
        LookupTable = qryPlano
        LookupField = 'IDPLANOPREV'
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object dblkBeneficio: TwwDBLookupCombo
        Left = 372
        Top = 158
        Width = 325
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'NOME'#9'F')
        DataField = 'IDSERVBENEF'
        DataSource = ds
        LookupTable = QryBeneficio
        LookupField = 'IDSERVICOS'
        TabOrder = 5
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
      end
      object wwDBLookupCombo1: TwwDBLookupCombo
        Left = 20
        Top = 108
        Width = 677
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCPAGINA'#9'100'#9'DESCPAGINA'#9'F')
        DataField = 'IDPAGINA'
        DataSource = ds
        LookupTable = QryWebPagina
        LookupField = 'IDPAGINA'
        TabOrder = 6
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
      object dbcboEventoEmprestimo: TwwDBComboBox
        Left = 22
        Top = 158
        Width = 339
        Height = 21
        ShowButton = True
        Style = csDropDown
        MapList = True
        AllowClearKey = False
        DataField = 'FLGCHAMAEMPRESTIM'
        DataSource = ds
        DropDownCount = 8
        ItemHeight = 0
        Items.Strings = (
          'Inscrição/Contratação'#9'0'
          'Consulta de Contrato'#9'1'
          'Quitação'#9'2'
          'Cancelamento de Quitação'#9'3'
          'Amortização'#9'4'
          'Cancelamento de Amortização'#9'5'
          'Tratamento Individual de Parcelas'#9'6'
          'Assinatura de Contrato Padrão'#9'7'
          'Lançamento e Histórico de Suspensão de Cobrança'#9'8')
        Sorted = False
        TabOrder = 7
        UnboundDataType = wwDefault
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 230
      Width = 713
      Height = 189
      Align = alBottom
      Tabs.Strings = (
        'Respostas Padrão')
      inherited pgctrlDetalhe: TPageControl
        Width = 615
        Height = 130
        inherited tbsDet: TTabSheet
          Caption = 'Respostas Padrão'
          inherited dbgrdDet: TwwDBGrid
            Width = 607
            Height = 102
            Selected.Strings = (
              'DESCRESPATEN'#9'72'#9'Resposta')
          end
          inherited pnlControlesDet: TPanel
            Width = 607
            Height = 102
            object Label2: TLabel
              Left = 12
              Top = 6
              Width = 58
              Height = 13
              Caption = 'Descrição'
            end
            object ReResposta: TwwDBRichEdit
              Left = 12
              Top = 24
              Width = 559
              Height = 78
              ScrollBars = ssVertical
              AutoURLDetect = False
              Color = clWhite
              DataField = 'DESCRESPATEN'
              DataSource = dsDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              HideScrollBars = False
              ParentFont = False
              PrintJobName = 'Delphi 5'
              ReadOnly = True
              TabOrder = 1
              EditorOptions = [reoShowPageSetup, reoShowFormatBar, reoShowToolBar, reoShowStatusBar, reoShowHints, reoCloseOnEscape]
              EditorCaption = 'Resposta Padrâo'
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
                AE0000007B5C727466315C616E73695C616E7369637067313235325C64656666
                305C6465666C616E67313033337B5C666F6E7474626C7B5C66305C6673776973
                73204D532053616E732053657269663B7D7D0D0A7B5C636F6C6F7274626C203B
                5C726564305C677265656E305C626C7565303B7D0D0A5C766965776B696E6434
                5C7563315C706172645C6366315C625C66305C66733134205265526573706F73
                74615C7061720D0A5C7061720D0A7D0D0A00}
            end
            object ReRespostaGrid: TwwDBRichEdit
              Left = 12
              Top = 41
              Width = 559
              Height = 44
              ScrollBars = ssBoth
              AutoURLDetect = False
              Color = clGray
              DataField = 'DESCRESPATEN'
              DataSource = dsDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWhite
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              PrintJobName = 'Delphi 5'
              ReadOnly = True
              TabOrder = 2
              WordWrap = False
              PopupOptions = [rpoPopupCut, rpoPopupCopy, rpoPopupPaste, rpoPopupFind, rpoPopupReplace]
              EditorOptions = [reoShowPageSetup, reoShowFormatBar, reoShowToolBar, reoShowStatusBar, reoShowHints, reoCloseOnEscape]
              EditorCaption = 'Resposta Padrâo'
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
                B80000007B5C727466315C616E73695C616E7369637067313235325C64656666
                305C6465666C616E67313033337B5C666F6E7474626C7B5C66305C6673776973
                73204D532053616E732053657269663B7D7D0D0A7B5C636F6C6F7274626C203B
                5C7265643235355C677265656E3235355C626C75653235353B7D0D0A5C766965
                776B696E64345C7563315C706172645C6366315C625C66305C66733134205265
                526573706F737461477269645C7061720D0A5C7061720D0A7D0D0A00}
            end
            object BtnSelResposta: TBitBtn
              Left = 576
              Top = 24
              Width = 26
              Height = 28
              Hint = 'Consulta Respostas'
              ParentShowHint = False
              ShowHint = True
              TabOrder = 0
              OnClick = BtnSelRespostaClick
              Glyph.Data = {
                F6000000424DF600000000000000760000002800000010000000100000000100
                0400000000008000000000000000000000001000000010000000000000000000
                8000008000000080800080000000800080008080000080808000C0C0C0000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
                88888000000000008888878888888880888887FFFFFFFF80008887F666666F80
                110887FFFFFFFF01911087F666666F09191087FFFFFFFF80911087F66FFFFF80
                990887FFFF00FF09910887F6F0110099108887FF09999991088887FF09999910
                8888877770999008888888888800088888888888888888888888}
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 705
      end
      inherited Dock974: TDock97
        Left = 619
        Height = 130
      end
    end
  end
  inherited Dock972: TDock97
    Width = 715
    AllowDrag = True
  end
  inherited Dock971: TDock97
    Top = 467
    Width = 715
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 50
    TargetsData = (
      1
      2
      (
        'TwwDBRichEdit'
        'Text'
        0)
      (
        'TMemo'
        'Text'
        0))
  end
  inherited dsDet: TwwDataSource
    DataSet = QryDet
    Left = 468
    Top = 2
  end
  inherited ds: TwwDataSource
    Left = 268
    Top = 2
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update ASSUNTO'
      'set'
      '  IDASSUNTO = :IDASSUNTO,'
      '  IDTIPOPROCESSO = :IDTIPOPROCESSO,'
      '  IDGRUPOASSUNTO = :IDGRUPOASSUNTO,'
      '  IDCONFIGRUBS = :IDCONFIGRUBS,'
      '  NOME = :NOME,'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  FLGCHAMAEMPRESTIM = :FLGCHAMAEMPRESTIM,'
      '  IDSERVBENEF = :IDSERVBENEF, '
      '  IDPAGINA = :IDPAGINA '
      'where'
      '  IDASSUNTO = :OLD_IDASSUNTO')
    InsertSQL.Strings = (
      'insert into ASSUNTO'
      
        '  (IDASSUNTO, IDTIPOPROCESSO, IDGRUPOASSUNTO, IDCONFIGRUBS, NOME' +
        ', '
      'IDPLANOPREV, '
      '   FLGCHAMAEMPRESTIM, IDSERVBENEF, IDPAGINA)'
      'values'
      '  (:IDASSUNTO, :IDTIPOPROCESSO, :IDGRUPOASSUNTO, :IDCONFIGRUBS, '
      ':NOME, '
      '   :IDPLANOPREV, :FLGCHAMAEMPRESTIM, :IDSERVBENEF, :IDPAGINA)')
    DeleteSQL.Strings = (
      'delete from ASSUNTO'
      'where'
      '  IDASSUNTO = :OLD_IDASSUNTO')
    Left = 306
    Top = 2
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'ASSUNTO.NOME'
      'GRUPOASSUNTO.DESCGRUPOASSUNTO'
      'PLANPREV.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Descrição'
      'Grupo de Assunto'
      'Plano')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'ASSUNTO'
      'GRUPOASSUNTO'
      'PLANPREV')
    CamposChave.Strings = (
      'ASSUNTO.IDASSUNTO')
    Filtro.Strings = (
      'ASSUNTO.IDGRUPOASSUNTO(+)=GRUPOASSUNTO.IDGRUPOASSUNTO'
      'ASSUNTO.IDPLANOPREV = PLANPREV.IDPLANOPREV(+)')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '40'
      '30'
      '40')
    Left = 553
    Top = 2
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 358
  end
  inherited qry: TwwQuery
    Tag = 5
    SQL.Strings = (
      'SELECT'
      '  IDASSUNTO, IDTIPOPROCESSO, '
      '  IDGRUPOASSUNTO, IDCONFIGRUBS, '
      '  NOME, IDPLANOPREV, '
      '  FLGCHAMAEMPRESTIM,'
      '  IDSERVBENEF, '
      '  IDPAGINA'
      'FROM '
      '  ASSUNTO'
      'WHERE'
      '  IDASSUNTO = :IDASSUNTO'
      'ORDER BY  '
      '  NOME'
      '')
    Left = 345
    Top = 2
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDASSUNTO'
        ParamType = ptUnknown
      end>
    object qryIDASSUNTO: TFloatField
      FieldName = 'IDASSUNTO'
    end
    object qryIDTIPOPROCESSO: TFloatField
      FieldName = 'IDTIPOPROCESSO'
    end
    object qryIDGRUPOASSUNTO: TFloatField
      FieldName = 'IDGRUPOASSUNTO'
    end
    object qryIDCONFIGRUBS: TFloatField
      FieldName = 'IDCONFIGRUBS'
    end
    object qryNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryFLGCHAMAEMPRESTIM: TFloatField
      FieldName = 'FLGCHAMAEMPRESTIM'
    end
    object qryIDSERVBENEF: TFloatField
      FieldName = 'IDSERVBENEF'
      Origin = 'BASEDADOS.ASSUNTO.IDSERVBENEF'
    end
    object qryIDPAGINA: TFloatField
      FieldName = 'IDPAGINA'
      Origin = 'BASEDADOS.ASSUNTO.IDPAGINA'
    end
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 544
    Top = 100
  end
  object qryprocesso: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDTIPOPROCESSO,'
      '  NOME'
      'FROM'
      '  RADTIPOPROCESSO'
      'ORDER BY'
      '  NOME')
    ValidateWithMask = True
    Left = 431
    Top = 58
    object qryprocessoNOME: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'NOME'
      Origin = 'RADTIPOPROCESSO.NOME'
      Size = 60
    end
    object qryprocessoIDTIPOPROCESSO: TFloatField
      FieldName = 'IDTIPOPROCESSO'
      Origin = 'RADTIPOPROCESSO.IDTIPOPROCESSO'
      Visible = False
    end
  end
  object QryDet: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  A.IDASSUNTOXRESP,'
      '  A.IDRESPATEND,'
      '  A.IDASSUNTO,'
      '  R.DESCRESPATEN'
      'FROM'
      '  ASSUNTOXRESP A, RESPATEND R'
      'WHERE'
      '  (A.IDASSUNTO = :IDASSUNTO) AND'
      '  (A.IDRESPATEND = R.IDRESPATEND)'
      '')
    UpdateObject = updDet
    ControlType.Strings = (
      'DESCRESPATEN;RichEdit;ReRespostaGrid')
    ValidateWithMask = True
    Left = 422
    Top = 2
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDASSUNTO'
        ParamType = ptUnknown
      end>
    object QryDetDESCRESPATEN: TMemoField
      DisplayLabel = 'Resposta'
      DisplayWidth = 72
      FieldName = 'DESCRESPATEN'
      Origin = 'ASSUNTOXRESP.IDASSUNTOXRESP'
      BlobType = ftMemo
      Size = 2000
    end
    object QryDetIDASSUNTOXRESP: TFloatField
      Tag = 1
      DisplayWidth = 10
      FieldName = 'IDASSUNTOXRESP'
      Origin = 'ASSUNTOXRESP.IDASSUNTOXRESP'
      Visible = False
    end
    object QryDetIDASSUNTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDASSUNTO'
      Origin = 'ASSUNTOXRESP.IDASSUNTO'
      Visible = False
    end
    object QryDetIDRESPATEND: TFloatField
      Tag = 2
      DisplayWidth = 10
      FieldName = 'IDRESPATEND'
      Origin = 'ASSUNTOXRESP.IDRESPATEND'
      Visible = False
    end
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update ASSUNTOXRESP'
      'set'
      '  IDASSUNTOXRESP = :IDASSUNTOXRESP,'
      '  IDRESPATEND = :IDRESPATEND,'
      '  IDASSUNTO = :IDASSUNTO'
      'where'
      '  IDASSUNTOXRESP = :OLD_IDASSUNTOXRESP')
    InsertSQL.Strings = (
      'insert into ASSUNTOXRESP'
      '  (IDASSUNTOXRESP, IDRESPATEND, IDASSUNTO)'
      'values'
      '  (:IDASSUNTOXRESP, :IDRESPATEND, :IDASSUNTO)')
    DeleteSQL.Strings = (
      'delete from ASSUNTOXRESP'
      'where'
      '  IDASSUNTOXRESP = :OLD_IDASSUNTOXRESP')
    Left = 499
    Top = 2
  end
  object MsResposta: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Resposta Padrão'
    Colunas.Strings = (
      'SUBSTR(RESPATEND.DESCRESPATEN,1,200) AS DESCRESPATEN')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      '')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'RESPATEND')
    CamposChave.Strings = (
      'RESPATEND.DESCRESPATEN'
      'RESPATEND.IDRESPATEND')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 560
    Top = 50
  end
  object QryRubs: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  IDCONFIGRUBS, DESCRUB'
      'FROM '
      '  CONFIGRUBS'
      'WHERE'
      '  (FLGTIPOARQUIVO = '#39'R'#39') OR (FLGTIPOARQUIVO IS NULL)'
      'ORDER BY'
      '  DESCRUB')
    ValidateWithMask = True
    Left = 614
    Top = 2
    object QryRubsDESCRUB: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'DESCRUB'
      Origin = 'CONFIGRUBS.DESCRUB'
      Size = 60
    end
    object QryRubsIDCONFIGRUBS: TFloatField
      FieldName = 'IDCONFIGRUBS'
      Origin = 'CONFIGRUBS.IDCONFIGRUBS'
      Visible = False
    end
  end
  object QryGrupoAssunto: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  IDGRUPOASSUNTO, DESCGRUPOASSUNTO '
      'FROM '
      '  GRUPOASSUNTO '
      'ORDER BY '
      '  DESCGRUPOASSUNTO')
    ValidateWithMask = True
    Left = 517
    Top = 60
    object QryGrupoAssuntoDESCGRUPOASSUNTO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 60
      FieldName = 'DESCGRUPOASSUNTO'
      Origin = 'GRUPOASSUNTO.DESCGRUPOASSUNTO'
      Size = 60
    end
    object QryGrupoAssuntoIDGRUPOASSUNTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDGRUPOASSUNTO'
      Origin = 'GRUPOASSUNTO.IDGRUPOASSUNTO'
      Visible = False
    end
  end
  object qryPlano: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPLANOPREV, NOME'
      'FROM PLANPREV'
      'ORDER BY NOME'
      '')
    ValidateWithMask = True
    Left = 664
    object qryPlanoNOME: TStringField
      DisplayLabel = 'Nome'
      DisplayWidth = 50
      FieldName = 'NOME'
      Origin = 'PLANPREV.NOME'
      Size = 50
    end
    object qryPlanoIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'PLANPREV.IDPLANOPREV'
      Visible = False
    end
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
    Left = 589
    Top = 123
    object QryBeneficioIDSERVICOS: TFloatField
      FieldName = 'IDSERVICOS'
    end
    object QryBeneficioNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
  end
  object DSBeneficio: TwwDataSource
    DataSet = QryBeneficio
    Left = 493
    Top = 115
  end
  object QryWebPagina: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select idpagina, descpagina from webpagina'
      'order by descpagina')
    ValidateWithMask = True
    Left = 81
    Top = 48
    object QryWebPaginaDESCPAGINA: TStringField
      DisplayWidth = 100
      FieldName = 'DESCPAGINA'
      Origin = 'BASEDADOS.WEBPAGINA.DESCPAGINA'
      Size = 100
    end
    object QryWebPaginaIDPAGINA: TFloatField
      FieldName = 'IDPAGINA'
      Origin = 'BASEDADOS.WEBPAGINA.IDPAGINA'
      Visible = False
    end
  end
  object DSWebPagina: TwwDataSource
    DataSet = QryWebPagina
    Left = 129
    Top = 48
  end
end
