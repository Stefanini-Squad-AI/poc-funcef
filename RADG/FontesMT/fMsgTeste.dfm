inherited frmMsgTeste: TfrmMsgTeste
  Left = 257
  Top = 312
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Teste de envio'
  ClientHeight = 185
  ClientWidth = 274
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 274
    Height = 146
    object lblIndique: TLabel
      Left = 8
      Top = 8
      Width = 47
      Height = 13
      Caption = 'Indique:'
    end
    object Label2: TLabel
      Left = 8
      Top = 56
      Width = 65
      Height = 13
      Caption = 'Mensagem:'
    end
    object edtDestinatario: TEdit
      Left = 8
      Top = 24
      Width = 257
      Height = 21
      TabOrder = 0
    end
    object memMensagem: TMemo
      Left = 8
      Top = 72
      Width = 257
      Height = 65
      Lines.Strings = (
        'Isto é um teste de envio.'
        'Favor desconsiderar esta mensagem.'
        ''
        'Obrigado!')
      ScrollBars = ssVertical
      TabOrder = 1
    end
  end
  inherited Dock971: TDock97
    Top = 146
    Width = 274
    inherited tb97Fundo: TToolbar97
      Left = 169
      Visible = False
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      inherited bbtnConfirmar: TBitBtn
        ModalResult = 0
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 195
    Top = 91
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
end
