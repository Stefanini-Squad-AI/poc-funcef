inherited frmLimpeza: TfrmLimpeza
  Left = 239
  Top = 194
  HelpContext = 4650022
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Limpeza de Sistema'
  ClientHeight = 225
  ClientWidth = 412
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 412
    Height = 186
    object Panel1: TPanel
      Left = 10
      Top = 98
      Width = 391
      Height = 71
      BevelOuter = bvLowered
      TabOrder = 2
      object Animate: TAnimate
        Left = 45
        Top = 5
        Width = 304
        Height = 60
        Active = False
        CommonAVI = aviDeleteFile
        StopFrame = 24
      end
    end
    object pnlChecks: TPanel
      Left = 10
      Top = 98
      Width = 391
      Height = 71
      BevelOuter = bvLowered
      TabOrder = 1
      object chkLimpaRegTemp: TCheckBox
        Left = 11
        Top = 38
        Width = 198
        Height = 17
        Caption = 'Apagar &registros temporários.'
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object chkLimpaArqTemp: TCheckBox
        Left = 11
        Top = 14
        Width = 185
        Height = 17
        Caption = 'Apagar &arquivos temporários.'
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
    end
    object GroupBox1: TGroupBox
      Left = 10
      Top = 9
      Width = 391
      Height = 87
      Caption = 'Atenção'
      TabOrder = 0
      object Memo1: TMemo
        Left = 8
        Top = 16
        Width = 373
        Height = 61
        Lines.Strings = (
          'O procedimento de limpeza do sistema irá apagar dados de '
          'tabelas e arquivos temporários do Auto-Atendimento otimizando '
          'o sistema. Caso haja algum usuário conectado, sua conexão '
          'será interrompida.')
        ReadOnly = True
        TabOrder = 0
      end
    end
  end
  inherited Dock971: TDock97
    Top = 186
    Width = 412
    inherited tb97Fundo: TToolbar97
      Left = 240
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 71
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 363
    Top = 107
    TargetsData = (
      1
      2
      (
        'TMemo'
        'Text'
        0)
      (
        ''
        'Lines'
        0))
  end
end
