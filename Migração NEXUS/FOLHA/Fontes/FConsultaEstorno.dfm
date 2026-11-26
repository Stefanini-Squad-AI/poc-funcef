inherited frmConsultaEstorno: TfrmConsultaEstorno
  Left = 1
  Top = 1
  HelpContext = 180057
  BorderStyle = bsSingle
  Caption = 'Consulta a Estornos'
  ClientHeight = 567
  ClientWidth = 789
  Font.Charset = ANSI_CHARSET
  Font.Height = -12
  Font.Name = 'Arial'
  Font.Style = []
  PixelsPerInch = 96
  TextHeight = 15
  inherited pnlFundo: TPanel
    Width = 789
    Height = 528
    object pnlSelecaoEstorno: TPanel
      Left = 5
      Top = 5
      Width = 779
      Height = 164
      Align = alTop
      BevelInner = bvLowered
      TabOrder = 0
      object lblPatrocinadora: TLabel
        Left = 12
        Top = 11
        Width = 89
        Height = 13
        AutoSize = False
        Caption = 'Patrocinadora'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object lblTitular: TLabel
        Left = 12
        Top = 90
        Width = 121
        Height = 13
        AutoSize = False
        Caption = 'Nome do Titular'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object lblMatricula: TLabel
        Left = 509
        Top = 90
        Width = 73
        Height = 13
        AutoSize = False
        Caption = 'Matrícula'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object lblRecebedor: TLabel
        Left = 329
        Top = 50
        Width = 126
        Height = 13
        AutoSize = False
        Caption = 'Nome do Recebedor'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object lblInscricao: TLabel
        Left = 329
        Top = 90
        Width = 73
        Height = 13
        AutoSize = False
        Caption = 'Inscrição'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object lblVersao: TLabel
        Left = 329
        Top = 10
        Width = 73
        Height = 13
        AutoSize = False
        Caption = 'Versão'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object lblPlano: TLabel
        Left = 12
        Top = 51
        Width = 89
        Height = 13
        AutoSize = False
        Caption = 'Plano'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
      end
      object dbcmbPatrocinadora: TwwDBLookupCombo
        Left = 12
        Top = 26
        Width = 285
        Height = 21
        AutoSize = False
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'NOME')
        LookupTable = QryPatrocinadora
        LookupField = 'IDPESSOA'
        DropDownCount = 4
        DropDownWidth = 80
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
      object edtRecebedor: TEdit
        Left = 329
        Top = 65
        Width = 285
        Height = 23
        TabOrder = 3
        OnKeyPress = edtRecebedorKeyPress
      end
      object edtTitular: TEdit
        Left = 12
        Top = 105
        Width = 285
        Height = 23
        TabOrder = 4
        OnKeyPress = edtTitularKeyPress
      end
      object dbcmbVersao: TwwDBLookupCombo
        Left = 329
        Top = 25
        Width = 289
        Height = 21
        AutoSize = False
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'HISTORICO'#9'50'#9'HISTORICO'#9'F')
        LookupTable = qryVersao
        LookupField = 'IDHSTFOLHABENEF'
        DropDownCount = 4
        DropDownWidth = 80
        TabOrder = 1
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
      object btnConsulta: TBitBtn
        Left = 648
        Top = 133
        Width = 129
        Height = 25
        Caption = 'Consulta'
        TabOrder = 8
        OnClick = btnConsultaClick
        Kind = bkOK
      end
      object grpPeriodo: TGroupBox
        Left = 648
        Top = 8
        Width = 129
        Height = 119
        Caption = 'Período de Estorno'
        TabOrder = 7
        object lblDtInicial: TLabel
          Left = 14
          Top = 22
          Width = 96
          Height = 13
          AutoSize = False
          Caption = 'Data Inicial'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object lblDataFinal: TLabel
          Left = 15
          Top = 72
          Width = 96
          Height = 13
          AutoSize = False
          Caption = 'Data Final'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = []
          ParentFont = False
        end
        object edtDtInicio: TwwDBDateTimePicker
          Left = 14
          Top = 38
          Width = 102
          Height = 23
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          Epoch = 1950
          MaxDate = 73415
          MinDate = 2
          ShowButton = True
          TabOrder = 0
        end
        object edtDtFim: TwwDBDateTimePicker
          Left = 14
          Top = 87
          Width = 102
          Height = 23
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          Epoch = 1950
          MaxDate = 73415
          MinDate = 2
          ShowButton = True
          TabOrder = 1
        end
      end
      object edtInscricao: TEdit
        Left = 329
        Top = 105
        Width = 105
        Height = 23
        TabOrder = 5
        OnKeyPress = edtInscricaoKeyPress
      end
      object edtMatricula: TEdit
        Left = 509
        Top = 105
        Width = 105
        Height = 23
        TabOrder = 6
        OnKeyPress = edtMatriculaKeyPress
      end
      object dbcmbPlano: TwwDBLookupCombo
        Left = 12
        Top = 66
        Width = 285
        Height = 21
        AutoSize = False
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'NOME')
        LookupTable = qryPlano
        LookupField = 'IDPLANOPREV'
        DropDownCount = 4
        DropDownWidth = 80
        TabOrder = 2
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
    end
    object pnlResultado: TPanel
      Left = 5
      Top = 169
      Width = 779
      Height = 354
      Align = alClient
      BevelInner = bvLowered
      TabOrder = 1
      object pnlTituloResultado: TPanel
        Left = 2
        Top = 2
        Width = 775
        Height = 19
        Align = alTop
        Caption = 'Resultado da Pesquisa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object pnlEstorno: TPanel
        Left = 2
        Top = 21
        Width = 775
        Height = 172
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 1
        object pnlTituloEstorno: TPanel
          Left = 1
          Top = 1
          Width = 773
          Height = 16
          Align = alTop
          Alignment = taLeftJustify
          BevelOuter = bvNone
          Caption = 'Estornos'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object spbExpandeMotivo: TSpeedButton
            Left = 632
            Top = 1
            Width = 150
            Height = 15
            Caption = 'Expandir motivo selecionado'
            Enabled = False
            Font.Charset = ANSI_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'Arial'
            Font.Style = []
            ParentFont = False
            OnClick = spbExpandeMotivoClick
          end
        end
        object dbgrdEstorno: TDBGrid
          Left = 1
          Top = 17
          Width = 773
          Height = 154
          Align = alClient
          DataSource = dtsEstorno
          Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit]
          TabOrder = 1
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Arial'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'PATROCINADORA'
              Width = 167
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'HISTORICO'
              Width = 249
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'PLANO'
              Width = 226
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'TITULAR'
              Width = 220
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'INSCRICAONUMERO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MATRICULA'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RECEBEDOR'
              Width = 220
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'DATAESTORNO'
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'MOTIVO'
              Width = 600
              Visible = True
            end>
        end
      end
      object pnlRubrica: TPanel
        Left = 2
        Top = 193
        Width = 775
        Height = 159
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 2
        object pnlTituloRubrica: TPanel
          Left = 1
          Top = 1
          Width = 773
          Height = 16
          Align = alTop
          Alignment = taLeftJustify
          BevelOuter = bvNone
          Caption = 'Rubricas'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object dbgrdRubrica: TDBGrid
          Left = 1
          Top = 17
          Width = 773
          Height = 141
          Align = alClient
          DataSource = dtsRubrica
          Options = [dgTitles, dgIndicator, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgCancelOnExit]
          TabOrder = 1
          TitleFont.Charset = ANSI_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -12
          TitleFont.Name = 'Arial'
          TitleFont.Style = []
          Columns = <
            item
              Expanded = False
              FieldName = 'MES'
              Width = 57
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'CODIGO'
              Width = 59
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'RUBRICA'
              Width = 500
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'ESTADO'
              Width = 47
              Visible = True
            end
            item
              Expanded = False
              FieldName = 'VALOR'
              Width = 83
              Visible = True
            end>
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 528
    Width = 789
    inherited tb97Fundo: TToolbar97
      Left = 619
      DockPos = 696
      inherited sep3: TToolbarSep97
        Left = 160
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 80
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 452
      DockPos = 526
      inherited bbtnConfirmar: TBitBtn
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 19
    Top = 139
    TargetsData = (
      1
      2
      (
        'TRealEdit'
        'Text'
        0)
      (
        'TMemo'
        'Text'
        0))
  end
  object qryEstorno: TwwQuery
    AfterScroll = qryEstornoAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   ME.IDHSTFOLHABENEF,'
      '   ME.IDPESSJUR,'
      '   ME.IDPLANOPREV,'
      '   ME.IDTITULAR,'
      '   ME.IDRECEBEDOR,'
      '   ME.TIPOESTORNO,'
      '   ME.DATAESTORNO,'
      '   PJ.NOME as PATROCINADORA,'
      '   ME.MOTIVO,'
      '   PP.INSCRICAONUMERO,'
      '   E.MATRICULA,'
      '   PT.NOME as TITULAR,'
      '   PR.NOME as RECEBEDOR,'
      '   HF.HISTORICO,'
      '   PV.NOME as PLANO'
      'FROM'
      '   MOTIVOESTORNOFB ME,'
      '   PESSOA PJ,'
      '   PESSOA PT,'
      '   PESSOA PR,'
      '   PARTPREVPLAN PP,'
      '   ELEGPATRO E,'
      '   HSTFOLHABENEF HF,'
      '   PLANPREV PV'
      'WHERE'
      '   ( ME.IDPESSJUR = PJ.IDPESSOA ) AND'
      '   ( ME.IDTITULAR = PP.IDPESSOA ) AND'
      '   ( ME.IDPLANOPREV = PP.IDPLANOPREV ) AND'
      '   ( ME.IDPESSJUR = PP.IDPESSJUR ) AND'
      '   ( ME.IDTITULAR = E.IDPESSOA ) AND'
      '   ( ME.IDPESSJUR = E.IDPESSJUR ) AND'
      '   ( ME.IDTITULAR = PT.IDPESSOA ) AND'
      '   ( ME.IDRECEBEDOR = PR.IDPESSOA ) AND'
      '   ( ME.IDHSTFOLHABENEF = HF.IDHSTFOLHABENEF ) AND'
      '   ( ME.IDPLANOPREV = PV.IDPLANOPREV )'
      ''
      ''
      ''
      '')
    ControlType.Strings = (
      'MOTIVO;RichEdit;')
    ValidateWithMask = True
    Left = 573
    Top = 309
  end
  object QryPatrocinadora: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select   PE.IDPESSOA, PE.NOME'
      'from     PESSOA PE, PATRO PA'
      'where    PE.IDPESSOA = PA.IDPESSOA'
      'order by PE.NOME')
    ValidateWithMask = True
    Left = 664
    Top = 264
    object QryPatrocinadoraIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.PESSOA.IDPESSOA'
    end
    object QryPatrocinadoraNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PESSOA.NOME'
      Size = 60
    end
  end
  object qryVersao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDHSTFOLHABENEF,'
      '  IDHSTFOLHABENEF||'#39' - '#39'||HISTORICO AS HISTORICO'
      'FROM'
      '  HSTFOLHABENEF'
      'ORDER BY'
      '  IDHSTFOLHABENEF DESC')
    ValidateWithMask = True
    Left = 696
    Top = 260
    object qryVersaoHISTORICO: TStringField
      DisplayWidth = 50
      FieldName = 'HISTORICO'
      Origin = 'BASEDADOS.HSTFOLHABENEF.HISTORICO'
      Size = 50
    end
    object qryVersaoIDHSTFOLHABENEF: TFloatField
      FieldName = 'IDHSTFOLHABENEF'
      Origin = 'BASEDADOS.HSTFOLHABENEF.IDHSTFOLHABENEF'
    end
  end
  object dtsEstorno: TwwDataSource
    DataSet = qryEstorno
    Left = 687
    Top = 350
  end
  object qryPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'select   IDPLANOPREV,'
      '         NOME'
      'from     PLANPREV')
    ValidateWithMask = True
    Left = 728
    Top = 256
    object qryPlanoIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.PLANPREV.IDPLANOPREV'
    end
    object qryPlanoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PLANPREV.NOME'
      Size = 50
    end
  end
  object qryRubrica: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dtsEstorno
    SQL.Strings = (
      'SELECT'
      '   H.MES,'
      '   DECODE( PD.FLGESPECIAL, 0, DECODE( PD.FLGDESCONTO, 0, '#39'P'#39', 1,' +
      ' '#39'D'#39', '#39'I'#39' ), '#39'I'#39' ) AS ESTADO,'
      '   PD.IDPROVENTO AS CODIGO,'
      '   PD.DESCRICAO  AS RUBRICA,'
      '   DECODE(H.VALORPROVENTO,0,H.VALORINFO,H.VALORPROVENTO) AS VALOR'
      'FROM'
      '   HISTRUBSAL H,'
      '   PROVDESC PD'
      'WHERE'
      '   ( H.IDRUBRICA       = PD.IDPROVENTO     ) AND'
      '   ( H.IDPATRO         = :IDPESSJUR        ) AND'
      '   ( H.IDHSTFOLHABENEF = :IDHSTFOLHABENEF  ) AND'
      '   ( H.IDTITULAR       = :IDTITULAR        ) AND'
      '   ( H.IDRESPONSAVEL   = :IDRECEBEDOR      ) AND'
      '   ( H.IDPLANOPREV     = :IDPLANOPREV      )'
      'ORDER BY'
      '   H.SEQRUBRICA')
    ValidateWithMask = True
    Left = 405
    Top = 277
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDHSTFOLHABENEF'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDRECEBEDOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object dtsRubrica: TwwDataSource
    DataSet = qryRubrica
    Left = 727
    Top = 342
  end
  object wwQuery1: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = dtsEstorno
    SQL.Strings = (
      'SELECT'
      '   H.MES,'
      '   DECODE( PD.FLGESPECIAL, 0, DECODE( PD.FLGDESCONTO, 0, '#39'P'#39', 1,' +
      ' '#39'D'#39', '#39'I'#39' ), '#39'I'#39' ) AS ESTADO,'
      '   PD.IDPROVENTO AS CODIGO,'
      '   PD.DESCRICAO  AS RUBRICA,'
      '   DECODE(H.VALORPROVENTO,0,H.VALORINFO,H.VALORPROVENTO) AS VALOR'
      'FROM'
      '   HISTRUBSAL H,'
      '   PROVDESC PD'
      'WHERE'
      '   ( H.IDRUBRICA       = PD.IDPROVENTO     ) AND'
      '   ( H.IDPATRO         = :IDPESSJUR        ) AND'
      '   ( H.IDHSTFOLHABENEF = :IDHSTFOLHABENEF  ) AND'
      '   ( H.IDTITULAR       = :IDTITULAR        ) AND'
      '   ( H.IDRESPONSAVEL   = :IDRECEBEDOR      ) AND'
      '   ( H.IDPLANOPREV     = :IDPLANOPREV      )'
      'ORDER BY'
      '   H.SEQRUBRICA')
    ValidateWithMask = True
    Left = 485
    Top = 277
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDHSTFOLHABENEF'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDTITULAR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDRECEBEDOR'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
    object StringField1: TStringField
      DisplayLabel = 'Mês Ref.'
      FieldName = 'MES'
      FixedChar = True
      Size = 7
    end
    object FloatField1: TFloatField
      DisplayLabel = 'Código'
      FieldName = 'CODIGO'
    end
    object StringField2: TStringField
      DisplayLabel = 'Descrição da Rubrica'
      FieldName = 'RUBRICA'
      Size = 130
    end
    object StringField3: TStringField
      DisplayLabel = 'P/D/I'
      FieldName = 'ESTADO'
      Size = 1
    end
    object FloatField2: TFloatField
      DisplayLabel = 'Valor'
      FieldName = 'VALOR'
    end
  end
end
