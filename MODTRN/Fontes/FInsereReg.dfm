inherited frmInsereReg: TfrmInsereReg
  Left = 309
  Top = 227
  BorderStyle = bsSingle
  Caption = 'Insere'
  ClientHeight = 193
  ClientWidth = 325
  FormStyle = fsNormal
  Visible = False
  OnClose = nil
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 325
    Height = 154
    BorderWidth = 2
    object rgInsere: TRadioGroup
      Left = 23
      Top = 14
      Width = 280
      Height = 122
      Caption = 'Mantém no Novo Registro'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ItemIndex = 0
      Items.Strings = (
        'Nada'
        'Identificação da Pessoa'
        'Demais Dados Atuais'
        'Tudo'
        'Cancela a Inserção de Novo Registro')
      ParentFont = False
      TabOrder = 0
    end
  end
  inherited Dock971: TDock97
    Top = 154
    Width = 325
    inherited tb97Fundo: TToolbar97
      Left = 159
      DockPos = 197
      inherited bbtnSair: TBitBtn
        ModalResult = 1
      end
    end
  end
end
