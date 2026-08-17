inherited frmSuspensaoConcessao: TfrmSuspensaoConcessao
  Left = 586
  Top = 179
  HelpContext = 150034
  Caption = 'Bloqueio de Concessão'
  ClientHeight = 799
  ClientWidth = 702
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 702
    Height = 729
    Align = alTop
    object Label3: TLabel
      Left = 13
      Top = 297
      Width = 73
      Height = 13
      Caption = 'Observação:'
    end
    object Label4: TLabel
      Left = 175
      Top = 27
      Width = 54
      Height = 13
      Caption = 'Mutuário:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label6: TLabel
      Left = 14
      Top = 26
      Width = 59
      Height = 26
      Caption = 'Matrícula:'#13#10
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label12: TLabel
      Left = 322
      Top = 64
      Width = 66
      Height = 13
      Caption = 'Modalidade'
    end
    object Label5: TLabel
      Left = 75
      Top = 182
      Width = 114
      Height = 13
      Caption = 'Motivo do Bloqueio:'
    end
    object Label7: TLabel
      Left = 14
      Top = 206
      Width = 177
      Height = 13
      Caption = 'Número de Contrato vinculado:'
    end
    object Bevel1: TBevel
      Left = 6
      Top = 11
      Width = 691
      Height = 517
      Style = bsRaised
    end
    object Label16: TLabel
      Left = 18
      Top = 4
      Width = 109
      Height = 13
      Caption = 'Bloqueio Individual'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
    end
    object lstMod: TCheckListBox
      Left = 320
      Top = 79
      Width = 370
      Height = 92
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      TabOrder = 9
    end
    object edtMotivo: TwwDBRichEdit
      Left = 13
      Top = 313
      Width = 679
      Height = 70
      AutoURLDetect = False
      DataField = 'SUCMOTIVOSUSP'
      DataSource = ds
      MaxLength = 500
      PrintJobName = 'Delphi 5'
      TabOrder = 0
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
        750000007B5C727466315C616E73695C616E7369637067313235325C64656666
        305C6465666C616E67313034367B5C666F6E7474626C7B5C66305C666E696C20
        4D532053616E732053657269663B7D7D0D0A5C766965776B696E64345C756331
        5C706172645C625C66305C667331345C7061720D0A7D0D0A00}
    end
    object GroupBox1: TGroupBox
      Left = 13
      Top = 72
      Width = 153
      Height = 100
      Caption = ' Período do Bloqueio'
      TabOrder = 1
      object Label1: TLabel
        Left = 12
        Top = 18
        Width = 66
        Height = 13
        Caption = 'Data Inicial'
      end
      object Label2: TLabel
        Left = 12
        Top = 58
        Width = 59
        Height = 13
        Caption = 'Data Final'
      end
      object edtDataInicio: TwwDBDateTimePicker
        Left = 12
        Top = 32
        Width = 105
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'SUCDATAINICIO'
        DataSource = ds
        Epoch = 1950
        ButtonWidth = 20
        ButtonGlyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          88888888888888888888800000000000000880FFFFFFFFFFFF0880F878787978
          7F0880F7878797978F0880F8787879787F0880F7878787878F0880F878787878
          7F0880F7878787878F0880FFFFFFFFFFFF0880F4C4C4C7777F0880FC4C4C4777
          7F0880FFFFFFFFFFFF0880000000000000088888888888888888}
        ShowButton = True
        TabOrder = 0
        UnboundDataType = wwDTEdtDate
        DisplayFormat = 'dd/mm/yyyy'
        OnChange = edtDataInicioChange
      end
      object edtDataFim: TwwDBDateTimePicker
        Left = 12
        Top = 72
        Width = 105
        Height = 21
        CalendarAttributes.Font.Charset = DEFAULT_CHARSET
        CalendarAttributes.Font.Color = clWindowText
        CalendarAttributes.Font.Height = -11
        CalendarAttributes.Font.Name = 'MS Sans Serif'
        CalendarAttributes.Font.Style = []
        ButtonStyle = cbsCustom
        DataField = 'SUCDATAFINAL'
        DataSource = ds
        Epoch = 1950
        ButtonWidth = 20
        ButtonGlyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          88888888888888888888800000000000000880FFFFFFFFFFFF0880F878787978
          7F0880F7878797978F0880F8787879787F0880F7878787878F0880F878787878
          7F0880F7878787878F0880FFFFFFFFFFFF0880F4C4C4C7777F0880FC4C4C4777
          7F0880FFFFFFFFFFFF0880000000000000088888888888888888}
        ShowButton = True
        TabOrder = 1
        UnboundDataType = wwDTEdtDate
        DisplayFormat = 'dd/mm/yyyy'
      end
    end
    object DBEdit1: TDBEdit
      Left = 232
      Top = 23
      Width = 456
      Height = 21
      Color = clBtnFace
      DataField = 'NOME'
      DataSource = ds
      ReadOnly = True
      TabOrder = 2
    end
    object DBEdit2: TDBEdit
      Left = 75
      Top = 23
      Width = 95
      Height = 21
      Color = clBtnFace
      DataField = 'MATRICULA'
      DataSource = ds
      ReadOnly = True
      TabOrder = 3
    end
    object GroupBox2: TGroupBox
      Left = 14
      Top = 226
      Width = 678
      Height = 69
      TabOrder = 5
      object Label11: TLabel
        Left = 14
        Top = 17
        Width = 75
        Height = 13
        Caption = 'Atendido em:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label13: TLabel
        Left = 5
        Top = 41
        Width = 84
        Height = 13
        Caption = 'Atualizado em:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 247
        Top = 17
        Width = 24
        Height = 13
        Caption = 'Por:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 247
        Top = 43
        Width = 24
        Height = 13
        Caption = 'Por:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object DBEdit6: TDBEdit
        Left = 90
        Top = 14
        Width = 154
        Height = 21
        Color = clInactiveBorder
        DataField = 'TRGDTINCLUSAO'
        DataSource = ds
        ReadOnly = True
        TabOrder = 0
      end
      object DBEdit7: TDBEdit
        Left = 276
        Top = 14
        Width = 393
        Height = 21
        Color = clInactiveBorder
        DataField = 'NOMEUSER'
        DataSource = ds
        ReadOnly = True
        TabOrder = 1
      end
      object DBEdit9: TDBEdit
        Left = 90
        Top = 39
        Width = 154
        Height = 21
        Color = clInactiveBorder
        DataField = 'SUCDTALTERACAO'
        DataSource = ds
        ReadOnly = True
        TabOrder = 2
      end
      object DBEdit10: TDBEdit
        Left = 276
        Top = 39
        Width = 393
        Height = 21
        Color = clInactiveBorder
        DataField = 'NOMEUSERALTER'
        DataSource = ds
        ReadOnly = True
        TabOrder = 3
      end
    end
    object rdgStatus: TDBRadioGroup
      Left = 185
      Top = 74
      Width = 117
      Height = 98
      Caption = ' Situação '
      DataField = 'FLGSTATUS'
      DataSource = ds
      Items.Strings = (
        'Ativo'
        'Encerrado'
        'Cancelado')
      TabOrder = 6
      Values.Strings = (
        'A'
        'E'
        'C')
    end
    object chkPrazoIndeterminado: TDBCheckBox
      Left = 13
      Top = 49
      Width = 241
      Height = 17
      Caption = 'Bloqueio com Prazo Indeterminado'
      DataField = 'FLGPRAZOINDETERMINADO'
      DataSource = ds
      TabOrder = 4
      ValueChecked = 'S'
      ValueUnchecked = 'N'
      OnClick = chkPrazoIndeterminadoClick
    end
    object btnInverteMov: TBitBtn
      Left = 646
      Top = 46
      Width = 21
      Height = 20
      Hint = 'Inverte a Seleção de Patrocinadoras'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 7
      OnClick = btnInverteMovClick
      Glyph.Data = {
        F6000000424DF600000000000000760000002800000010000000100000000100
        0400000000008000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888488888888888888844888888888888444448888888888444444488
        1888884444444888118884448844888881188448884888888118844888888188
        8118844888881188111888448881111111888884881111111888888888811111
        8888888888881188888888888888818888888888888888888888}
    end
    object btnMarcaTodosMov: TBitBtn
      Left = 667
      Top = 46
      Width = 21
      Height = 20
      Hint = 'Seleciona todas as Patrocinadoras'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 8
      OnClick = btnMarcaTodosMovClick
      Glyph.Data = {
        D6000000424DD60000000000000076000000280000000C0000000C0000000100
        0400000000006000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888848888888
        0000888224888888000088222248888800008822822488880000882848224888
        0000888224822488000088222248228800008822822482880000882888224888
        0000888888822488000088888888228800008888888882880000}
    end
    object cbxMotivo: TwwDBLookupCombo
      Left = 194
      Top = 179
      Width = 497
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'100'#9'DESCRICAO'#9'F')
      DataField = 'IDMOTIVOSUSPCONCESSAO'
      DataSource = ds
      LookupTable = qryMotivo
      LookupField = 'IDMOTIVOSUSPCONCESSAO'
      TabOrder = 10
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
    object cbxContratoVinculado: TwwDBLookupCombo
      Left = 194
      Top = 203
      Width = 497
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'119'#9'DESCRICAO'#9'F')
      DataField = 'IDCONTRATOEMPTMO'
      DataSource = ds
      LookupTable = qryContratoVinculado
      LookupField = 'IDCONTRATOEMPTMO'
      TabOrder = 11
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
    object GroupBox3: TGroupBox
      Left = 7
      Top = 532
      Width = 690
      Height = 194
      Caption = 'Importar Arquivo'
      Color = clBtnFace
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clTeal
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      TabOrder = 12
      object Label15: TLabel
        Left = 27
        Top = 63
        Width = 114
        Height = 13
        Caption = 'Motivo do Bloqueio:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtArqEventoCobranca: TEdit
        Left = 8
        Top = 83
        Width = 541
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
      end
      object btnProcurar: TBitBtn
        Left = 553
        Top = 82
        Width = 24
        Height = 22
        Hint = 'Procurar participante(s)'
        Anchors = [akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = btnProcurarClick
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
      object btnLimpaPart: TBitBtn
        Left = 579
        Top = 82
        Width = 24
        Height = 22
        Hint = 'Limpa a seleção de Participante'
        Anchors = [akTop, akRight]
        TabOrder = 3
        OnClick = btnLimpaPartClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          88888888888FF8888888888888008888888888888F77F8888888888800F08888
          8888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0888
          88887788888F788888887FFFFFCF888888887F88FF7888FF88887FFCCCF88008
          888878F777888778F88887FFFF880110888887F88F8878878F8887FFC8809991
          0888878F7887F88878F8887FF88099991088887F88878F88878F887FF8880999
          03088878F88878F878788887F8888090B03088878F888787878788887888880B
          0B038888788888787878888888888880B0B38888888888878788888888888888
          0BBB88888888888878F888888888888880BB8888888888888788}
        NumGlyphs = 2
      end
      object BtnImportar: TBitBtn
        Left = 606
        Top = 61
        Width = 75
        Height = 43
        Caption = 'Importar '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        OnClick = BtnImportarClick
      end
      object GroupBox4: TGroupBox
        Left = 147
        Top = 12
        Width = 396
        Height = 45
        Caption = ' Período do Bloqueio'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object Label10: TLabel
          Left = 26
          Top = 19
          Width = 66
          Height = 13
          Caption = 'Data Inicial'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label14: TLabel
          Left = 203
          Top = 19
          Width = 59
          Height = 13
          Caption = 'Data Final'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edtDataFinalArquivo: TDateTimePicker
          Left = 266
          Top = 16
          Width = 97
          Height = 21
          CalAlignment = dtaLeft
          Date = 43894.3882204514
          Time = 43894.3882204514
          DateFormat = dfShort
          DateMode = dmComboBox
          Kind = dtkDate
          ParseInput = False
          TabOrder = 1
        end
        object edtDataInicialArquivo: TDateTimePicker
          Left = 98
          Top = 16
          Width = 97
          Height = 21
          CalAlignment = dtaLeft
          Date = 43894.3882204514
          Time = 43894.3882204514
          DateFormat = dfShort
          DateMode = dmComboBox
          Kind = dtkDate
          ParseInput = False
          TabOrder = 0
        end
      end
      object CmbMotivoBloqueioArquivo: TDBLookupComboBox
        Left = 145
        Top = 60
        Width = 399
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        KeyField = 'IDMOTIVOSUSPCONCESSAO'
        ListField = 'DESCRICAO'
        ListSource = DscMotivoArquivo
        ParentFont = False
        TabOrder = 5
      end
      object memArquivo: TMemo
        Left = 8
        Top = 107
        Width = 673
        Height = 78
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'Arial'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 6
      end
    end
  end
  inherited Dock972: TDock97
    Width = 702
    inherited Toolbar971: TToolbar97
      inherited sbtnApagar: TToolbarButton97
        Enabled = False
        Visible = False
      end
      inherited btnRefresh: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 766
    Width = 702
    inherited tb97Fundo: TToolbar97
      inherited bbtnAjuda: TmaHelpBitBtn
        ClickHelpContext = 150025
      end
    end
  end
  object PageControl1: TPageControl [3]
    Left = 13
    Top = 420
    Width = 677
    Height = 137
    ActivePage = TabSheet1
    TabOrder = 3
    object TabSheet1: TTabSheet
      Caption = 'Histórico de Bloqueio'
      object dbGrd: TwwDBGrid
        Left = 0
        Top = 0
        Width = 669
        Height = 109
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        OnCellChanged = dbGrdCellChanged
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = ds
        KeyOptions = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgWordWrap]
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
        IndicatorColor = icBlack
      end
    end
    object TabSheet2: TTabSheet
      Caption = 'Histórico de Alterações'
      ImageIndex = 1
      object wwDBGrid1: TwwDBGrid
        Left = 0
        Top = 0
        Width = 669
        Height = 109
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dsAlt
        KeyOptions = []
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgWordWrap]
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
        IndicatorColor = icBlack
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      4
      (
        ''
        'Filter'
        0)
      (
        ''
        'DisplayLabel'
        0)
      (
        ''
        'Title'
        0)
      (
        'TMemo'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 376
    Top = 368
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update SUSPCONCESSAO'
      'set'
      '  IDPESSOA = :IDPESSOA,'
      '  SUCDATAINICIO = :SUCDATAINICIO,'
      '  SUCDATAFINAL = :SUCDATAFINAL,'
      '  SUCMOTIVOSUSP = :SUCMOTIVOSUSP,'
      '  FLGSTATUS = :FLGSTATUS,'
      '  SUCUSERALTERACAO = USER,'
      '  SUCDTALTERACAO = SYSDATE,'
      '  FLGPRAZOINDETERMINADO = :FLGPRAZOINDETERMINADO,'
      '  IDMOTIVOSUSPCONCESSAO = :IDMOTIVOSUSPCONCESSAO,'
      '  IDCONTRATOEMPTMO = :IDCONTRATOEMPTMO'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA'
      '  and SUCDATAINICIO  = :OLD_SUCDATAINICIO'
      '  and NVL(IDCONTRATOEMPTMO, 0)  = NVL(:OLD_IDCONTRATOEMPTMO, 0)'
      '  and NVL(IDSUCEMPTMO, 0) = NVL(:OLD_IDSUCEMPTMO, 0)'
      '  and ROWNUM = 1  ')
    InsertSQL.Strings = (
      'insert into SUSPCONCESSAO'
      
        '  (IDPESSOA, SUCDATAINICIO, SUCDATAFINAL, SUCMOTIVOSUSP, FLGSTAT' +
        'US, SUCUSERALTERACAO, SUCDTALTERACAO, FLGPRAZOINDETERMINADO, IDS' +
        'UCEMPTMO, IDMOTIVOSUSPCONCESSAO, IDCONTRATOEMPTMO)'
      'values'
      
        '  (:IDPESSOA, :SUCDATAINICIO, :SUCDATAFINAL, :SUCMOTIVOSUSP, :FL' +
        'GSTATUS, :SUCUSERALTERACAO, :SUCDTALTERACAO, :FLGPRAZOINDETERMIN' +
        'ADO, :IDSUCEMPTMO, :IDMOTIVOSUSPCONCESSAO, :IDCONTRATOEMPTMO)')
    DeleteSQL.Strings = (
      'delete from SUSPCONCESSAO'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 320
    Top = 368
  end
  inherited MontaSelect: TMontaSelect
    Caption = ''
    Colunas.Strings = (
      'DEP.MATRICULA'
      'PES.NOME'
      'SUC.SUCDATAINICIO'
      'SUC.SUCDATAFINAL'
      'SUC.SUCMOTIVOSUSP')
    TipodeDado.Strings = (
      'C'
      'C'
      'D'
      'D'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Nome Mutuário'
      'Início do Bloqueio'
      'Fim do Bloqueio'
      'Motivo')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA        PES'
      'DEPENTIT      DEP'
      'SUSPCONCESSAO SUC')
    CamposChave.Strings = (
      'SUC.IDPESSOA'
      'PES.NOME'
      'SUC.SUCDATAINICIO'
      'SUC.FLGSTATUS')
    Filtro.Strings = (
      'PES.IDPESSOA = SUC.IDPESSOA'
      'PES.IDPESSOA = DEP.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '15'
      '60'
      '18'
      '18'
      '200')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      '')
    Left = 440
    Top = 272
  end
  inherited CmeCadastro: TCmEventosCadastro
    RepetirInsert = False
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 500
    Top = 270
  end
  inherited qry: TwwQuery
    AfterOpen = qryAfterOpen
    AfterInsert = qryAfterInsert
    AfterScroll = qryAfterScroll
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT SUC.IDSUCEMPTMO,'
      '       SUC.IDPESSOA,'
      '       DEP.MATRICULA,'
      '       TO_DATE(SUC.TRGDTINCLUSAO, '#39'DD/MM/YY'#39') AS TRGDTINCLUSAO,'
      '       SUC.TRGUSERINCLUSAO,'
      '       DECODE(SUC.FLGSTATUS,'
      '              '#39'A'#39','
      '              '#39'Ativa'#39','
      '              '#39'C'#39','
      '              '#39'Cancelada'#39','
      '              '#39'E'#39','
      '              '#39'Encerrada'#39') AS STATUS,'
      '       SUC.FLGSTATUS,'
      '       PES.NOME,'
      
        '       '#39'                                                        ' +
        '             '#39' AS NOMEUSER,'
      
        '       '#39'                                                        ' +
        '             '#39' AS NOMEUSERALTER,'
      '       SUC.SUCDATAINICIO,'
      '       SUC.SUCDATAFINAL,'
      '       SUC.SUCMOTIVOSUSP,'
      '       SUC.SUCUSERALTERACAO,'
      
        '       TO_DATE(SUC.SUCDTALTERACAO, '#39'DD/MM/YY'#39') AS SUCDTALTERACAO' +
        ','
      
        '       nvl(SUC.FLGPRAZOINDETERMINADO, '#39'N'#39') AS FLGPRAZOINDETERMIN' +
        'ADO,     '
      
        '       DECODE((nvl(SUC.FLGPRAZOINDETERMINADO, '#39'N'#39')), '#39'N'#39','#39'Não'#39','#39 +
        'Sim'#39') AS FLGPRAZOC , '
      '       SUC.IDMOTIVOSUSPCONCESSAO,'
      '       SUC.IDCONTRATOEMPTMO'
      ''
      '  FROM SUSPCONCESSAO SUC, PESSOA PES, DEPENTIT DEP'
      ' WHERE SUC.IDPESSOA = :PIDPESSOA'
      '   AND SUC.IDPESSOA = PES.IDPESSOA'
      '   AND DEP.IDPESSOA = PES.IDPESSOA')
    Left = 424
    Top = 368
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object dsAlt: TwwDataSource
    DataSet = qryAlt
    Left = 376
    Top = 312
  end
  object qryAlt: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  LTP.DESCOPERACAO DESCOPERACAO,'
      '  PES.NOME,'
      '  TO_CHAR(LTP.DATA, '#39'DD/MM/YYYY'#39') AS DATA,'
      '  LTP.DATA AS DATAALT'
      ' FROM LOGTOTALPREV LTP'
      
        '/* INNER JOIN PESSOA PES ON  Marcio Sanches Spinosa  SOL 210109/' +
        '14973 KINTANA 2040336*/ '
      'LEFT JOIN PESSOA PES ON'
      '  PES.IDPESSOA = LTP.IDUSUARIO'
      'WHERE IDMODULO    = :IDMODULO'
      '  AND IDPESQUISA1 = :IDPESQUISA1'
      '  AND IDPESQUISA2 = :IDPESQUISA2'
      'ORDER BY DATAALT DESC')
    ValidateWithMask = True
    Left = 328
    Top = 312
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDMODULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESQUISA1'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'IDPESQUISA2'
        ParamType = ptUnknown
      end>
    object qryAltDESCOPERACAO: TMemoField
      FieldName = 'DESCOPERACAO'
      BlobType = ftMemo
      Size = 2000
    end
    object qryAltNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryAltDATAALT: TDateTimeField
      FieldName = 'DATAALT'
    end
  end
  object qryItens: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT 0 SELECAO,'
      '       '#39'                    '#39' MESREF,'
      '       '#39'                    '#39' MESCOBR,'
      '       '#39'                    '#39' ITEM,'
      '       '#39'                    '#39' MOVIMENTACAO,'
      '       0 VALOR,'
      '       '#39'                    '#39' OPERACAO,'
      '       '#39'                    '#39' FORMAAJUSTADA,'
      '       0 CONTRATO,'
      '       '#39'                    '#39' MATRICULA,'
      '       '#39'                    '#39' SITUACAO,'
      '       '#39'                    '#39' FORMAATUAL,'
      '       0 HMEVLRPREVISTO,'
      '       '#39'                    '#39' HMERECPAG,'
      '       0 ID,'
      '       0 TIPOCONTRATO'
      ' FROM DUAL')
    ControlType.Strings = (
      'SELECAO;CheckBox;1;0')
    ValidateWithMask = True
    Left = 616
    Top = 264
  end
  object qryMotivo: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      
        'SELECT MS.IDMOTIVOSUSPCONCESSAO, MS.DESCRICAO FROM MOTIVOSUSPCON' +
        'CESSAO MS ')
    ValidateWithMask = True
    Left = 488
    Top = 163
    object qryMotivoDESCRICAO: TStringField
      DisplayWidth = 100
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.MOTIVOSUSPCONCESSAO.DESCRICAO'
      Size = 100
    end
    object qryMotivoIDMOTIVOSUSPCONCESSAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDMOTIVOSUSPCONCESSAO'
      Origin = 'BASEDADOS.MOTIVOSUSPCONCESSAO.IDMOTIVOSUSPCONCESSAO'
      Visible = False
    end
  end
  object qryContratoVinculado: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT c.idcontratoemptmo,'
      
        '       d.matricula || '#39'/'#39' || to_char(c.idcontratoemptmo) || '#39' - ' +
        #39' ||'
      '       tc.tcedescricao AS DESCRICAO'
      '  FROM contratoemptmo c'
      '  JOIN tipocontremptmo tc'
      '    ON tc.idtipocontremptmo = c.idtipocontremptmo'
      '  JOIN depentit d'
      '    ON d.idpessoa = c.idbenef'
      '   AND d.idtitular = c.idpessoa'
      ' WHERE C.IDBENEF = :IDPESSOA')
    ValidateWithMask = True
    Left = 576
    Top = 163
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptInput
      end>
    object qryContratoVinculadoDESCRICAO: TStringField
      DisplayWidth = 119
      FieldName = 'DESCRICAO'
      Size = 119
    end
    object qryContratoVinculadoIDCONTRATOEMPTMO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONTRATOEMPTMO'
      Visible = False
    end
  end
  object dsMotivo: TwwDataSource
    DataSet = qryMotivo
    Left = 488
    Top = 115
  end
  object dsContratoVinculado: TwwDataSource
    DataSet = qryContratoVinculado
    Left = 568
    Top = 115
  end
  object qryPeriodoBloqueio: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT S.IDSUCEMPTMO '
      'FROM SUSPCONCESSAO S '
      'WHERE S.IDPESSOA = :IDPESSOA '
      'AND   S.FLGSTATUS <> '#39'C'#39' '
      'AND   TO_DATE(:DATAINICIO,'#39'DD/MM/YYYY'#39') BETWEEN S.SUCDATAINICIO '
      'AND NVL(S.SUCDATAFINAL,TO_DATE(:DATAINICIO,'#39'DD/MM/YYYY'#39'))')
    ValidateWithMask = True
    Left = 416
    Top = 131
    ParamData = <
      item
        DataType = ftUnknown
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATAINICIO'
        ParamType = ptUnknown
      end
      item
        DataType = ftUnknown
        Name = 'DATAINICIO'
        ParamType = ptUnknown
      end>
  end
  object qryMotivoArquivo: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      
        'SELECT MS.IDMOTIVOSUSPCONCESSAO, MS.DESCRICAO FROM MOTIVOSUSPCON' +
        'CESSAO MS ')
    ValidateWithMask = True
    Left = 552
    Top = 563
    object StringField1: TStringField
      DisplayWidth = 100
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.MOTIVOSUSPCONCESSAO.DESCRICAO'
      Size = 100
    end
    object FloatField1: TFloatField
      DisplayWidth = 10
      FieldName = 'IDMOTIVOSUSPCONCESSAO'
      Origin = 'BASEDADOS.MOTIVOSUSPCONCESSAO.IDMOTIVOSUSPCONCESSAO'
      Visible = False
    end
  end
  object DscMotivoArquivo: TwwDataSource
    DataSet = qryMotivoArquivo
    Left = 584
    Top = 563
  end
  object Dialog: TOpenDialog
    Title = 'Arquivo de Entrada'
    Left = 652
    Top = 563
  end
  object QryAux: TwwQuery
    DatabaseName = 'BASEDADOS'
    ValidateWithMask = True
    Left = 616
    Top = 563
  end
end
