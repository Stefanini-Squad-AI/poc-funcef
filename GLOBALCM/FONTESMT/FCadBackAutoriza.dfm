inherited frmCadBackAutoriza: TfrmCadBackAutoriza
  Left = 340
  Top = 172
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Restaura Autorização'
  ClientHeight = 374
  ClientWidth = 567
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 567
    Height = 335
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 565
      Height = 30
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = 'Selecione abaixo o backup de autorização a ser restaurado:'
      Color = clGray
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWhite
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
    end
    object wwDBGridBackAutoriza: TwwDBGrid
      Left = 1
      Top = 31
      Width = 565
      Height = 144
      Selected.Strings = (
        'IDBACKCTRL'#9'10'#9'Seq.'
        'USUARIO'#9'43'#9'Usuário'
        'TRGDTINCLUSAO'#9'18'#9'Data/Hora')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alTop
      DataSource = dsBack
      TabOrder = 1
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
    object MemErroImport: TMemo
      Left = 1
      Top = 192
      Width = 565
      Height = 122
      Align = alClient
      ScrollBars = ssBoth
      TabOrder = 2
    end
    object SbTransf: TfcStatusBar
      Left = 1
      Top = 314
      Width = 565
      Height = 20
      Panels = <
        item
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Name = 'PnlNomeSistema'
          Tag = 0
          TextOptions.Alignment = taLeftJustify
          TextOptions.VAlignment = vaVCenter
          Width = '215'
        end
        item
          Component = Pbtransf
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Name = 'PnlProgresso'
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
      object Pbtransf: TProgressBar
        Left = 218
        Top = 3
        Width = 346
        Height = 16
        Min = 0
        Max = 100
        TabOrder = 0
      end
    end
    object Panel2: TPanel
      Left = 1
      Top = 175
      Width = 565
      Height = 17
      Align = alTop
      TabOrder = 4
      object Label1: TLabel
        Left = 1
        Top = 1
        Width = 90
        Height = 15
        Align = alLeft
        Alignment = taCenter
        Caption = 'Log de Erros'
        Color = clGray
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 335
    Width = 567
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 443
    Top = 35
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
  object sqlBack: TCMSqlParams
    SQL.Strings = (
      'select D1.IDBACKCTRL, D1.TRGDTINCLUSAO, '
      ' ('
      '  SELECT U.NOMEUSUARIO'
      '  FROM BACKCTRL D, USUARIOSISTEMA U'
      '  WHERE D.IDBACKCTRL = D1.IDBACKCTRL'
      '  AND TRIM(SUBSTR(D.TRGUSERINCLUSAO, 3, 30)) = U.IDUSUARIO'
      ' ) Usuario'
      ' from BACKCTRL D1'
      'ORDER BY D1.IDBACKCTRL DESC'
      ' ')
    ClientDataSet = cmcdsBack
    Left = 224
    Top = 120
  end
  object dsBack: TwwDataSource
    AutoEdit = False
    DataSet = cmcdsBack
    Left = 224
    Top = 160
  end
  object cmcdsBack: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 209
    Top = 81
  end
  object CMDataTransf: TCMDataTransf
    DatabaseName = 'BaseDados'
    FileTransfs = [ftReports, ftDataView, ftGrupoRelatorio, ftConsultas]
    OrigemCM = 1
    PrefixoServidor = 'CM.'
    OnTransfProgress = CMDataTransfTransfProgress
    Left = 24
    Top = 96
  end
end
