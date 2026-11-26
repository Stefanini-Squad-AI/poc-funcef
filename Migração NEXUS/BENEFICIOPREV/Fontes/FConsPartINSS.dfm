inherited FrmConsPartINSS: TFrmConsPartINSS
  Left = 100
  Top = 105
  Caption = ' Extrato Individual'
  ClientHeight = 408
  ClientWidth = 646
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 646
    Height = 369
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 644
      Height = 100
      Align = alTop
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 0
      object Label1: TLabel
        Left = 212
        Top = 9
        Width = 33
        Height = 13
        Caption = 'Nome'
      end
      object Label5: TLabel
        Left = 12
        Top = 8
        Width = 55
        Height = 13
        Caption = 'Matrícula'
      end
      object Label6: TLabel
        Left = 110
        Top = 8
        Width = 74
        Height = 13
        Caption = 'Nº Benefício'
      end
      object Label7: TLabel
        Left = 10
        Top = 56
        Width = 75
        Height = 13
        Caption = 'Mantenedora'
      end
      object Label8: TLabel
        Left = 152
        Top = 56
        Width = 136
        Height = 13
        Caption = 'Cód. Órgão Mantenedor'
      end
      object Label9: TLabel
        Left = 307
        Top = 56
        Width = 110
        Height = 13
        Caption = 'Nome do Benefício'
      end
      object bbtnProcurar: TBitBtn
        Left = 523
        Top = 17
        Width = 101
        Height = 33
        Hint = 'Procurar participante'
        Caption = '&Procurar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = bbtnProcurarClick
        Glyph.Data = {
          4E010000424D4E01000000000000760000002800000012000000120000000100
          040000000000D800000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
          DDDDDD000000DDDDDDDDDDDDDDDDDD000000D000000000000DD00D000000D0FF
          FFFFFFFF0D000D000000D0FFFFFFF0000800DD000000D0FFFFFF0877808DDD00
          0000D0FFFFF0877E880DDD000000D0FFFFF07777870DDD000000D0FFFFF07E77
          870DDD000000D0FFFFF08EE7880DDD000000D0FFFFFF087780DDDD000000D0FF
          FFFFF0000DDDDD000000D0FFFFFFFFFF0DDDDD000000D0FFFFFFF0000DDDDD00
          0000D0FFFFFFF070DDDDDD000000D0FFFFFFF00DDDDDDD000000DD00000000DD
          DDDDDD000000DDDDDDDDDDDDDDDDDD000000}
        Spacing = 2
      end
      object lblParticipante: TStaticText
        Left = 212
        Top = 24
        Width = 297
        Height = 20
        AutoSize = False
        BorderStyle = sbsSunken
        TabOrder = 3
      end
      object lblMant: TStaticText
        Left = 10
        Top = 71
        Width = 119
        Height = 20
        AutoSize = False
        BorderStyle = sbsSunken
        TabOrder = 4
      end
      object lblOrgaoMant: TStaticText
        Left = 152
        Top = 71
        Width = 134
        Height = 20
        AutoSize = False
        BorderStyle = sbsSunken
        TabOrder = 5
      end
      object edtMatricula: TEdit
        Left = 12
        Top = 24
        Width = 85
        Height = 21
        TabOrder = 0
      end
      object edtnumBenef: TEdit
        Left = 110
        Top = 24
        Width = 89
        Height = 21
        TabOrder = 1
      end
      object lblEspecie: TStaticText
        Left = 307
        Top = 71
        Width = 310
        Height = 20
        AutoSize = False
        BorderStyle = sbsSunken
        TabOrder = 6
      end
    end
    object wwDBGrid1: TwwDBGrid
      Left = 1
      Top = 101
      Width = 644
      Height = 218
      Selected.Strings = (
        'MESREFERENCIA'#9'7'#9'Mês Ref.'#9'F'
        'DESCRICAO'#9'40'#9'Descrição'#9'F'
        'CODPROVDESC'#9'15'#9'Cód. Externo'#9'F'
        'VALORMANT'#9'10'#9'Vlr. Mant.'#9'F'
        'RUBRICAINSS'#9'10'#9'Cód. INSS'#9'F'
        'VALORINSS'#9'10'#9'Vlr. INSS'#9'F')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = ds
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      TabOrder = 1
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 1
      TitleButtons = False
      IndicatorColor = icBlack
    end
    object Panel2: TPanel
      Left = 1
      Top = 319
      Width = 644
      Height = 49
      Align = alBottom
      TabOrder = 2
      object Label2: TLabel
        Left = 16
        Top = 20
        Width = 67
        Height = 13
        Caption = 'Total INSS:'
      end
      object Label3: TLabel
        Left = 223
        Top = 20
        Width = 70
        Height = 13
        Caption = 'Total Mant.:'
      end
      object Label4: TLabel
        Left = 443
        Top = 20
        Width = 60
        Height = 13
        Caption = 'Diferença:'
      end
      object edTotINSS: TEdit
        Left = 85
        Top = 16
        Width = 107
        Height = 21
        ReadOnly = True
        TabOrder = 0
      end
      object edTotMant: TEdit
        Left = 295
        Top = 16
        Width = 107
        Height = 21
        ReadOnly = True
        TabOrder = 1
      end
      object edTotDif: TEdit
        Left = 505
        Top = 16
        Width = 107
        Height = 21
        ReadOnly = True
        TabOrder = 2
      end
    end
  end
  inherited Dock971: TDock97
    Top = 369
    Width = 646
    inherited tb97Fundo: TToolbar97
      Left = 372
      DockPos = 372
      inherited sep1: TToolbarSep97
        Left = 242
      end
      inherited bbtnSair: TBitBtn
        Left = 80
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 161
      end
      object btnImprimir: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&Imprimir'
        TabOrder = 2
        OnClick = btnImprimirClick
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
    Left = 65522
    Top = 347
  end
  object qry: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  D.MESREFERENCIA,'
      '        SUBSTR(PD.DESCRICAO,1,40) DESCRICAO,'
      '        PD.CODPROVDESC,'
      '        NVL(TRUNC(D.VALORMANT,2),0) VALORMANT,'
      '        RI.RUBRICAINSS,'
      '        NVL(TRUNC(D.VALORINSS,2),0) VALORINSS,'
      '        D.CODMANTENEDORINSS,'
      '        D.NUMPROCINSS,'
      '  '#9'     M.NOME MANT,'
      '        BPP.MATRICULA,'
      '        P.NOME,'
      '        B.NOME NOMEBENEF,'
      '        (NVL(D.VALORMANT,0) - NVL(D.VALORINSS,0)) AS DIF,'
      '        1 GRUPO'
      'FROM '#9'DETCONCINSS D, PROVDESC PD,  RUBRICAXINSS RI,'
      #9'BENEFICIARIOPP BPP, MANTENEDORA M, PESSOA P,'
      #9'BENEFICIO B'
      'WHERE D.IDPESSOA = :IDPESSOA'
      '  AND PD.IDPROVENTO = D.IDRUBRICA'
      '  AND RI.IDRUBRICA = PD.IDPROVENTO'
      '  AND RI.FLGRUBCENTRAL =1'
      '  AND BPP.IDBENEFICIARIOPP = D.IDPESSOA'
      '  AND M.CODMANTENEDORA = BPP.CODMANTENEDORA'
      '  AND P.IDPESSOA       = D.IDPESSOA'
      '  AND B.IDBENEFICIO = D.IDBENEFICIO'
      ''
      'UNION'
      ''
      'SELECT  D.MESREFERENCIA,'
      '        SUBSTR(PD.DESCRICAO,1,40) DESCRICAO,'
      '        PD.CODPROVDESC,'
      '        NVL(TRUNC(D.VALORMANT,2),0) VALORMANT,'
      '        RI.RUBRICAINSS,'
      '        NVL(TRUNC(D.VALORINSS,2),0) VALORINSS,'
      '        D.CODMANTENEDORINSS,'
      '        D.NUMPROCINSS,'
      '        '#39' '#39' MANT,'
      '        E.MATRICULA,'
      '        P.NOME,'
      '        B.NOME NOMEBENEF,'
      '        (NVL(D.VALORMANT,0) - NVL(D.VALORINSS,0)) AS DIF,'
      '        1 GRUPO'
      'FROM '#9'DETCONCINSS D, PROVDESC PD,  RUBRICAXINSS RI,'
      #9'BENEFBFCIARIO BF, ELEGPATRO E, PESSOA P,'
      #9'BENEFICIO B'
      'WHERE D.IDPESSOA = :IDPESSOA'
      '  AND PD.IDPROVENTO = D.IDRUBRICA'
      '  AND RI.IDRUBRICA = PD.IDPROVENTO'
      '  AND RI.FLGRUBCENTRAL =1'
      '  AND BF.IDPESSOA = D.IDPESSOA'
      '  AND BF.NUMPROCINSS = D.NUMPROCINSS'
      '  AND BF.IDBENEFICIO = D.IDBENEFICIO'
      '  AND E.IDPESSOA     = D.IDPESSOA'
      '  AND P.IDPESSOA     = E.IDPESSOA'
      '  AND B.IDBENEFICIO = D.IDBENEFICIO'
      ''
      'UNION'
      ''
      'SELECT  D.MESREFERENCIA,'
      '        SUBSTR(PD.DESCRICAO,1,40) DESCRICAO,'
      '        PD.CODPROVDESC,'
      '        NVL(TRUNC(D.VALORMANT,2),0) VALORMANT,'
      '        RI.RUBRICAINSS,'
      '        NVL(TRUNC(D.VALORINSS,2),0) VALORINSS,'
      '        D.CODMANTENEDORINSS,'
      '        D.NUMPROCINSS,'
      '        '#39' '#39' MANT,'
      '        E.MATRICULA,'
      '        P.NOME,'
      '        B.NOME NOMEBENEF,'
      '        (NVL(D.VALORMANT,0) - NVL(D.VALORINSS,0)) AS DIF,'
      '        1 GRUPO'
      'FROM '#9'DETCONCINSS D, PROVDESC PD,  RUBRICAXINSS RI,'
      #9'BENEFBFCIARIO BF,  DEPENTIT E, PESSOA P,'
      #9'BENEFICIO B'
      'WHERE D.IDPESSOA = :IDPESSOA'
      '  AND PD.IDPROVENTO = D.IDRUBRICA'
      '  AND RI.IDRUBRICA = PD.IDPROVENTO'
      '  AND RI.FLGRUBCENTRAL =1'
      '  AND BF.IDPESSOA = D.IDPESSOA'
      '  AND BF.NUMPROCINSS = D.NUMPROCINSS'
      '  AND BF.IDBENEFICIO = D.IDBENEFICIO'
      '  AND E.IDPESSOA     = D.IDPESSOA'
      '  AND P.IDPESSOA     = E.IDPESSOA'
      '  AND B.IDBENEFICIO = D.IDBENEFICIO'
      ''
      ''
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 514
    Top = 147
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
        Value = '445703'
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object ds: TwwDataSource
    DataSet = qry
    Left = 522
    Top = 213
  end
  object MontaSelect1: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'P.NOME')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Nome')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'PESSOA P')
    CamposChave.Strings = (
      'P.IDPESSOA'
      'P.NOME')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '45')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 468
    Top = 115
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 373
    Top = 149
  end
end
