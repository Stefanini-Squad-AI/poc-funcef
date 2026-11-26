inherited FrmExportaVariosConvenios: TFrmExportaVariosConvenios
  Left = 46
  Top = 110
  HelpContext = 180045
  BorderIcons = [biSystemMenu, biMinimize]
  Caption = 'Exportação de Convênios'
  ClientHeight = 315
  ClientWidth = 690
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 690
    Height = 276
    object Bevel1: TBevel
      Left = 202
      Top = 50
      Width = 439
      Height = 22
    end
    object lblMostraMensagem: TLabel
      Left = 5
      Top = 80
      Width = 413
      Height = 13
      Alignment = taCenter
      Caption = 
        'Escolha o Layout de Entrada Relacionado ao Layout de Saída Desej' +
        'ado'
    end
    object lblMensArquivo: TLabel
      Left = 202
      Top = 35
      Width = 270
      Height = 13
      Caption = 'Indique o local onde os arquivos serão gerados'
    end
    object LabelNomeArqTxt: TLabel
      Left = 206
      Top = 55
      Width = 427
      Height = 13
      AutoSize = False
      Caption = 'C:\'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
    end
    object lbGerando: TLabel
      Left = 5
      Top = 240
      Width = 680
      Height = 13
      Align = alBottom
      Caption = 'Gerando o arquivo de retorno. Por favor, aguarde ...'
      Layout = tlBottom
      Visible = False
    end
    object dbgrdLayoutEntrxSaida: TwwDBGrid
      Left = 5
      Top = 95
      Width = 680
      Height = 138
      Selected.Strings = (
        'FLGENVIAR'#9'5'#9'Processar'#9'F'
        'LAYOUTENTRADA'#9'26'#9'Layout de Entrada'#9'F'
        'LAYOUTSAIDA'#9'26'#9'Layout de Saída'#9'F'
        'NOMEARQ'#9'30'#9'Nome do Arquivo'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
      DataSource = dsLayoutEntrxSaida
      Options = [dgEditing, dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgAlwaysShowSelection, dgConfirmDelete, dgWordWrap]
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
    object gbAbono: TGroupBox
      Left = 201
      Top = 6
      Width = 124
      Height = 28
      TabOrder = 1
      object chkAbonoAnual: TCheckBox
        Left = 9
        Top = 8
        Width = 97
        Height = 17
        Caption = 'Abono Anual'
        TabOrder = 0
      end
    end
    object grbMesAno: TGroupBox
      Left = 8
      Top = 6
      Width = 188
      Height = 66
      Caption = ' Cobrado  em '
      TabOrder = 2
      object Label1: TLabel
        Left = 7
        Top = 16
        Width = 24
        Height = 13
        Caption = 'Mês'
      end
      object Label2: TLabel
        Left = 116
        Top = 12
        Width = 23
        Height = 13
        Caption = 'Ano'
      end
      object cmbMes: TComboBox
        Left = 7
        Top = 29
        Width = 106
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        TabOrder = 0
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
      object edtAno: TEdit
        Left = 115
        Top = 29
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
      end
      object UpDown1: TUpDown
        Left = 156
        Top = 29
        Width = 16
        Height = 21
        Associate = edtAno
        Min = 1999
        Max = 4000
        Position = 2000
        TabOrder = 2
        Thousands = False
        Wrap = False
      end
    end
    object ProgressBar1: TProgressBar
      Left = 5
      Top = 253
      Width = 680
      Height = 18
      Align = alBottom
      Min = 0
      Max = 100
      TabOrder = 3
      Visible = False
    end
    object btnEscolheDir: TBitBtn
      Left = 646
      Top = 51
      Width = 27
      Height = 21
      Hint = 'Seleciona a Pasta que será gravado os arquivos para banco'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = btnEscolheDirClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00303333333333
        333337F3333333333333303333333333333337F33FFFFF3FF3FF303300000300
        300337FF77777F77377330000BBB0333333337777F337F33333330330BB00333
        333337F373F773333333303330033333333337F3377333333333303333333333
        333337F33FFFFF3FF3FF303300000300300337FF77777F77377330000BBB0333
        333337777F337F33333330330BB00333333337F373F773333333303330033333
        333337F3377333333333303333333333333337FFFF3FF3FFF333000003003000
        333377777F77377733330BBB0333333333337F337F33333333330BB003333333
        333373F773333333333330033333333333333773333333333333}
      NumGlyphs = 2
    end
    object pnlDiretorio: TPanel
      Left = 205
      Top = 74
      Width = 217
      Height = 170
      TabOrder = 5
      Visible = False
      object DirectoryListBox1: TDirectoryListBox
        Left = 5
        Top = 26
        Width = 207
        Height = 111
        ItemHeight = 16
        TabOrder = 0
        OnKeyPress = DirectoryListBox1KeyPress
      end
      object DriveComboBox1: TDriveComboBox
        Left = 5
        Top = 4
        Width = 209
        Height = 19
        DirList = DirectoryListBox1
        TabOrder = 1
      end
      object btnOkDir: TBitBtn
        Left = 24
        Top = 140
        Width = 77
        Height = 25
        Caption = '&OK'
        Default = True
        TabOrder = 2
        OnClick = btnOkDirClick
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333333333333333330000333333333333333333333333F33333333333
          00003333344333333333333333388F3333333333000033334224333333333333
          338338F3333333330000333422224333333333333833338F3333333300003342
          222224333333333383333338F3333333000034222A22224333333338F338F333
          8F33333300003222A3A2224333333338F3838F338F33333300003A2A333A2224
          33333338F83338F338F33333000033A33333A222433333338333338F338F3333
          0000333333333A222433333333333338F338F33300003333333333A222433333
          333333338F338F33000033333333333A222433333333333338F338F300003333
          33333333A222433333333333338F338F00003333333333333A22433333333333
          3338F38F000033333333333333A223333333333333338F830000333333333333
          333A333333333333333338330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
        Spacing = 2
      end
      object btnSairDiretorio: TBitBtn
        Left = 107
        Top = 140
        Width = 78
        Height = 25
        Caption = '&Cancelar'
        ModalResult = 2
        TabOrder = 3
        OnClick = btnSairDiretorioClick
        Glyph.Data = {
          DE010000424DDE01000000000000760000002800000024000000120000000100
          0400000000006801000000000000000000001000000010000000000000000000
          80000080000000808000800000008000800080800000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333333333000033338833333333333333333F333333333333
          0000333911833333983333333388F333333F3333000033391118333911833333
          38F38F333F88F33300003339111183911118333338F338F3F8338F3300003333
          911118111118333338F3338F833338F3000033333911111111833333338F3338
          3333F8330000333333911111183333333338F333333F83330000333333311111
          8333333333338F3333383333000033333339111183333333333338F333833333
          00003333339111118333333333333833338F3333000033333911181118333333
          33338333338F333300003333911183911183333333383338F338F33300003333
          9118333911183333338F33838F338F33000033333913333391113333338FF833
          38F338F300003333333333333919333333388333338FFF830000333333333333
          3333333333333333333888330000333333333333333333333333333333333333
          0000}
        NumGlyphs = 2
        Spacing = 2
      end
    end
    object chkMarcaTudo: TCheckBox
      Left = 578
      Top = 80
      Width = 97
      Height = 15
      Caption = 'Marcar Tudo'
      Enabled = False
      TabOrder = 6
      OnClick = chkMarcaTudoClick
    end
  end
  inherited Dock971: TDock97
    Top = 276
    Width = 690
    inherited tb97Fundo: TToolbar97
      Left = 513
      DockPos = 513
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 331
      DockPos = 331
      inherited ToolbarSep971: TToolbarSep97
        Left = 95
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 95
        Caption = '&Processar'
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 98
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 99
    Top = 267
  end
  object qryLayoutEntrxSaida: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  LD.IDLAYOUT,'
      '  LD.FLGTIPOCONVENIO,'
      '  LDS.IDLAYOUTSAIDA,'
      '  LD.DESCRICAO AS LAYOUTENTRADA,'
      '  LDS.DESCRICAO AS LAYOUTSAIDA,'
      '  LES.NOMEARQ,'
      '  0 AS FLGENVIAR'
      ''
      'FROM'
      '  LAYOUTDESCONTO LD,'
      '  LAYOUTDESCONTOSAIDA LDS,'
      '  LAYOUTENTRXSAIDA LES'
      ''
      'WHERE'
      '  LD.IDLAYOUT       = LES.IDLAYOUTENT    AND'
      '  LDS.IDLAYOUTSAIDA = LES.IDLAYOUTSAIDA'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updLayoutEntrxSaida
    ControlType.Strings = (
      'FLGENVIAR;CheckBox;1;0')
    ValidateWithMask = True
    Left = 472
    Top = 160
  end
  object dsLayoutEntrxSaida: TwwDataSource
    DataSet = qryLayoutEntrxSaida
    Left = 600
    Top = 160
  end
  object updLayoutEntrxSaida: TUpdateSQL
    ModifySQL.Strings = (
      'update LAYOUTENTRXSAIDA'
      'set'
      '  FLGENVIAR = :FLGENVIAR'
      'where'
      '  IDLAYOUT = :OLD_IDLAYOUT')
    InsertSQL.Strings = (
      'insert into LAYOUTENTRXSAIDA'
      '  (FLGENVIAR)'
      'values'
      '  (:FLGENVIAR)')
    DeleteSQL.Strings = (
      'delete from LAYOUTENTRXSAIDA'
      'where'
      '  IDLAYOUT = :OLD_IDLAYOUT')
    Left = 122
    Top = 168
  end
end
