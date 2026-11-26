inherited frmPRelPendencia: TfrmPRelPendencia
  Left = 63
  Top = 63
  HelpContext = 180108
  Caption = 'Relatório de Rubricas de Desconto Pendentes de Processamento'
  ClientHeight = 425
  ClientWidth = 675
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 675
    Height = 386
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 673
      Height = 384
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 0
      object gbVersao: TGroupBox
        Left = 1
        Top = 1
        Width = 671
        Height = 156
        Align = alTop
        Caption = 'Versões'
        TabOrder = 0
        object chklstversao: TCheckListBox
          Left = 2
          Top = 15
          Width = 667
          Height = 139
          Align = alClient
          ItemHeight = 13
          TabOrder = 0
          OnClick = chklstVersaoClick
        end
      end
      object gbRubricas: TGroupBox
        Left = 1
        Top = 157
        Width = 671
        Height = 156
        Align = alTop
        Caption = 'Rubricas'
        TabOrder = 1
        object chklstRubricas: TCheckListBox
          Left = 2
          Top = 15
          Width = 667
          Height = 139
          Align = alClient
          ItemHeight = 13
          TabOrder = 0
          OnClick = chklstRubricasClick
        end
      end
      object rdgOrdem: TRadioGroup
        Left = 1
        Top = 313
        Width = 671
        Height = 60
        Align = alTop
        Caption = 'Por Ordem  de'
        ItemIndex = 0
        Items.Strings = (
          'Matricula'
          'Nome do Recebedor')
        TabOrder = 2
      end
    end
  end
  inherited Dock971: TDock97
    Top = 386
    Width = 675
    inherited tb97Fundo: TToolbar97
      Left = 439
      DockPos = 439
      inherited sep1: TToolbarSep97
        Left = 83
      end
      inherited sep3: TToolbarSep97
        Left = 169
      end
      inherited bbtnSair: TBitBtn
        Width = 83
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 86
        Width = 83
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 270
      DockPos = 270
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 323
    Top = 11
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
end
