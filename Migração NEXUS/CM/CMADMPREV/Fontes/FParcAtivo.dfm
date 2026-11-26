inherited FrmParcAtivo: TFrmParcAtivo
  Left = 279
  Top = 197
  Caption = 'Parcelamentos Ativos'
  ClientHeight = 464
  ClientWidth = 915
  FormStyle = fsNormal
  Visible = False
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label12: TLabel [0]
    Left = 167
    Top = 86
    Width = 95
    Height = 13
    Caption = 'Acertos de INSS'
  end
  object Label13: TLabel [1]
    Left = 167
    Top = 139
    Width = 121
    Height = 13
    Caption = 'Acertos de Benefício'
  end
  object Label14: TLabel [2]
    Left = 167
    Top = 192
    Width = 137
    Height = 13
    Caption = 'Acertos de Contribuição'
  end
  inherited pnlFundo: TPanel
    Width = 915
    Height = 425
    object lbl1: TLabel
      Left = 304
      Top = 12
      Width = 101
      Height = 13
      Caption = 'Saldo da Revisão'
    end
    object lbl2: TLabel
      Left = 16
      Top = 333
      Width = 69
      Height = 13
      Caption = 'Observação'
    end
    object edtSalRevis: TEdit
      Left = 304
      Top = 26
      Width = 121
      Height = 21
      ReadOnly = True
      TabOrder = 0
    end
    object dbgrdDet: TwwDBGrid
      Left = 16
      Top = 64
      Width = 873
      Height = 233
      ControlType.Strings = (
        'SELECIONADO;CheckBox;S;N')
      Selected.Strings = (
        'S'#9'1'#9'S'
        'MESINICIO'#9'18'#9'Início'
        'MESFIM'#9'18'#9'Fim'
        'SALDODEVEDORATUAL'#9'10'#9'Saldo Devedor'
        'QTDEPARCELAS'#9'10'#9'Qte Parcelas'
        'QUANTIDADEPARCELASPAGAS'#9'10'#9'Parcelas Pagas'
        '(QTDEPARCELAS-QUANTIDADEPARCELASPAGAS)'#9'10'#9'Parcelas em Aberto'
        'SFONTEPAGADORA'#9'6'#9'Fontepagadora'#9'F'
        'PLANO'#9'6'#9'Plano'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Color = clWhite
      DataSource = dsDet
      ImeMode = imHanguel
      KeyOptions = []
      Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter]
      TabOrder = 1
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 2
      TitleButtons = True
      IndicatorColor = icBlack
    end
    object mmo1: TMemo
      Left = 96
      Top = 312
      Width = 785
      Height = 89
      TabOrder = 2
    end
  end
  inherited Dock971: TDock97
    Top = 425
    Width = 915
    inherited tb97Fundo: TToolbar97
      Left = 631
      DockPos = 631
      inherited bbtnSair: TBitBtn
        Visible = False
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Visible = False
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 446
      DockPos = 446
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 3
    Top = 274
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
  object qryDet: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    RequestLive = True
    SQL.Strings = (
      'SELECT '#39'N'#39' S,'
      '       MESINICIO,'
      '       MESFIM,'
      '       SALDODEVEDORATUAL,'
      '       QTDEPARCELAS,'
      '       QUANTIDADEPARCELASPAGAS,'
      '       (QTDEPARCELAS - QUANTIDADEPARCELASPAGAS),'
      '       IDCONTROLEDIVIDABENEFICIO,'
      '       FONTEPAGADORA,'
      '       decode(FONTEPAGADORA,1,'#39'Funcef'#39',2,'#39'INSS'#39') SFONTEPAGADORA,'
      '       IDBENEFICIO,'
      '       IDPLANOPREV,'
      '       IDTITULAR,'
      '       IDPESSOA,'
      '       IDPESSJUR,'
      '       '#39' '#39' PLANO'
      '  FROM CONTROLEDIVIDABENEFICIO'
      ' WHERE FLGQUITADO = 0'
      '   AND SALDODEVEDORATUAL > 0'
      ' ')
    UpdateObject = updDet
    ControlType.Strings = (
      'S;CheckBox;S;N')
    ValidateWithMask = True
    Left = 153
    Top = 128
  end
  object updDet: TUpdateSQL
    Left = 114
    Top = 114
  end
  object dsDet: TwwDataSource
    DataSet = qryDet
    Left = 91
    Top = 170
  end
end
