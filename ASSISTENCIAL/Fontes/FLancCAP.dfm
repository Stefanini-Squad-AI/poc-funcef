inherited FrmLancCap: TFrmLancCap
  Left = 17
  Top = 100
  Caption = 'Lançamento de Despesas no CAP'
  ClientHeight = 425
  ClientWidth = 791
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 791
    Height = 386
    object PgcLancamento: TPageControl
      Left = 1
      Top = 1
      Width = 789
      Height = 384
      ActivePage = TabLancamento
      Align = alClient
      TabOrder = 0
      object TabLancamento: TTabSheet
        Caption = '&Lançamentos'
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 781
          Height = 54
          Align = alTop
          TabOrder = 0
          object Bevel1: TBevel
            Left = 3
            Top = 2
            Width = 238
            Height = 48
          end
          object Label1: TLabel
            Left = 8
            Top = 8
            Width = 90
            Height = 13
            Caption = 'Mês Referência'
          end
          object Label2: TLabel
            Left = 650
            Top = 9
            Width = 116
            Height = 13
            Caption = 'Data de Vencimento'
          end
          object cmdtpkDataVencimento: TCMDateTimePicker
            Left = 649
            Top = 24
            Width = 121
            Height = 21
            CalendarAttributes.Font.Charset = DEFAULT_CHARSET
            CalendarAttributes.Font.Color = clWindowText
            CalendarAttributes.Font.Height = -11
            CalendarAttributes.Font.Name = 'MS Sans Serif'
            CalendarAttributes.Font.Style = []
            ButtonStyle = cbsCustom
            Epoch = 1950
            ButtonGlyph.Data = {
              06050000424D06050000000000003604000028000000100000000D0000000100
              080000000000D000000000000000000000000001000000000000000000000000
              80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
              A6000020400000206000002080000020A0000020C0000020E000004000000040
              20000040400000406000004080000040A0000040C0000040E000006000000060
              20000060400000606000006080000060A0000060C0000060E000008000000080
              20000080400000806000008080000080A0000080C0000080E00000A0000000A0
              200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
              200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
              200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
              20004000400040006000400080004000A0004000C0004000E000402000004020
              20004020400040206000402080004020A0004020C0004020E000404000004040
              20004040400040406000404080004040A0004040C0004040E000406000004060
              20004060400040606000406080004060A0004060C0004060E000408000004080
              20004080400040806000408080004080A0004080C0004080E00040A0000040A0
              200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
              200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
              200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
              20008000400080006000800080008000A0008000C0008000E000802000008020
              20008020400080206000802080008020A0008020C0008020E000804000008040
              20008040400080406000804080008040A0008040C0008040E000806000008060
              20008060400080606000806080008060A0008060C0008060E000808000008080
              20008080400080806000808080008080A0008080C0008080E00080A0000080A0
              200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
              200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
              200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
              2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
              2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
              2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
              2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
              2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
              2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
              2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
              000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
              A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
              A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
              A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
              FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
              04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
              000000000000000000FF}
            ShowButton = True
            TabOrder = 0
          end
          object dblkMesRef: TwwDBLookupCombo
            Left = 9
            Top = 23
            Width = 105
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'MESCOBRANCA'#9'7'#9'MESCOBRANCA'#9'F')
            LookupTable = qryMeses
            LookupField = 'MESCOBRANCA'
            TabOrder = 1
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
          end
          object bbtnProcurar: TBitBtn
            Left = 118
            Top = 21
            Width = 117
            Height = 24
            Hint = 'Procurar participante'
            Caption = '&Buscar Valores'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            ParentFont = False
            ParentShowHint = False
            ShowHint = True
            TabOrder = 2
            OnClick = sBtnProbocurarClick
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
        end
        object drgrValores: TwwDBGrid
          Left = 0
          Top = 54
          Width = 781
          Height = 302
          Selected.Strings = (
            'PATRO'#9'15'#9'Patrocinadora'
            'ATIVPROJETO'#9'24'#9'Atividade/Projeto'
            'CENTRESPON'#9'25'#9'Centro de~Responsabilidade'
            'DESEMB'#9'21'#9'Tipo de~desembolso'
            'TOTAL_BRUTO'#9'10'#9'Valor'
            'FLGLANCCCAP'#9'6'#9'Lançar~no CAP')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsValores
          Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgShowFooter]
          TabOrder = 1
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 2
          TitleButtons = False
          OnCalcCellColors = drgrValoresCalcCellColors
          IndicatorColor = icBlack
        end
      end
      object TabExclui: TTabSheet
        Caption = 'E&xclusão'
        ImageIndex = 1
        object Panel2: TPanel
          Left = 0
          Top = 0
          Width = 773
          Height = 49
          Align = alTop
          TabOrder = 0
          object btnProcurar: TBitBtn
            Left = 8
            Top = 5
            Width = 86
            Height = 40
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
            TabOrder = 0
            OnClick = btnProcurarClick
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
        end
        object Panel3: TPanel
          Left = 0
          Top = 49
          Width = 773
          Height = 299
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 1
          object Label3: TLabel
            Left = 35
            Top = 66
            Width = 95
            Height = 13
            Caption = 'Cod. Documento'
          end
          object Label4: TLabel
            Left = 36
            Top = 17
            Width = 194
            Height = 13
            Caption = 'Usuário que Lançou o Documento'
          end
          object Label5: TLabel
            Left = 170
            Top = 66
            Width = 77
            Height = 13
            Caption = 'Num. Lancto.'
          end
          object Label6: TLabel
            Left = 170
            Top = 118
            Width = 134
            Height = 13
            Caption = 'Histórico Complementar'
          end
          object Label7: TLabel
            Left = 580
            Top = 66
            Width = 30
            Height = 13
            Caption = 'Valor'
          end
          object Label8: TLabel
            Left = 445
            Top = 66
            Width = 93
            Height = 13
            Caption = 'Data de Lancto.'
          end
          object Label9: TLabel
            Left = 307
            Top = 66
            Width = 93
            Height = 13
            Caption = 'Código. Planilha'
          end
          object Label10: TLabel
            Left = 35
            Top = 118
            Width = 116
            Height = 13
            Caption = 'Data de Vencimento'
          end
          object dbedUsu: TwwDBEdit
            Left = 34
            Top = 32
            Width = 329
            Height = 21
            Color = clScrollBar
            Enabled = False
            TabOrder = 0
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbedCodDoc: TwwDBEdit
            Left = 34
            Top = 81
            Width = 111
            Height = 21
            Color = clScrollBar
            Enabled = False
            TabOrder = 1
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbedNumLancto: TwwDBEdit
            Left = 171
            Top = 81
            Width = 111
            Height = 21
            Color = clScrollBar
            Enabled = False
            TabOrder = 2
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbedCodPln: TwwDBEdit
            Left = 308
            Top = 81
            Width = 111
            Height = 21
            Color = clScrollBar
            Enabled = False
            TabOrder = 3
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbedHist: TwwDBEdit
            Left = 171
            Top = 133
            Width = 521
            Height = 21
            Color = clScrollBar
            Enabled = False
            TabOrder = 4
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbedData: TwwDBEdit
            Left = 446
            Top = 81
            Width = 111
            Height = 21
            Color = clScrollBar
            Enabled = False
            TabOrder = 5
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbedValor: TwwDBEdit
            Left = 581
            Top = 81
            Width = 111
            Height = 21
            Color = clScrollBar
            Enabled = False
            TabOrder = 6
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object dbedDataVencto: TwwDBEdit
            Left = 33
            Top = 133
            Width = 111
            Height = 21
            Color = clScrollBar
            Enabled = False
            TabOrder = 7
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 386
    Width = 791
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        OnClick = BitBtn3Click
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 523
    Top = 11
  end
  object qryMeses: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT MESCOBRANCA '
      'FROM HSTCONTRIBASS ORDER BY MESCOBRANCA DESC')
    ValidateWithMask = True
    Left = 256
    Top = 16
  end
  object qryValores: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  PJ.IDPESSOA,'
      '  PJ.NOME AS PATRO,'
      '  HT.MES,'
      '  UN.NOME AS ATIVPROJETO,'
      '  CT.NOME AS CENTRESPON,'
      '  TD.DESCRICAO AS DESEMB,'
      '  SUM(HT.VALORESPERADO) AS TOTAL_BRUTO,'
      '  PT.CDCRESPONASS, '
      '  PT.CCUSTOASS, '
      '  PT.ATIVPROJETOASS, '
      '  PT.TIPODESEMBASS, '
      '  PT.CCCREDITOASS, '
      '  PT.CCDEBITOASS, '
      '  PT.CODPROGRAMAASS, '
      '  0 AS FLGLANCCCAP,'
      '  PT.IDFORCLIASS     '
      
        'FROM HSTCONTRIBASS HT, PESSOA PJ, PATRO PT, UNIDNEGOCIO UN,  CEN' +
        'TRESPON CT, TIPORECEBDESEMB TD'
      'WHERE HT.MES = :mesref'
      '      AND PJ.IDPESSOA        = HT.IDPESSJUR'
      '      AND PT.IDPESSOA        = PJ.IDPESSOA '
      '      AND PT.ATIVPROJETOASS  = UN.UNIDNEGOC'
      '      AND TRIM(UNETIPO)      = '#39'A'#39
      '      AND CT.CODCENTRORESPON = PT.CDCRESPONASS'
      '      AND TD.CODTIPRECDES    = PT.TIPODESEMBASS'
      '      AND TD.IDPESSOA        =  :IDFUNDACAO'
      '      AND TD.RECPAG          = '#39'P'#39
      'GROUP BY PJ.IDPESSOA,'
      '         PJ.NOME,'
      '         HT.MES,'
      '         PT.CDCRESPONASS, '
      '         PT.CCUSTOASS, '
      '         PT.ATIVPROJETOASS, '
      '         PT.TIPODESEMBASS, '
      '         PT.CCCREDITOASS, '
      '         PT.CCDEBITOASS, '
      '         PT.CODPROGRAMAASS,'
      '         UN.NOME,'
      '         CT.NOME,'
      '         TD.DESCRICAO,'
      '          PT.IDFORCLIASS       '
      'ORDER BY PJ.NOME'
      ' ')
    UpdateObject = UPDValores
    ControlType.Strings = (
      'FLGLANCCCAP;CheckBox;1;0')
    ValidateWithMask = True
    Left = 437
    Top = 312
    ParamData = <
      item
        DataType = ftString
        Name = 'mesref'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptInput
      end>
    object qryValoresPATRO: TStringField
      DisplayLabel = 'Patrocinadora'
      DisplayWidth = 15
      FieldName = 'PATRO'
      Size = 60
    end
    object qryValoresATIVPROJETO: TStringField
      DisplayLabel = 'Atividade/Projeto'
      DisplayWidth = 24
      FieldName = 'ATIVPROJETO'
      Size = 25
    end
    object qryValoresCENTRESPON: TStringField
      DisplayLabel = 'Centro de~Responsabilidade'
      DisplayWidth = 25
      FieldName = 'CENTRESPON'
      FixedChar = True
      Size = 30
    end
    object qryValoresDESEMB: TStringField
      DisplayLabel = 'Tipo de~desembolso'
      DisplayWidth = 21
      FieldName = 'DESEMB'
      Size = 35
    end
    object qryValoresTOTAL_BRUTO: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 10
      FieldName = 'TOTAL_BRUTO'
    end
    object qryValoresFLGLANCCCAP: TFloatField
      DisplayLabel = 'Lançar~no CAP'
      DisplayWidth = 6
      FieldName = 'FLGLANCCCAP'
      OnChange = qryValoresFLGLANCCCAPChange
    end
    object qryValoresIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryValoresMES: TStringField
      DisplayWidth = 7
      FieldName = 'MES'
      Visible = False
      Size = 7
    end
    object qryValoresCDCRESPONASS: TFloatField
      DisplayWidth = 10
      FieldName = 'CDCRESPONASS'
      Visible = False
    end
    object qryValoresCCUSTOASS: TFloatField
      DisplayWidth = 10
      FieldName = 'CCUSTOASS'
      Visible = False
    end
    object qryValoresATIVPROJETOASS: TFloatField
      DisplayWidth = 10
      FieldName = 'ATIVPROJETOASS'
      Visible = False
    end
    object qryValoresTIPODESEMBASS: TFloatField
      DisplayWidth = 10
      FieldName = 'TIPODESEMBASS'
      Visible = False
    end
    object qryValoresCCCREDITOASS: TFloatField
      DisplayWidth = 10
      FieldName = 'CCCREDITOASS'
      Visible = False
    end
    object qryValoresCCDEBITOASS: TFloatField
      DisplayWidth = 10
      FieldName = 'CCDEBITOASS'
      Visible = False
    end
    object qryValoresCODPROGRAMAASS: TFloatField
      DisplayWidth = 10
      FieldName = 'CODPROGRAMAASS'
      Visible = False
    end
    object qryValoresIDFORCLIASS: TFloatField
      DisplayWidth = 10
      FieldName = 'IDFORCLIASS'
      Visible = False
    end
  end
  object dsValores: TwwDataSource
    DataSet = qryValores
    Left = 488
    Top = 312
  end
  object UPDValores: TUpdateSQL
    Left = 544
    Top = 312
  end
  object qryGlobal: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM PARAMGLOBAL')
    ValidateWithMask = True
    Left = 305
    Top = 309
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 372
    Top = 314
  end
  object msLanctos: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Lançamentos'
    Colunas.Strings = (
      'DOCUMENTO.CODDOCUMENTO'
      'USUARIOSISTEMA.NOMEUSUARIO'
      'LANCTODOCUM.NUMLANCTO'
      'LANCTODOCUM.HISTORICOCOMPL'
      'LANCTODOCUM.VALOR'
      'LANCTODOCUM.DATALANCTO'
      'LANCTODOCUM.PLNCODIGO')
    TipodeDado.Strings = (
      'N'
      'C'
      'N'
      'C'
      'N'
      'D'
      'N')
    Descricao.Strings = (
      'Código do Documento'
      'Usuário'
      'Num. Lancto.'
      'Historico'
      'Valor'
      'Data de Lancto.'
      'Num. Planilha')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'LANCTODOCUM'
      'DOCUMENTO'
      'USUARIOSISTEMA'
      'PLANILHA')
    CamposChave.Strings = (
      'LANCTODOCUM.CODDOCUMENTO'
      'LANCTODOCUM.PLNCODIGO'
      'LANCTODOCUM.DATALANCTO'
      'USUARIOSISTEMA.NOMEUSUARIO'
      'LANCTODOCUM.NUMLANCTO'
      'LANCTODOCUM.VALOR'
      'LANCTODOCUM.HISTORICOCOMPL'
      'DOCUMENTO.DATAVENCTO'
      'DOCUMENTO.NODOCUMENTO'
      'PLANILHA.PLNEFETIVADO')
    Filtro.Strings = (
      'DOCUMENTO.IDMODULO = 17'
      'DOCUMENTO.RECPAG = '#39'P'#39
      'LANCTODOCUM.CODDOCUMENTO = DOCUMENTO.CODDOCUMENTO'
      'LANCTODOCUM.PLNCODIGO = PLANILHA.PLNCODIGO(+)')
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
      '20'
      '10'
      '60'
      '10'
      '18'
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 361
    Top = 37
  end
end
