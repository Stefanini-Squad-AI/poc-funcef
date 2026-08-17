inherited frmCriaSelecao: TfrmCriaSelecao
  Left = 171
  Top = 207
  Caption = 'Criação de Seleção de Dados'
  ClientHeight = 167
  ClientWidth = 548
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 548
    Height = 128
    object lblTipoUsuario: TLabel
      Left = 16
      Top = 75
      Width = 169
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Diretório dos arquivos HTML:'
    end
    object spbAbreDir: TSpeedButton
      Left = 509
      Top = 89
      Width = 23
      Height = 22
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        04000000000000010000120B0000120B00001000000000000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
        5555555555555555555555555555555555555555555555555555555555555555
        555555555555555555555555555555555555555FFFFFFFFFF555550000000000
        55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
        B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
        000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
        555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
        55555575FFF75555555555700007555555555557777555555555555555555555
        5555555555555555555555555555555555555555555555555555}
      NumGlyphs = 2
      OnClick = spbAbreDirClick
    end
    object grpAtencao: TGroupBox
      Left = 16
      Top = 16
      Width = 517
      Height = 49
      Caption = 'ATENÇÃO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clMaroon
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object lblMsg: TLabel
        Left = 8
        Top = 16
        Width = 505
        Height = 28
        AutoSize = False
        Caption = 
          'Esta operação irá destruir todas as configurações específicas pa' +
          'ra este tipo de usuário e interface (se já existirem), substitui' +
          'ndo-as pelas configurações padrões do sistema.'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clNavy
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        WordWrap = True
      end
    end
    object edtDiretorio: TEdit
      Left = 16
      Top = 89
      Width = 493
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 1
    end
  end
  inherited Dock971: TDock97
    Top = 128
    Width = 548
    inherited tb97Fundo: TToolbar97
      Left = 190
      DockPos = 190
      Visible = False
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 381
      DockPos = 384
      inherited bbtnConfirmar: TBitBtn
        ModalResult = 0
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 411
    Top = 99
  end
  object dlgOpenDir: TProcuraDirDlg
    Caption = 'Diretório do Auto-Atendimento'
    Options = [bfStatusText]
    ShowPath = True
    Title = 'Indique o diretório onde está instalado o Auto-Atendimento:'
    OnSelectionChanged = dlgOpenDirSelectionChanged
    Left = 376
    Top = 96
  end
end
