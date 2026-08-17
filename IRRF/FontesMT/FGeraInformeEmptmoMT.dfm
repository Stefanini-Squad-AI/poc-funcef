inherited FrmGeraInformeEmptmoMT: TFrmGeraInformeEmptmoMT
  Left = 155
  Top = 68
  Caption = 'Informe do Empréstimo'
  ClientHeight = 462
  ClientWidth = 375
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 375
    Height = 423
    object grbCaminhoArquivos: TGroupBox
      Left = 1
      Top = 41
      Width = 373
      Height = 209
      Align = alClient
      Caption = 'Gravar Arquivos'
      TabOrder = 2
      object lblAtivoCaixa: TLabel
        Left = 8
        Top = 69
        Width = 65
        Height = 13
        Caption = 'Ativo Caixa'
      end
      object sbtnGravaArqAtivo: TSpeedButton
        Left = 320
        Top = 25
        Width = 32
        Height = 22
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          555555500000000000005577777777777700557FB8B8B8B8B70057FB8B8B8B8B
          807057F8B8B8B8B870707F8B8B8B8B8B07707FFFFFFFFFF70870777777777777
          7B7057F8B8B8B8B8B87057FB8B8B8FFFFF7057F8B8B8F7777775557FFFFF7555
          5555555777775555555555555555555555555555555555555555}
        OnClick = sbtnGravaArqAtivoClick
      end
      object lblOutrasSit: TLabel
        Left = 8
        Top = 184
        Width = 28
        Height = 13
        Caption = 'Lef'#39's'
      end
      object sbtnGravaArqOutrasSit: TSpeedButton
        Left = 320
        Top = 179
        Width = 32
        Height = 24
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          555555500000000000005577777777777700557FB8B8B8B8B70057FB8B8B8B8B
          807057F8B8B8B8B870707F8B8B8B8B8B07707FFFFFFFFFF70870777777777777
          7B7057F8B8B8B8B8B87057FB8B8B8FFFFF7057F8B8B8F7777775557FFFFF7555
          5555555777775555555555555555555555555555555555555555}
        OnClick = sbtnGravaArqOutrasSitClick
      end
      object Label1: TLabel
        Left = 8
        Top = 29
        Width = 73
        Height = 13
        Caption = 'Ativo Funcef'
      end
      object lblFacultativo: TLabel
        Left = 8
        Top = 104
        Width = 64
        Height = 13
        Caption = 'Facultativo'
      end
      object lblAssistido: TLabel
        Left = 8
        Top = 144
        Width = 57
        Height = 13
        Caption = 'Assistidos'
      end
      object sbtnGravaArqFacultativo: TSpeedButton
        Left = 320
        Top = 100
        Width = 32
        Height = 22
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          555555500000000000005577777777777700557FB8B8B8B8B70057FB8B8B8B8B
          807057F8B8B8B8B870707F8B8B8B8B8B07707FFFFFFFFFF70870777777777777
          7B7057F8B8B8B8B8B87057FB8B8B8FFFFF7057F8B8B8F7777775557FFFFF7555
          5555555777775555555555555555555555555555555555555555}
        OnClick = sbtnGravaArqFacultativoClick
      end
      object sbtnGravaArqAssistido: TSpeedButton
        Left = 320
        Top = 140
        Width = 32
        Height = 21
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          555555500000000000005577777777777700557FB8B8B8B8B70057FB8B8B8B8B
          807057F8B8B8B8B870707F8B8B8B8B8B07707FFFFFFFFFF70870777777777777
          7B7057F8B8B8B8B8B87057FB8B8B8FFFFF7057F8B8B8F7777775557FFFFF7555
          5555555777775555555555555555555555555555555555555555}
        OnClick = sbtnGravaArqAssistidoClick
      end
      object sbtnGravaArqAtivoCaixa: TSpeedButton
        Left = 320
        Top = 62
        Width = 32
        Height = 24
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          555555500000000000005577777777777700557FB8B8B8B8B70057FB8B8B8B8B
          807057F8B8B8B8B870707F8B8B8B8B8B07707FFFFFFFFFF70870777777777777
          7B7057F8B8B8B8B8B87057FB8B8B8FFFFF7057F8B8B8F7777775557FFFFF7555
          5555555777775555555555555555555555555555555555555555}
        OnClick = sbtnGravaArqAtivoCaixaClick
      end
      object edtGravaArqAtivo: TEdit
        Left = 98
        Top = 25
        Width = 215
        Height = 21
        TabOrder = 0
        OnChange = edtGravaArqAtivoChange
      end
      object edtGravaArqOutrasSit: TEdit
        Left = 98
        Top = 179
        Width = 214
        Height = 21
        TabOrder = 4
        OnChange = edtGravaArqOutrasSitChange
      end
      object edtGravaArqAssistidos: TEdit
        Left = 98
        Top = 140
        Width = 214
        Height = 21
        TabOrder = 3
        OnChange = edtGravaArqAssistidosChange
      end
      object edtGravaArqFacultativo: TEdit
        Left = 98
        Top = 100
        Width = 215
        Height = 21
        TabOrder = 2
        OnChange = edtGravaArqFacultativoChange
      end
      object edtGravaArqAtivoCaixa: TEdit
        Left = 98
        Top = 62
        Width = 214
        Height = 21
        TabOrder = 1
        OnChange = edtGravaArqAtivoCaixaChange
      end
    end
    object grbAnoBase: TGroupBox
      Left = 1
      Top = 1
      Width = 373
      Height = 40
      Align = alTop
      TabOrder = 0
      object lblAnoBase: TLabel
        Left = 16
        Top = 16
        Width = 55
        Height = 13
        Caption = 'Ano Base'
      end
      object edtData: TEdit
        Left = 76
        Top = 11
        Width = 59
        Height = 21
        TabOrder = 0
        Text = '2005'
      end
      object UpDown1: TUpDown
        Left = 135
        Top = 11
        Width = 16
        Height = 21
        Associate = edtData
        Min = 0
        Max = 3000
        Position = 2005
        TabOrder = 1
        Thousands = False
        Wrap = False
      end
    end
    object grbIndivdual: TGroupBox
      Left = 1
      Top = 294
      Width = 373
      Height = 101
      Align = alBottom
      TabOrder = 1
      object pnlGeraIndiv: TPanel
        Left = 2
        Top = 11
        Width = 369
        Height = 88
        Align = alBottom
        BevelOuter = bvNone
        Enabled = False
        TabOrder = 0
        object lblCPF: TLabel
          Left = 5
          Top = 4
          Width = 24
          Height = 13
          Caption = 'CPF'
        end
        object lblNomeParticip: TLabel
          Left = 5
          Top = 42
          Width = 91
          Height = 13
          Caption = 'Nome do Titular'
        end
        object sbtnAddFav: TSpeedButton
          Left = 294
          Top = 55
          Width = 23
          Height = 22
          Hint = 'Escolher o favorecido que será processado'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            33333333333333333333333333333333333333333333333333FF333333333333
            3000333333FFFFF3F77733333000003000B033333777773777F733330BFBFB00
            E00033337FFF3377F7773333000FBFB0E000333377733337F7773330FBFBFBF0
            E00033F7FFFF3337F7773000000FBFB0E000377777733337F7770BFBFBFBFBF0
            E00073FFFFFFFF37F777300000000FB0E000377777777337F7773333330BFB00
            000033333373FF77777733333330003333333333333777333333333333333333
            3333333333333333333333333333333333333333333333333333333333333333
            3333333333333333333333333333333333333333333333333333}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = sbtnAddFavClick
        end
        object sbtnRemFav: TSpeedButton
          Left = 320
          Top = 55
          Width = 23
          Height = 22
          Hint = 'Apagar o favorecido selecionado'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
            55555FFFFFFF5F55FFF5777777757559995777777775755777F7555555555550
            305555555555FF57F7F555555550055BB0555555555775F777F55555550FB000
            005555555575577777F5555550FB0BF0F05555555755755757F555550FBFBF0F
            B05555557F55557557F555550BFBF0FB005555557F55575577F555500FBFBFB0
            B05555577F555557F7F5550E0BFBFB00B055557575F55577F7F550EEE0BFB0B0
            B05557FF575F5757F7F5000EEE0BFBF0B055777FF575FFF7F7F50000EEE00000
            B0557777FF577777F7F500000E055550805577777F7555575755500000555555
            05555777775555557F5555000555555505555577755555557555}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = sbtnRemFavClick
        end
        object medCPF: TMaskEdit
          Left = 5
          Top = 17
          Width = 107
          Height = 21
          EditMask = '!999.999.999-99;0; '
          MaxLength = 14
          ReadOnly = True
          TabOrder = 0
        end
        object edtNomeParticip: TEdit
          Left = 5
          Top = 55
          Width = 282
          Height = 21
          ReadOnly = True
          TabOrder = 1
        end
        object chkGeraIndiv: TCheckBox
          Left = 191
          Top = 22
          Width = 146
          Height = 17
          Caption = 'Geração Individual'
          TabOrder = 2
          Visible = False
          OnClick = chkGeraIndivClick
        end
      end
    end
    object ProgressBar1: TProgressBar
      Left = 1
      Top = 395
      Width = 373
      Height = 27
      Align = alBottom
      Min = 0
      Max = 100
      TabOrder = 3
    end
    object rdgGeraArq: TRadioGroup
      Left = 1
      Top = 250
      Width = 373
      Height = 44
      Align = alBottom
      Caption = 'Gerar arquivo'
      Columns = 3
      ItemIndex = 0
      Items.Strings = (
        'Individual'
        'Marcados'
        'Todos')
      TabOrder = 4
      OnClick = rdgGeraArqClick
    end
  end
  inherited Dock971: TDock97
    Top = 423
    Width = 375
    inherited tb97Fundo: TToolbar97
      Left = 226
      DockPos = 398
      inherited sep1: TToolbarSep97
        Left = 142
      end
      inherited sep3: TToolbarSep97
        Left = 67
      end
      inherited bbtnSair: TBitBtn
        Width = 67
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 70
        Width = 72
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 18
      inherited ToolbarSep971: TToolbarSep97
        Left = 120
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 120
        Caption = '&Gerar Arquivo'
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Left = 123
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 67
    Top = 410
  end
  object MontaSelect1: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'P.NUMDOCUMENTO'
      'P.NOME'
      'D.MATRICULA')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'CPF'
      'Nome'
      'Matrícula')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA P'
      'DEPENTIT D')
    CamposChave.Strings = (
      'P.IDPESSOA'
      'P.NOME'
      'P.NUMDOCUMENTO'
      'D.MATRICULA')
    Filtro.Strings = (
      'D.IDPESSOA = P.IDPESSOA')
    Mascaras.Strings = (
      '!999.999.999-99;0; '
      ''
      '')
    Larguras.Strings = (
      '15'
      '40'
      '15')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = True
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 97
    Top = 408
  end
  object svdGravaArqAtivo: TSaveDialog
    InitialDir = 'c:\'
    Left = 107
    Top = 360
  end
  object svdGravaArqOutrasSit: TSaveDialog
    InitialDir = 'c:\'
    Left = 35
    Top = 384
  end
  object svdGravaArqAtivoCaixa: TSaveDialog
    DefaultExt = 'txt'
    InitialDir = 'c:\'
    Left = 179
    Top = 376
  end
  object svdGravaArqFacultativo: TSaveDialog
    DefaultExt = 'txt'
    InitialDir = 'c:\'
    Left = 243
    Top = 376
  end
  object svdGravaArqAssistido: TSaveDialog
    InitialDir = 'c:\'
    Left = 315
    Top = 376
  end
end
