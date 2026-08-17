inherited frmExportaTXT: TfrmExportaTXT
  Left = 207
  Top = 147
  HelpContext = 180044
  Caption = 'Tela de Exportação'
  ClientHeight = 404
  ClientWidth = 617
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 617
    Height = 365
    object Panel1: TPanel
      Left = 1
      Top = 1
      Width = 615
      Height = 91
      Align = alTop
      TabOrder = 0
      object Label5: TLabel
        Left = 216
        Top = 50
        Width = 244
        Height = 13
        Caption = 'Layout de Saida de Dados do Arquivo TXT'
      end
      object Label6: TLabel
        Left = 216
        Top = 10
        Width = 256
        Height = 13
        Caption = 'Layout de Entrada de Dados do Arquivo TXT'
      end
      object Label1: TLabel
        Left = 16
        Top = 10
        Width = 128
        Height = 13
        Caption = 'Mês/Ano de Cobrança'
      end
      object dblcmbLayout: TwwDBLookupCombo
        Left = 216
        Top = 24
        Width = 369
        Height = 21
        DropDownAlignment = taLeftJustify
        LookupTable = qryLayoutDesconto
        LookupField = 'DESCRICAO'
        TabOrder = 4
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        OnChange = dblcmbLayoutChange
      end
      object dblcmblayoutsaida: TwwDBLookupCombo
        Left = 216
        Top = 64
        Width = 369
        Height = 21
        DropDownAlignment = taLeftJustify
        LookupTable = qryLayoutDescontoSaida
        LookupField = 'DESCRICAO'
        TabOrder = 5
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
      end
      object chkAbonoAnual: TCheckBox
        Left = 24
        Top = 52
        Width = 97
        Height = 17
        Caption = 'Abono Anual'
        TabOrder = 3
      end
      object cboxMes: TComboBox
        Left = 16
        Top = 24
        Width = 122
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ItemHeight = 13
        ParentFont = False
        TabOrder = 0
        OnExit = cboxMesExit
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
      object edAno: TEdit
        Left = 136
        Top = 24
        Width = 41
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        Text = '2000'
        OnExit = edAnoExit
      end
      object UpDown1: TUpDown
        Left = 177
        Top = 24
        Width = 16
        Height = 21
        Associate = edAno
        Min = 1999
        Max = 4000
        Position = 2000
        TabOrder = 2
        Thousands = False
        Wrap = False
      end
    end
    object pnlNomeArquivo: TPanel
      Left = 1
      Top = 284
      Width = 615
      Height = 80
      Align = alBottom
      TabOrder = 3
      object Label4: TLabel
        Left = 8
        Top = 6
        Width = 219
        Height = 13
        Caption = 'Nome do Arquivo TXT a ser Exportado'
      end
      object Bevel1: TBevel
        Left = 8
        Top = 20
        Width = 509
        Height = 17
      end
      object LabelNomeArqTxt: TLabel
        Left = 12
        Top = 22
        Width = 489
        Height = 13
        AutoSize = False
        Caption = 'C:\'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lbGerando: TLabel
        Left = 10
        Top = 68
        Width = 239
        Height = 13
        Caption = 'Gerando o arquivo de retorno. Aguarde ...'
        Visible = False
      end
      object spdDestino: TSpeedButton
        Left = 524
        Top = 15
        Width = 72
        Height = 26
        Caption = 'Destino'
        Glyph.Data = {
          F6000000424DF600000000000000760000002800000010000000100000000100
          0400000000008000000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          555555500000000000005577777777777700557FB8B8B8B8B70057FB8B8B8B8B
          807057F8B8B8B8B870707F8B8B8B8B8B07707FFFFFFFFFF70870777777777777
          7B7057F8B8B8B8B8B87057FB8B8B8FFFFF7057F8B8B8F7777775557FFFFF7555
          5555555777775555555555555555555555555555555555555555}
        OnClick = spdDestinoClick
      end
      object ProgressBar1: TProgressBar
        Left = 1
        Top = 62
        Width = 613
        Height = 17
        Align = alBottom
        Min = 0
        Max = 100
        Smooth = True
        TabOrder = 0
        Visible = False
      end
      object chkIgnoraExcesso: TCheckBox
        Left = 16
        Top = 40
        Width = 497
        Height = 17
        Caption = 'NÃO considerar valores não descontados por excesso de débito'
        TabOrder = 1
      end
    end
    object pnlRubricas: TPanel
      Left = 1
      Top = 169
      Width = 615
      Height = 115
      Align = alClient
      TabOrder = 2
      Visible = False
      object lblRubricas: TLabel
        Left = 1
        Top = 1
        Width = 613
        Height = 16
        Align = alTop
        Alignment = taCenter
        Caption = 'Rubricas para Geração de Arquivo'
        Color = clNavy
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object chkLstRubrica: TCheckListBox
        Left = 1
        Top = 17
        Width = 613
        Height = 97
        Align = alClient
        ItemHeight = 13
        TabOrder = 0
      end
    end
    object pnlVersao: TPanel
      Left = 1
      Top = 92
      Width = 615
      Height = 77
      Align = alTop
      TabOrder = 1
      Visible = False
      object Label3: TLabel
        Left = 1
        Top = 1
        Width = 613
        Height = 16
        Align = alTop
        Alignment = taCenter
        Caption = 'Versões de Pagamento'
        Color = clNavy
        Font.Charset = ANSI_CHARSET
        Font.Color = clWhite
        Font.Height = -13
        Font.Name = 'Arial'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
      end
      object chkVersao: TCheckListBox
        Left = 1
        Top = 17
        Width = 613
        Height = 59
        OnClickCheck = chkVersaoClickCheck
        Align = alClient
        ItemHeight = 13
        TabOrder = 0
      end
    end
  end
  inherited Dock971: TDock97
    Top = 365
    Width = 617
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 995
    Top = 3
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryLayoutDesconto: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM'
      'LAYOUTDESCONTO'
      'ORDER BY DESCRICAO'
      ' ')
    ValidateWithMask = True
    Left = 144
    Top = 232
  end
  object SaveDlg: TSaveDialog
    DefaultExt = '.txt'
    Filter = 'Arquivos texto|*.txt|Todos os arquivos|*.*'
    InitialDir = 'c:\'
    Title = 'Salvar arquivo de retorno ao convênio'
    Left = 456
    Top = 304
  end
  object qryLayoutXColunas: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM'
      'LAYOUTXCOLUNAS'
      'WHERE'
      'IDLAYOUT = :IDLAYOUT')
    ValidateWithMask = True
    Left = 144
    Top = 216
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDLAYOUT'
        ParamType = ptUnknown
      end>
    object qryLayoutXColunasIDLAYOUT: TFloatField
      FieldName = 'IDLAYOUT'
      Origin = 'BASEDADOS.LAYOUTXCOLUNAS.IDLAYOUT'
    end
    object qryLayoutXColunasCOLVALOR: TFloatField
      FieldName = 'COLVALOR'
      Origin = 'BASEDADOS.LAYOUTXCOLUNAS.COLVALOR'
    end
    object qryLayoutXColunasTAMVALOR: TFloatField
      FieldName = 'TAMVALOR'
      Origin = 'BASEDADOS.LAYOUTXCOLUNAS.TAMVALOR'
    end
    object qryLayoutXColunasIDRUBRICA: TFloatField
      FieldName = 'IDRUBRICA'
      Origin = 'BASEDADOS.LAYOUTXCOLUNAS.IDRUBRICA'
    end
    object qryLayoutXColunasIDFAVORECIDO: TFloatField
      FieldName = 'IDFAVORECIDO'
      Origin = 'BASEDADOS.LAYOUTXCOLUNAS.IDFAVORECIDO'
    end
    object qryLayoutXColunasPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'BASEDADOS.LAYOUTXCOLUNAS.PLANO'
    end
    object qryLayoutXColunasPLACONTAC: TStringField
      FieldName = 'PLACONTAC'
      Origin = 'BASEDADOS.LAYOUTXCOLUNAS.PLACONTAC'
      FixedChar = True
      Size = 18
    end
    object qryLayoutXColunasPLACONTAD: TStringField
      FieldName = 'PLACONTAD'
      Origin = 'BASEDADOS.LAYOUTXCOLUNAS.PLACONTAD'
      FixedChar = True
      Size = 18
    end
    object qryLayoutXColunasCODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      Origin = 'BASEDADOS.LAYOUTXCOLUNAS.CODCENTRORESPON'
      FixedChar = True
      Size = 10
    end
    object qryLayoutXColunasUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Origin = 'BASEDADOS.LAYOUTXCOLUNAS.UNIDNEGOC'
    end
    object qryLayoutXColunasIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Origin = 'BASEDADOS.LAYOUTXCOLUNAS.IDEMPRESA'
    end
    object qryLayoutXColunasCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Origin = 'BASEDADOS.LAYOUTXCOLUNAS.CODCENTROCUSTO'
      FixedChar = True
      Size = 10
    end
    object qryLayoutXColunasRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'BASEDADOS.LAYOUTXCOLUNAS.RECPAG'
      FixedChar = True
      Size = 1
    end
    object qryLayoutXColunasCODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      Origin = 'BASEDADOS.LAYOUTXCOLUNAS.CODTIPRECDES'
      FixedChar = True
      Size = 15
    end
    object qryLayoutXColunasTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.LAYOUTXCOLUNAS.TRGDTINCLUSAO'
    end
    object qryLayoutXColunasTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.LAYOUTXCOLUNAS.TRGUSERINCLUSAO'
      Size = 30
    end
    object qryLayoutXColunasNUMDECIMAIS: TFloatField
      FieldName = 'NUMDECIMAIS'
      Origin = 'BASEDADOS.LAYOUTXCOLUNAS.NUMDECIMAIS'
    end
    object qryLayoutXColunasCARACDECIMAL: TStringField
      FieldName = 'CARACDECIMAL'
      Origin = 'BASEDADOS.LAYOUTXCOLUNAS.CARACDECIMAL'
      FixedChar = True
      Size = 1
    end
    object qryLayoutXColunasIDRUBRICADEVOL: TFloatField
      FieldName = 'IDRUBRICADEVOL'
      Origin = 'BASEDADOS.LAYOUTXCOLUNAS.IDRUBRICADEVOL'
    end
    object qryLayoutXColunasCOLPARCELAS: TFloatField
      FieldName = 'COLPARCELAS'
      Origin = 'BASEDADOS.LAYOUTXCOLUNAS.COLPARCELAS'
    end
    object qryLayoutXColunasTAMPARCELAS: TFloatField
      FieldName = 'TAMPARCELAS'
      Origin = 'BASEDADOS.LAYOUTXCOLUNAS.TAMPARCELAS'
    end
    object qryLayoutXColunasCOLOCORRENCIAS: TFloatField
      FieldName = 'COLOCORRENCIAS'
      Origin = 'BASEDADOS.LAYOUTXCOLUNAS.COLOCORRENCIAS'
    end
    object qryLayoutXColunasTAMOCORRENCIAS: TFloatField
      FieldName = 'TAMOCORRENCIAS'
      Origin = 'BASEDADOS.LAYOUTXCOLUNAS.TAMOCORRENCIAS'
    end
    object qryLayoutXColunasCOLRUBRICA: TFloatField
      FieldName = 'COLRUBRICA'
      Origin = 'BASEDADOS.LAYOUTXCOLUNAS.COLRUBRICA'
    end
    object qryLayoutXColunasTAMRUBRICA: TFloatField
      FieldName = 'TAMRUBRICA'
      Origin = 'BASEDADOS.LAYOUTXCOLUNAS.TAMRUBRICA'
    end
    object qryLayoutXColunasIDREGRA: TFloatField
      FieldName = 'IDREGRA'
      Origin = 'BASEDADOS.LAYOUTXCOLUNAS.IDREGRA'
    end
    object qryLayoutXColunasCOLVALINFO: TFloatField
      FieldName = 'COLVALINFO'
      Origin = 'BASEDADOS.LAYOUTXCOLUNAS.COLVALINFO'
    end
    object qryLayoutXColunasTAMVALINFO: TFloatField
      FieldName = 'TAMVALINFO'
      Origin = 'BASEDADOS.LAYOUTXCOLUNAS.TAMVALINFO'
    end
    object qryLayoutXColunasCARACNATUREZA: TStringField
      FieldName = 'CARACNATUREZA'
      Origin = 'BASEDADOS.LAYOUTXCOLUNAS.CARACNATUREZA'
      FixedChar = True
      Size = 1
    end
    object qryLayoutXColunasCOLNATUREZA: TFloatField
      FieldName = 'COLNATUREZA'
      Origin = 'BASEDADOS.LAYOUTXCOLUNAS.COLNATUREZA'
    end
    object qryLayoutXColunasCOLOPERACAO: TFloatField
      FieldName = 'COLOPERACAO'
      Origin = 'BASEDADOS.LAYOUTXCOLUNAS.COLOPERACAO'
    end
    object qryLayoutXColunasCOLMESREF: TStringField
      FieldName = 'COLMESREF'
      Origin = 'BASEDADOS.LAYOUTXCOLUNAS.COLMESREF'
      FixedChar = True
      Size = 7
    end
    object qryLayoutXColunasCOLCONTROLE: TFloatField
      FieldName = 'COLCONTROLE'
      Origin = 'BASEDADOS.LAYOUTXCOLUNAS.COLCONTROLE'
    end
    object qryLayoutXColunasTAMCONTROLE: TFloatField
      FieldName = 'TAMCONTROLE'
      Origin = 'BASEDADOS.LAYOUTXCOLUNAS.TAMCONTROLE'
    end
  end
  object qryHist: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      VALORPROVENTO'
      'FROM'
      '    HISTRUBSAL'
      'WHERE'
      '     ((MES           = :cMesRef)  AND'
      '      (CODPROVDESC   = :cRubrica) AND'
      '      (IDPESSOA      = :cPessoa))')
    ValidateWithMask = True
    Left = 280
    Top = 232
    ParamData = <
      item
        DataType = ftString
        Name = 'cMesRef'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'cRubrica'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'cPessoa'
        ParamType = ptUnknown
      end>
  end
  object qryTmp: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '       L.INSCRICAONUMERO,'
      '       E.MATRICULA,'
      '       D.NUMSEQUENCIA,'
      '       P.NOME,'
      '       T.VALOR,'
      '       T.VALORRECEBIDO,'
      '       T.IDPROVENTO,'
      '       T.ORDEM,'
      '       T.MESREFERENCIA,'
      '       T.MESCOBRANCA,'
      '       T.CODIGOCONTROLE'
      'FROM'
      '    TMPDESC T,'
      '    DEPENTIT D,'
      '    PESSOA P,'
      '    PARTPREVPLAN L,'
      '    ELEGPATRO E'
      'WHERE 1 = 2'
      ''
      ''
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 384
    Top = 208
  end
  object qryLayoutDescontoSaida: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      IDLAYOUTSAIDA,'
      '      DESCRICAO,'
      '      NVL(COLMATRICULA,0) COLMATRICULA,'
      '      NVL(TAMMATRICULA,0) TAMMATRICULA,'
      '      NVL(COLINSCRICAO,0) COLINSCRICAO,'
      '      NVL(TAMINSCRICAO,0) TAMINSCRICAO,'
      '      NVL(COLVALORRUB,0)  COLVALORRUB,'
      '      NVL(TAMVALORRUB,0)  TAMVALORRUB,'
      '      NVL(COLVALORDES,0)  COLVALORDES,'
      '      NVL(TAMVALORDES,0)  TAMVALORDES,'
      '      NVL(COLVALORDIF,0)  COLVALORDIF,'
      '      NVL(TAMVALORDIF,0)  TAMVALORDIF,'
      '      NVL(COLRUBRICA,0)   COLRUBRICA,'
      '      NVL(TAMRUBRICA,0)   TAMRUBRICA,'
      '      NVL(COLNOME,0)      COLNOME,'
      '      NVL(TAMNOME,0)      TAMNOME,'
      '      NVL(COLSEQDEP,0)    COLSEQDEP,'
      '      NVL(TAMSEQDEP,0)    TAMSEQDEP,'
      '      NVL(COLSEQRUB,0)    COLSEQRUB,'
      '      NVL(TAMSEQRUB,0)    TAMSEQRUB,'
      '      NVL(COLEXCESSO,0)   COLEXCESSO,'
      '      NVL(TAMEXCESSO,0)   TAMEXCESSO,'
      '      NVL(COLMESREF,0)    COLMESREF,'
      '      NVL(TAMMESREF,0)    TAMMESREF,'
      '      NVL(COLMESCOB,0)    COLMESCOB,'
      '      NVL(TAMMESCOB,0)    TAMMESCOB,'
      '      NVL(COLCONTROLE,0)  COLCONTROLE,'
      '      NVL(TAMCONTROLE,0)  TAMCONTROLE,'
      '      NVL(COLPRAZO,0)     COLPRAZO,'
      '      NVL(TAMPRAZO,0)     TAMPRAZO'
      'FROM LAYOUTDESCONTOSAIDA'
      'ORDER BY DESCRICAO'
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 144
    Top = 200
  end
  object qryCTRLInterface: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDLOTE'
      'FROM CTRLINTERFACE'
      'WHERE ROWNUM<2'
      ''
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 280
    Top = 216
  end
  object qryRIndiv: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT L.INSCRICAONUMERO,'
      '       E.MATRICULA,'
      '       D.NUMSEQUENCIA,'
      '       P.NOME,'
      '       T.VALORPROVENTO AS VALOR,'
      '       T.VALORRECEBIDO,'
      '       T.IDRUBRICA AS IDPROVENTO,'
      '       RI.SEQRUBRICAINDIV AS ORDEM,'
      '       RI.NUMOCORRENCIAS AS PRAZO,'
      '       PD.CODPROVDESC,'
      '       T.MES AS MESREFERENCIA,'
      '       T.MESCOBRANCA AS MESCOBRANCA'
      'FROM'
      '    HISTRUBSAL T,'
      '    DEPENTIT D,'
      '    PESSOA P,'
      '    PARTPREVPLAN L,'
      '    ELEGPATRO E,'
      '    PROVDESC PD,'
      '    RUBRICAINDIV RI'
      'WHERE'
      '     (T.MESCOBRANCA = :MESCOB)'
      '     AND (T.IDFAVORECIDO = :FAVORECIDO)'
      '     AND (T.IDMODULO = 18) '
      '     AND (T.IDPESSOA = E.IDPESSOA)'
      '     AND (T.IDPESSOA = L.IDPESSOA)'
      '     AND (L.FLGDESATIVADO = 0)'
      '     AND (T.IDTITULAR = D.IDTITULAR)'
      '     AND (T.IDPESSOA = D.IDPESSOA)'
      '     AND (T.IDPESSOA = P.IDPESSOA)'
      '     AND (PD.IDPROVENTO = T.IDRUBRICA)'
      '     AND RI.IDRUBRICA = PD.IDPROVENTO'
      '     AND RI.IDPESSOA = T.IDPESSOA'
      '     AND RI.IDFAVORECIDO = T.IDFAVORECIDO'
      '     AND RI.IDTITULAR = T.IDTITULAR'
      ''
      'ORDER BY L.INSCRICAONUMERO'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      ' '
      ' ')
    ValidateWithMask = True
    Left = 280
    Top = 200
    ParamData = <
      item
        DataType = ftString
        Name = 'MESCOB'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'FAVORECIDO'
        ParamType = ptUnknown
      end>
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 40
    Top = 216
  end
end
