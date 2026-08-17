inherited frmCadResultSimulaBenef: TfrmCadResultSimulaBenef
  Left = 236
  Top = 170
  HelpContext = 4650010
  Caption = 'Cadastro de Resultado da Simulação de Benefício'
  ClientHeight = 412
  ClientWidth = 615
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 615
    Height = 326
    object lblIdInput: TLabel
      Left = 8
      Top = 17
      Width = 126
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Código do Resultado:'
      FocusControl = dbedtIdResult
    end
    object lblTitulo: TLabel
      Left = 25
      Top = 57
      Width = 109
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Título:'
      FocusControl = dbedtTitulo
    end
    object lblNomeParaRegra: TLabel
      Left = 25
      Top = 97
      Width = 109
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Nome para Regra:'
      FocusControl = dbedtNomeParaRegra
    end
    object lblIDREGRA: TLabel
      Left = 26
      Top = 543
      Width = 109
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Regra:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object lblTipoDado: TLabel
      Left = 51
      Top = 134
      Width = 83
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Tipo de Dado:'
      FocusControl = dbedtNomeParaRegra
    end
    object lblFormato: TLabel
      Left = 382
      Top = 136
      Width = 82
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Formato:'
      FocusControl = dbedtFormato
    end
    object spbFormato: TSpeedButton
      Left = 582
      Top = 134
      Width = 23
      Height = 22
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlack
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8888888888FFFFF8888888888000008888888888F777778FF888888004444400
        888888877888F8778F888874447F7444088888788887FF8878F8874444FFF444
        408887F88877788887F88744447F74444088878888878888878F7C4444444444
        44087F888888F888887F7C44444F844444087F888887F888887F7C44444F8444
        44087F8888878FF8887F7C444448FF4444087F888FF877FF887F7C44FF448FF4
        440878F877F8877F887887C4FF848FF4408887F877FFF77887F887C44FFFFF84
        4088878F877777888788887CC4FFF44408888878FF77788F788888877CCCCC77
        8888888778FFFF77888888888777778888888888877777888888}
      NumGlyphs = 2
      ParentFont = False
      OnClick = spbFormatoClick
    end
    object lblORIGEMDADO: TLabel
      Left = 34
      Top = 174
      Width = 99
      Height = 13
      Alignment = taRightJustify
      AutoSize = False
      Caption = 'Origem do Dado:'
      FocusControl = dbedtNomeParaRegra
    end
    object dbedtIdResult: TDBEdit
      Left = 138
      Top = 14
      Width = 176
      Height = 21
      Color = clBtnFace
      DataField = 'IDRESULT'
      DataSource = ds
      ReadOnly = True
      TabOrder = 0
    end
    object dbedtTitulo: TDBEdit
      Left = 138
      Top = 55
      Width = 467
      Height = 21
      DataField = 'TITULO'
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 2
    end
    object dbedtNomeParaRegra: TDBEdit
      Left = 138
      Top = 95
      Width = 175
      Height = 21
      CharCase = ecUpperCase
      DataField = 'NOMEPARAREGRA'
      DataSource = ds
      TabOrder = 3
    end
    object dbchkFLGATIVO: TDBCheckBox
      Left = 470
      Top = 17
      Width = 65
      Height = 17
      Caption = 'Ativo'
      DataField = 'FLGATIVO'
      DataSource = ds
      TabOrder = 1
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object dbchkFLGVISIVEL: TDBCheckBox
      Left = 470
      Top = 98
      Width = 65
      Height = 17
      Caption = 'Visível'
      DataField = 'FLGVISIVEL'
      DataSource = ds
      TabOrder = 4
      ValueChecked = '1'
      ValueUnchecked = '0'
    end
    object cmbTIPODADO: TComboBox
      Left = 138
      Top = 132
      Width = 176
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 5
      OnClick = cmbTIPODADOClick
      Items.Strings = (
        'Data'
        'Número'
        'Texto')
    end
    object dbedtFormato: TDBEdit
      Left = 470
      Top = 134
      Width = 113
      Height = 21
      DataField = 'FORMATO'
      DataSource = ds
      TabOrder = 6
    end
    object cmbORIGEMDADO: TComboBox
      Left = 138
      Top = 171
      Width = 176
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 7
      OnClick = cmbORIGEMDADOClick
      Items.Strings = (
        'Campo de Query'
        'Resultado de Regra'
        'Conteúdo Fixo')
    end
    object grpPreenchimento: TGroupBox
      Left = 137
      Top = 205
      Width = 469
      Height = 111
      Caption = 'Preenchimento'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clNavy
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 8
      object pnlDefault: TPanel
        Left = 2
        Top = 15
        Width = 465
        Height = 94
        Align = alClient
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        object lblVALORDEFAULT: TLabel
          Left = 6
          Top = 3
          Width = 109
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Conteúdo fixo:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedtVALORDEFAULT: TDBEdit
          Left = 120
          Top = 0
          Width = 338
          Height = 21
          DataField = 'VALORDEFAULT'
          DataSource = ds
          TabOrder = 0
        end
      end
      object pnlQueryPreenche: TPanel
        Left = 2
        Top = 15
        Width = 465
        Height = 94
        Align = alClient
        BevelOuter = bvNone
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
        object lblQUERYPREENCHE: TLabel
          Left = 6
          Top = 38
          Width = 109
          Height = 13
          Alignment = taRightJustify
          AutoSize = False
          Caption = 'Query de Entrada:'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object pnlRegra: TPanel
          Left = 0
          Top = 0
          Width = 321
          Height = 23
          BevelOuter = bvNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object lblIDREGRAPREENCHE: TLabel
            Left = 6
            Top = 3
            Width = 109
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Regra:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object spbRegraPreenche: TSpeedButton
            Left = 268
            Top = 1
            Width = 23
            Height = 22
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Glyph.Data = {
              0E030000424D0E030000000000003600000028000000110000000E0000000100
              180000000000D8020000C40E0000C40E00000000000000000000FFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFF00FFFFFF000000636363212121000000000000
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFF000000636363212121000000000000FFFF
              FF00FFFFFF000000C6C6C6424242000000000000FFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFF000000C6C6C6424242000000000000FFFFFF00FFFFFF00000063636321
              2121000000000000000000000000FFFFFF000000000000000000636363212121
              000000000000FFFFFF00FFFFFF00000063636300000000000000000000000000
              0000FFFFFF000000313131313131000000000000000000000000FFFFFF00FFFF
              FF000000C6C6C642424200000000000000000031313100000000000063636363
              6363424242000000000000000000FFFFFF00FFFFFF000000C6C6C64242420000
              0000000000000063636300000000000063636363636342424200000000000000
              0000FFFFFF00FFFFFF0000006363634242420000000000000000003131310000
              00000000313131313131424242000000000000000000FFFFFF00FFFFFFFFFFFF
              0000002121210000000000000000000000000000000000000000000000002121
              21000000000000000000FFFFFF00FFFFFFFFFFFFFFFFFF000000636363525252
              000000000000FFFFFF000000636363525252000000000000FFFFFFFFFFFFFFFF
              FF00FFFFFFFFFFFFFFFFFF000000000000000000000000000000FFFFFF000000
              000000000000000000000000FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFF
              FFFF424242424242000000000000FFFFFFFFFFFF424242424242000000000000
              FFFFFFFFFFFFFFFFFF00FFFFFFFFFFFFFFFFFFFFFFFF21212121212100000000
              0000FFFFFFFFFFFF212121212121000000000000FFFFFFFFFFFFFFFFFF00FFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
              FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF00}
            ParentFont = False
            OnClick = spbRegraPreencheClick
          end
          object spbLimpaPreenche: TSpeedButton
            Left = 291
            Top = 1
            Width = 22
            Height = 22
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              04000000000000010000120B0000120B00001000000000000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
              555557777F777555F55500000000555055557777777755F75555005500055055
              555577F5777F57555555005550055555555577FF577F5FF55555500550050055
              5555577FF77577FF555555005050110555555577F757777FF555555505099910
              555555FF75777777FF555005550999910555577F5F77777775F5500505509990
              3055577F75F77777575F55005055090B030555775755777575755555555550B0
              B03055555F555757575755550555550B0B335555755555757555555555555550
              BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
              50BB555555555555575F555555555555550B5555555555555575}
            NumGlyphs = 2
            ParentFont = False
          end
          object edtNOMEREGRAPreenche: TEdit
            Left = 118
            Top = 0
            Width = 150
            Height = 21
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ReadOnly = True
            TabOrder = 0
          end
        end
        object pnlCampo: TPanel
          Left = 0
          Top = 0
          Width = 321
          Height = 23
          BevelOuter = bvNone
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          object lblCAMPO: TLabel
            Left = 32
            Top = 2
            Width = 83
            Height = 13
            Alignment = taRightJustify
            AutoSize = False
            Caption = 'Campo:'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clBlack
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
          end
          object dbedtCAMPO: TDBEdit
            Left = 118
            Top = 0
            Width = 195
            Height = 21
            CharCase = ecUpperCase
            DataField = 'CAMPO'
            DataSource = ds
            TabOrder = 0
          end
        end
        object dbchkFLGQUERYPREENCHE: TDBCheckBox
          Left = 326
          Top = 3
          Width = 139
          Height = 17
          Caption = 'Utiliza query própria'
          DataField = 'FLGQUERYPREENCHE'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          ValueChecked = '1'
          ValueUnchecked = '0'
          OnClick = dbchkFLGQUERYPREENCHEClick
        end
        object dbmemQUERYPREENCHE: TDBMemo
          Left = 118
          Top = 32
          Width = 341
          Height = 56
          DataField = 'QUERYPREENCHE'
          DataSource = ds
          Font.Charset = ANSI_CHARSET
          Font.Color = clBlack
          Font.Height = -13
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ScrollBars = ssVertical
          TabOrder = 3
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 615
  end
  inherited Dock971: TDock97
    Top = 373
    Width = 615
    inherited tb97Fundo: TToolbar97
      Left = 431
      DockPos = 431
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 262
      DockPos = 262
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 378
    Top = 7
    TargetsData = (
      1
      1
      (
        'TDBMemo'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 254
    Top = 7
  end
  inherited ImlPadrao: TImageList
    Left = 344
    Top = 7
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    Left = 312
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Left = 284
    Top = 7
    object CdsIDRESULT: TFloatField
      FieldName = 'IDRESULT'
    end
    object CdsTITULO: TStringField
      FieldName = 'TITULO'
      Size = 60
    end
    object CdsFLGATIVO: TFloatField
      FieldName = 'FLGATIVO'
    end
    object CdsNOMEPARAREGRA: TStringField
      FieldName = 'NOMEPARAREGRA'
    end
    object CdsFLGVISIVEL: TFloatField
      FieldName = 'FLGVISIVEL'
    end
    object CdsTIPODADO: TStringField
      FieldName = 'TIPODADO'
      FixedChar = True
      Size = 1
    end
    object CdsFORMATO: TStringField
      FieldName = 'FORMATO'
    end
    object CdsIDREGRA: TFloatField
      FieldName = 'IDREGRA'
    end
    object CdsVALORDEFAULT: TStringField
      FieldName = 'VALORDEFAULT'
      Size = 100
    end
    object CdsCAMPO: TStringField
      FieldName = 'CAMPO'
    end
    object CdsQUERYPREENCHE: TBlobField
      FieldName = 'QUERYPREENCHE'
      BlobType = ftBlob
      Size = 1
    end
    object CdsFLGQUERYPREENCHE: TFloatField
      FieldName = 'FLGQUERYPREENCHE'
    end
    object CdsORIGEMDADO: TStringField
      FieldName = 'ORIGEMDADO'
      FixedChar = True
      Size = 1
    end
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Resultado da Simulação de Benefício'
    Colunas.Strings = (
      'RESULTSIMULABENEF.IDRESULT'
      'RESULTSIMULABENEF.TITULO'
      'RESULTSIMULABENEF.NOMEPARAREGRA'
      'DECODE( RESULTSIMULABENEF.FLGATIVO, '#39'1'#39', '#39'S'#39', '#39'0'#39', '#39'N'#39', '#39#39' )'
      'DECODE( RESULTSIMULABENEF.FLGVISIVEL, '#39'1'#39', '#39'S'#39', '#39'0'#39', '#39'N'#39', '#39#39' )'
      
        'DECODE( RESULTSIMULABENEF.TIPODADO, '#39'D'#39', '#39'DATA'#39', '#39'N'#39', '#39'NÚMERO'#39', ' +
        #39'T'#39',  '#39'TEXTO'#39', '#39'L'#39', '#39'LISTA'#39', '#39#39' )'
      
        'DECODE( RESULTSIMULABENEF.ORIGEMDADO, '#39'C'#39', '#39'CAMPO DE QUERY'#39', '#39'R'#39 +
        ', '#39'RESULTADO DE REGRA'#39', '#39'V'#39', '#39'CONTEÚDO FIXO'#39', '#39#39' )')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código do Resultado'
      'Título'
      'Nome para Regra'
      'Ativo'
      'Visível'
      'Tipo de Dado'
      'Origem do dado')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'RESULTSIMULABENEF')
    CamposChave.Strings = (
      'RESULTSIMULABENEF.IDRESULT')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '60'
      '20'
      '1'
      '1'
      '1'
      '20')
    Left = 408
    Top = 7
  end
  object msRegra: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Regra'
    Colunas.Strings = (
      'REGRA.IDREGRA'
      'REGRA.NOMEREGRA')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Id. Regra'
      'Nome da Regra')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'REGRA')
    CamposChave.Strings = (
      'REGRA.IDREGRA'
      'REGRA.NOMEREGRA')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 440
    Top = 7
  end
end
