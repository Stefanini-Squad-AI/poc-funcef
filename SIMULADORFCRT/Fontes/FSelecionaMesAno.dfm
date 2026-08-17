inherited frmSelecionaMes: TfrmSelecionaMes
  Left = 284
  Top = 170
  Caption = 'Indique o Mês e Ano Desejados'
  ClientHeight = 158
  ClientWidth = 347
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 347
    Height = 119
    object Label1: TLabel
      Left = 111
      Top = 33
      Width = 128
      Height = 13
      Caption = 'Mês / Ano ( mm/aaaa)'
    end
    object edMesAno: TMaskEdit
      Left = 111
      Top = 51
      Width = 128
      Height = 21
      EditMask = '!99/0000;1;_'
      MaxLength = 7
      TabOrder = 0
      Text = '  /    '
    end
  end
  inherited Dock971: TDock97
    Top = 119
    Width = 347
    inherited tb97Fundo: TToolbar97
      Left = 177
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 10
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 12
    Top = 142
  end
end
