inherited frmCompoeValoresRI_TelaA: TfrmCompoeValoresRI_TelaA
  Left = 131
  Top = 126
  Caption = 'Benefícios sem contra-partida do INSS'
  ClientHeight = 490
  ClientWidth = 794
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 794
    Height = 451
    object GrpBxPesquisaHistorico: TGroupBox
      Left = 16
      Top = 8
      Width = 417
      Height = 111
      Caption = ' Pesquisar por '
      TabOrder = 1
      object lblMes: TLabel
        Left = 19
        Top = 19
        Width = 147
        Height = 13
        Caption = 'Mês e ano  de referência '
      end
      object Label1: TLabel
        Left = 21
        Top = 78
        Width = 89
        Height = 13
        Caption = 'Nº de registros:'
      end
      object lblRegistros: TLabel
        Left = 117
        Top = 78
        Width = 8
        Height = 13
        Caption = '0'
      end
      object Label2: TLabel
        Left = 205
        Top = 78
        Width = 105
        Height = 13
        Caption = 'Tempo de retorno:'
      end
      object lblTempo: TLabel
        Left = 317
        Top = 78
        Width = 8
        Height = 13
        Caption = '0'
      end
      object seAno: TSpinEdit
        Left = 155
        Top = 35
        Width = 65
        Height = 22
        MaxValue = 3000
        MinValue = 2000
        TabOrder = 0
        Value = 2003
        OnChange = cbxMesChange
      end
      object cbxMes: TComboBox
        Left = 19
        Top = 35
        Width = 133
        Height = 21
        ItemHeight = 13
        TabOrder = 1
        OnChange = cbxMesChange
        Items.Strings = (
          'Janeiro'
          'Fevereiro'
          'Março'
          'Abril'
          'Maio'
          'Junho'
          'Julho'
          'Agosto'
          'Setembro'
          'Outubro'
          'Novembro'
          'Dezembro')
      end
      object BtnFiltrar: TBitBtn
        Left = 272
        Top = 16
        Width = 94
        Height = 47
        Hint = 'Procurar participante'
        Caption = 'Pesquisar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = BtnFiltrarClick
        Glyph.Data = {
          36030000424D3603000000000000360000002800000010000000100000000100
          18000000000000030000120B0000120B00000000000000000000FF00FF4A667C
          BE9596FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FF6B9CC31E89E84B7AA3C89693FF00FFFF00FFFF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF4BB4FE51B5FF
          2089E94B7AA2C69592FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FF51B7FE51B3FF1D87E64E7AA0CA9792FF00FFFF
          00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          51B7FE4EB2FF1F89E64E7BA2B99497FF00FFFF00FFFF00FFFF00FFFF00FFFF00
          FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF52B8FE4BB1FF2787D95F6A76FF
          00FFA87875C4A398D5B6A7D0A59FFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF
          FF00FFFF00FF55BDFFB5D6EDA3908EB69B8BF0E7C8FEFDDAFEFDD9FDFCD8EADA
          C2CEAEA3FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFCCB7B7D9B8A5FF
          F1C3FFFDD6FFFFDAFFFFDAFFFFDFFFFFEFF6F0EBB48D89FF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFC6978FF7E2B5F8DBAAFDF7D0FFFFDAFFFFE1FFFFF2FFFF
          FBFFFFFFDFD0BEFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDBBAA8FCE4AFF2
          C897FCF4CCFFFFDBFFFFE4FFFFF9FFFFFBFFFFECF2EFD0C79C96FF00FFFF00FF
          FF00FFFF00FFFF00FFE4C7AFFBE0ABEFBA86F9E3B6FFFFD9FFFFDEFFFFE8FFFF
          EAFFFFE0FAF8D7C6AC9AFF00FFFF00FFFF00FFFF00FFFF00FFDFC0ABFEE9B5EF
          BB84F3CC98FBEEC4FFFFDBFFFFDDFFFFDCFFFFDCF6F2D2C8A298FF00FFFF00FF
          FF00FFFF00FFFF00FFCAA098FDF0C2FAE9C5F4D3A6F4D09DF9E4B8FEF6CFFEFA
          D3FFFFDAE5D9BBFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFDDC4AEFF
          FFFFFFF7E9F3CC98F0BD89F4CE9DFCE6B6FDF6C8BE9D8FFF00FFFF00FFFF00FF
          FF00FFFF00FFFF00FFFF00FFFF00FFD3BFBAF6F0DCFFF2C0FDE6B1FEE9B5F4DE
          B7D0AD9DFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
          00FFCAAD96CFAE9BDDBFA9DCB8A8FF00FFFF00FFFF00FFFF00FF}
      end
    end
    object GroupBox1: TGroupBox
      Left = 16
      Top = 168
      Width = 769
      Height = 273
      Caption = 'Benefícios pagos pela Fundação sem contra-partida do INSS'
      TabOrder = 3
      object wwDBGrid2: TwwDBGrid
        Left = 2
        Top = 15
        Width = 765
        Height = 256
        Selected.Strings = (
          'NUMPROCINSS'#9'12'#9'Número Benef.'#9'F'
          'PLANO'#9'30'#9'Plano Previdenciário'
          'PARTICIPANTE'#9'55'#9'Partitcipante')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dsHistrubsal
        Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -9
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 1
        TitleButtons = False
        OnDblClick = wwDBGrid2DblClick
        IndicatorColor = icBlack
        DragVertOffset = 5
      end
    end
    object gboxTipoTratamento: TRadioGroup
      Left = 16
      Top = 123
      Width = 768
      Height = 40
      Caption = 'Tipo de tratamento'
      Columns = 2
      ItemIndex = 0
      Items.Strings = (
        'Benefício foi para Órgão Pagador da CEF'
        'Benefíco foi para outro Órgão Pagador (Não CEF)')
      TabOrder = 2
    end
    object GrpBxPesquisaAssociado: TGroupBox
      Left = 440
      Top = 8
      Width = 344
      Height = 111
      Caption = ' Filtrar por '
      TabOrder = 0
      object Label3: TLabel
        Left = 12
        Top = 65
        Width = 130
        Height = 13
        Caption = '...ou nome a pesquisar'
      end
      object Label4: TLabel
        Left = 12
        Top = 23
        Width = 132
        Height = 13
        Caption = 'Número do benefício...'
      end
      object edtNUMPROCINSS: TEdit
        Left = 12
        Top = 38
        Width = 145
        Height = 21
        TabOrder = 0
      end
      object edtNome: TEdit
        Left = 12
        Top = 81
        Width = 321
        Height = 21
        CharCase = ecUpperCase
        TabOrder = 1
      end
      object BtnEncontrarAssociado: TBitBtn
        Left = 219
        Top = 18
        Width = 94
        Height = 47
        Hint = 'Procurar participante'
        Caption = 'Filtrar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = BtnEncontrarAssociadoClick
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000033
          33333333330F803333333333330F803333333333330F803333333333308F8703
          3333333308F88870333333308F88888703333308F88888887033308F88888888
          870330B0000000000003B3B3BFCCCFFF033333B37FFFFFCFF033BBBBBFFCCCFF
          FF0333B337FFFFFF7733B3B3B37FFF77333333B3333777333333}
      end
    end
  end
  inherited Dock971: TDock97
    Top = 451
    Width = 794
    inherited tb97Fundo: TToolbar97
      Left = 634
      DockPos = 714
      inherited sep1: TToolbarSep97
        Left = 153
      end
      inherited sep3: TToolbarSep97
        Left = 75
      end
      inherited bbtnSair: TBitBtn
        Width = 75
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 78
        Width = 75
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 177
      DockPos = 238
      inherited ToolbarSep971: TToolbarSep97
        Left = 369
      end
      inherited bbtnConfirmar: TBitBtn
        Left = 288
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Left = 372
        Visible = False
      end
      object btnImprimir: TBitBtn
        Left = 192
        Top = 0
        Width = 96
        Height = 33
        Caption = 'Cobrança'
        Enabled = False
        TabOrder = 2
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
          8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
          8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
          8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
        NumGlyphs = 2
      end
      object BitBtn1: TBitBtn
        Left = 96
        Top = 0
        Width = 96
        Height = 33
        Caption = 'Informativa'
        Enabled = False
        TabOrder = 3
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
          8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
          8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
          8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
        NumGlyphs = 2
      end
      object BitBtn2: TBitBtn
        Left = 0
        Top = 0
        Width = 96
        Height = 33
        Caption = 'Listagem'
        Enabled = False
        TabOrder = 4
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00300000000000
          00033FFFFFFFFFFFFFFF0888888888888880777777777777777F088888888888
          8880777777777777777F0000000000000000FFFFFFFFFFFFFFFF0F8F8F8F8F8F
          8F80777777777777777F08F8F8F8F8F8F9F0777777777777777F0F8F8F8F8F8F
          8F807777777777777F7F0000000000000000777777777777777F3330FFFFFFFF
          03333337F3FFFF3F7F333330F0000F0F03333337F77773737F333330FFFFFFFF
          03333337F3FF3FFF7F333330F00F000003333337F773777773333330FFFF0FF0
          33333337F3FF7F3733333330F08F0F0333333337F7737F7333333330FFFF0033
          33333337FFFF7733333333300000033333333337777773333333}
        NumGlyphs = 2
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 403
    TargetsData = (
      1
      2
      (
        'TwwDBRichEdit'
        'Text'
        0)
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  object qryBenefbfciario: TwwQuery
    CachedUpdates = True
    BeforeOpen = qryBenefbfciarioBeforeOpen
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  M.IDBENEFICIO, M.NUMPROCINSS,'
      '  P.NOME PARTICIPANTE, P.IDPESSOA,'
      '  PL.NOME PLANO'
      'FROM'
      '  ( SELECT HST.IDPESSOA, HST.IDBENEFICIO, BF.NUMPROCINSS'
      
        '    FROM HSTBENEFBFCIARIO HST, BENEFPLANPREV BPP, BENEFBFCIARIO ' +
        'BF'
      '    WHERE HST.MESREFERENCIA  = :MESREFERENCIA'
      '      AND BPP.FLGREFERENCIA  = 1'
      '      AND BPP.IDBENEFICIO    = HST.IDBENEFICIO'
      '      AND BPP.IDPLANOPREV    = HST.IDPLANOPREV'
      '      AND BF.IDPESSOA        = HST.IDPESSOA'
      '      AND BF.IDPESSJUR       = HST.IDPESSJUR'
      '      AND BF.IDBENEFICIO     = HST.IDBENEFICIO'
      '      AND BF.IDPLANOPREV     = HST.IDPLANOPREV'
      '      AND BF.SEQPROPOSTA     = HST.SEQPROPOSTA'
      '      AND BF.NUMEROPROCESSO  = HST.NUMEROPROCESSO'
      '      AND BF.IDPLANOORIGEM   = HST.IDPLANOORIGEM'
      '   MINUS'
      
        '   SELECT DISTINCT D.IDPESSOA, D.IDBENEFICIO, TO_CHAR(D.NUMPROCI' +
        'NSS) NUMPROCINSS'
      '   FROM DETCONCINSS D'
      '   WHERE MESREFERENCIA = :MESREFERENCIA ) M,'
      ''
      '   PESSOA P, PARTPREVPLAN PPP, BENEFICIO B, PLANPREV PL'
      'WHERE M.IDPESSOA        = P.IDPESSOA'
      '  AND M.IDBENEFICIO     = B.IDBENEFICIO'
      '  AND PPP.IDPESSOA      = P.IDPESSOA'
      '  AND PL.IDPLANOPREV    = PPP.IDPLANOPREV'
      '  AND PPP.FLGDESATIVADO = 1'
      'ORDER BY P.NOME')
    ValidateWithMask = True
    Left = 168
    Top = 248
    ParamData = <
      item
        DataType = ftString
        Name = 'MESREFERENCIA'
        ParamType = ptInput
        Value = '2203/08'
      end
      item
        DataType = ftString
        Name = 'MESREFERENCIA'
        ParamType = ptInput
      end>
    object qryBenefbfciarioNUMPROCINSS: TStringField
      DisplayLabel = 'Nº Benefício'
      DisplayWidth = 15
      FieldName = 'NUMPROCINSS'
      Size = 40
    end
    object qryBenefbfciarioPARTICIPANTE: TStringField
      DisplayLabel = 'Participante'
      DisplayWidth = 40
      FieldName = 'PARTICIPANTE'
      Size = 60
    end
    object qryBenefbfciarioIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryBenefbfciarioIDBENEFICIO: TFloatField
      FieldName = 'IDBENEFICIO'
    end
    object qryBenefbfciarioPLANO: TStringField
      FieldName = 'PLANO'
      Size = 50
    end
  end
  object dsHistrubsal: TwwDataSource
    Left = 95
    Top = 242
  end
  object qryPlano: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM   PLANPREVCONTABIL'
      'WHERE  NVL(ATIVO,'#39'S'#39') = '#39'S'#39
      'ORDER BY NOME'
      ''
      ''
      '')
    ValidateWithMask = True
    Left = 416
    Top = 248
  end
  object cdsBenefbfciario: TwwClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dspHistrubsal'
    ValidateWithMask = True
    Left = 280
    Top = 312
  end
  object dspHistrubsal: TDataSetProvider
    DataSet = qryBenefbfciario
    Constraints = True
    ResolveToDataSet = True
    Left = 368
    Top = 248
  end
end
