inherited Frmselversoch: TFrmselversoch
  Left = 233
  Top = 188
  BorderIcons = [biSystemMenu]
  Caption = 'Campos a serem impressos no verso do cheque'
  ClientHeight = 274
  ClientWidth = 327
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 327
    Height = 235
    object grpOutros: TGroupBox
      Left = 36
      Top = 66
      Width = 271
      Height = 151
      Enabled = False
      TabOrder = 0
      object chkdocto: TCheckBox
        Left = 15
        Top = 18
        Width = 161
        Height = 17
        Caption = 'Nº Documento'
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object chkdtprog: TCheckBox
        Left = 15
        Top = 40
        Width = 129
        Height = 17
        Caption = 'Data Programada'
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
      object chkvalor: TCheckBox
        Left = 15
        Top = 61
        Width = 97
        Height = 17
        Caption = 'Valor'
        Checked = True
        State = cbChecked
        TabOrder = 2
      end
      object chkforn: TCheckBox
        Left = 15
        Top = 82
        Width = 97
        Height = 17
        Caption = 'Fornecedor'
        Checked = True
        State = cbChecked
        TabOrder = 3
      end
      object chkhist: TCheckBox
        Left = 15
        Top = 104
        Width = 97
        Height = 17
        Caption = 'Histórico'
        Checked = True
        State = cbChecked
        TabOrder = 4
      end
      object chklocal: TCheckBox
        Left = 15
        Top = 125
        Width = 137
        Height = 17
        Caption = 'Local de emissão'
        Checked = True
        State = cbChecked
        TabOrder = 5
      end
    end
    object rbdestinase: TRadioButton
      Left = 18
      Top = 17
      Width = 193
      Height = 17
      Caption = 'Destina-se este cheque para:'
      Checked = True
      TabOrder = 1
      TabStop = True
      OnClick = rbdestinaseClick
    end
    object rbOutros: TRadioButton
      Left = 18
      Top = 49
      Width = 111
      Height = 17
      Caption = 'Outros campos'
      TabOrder = 2
      OnClick = rbOutrosClick
    end
  end
  inherited Dock971: TDock97
    Top = 235
    Width = 327
    inherited tb97Fundo: TToolbar97
      Left = 167
      DockPos = 168
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      DockPos = 0
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 275
  end
end
