inherited FrmConfAltCont: TFrmConfAltCont
  Left = 236
  Top = 213
  Caption = 'Confirmar Alteração'
  ClientHeight = 151
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 112
    object Label1: TLabel
      Left = 183
      Top = 16
      Width = 39
      Height = 13
      Caption = 'Label1'
    end
    object Label2: TLabel
      Left = 183
      Top = 40
      Width = 39
      Height = 13
      Caption = 'Label2'
    end
    object Label3: TLabel
      Left = 183
      Top = 88
      Width = 39
      Height = 13
      Caption = 'Label3'
    end
    object lblContaOri: TLabel
      Left = 77
      Top = 16
      Width = 99
      Height = 13
      Caption = 'Conta de Origem:'
    end
    object lblNomeOri: TLabel
      Left = 23
      Top = 40
      Width = 153
      Height = 13
      Caption = 'Nome da Conta de Origem:'
    end
    object lblContaDest: TLabel
      Left = 73
      Top = 64
      Width = 103
      Height = 13
      Caption = 'Conta de Destino:'
    end
    object lblNomeDest: TLabel
      Left = 19
      Top = 88
      Width = 157
      Height = 13
      Caption = 'Nome da Conta de Destino:'
    end
    object Label4: TLabel
      Left = 183
      Top = 64
      Width = 39
      Height = 13
      Caption = 'Label4'
    end
  end
  inherited Dock971: TDock97
    Top = 112
    inherited tb97Fundo: TToolbar97
      inherited bbtnSair: TBitBtn
        Caption = '&Todos'
        ModalResult = 6
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Caption = '&Nenhum'
        ModalResult = 2
      end
    end
    inherited TB97oKCancelar: TToolbar97
      inherited bbtnConfirmar: TBitBtn
        Caption = '&Sim'
      end
      inherited bbtnCancelar: TBitBtn
        Caption = '&Não'
        ModalResult = 7
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 107
  end
end
