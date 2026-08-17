inherited cfgRelQuadroImoveis: TcfgRelQuadroImoveis
  Left = 160
  Top = 149
  Caption = 'Quadro de Aluguéis por m2'
  ClientHeight = 255
  ClientWidth = 435
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 435
    Height = 222
    object Label1: TLabel
      Left = 16
      Top = 10
      Width = 80
      Height = 13
      Caption = 'Imóvel Mestre'
    end
    object Bevel3: TBevel
      Left = 16
      Top = 151
      Width = 401
      Height = 2
      Shape = bsTopLine
    end
    object chkCusto: TCheckBox
      Left = 344
      Top = 126
      Width = 393
      Height = 17
      Caption = 'Exibir apenas os Imóveis que possuem Custo Contábil'
      Enabled = False
      TabOrder = 5
      Visible = False
    end
    object chkArea: TCheckBox
      Left = 24
      Top = 114
      Width = 393
      Height = 17
      Caption = 'Exibir apenas os Imóveis que possuem Área maior que ZERO'
      Checked = True
      State = cbChecked
      TabOrder = 4
    end
    object chkAluguel: TCheckBox
      Left = 24
      Top = 88
      Width = 393
      Height = 17
      Caption = 'Exibir apenas os Imóveis que possuem Aluguel maior que ZERO'
      Checked = True
      State = cbChecked
      TabOrder = 3
    end
    object chkCorLinha: TCheckBox
      Left = 24
      Top = 191
      Width = 233
      Height = 17
      Caption = 'Imprimir linhas com cores alternadas: '
      Checked = True
      State = cbChecked
      TabOrder = 6
    end
    object cboCorLinha: TfcColorCombo
      Left = 260
      Top = 189
      Width = 129
      Height = 21
      AlignmentVertical = fcavCenter
      AutoSelect = False
      ColorDialogOptions = []
      ColorListOptions.ColorWidth = 119
      ColorListOptions.Font.Charset = DEFAULT_CHARSET
      ColorListOptions.Font.Color = clWindowText
      ColorListOptions.Font.Height = -11
      ColorListOptions.Font.Name = 'MS Sans Serif'
      ColorListOptions.Font.Style = []
      ColorListOptions.GreyScaleIncrement = 1
      ColorListOptions.Options = [ccoShowCustomColors]
      CustomColors.Strings = (
        'ColorA=FFFFFF'
        'ColorC=00C0FFFF'
        'ColorD=00C6F9CC'
        'ColorE=00F3E6CD'
        'ColorF=00A0A0A0'
        'ColorG=00BEBEBE'
        'ColorH=00D2D2D2'
        'ColorI=00E3E3E3')
      DropDownCount = 8
      DropDownWidth = 119
      ReadOnly = False
      ShowMatchText = False
      SelectedColor = clWhite
      TabOrder = 7
    end
    object chkLinhas: TCheckBox
      Left = 24
      Top = 167
      Width = 225
      Height = 17
      Caption = 'Imprimir linhas separadoras'
      TabOrder = 8
    end
    object edtImovelMestre: TEdit
      Left = 16
      Top = 24
      Width = 353
      Height = 21
      Enabled = False
      TabOrder = 0
    end
    object btnBuscaImovelMestre: TBitBtn
      Left = 368
      Top = 24
      Width = 24
      Height = 22
      Hint = 'Busca um Imóvel Mestre'
      TabOrder = 1
      OnClick = btnBuscaImovelMestreClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
        777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
        77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
        77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
        077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
        FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
        F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
        7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
        777777787FFF8777777777770000777777777777888877777777}
      NumGlyphs = 2
    end
    object btnLimpaImovelMestre: TBitBtn
      Left = 392
      Top = 24
      Width = 24
      Height = 22
      Hint = 'Limpa a seleção de Imóvel Mestre'
      TabOrder = 2
      OnClick = btnLimpaImovelMestreClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        88888888888FF8888888888888008888888888888F77F8888888888800F08888
        8888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0888
        88887788888F788888887FFFFFCF888888887F88FF7888FF88887FFCCCF88008
        888878F777888778F88887FFFF880110888887F88F8878878F8887FFC8809991
        0888878F7887F88878F8887FF88099991088887F88878F88878F887FF8880999
        03088878F88878F878788887F8888090B03088878F888787878788887888880B
        0B038888788888787878888888888880B0B38888888888878788888888888888
        0BBB88888888888878F888888888888880BB8888888888888788}
      NumGlyphs = 2
    end
    object chkDesconto: TCheckBox
      Left = 24
      Top = 61
      Width = 393
      Height = 17
      Caption = 'Considerar Descontos programados nos contratos'
      Checked = True
      State = cbChecked
      TabOrder = 9
    end
  end
  inherited Dock971: TDock97
    Top = 222
    Width = 435
    inherited tb97Fundo: TToolbar97
      Left = 263
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 91
    end
  end
end
