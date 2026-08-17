inherited frmSelRub_ResciContr: TfrmSelRub_ResciContr
  Left = 187
  Top = 145
  BorderIcons = [biSystemMenu]
  BorderStyle = bsToolWindow
  Caption = 'Seleção de Rubricas para o Cálculo da Rescisão'
  ClientHeight = 333
  ClientWidth = 417
  Font.Style = []
  FormStyle = fsNormal
  Visible = False
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 417
    Height = 294
    BorderWidth = 2
    object Label1: TLabel
      Left = 12
      Top = 212
      Width = 159
      Height = 13
      Caption = 'Procura por Rubricas pelo Código'
    end
    object chklstRubrica: TColorCheckListBox
      Left = 12
      Top = 11
      Width = 394
      Height = 198
      OnClickCheck = chklstRubricaClickCheck
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ItemHeight = 13
      ParentFont = False
      Style = lbOwnerDrawFixed
      TabOrder = 0
    end
    object bbtnSelTudo: TBitBtn
      Left = 12
      Top = 254
      Width = 148
      Height = 30
      Hint = 'Seleciona Todas as Rubricas'
      Caption = '   Selecionar Todas'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 1
      OnClick = bbtnSelTudoClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333333333333333333333333333333333333300000
        0003333333388888888333333330FF9FFF0333333338FF7FFF8333333000F999
        FF0333333888F777FF83333330F099F99F03333338F877F77F83333000F09FFF
        9903333888F87FFF77833330F090FFFFF9933338F878FFFFF7733000F0900000
        00993888F8788888887730F090FFFFF9933338F878FFFFF7733330F090000000
        993338F87888888877333090FFFFF99333333878FFFFF7733333309000000099
        3333387888888877333330FFFFF99333333338FFFFF773333333300000009933
        3333388888887733333333333333333333333333333333333333}
      NumGlyphs = 2
      Spacing = 0
    end
    object bbtnInverte: TBitBtn
      Left = 258
      Top = 254
      Width = 148
      Height = 30
      Hint = 'Inverte a Seleção das Rubricas'
      Caption = '   Inverter Seleção'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = bbtnInverteClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
        3333333333333333333333333333000000003333333388888888333333330FFF
        FFF0333333338FFFFFF8333000330FFFFFF0333788338FFFFFF8333033330FFF
        FFF0333833338FFFFFF8330003330FFFFFF0337783338FFFFFF8333033330FFF
        FFF0333833338FFFFFF833333333000000003333333388888888000000003333
        333388888888333333330FF9FFF0333303338FF7FFF8333383330F999FF03330
        00338F777FF833387733099F99F033330333877F77F83333833309FFF9903300
        033387FFF778338873330FFFFF99333333338FFFFF7733333333000000099333
        3333888888877333333333333333333333333333333333333333}
      NumGlyphs = 2
      Spacing = 0
    end
    object edCodRubricas: TEdit
      Left = 12
      Top = 226
      Width = 304
      Height = 21
      Hint = 
        'Digite aqui o código das Rubricas a procurar separados por vírgu' +
        'la'
      ParentShowHint = False
      ShowHint = True
      TabOrder = 3
    end
    object sbtnMarcarRub: TBitBtn
      Left = 320
      Top = 222
      Width = 86
      Height = 28
      Caption = '   &Marcar'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -12
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      ParentShowHint = False
      ShowHint = False
      TabOrder = 4
      TabStop = False
      OnClick = sbtnMarcarRubClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        88888888888888FF8888888888888778888888888888F77F8888888888800F08
        8888888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0
        88888887788888F7F8888887FFFFFCF088888887FFF887878F888811111CCFFF
        08888877777F788F7F8881999991FFCF088887777777F87878F8998999991CFF
        F088778777777F88F78F99F899991FFCFF0877F877777F87887899FF89991CCF
        FFF077FF87777F7888F799F9F8891FFFF77877F7F8877F88F77899F99FF81FF7
        788877F77FF878F7788889999991777888888777777787788888889999988888
        8888887777788888888888888888888888888888888888888888}
      NumGlyphs = 2
      Spacing = 0
    end
  end
  inherited Dock971: TDock97
    Top = 294
    Width = 417
    inherited tb97Fundo: TToolbar97
      Left = 247
      inherited sep3: TToolbarSep97
        Visible = False
      end
      inherited bbtnSair: TBitBtn
        Enabled = False
        Visible = False
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 80
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 288
  end
end
