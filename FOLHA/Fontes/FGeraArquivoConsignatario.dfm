inherited frmGeraArquivoConsignatario: TfrmGeraArquivoConsignatario
  Left = 47
  Top = 146
  Caption = 'Gera Arquivos para Entidades'
  ClientHeight = 524
  ClientWidth = 872
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 872
    Height = 485
    object lbProcessando: TLabel
      Left = 1
      Top = 464
      Width = 870
      Height = 20
      Align = alBottom
      Alignment = taCenter
      Caption = 'Processando. Aguarde...'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      Visible = False
    end
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 870
      Height = 57
      Align = alTop
      Caption = 'Panel1'
      TabOrder = 0
      object Panel3: TPanel
        Left = 1
        Top = 1
        Width = 187
        Height = 55
        Align = alLeft
        BevelOuter = bvNone
        TabOrder = 0
        object GroupBox1: TGroupBox
          Left = 0
          Top = 0
          Width = 187
          Height = 54
          Align = alTop
          Caption = ' Processado em '
          TabOrder = 0
          object Label1: TLabel
            Left = 7
            Top = 13
            Width = 24
            Height = 13
            Caption = 'Mês'
          end
          object Label2: TLabel
            Left = 116
            Top = 13
            Width = 23
            Height = 13
            Caption = 'Ano'
          end
          object cbMes: TComboBox
            Left = 7
            Top = 27
            Width = 106
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -12
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            ParentFont = False
            TabOrder = 0
            Text = 'cbMes'
            OnChange = cbMesChange
            Items.Strings = (
              'Janeiro'
              'Fevereiro'
              'Março'
              'Abril'
              'Maio'
              'Junho'
              'Julho'
              'Agosto'
              'Setembro'
              'Outubro'
              'Novembro'
              'Dezembro')
          end
          object edAno: TEdit
            Left = 115
            Top = 27
            Width = 41
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ParentFont = False
            TabOrder = 1
            Text = '2000'
            OnChange = cbMesChange
          end
          object UpDown1: TUpDown
            Left = 156
            Top = 27
            Width = 15
            Height = 21
            Associate = edAno
            Min = 1999
            Max = 4000
            Position = 2000
            TabOrder = 2
            Thousands = False
            Wrap = False
          end
        end
      end
      object Panel5: TPanel
        Left = 188
        Top = 1
        Width = 681
        Height = 55
        Align = alClient
        TabOrder = 1
        object Label3: TLabel
          Left = 1
          Top = 1
          Width = 679
          Height = 13
          Align = alTop
          Alignment = taCenter
          Caption = 'Versões de Pagamento'
        end
        object chkVersao: TCheckListBox
          Left = 1
          Top = 14
          Width = 679
          Height = 40
          Align = alClient
          ItemHeight = 13
          TabOrder = 0
        end
      end
    end
    object pnlCodRub: TPanel
      Left = 1
      Top = 136
      Width = 870
      Height = 328
      Align = alClient
      TabOrder = 1
      object PageControl1: TPageControl
        Left = 1
        Top = 1
        Width = 868
        Height = 326
        ActivePage = tbsArquivo
        Align = alClient
        TabOrder = 0
        object tbsArquivo: TTabSheet
          Caption = 'Lista de Registros do Arquivo'
          object lblTotalArquivo: TLabel
            Left = 0
            Top = 0
            Width = 860
            Height = 17
            Align = alTop
            Alignment = taCenter
            AutoSize = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -15
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbgArquivo: TwwDBGrid
            Left = 0
            Top = 17
            Width = 860
            Height = 281
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsRegistro
            KeyOptions = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgTrailingEllipsis, dgShowCellHint]
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
        object tbsDocComArq: TTabSheet
          Caption = 'Rateio documento relativo ao Arquivo de Consignação'
          ImageIndex = 1
          object lblTotalDocComArq: TLabel
            Left = 0
            Top = 0
            Width = 860
            Height = 17
            Align = alTop
            Alignment = taCenter
            AutoSize = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -15
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbgDocComArq: TwwDBGrid
            Left = 0
            Top = 17
            Width = 860
            Height = 281
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsRateioComArq
            KeyOptions = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgTrailingEllipsis, dgShowCellHint]
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
        object TabSheet1: TTabSheet
          Caption = 'Rateio documento de consignação sem arquivo'
          ImageIndex = 2
          object lblTotalDocSemArq: TLabel
            Left = 0
            Top = 0
            Width = 860
            Height = 17
            Align = alTop
            Alignment = taCenter
            AutoSize = False
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clRed
            Font.Height = -15
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbgDocSemArq: TwwDBGrid
            Left = 0
            Top = 17
            Width = 860
            Height = 281
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsRateioSemArq
            KeyOptions = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgTrailingEllipsis, dgShowCellHint]
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
    end
    object Panel2: TPanel
      Left = 1
      Top = 58
      Width = 870
      Height = 78
      Align = alTop
      TabOrder = 2
      object Label4: TLabel
        Left = 195
        Top = 26
        Width = 51
        Height = 13
        Caption = 'Rubricas'
        Visible = False
      end
      object lblportformaPA: TLabel
        Left = 344
        Top = 2
        Width = 120
        Height = 13
        Caption = 'Forma de Pagamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object rgTipo: TRadioGroup
        Left = 801
        Top = 1
        Width = 224
        Height = 32
        Caption = ' Tipo '
        Columns = 2
        ItemIndex = 1
        Items.Strings = (
          'Consignações'
          'Entidades')
        TabOrder = 0
        Visible = False
      end
      object edRubrica: TEdit
        Left = 218
        Top = 47
        Width = 121
        Height = 21
        TabOrder = 1
        Visible = False
      end
      object dblkupPortFormaPA: TwwDBLookupCombo
        Left = 342
        Top = 16
        Width = 242
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'50'#9'Descrição'#9'F'
          'CODPORTFORMA'#9'10'#9'Código'#9'F')
        LookupTable = qryPortadorForma1
        LookupField = 'CODPORTFORMA'
        Options = [loColLines, loRowLines, loTitles]
        ParentFont = False
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object btnBusca: TButton
        Left = 709
        Top = 23
        Width = 75
        Height = 17
        Caption = 'Busca'
        TabOrder = 3
        OnClick = btnBuscaClick
      end
      object GroupBox2: TGroupBox
        Left = 589
        Top = 1
        Width = 113
        Height = 39
        Caption = ' Previsão Pagto '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        object edDataFolha: TCMDateTimePicker
          Left = 16
          Top = 13
          Width = 83
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
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ShowButton = True
          TabOrder = 0
        end
      end
      object cboxGeraDoc: TCheckBox
        Left = 710
        Top = 5
        Width = 75
        Height = 17
        Caption = 'Gera doc'
        TabOrder = 5
      end
      object cboxgravaarq: TCheckBox
        Left = 14
        Top = 3
        Width = 85
        Height = 17
        Caption = 'Grava Arq'
        TabOrder = 6
      end
      object cboxGeraDocArq: TCheckBox
        Left = 14
        Top = 20
        Width = 148
        Height = 17
        Caption = 'Gera doc de arquivo'
        TabOrder = 7
      end
      object cboxDocSemArq: TCheckBox
        Left = 124
        Top = 3
        Width = 196
        Height = 17
        Caption = 'Gera documentos sem arquivo'
        TabOrder = 8
      end
    end
  end
  inherited Dock971: TDock97
    Top = 485
    Width = 872
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 995
    Top = 3
    TargetsData = (
      1
      2
      (
        ''
        'Text'
        0)
      (
        ''
        'Filter'
        0))
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 240
    Top = 152
  end
  object pdirdlgPasta: TProcuraDirDlg
    Caption = 'Seleção de pasta'
    Directory = 
      'controlar o valor máximo do benefício bruto de INSS, abaixo do q' +
      'ual se reembolsa a CPMF.'#13#10'Pendência: 17824'#13#10'Tela: Importação de ' +
      'Arquivo de Convênio'#13#10'Descrição: Criar parâmetro para indicar que' +
      ' pensionista tem matrícula própria.'#13#10'===========================' +
      '===='
    Folder = foCustom
    ShowPath = False
    Title = 
      'Navegue na árvore de pastas e selecione o caminho desejado para ' +
      'gravação dos arquivos.'
    Left = 184
    Top = 152
  end
  object qryRegistro1: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 104
    Top = 232
  end
  object dsRegistro: TwwDataSource
    DataSet = cdsRegistro
    Left = 104
    Top = 216
  end
  object qryPortadorForma1: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '  PFO.CODPORTFORMA,PFO.DESCRICAO,PFO.CODARQUIVOREMESSA,PFO.PATHA' +
        'RQUIVOREM,PFO.DMAIS,'
      '  PFO.CONTROLEREMESSA,PFO.CODFORMAPAGTO,PFO.FLGEMITEAVISO,'
      '  PFO.CODTIPOPAGTO,PFO.NUMEMPRESABANCO,PFO.CODFORMA,'
      '  PCT.IDBANCO,PCT.NOCONTACORR'
      'FROM'
      '  PORTADORFORMA PFO,'
      '  PORTADORCONTA PCT'
      'WHERE'
      '      PFO.RECPAG      = '#39'P'#39
      '  AND PCT.CODPORTADOR = PFO.CODPORTADOR')
    ValidateWithMask = True
    Left = 312
    Top = 152
  end
  object dsRateioComArq: TwwDataSource
    DataSet = qryRateioComArq
    Left = 216
    Top = 232
  end
  object qryRateioComArq: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 216
    Top = 216
  end
  object qryRateioSemArq: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 312
    Top = 232
  end
  object dsRateioSemArq: TwwDataSource
    DataSet = qryRateioSemArq
    Left = 312
    Top = 216
  end
  object cdsRegistro: TClientDataSet
    Aggregates = <>
    Params = <>
    Left = 104
    Top = 200
  end
  object cmsqlRegistro: TCMSqlParams
    ClientDataSet = cdsRegistro
    Left = 104
    Top = 184
  end
end
