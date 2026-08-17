inherited FrmDesfazEnvios: TFrmDesfazEnvios
  Left = 9
  Top = 73
  Caption = 'Desfazer Envios'
  ClientHeight = 444
  ClientWidth = 475
  WindowState = wsMaximized
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 475
    Height = 405
    object pnlOpcoes: TPanel
      Left = 1
      Top = 141
      Width = 473
      Height = 263
      Align = alBottom
      TabOrder = 3
      object pnlColetivo: TPanel
        Left = 1
        Top = 1
        Width = 471
        Height = 261
        Align = alClient
        TabOrder = 0
        object GrPatros: TGroupBox
          Left = 5
          Top = 3
          Width = 220
          Height = 228
          Anchors = [akLeft, akTop, akBottom]
          Caption = 'Patrocinadoras'
          TabOrder = 0
          object chklstPatro: TCheckListBox
            Left = 2
            Top = 15
            Width = 216
            Height = 211
            Align = alClient
            Columns = 1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            ParentFont = False
            TabOrder = 0
          end
        end
        object ProgressBar: TProgressBar
          Left = 5
          Top = 239
          Width = 460
          Height = 16
          Min = 0
          Max = 100
          TabOrder = 1
        end
        object GroupBox1: TGroupBox
          Left = 242
          Top = 3
          Width = 220
          Height = 228
          Anchors = [akTop, akRight, akBottom]
          Caption = 'Planos Assistenciais'
          TabOrder = 2
          object chklstPlanos: TCheckListBox
            Left = 2
            Top = 15
            Width = 216
            Height = 211
            Align = alClient
            Columns = 1
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = []
            ItemHeight = 13
            ParentFont = False
            TabOrder = 0
          end
        end
      end
      object pnlIndividual: TPanel
        Left = 1
        Top = 1
        Width = 471
        Height = 261
        Align = alClient
        TabOrder = 1
        object Label1: TLabel
          Left = 8
          Top = 16
          Width = 123
          Height = 13
          Caption = 'Nome do Participante'
        end
        object Label2: TLabel
          Left = 8
          Top = 74
          Width = 80
          Height = 13
          Caption = 'Patrocinadora'
        end
        object Label3: TLabel
          Left = 298
          Top = 74
          Width = 55
          Height = 13
          Caption = 'Matrícula'
        end
        object Label4: TLabel
          Left = 8
          Top = 138
          Width = 118
          Height = 13
          Caption = 'Plano Previdenciário'
        end
        object Label5: TLabel
          Left = 298
          Top = 138
          Width = 71
          Height = 13
          Caption = 'Nº Inscrição'
        end
        object Label6: TLabel
          Left = 10
          Top = 202
          Width = 104
          Height = 13
          Caption = 'Plano Assistencial'
        end
        object edtNomeParticip: TEdit
          Left = 8
          Top = 32
          Width = 313
          Height = 21
          CharCase = ecUpperCase
          Color = clInactiveCaption
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object btnLocalizar: TBitBtn
          Left = 324
          Top = 7
          Width = 137
          Height = 54
          Caption = 'Buscar Participante'
          TabOrder = 1
          OnClick = btnLocalizarClick
          Glyph.Data = {
            76020000424D7602000000000000760000002800000020000000200000000100
            0400000000000002000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777770880880
            7777777770070077777777777088088077777777000000077777777770880880
            0070077708808807777777777088088000000077088088077777777770880880
            88088077088088077777777700888880080880770880880777777770B0888880
            B0088077088088077777770000003000000880770880880777777708808FFF80
            880880770880880777777708808FCF80880880770880880777777708808FCF80
            880880770880880777777708808FCF80880880700888880077777708808FCF80
            8808800B0888880B07777708808FCF80880880000003000000777708888F6F88
            8808808808FFF80880777708888FCF888800008808FCF8088077777000000000
            00FF808808FCF80880777777777708808FCF808808FCF8088077777777700080
            8FCF808808FCF808807777777703B3008FCF808808FCF80880777777770B3B00
            8FCF808888F6F888807777777703B3008FCF808888FCF8888077777777700088
            8F6F88000000000007777777777708888FCF8888077777777777777777777000
            0000000077000777777777777777777777777777703B30777777777777777777
            7000777770B3B077777777777777777703B30777703B30777777777777777777
            0B3B077777000777777777777777777703B30777777777777777777777777777
            7000777777777777777777777777777777777777777777777777}
          Layout = blGlyphTop
        end
        object edtNomePatro: TEdit
          Left = 8
          Top = 90
          Width = 257
          Height = 21
          CharCase = ecUpperCase
          Color = clInactiveCaption
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object edtMatricula: TEdit
          Left = 298
          Top = 90
          Width = 164
          Height = 21
          CharCase = ecUpperCase
          Color = clInactiveCaption
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
        object edtNomePlanoPrev: TEdit
          Left = 8
          Top = 154
          Width = 257
          Height = 21
          CharCase = ecUpperCase
          Color = clInactiveCaption
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
        end
        object edtNumInscricao: TEdit
          Left = 297
          Top = 154
          Width = 164
          Height = 21
          CharCase = ecUpperCase
          Color = clInactiveCaption
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
        end
        object edtNomePlanAss: TEdit
          Left = 9
          Top = 218
          Width = 256
          Height = 21
          CharCase = ecUpperCase
          Color = clInactiveCaption
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ReadOnly = True
          TabOrder = 6
        end
      end
    end
    object grpMesAnoRef: TGroupBox
      Left = 5
      Top = 2
      Width = 152
      Height = 56
      Caption = 'Mês de Cobrança'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object cmbMesCob: TComboBox
        Left = 8
        Top = 20
        Width = 82
        Height = 21
        ItemHeight = 13
        TabOrder = 0
        OnChange = cmbMesCobChange
        Items.Strings = (
          'Janeiro'
          'Fevereiro'
          'Março'
          'Abril'
          'Maio'
          'Junho'
          'Julho'
          'Agosto'
          'Setembro '
          'Outubro'
          'Novembro'
          'Dezembro')
      end
      object spedAnoCob: TSpinEdit
        Left = 90
        Top = 19
        Width = 55
        Height = 22
        MaxLength = 4
        MaxValue = 0
        MinValue = 0
        TabOrder = 1
        Value = 2003
        OnChange = spedAnoCobChange
      end
    end
    object GrDatas: TGroupBox
      Left = 327
      Top = 2
      Width = 146
      Height = 56
      Caption = 'Data de Envio'
      TabOrder = 1
      object DBLKDatas: TwwDBLookupCombo
        Left = 16
        Top = 19
        Width = 118
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DATA'#9'10'#9'DATA'#9'F')
        LookupTable = qryDatasPreparos
        LookupField = 'DATA'
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
      end
    end
    object rdgCobrancas: TRadioGroup
      Left = 5
      Top = 59
      Width = 173
      Height = 79
      Caption = 'Formas de Cobranças'
      ItemIndex = 0
      Items.Strings = (
        '&Todas'
        'Folhas de &Pagamento'
        'Folhas de &Benefício'
        '&Cobrança Bancária')
      TabOrder = 2
      OnClick = rdgCobrancasClick
    end
    object rgTipo: TRadioGroup
      Left = 296
      Top = 64
      Width = 177
      Height = 74
      Caption = '  Tipo da Operação  '
      ItemIndex = 0
      Items.Strings = (
        'Desfazer o &Grupo'
        'Desfazer &Individual')
      TabOrder = 4
      OnClick = rgTipoClick
    end
  end
  inherited Dock971: TDock97
    Top = 405
    Width = 475
    inherited tb97Fundo: TToolbar97
      Left = 303
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 134
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 571
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
  object qryPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  DISTINCT  P.IDPESSOA , P.NOME'
      'FROM PESSOA P, PATRO PT'
      'WHERE P.IDPESSOA = PT.IDPESSOA'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 178
    Top = 3
    object qryPatroIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.PESSOA.IDPESSOA'
    end
    object qryPatroNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PESSOA.NOME'
      Size = 60
    end
  end
  object qryDatasPreparos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT TO_CHAR(T.TRGDTINCLUSAO, '#39'DD/MM/YYYY'#39') AS DATA'
      'FROM HSTCONTRIBASS H, TMPDESC T'
      'WHERE T.IDMODULO = 17                   '
      '  AND H.MESCOBRANCA = :DATA'
      '  AND T.MESCOBRANCA = H.MESCOBRANCA    '
      '  AND T.IDTITULAR   = H.IDTITULAR      '
      '  AND T.IDPLANOPREV = H.IDPLANOPREV    '
      '  AND T.IDDESCONTO  = H.IDCONTASS      '
      '  AND H.IDPESSJUR   = T.IDPESSJUR      '
      '  AND H.IDPLANASS   = T.IDPLANASS      '
      '  AND H.IDLOTE      = T.IDLOTE         '
      '  AND H.FLGCOBCARNE <> 1                '
      '  AND NVL(T.SITENVIO, 0) = 0'
      '  AND H.TRGDTINCLUSAO IS NOT NULL')
    ValidateWithMask = True
    Left = 232
    Top = 24
    ParamData = <
      item
        DataType = ftString
        Name = 'DATA'
        ParamType = ptInput
      end>
    object qryDatasPreparosDATA: TStringField
      DisplayWidth = 10
      FieldName = 'DATA'
      Size = 10
    end
  end
  object qryBuscaLanc: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 432
    Top = 16
  end
  object qryDesfaz: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 512
    Top = 16
  end
  object qryPlanos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  IDPLANASS, '
      '  NOME AS PLANO '
      'FROM PLANASS '
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 288
    Top = 8
    object qryPlanosIDPLANASS: TFloatField
      FieldName = 'IDPLANASS'
      Origin = 'BASEDADOS.PLANASS.IDPLANASS'
    end
    object qryPlanosPLANO: TStringField
      FieldName = 'PLANO'
      Origin = 'BASEDADOS.PLANASS.NOME'
      Size = 40
    end
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'EL.MATRICULA'
      'PP.INSCRICAONUMERO'
      'PE.NOME'
      'PL.NOME'
      'PN.NOME')
    TipodeDado.Strings = (
      'C'
      'N'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Nº de Inscrição'
      'Participante'
      'Plano Previdenciário'
      'Plano Assistencial')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA PE'
      'PARTPREVPLAN PP'
      'PLANPREV PL'
      'PARTASS PA'
      'PLANASS PN'
      'ELEGPATRO EL'
      'PESSOA PJ')
    CamposChave.Strings = (
      'PA.IDPESSOA'
      'PA.IDPESSJUR'
      'PA.IDPLANOPREV'
      'PA.IDPLANASS'
      'PA.SEQPROPOSTA'
      'PE.NOME'
      'PJ.NOME'
      'EL.MATRICULA'
      'PL.NOME'
      'PP.INSCRICAONUMERO'
      'PN.NOME')
    Filtro.Strings = (
      'PA.IDPESSJUR = PP.IDPESSJUR'
      'PA.IDPLANOPREV = PP.IDPLANOPREV'
      'PA.IDPESSOA = PP.IDPESSOA'
      'PA.SEQPROPOSTA = PP.SEQPROPOSTA'
      'PA.IDPLANASS = PN.IDPLANASS'
      'PP.IDPESSOA = EL.IDPESSOA'
      'PP.IDPESSJUR = EL.IDPESSJUR'
      'PE.IDPESSOA = EL.IDPESSOA'
      'PJ.IDPESSOA = EL.IDPESSJUR'
      'PL.IDPLANOPREV = PA.IDPLANOPREV'
      'PA.IDPLANASS = PA.IDPLANASS'
      ' NVL(PA.FLGINSCRICAOCANC,0) = 0')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '13'
      '10'
      '60'
      '50'
      '40')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      '')
    Left = 218
    Top = 86
  end
end
