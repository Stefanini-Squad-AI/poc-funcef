inherited FrmDesfazAcertaValorMT: TFrmDesfazAcertaValorMT
  Left = 546
  Top = 187
  Caption = 'Desfaz Compensa Valor Negativo'
  ClientHeight = 79
  ClientWidth = 630
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 630
    Height = 40
    object pnlAnoAcertto: TPanel
      Left = 1
      Top = 1
      Width = 628
      Height = 39
      Align = alTop
      TabOrder = 0
      object Label1: TLabel
        Left = 8
        Top = 11
        Width = 86
        Height = 13
        Caption = 'Ano do Acerto:'
      end
      object edtAnoAcerto: TEdit
        Left = 96
        Top = 8
        Width = 97
        Height = 21
        TabOrder = 0
        Text = '2002'
      end
      object udAcerto: TUpDown
        Left = 193
        Top = 8
        Width = 16
        Height = 21
        Associate = edtAnoAcerto
        Min = 2002
        Max = 3000
        Position = 2002
        TabOrder = 1
        Thousands = False
        Wrap = False
      end
      object chkUsaLista: TCheckBox
        Left = 242
        Top = 10
        Width = 262
        Height = 17
        Caption = 'Utiliza Lista Individual de Processamento'
        TabOrder = 2
        OnClick = chkUsaListaClick
      end
    end
    object pnlFrameLista: TPanel
      Left = 1
      Top = 40
      Width = 628
      Height = 235
      Align = alClient
      TabOrder = 1
      inline FrameBenef: TfrmFrameListaBenef
        Left = 1
        Top = 1
        Width = 626
        Height = 233
        Align = alClient
        inherited Panel3: TPanel
          Width = 626
          inherited Dock971: TDock97
            Width = 624
            inherited TB97oKCancelar: TToolbar97
              inherited lblQuant: TLabel
                Left = 514
                Width = 5
              end
              inherited bbtnIncluiLista: TBitBtn
                Width = 121
              end
              inherited bbtnExcluiTudo: TBitBtn
                Left = 395
                Width = 119
              end
            end
          end
        end
        inherited dbgrdPessoas: TwwDBGrid
          Width = 626
          Height = 199
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 40
    Width = 630
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        Caption = '&Desfazer'
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 99
    Top = 235
  end
end
