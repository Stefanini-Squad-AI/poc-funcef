inherited frmMesInicioRelSaldoFab: TfrmMesInicioRelSaldoFab
  Left = 441
  Top = 296
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Mês de Referência'
  ClientHeight = 131
  ClientWidth = 298
  FormStyle = fsNormal
  Position = poMainFormCenter
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 298
    Height = 92
    BevelInner = bvLowered
    object Label2: TLabel
      Left = 10
      Top = 14
      Width = 272
      Height = 26
      Alignment = taCenter
      Caption = 
        'É necessário informar o mês de referência para geração do relató' +
        'rio Saldo FAB'
      WordWrap = True
    end
    object edMesRef: TMaskEdit
      Left = 117
      Top = 54
      Width = 63
      Height = 21
      EditMask = '!0000/00;1;_'
      MaxLength = 7
      TabOrder = 0
      Text = '    /  '
    end
  end
  inherited Dock971: TDock97
    Top = 92
    Width = 298
    inherited tb97Fundo: TToolbar97
      Left = 126
      inherited bbtnAjuda: TmaHelpBitBtn
        Visible = False
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 37
      DockPos = 96
      inherited ToolbarSep971: TToolbarSep97
        Left = 82
      end
      inherited bbtnConfirmar: TBitBtn
        ModalResult = 0
        TabOrder = 1
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 81
        Width = 1
        TabOrder = 0
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      3
      (
        ''
        'Filter'
        0)
      (
        'TRichEdit'
        'Text'
        0)
      (
        'TRealEdit'
        'Text'
        0))
  end
end
