inherited frmConsDOCAlimReserva: TfrmConsDOCAlimReserva
  Left = 281
  Top = 29
  HelpContext = 160061
  Caption = 'Consulta a Documentos a Baixar para Alimentação de Reserva'
  ClientHeight = 445
  ClientWidth = 614
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 614
    Height = 406
    object dbgrdDocumentos: TwwDBGrid
      Left = 1
      Top = 149
      Width = 612
      Height = 256
      Selected.Strings = (
        'NODOCUMENTO'#9'10'#9'Documento Nº'
        'COMPLDOCUMENTO'#9'3'#9'Compl.'
        'VALOR'#9'10'#9'Valor'
        'IDLOTE'#9'10'#9'Lote Nº'
        'DATALANCTO'#9'10'#9'Data da ~Baixa'
        'SITUACAO'#9'31'#9'Situação do Documento')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      Align = alClient
      DataSource = dsDocumentos
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      TitleAlignment = taLeftJustify
      TitleFont.Charset = DEFAULT_CHARSET
      TitleFont.Color = clWindowText
      TitleFont.Height = -9
      TitleFont.Name = 'MS Sans Serif'
      TitleFont.Style = [fsBold]
      TitleLines = 2
      TitleButtons = False
      OnCalcCellColors = dbgrdDocumentosCalcCellColors
      IndicatorColor = icBlack
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 1
      Width = 612
      Height = 148
      Align = alTop
      TabOrder = 1
      object Label1: TLabel
        Left = 16
        Top = 9
        Width = 122
        Height = 13
        Caption = 'Ano/Mês (AAAA/MM)'
      end
      object Label2: TLabel
        Left = 16
        Top = 52
        Width = 80
        Height = 13
        Caption = 'Patrocinadora'
      end
      object Label5: TLabel
        Left = 16
        Top = 92
        Width = 118
        Height = 13
        Caption = 'Plano Previdenciário'
      end
      object EDANOMES: TEdit
        Left = 16
        Top = 25
        Width = 121
        Height = 21
        TabOrder = 0
      end
      object dblkpcmbPatro: TwwDBLookupCombo
        Left = 16
        Top = 68
        Width = 385
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'Patrocinadora')
        LookupTable = qryPatro
        LookupField = 'IDPESSOA'
        Options = [loTitles]
        ParentFont = False
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
      object dblkpcmbPlano: TwwDBLookupCombo
        Left = 16
        Top = 108
        Width = 385
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'Plano')
        LookupTable = qryPlanPrev
        LookupField = 'IDPLANOPREV'
        Options = [loTitles]
        ParentFont = False
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
      end
      object bbtnProcurar: TBitBtn
        Left = 313
        Top = 25
        Width = 88
        Height = 37
        Hint = 'Procurar participante'
        Caption = '&Consultar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 3
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
      end
      object Panel1: TPanel
        Left = 416
        Top = 16
        Width = 183
        Height = 121
        TabOrder = 4
        object Label3: TLabel
          Left = 8
          Top = 8
          Width = 50
          Height = 13
          Caption = 'Legenda'
        end
        object Label4: TLabel
          Left = 48
          Top = 32
          Width = 73
          Height = 13
          Caption = 'Não Baixado'
        end
        object Label6: TLabel
          Left = 48
          Top = 56
          Width = 123
          Height = 13
          Caption = 'Parcialmente Baixado'
        end
        object Label7: TLabel
          Left = 48
          Top = 80
          Width = 113
          Height = 13
          Caption = 'Totalmente Baixado'
        end
        object Panel2: TPanel
          Left = 8
          Top = 32
          Width = 33
          Height = 17
          Color = clRed
          TabOrder = 0
        end
        object Panel3: TPanel
          Left = 8
          Top = 56
          Width = 33
          Height = 17
          Color = clYellow
          TabOrder = 1
        end
        object Panel4: TPanel
          Left = 8
          Top = 80
          Width = 33
          Height = 17
          Color = clTeal
          TabOrder = 2
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 406
    Width = 614
    inherited tb97Fundo: TToolbar97
      Left = 421
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 11
    Top = 403
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.IDPESSOA, P.NOME'
      'FROM  PESSOA P, PATRO PT'
      'WHERE PT.IDPESSOA = P.IDPESSOA'
      'AND   PT.IDFUNDACAO = :IDFUNDACAO'
      'ORDER BY P.NOME'
      ' ')
    ValidateWithMask = True
    Left = 165
    Top = 8
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object qryPlanPrev: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPLANOPREV, NOME FROM PLANPREV'
      
        'WHERE PLANPREV.IDPLANOPREV IN (SELECT PLP.IDPLANOPREV FROM PLANP' +
        'REVPATRO PLP, PATRO P'
      
        '                               WHERE   P.IDFUNDACAO = :IDFUNDACA' +
        'O'
      
        '                               AND     PLP.IDPESSJUR = P.IDPESSO' +
        'A )'
      'ORDER BY NOME'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 253
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
  end
  object qryDocumentos: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      
        'SELECT  D.NODOCUMENTO, D.COMPLDOCUMENTO, D.STATUS, L.DATALANCTO,' +
        ' SUM(H.VALORRECEBIDO) AS VALOR,'
      '        H.IDLOTE,'
      '        DECODE(D.STATUS, '#39'0'#39', '#39'Documento Não Baixado'#39','
      '                         '#39'1'#39', '#39'Documento Parcialmente Baixado '#39','
      
        '                         '#39'2'#39', '#39'Documento Totalmente Baixado '#39')  ' +
        'AS SITUACAO'
      'FROM    HSTCONTRIBPREV H, DOCUMENTO D, LANCTODOCUM L'
      'WHERE   (H.MESCOBRANCA = :ANOMESCOBRANCA)'
      'AND     (H.IDPESSJUR   = :IDPESSJUR)'
      'AND     (H.IDPLANOPREV = :IDPLANOPREV)'
      'AND     (H.FLGDEVOLUCAO = 0 )'
      'AND     (H.VALORRECEBIDO > 0 )'
      'AND     (H.VALORRECEBIDO IS NOT NULL )'
      'AND     (H.IDPESSOA <> H.IDPESSJUR                    )'
      'AND     (H.IDCONTRIBUICAO NOT IN (SELECT IDCONTRIBUICAO'
      '                                  FROM   PARAMDOTACAO'
      '                                  WHERE  IDPESSJUR = :IDPESSJUR'
      
        '                                  AND    IDPLANOPREV = :IDPLANOP' +
        'REV) )'
      ''
      'AND     (D.CODDOCUMENTO = H.CODDOCUMENTOPREV )'
      'AND     (D.CODDOCUMENTO = L.CODDOCUMENTO(+) ) '
      'AND     ((L.OPERACAO = '#39'5'#39') OR (L.OPERACAO IS NULL  ))'
      'AND     (H.FLGCALCRESERVA = 0 ) AND  (H.DATAULTALIM IS NULL )'
      
        'GROUP BY D.NODOCUMENTO,  D.COMPLDOCUMENTO, D.STATUS, L.DATALANCT' +
        'O, H.IDLOTE'
      'ORDER BY D.NODOCUMENTO, L.DATALANCTO'
      ' ')
    ValidateWithMask = True
    Left = 469
    Top = 341
    ParamData = <
      item
        DataType = ftString
        Name = 'ANOMESCOBRANCA'
        ParamType = ptUnknown
        Value = '2000/07'
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
        Value = 99
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
        Value = 12
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object dsDocumentos: TwwDataSource
    AutoEdit = False
    DataSet = qryDocumentos
    Left = 549
    Top = 357
  end
end
