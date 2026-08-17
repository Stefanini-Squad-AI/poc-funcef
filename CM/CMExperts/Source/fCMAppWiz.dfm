inherited frmCMAppWiz: TfrmCMAppWiz
  Left = 555
  Top = 176
  Caption = 'Novo Projeto Padrão GETIF'
  ClientHeight = 215
  ClientWidth = 274
  Font.Charset = ANSI_CHARSET
  Font.Name = 'Arial'
  OldCreateOrder = True
  Visible = False
  PixelsPerInch = 96
  TextHeight = 14
  inherited PnlFundo: TPanel
    Width = 274
    Height = 178
    object Label1: TLabel
      Left = 21
      Top = 20
      Width = 130
      Height = 14
      Caption = 'Identificador do Módulo'
    end
    object Label2: TLabel
      Left = 21
      Top = 70
      Width = 111
      Height = 14
      Caption = 'Nome (Arquivo .dpr)'
    end
    object Label3: TLabel
      Left = 21
      Top = 120
      Width = 31
      Height = 14
      Caption = 'Título'
    end
    object edIDModulo: TEdit
      Left = 21
      Top = 35
      Width = 232
      Height = 22
      TabOrder = 0
      OnKeyPress = edIDModuloKeyPress
    end
    object edNomeDPR: TEdit
      Left = 21
      Top = 85
      Width = 232
      Height = 22
      TabOrder = 1
    end
    object edAppTitle: TEdit
      Left = 21
      Top = 135
      Width = 232
      Height = 22
      TabOrder = 2
    end
  end
  inherited CMOkCancelar: TCMOkCancelar
    Top = 178
    Width = 274
    OnOkClick = actOKExecute
    OnCancelarClick = ActCancelarExecute
    Buttons.BtnOk.Action = ActOk
    Buttons.BtnCancelar.Action = ActCancelar
    Buttons.BtnSair.Visible = False
    Buttons.BtnAjuda.Visible = False
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 242
  end
  object AclDialog: TActionList
    Left = 249
    Top = 61
    object ActOk: TAction
      Caption = '&Ok'
      OnExecute = actOKExecute
      OnUpdate = ActOkUpdate
    end
    object ActCancelar: TAction
      Caption = '&Cancelar'
      OnExecute = ActCancelarExecute
    end
  end
end
