inherited FrmProcuraCliFor: TFrmProcuraCliFor
  Left = 229
  Top = 149
  Caption = 'FrmProcuraCliFor'
  ClientHeight = 124
  ClientWidth = 376
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 376
    Height = 85
    object CPForCli: TCMProcuraForCli
      Left = 16
      Top = 13
      Width = 345
      Height = 50
      Caption = ' Cliente '
      ParentShowHint = False
      ShowHint = True
      TabOrder = 0
      OnExit = CPForCliExit
      CampoEdit = ceRazaoSocial
      MostraMensagens = True
      Mensagens.EmBranco = ' não pode estar em branco'
      Mensagens.NaoExiste = ' não existe'
      PermiteChaveInvalida = False
      PermiteChaveEmBranco = True
      ForCli = fcFornecedor
      MostraEndereco = False
      StatusForCli = fcAll
    end
  end
  inherited Dock971: TDock97
    Top = 85
    Width = 376
    inherited tb97Fundo: TToolbar97
      Left = 175
      DockPos = 175
      inherited bbtnSair: TBitBtn
        Tag = 99
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 7
      DockPos = 7
      inherited bbtnCancelar: TBitBtn
        Tag = 99
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 211
    Top = 123
  end
end
