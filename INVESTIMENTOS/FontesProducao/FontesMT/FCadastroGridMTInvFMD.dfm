inherited FrmCadastroGridMTInvFMD: TFrmCadastroGridMTInvFMD
  Caption = 'FrmCadastroGridMTInvFMD'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited pnlControles: TPanel
      Top = 55
      Height = 114
    end
    inherited dbGrd: TwwDBGrid
      Top = 55
      Height = 114
    end
    object pnlDados: TPanel
      Left = 1
      Top = 1
      Width = 543
      Height = 54
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 2
    end
  end
end
