inherited frmParamEtiquetaAlteracaoCTPS: TfrmParamEtiquetaAlteracaoCTPS
  Left = 216
  Top = 168
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = 'Impress'#227'o de Etiquetas'
  ClientHeight = 248
  ClientWidth = 251
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 251
    Height = 209
    BorderWidth = 2
    object gbxConfigEtiq: TGroupBox
      Left = 12
      Top = 7
      Width = 228
      Height = 145
      Caption = 'Posicionamento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 0
      object Label13: TLabel
        Left = 8
        Top = 18
        Width = 140
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Altura da Etiqueta (em mm)'
      end
      object Label14: TLabel
        Left = 8
        Top = 43
        Width = 140
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Quantidade de Carreiras'
      end
      object Label15: TLabel
        Left = 8
        Top = 68
        Width = 140
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Quantidade de Linhas'
      end
      object Label11: TLabel
        Left = 8
        Top = 94
        Width = 140
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Margem Superior (em mm)'
      end
      object Label12: TLabel
        Left = 8
        Top = 120
        Width = 140
        Height = 13
        Alignment = taRightJustify
        AutoSize = False
        Caption = 'Margem '#224' Esquerda (em mm)'
      end
      object spedAltura: TSpinEdit
        Left = 155
        Top = 15
        Width = 64
        Height = 22
        Hint = 'O valor deve estar entre 20 e 40'
        MaxValue = 40
        MinValue = 20
        ParentShowHint = False
        ShowHint = True
        TabOrder = 0
        Value = 27
      end
      object spedQuantCarreiras: TSpinEdit
        Left = 155
        Top = 40
        Width = 64
        Height = 22
        Hint = 'O valor deve estar entre 1 e 3'
        MaxValue = 3
        MinValue = 1
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        Value = 3
        OnChange = spedQuantCarreirasChange
      end
      object spedQuantLinhas: TSpinEdit
        Left = 155
        Top = 65
        Width = 64
        Height = 22
        Hint = 'O valor deve estar entre 5 e 20'
        MaxValue = 20
        MinValue = 5
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        Value = 10
        OnChange = spedQuantLinhasChange
      end
      object spedMargemSuperior: TSpinEdit
        Left = 155
        Top = 90
        Width = 64
        Height = 22
        Hint = 'O valor deve estar entre 0 e 20'
        MaxValue = 20
        MinValue = 0
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
        Value = 0
      end
      object spedMargEsquerda: TSpinEdit
        Left = 155
        Top = 115
        Width = 64
        Height = 22
        Hint = 'O valor deve estar entre 0 e 20'
        MaxValue = 20
        MinValue = 0
        ParentShowHint = False
        ShowHint = True
        TabOrder = 4
        Value = 0
      end
    end
    object gbxPosicao: TGroupBox
      Left = 12
      Top = 154
      Width = 228
      Height = 44
      Caption = 'Posi'#231#227'o da Etiqueta na P'#225'gina'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      object Label6: TLabel
        Left = 18
        Top = 18
        Width = 36
        Height = 13
        Caption = 'Coluna:'
      end
      object Label9: TLabel
        Left = 122
        Top = 18
        Width = 29
        Height = 13
        Caption = 'Linha:'
      end
      object spedColuna: TSpinEdit
        Left = 67
        Top = 14
        Width = 43
        Height = 22
        MaxValue = 30
        MinValue = 1
        TabOrder = 0
        Value = 1
      end
      object spedLinha: TSpinEdit
        Left = 163
        Top = 14
        Width = 43
        Height = 22
        MaxValue = 20
        MinValue = 1
        TabOrder = 1
        Value = 1
      end
    end
  end
  inherited Dock971: TDock97
    Top = 209
    Width = 251
    inherited tb97Fundo: TToolbar97
      Left = 167
      inherited sep3: TToolbarSep97
        Visible = False
      end
      inherited bbtnSair: TBitBtn
        Enabled = False
        Visible = False
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvTranslator
    Left = 128
    Top = 201
  end
  inherited ivTradutorPadrao: TIvTranslator
    Left = 202
    Top = 198
  end
end
