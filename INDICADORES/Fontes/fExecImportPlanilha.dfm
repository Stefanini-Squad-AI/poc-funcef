inherited frmExecImportPlanilha: TfrmExecImportPlanilha
  Left = 152
  Top = 72
  HelpContext = 4390028
  Caption = 'Importação de Indicadores - Planilha'
  ClientHeight = 447
  ClientWidth = 590
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 590
    Height = 408
    inherited PagControle: TPageControl
      Width = 588
      Height = 406
      inherited tabSelecao: TTabSheet
        inherited lblTitulo: TfcLabel
          Width = 580
          Caption = 'Importação de Indicadores [Seleção da Planilha]'
        end
        object Label8: TLabel
          Left = 51
          Top = 241
          Width = 142
          Height = 13
          Caption = 'Planilha para Importação'
        end
        object Label12: TLabel
          Left = 52
          Top = 84
          Width = 104
          Height = 13
          Caption = 'Data da Apuração'
        end
        object Label2: TLabel
          Left = 51
          Top = 288
          Width = 105
          Height = 13
          Caption = 'Descrição do Lote'
        end
        object edtArqImporta: TEdit
          Left = 51
          Top = 255
          Width = 407
          Height = 21
          Enabled = False
          ReadOnly = True
          TabOrder = 0
        end
        object btnBuscaArq: TBitBtn
          Left = 459
          Top = 254
          Width = 25
          Height = 22
          Hint = 'Seleciona o arquivo para gravação do log de exceções.'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = btnBuscaArqClick
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
        object GroupBox3: TGroupBox
          Left = 51
          Top = 164
          Width = 434
          Height = 62
          Caption = 'Layout de Importação'
          TabOrder = 2
          object Label1: TLabel
            Left = 13
            Top = 17
            Width = 58
            Height = 13
            Caption = 'Descrição'
          end
          object btnBuscaLayOut: TBitBtn
            Left = 396
            Top = 30
            Width = 25
            Height = 22
            Hint = 'Seleciona o arquivo para gravação do log de exceções.'
            ParentShowHint = False
            ShowHint = True
            TabOrder = 0
            OnClick = btnBuscaLayOutClick
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
          object dbeDescLayOut: TDBEdit
            Left = 11
            Top = 31
            Width = 385
            Height = 21
            DataField = 'DESCRICAO'
            DataSource = dsLayOut
            TabOrder = 1
          end
        end
        object cmdtApura: TCMDateTimePicker
          Left = 53
          Top = 98
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
          TabOrder = 3
        end
        object rdbTipoLanca: TRadioGroup
          Left = 289
          Top = 84
          Width = 195
          Height = 44
          Caption = 'Tipo de Lançamento'
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'Realizado'
            'Previsto')
          TabOrder = 4
        end
        object ckbValorZero: TCheckBox
          Left = 53
          Top = 132
          Width = 161
          Height = 17
          Caption = 'Gravar valores zerados'
          Checked = True
          State = cbChecked
          TabOrder = 5
        end
        object EdtLote: TEdit
          Left = 52
          Top = 302
          Width = 433
          Height = 21
          TabOrder = 6
        end
        inline molImovelouMestre1: TmolImovelouMestre
          Left = 43
          Top = 32
          Width = 447
          Height = 50
          TabOrder = 7
          inherited lblImovelouMestre: TLabel
            Top = 1
          end
          inherited edtImovel: TEdit
            Width = 404
          end
          inherited btnBuscaImovel: TBitBtn
            Left = 414
          end
          inherited btnLimpaImovel: TBitBtn
            Left = 336
            Enabled = False
            Visible = False
          end
        end
      end
      inherited TabSheet1: TTabSheet
        inherited fcLabel1: TfcLabel
          Width = 580
          Caption = 'Importação de Indicadores [ Indicadores Processados ]'
        end
        object Panel1: TPanel
          Left = 0
          Top = 232
          Width = 580
          Height = 164
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 0
          object Panel3: TPanel
            Left = 0
            Top = 0
            Width = 580
            Height = 27
            Align = alTop
            BevelInner = bvRaised
            BevelOuter = bvLowered
            Caption = 'Log de erros da importação'
            Color = clNavy
            Font.Charset = ANSI_CHARSET
            Font.Color = clWhite
            Font.Height = -16
            Font.Name = 'Courier New'
            Font.Style = [fsBold]
            ParentFont = False
            TabOrder = 0
          end
          object memLogExcecao: TwwDBRichEdit
            Left = 0
            Top = 27
            Width = 580
            Height = 137
            ScrollBars = ssVertical
            Align = alClient
            AutoURLDetect = False
            PopupMenu = PopupMenu1
            PrintJobName = 'Delphi 5'
            ReadOnly = True
            TabOrder = 1
            EditorCaption = 'Edit Rich Text'
            EditorPosition.Left = 0
            EditorPosition.Top = 0
            EditorPosition.Width = 0
            EditorPosition.Height = 0
            MeasurementUnits = muInches
            PrintMargins.Top = 1
            PrintMargins.Bottom = 1
            PrintMargins.Left = 1
            PrintMargins.Right = 1
            RichEditVersion = 2
            Data = {
              750000007B5C727466315C616E73695C616E7369637067313235325C64656666
              305C6465666C616E67313034367B5C666F6E7474626C7B5C66305C666E696C20
              4D532053616E732053657269663B7D7D0D0A5C766965776B696E64345C756331
              5C706172645C625C66305C667331345C7061720D0A7D0D0A00}
          end
        end
        object Panel2: TPanel
          Left = 0
          Top = 24
          Width = 580
          Height = 208
          Align = alClient
          BevelOuter = bvNone
          TabOrder = 1
          object wwDBGrid1: TwwDBGrid
            Left = 0
            Top = 41
            Width = 572
            Height = 159
            Selected.Strings = (
              'DSC_CONTRATO'#9'20'#9'Contrato'
              'DSC_INDICADOR'#9'20'#9'Indicador'
              'VLRAPURACAONUM'#9'10'#9'Valor (R$)'
              'VLRAPURACAODAT'#9'10'#9'Valor (Data)'
              'VLRAPURACAOSTR'#9'15'#9'Valor (Texto)'
              'DATAAPURACAO'#9'18'#9'Data Apuração'
              'DATAINCLUSAO'#9'18'#9'Data Inclusão'
              'MESCOMPETENCIA'#9'10'#9'Mês'
              'ANOCOMPETENCIA'#9'10'#9'Ano'
              'TIPOLANCA'#9'1'#9'Tipo Lançamento'
              'TIPOINCLUSAO'#9'1'#9'Tipo Inclusão'
              'OBSERVACAO'#9'60'#9'Observação'
              'IDINDLOTE'#9'10'#9'Lote')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = DsIndApuracao
            PopupMenu = PopupMenu1
            ReadOnly = True
            TabOrder = 0
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
          object Panel4: TPanel
            Left = 0
            Top = 0
            Width = 572
            Height = 41
            Align = alTop
            BevelOuter = bvNone
            TabOrder = 1
            object Label10: TLabel
              Left = 6
              Top = 8
              Width = 32
              Height = 13
              Caption = 'Data:'
            end
            object lblData: TLabel
              Left = 41
              Top = 8
              Width = 28
              Height = 13
              Caption = 'Data'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Visible = False
            end
            object Label9: TLabel
              Left = 6
              Top = 24
              Width = 42
              Height = 13
              Caption = 'Imóvel:'
            end
            object lblEstabelecimento: TLabel
              Left = 53
              Top = 24
              Width = 43
              Height = 13
              Caption = 'Hotel...'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Visible = False
            end
            object Label11: TLabel
              Left = 413
              Top = 24
              Width = 58
              Height = 13
              Anchors = [akTop, akRight]
              Caption = 'Registros:'
            end
            object lblRegistros: TLabel
              Left = 475
              Top = 24
              Width = 25
              Height = 13
              Anchors = [akTop, akRight]
              Caption = 'Qtd.'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlue
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              Visible = False
            end
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 408
    Width = 590
    inherited tb97Fundo: TToolbar97
      Left = 175
      inherited btnConfirmar: TfcShapeBtn
        OnClick = btnConfirmarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 10
    Top = 408
    TargetsData = (
      1
      2
      (
        'TMemo'
        'Text'
        0)
      (
        'TwwDBRichEdit'
        'Text'
        0))
  end
  object CMSql: TCMSqlParams
    SQL.Strings = (
      '/*'
      'SELECT * FROM INDCONTRATOLOJA'
      'WHERE 1=2'
      '*/'
      ''
      '/*'
      'SELECT * FROM INDLAYOUTIMP'
      'WHERE 1=2'
      '*/'
      ''
      '/*'
      'SELECT * FROM INDLAYOUTXIND'
      'WHERE 1=2'
      '*/'
      ''
      '/*'
      'SELECT * FROM INDAPURACAO'
      'WHERE 1=2'
      '*/'
      ''
      ''
      '/*'
      'SELECT * FROM INDINDICADOR'
      'WHERE 1=2'
      '*/'
      ''
      '/*'
      'SELECT * FROM INDGRPAPURACAO'
      'WHERE 1=2'
      '*/ '
      ''
      '/*'
      'SELECT IA.IDAPURACAO,        IA.IDINDICADOR,    IA.IDCONTRATO,'
      
        '       IA.IDSUBGRPAPURACAO,  IA.IDGRPAPURACAO,  IA.MESCOMPETENCI' +
        'A,'
      '       IA.ANOCOMPETENCIA,    IA.DATAAPURACAO,   IA.TIPOLANCA,'
      
        '       IA.VLRAPURACAONUM,    IA.VLRAPURACAOSTR, IA.VLRAPURACAODA' +
        'T,'
      
        '       IA.DATAINCLUSAO,      IA.TIPOINCLUSAO,   IA.FLGCONCILIADO' +
        ','
      '       IA.IDIMOVEL,          IA.OBSERVACAO,     IA.IDINDLOTE,'
      ''
      '       IC.DESCRICAO,         IL.NUMCONTRATO,    IM.IMONOME'
      ''
      '  FROM INDAPURACAO IA,     INDINDICADOR IC,'
      '       INDCONTRATOLOJA IL, IMOVEL IM'
      ''
      ' WHERE IA.IDINDICADOR = IC.IDINDICADOR'
      '   AND IA.IDIMOVEL    = IL.IDIMOVEL'
      '   AND IA.IDIMOVEL    = IM.IDIMOVEL'
      '   AND 1 = 2'
      '*/'
      ''
      'SELECT A.IDAPURACAO,     A.IDGRPAPURACAO,  A.IDSUBGRPAPURACAO,'
      '       A.IDCONTRATO,     A.IDINDICADOR,    A.IDIMOVEL,'
      '       A.MESCOMPETENCIA, A.ANOCOMPETENCIA, A.DATAAPURACAO,'
      '       A.TIPOLANCA,      A.VLRAPURACAONUM, A.VLRAPURACAOSTR,'
      '       A.VLRAPURACAODAT, A.DATAINCLUSAO,   A.TIPOINCLUSAO,'
      '       I.TIPODADO,       I.FLGGRPAPURACAO, I.FLGSUBGRPAPURACAO,'
      '       I.FLGCONTRATO,    I.PERIODICIDADE,  A.FLGCONCILIADO,'
      
        '       I.IDGRPPADRAO,    I.IDSUBGRPPADRAO, A.OBSERVACAO, A.IDIND' +
        'LOTE,'
      '       IG.DESCRICAO AS DSC_GRPPADRAO,'
      '       IP.DESCRICAO AS DSC_SUBGRPPADRAO,'
      '       I.DESCRICAO  AS DSC_INDICADOR,'
      '       GR.DESCRICAO AS DSC_GRPAPURACAO,'
      '       SG.DESCRICAO AS DSC_SUBGRPAPURACAO,'
      '       IM.IMONOME || '#39' - '#39' || I.IMONOME AS NOME_EXTENSO,'
      '       CL.NUMCONTRATO || '#39' - '#39' || CL.NOMCONTRATO AS DSC_CONTRATO'
      '  FROM INDAPURACAO A,'
      '       INDINDICADOR I,'
      '       INDGRPAPURACAO GR,'
      '       INDGRPAPURACAO SG,'
      '       INDGRPAPURACAO IG,'
      '       INDGRPAPURACAO IP,'
      '       INDCONTRATOLOJA CL,'
      '       IMOVEL I,'
      '       IMOVEL IM'
      ' WHERE A.IDCONTRATO = CL.IDCONTRATO(+)'
      '   AND A.IDINDICADOR = I.IDINDICADOR'
      '   AND A.IDGRPAPURACAO = GR.IDGRPAPURACAO(+)'
      '   AND A.IDSUBGRPAPURACAO = SG.IDGRPAPURACAO(+)'
      '   AND I.IDGRPPADRAO = IG.IDGRPAPURACAO(+)'
      '   AND I.IDSUBGRPPADRAO = IP.IDGRPAPURACAO(+)'
      '   AND A.IDIMOVEL = I.IDIMOVEL'
      '   AND I.IDIMOVELMESTRE = IM.IDIMOVEL'
      '   AND A.IDAPURACAO = 1'
      '   AND 1 = 2'
      ''
      ''
      ''
      ' '
      ' '
      ' ')
    Left = 543
    Top = 74
  end
  object cdsIndApuracao: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 537
    Top = 128
    object cdsIndApuracaoDSC_CONTRATO: TStringField
      DisplayLabel = 'Contrato'
      DisplayWidth = 20
      FieldName = 'DSC_CONTRATO'
      Size = 83
    end
    object cdsIndApuracaoDSC_INDICADOR: TStringField
      DisplayLabel = 'Indicador'
      DisplayWidth = 20
      FieldName = 'DSC_INDICADOR'
      Size = 60
    end
    object cdsIndApuracaoVLRAPURACAONUM: TFloatField
      DisplayLabel = 'Valor (R$)'
      DisplayWidth = 10
      FieldName = 'VLRAPURACAONUM'
    end
    object cdsIndApuracaoVLRAPURACAODAT: TDateTimeField
      DisplayLabel = 'Valor (Data)'
      DisplayWidth = 10
      FieldName = 'VLRAPURACAODAT'
    end
    object cdsIndApuracaoVLRAPURACAOSTR: TStringField
      DisplayLabel = 'Valor (Texto)'
      DisplayWidth = 15
      FieldName = 'VLRAPURACAOSTR'
      Size = 60
    end
    object cdsIndApuracaoDATAAPURACAO: TDateTimeField
      DisplayLabel = 'Data Apuração'
      DisplayWidth = 18
      FieldName = 'DATAAPURACAO'
    end
    object cdsIndApuracaoDATAINCLUSAO: TDateTimeField
      DisplayLabel = 'Data Inclusão'
      DisplayWidth = 18
      FieldName = 'DATAINCLUSAO'
    end
    object cdsIndApuracaoMESCOMPETENCIA: TFloatField
      DisplayLabel = 'Mês'
      DisplayWidth = 10
      FieldName = 'MESCOMPETENCIA'
    end
    object cdsIndApuracaoANOCOMPETENCIA: TFloatField
      DisplayLabel = 'Ano'
      DisplayWidth = 10
      FieldName = 'ANOCOMPETENCIA'
    end
    object cdsIndApuracaoTIPOLANCA: TStringField
      DisplayLabel = 'Tipo Lançamento'
      DisplayWidth = 1
      FieldName = 'TIPOLANCA'
      FixedChar = True
      Size = 1
    end
    object cdsIndApuracaoTIPOINCLUSAO: TStringField
      DisplayLabel = 'Tipo Inclusão'
      DisplayWidth = 1
      FieldName = 'TIPOINCLUSAO'
      FixedChar = True
      Size = 1
    end
    object cdsIndApuracaoOBSERVACAO: TStringField
      DisplayLabel = 'Observação'
      DisplayWidth = 60
      FieldName = 'OBSERVACAO'
      Size = 60
    end
    object cdsIndApuracaoNOME_EXTENSO: TStringField
      DisplayLabel = 'Imóvel'
      DisplayWidth = 20
      FieldName = 'NOME_EXTENSO'
      Visible = False
      Size = 123
    end
    object cdsIndApuracaoTIPODADO: TStringField
      DisplayWidth = 1
      FieldName = 'TIPODADO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsIndApuracaoDSC_GRPPADRAO: TStringField
      DisplayWidth = 60
      FieldName = 'DSC_GRPPADRAO'
      Visible = False
      Size = 60
    end
    object cdsIndApuracaoDSC_SUBGRPPADRAO: TStringField
      DisplayWidth = 60
      FieldName = 'DSC_SUBGRPPADRAO'
      Visible = False
      Size = 60
    end
    object cdsIndApuracaoDSC_GRPAPURACAO: TStringField
      DisplayWidth = 60
      FieldName = 'DSC_GRPAPURACAO'
      Visible = False
      Size = 60
    end
    object cdsIndApuracaoDSC_SUBGRPAPURACAO: TStringField
      DisplayWidth = 60
      FieldName = 'DSC_SUBGRPAPURACAO'
      Visible = False
      Size = 60
    end
    object cdsIndApuracaoIDAPURACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDAPURACAO'
      Visible = False
    end
    object cdsIndApuracaoIDGRPAPURACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDGRPAPURACAO'
      Visible = False
    end
    object cdsIndApuracaoIDSUBGRPAPURACAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDSUBGRPAPURACAO'
      Visible = False
    end
    object cdsIndApuracaoIDCONTRATO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONTRATO'
      Visible = False
    end
    object cdsIndApuracaoIDINDICADOR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINDICADOR'
      Visible = False
    end
    object cdsIndApuracaoIDIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDIMOVEL'
      Visible = False
    end
    object cdsIndApuracaoFLGGRPAPURACAO: TStringField
      DisplayWidth = 1
      FieldName = 'FLGGRPAPURACAO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsIndApuracaoFLGSUBGRPAPURACAO: TStringField
      DisplayWidth = 1
      FieldName = 'FLGSUBGRPAPURACAO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsIndApuracaoFLGCONTRATO: TStringField
      DisplayWidth = 1
      FieldName = 'FLGCONTRATO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsIndApuracaoPERIODICIDADE: TStringField
      DisplayWidth = 1
      FieldName = 'PERIODICIDADE'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsIndApuracaoFLGCONCILIADO: TStringField
      DisplayWidth = 1
      FieldName = 'FLGCONCILIADO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsIndApuracaoIDGRPPADRAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDGRPPADRAO'
      Visible = False
    end
    object cdsIndApuracaoIDSUBGRPPADRAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDSUBGRPPADRAO'
      Visible = False
    end
  end
  object DlgAbrir: TOpenDialog
    Filter = 'Planilhas|*.xls'
    Left = 542
    Top = 9
  end
  object DlgSalvar: TSaveDialog
    DefaultExt = '*.txt'
    Filter = 'Arquivo Texto|*.txt'
    Left = 542
    Top = 21
  end
  object DsIndApuracao: TwwDataSource
    DataSet = cdsIndApuracao
    Left = 537
    Top = 142
  end
  object cdsLayOut: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 534
    Top = 195
    object cdsLayOutDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object cdsLayOutPOSINDICADOR: TFloatField
      FieldName = 'POSINDICADOR'
    end
    object cdsLayOutPOSVALOR: TFloatField
      FieldName = 'POSVALOR'
    end
    object cdsLayOutIDLAYOUTIMP: TFloatField
      FieldName = 'IDLAYOUTIMP'
    end
    object cdsLayOutFLGPOSICAO: TStringField
      FieldName = 'FLGPOSICAO'
      FixedChar = True
      Size = 1
    end
    object cdsLayOutFLGTIPOINDICADOR: TStringField
      FieldName = 'FLGTIPOINDICADOR'
      FixedChar = True
      Size = 1
    end
    object cdsLayOutPOSCONTRATO: TFloatField
      FieldName = 'POSCONTRATO'
    end
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'DESCRICAO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      '')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'INDLAYOUTIMP')
    CamposChave.Strings = (
      'IDLAYOUTIMP'
      'DESCRICAO'
      'POSINDICADOR'
      'POSVALOR'
      'POSCONTRATO'
      'FLGPOSICAO'
      'FLGTIPOINDICADOR')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 121
    Top = 404
  end
  object dsLayOut: TDataSource
    DataSet = cdsLayOut
    Left = 535
    Top = 206
  end
  object cdsIndicadores: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 532
    Top = 261
    object cdsIndicadoresIDINDICADOR: TFloatField
      FieldName = 'IDINDICADOR'
    end
    object cdsIndicadoresDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object cdsIndicadoresTIPODADO: TStringField
      FieldName = 'TIPODADO'
      FixedChar = True
      Size = 1
    end
    object cdsIndicadoresTIPOVALOR: TStringField
      FieldName = 'TIPOVALOR'
      FixedChar = True
      Size = 1
    end
    object cdsIndicadoresUNIDADE: TStringField
      FieldName = 'UNIDADE'
      FixedChar = True
      Size = 5
    end
    object cdsIndicadoresFLGGRPAPURACAO: TStringField
      FieldName = 'FLGGRPAPURACAO'
      FixedChar = True
      Size = 1
    end
    object cdsIndicadoresFLGSUBGRPAPURACAO: TStringField
      FieldName = 'FLGSUBGRPAPURACAO'
      FixedChar = True
      Size = 1
    end
    object cdsIndicadoresFLGCONTRATO: TStringField
      FieldName = 'FLGCONTRATO'
      FixedChar = True
      Size = 1
    end
    object cdsIndicadoresTIPOINDICADOR: TFloatField
      FieldName = 'TIPOINDICADOR'
    end
    object cdsIndicadoresPERIODICIDADE: TStringField
      FieldName = 'PERIODICIDADE'
      FixedChar = True
      Size = 1
    end
    object cdsIndicadoresNIVELVERIFICA: TFloatField
      FieldName = 'NIVELVERIFICA'
    end
    object cdsIndicadoresIDREGRA: TFloatField
      FieldName = 'IDREGRA'
    end
    object cdsIndicadoresQRYREGRA: TFloatField
      FieldName = 'QRYREGRA'
    end
    object cdsIndicadoresIDGRPPADRAO: TFloatField
      FieldName = 'IDGRPPADRAO'
    end
    object cdsIndicadoresIDSUBGRPPADRAO: TFloatField
      FieldName = 'IDSUBGRPPADRAO'
    end
  end
  object cdsGrupoApuracao: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 532
    Top = 251
    Data = {
      CB0000009619E0BD010000001800000005000000000003000000CB000D494447
      5250415055524143414F08000400000000000944455343524943414F01004900
      00000100055749445448020002003C00095449504F475255504F010049000000
      02000753554254595045020049000A0046697865644368617200055749445448
      0200020001000D5452474454494E434C5553414F08000800000000000F545247
      55534552494E434C5553414F0100490000000100055749445448020002001E00
      0100044C4349440400010009080000}
    object cdsGrupoApuracaoIDGRPAPURACAO: TFloatField
      FieldName = 'IDGRPAPURACAO'
    end
    object cdsGrupoApuracaoDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
    object cdsGrupoApuracaoTIPOGRUPO: TStringField
      FieldName = 'TIPOGRUPO'
      FixedChar = True
      Size = 1
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 497
    Top = 64
    object ImprimirImportao1: TMenuItem
      Caption = 'Imprimir Importação'
      OnClick = ImprimirImportao1Click
    end
    object N1: TMenuItem
      Caption = '-'
    end
    object mnuImprimir: TMenuItem
      Caption = 'Imprimir Log'
      OnClick = mnuImprimirClick
    end
    object mnuSalvar: TMenuItem
      Caption = 'Salvar Log'
      OnClick = mnuSalvarClick
    end
  end
  object cdsDetLayOut: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 537
    Top = 275
    object cdsDetLayOutIDLAYOUTIMP: TFloatField
      FieldName = 'IDLAYOUTIMP'
    end
    object cdsDetLayOutIDINDICADOR: TFloatField
      FieldName = 'IDINDICADOR'
    end
    object cdsDetLayOutPOSINDICADOR: TFloatField
      FieldName = 'POSINDICADOR'
    end
  end
  object cdsContratoLoja: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 537
    Top = 291
    object cdsContratoLojaIDCONTRATO: TFloatField
      FieldName = 'IDCONTRATO'
    end
    object cdsContratoLojaIDMARCA: TFloatField
      FieldName = 'IDMARCA'
    end
    object cdsContratoLojaIDATIVIDADE: TFloatField
      FieldName = 'IDATIVIDADE'
    end
    object cdsContratoLojaINDICEREAJUSTE: TFloatField
      FieldName = 'INDICEREAJUSTE'
    end
    object cdsContratoLojaIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
    end
    object cdsContratoLojaNUMCONTRATO: TStringField
      FieldName = 'NUMCONTRATO'
    end
    object cdsContratoLojaNOMCONTRATO: TStringField
      FieldName = 'NOMCONTRATO'
      Size = 60
    end
    object cdsContratoLojaTIPOCONTRATO: TStringField
      FieldName = 'TIPOCONTRATO'
      FixedChar = True
      Size = 1
    end
    object cdsContratoLojaLOJAS: TStringField
      FieldName = 'LOJAS'
    end
    object cdsContratoLojaVLRALUGMIN: TFloatField
      FieldName = 'VLRALUGMIN'
    end
    object cdsContratoLojaDATINICIO: TDateTimeField
      FieldName = 'DATINICIO'
    end
    object cdsContratoLojaDATTERMINO: TDateTimeField
      FieldName = 'DATTERMINO'
    end
    object cdsContratoLojaPERALUGVARIAVEL: TFloatField
      FieldName = 'PERALUGVARIAVEL'
    end
    object cdsContratoLojaDATULTAUDITORIA: TDateTimeField
      FieldName = 'DATULTAUDITORIA'
    end
    object cdsContratoLojaDATREAJUSTE: TDateTimeField
      FieldName = 'DATREAJUSTE'
    end
    object cdsContratoLojaDATPROXREAJUSTE: TDateTimeField
      FieldName = 'DATPROXREAJUSTE'
    end
    object cdsContratoLojaPERREAJUSTE: TFloatField
      FieldName = 'PERREAJUSTE'
    end
    object cdsContratoLojaDESCRICAO: TMemoField
      FieldName = 'DESCRICAO'
      BlobType = ftMemo
      Size = 2000
    end
    object cdsContratoLojaQTDEABL: TFloatField
      FieldName = 'QTDEABL'
    end
    object cdsContratoLojaFLGINDETERMINADO: TStringField
      FieldName = 'FLGINDETERMINADO'
      FixedChar = True
      Size = 1
    end
    object cdsContratoLojaFLGSTATUS: TStringField
      FieldName = 'FLGSTATUS'
      FixedChar = True
      Size = 1
    end
    object cdsContratoLojaIDSITCONTIMOB: TFloatField
      FieldName = 'IDSITCONTIMOB'
    end
    object cdsContratoLojaIDPRESTADOR: TFloatField
      FieldName = 'IDPRESTADOR'
    end
  end
  object rptImportacao: TppReport
    AutoStop = False
    DataPipeline = pplImportacao
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    BeforePrint = rptImportacaoBeforePrint
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = False
    OutlineSettings.Visible = False
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = False
    Left = 537
    Top = 347
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'pplImportacao'
    object ppTitleBand1: TppTitleBand
      mmBottomOffset = 0
      mmHeight = 21696
      mmPrintPosition = 0
      object ppDBText11: TppDBText
        UserName = 'DBText11'
        DataField = 'NOME_EXTENSO'
        DataPipeline = pplImportacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        DataPipelineName = 'pplImportacao'
        mmHeight = 4233
        mmLeft = 17992
        mmTop = 15346
        mmWidth = 114565
        BandType = 1
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'IMÓVEL:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4233
        mmLeft = 794
        mmTop = 15346
        mmWidth = 14817
        BandType = 1
      end
      object lblEmpresa: TppLabel
        UserName = 'LblEmpresa'
        AutoSize = False
        Caption = 'LblEmpresa'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5821
        mmLeft = 0
        mmTop = 1588
        mmWidth = 284428
        BandType = 1
      end
      object ppOrcamentoLabel42: TppLabel
        UserName = 'Label12'
        AutoSize = False
        Caption = 'Importação de Indicadores - Planilha'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 12
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5292
        mmLeft = 0
        mmTop = 7938
        mmWidth = 284428
        BandType = 1
      end
      object ppLine2: TppLine
        UserName = 'Line2'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 0
        mmTop = 13494
        mmWidth = 284300
        BandType = 1
      end
      object ppLine3: TppLine
        UserName = 'Line3'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 2117
        mmLeft = 0
        mmTop = 20902
        mmWidth = 284300
        BandType = 1
      end
    end
    object ppHeaderBand1: TppHeaderBand
      mmBottomOffset = 0
      mmHeight = 5292
      mmPrintPosition = 0
      object ppLabel1: TppLabel
        UserName = 'Label1'
        AutoSize = False
        Caption = 'Contrato'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 125942
        mmTop = 529
        mmWidth = 23283
        BandType = 0
      end
      object ppLabel2: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = 'Observação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 40746
        mmTop = 529
        mmWidth = 84138
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Indicador'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 1058
        mmTop = 529
        mmWidth = 38629
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        AutoSize = False
        Caption = 'Valor (R$)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 150284
        mmTop = 529
        mmWidth = 19050
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = 'Data Apuração'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 220398
        mmTop = 529
        mmWidth = 21960
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Caption = 'Data Inclusão'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 243417
        mmTop = 529
        mmWidth = 21960
        BandType = 0
      end
      object ppLine1: TppLine
        UserName = 'Line1'
        ParentWidth = True
        Position = lpBottom
        Weight = 0.75
        mmHeight = 1588
        mmLeft = 0
        mmTop = 3175
        mmWidth = 284300
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Caption = 'Mês'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 266171
        mmTop = 529
        mmWidth = 6879
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        AutoSize = False
        Caption = 'Ano'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 274109
        mmTop = 529
        mmWidth = 10319
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        AutoSize = False
        Caption = 'Valor(Data)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3704
        mmLeft = 170392
        mmTop = 529
        mmWidth = 19315
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        AutoSize = False
        Caption = 'Valor(Texto)'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3440
        mmLeft = 190765
        mmTop = 529
        mmWidth = 28575
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 3969
      mmPrintPosition = 0
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'DSC_INDICADOR'
        DataPipeline = pplImportacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplImportacao'
        mmHeight = 3175
        mmLeft = 794
        mmTop = 265
        mmWidth = 38894
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'VLRAPURACAONUM'
        DataPipeline = pplImportacao
        DisplayFormat = ',0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'pplImportacao'
        mmHeight = 3175
        mmLeft = 150284
        mmTop = 529
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'VLRAPURACAODAT'
        DataPipeline = pplImportacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplImportacao'
        mmHeight = 3175
        mmLeft = 170657
        mmTop = 529
        mmWidth = 19315
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'DATAAPURACAO'
        DataPipeline = pplImportacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplImportacao'
        mmHeight = 3175
        mmLeft = 220928
        mmTop = 529
        mmWidth = 21431
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'ANOCOMPETENCIA'
        DataPipeline = pplImportacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplImportacao'
        mmHeight = 3175
        mmLeft = 273844
        mmTop = 529
        mmWidth = 9790
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'MESCOMPETENCIA'
        DataPipeline = pplImportacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplImportacao'
        mmHeight = 3175
        mmLeft = 266436
        mmTop = 529
        mmWidth = 6350
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'OBSERVACAO'
        DataPipeline = pplImportacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplImportacao'
        mmHeight = 3175
        mmLeft = 41010
        mmTop = 265
        mmWidth = 83608
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'DSC_CONTRATO'
        DataPipeline = pplImportacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplImportacao'
        mmHeight = 3175
        mmLeft = 125942
        mmTop = 265
        mmWidth = 23019
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText12'
        DataField = 'DATAINCLUSAO'
        DataPipeline = pplImportacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'pplImportacao'
        mmHeight = 3175
        mmLeft = 243417
        mmTop = 529
        mmWidth = 21960
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'VLRAPURACAOSTR'
        DataPipeline = pplImportacao
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'pplImportacao'
        mmHeight = 3440
        mmLeft = 191030
        mmTop = 529
        mmWidth = 28575
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppOrcamentoSystemVariable7: TppSystemVariable
        UserName = 'Calc2'
        AutoSize = False
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3440
        mmLeft = 529
        mmTop = 1058
        mmWidth = 283898
        BandType = 8
      end
      object ppLine4: TppLine
        UserName = 'Line4'
        ParentWidth = True
        Weight = 0.75
        mmHeight = 1323
        mmLeft = 0
        mmTop = 265
        mmWidth = 284300
        BandType = 8
      end
      object lblSistema: TppLabel
        UserName = 'LblSistema'
        AutoSize = False
        Caption = 'Nome do Sistema'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 265
        mmTop = 1058
        mmWidth = 78846
        BandType = 8
      end
      object ppOrcamentoSystemVariable8: TppSystemVariable
        UserName = 'OrcamentoSystemVariable8'
        VarType = vtDateTime
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = [fsBold]
        TextAlignment = taRightJustified
        Transparent = True
        mmHeight = 3704
        mmLeft = 258234
        mmTop = 1323
        mmWidth = 26194
        BandType = 8
      end
    end
    object raCodeModule1: TraCodeModule
      ProgramStream = {
        01060F5472614576656E7448616E646C65720B50726F6772616D4E616D650613
        4C626C456D70726573614F6E476574546578740B50726F6772616D5479706507
        0B747450726F63656475726506536F75726365063F70726F636564757265204C
        626C456D70726573614F6E476574546578742876617220546578743A20537472
        696E67293B0D0A626567696E0D0A656E643B0D0A0D436F6D706F6E656E744E61
        6D65060A4C626C456D7072657361094576656E744E616D6506094F6E47657454
        657874074576656E74494402350001060F5472614576656E7448616E646C6572
        0B50726F6772616D4E616D6506134C626C53697374656D614F6E476574546578
        740B50726F6772616D54797065070B747450726F63656475726506536F757263
        65064170726F636564757265204C626C53697374656D614F6E47657454657874
        2876617220546578743A20537472696E67293B0D0A626567696E0D0A0D0A656E
        643B0D0A0D436F6D706F6E656E744E616D65060A4C626C53697374656D610945
        76656E744E616D6506094F6E47657454657874074576656E74494402350000}
    end
  end
  object pplImportacao: TppDBPipeline
    DataSource = DsIndApuracao
    UserName = 'lImportacao'
    Left = 481
    Top = 347
    object pplImportacaoppField1: TppField
      FieldAlias = 'DSC_CONTRATO'
      FieldName = 'DSC_CONTRATO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object pplImportacaoppField2: TppField
      FieldAlias = 'DSC_INDICADOR'
      FieldName = 'DSC_INDICADOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object pplImportacaoppField3: TppField
      FieldAlias = 'VLRAPURACAONUM'
      FieldName = 'VLRAPURACAONUM'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object pplImportacaoppField4: TppField
      FieldAlias = 'VLRAPURACAODAT'
      FieldName = 'VLRAPURACAODAT'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object pplImportacaoppField5: TppField
      FieldAlias = 'VLRAPURACAOSTR'
      FieldName = 'VLRAPURACAOSTR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object pplImportacaoppField6: TppField
      FieldAlias = 'DATAAPURACAO'
      FieldName = 'DATAAPURACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object pplImportacaoppField7: TppField
      FieldAlias = 'DATAINCLUSAO'
      FieldName = 'DATAINCLUSAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object pplImportacaoppField8: TppField
      FieldAlias = 'MESCOMPETENCIA'
      FieldName = 'MESCOMPETENCIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object pplImportacaoppField9: TppField
      FieldAlias = 'ANOCOMPETENCIA'
      FieldName = 'ANOCOMPETENCIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object pplImportacaoppField10: TppField
      FieldAlias = 'TIPOLANCA'
      FieldName = 'TIPOLANCA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object pplImportacaoppField11: TppField
      FieldAlias = 'TIPOINCLUSAO'
      FieldName = 'TIPOINCLUSAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object pplImportacaoppField12: TppField
      FieldAlias = 'OBSERVACAO'
      FieldName = 'OBSERVACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object pplImportacaoppField13: TppField
      FieldAlias = 'NOME_EXTENSO'
      FieldName = 'NOME_EXTENSO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object pplImportacaoppField14: TppField
      FieldAlias = 'TIPODADO'
      FieldName = 'TIPODADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object pplImportacaoppField15: TppField
      FieldAlias = 'DSC_GRPPADRAO'
      FieldName = 'DSC_GRPPADRAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object pplImportacaoppField16: TppField
      FieldAlias = 'DSC_SUBGRPPADRAO'
      FieldName = 'DSC_SUBGRPPADRAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object pplImportacaoppField17: TppField
      FieldAlias = 'DSC_GRPAPURACAO'
      FieldName = 'DSC_GRPAPURACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object pplImportacaoppField18: TppField
      FieldAlias = 'DSC_SUBGRPAPURACAO'
      FieldName = 'DSC_SUBGRPAPURACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object pplImportacaoppField19: TppField
      FieldAlias = 'IDAPURACAO'
      FieldName = 'IDAPURACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object pplImportacaoppField20: TppField
      FieldAlias = 'IDGRPAPURACAO'
      FieldName = 'IDGRPAPURACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object pplImportacaoppField21: TppField
      FieldAlias = 'IDSUBGRPAPURACAO'
      FieldName = 'IDSUBGRPAPURACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object pplImportacaoppField22: TppField
      FieldAlias = 'IDCONTRATO'
      FieldName = 'IDCONTRATO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object pplImportacaoppField23: TppField
      FieldAlias = 'IDINDICADOR'
      FieldName = 'IDINDICADOR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object pplImportacaoppField24: TppField
      FieldAlias = 'IDIMOVEL'
      FieldName = 'IDIMOVEL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
    object pplImportacaoppField25: TppField
      FieldAlias = 'FLGGRPAPURACAO'
      FieldName = 'FLGGRPAPURACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 24
      Searchable = False
      Sortable = False
    end
    object pplImportacaoppField26: TppField
      FieldAlias = 'FLGSUBGRPAPURACAO'
      FieldName = 'FLGSUBGRPAPURACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 25
      Searchable = False
      Sortable = False
    end
    object pplImportacaoppField27: TppField
      FieldAlias = 'FLGCONTRATO'
      FieldName = 'FLGCONTRATO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 26
      Searchable = False
      Sortable = False
    end
    object pplImportacaoppField28: TppField
      FieldAlias = 'PERIODICIDADE'
      FieldName = 'PERIODICIDADE'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 27
      Searchable = False
      Sortable = False
    end
    object pplImportacaoppField29: TppField
      FieldAlias = 'FLGCONCILIADO'
      FieldName = 'FLGCONCILIADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 28
      Searchable = False
      Sortable = False
    end
    object pplImportacaoppField30: TppField
      FieldAlias = 'IDGRPPADRAO'
      FieldName = 'IDGRPPADRAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 29
      Searchable = False
      Sortable = False
    end
    object pplImportacaoppField31: TppField
      FieldAlias = 'IDSUBGRPPADRAO'
      FieldName = 'IDSUBGRPPADRAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 30
      Searchable = False
      Sortable = False
    end
  end
end
