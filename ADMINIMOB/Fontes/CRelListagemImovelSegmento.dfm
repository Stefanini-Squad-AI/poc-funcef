inherited cfgrellistagemimovelseg: Tcfgrellistagemimovelseg
  Left = 272
  Top = 164
  Caption = 'Listagem de Imóveis'
  ClientHeight = 284
  ClientWidth = 432
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 432
    Height = 251
    object Label1: TLabel
      Left = 16
      Top = 10
      Width = 80
      Height = 13
      Caption = 'Imóvel Mestre'
    end
    object chkArea: TCheckBox
      Left = 24
      Top = 186
      Width = 393
      Height = 17
      Caption = 'Exibir apenas os Imóveis que possuem Área Útil maior que ZERO'
      TabOrder = 4
    end
    object chkAquisicao: TCheckBox
      Left = 24
      Top = 206
      Width = 393
      Height = 17
      Caption = 'Exibir apenas os Imóveis que possuem Valor de Aquisição'
      TabOrder = 5
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
    object rdgOcupacao: TRadioGroup
      Left = 16
      Top = 54
      Width = 401
      Height = 57
      Caption = ' Exibir '
      Columns = 2
      ItemIndex = 2
      Items.Strings = (
        'Apenas Imóveis Ocupados'
        'Apenas Imóveis Vagos'
        'Todos os Imóveis')
      TabOrder = 3
    end
    object chkAtivo: TCheckBox
      Left = 24
      Top = 225
      Width = 393
      Height = 17
      Caption = 'Exibir apenas os Imóveis Ativos'
      Checked = True
      State = cbChecked
      TabOrder = 6
    end
    object rdgSegmento: TRadioGroup
      Left = 16
      Top = 117
      Width = 177
      Height = 58
      Caption = ' Agrupar Por '
      ItemIndex = 0
      Items.Strings = (
        'Segmento Gerencial'
        'Segmento SPC')
      TabOrder = 7
      OnClick = rdgSegmentoClick
    end
    object GroupBox1: TGroupBox
      Left = 199
      Top = 117
      Width = 217
      Height = 59
      Caption = ' Segmento '
      TabOrder = 8
      object dblkpFiltroSpc: TwwDBLookupCombo
        Left = 13
        Top = 25
        Width = 191
        Height = 21
        DropDownAlignment = taLeftJustify
        LookupTable = dtmLookImobiliario.qryLookSegmentoSPC
        LookupField = 'DESCARTEIRASPC'
        DropDownWidth = 191
        TabOrder = 1
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
      object dblkpFiltroGerencial: TwwDBLookupCombo
        Left = 13
        Top = 25
        Width = 191
        Height = 21
        DropDownAlignment = taLeftJustify
        LookupTable = dtmLookImobiliario.qryLookTipoImovel
        LookupField = 'DESCTIPOIMOVEL'
        DropDownWidth = 191
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 251
    Width = 432
    inherited tb97Fundo: TToolbar97
      Left = 260
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 88
    end
  end
end
