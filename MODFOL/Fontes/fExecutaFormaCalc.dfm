inherited frmExecutaFormaCalc: TfrmExecutaFormaCalc
  Left = 171
  Top = 73
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Execução de Regras ou Formas de Cálculo'
  ClientHeight = 445
  ClientWidth = 615
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 615
    Height = 406
    BorderWidth = 2
    object Panel2: TPanel
      Left = 4
      Top = 4
      Width = 607
      Height = 108
      Align = alTop
      BevelOuter = bvNone
      TabOrder = 0
      object Label9: TLabel
        Left = 8
        Top = 38
        Width = 193
        Height = 13
        Caption = 'Nome da Regra/Forma de Cálculo'
      end
      object Label2: TLabel
        Left = 9
        Top = 1
        Width = 40
        Height = 13
        Caption = 'Código'
      end
      object Label3: TLabel
        Left = 147
        Top = 1
        Width = 186
        Height = 13
        Caption = 'Tipo de Regra/Forma de Cálculo'
      end
      object Bevel1: TBevel
        Left = 456
        Top = -1
        Width = 8
        Height = 120
        Shape = bsLeftLine
      end
      object Label12: TLabel
        Left = 76
        Top = 82
        Width = 35
        Height = 13
        Caption = 'Regra'
      end
      object Label13: TLabel
        Left = 238
        Top = 82
        Width = 99
        Height = 13
        Caption = 'Forma de Cálculo'
      end
      object edtNumero: TEdit
        Left = 8
        Top = 15
        Width = 121
        Height = 21
        TabStop = False
        TabOrder = 0
        OnExit = edtNumeroExit
      end
      object btnConsultar: TBitBtn
        Left = 465
        Top = 15
        Width = 134
        Height = 25
        Caption = 'Consultar        '
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnClick = btnConsultarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33033333333333333F7F3333333333333000333333333333F777333333333333
          000333333333333F777333333333333000333333333333F77733333333333300
          033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
          33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
          3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
          33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
          333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
          333333773FF77333333333370007333333333333777333333333}
        NumGlyphs = 2
      end
      object btnExecutar: TBitBtn
        Left = 465
        Top = 42
        Width = 134
        Height = 25
        Caption = 'Executar       '
        Default = True
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = btnExecutarClick
        Glyph.Data = {
          56010000424D560100000000000076000000280000001E0000000E0000000100
          040000000000E000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          33333333333333333300333333333333333333FF333333333300330078333333
          33333777FF3333333300330B30783333333337F377FF333333003330BB007833
          3333337F3777FF33330033330BB3007333333337F33777F33300333330BBB007
          333333337F33777F33003333300BBB008333333377F3377F3300333300BBB008
          333333377F3377F333003333300BBB008333333377FF377F3300333333300BB0
          083333333377FF77F30033333333300B00333333333377F77F00333333333330
          0033333333333377730033333333333333333333333333333300}
        NumGlyphs = 2
      end
      object btnDebugar: TBitBtn
        Left = 465
        Top = 68
        Width = 134
        Height = 25
        Caption = 'Passo a Passo'
        Font.Charset = ANSI_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
        OnClick = btnDebugarClick
        Glyph.Data = {
          06020000424D0602000000000000760000002800000028000000140000000100
          0400000000009001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          333333333333333333333333333333333333333333333333333333FFFFFFFFFF
          FFFF333330000000000000033333377777777777777F333330FEFEFEFEFEFE03
          333337F333333333337F333330EFEFEFEFEFEF03333337F3FFFF3333337F3333
          30F4444EFEFEFE0333F337F777733333337F303330EFEFEFEFEFEF0337FF37F3
          33FFFFFFF37F300330FEF4444444FE03377FF7F337777777337F300030999999
          99999903377737F333333333337F300330999FFFFFF99903377337F333333333
          337F30333099999999999903373337F333FFFFFFF37F333330FEF4444444FE03
          333337F337777777337F333330EFEFEFEFEFEF03333337F3FFFF333FFF7F3333
          30F4444EFE000003333337F7777333777773333330EFEFEFEF0FE033333337F3
          3333337F3733333330FEFEFEFE0E0333333337F33333337F7333333330EFEFEF
          EF003333333337FFFFFFFF773333333330000000000333333333377777777773
          3333333333333333333333333333333333333333333333333333333333333333
          33333333333333333333}
        NumGlyphs = 2
      end
      object edtTipo: TPanel
        Left = 147
        Top = 15
        Width = 301
        Height = 21
        Alignment = taLeftJustify
        BevelOuter = bvNone
        BorderStyle = bsSingle
        TabOrder = 4
      end
      object edtNome: TPanel
        Left = 8
        Top = 53
        Width = 439
        Height = 21
        Alignment = taLeftJustify
        BevelOuter = bvNone
        BorderStyle = bsSingle
        TabOrder = 5
      end
      object cbxRegra: TCheckBox
        Left = 57
        Top = 80
        Width = 16
        Height = 17
        TabStop = False
        Enabled = False
        TabOrder = 6
      end
      object cbxForma: TCheckBox
        Left = 217
        Top = 80
        Width = 16
        Height = 17
        TabStop = False
        Enabled = False
        TabOrder = 7
      end
    end
    object Panel1: TPanel
      Left = 4
      Top = 112
      Width = 607
      Height = 290
      Align = alClient
      BevelInner = bvLowered
      BorderWidth = 1
      Caption = 'Panel1'
      TabOrder = 1
      object Panel4: TPanel
        Left = 3
        Top = 3
        Width = 601
        Height = 284
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 0
        object Label6: TLabel
          Left = 236
          Top = 3
          Width = 156
          Height = 20
          Caption = 'Dados de Entrada'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
        end
        object Label4: TLabel
          Left = 210
          Top = 226
          Width = 92
          Height = 20
          Caption = 'Resultado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold, fsItalic]
          ParentFont = False
        end
        object BtErroRegra: TSpeedButton
          Left = 190
          Top = 275
          Width = 220
          Height = 25
          Caption = 'Erro na Execução da Regra '
          Flat = True
          Glyph.Data = {
            4E010000424D4E01000000000000760000002800000014000000120000000100
            040000000000D800000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            33333333333133337733333333333333000033391173333397333333CCC43339
            1117333911733333333133391111739111173333000033339111171111173333
            CCC4333339111111117333333331333333911111173333330000333333311111
            73333333CCC43333333911117333333333313333339111117333333300003333
            3911171117333333CCC433339111739111733333333133339117333911173333
            000033333913333391113333CCC4333333333333391933333331333333333333
            33333333000033333333333333333333CCC4}
          Visible = False
        end
        object BtOkRegra: TSpeedButton
          Left = 190
          Top = 275
          Width = 220
          Height = 25
          Caption = 'Regra executada com sucesso'
          Flat = True
          Glyph.Data = {
            4E010000424D4E01000000000000760000002800000013000000120000000100
            040000000000D800000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333000003333333333333333333000003333344333333333333000003333
            4224333333333330000033342222433333333330000033422222243333333330
            000034222A2222433333333000003222A3A222433333333000003A2A333A2224
            33333330000033A33333A222433333300000333333333A222433333000003333
            333333A222433330000033333333333A222433300000333333333333A2224330
            00003333333333333A224330000033333333333333A223300000333333333333
            333A33300000333333333333333333300000}
          Visible = False
        end
        object Label1: TLabel
          Left = 8
          Top = 64
          Width = 64
          Height = 16
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 122
          Top = 64
          Width = 111
          Height = 16
          Caption = 'Valor Informado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label7: TLabel
          Left = 249
          Top = 64
          Width = 78
          Height = 16
          Caption = 'Valor Base'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label8: TLabel
          Left = 368
          Top = 64
          Width = 63
          Height = 16
          Caption = 'Parcelas'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label10: TLabel
          Left = 486
          Top = 64
          Width = 85
          Height = 16
          Caption = 'Ocorrências'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label11: TLabel
          Left = 8
          Top = 135
          Width = 42
          Height = 16
          Caption = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Bevel2: TBevel
          Left = 0
          Top = 219
          Width = 598
          Height = 2
          Style = bsRaised
        end
        object sbtnProcurar: TSpeedButton
          Left = 29
          Top = 182
          Width = 129
          Height = 28
          AllowAllUp = True
          GroupIndex = 1
          Caption = ' &Procurar Empregado'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clNavy
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = []
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
          ParentFont = False
          ParentShowHint = False
          ShowHint = False
          Spacing = 0
          OnClick = sbtnProcurarClick
        end
        object Label14: TLabel
          Left = 122
          Top = 102
          Width = 111
          Height = 16
          Caption = 'Total Proventos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label15: TLabel
          Left = 249
          Top = 102
          Width = 102
          Height = 16
          Caption = 'Tot Descontos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label16: TLabel
          Left = 368
          Top = 103
          Width = 106
          Height = 16
          Caption = 'Mês Retroativo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label17: TLabel
          Left = 486
          Top = 103
          Width = 90
          Height = 16
          Caption = '% Retroativo'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edtResultRegra: TEdit
          Left = 210
          Top = 245
          Width = 179
          Height = 25
          TabStop = False
          AutoSize = False
          Color = clAqua
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 6
          ParentFont = False
          ReadOnly = True
          TabOrder = 7
        end
        object edMatric: TEdit
          Left = 8
          Top = 80
          Width = 100
          Height = 21
          TabOrder = 0
          OnChange = edMatricChange
        end
        object redValorInfo: TRealEdit
          Left = 122
          Top = 80
          Width = 111
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '      0,00')
          TabOrder = 3
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object redValorBase: TRealEdit
          Left = 249
          Top = 80
          Width = 100
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '      0,00')
          TabOrder = 4
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object redParcelas: TRealEdit
          Left = 368
          Top = 80
          Width = 106
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '      0,00')
          TabOrder = 5
          WordWrap = False
          IntDigits = 10
          DecDigits = 0
          NumberFormat = fNumber
          Signal = False
        end
        object redOcorrencias: TRealEdit
          Left = 486
          Top = 80
          Width = 100
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '      0,00')
          TabOrder = 6
          WordWrap = False
          IntDigits = 10
          DecDigits = 0
          NumberFormat = fNumber
          Signal = False
        end
        object rgRescisao: TRadioGroup
          Left = 163
          Top = 22
          Width = 185
          Height = 33
          Caption = 'Rescisão ?'
          Columns = 2
          ItemIndex = 1
          Items.Strings = (
            'Sim'
            'Não')
          TabOrder = 1
        end
        object rgTemLanc: TRadioGroup
          Left = 381
          Top = 22
          Width = 185
          Height = 33
          Caption = 'Tem Lançamento ?'
          Columns = 2
          ItemIndex = 1
          Items.Strings = (
            'Sim'
            'Não')
          TabOrder = 2
        end
        object bbtnLimpar: TBitBtn
          Left = 32
          Top = 29
          Width = 75
          Height = 24
          Caption = '&Limpar'
          TabOrder = 8
          OnClick = bbtnLimparClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            04000000000000010000120B0000120B00001000000000000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00559999999995
            5555557777777775F5555559999999505555555777777757FFF5555555555550
            0955555555555FF7775F55555555995501955555555577557F75555555555555
            01995555555555557F5755555555555501905555555555557F57555555555555
            0F905555555555557FF75555555555500005555555555557777555555555550F
            F05555555555557F57F5555555555008F05555555555F775F755555555570000
            05555555555775577555555555700007555555555F755F775555555570000755
            55555555775F77555555555700075555555555F75F7755555555570007555555
            5555577F77555555555500075555555555557777555555555555}
          NumGlyphs = 2
        end
        object edNome: TEdit
          Left = 8
          Top = 151
          Width = 578
          Height = 25
          TabStop = False
          AutoSize = False
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          MaxLength = 6
          ParentFont = False
          ReadOnly = True
          TabOrder = 9
        end
        object redTotProv: TRealEdit
          Left = 122
          Top = 118
          Width = 111
          Height = 21
          Hint = 'Simula Total Acumulado de Proventos'
          Alignment = taRightJustify
          Lines.Strings = (
            '      0,00')
          ParentShowHint = False
          ShowHint = True
          TabOrder = 10
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object redTotDesc: TRealEdit
          Left = 249
          Top = 118
          Width = 100
          Height = 21
          Hint = 'Simula Total Acumulado de Descontos'
          Alignment = taRightJustify
          Lines.Strings = (
            '      0,00')
          ParentShowHint = False
          ShowHint = True
          TabOrder = 11
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
        object redMesesRetro: TRealEdit
          Left = 368
          Top = 119
          Width = 106
          Height = 21
          Hint = 'Simula Total Acumulado de Proventos'
          Alignment = taRightJustify
          Lines.Strings = (
            '      0,00')
          ParentShowHint = False
          ShowHint = True
          TabOrder = 12
          WordWrap = False
          IntDigits = 10
          DecDigits = 0
          NumberFormat = fNumber
          Signal = False
        end
        object redPercRetro: TRealEdit
          Left = 486
          Top = 119
          Width = 100
          Height = 21
          Hint = 'Simula Total Acumulado de Descontos'
          Alignment = taRightJustify
          Lines.Strings = (
            '      0,00')
          ParentShowHint = False
          ShowHint = True
          TabOrder = 13
          WordWrap = False
          IntDigits = 10
          DecDigits = 2
          NumberFormat = fNumber
          Signal = False
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 406
    Width = 615
    inherited tb97Fundo: TToolbar97
      Left = 449
      DockPos = 457
      inherited bbtnSair: TBitBtn
        ModalResult = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 252
    Top = 278
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object MontaSelect1: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Forma de Cálculo'
    Colunas.Strings = (
      'REGRA.IDREGRA'
      'REGRA.NOMEREGRA'
      'TIPOREGRA.DESCREGRA')
    TipodeDado.Strings = (
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Número da Regra'
      'Nome da Regra'
      'Tipo da Regra')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'REGRA'
      'TIPOREGRA')
    CamposChave.Strings = (
      'REGRA.IDREGRA'
      'REGRA.NOMEREGRA'
      'TIPOREGRA.DESCREGRA'
      'TIPOREGRA.SQLREGRA'
      'TIPOREGRA.IDTIPOREGRA')
    Filtro.Strings = (
      'REGRA.IDTIPOREGRA = TIPOREGRA.IDTIPOREGRA')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '60'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = False
    Left = 314
    Top = 278
  end
  object Qry: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 384
    Top = 278
  end
  object QryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 530
    Top = 277
  end
  object QryRegra: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  R.IDREGRA, R.NOMEREGRA, R.IDTIPOREGRA, T.SQLREGRA, T.DESCREGRA'
      'FROM '
      '  REGRA R, TIPOREGRA T'
      'WHERE'
      '  R.IDTIPOREGRA = T.IDTIPOREGRA')
    ValidateWithMask = True
    Left = 443
    Top = 280
    object QryRegraIDREGRA: TFloatField
      FieldName = 'IDREGRA'
      Origin = 'REGRA.IDREGRA'
    end
    object QryRegraNOMEREGRA: TStringField
      FieldName = 'NOMEREGRA'
      Origin = 'REGRA.NOMEREGRA'
      Size = 60
    end
    object QryRegraIDTIPOREGRA: TFloatField
      FieldName = 'IDTIPOREGRA'
      Origin = 'REGRA.IDTIPOREGRA'
    end
    object QryRegraSQLREGRA: TMemoField
      FieldName = 'SQLREGRA'
      Origin = 'TIPOREGRA.SQLREGRA'
      BlobType = ftMemo
      Size = 1
    end
    object QryRegraDESCREGRA: TStringField
      FieldName = 'DESCREGRA'
      Origin = 'TIPOREGRA.DESCREGRA'
      Size = 60
    end
  end
  object MontaSelectFunc: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Empregado'
    Colunas.Strings = (
      'PESSOA.NOME'
      'FUNCIONARIO.MATRICULA'
      'PESSOA.NUMDOCUMENTO'
      'CARGO.TITULO'
      'EMPRESAPROP.NOMEEMPRESA')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nome da Pessoa'
      'Matrícula'
      'CPF (ou equivalente)'
      'Cargo'
      'Empresa')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'FUNCIONARIO'
      'CARGO'
      'EMPRESAPROP')
    CamposChave.Strings = (
      'PESSOA.NOME'
      'FUNCIONARIO.MATRICULA'
      'PESSOA.NUMDOCUMENTO'
      'CARGO.TITULO'
      'EMPRESAPROP.NOMEEMPRESA'
      'EMPRESAPROP.IDPESSOA'
      'FUNCIONARIO.IDPESSOA')
    Filtro.Strings = (
      'EMPRESAPROP.IDPESSOA = FUNCIONARIO.IDEMPRESA'
      'CARGO.IDCARGO        = FUNCIONARIO.IDCARGO'
      'FUNCIONARIO.IDPESSOA = PESSOA.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '22'
      '22'
      '40'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 182
    Top = 263
  end
  object qryIn: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 566
    Top = 103
  end
  object Regra: TRegra
    QueryIn = qryIn
    DatabaseName = 'BaseDados'
    IdCalculo = 0
    IdEmpresa = -1
    Left = 534
    Top = 106
  end
end
