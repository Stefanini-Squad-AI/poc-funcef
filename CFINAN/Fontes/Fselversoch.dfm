inherited Frmselversoch: TFrmselversoch
  Left = 233
  Top = 188
  BorderIcons = [biSystemMenu]
  Caption = 'Campos a serem impressos no verso do cheque'
  ClientHeight = 206
  ClientWidth = 344
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 344
    Height = 167
    object chkdocto: TCheckBox
      Left = 23
      Top = 32
      Width = 161
      Height = 17
      Caption = 'Nº Documento'
      Checked = True
      State = cbChecked
      TabOrder = 0
    end
    object chkvalor: TCheckBox
      Left = 23
      Top = 75
      Width = 97
      Height = 17
      Caption = 'Valor'
      Checked = True
      State = cbChecked
      TabOrder = 1
    end
    object chkforn: TCheckBox
      Left = 23
      Top = 96
      Width = 97
      Height = 17
      Caption = 'Fornecedor'
      Checked = True
      State = cbChecked
      TabOrder = 2
    end
    object chkdtprog: TCheckBox
      Left = 23
      Top = 54
      Width = 129
      Height = 17
      Caption = 'Data Programada'
      Checked = True
      State = cbChecked
      TabOrder = 3
    end
    object chkdestinase: TCheckBox
      Left = 23
      Top = 11
      Width = 193
      Height = 17
      Caption = 'Destina-se este cheque para:'
      Checked = True
      State = cbChecked
      TabOrder = 4
    end
    object chkhist: TCheckBox
      Left = 23
      Top = 118
      Width = 97
      Height = 17
      Caption = 'Histórico'
      Checked = True
      State = cbChecked
      TabOrder = 5
    end
    object chklocal: TCheckBox
      Left = 23
      Top = 139
      Width = 137
      Height = 17
      Caption = 'Local de emissão'
      Checked = True
      State = cbChecked
      TabOrder = 6
    end
  end
  inherited Dock971: TDock97
    Top = 167
    Width = 344
    inherited tb97Fundo: TToolbar97
      Left = 168
      DockPos = 168
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      DockPos = 0
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 227
    Top = 187
  end
end
