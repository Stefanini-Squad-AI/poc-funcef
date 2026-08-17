inherited frmConversaoLayOutMant: TfrmConversaoLayOutMant
  Top = 47
  HelpContext = 3360024
  Caption = 'Processa LayOut  da Mantenedora'
  ClientHeight = 366
  ClientWidth = 403
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 403
    Height = 327
    object GroupBox1: TGroupBox
      Left = 25
      Top = 88
      Width = 353
      Height = 217
      TabOrder = 0
      object lblPathArqProc: TLabel
        Left = 14
        Top = 17
        Width = 252
        Height = 13
        Caption = 'Selecione o Arquivo de Entrada a Processar'
      end
      object btnArqProcessar: TSpeedButton
        Left = 315
        Top = 31
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
      object lblBarraProgresso: TLabel
        Left = 114
        Top = 186
        Width = 145
        Height = 13
        Caption = 'Aguarde Processando ....'
        Visible = False
      end
      object lblArqGravar: TLabel
        Left = 17
        Top = 72
        Width = 167
        Height = 13
        Caption = 'Indique o de Saída Desejado'
      end
      object spedArqGravar: TSpeedButton
        Left = 315
        Top = 89
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
      object Bevel3: TBevel
        Left = 15
        Top = 63
        Width = 290
        Height = 17
        Shape = bsTopLine
      end
      object Bevel2: TBevel
        Left = 16
        Top = 117
        Width = 290
        Height = 17
        Shape = bsTopLine
      end
      object edtArqProc: TEdit
        Left = 14
        Top = 34
        Width = 291
        Height = 21
        TabOrder = 0
      end
      object Animate1: TAnimate
        Left = 14
        Top = 131
        Width = 321
        Height = 44
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
        TabOrder = 2
      end
    end
    object grpMantenedora: TGroupBox
      Left = 24
      Top = 24
      Width = 353
      Height = 57
      Caption = 'Mantenedora'
      TabOrder = 1
      object cmbMantenedora: TComboBox
        Left = 16
        Top = 24
        Width = 313
        Height = 21
        ItemHeight = 13
        TabOrder = 0
        OnClick = cmbMantenedoraClick
        Items.Strings = (
          'PMPP'
          'Caixa Seguros')
      end
    end
  end
  inherited Dock971: TDock97
    Top = 327
    Width = 403
    inherited tb97Fundo: TToolbar97
      Left = 231
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 62
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 3
    Top = 323
  end
  object OpenDialog1: TOpenDialog
    Filter = 'Arquivos de Texto|*.TXT'
    InitialDir = 'C:\'
    Title = 'Busca Arquivo de Importação '
    Left = 37
    Top = 326
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 369
    Top = 117
  end
end
