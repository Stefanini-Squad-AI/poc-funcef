inherited frmConsEventosPrev: TfrmConsEventosPrev
  Left = 24
  Top = 80
  HelpContext = 160184
  Caption = 'Consulta de Eventos'
  ClientHeight = 447
  ClientWidth = 785
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 785
    Height = 408
    object lblValores: TLabel
      Left = 13
      Top = 5
      Width = 222
      Height = 24
      AutoSize = False
      Caption = 'Dados do Participante'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -19
      Font.Name = 'Bookman Old Style'
      Font.Style = [fsItalic]
      ParentFont = False
    end
    object GroupBox1: TGroupBox
      Left = 12
      Top = 102
      Width = 761
      Height = 139
      Caption = 'Histórico de Eventos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -19
      Font.Name = 'Bookman Old Style'
      Font.Style = [fsItalic]
      ParentFont = False
      TabOrder = 0
      object dbgEventosPrev: TwwDBGrid
        Left = 10
        Top = 27
        Width = 741
        Height = 104
        Selected.Strings = (
          'NOME'#9'40'#9'Evento Gerador'
          'DATAEVENTO'#9'10'#9'Evento'
          'DATAREGISTRO'#9'10'#9'Registro'
          'DATAEFETIVADO'#9'10'#9'Efetivação'
          'DATAVOLTA'#9'10'#9'Encerramento'
          'INSCRICAONUMERO'#9'10'#9'Nº Inscrição ~na Data Evento'
          'SITPARTNOVO'#9'30'#9'Nova Situação~na Fundação'
          'SITFUNCNOVO'#9'30'#9'Nova Situação~na Patrocinadora'
          'SITPLANONOVO'#9'30'#9'Nova Situação~no Plano'
          'SITPARTATUAL'#9'30'#9'Situação Fundação ~Antes do Evento'
          'SITFUNCATUAL'#9'30'#9'Situação Patrocinadora ~Antes do Evento'
          'SITPLANOATUAL'#9'30'#9'Situação Plano ~Antes do Evento')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 1
        ShowHorzScrollBar = True
        EditControlOptions = [ecoSearchOwnerForm, ecoDisableCustomControls, ecoDisableDateTimePicker]
        DataSource = dsEventosPrev
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        KeyOptions = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        ParentFont = False
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 2
        TitleButtons = False
        IndicatorColor = icBlack
      end
    end
    object Panel2: TPanel
      Left = 12
      Top = 33
      Width = 651
      Height = 70
      Enabled = False
      TabOrder = 1
      object Label2: TLabel
        Left = 7
        Top = 12
        Width = 69
        Height = 13
        Caption = 'Participante'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 7
        Top = 39
        Width = 80
        Height = 13
        Caption = 'Patrocinadora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 339
        Top = 13
        Width = 33
        Height = 13
        Caption = 'Plano'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 301
        Top = 42
        Width = 71
        Height = 13
        Caption = 'N° Inscrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 482
        Top = 42
        Width = 55
        Height = 13
        Caption = 'Matrícula'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edNome: TEdit
        Left = 81
        Top = 9
        Width = 240
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
      end
      object edPatro: TEdit
        Left = 91
        Top = 36
        Width = 200
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object edPlano: TEdit
        Left = 378
        Top = 12
        Width = 260
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object edInscNumero: TEdit
        Left = 377
        Top = 39
        Width = 96
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
      object edMatricula: TEdit
        Left = 542
        Top = 39
        Width = 97
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
      end
    end
    object Panel3: TPanel
      Left = 670
      Top = 33
      Width = 103
      Height = 70
      TabOrder = 2
      object bbtnProcurar: TBitBtn
        Left = 7
        Top = 18
        Width = 88
        Height = 37
        Hint = 'Procurar participante'
        Caption = '&Procurar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        OnClick = bbtnProcurarClick
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
    object GroupBox2: TGroupBox
      Left = 12
      Top = 242
      Width = 763
      Height = 155
      Caption = 'Histórico de Contribuições'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -19
      Font.Name = 'Bookman Old Style'
      Font.Style = [fsItalic]
      ParentFont = False
      TabOrder = 3
      object dbgHstContFechado: TwwDBGrid
        Left = 10
        Top = 27
        Width = 559
        Height = 122
        Selected.Strings = (
          'CONTRIBUICAOF'#9'85'#9'Contribuição')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        DataSource = dsHstContF
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        ParentFont = False
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 2
        TitleButtons = False
        OnCalcCellColors = dbgHstContFechadoCalcCellColors
        IndicatorColor = icBlack
      end
      object Panel5: TPanel
        Left = 584
        Top = 42
        Width = 165
        Height = 89
        BevelOuter = bvLowered
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        object Shape1: TShape
          Left = 7
          Top = 17
          Width = 16
          Height = 12
          Brush.Color = clMaroon
        end
        object Shape4: TShape
          Left = 7
          Top = 50
          Width = 16
          Height = 12
          Brush.Color = clTeal
        end
        object Label11: TLabel
          Left = 35
          Top = 50
          Width = 101
          Height = 26
          Caption = 'Novas Contribuições Associadas'
          WordWrap = True
        end
        object Label5: TLabel
          Left = 33
          Top = 14
          Width = 122
          Height = 26
          Caption = 'Contribuições Suspensas de Cobrança'
          WordWrap = True
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 408
    Width = 785
    inherited tb97Fundo: TToolbar97
      Left = 613
      DockPos = 616
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 444
      DockPos = 447
      Visible = False
    end
  end
  object dsEventosPrev: TwwDataSource
    AutoEdit = False
    DataSet = qryEventosPrev
    Left = 62
    Top = 184
  end
  object qryEventosPrev: TwwQuery
    AfterScroll = qryEventosPrevAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT EP.IDEVENTOSPREV, EG.NOME, EP.DATAEVENTO, EP.DATAREGISTRO' +
        ', EP.DATAEFETIVADO,'
      '              EP.DATAVOLTA, SF1.DESCRICAO AS SITFUNCATUAL,'
      
        ' EP.INSCRICAONUMERO,              SPL1.DESCRICAO AS SITPLANOATUA' +
        'L, SP1.DESCRICAO AS SITPARTATUAL,'
      
        '              SF2.DESCRICAO AS SITFUNCNOVO, SPL2.DESCRICAO AS SI' +
        'TPLANONOVO,'
      '              SP2.DESCRICAO AS SITPARTNOVO'
      'FROM EVENTOSPREV EP, EVENTOGERADOR EG,'
      '           SITFUNC SF1, SITPLANOPREV SPL1, SITPART SP1,'
      '           SITFUNC SF2, SITPLANOPREV SPL2, SITPART SP2'
      'WHERE EP.IDPESSOA        =:pIdPessoa    AND'
      '               EP.IDPLANOPREV =:pIdPlanoPrev AND'
      '               EP.IDPESSJUR      =:pIdPessJur AND'
      '               EP.IDEVENTOGERADOR = EG.IDEVENTOGERADOR AND'
      '               EP.IDSITFUNCATUAL  = SF1.IDSITFUNC AND'
      '               EP.IDSITPLANOATUAL = SPL1.IDSITPLANOPREV AND'
      '               EP.IDSITPARTATUAL  = SP1.IDSITPART AND'
      '               EP.IDSITFUNCNOVO  = SF2.IDSITFUNC AND'
      '               EP.IDSITPLANONOVO = SPL2.IDSITPLANOPREV AND'
      '               EP.IDSITPARTNOVO  = SP2.IDSITPART'
      'ORDER BY EP.DATAEVENTO DESC, EP.IDEVENTOSPREV DESC, EG.NOME')
    ValidateWithMask = True
    Left = 148
    Top = 184
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIdPessoa'
        ParamType = ptUnknown
        Value = 78569
      end
      item
        DataType = ftInteger
        Name = 'pIdPlanoPrev'
        ParamType = ptUnknown
        Value = 12
      end
      item
        DataType = ftInteger
        Name = 'pIdPessJur'
        ParamType = ptUnknown
        Value = 1
      end>
    object qryEventosPrevNOME: TStringField
      DisplayLabel = 'Evento Gerador'
      DisplayWidth = 40
      FieldName = 'NOME'
      Origin = 'EVENTOGERADOR.NOME'
      Size = 60
    end
    object qryEventosPrevDATAEVENTO: TDateTimeField
      DisplayLabel = 'Evento'
      DisplayWidth = 10
      FieldName = 'DATAEVENTO'
      Origin = 'EVENTOSPREV.DATAEVENTO'
    end
    object qryEventosPrevDATAREGISTRO: TDateTimeField
      DisplayLabel = 'Registro'
      DisplayWidth = 10
      FieldName = 'DATAREGISTRO'
      Origin = 'EVENTOSPREV.DATAREGISTRO'
    end
    object qryEventosPrevDATAEFETIVADO: TDateTimeField
      DisplayLabel = 'Efetivação'
      DisplayWidth = 10
      FieldName = 'DATAEFETIVADO'
      Origin = 'EVENTOSPREV.DATAEFETIVADO'
    end
    object qryEventosPrevDATAVOLTA: TDateTimeField
      DisplayLabel = 'Encerramento'
      DisplayWidth = 10
      FieldName = 'DATAVOLTA'
      Origin = 'EVENTOSPREV.DATAVOLTA'
    end
    object qryEventosPrevINSCRICAONUMERO: TFloatField
      DisplayLabel = 'Nº Inscrição ~na Data Evento'
      DisplayWidth = 10
      FieldName = 'INSCRICAONUMERO'
      Origin = 'BASEDADOS.EVENTOSPREV.INSCRICAONUMERO'
    end
    object qryEventosPrevSITPARTNOVO: TStringField
      DisplayLabel = 'Nova Situação~na Fundação'
      DisplayWidth = 30
      FieldName = 'SITPARTNOVO'
      Origin = 'SITPART.DESCRICAO'
      Size = 50
    end
    object qryEventosPrevSITFUNCNOVO: TStringField
      DisplayLabel = 'Nova Situação~na Patrocinadora'
      DisplayWidth = 30
      FieldName = 'SITFUNCNOVO'
      Origin = 'SITFUNC.DESCRICAO'
      Size = 60
    end
    object qryEventosPrevSITPLANONOVO: TStringField
      DisplayLabel = 'Nova Situação~no Plano'
      DisplayWidth = 30
      FieldName = 'SITPLANONOVO'
      Origin = 'SITPLANOPREV.DESCRICAO'
      Size = 50
    end
    object qryEventosPrevSITPARTATUAL: TStringField
      DisplayLabel = 'Situação Fundação ~Antes do Evento'
      DisplayWidth = 30
      FieldName = 'SITPARTATUAL'
      Origin = 'SITPART.DESCRICAO'
      Size = 50
    end
    object qryEventosPrevSITFUNCATUAL: TStringField
      DisplayLabel = 'Situação Patrocinadora ~Antes do Evento'
      DisplayWidth = 30
      FieldName = 'SITFUNCATUAL'
      Origin = 'SITFUNC.DESCRICAO'
      Size = 60
    end
    object qryEventosPrevSITPLANOATUAL: TStringField
      DisplayLabel = 'Situação Plano ~Antes do Evento'
      DisplayWidth = 30
      FieldName = 'SITPLANOATUAL'
      Origin = 'SITPLANOPREV.DESCRICAO'
      Size = 50
    end
    object qryEventosPrevIDEVENTOSPREV: TFloatField
      FieldName = 'IDEVENTOSPREV'
      Origin = 'EVENTOSPREV.IDEVENTOSPREV'
      Visible = False
    end
  end
  object MontaSelectPart: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'ELEGPATRO.MATRICULA'
      'PESSOA.NOME'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PLANPREV.NOME'
      'PATRO.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Participante'
      'N° de Inscrição'
      'Plano Previdenciário'
      'Patrocinadora')
    SensivelACaixa.Strings = (
      'S'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'ELEGPATRO'
      'PARTPREVPLAN'
      'PESSOA PATRO'
      'PLANPREV'
      'SITFUNC'
      'SITPART'
      'SITPLANOPREV'
      'PESSOAFISICA')
    CamposChave.Strings = (
      'ELEGPATRO.IDPESSOA'
      'ELEGPATRO.IDPESSJUR'
      'PLANPREV.IDPLANOPREV'
      'PESSOA.NOME'
      'ELEGPATRO.MATRICULA'
      'PATRO.NOME AS PATRO'
      'PLANPREV.NOME AS PLANO'
      'SITFUNC.DESCRICAO'
      'SITPART.DESCRICAO'
      'SITPLANOPREV.DESCRICAO'
      'PESSOA.NUMDOCUMENTO'
      'PESSOAFISICA.DATANASC'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PARTPREVPLAN.INSCRICAODATA'
      'ELEGPATRO.DATAINICIOAFAST'
      'ELEGPATRO.DATAFIMAFAST'
      'SITFUNC.IDSITFUNC'
      'SITPART.IDSITPART'
      'SITPLANOPREV.IDSITPLANOPREV')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = ELEGPATRO.IDPESSOA'
      'ELEGPATRO.IDPESSOA = PARTPREVPLAN.IDPESSOA'
      'ELEGPATRO.IDPESSJUR = PARTPREVPLAN.IDPESSJUR'
      'PARTPREVPLAN.IDPLANOPREV = PLANPREV.IDPLANOPREV'
      'PATRO.IDPESSOA = ELEGPATRO.IDPESSJUR'
      'ELEGPATRO.IDSITFUNC = SITFUNC.IDSITFUNC(+)'
      'PARTPREVPLAN.IDSITPART = SITPART.IDSITPART'
      'PARTPREVPLAN.IDSITPLANOPREV = SITPLANOPREV.IDSITPLANOPREV'
      'PESSOA.IDPESSOA = PESSOAFISICA.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '10'
      '10'
      '10'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 44
    Top = 398
  end
  object dsHstContF: TwwDataSource
    DataSet = qryHstContF
    Left = 46
    Top = 344
  end
  object qryHstContF: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT HST.FLGASSOCIADA, C.NOME AS CONTRIBUICAOF'
      'FROM HSTCONTEVENTOSPR HST, CONTRIBUICAO C'
      'WHERE HST.IDEVENTOSPREV =:pIdEventosPrev AND'
      '               HST.IDCONTRIBUICAOF = C.IDCONTRIBUICAO'
      'ORDER BY HST.FLGASSOCIADA, HST.IDCONTRIBUICAOF'
      ''
      '')
    ValidateWithMask = True
    Left = 106
    Top = 344
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIdEventosPrev'
        ParamType = ptUnknown
      end>
    object qryHstContFCONTRIBUICAOF: TStringField
      DisplayLabel = 'Contribuição'
      DisplayWidth = 85
      FieldName = 'CONTRIBUICAOF'
      Origin = 'CONTRIBUICAO.NOME'
      Size = 60
    end
    object qryHstContFFLGASSOCIADA: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGASSOCIADA'
      Origin = 'HSTCONTEVENTOSPR.FLGASSOCIADA'
      Visible = False
    end
  end
end
