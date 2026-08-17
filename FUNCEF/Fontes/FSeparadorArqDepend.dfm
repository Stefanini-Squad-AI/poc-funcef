inherited frmSeparadorArqDepend: TfrmSeparadorArqDepend
  Caption = 'Separador de Arquivo de Dependente'
  ClientHeight = 355
  ClientWidth = 407
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 407
    Height = 316
    object GroupBox1: TGroupBox
      Left = 27
      Top = 27
      Width = 353
      Height = 255
      TabOrder = 0
      object lblBarraProgresso: TLabel
        Left = 98
        Top = 218
        Width = 145
        Height = 13
        Caption = 'Aguarde Processando ....'
        Visible = False
      end
      object lblArqGravar: TLabel
        Left = 17
        Top = 72
        Width = 246
        Height = 13
        Caption = 'Indique o Caminho para o Arquivo a Gravar'
      end
      object Bevel2: TBevel
        Left = 16
        Top = 117
        Width = 290
        Height = 17
        Shape = bsTopLine
      end
      object lblPathArqProc: TLabel
        Left = 14
        Top = 17
        Width = 264
        Height = 13
        Caption = 'Indique o Caminho para o Arquivo a Processar'
      end
      object btnArqProcessar: TSpeedButton
        Left = 315
        Top = 32
        Width = 22
        Height = 23
        Hint = 'Buscar Arquivo '
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
        ParentShowHint = False
        ShowHint = True
        OnClick = btnArqProcessarClick
      end
      object spedArqGravar: TSpeedButton
        Left = 315
        Top = 88
        Width = 22
        Height = 23
        Hint = 'Buscar Arquivo '
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
        ParentShowHint = False
        ShowHint = True
        OnClick = spedArqGravarClick
      end
      object Animate1: TAnimate
        Left = 14
        Top = 136
        Width = 321
        Height = 61
        Active = False
        AutoSize = False
        CommonAVI = aviCopyFiles
        StopFrame = 34
        Visible = False
      end
      object edArqGravar: TEdit
        Left = 14
        Top = 89
        Width = 291
        Height = 21
        TabOrder = 1
        Text = 'C:\PROJETOSCM5\FUNCEF\'
      end
      object edtArqProc: TEdit
        Left = 14
        Top = 34
        Width = 291
        Height = 21
        TabOrder = 2
        Text = 'C:\PROJETOSCM5\FUNCEF\UNLD65S.txt'
      end
    end
  end
  inherited Dock971: TDock97
    Top = 316
    Width = 407
    inherited tb97Fundo: TToolbar97
      Left = 237
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 70
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Arquivos de Texto|*.TXT'
    InitialDir = 'C:\'
    Title = 'Busca Arquivo de Importação '
    Left = 16
    Top = 311
  end
end
