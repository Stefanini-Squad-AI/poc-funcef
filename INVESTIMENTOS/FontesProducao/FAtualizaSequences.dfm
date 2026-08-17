inherited frmAtualizaSequences: TfrmAtualizaSequences
  Left = 255
  Top = 234
  Caption = 'Processo'
  ClientHeight = 171
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 132
    inherited pnlTitulo: TPanel
      inherited lbNomDescricao: TfcLabel
        Width = 333
        Caption = 'Atualiza os Sequences do Banco'
      end
    end
    inline fraMensAtuSeq: TfraMensagem
      Left = 1
      Top = 45
      Width = 526
      Height = 57
      Align = alClient
      TabOrder = 1
      inherited pnlProgresso: TPanel
        Width = 526
        Height = 57
        inherited pnlProgressoMensagem: TPanel
          Width = 184
          Height = 55
          inherited lblProgressoMensagem: TfcLabel
            Width = 182
            Height = 53
          end
        end
        inherited pnlProgressoBarra: TPanel
          Left = 185
          Width = 340
          Height = 55
          inherited pgbProcesso: TProgressBar
            Width = 338
            Height = 53
          end
        end
      end
    end
    object pnlProgTab: TPanel
      Left = 1
      Top = 102
      Width = 526
      Height = 29
      Align = alBottom
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 2
      object prgProgTab: TProgressBar
        Left = 2
        Top = 2
        Width = 522
        Height = 25
        Align = alClient
        Min = 0
        Max = 100
        TabOrder = 0
      end
    end
  end
  inherited Dock971: TDock97
    Top = 132
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
end
