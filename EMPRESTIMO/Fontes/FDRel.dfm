inherited frmDesenhoRel: TfrmDesenhoRel
  Left = 106
  Top = 208
  Caption = 'frmDesenhoRel'
  ClientHeight = 259
  ClientWidth = 576
  Menu = MergeMenu
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 576
    Height = 191
    object Label1: TLabel
      Left = 16
      Top = 18
      Width = 115
      Height = 13
      Caption = 'Modelo do Relatório'
    end
    object Label2: TLabel
      Left = 16
      Top = 66
      Width = 107
      Height = 13
      Caption = 'Arquivo de Modelo'
    end
    object DBedtNomeModelo: TwwDBEdit
      Left = 16
      Top = 32
      Width = 545
      Height = 21
      DataSource = ds
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object memReports: TMemo
      Left = 416
      Top = 32
      Width = 121
      Height = 21
      Color = clAqua
      TabOrder = 1
      Visible = False
    end
    object btnDesenho: TBitBtn
      Left = 435
      Top = 122
      Width = 126
      Height = 46
      Caption = '&Desenho'
      TabOrder = 2
      OnClick = btnDesenhoClick
      Glyph.Data = {
        1E040000424D1E04000000000000760000002800000030000000270000000100
        040000000000A803000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888888888888888888888888888888888888888888888888888888888
        8888888888888888888888888888888888888888888888888888888888888888
        8888888888888888888888888888888888888888888888888888888888888888
        8777777777777777888888888888888888888880000000000000000000000007
        888888888888888888888880FBFBFBFBFBFBFBFBFBFBFB078888888888888888
        88888880B0BFBFB0BFBFB0BFBFB0BF07888888888888888888888880F0FB0BF0
        FB0BF0FB0BF0FB07888888888888888888888880000000000000000000000008
        88888888888888888888888880EEEEEEEEEEEEE0788888888888888888888888
        8888888880EEEEEEEEEEEE078888888888888888888888888888888880EE0000
        0EEEE07F8F8F8F8888888888888888888888888880EE0870EEEE07F8F8F8F8F8
        88888888888888888888888880EE080EEEE0077F8F8F8F888888888888888888
        8888888880EE00EEEE0770007788888888888888888888888888888880EE0EEE
        E07887F70077888888888888888888888888888880EEEEEE078887FF77077788
        88888888888888888888888880EEEEE08888887FF70088778888888888888888
        8888888880EEEE088888887FF033087778888888888888888888888880EEE088
        88888880F003307778888888888888888888888880EE0888888888880BB03307
        78778888888888888888888880E088888888888880BB03307888888888888888
        888888888008888888888888880BB03308777777787888888888888880888888
        888888888880BB0330F888888877888888888888888888888888888888880BB0
        3308877777777788888888888888888888888888888880BB0330888777777777
        8888888888888888888888888888880BB0330888877777777888888888888888
        8888888888888880BB0330888880000008888888888888888888888888888888
        0BB03308888880008888888888888888888888888888888880BB006088888888
        88888888888888888888888888888888880B0E00088888888888888888888888
        88888888888888888880E0870088888888888888888888888888888888888888
        88880F887088888888888888888888888888888888888888888880F808888888
        8888888888888888888888888888888888888800888888888888888888888888
        8888888888888888888888888888888888888888888888888888888888888888
        8888888888888888888888888888888888888888888888888888888888888888
        8888}
    end
    object edtArquivoModelo: TEdit
      Left = 16
      Top = 80
      Width = 497
      Height = 21
      Enabled = False
      TabOrder = 3
    end
    object btnLimpaArquivo: TBitBtn
      Left = 536
      Top = 80
      Width = 23
      Height = 22
      ParentShowHint = False
      ShowHint = True
      TabOrder = 4
      OnClick = btnLimpaArquivoClick
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
    object btnAbreArquivo: TBitBtn
      Left = 513
      Top = 80
      Width = 24
      Height = 22
      Hint = 'Seleciona o arquivo para gravação do log de exceções.'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 5
      OnClick = btnAbreArquivoClick
      Glyph.Data = {
        4E010000424D4E01000000000000760000002800000012000000120000000100
        040000000000D800000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888880000008888888888888888880000008888888888888888880000008800
        00000000008888000000800B8B8B8B8B8B088800000080B0B8B8B8B8B8B08800
        000080F08B8B8B8B8B808800000080BF08B8B8B8B8B80800000080FBF000008B
        8B8B0800000080BFBFBFBF0000008800000080FBFBFBFBFBFB088800000080BF
        BFBFBFBFBF088800000080FBFBFBFBFBFB088800000080BFBFB0000000888800
        0000880000088888888888000000888888888888888888000000888888888888
        888888000000888888888888888888000000}
    end
  end
  inherited Dock972: TDock97
    Width = 576
    inherited Toolbar971: TToolbar97
      inherited btnRefresh: TToolbarButton97
        Left = 431
        Width = 59
        Enabled = False
        Visible = False
      end
      inherited btnTrazer: TToolbarButton97
        Left = 340
      end
      inherited ToolbarSep972: TToolbarSep97
        Left = 425
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 226
    Width = 576
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited CmeCadastro: TCmEventosCadastro
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 358
    Top = 58
  end
  object dlgAbreArquivo: TOpenDialog
    DefaultExt = 'txt, tmp'
    Filter = 
      'Arquivo Texto (*.txt)|*.txt|Arquivos Temporários|*.tmp|Todos os ' +
      'Arquivos|*.*'
    FilterIndex = 2
    Left = 470
    Top = 124
  end
  object ppConsulta: TppBDEPipeline
    DataSource = dsConsulta
    CloseDataSource = True
    SkipWhenNoRecords = False
    UserName = 'Consulta'
    Left = 248
    Top = 184
  end
  object DsgnCM: TppDesigner
    Caption = 'Gerador de Relatórios e Gráficos'
    DataSettings.SessionType = 'BDESession'
    DataSettings.AllowEditSQL = False
    DataSettings.DatabaseType = dtParadox
    DataSettings.IsCaseSensitive = True
    DataSettings.SQLType = sqBDELocal
    Icon.Data = {
      0000010001002020100000000000E80200001600000028000000200000004000
      0000010004000000000080020000000000000000000000000000000000000000
      000000008000008000000080800080000000800080008080000080808000C0C0
      C0000000FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF000000
      0000000000033333300003333330000000000000003BBBBBB3003BBBBBB30000
      00000000003BBBBBB3003BBBBBB30000000000000003BBBB3003BBBBBB300000
      000000000003BBBB3003BBBBB3000000000000000003BBBB3003BBBB30000000
      000000000003BBBBB33BBBBB30000000000000000003BBBBBBBBBBB300000000
      000000000003BBBBBBBBBBB300000000000000700003BBBB333BBBBB30000000
      000000800003BBBB3003BBBBB30000000000F8F00003BBBB3003BBBBB3000000
      008F8F800003BBBB3003BBBBB3000070F8F877F80003BBBB333BBBBBB300007F
      8F00F08F003BBBBBBBBBBBBB3000007800FFF048003BBBBBBBBBBBB300000000
      FFFFF08F8003333333333330000070FFFFCCF804F07000000000000000007FFF
      CCFFFF0F8F0000000000000000007FCCFFFCCF074807000000000000000078FF
      FCCFFFF08F80700000000000000007FCCFFFCCF044F8070000000000000007FF
      FFCCFFFF0F8F8000000000000000078FCCFFFCCF07F77000000000000000007F
      FFFCCFFFF07000000000000000000078FCCFFFCCFF0700000000000000000007
      FFFFCCFFFF80000000000000000000078FCCFFFF877000000000000000000000
      7FFFFF8770000000000000000000000007FF8770000000000000000000000000
      007770000000000000000000000000000000000000000000000000000000FFFE
      0781FFFC0300FFFC0300FFFE0601FFFE0603FFFE0607FFFE0007FFFE000FFFFE
      000FFFDE0007FF0E0603FC0E0603F00E0603C0060003C0040007C004000FC002
      001F0001FFFF0001FFFF0000FFFF00007FFF80003FFF80003FFF80007FFFC001
      FFFFC000FFFFE000FFFFE001FFFFF007FFFFF81FFFFFFC7FFFFFFFFFFFFF}
    Position = poScreenCenter
    ShowComponents = [scLabel, scMemo, scRichText, scCalc, scImage, scShape, scLine, scBarCode, scTeeChart, scDBText, scDBMemo, scDBRichText, scDBCalc, scDBImage, scDBBarCode, scDBTeeChart, scRegion]
    IniStorageType = 'IniFile'
    IniStorageName = '($WINSYS)\RBuilder.ini'
    WindowHeight = 400
    WindowLeft = 100
    WindowTop = 50
    WindowWidth = 600
    WindowState = wsMaximized
    OnCreate = DsgnCMCreate
    Left = 248
    Top = 172
  end
  object dsConsulta: TwwDataSource
    Left = 176
    Top = 176
  end
  object MergeMenu: TMainMenu
    Left = 336
    Top = 172
    object mniFile: TMenuItem
      Caption = '&Arquivo'
      GroupIndex = 10
      Visible = False
      object mniFileSave: TMenuItem
        Caption = '&Salvar'
        ShortCut = 16467
        OnClick = mniFileSaveClick
      end
      object mniFileLine3: TMenuItem
        Caption = '-'
      end
      object mniFilePageSetup: TMenuItem
        Caption = 'Configurar &Página'
      end
      object mniFilePrintToFileSetup: TMenuItem
        Caption = 'Configuração da Impressão Para &Arquivo'
      end
      object mniFileLine4: TMenuItem
        Caption = '-'
      end
      object mniFilePrint: TMenuItem
        Caption = '&Imprimir'
        ShortCut = 16464
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Sair1: TMenuItem
        Caption = 'Sair'
        OnClick = Sair1Click
      end
    end
    object MnuRlatorio: TMenuItem
      Caption = '&Rlatório'
      GroupIndex = 60
      Visible = False
      object MnuTitulo: TMenuItem
        Caption = '&Título'
      end
      object MnuSumario: TMenuItem
        Caption = '&Sumário'
      end
      object N2: TMenuItem
        Caption = '-'
      end
      object MnuCabecalho: TMenuItem
        Caption = '&Cabeçalho'
      end
      object MnuRodape: TMenuItem
        Caption = '&Rodapé'
      end
      object N3: TMenuItem
        Caption = '-'
      end
      object MnuGrupos: TMenuItem
        Caption = '&Grupos'
        ShortCut = 16455
      end
      object MnuLInha: TMenuItem
        Caption = '-'
        ShortCut = 189
      end
      object MnuRetrato: TMenuItem
        Caption = '&Retrato'
      end
      object MnuPaisagem: TMenuItem
        Caption = '&Paisagem'
      end
      object N5: TMenuItem
        Caption = '-'
      end
      object MnuUnidades: TMenuItem
        Caption = '&Unidades'
        object MnuPixelsTela: TMenuItem
          Caption = 'Pixels de &Tela'
        end
        object MnuPixelsImpressora: TMenuItem
          Caption = 'Pixels de &Impressora'
        end
        object MnuPolegada: TMenuItem
          Caption = '&Polegada'
        end
        object MnuMilimetros: TMenuItem
          Caption = '&Milímetros'
        end
        object MnuMMilimetros: TMenuItem
          Caption = '&Milhares de Milímetros'
        end
      end
    end
  end
  object qryReports: TwwQuery
    DatabaseName = 'BaseDados'
    SessionName = 'Default'
    RequestLive = True
    SQL.Strings = (
      'SELECT '
      '   REPORTS.NAME,'
      '   REPORTS.IDREPORTS,'
      '   REPORTS.ORIGEMCM,'
      '   REPORTS.TEMPLATE'
      'FROM'
      '  CM.REPORTS'
      'WHERE'
      '   (REPORTS.IDREPORTS = :PREPORT) AND'
      '   (REPORTS.ORIGEMCM  = :PORIGEMCM)')
    UpdateMode = upWhereKeyOnly
    ValidateWithMask = True
    Left = 40
    Top = 176
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PREPORT'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PORIGEMCM'
        ParamType = ptUnknown
      end>
    object qryReportsNAME: TStringField
      FieldName = 'NAME'
      Origin = 'REPORTS.NAME'
      Size = 100
    end
    object qryReportsIDREPORTS: TFloatField
      FieldName = 'IDREPORTS'
      Origin = 'REPORTS.IDREPORTS'
    end
    object qryReportsORIGEMCM: TFloatField
      FieldName = 'ORIGEMCM'
      Origin = 'REPORTS.ORIGEMCM'
    end
    object qryReportsTEMPLATE: TBlobField
      FieldName = 'TEMPLATE'
      Origin = 'REPORTS.TEMPLATE'
      BlobType = ftBlob
      Size = 1
    end
  end
end
