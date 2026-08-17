object FrmVinculaOrcadoAtualizacao: TFrmVinculaOrcadoAtualizacao
  Left = 433
  Top = 219
  BorderStyle = bsNone
  Caption = 'FrmVinculaOrcadoAtualizacao'
  ClientHeight = 206
  ClientWidth = 578
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnClose = FormClose
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object GaProgresso: TGauge
    Left = 6
    Top = 147
    Width = 563
    Height = 20
    ForeColor = clNavy
    Progress = 0
  end
  object lblStatus: TLabel
    Left = 8
    Top = 126
    Width = 131
    Height = 13
    Caption = 'Pronto para começar...'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object lbl1: TLabel
    Left = 0
    Top = 0
    Width = 578
    Height = 20
    Align = alTop
    Alignment = taCenter
    Caption = 'Atualização de Grupos Orçamentários pela Contabilidade'
    Font.Charset = ANSI_CHARSET
    Font.Color = clNavy
    Font.Height = -16
    Font.Name = 'Arial Narrow'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label1: TLabel
    Left = 108
    Top = 44
    Width = 81
    Height = 13
    Caption = 'Grupo Inicial: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label2: TLabel
    Left = 316
    Top = 44
    Width = 74
    Height = 13
    Caption = 'Grupo Final: '
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clWindowText
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label3: TLabel
    Left = 0
    Top = 180
    Width = 578
    Height = 13
    Align = alBottom
    Alignment = taCenter
    Caption = 
      '*Este processo apenas atualiza o vínculo de contas orçamentárias' +
      ' com contas contábeis'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object Label4: TLabel
    Left = 0
    Top = 193
    Width = 578
    Height = 13
    Align = alBottom
    Alignment = taCenter
    Caption = 'Este processo não insere ou altera contas orçamentárias'
    Font.Charset = DEFAULT_CHARSET
    Font.Color = clRed
    Font.Height = -11
    Font.Name = 'MS Sans Serif'
    Font.Style = [fsBold]
    ParentFont = False
  end
  object btnFechar: TBitBtn
    Left = 7
    Top = 78
    Width = 75
    Height = 25
    Caption = 'Cancelar'
    ModalResult = 1
    TabOrder = 0
    OnClick = btnFecharClick
  end
  object btnIniciar: TBitBtn
    Left = 7
    Top = 43
    Width = 75
    Height = 25
    Caption = 'Iniciar'
    ModalResult = 1
    TabOrder = 1
    OnClick = btnIniciarClick
    Glyph.Data = {
      76010000424D7601000000000000760000002800000020000000100000000100
      0400000000000001000000000000000000001000000010000000000000000000
      8000008000000080800080000000800080008080000080808000C0C0C0000000
      FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
      8888888888FFFFF8888888888000008888888888F777778FF888888006666600
      88888887788888778F88887666666666088888788888888878F887E666666666
      608887F8888F888887F887E666F66666608887888878F888878F7E6666FF6666
      66087F8888778F88887F7E6666FFF66666087F88887778F8887F7E6666FFFF66
      66087F8888777788887F7E6666FFF66666087F8888777888887F7E6666FF6666
      660878F888778888887887E666F66666608887F88878888887F887E666666666
      6088878F888888888788887EE666666608888878FF88888F788888877EEEEE77
      8888888778FFFF77888888888777778888888888877777888888}
    NumGlyphs = 2
  end
  object edtGrupoInicial: TEdit
    Left = 188
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 2
  end
  object edtGrupoFinal: TEdit
    Left = 392
    Top = 40
    Width = 121
    Height = 21
    TabOrder = 3
  end
end
