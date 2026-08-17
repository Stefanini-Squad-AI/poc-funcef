inherited frmPropAprovaRAD: TfrmPropAprovaRAD
  BorderStyle = bsSingle
  Caption = 'RAD'
  ClientHeight = 271
  ClientWidth = 378
  FormStyle = fsMDIForm
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Top = 73
    Width = 378
    Height = 159
    BorderWidth = 10
    TabOrder = 2
    object memParecer: TMemo
      Left = 10
      Top = 27
      Width = 358
      Height = 122
      Align = alClient
      ScrollBars = ssVertical
      TabOrder = 0
    end
    object lblTopParecer: TPanel
      Left = 10
      Top = 10
      Width = 358
      Height = 17
      Align = alTop
      Alignment = taLeftJustify
      BevelOuter = bvNone
      Caption = 'Parecer:'
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
  object pnlEncaminha: TPanel [2]
    Left = 0
    Top = 25
    Width = 378
    Height = 48
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 1
    object lblAndamento: TLabel
      Left = 10
      Top = 7
      Width = 68
      Height = 13
      Caption = 'Andamento:'
    end
    object cmbAndamento: TComboBox
      Left = 10
      Top = 22
      Width = 358
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
    end
  end
  object pnlAutoriza: TPanel [3]
    Left = 0
    Top = 0
    Width = 378
    Height = 25
    Align = alTop
    BevelOuter = bvNone
    TabOrder = 0
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
