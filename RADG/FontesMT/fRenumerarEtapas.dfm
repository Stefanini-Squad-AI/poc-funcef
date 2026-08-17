inherited frmRenumerarEtapas: TfrmRenumerarEtapas
  Left = 282
  Top = 238
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Renumerar etapas'
  ClientHeight = 132
  ClientWidth = 281
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 281
    Height = 93
    object lblTxtRenumerar: TLabel
      Left = 8
      Top = 8
      Width = 265
      Height = 41
      AutoSize = False
      Caption = 
        'Indique o novo número da etapa selecionada (todas as etapas subs' +
        'eqüentes serão também renumeradas):'
      WordWrap = True
    end
    object dbspnNumero: TwwDBSpinEdit
      Left = 9
      Top = 59
      Width = 56
      Height = 21
      Increment = 1
      MaxValue = 99999
      DataField = 'NUMERO'
      TabOrder = 0
      UnboundDataType = wwDefault
    end
  end
  inherited Dock971: TDock97
    Top = 93
    Width = 281
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
    Left = 267
    Top = 115
  end
end
