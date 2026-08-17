inherited FrmMTExportArqInvent: TFrmMTExportArqInvent
  Left = 217
  Top = 174
  Caption = 'Exportação de Arquivo de Inventário para Coletor'
  ClientHeight = 126
  ClientWidth = 385
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 385
    Height = 87
    object lbStatus: TLabel
      Left = 32
      Top = 24
      Width = 6
      Height = 20
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -16
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object bar: TProgressBar
      Left = 32
      Top = 48
      Width = 324
      Height = 20
      Min = 0
      Max = 100
      TabOrder = 0
      Visible = False
    end
  end
  inherited Dock971: TDock97
    Top = 87
    Width = 385
    inherited tb97Fundo: TToolbar97
      Left = 137
      inherited sep1: TToolbarSep97
        Left = 162
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 80
        Top = 0
        Blank = True
        SizeHorz = 2
      end
      inherited bbtnSair: TBitBtn
        Left = 82
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 164
      end
      object btnGerar: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&Gerar'
        TabOrder = 2
        OnClick = btnGerarClick
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888088888888888888800888888888888880B0888888888888880B088
          8888888800000B088888888880BBBBB08888888880BBB00008888888880BBB08
          88888880000BFBF088888880BFBFB000088888880BFBF088888888880FBFBF08
          8888888880FBFBF0888888888000000088888888888888888888}
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 779
    Top = 3
  end
  object Zip: TZipMaster
    Verbose = False
    Trace = False
    AddCompLevel = 9
    AddOptions = []
    ExtrOptions = []
    Unattended = False
    ZipFilename = 'invent.zip'
    SFXPath = 'ZipSFX.bin'
    SFXOverWriteMode = OvrConfirm
    SFXCaption = 'Self-extracting Archive'
    KeepFreeOnDisk1 = 0
    VersionInfo = '1.52 M'
    Left = 336
  end
  object Dlg: TSaveDialog
    DefaultExt = '.txt'
    FileName = 'invent.txt'
    Title = 'Salvar Arquivo'
    Left = 280
    Top = 8
  end
  object cds: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 232
  end
end
