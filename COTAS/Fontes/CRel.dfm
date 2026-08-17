inherited cfgRel: TcfgRel
  Left = 350
  Top = 332
  BorderStyle = bsSingle
  Caption = 'Configuração de Relatório'
  ClientHeight = 197
  ClientWidth = 436
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 436
    Height = 158
  end
  inherited Dock971: TDock97
    Top = 158
    Width = 436
    inherited tb97Fundo: TToolbar97
      Left = 264
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 95
      inherited ToolbarSep971: TToolbarSep97
        Visible = False
      end
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Enabled = False
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 65499
    Top = 65499
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
end
