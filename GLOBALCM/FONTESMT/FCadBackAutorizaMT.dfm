inherited frmCadBackAutoriza: TfrmCadBackAutoriza
  Left = 179
  Top = 171
  Caption = 'Restaura Autorização'
  ClientHeight = 224
  ClientWidth = 353
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 353
    Height = 185
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 351
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
      Left = 16
      Top = 48
      Width = 320
      Height = 120
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
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
  end
  inherited Dock971: TDock97
    Top = 185
    Width = 353
    inherited tb97Fundo: TToolbar97
      Left = 181
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 12
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 443
    Top = 35
  end
  object sqlBack: TCMSqlParams
    SQL.Strings = (
      'select * from BACKCTRL')
    ClientDataSet = cmcdsBack
    Left = 96
    Top = 16
  end
  object dsBack: TwwDataSource
    AutoEdit = False
    DataSet = cmcdsBack
    Left = 144
    Top = 16
  end
  object cmcdsBack: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 145
    Top = 65
    Data = {
      580000009619E0BD010000001800000002000100000003000000460009534551
      55454E4349410800040000000000044441544108000800000000000100044C43
      49440400010009080000000000000000000032400048E3C160C7CC42}
  end
  object CMDataTransf: TCMDataTransf
    FileTransfs = [ftReports, ftDataView, ftGrupoRelatorio, ftConsultas]
    OrigemCM = 1
    PrefixoServidor = 'CM.'
    Left = 48
    Top = 40
  end
end
