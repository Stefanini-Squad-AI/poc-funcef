inherited frmPropAprovaRAD: TfrmPropAprovaRAD
  Left = 364
  Top = 229
  BorderStyle = bsSingle
  Caption = 'RAD'
  ClientHeight = 271
  ClientWidth = 378
  FormStyle = fsMDIForm
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Top = 25
    Width = 378
    Height = 207
    BorderWidth = 10
    object memObs: TMemo
      Left = 10
      Top = 27
      Width = 358
      Height = 170
      Align = alClient
      ScrollBars = ssVertical
      TabOrder = 0
    end
    object lblTopObs: TPanel
      Left = 10
      Top = 10
      Width = 358
      Height = 17
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = 'Observação:'
      TabOrder = 1
    end
  end
  inherited Dock971: TDock97
    Top = 232
    Width = 378
    inherited tb97Fundo: TToolbar97
      Left = 206
      Visible = False
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 37
      inherited bbtnConfirmar: TBitBtn
        ModalResult = 0
        OnClick = bbtnConfirmarClick
      end
    end
  end
  object pnlRessalva: TPanel [2]
    Left = 0
    Top = 0
    Width = 378
    Height = 25
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 2
    object cbRessalva: TCheckBox
      Left = 10
      Top = 5
      Width = 97
      Height = 17
      Caption = 'Com ressalva.'
      TabOrder = 0
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 251
    Top = 11
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
end
