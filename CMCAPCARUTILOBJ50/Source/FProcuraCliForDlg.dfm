inherited FrmProcuraCliForDlg: TFrmProcuraCliForDlg
  Left = 215
  Top = 148
  Caption = 'FrmProcuraCliForDlg'
  ClientHeight = 147
  ClientWidth = 377
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 377
    Height = 108
  end
  inherited Dock971: TDock97
    Top = 108
    Width = 377
    inherited tb97Fundo: TToolbar97
      Left = 211
      DockPos = 211
      inherited bbtnSair: TBitBtn
        Tag = 99
      end
    end
  end
  object CPForCli: TCMProcuraForCli [2]
    Left = 16
    Top = 13
    Width = 345
    Height = 50
    Caption = ' Cliente '
    ParentShowHint = False
    ShowHint = True
    TabOrder = 2
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
