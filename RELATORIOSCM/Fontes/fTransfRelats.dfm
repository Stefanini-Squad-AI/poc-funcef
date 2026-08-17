inherited frmTransfRelats: TfrmTransfRelats
  Left = 410
  Top = 109
  Caption = 'Transferência De Relatórios'
  ClientHeight = 265
  ClientWidth = 498
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 498
    Height = 226
    object SbTransf: TfcStatusBar
      Left = 5
      Top = 200
      Width = 488
      Height = 21
      Panels = <
        item
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Name = 'PnlStatus'
          Tag = 0
          TextOptions.Alignment = taLeftJustify
          TextOptions.VAlignment = vaVCenter
          Width = '200'
        end
        item
          Component = PbTransf
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Name = 'PnlProgress'
          Style = psControl
          Tag = 0
          TextOptions.Alignment = taLeftJustify
          TextOptions.VAlignment = vaVCenter
          Width = '50'
        end>
      SimplePanel = False
      SizeGrip = False
      StatusBarText.CapsLock = 'Caps'
      StatusBarText.Overwrite = 'Overwrite'
      StatusBarText.NumLock = 'Num'
      StatusBarText.ScrollLock = 'Scroll'
      object PbTransf: TProgressBar
        Left = 203
        Top = 3
        Width = 284
        Height = 17
        Min = 0
        Max = 100
        TabOrder = 0
      end
    end
    object GroupBox2: TGroupBox
      Left = 21
      Top = 13
      Width = 457
      Height = 51
      Caption = '  Arquivo de transferência '
      TabOrder = 1
      object SpeedButton1: TSpeedButton
        Left = 415
        Top = 19
        Width = 22
        Height = 22
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
        OnClick = SpeedButton1Click
      end
      object edNomeArquivo: TEdit
        Left = 11
        Top = 19
        Width = 396
        Height = 21
        ReadOnly = True
        TabOrder = 0
      end
    end
    object GpbDados: TGroupBox
      Left = 165
      Top = 69
      Width = 314
      Height = 123
      Enabled = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
      object LblUsuario: TLabel
        Left = 16
        Top = 32
        Width = 44
        Height = 13
        Caption = 'Usuário'
        Enabled = False
      end
      object LblSenha: TLabel
        Left = 16
        Top = 63
        Width = 37
        Height = 13
        Caption = 'Senha'
        Enabled = False
      end
      object LblAlias: TLabel
        Left = 16
        Top = 92
        Width = 111
        Height = 13
        Caption = 'Alias Para Conexão'
        Enabled = False
      end
      object LblParamTrans: TLabel
        Left = 12
        Top = 0
        Width = 246
        Height = 13
        Caption = ' Parâmetros para importação de Relatórios '
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object EdtUsuario: TEditReg
        Left = 136
        Top = 25
        Width = 161
        Height = 21
        RegKey = 'HKEY_CURRENT_USER'
        RegPath = 'Software\CM\Gerador de Relatórios, Consultas e Gráficos'
        RegValueName = 'Usuario Importação'
        TabOrder = 0
      end
      object EdtAlias: TEditReg
        Left = 136
        Top = 85
        Width = 161
        Height = 21
        RegKey = 'HKEY_CURRENT_USER'
        RegPath = 'Software\CM\Gerador de Relatórios, Consultas e Gráficos'
        RegValueName = 'Alias Importação'
        TabOrder = 1
      end
      object EdtSenha: TEdit
        Left = 136
        Top = 56
        Width = 161
        Height = 21
        PasswordChar = '*'
        TabOrder = 2
      end
    end
    object GpbTipoImporta: TGroupBox
      Left = 22
      Top = 69
      Width = 137
      Height = 121
      Caption = ' Operação '
      TabOrder = 3
      object SbtnGerar: TSpeedButton
        Left = 19
        Top = 23
        Width = 102
        Height = 38
        GroupIndex = 1
        Down = True
        Caption = 'Exportar'
        OnClick = SbtnGerarClick
      end
      object SbtnImportar: TSpeedButton
        Left = 19
        Top = 66
        Width = 102
        Height = 38
        GroupIndex = 1
        Caption = 'Importar'
        OnClick = SbtnImportarClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 226
    Width = 498
    inherited tb97Fundo: TToolbar97
      Left = 328
      DockPos = 328
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 160
      DockPos = 160
      inherited bbtnConfirmar: TBitBtn
        ModalResult = 0
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        ModalResult = 0
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 35
    Top = 227
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object OpDlg: TOpenDialog
    DefaultExt = 'tcm'
    FileName = 'CmRelats.cmr'
    Filter = 'Transferencia de relatorios|*.cmr'
    Options = [ofHideReadOnly, ofExtensionDifferent, ofPathMustExist]
    Left = 74
    Top = 227
  end
  object Dbimporta: TDatabase
    DatabaseName = 'BaseDadosImporta'
    DriverName = 'ORACLE'
    LoginPrompt = False
    Params.Strings = (
      'SERVER NAME=des'
      'USER NAME=MYNAME'
      'NET PROTOCOL=TNS'
      'OPEN MODE=READ/WRITE'
      'SCHEMA CACHE SIZE=8'
      'LANGDRIVER='
      'SQLQRYMODE=SERVER'
      'SQLPASSTHRU MODE=SHARED AUTOCOMMIT'
      'SCHEMA CACHE TIME=-1'
      'MAX ROWS=-1'
      'BATCH COUNT=200'
      'ENABLE SCHEMA CACHE=FALSE'
      'SCHEMA CACHE DIR='
      'ENABLE BCD=FALSE'
      'ENABLE INTEGERS=FALSE'
      'LIST SYNONYMS=NONE'
      'ROWSET SIZE=20'
      'BLOBS TO CACHE=1000'
      'BLOB SIZE=256'
      'OBJECT MODE=TRUE'
      'PASSWORD=')
    SessionName = 'Default'
    Left = 156
    Top = 230
  end
  object CMDataTransf: TCMDataTransf
    FileTransfs = [ftReports, ftDataView, ftGrupoRelatorio]
    OrigemCM = 1
    PrefixoServidor = 'CM.'
    OnTransfProgress = CMDataTransfTransfProgress
    OnRequestLoginDBA = CMDataTransfRequestLoginDBA
    Left = 116
    Top = 230
  end
end
