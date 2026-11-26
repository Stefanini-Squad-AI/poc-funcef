inherited frmLiberaBeneficioProvisorio: TfrmLiberaBeneficioProvisorio
  Left = 269
  Top = 273
  HelpContext = 160077
  Caption = 'Liberação de Benefício Provisório'
  ClientHeight = 431
  ClientWidth = 747
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 747
    Height = 392
    object pnlRevisao: TPanel
      Left = 1
      Top = 1
      Width = 745
      Height = 390
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object pnlBeneficios: TPanel
        Left = 0
        Top = 121
        Width = 745
        Height = 269
        Align = alClient
        BevelOuter = bvLowered
        TabOrder = 1
        object Panel1: TPanel
          Left = 1
          Top = 1
          Width = 743
          Height = 44
          Align = alTop
          BevelOuter = bvLowered
          TabOrder = 0
          object StaticText1: TStaticText
            Left = 1
            Top = 1
            Width = 741
            Height = 31
            Align = alTop
            Alignment = taCenter
            Caption = 'Beneficiários'
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindow
            Font.Height = -24
            Font.Name = 'Times New Roman'
            Font.Style = []
            ParentColor = False
            ParentFont = False
            TabOrder = 0
          end
        end
        object dbgrdBeneficiarios: TwwDBGrid
          Left = 1
          Top = 45
          Width = 743
          Height = 223
          Selected.Strings = (
            'TIPOBENEF'#9'5'#9'Tipo'
            'NOMEBENEFICIO'#9'30'#9'Benefício'
            'NOME'#9'35'#9'Beneficiário'
            'VALORATUAL'#9'10'#9'Valor (R$)'
            'PERCPROVISORIO'#9'10'#9'% ~Concessão'
            'DATAINICIOFUND'#9'11'#9'Início ~Fund.'
            'DATAINICIO'#9'10'#9'Início ~Pgmto.'
            'DATAFINALPREVISTA'#9'10'#9'Final ~Previsto'
            'DATAFINAL'#9'10'#9'Final ~Efetivo'
            'DATAINICIOINSS'#9'10'#9'Início ~INSS'
            'VALORTOTAL'#9'10'#9'Valor ~Total'
            'VALORCOTAS'#9'11'#9'Valor ~(Cotas)'
            'VLRCALCINSS'#9'10'#9'Valor Calc~INSS'
            'VLRINFINSS'#9'10'#9'Valor Inf. ~INSS'
            'DATAREQUERIMENTO'#9'10'#9'Requerim.'
            'NUMPROCINSS'#9'9'#9'Nº Proc. ~INSS')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 1
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsBeneficiarios
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          KeyOptions = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          ParentFont = False
          TabOrder = 1
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 2
          TitleButtons = False
          IndicatorColor = icBlack
        end
      end
      object pnlProcesso: TPanel
        Left = 0
        Top = 0
        Width = 745
        Height = 121
        Align = alTop
        BevelOuter = bvLowered
        TabOrder = 0
        object Label12: TLabel
          Left = 8
          Top = 37
          Width = 90
          Height = 13
          Caption = 'Evento Gerador'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 8
          Top = 76
          Width = 90
          Height = 13
          Caption = 'Data do Evento'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label1: TLabel
          Left = 135
          Top = 76
          Width = 97
          Height = 13
          Caption = 'Data do Registro'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object sbtnAlteraData: TSpeedButton
          Left = 639
          Top = 80
          Width = 90
          Height = 38
          Hint = 'Informar nova data'
          Caption = '&Liberar'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            8888888888FFFFF8888888888000008888888888F777778FF888888002222200
            88888887788888778F88887222222222088888788888888878F887A228822222
            208887F88FFF888887F887A2FFF8222220888788777FF888878F7A22FFFF8222
            22087F887777FF88887F7A22FFFFF82222087F8877777FF8887F7A22FF8FFF82
            22087F8877F777FF887F7A22FF82FFF822087F8877F8777F887F7A22FF222FF8
            220878F87788877FF87887A2222222FF208887F88888887787F887A222222222
            2088878F888888888788887AA222222208888878FF88888F788888877AAAAA77
            8888888778FFFF77888888888777778888888888877777888888}
          NumGlyphs = 2
          ParentShowHint = False
          ShowHint = True
          OnClick = sbtnAlteraDataClick
        end
        object bbtnProcurar: TBitBtn
          Left = 639
          Top = 38
          Width = 90
          Height = 37
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
        object stxtProcesso: TStaticText
          Left = 1
          Top = 1
          Width = 743
          Height = 31
          Align = alTop
          Alignment = taCenter
          Caption = 'Processo Nº '
          Color = clBtnFace
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindow
          Font.Height = -24
          Font.Name = 'Times New Roman'
          Font.Style = []
          ParentColor = False
          ParentFont = False
          TabOrder = 1
        end
        object dbedEvento: TwwDBEdit
          Left = 8
          Top = 52
          Width = 347
          Height = 21
          Color = clSilver
          DataField = 'NOME'
          DataSource = dsProcesso
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbedDtEvento: TwwDBEdit
          Left = 8
          Top = 89
          Width = 121
          Height = 21
          Color = clSilver
          DataField = 'DTEVENTO'
          DataSource = dsProcesso
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object dbedDtRegistro: TwwDBEdit
          Left = 135
          Top = 89
          Width = 121
          Height = 21
          Color = clSilver
          DataField = 'DTREGISTRO'
          DataSource = dsProcesso
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
        end
        object GroupBox1: TGroupBox
          Left = 361
          Top = 37
          Width = 266
          Height = 70
          Caption = ' Datas Definitivas '
          TabOrder = 5
          object lblDtInicio: TLabel
            Left = 11
            Top = 22
            Width = 116
            Height = 13
            Caption = 'Data de Início (DIB)'
          end
          object Label2: TLabel
            Left = 137
            Top = 22
            Width = 59
            Height = 13
            Caption = 'Data Final'
          end
          object dtInicioLiberacao: TCMDateTimePicker
            Left = 11
            Top = 37
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
          object dtFinalLiberacao: TCMDateTimePicker
            Left = 137
            Top = 37
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
            TabOrder = 1
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 392
    Width = 747
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 65535
    Top = 406
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
  object qryProcesso: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.DTDIREITO,       P.DTEVENTO,        P.DTREGISTRO,'
      '       P.IDEVENTOGERADOR, P.IDSITPROCESSO,   P.NUMEROPROCESSO,'
      '       E.NOME, E.FLGINTERNO '
      'FROM   PROCESSOBENEF P, EVENTOGERADOR E'
      'WHERE  P.NUMEROPROCESSO = :NUMEROPROCESSO'
      'AND    P.IDEVENTOGERADOR = E.IDEVENTOGERADOR'
      ' ')
    ValidateWithMask = True
    Left = 96
    Top = 65530
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMEROPROCESSO'
        ParamType = ptUnknown
        Value = 998
      end>
  end
  object dsProcesso: TwwDataSource
    DataSet = qryProcesso
    Left = 27
    Top = 65527
  end
  object qryBeneficiarios: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT DECODE(BP.FLGREFERENCIA, 1, '#39'INSS'#39', '#39'SUPL.'#39') AS TIPOBENEF' +
        ','
      '       BP.FLGREFERENCIA,'
      
        '       DT.NUMSEQUENCIA,     DT.IDDEPENDENCIA,       DT.FLGCONTAI' +
        'MPOSTOR,'
      '       DT.FLGCONTASALARIOF, DT.FLGBENEFICIARIO,     D.DESCRICAO,'
      
        '       BPP.VALORBASE1,      BPP.VALORBASE2,         BPP.VALORBAS' +
        'E3,'
      
        '       BF.SEQPROPOSTA,      B.NUMORDEMEVENTO,       BP.IDREGRACA' +
        'LCULO,'
      '       BP.IDREGRAPRIMPAGTO,    BP.IDREGRAULTPAGTO,'
      
        '       BP.FLGCALCTODOMES,   BP.IDRGVALORTOTAL,      BF.CODPORTFO' +
        'RMA,'
      '       BF.IDSITBENEFICIO,   BF.DATAREQUERIMENTO,'
      
        '       BF.VALORBINSSANT2,   BF.VALORBINSSANT3,      BF.ULTMESREA' +
        'JUSTE,'
      
        '       BF.VALORATUAL        AS VALORATUALANT,       BF.FLGDATAPR' +
        'EVISTA,'
      
        '       BF.IDPESSOA,         BF.IDTITULAR,           BF.IDPLANOPR' +
        'EV,'
      
        '       BF.IDPESSJUR,        BF.IDBENEFICIO,         BF.NUMEROPRO' +
        'CESSO,'
      
        '       BF.NUMPROCINSS,      BF.VALORATUAL,          BF.VALORCALC' +
        'ULADO,'
      
        '       BF.VALORCOTAS,       BF.VALORTOTAL,          BF.VLRCALCIN' +
        'SS,'
      
        '       BF.VLRINFINSS,       BF.DATAFINAL,           BF.DATAFINAL' +
        'PREVISTA,'
      
        '       BF.DATAINICIO,       BF.DATAINICIOFUND,      BF.DATAINICI' +
        'OINSS,'
      '       BF.PERCPROVISORIO,   BF.IDPLANOORIGEM,'
      '       BF.IDSITBENEFICIO    AS IDSITANTERIOR,'
      '       BF.DATAINICIO        AS DATAINICIOANT,'
      '       BF.DATAFINAL         AS DATAFINALANT,'
      '       PRESP.NOME           AS NOMERESPONSAVEL ,'
      '       B.NOME               AS NOMEBENEFICIO,       P.NOME ,'
      
        '       BF.IDTPPAGTOBENEFIC, BF.VALORSRB,            B.FLGBENEFTE' +
        'MP'
      
        'FROM   PESSOA P, PESSOA PRESP, PESSOAFISICA PF, BENEFICIO B, BEN' +
        'EFPLANOPART BPP,'
      
        '       DEPEN D, DEPENTIT DT, BENEFPLANPREV BP, BFCIARIOTITPLAN B' +
        'T, BENEFBFCIARIO BF'
      'WHERE  (BF.NUMEROPROCESSO = :NUMEROPROCESSO)'
      'AND    (P.IDPESSOA        = BF.IDPESSOA)'
      'AND    (PF.IDPESSOA       = BF.IDPESSOA)'
      'AND    (BT.IDPESSJUR      = BF.IDPESSJUR)'
      'AND    (BT.IDTITULAR      = BF.IDTITULAR)'
      'AND    (BT.IDPLANOPREV    = BF.IDPLANOPREV)'
      'AND    (BT.IDPESSOA       = BF.IDPESSOA)'
      'AND    (BT.IDBENEFICIO    = BF.IDBENEFICIO)'
      'AND    (BT.IDPLANOORIGEM = BF.IDPLANOORIGEM)'
      'AND    (BT.SEQPROPOSTA    = BF.SEQPROPOSTA )'
      'AND    (BT.IDRESPONSAVEL  = PRESP.IDPESSOA(+))'
      'AND    (BT.IDTITULAR      = DT.IDTITULAR)'
      'AND    (BT.IDPESSOA       = DT.IDPESSOA)'
      'AND    (BF.IDPESSJUR      = BPP.IDPESSJUR(+))'
      'AND    (BF.IDPLANOPREV    = BPP.IDPLANOPREV(+))'
      'AND    (BF.IDTITULAR      = BPP.IDPESSOA(+))'
      'AND    (BF.SEQPROPOSTA    = BPP.SEQPROPOSTA(+))'
      'AND    (BF.IDBENEFICIO    = BPP.IDBENEFICIO(+))'
      'AND    (DT.IDDEPENDENCIA  = D.IDDEPENDENCIA)'
      'AND    (BF.IDBENEFICIO    = B.IDBENEFICIO )'
      'AND    (BP.IDPLANOPREV    = BF.IDPLANOPREV)'
      'AND    (BP.IDBENEFICIO    = BF.IDBENEFICIO)'
      'ORDER BY BP.FLGREFERENCIA DESC, B.NOME'
      '                                                            '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 187
    Top = 17
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMEROPROCESSO'
        ParamType = ptUnknown
      end>
  end
  object dsBeneficiarios: TwwDataSource
    DataSet = qryBeneficiarios
    Left = 256
    Top = 65523
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'P.NUMEROPROCESSO'
      'PES.NOME'
      'BF.NOME '
      'P.DTEVENTO'
      'EL.MATRICULA'
      'PP.INSCRICAONUMERO')
    TipodeDado.Strings = (
      'N'
      'C'
      'C'
      'D'
      'C'
      'N')
    Descricao.Strings = (
      'Nº do Processo'
      'Participante Titular'
      'Benefício Requerido'
      'Data do Evento'
      'Matrícula'
      'Inscrição Nº')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'S'
      'N')
    Tabelas.Strings = (
      'PROCESSOBENEF P'
      'BENEFBFCIARIO B'
      'BENEFPLANPREV BPL'
      'BENEFICIO BF'
      'PESSOA PES'
      'ELEGPATRO EL'
      'PARTPREVPLAN PP')
    CamposChave.Strings = (
      'P.NUMEROPROCESSO'
      'B.IDTITULAR'
      'B.SEQPROPOSTA'
      'B.IDPESSJUR'
      'B.IDPLANOPREV'
      'P.DTEVENTO'
      'BF.IDEVENTOGERADOR')
    Filtro.Strings = (
      'PP.FLGDESATIVADO = 0'
      'PP.IDPESSJUR = EL.IDPESSJUR'
      'PP.IDPESSOA = EL.IDPESSOA'
      'PES.IDPESSOA = EL.IDPESSOA'
      'B.IDPLANOPREV = PP.IDPLANOPREV'
      'B.IDTITULAR = EL.IDPESSOA'
      'B.IDPESSJUR = EL.IDPESSJUR'
      'B.SEQPROPOSTA = 1'
      'B.FLGPROVISORIO = 1'
      'P.NUMEROPROCESSO = B.NUMEROPROCESSO'
      'BF.IDBENEFICIO = B.IDBENEFICIO'
      'BPL.IDBENEFICIO = B.IDBENEFICIO'
      'BPL.IDPLANOPREV = B.IDPLANOPREV ')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '15'
      '30'
      '30'
      '15'
      '13'
      '15')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = True
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 462
    Top = 65533
  end
  object qryTitular: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.NOME, P1.NOME AS NOMEPATRO, PL.NOME AS NOMEPLANO,'
      '       PF.DATANASC, PF.DATAMORTE,'
      
        '       EL.MATRICULA, EL.DATAADMISSAO, EL.DATADEMISSAO, EL.TEMPOS' +
        'ERVANTERIOR,'
      
        '       EL.TEMPOSERVTOTAL, EL.TEMPOSERVTOTMES, EL.TEMPOSERVTOTDIA' +
        ','
      
        '       EL.TEMPONAOCREDITADO, EL.TEMPOSITESPECIAL, EL.NIVEL, EL.I' +
        'DSITFUNC,'
      
        '       PP.INSCRICAONUMERO, PP.INSCRICAODATA, PP.FLGDEVEEMPRESTIM' +
        'O, PP.FLGDEVEASSISTENC,'
      '       PP.FLGDEVEPREVIDENC, PP.IDSITPART, PP.IDSITPLANOPREV,'
      
        '       SPART.DESCRICAO AS NOMESITPART, SFUNC.DESCRICAO AS NOMESI' +
        'TFUNC,'
      
        '       SPLANO.DESCRICAO AS NOMESITPLANO, SPART.FLGINTERNO, SFUNC' +
        '.TIPOSIT,'
      '       PP.IDPESSJUR,PP.IDPLANOPREV, PP.IDPESSOA, PP.SEQPROPOSTA,'
      '       PP.FLGSALVIRTBENEF '
      
        'FROM   PESSOA P, PESSOA P1, PLANPREV PL, PESSOAFISICA PF, ELEGPA' +
        'TRO EL,'
      
        '       PARTPREVPLAN PP, SITPART SPART, SITFUNC SFUNC, SITPLANOPR' +
        'EV SPLANO'
      'WHERE  PP.IDPESSOA    = :IDPESSOA'
      'AND    PP.SEQPROPOSTA = :SEQPROPOSTA'
      'AND    PP.IDPESSJUR   = :IDPESSJUR'
      'AND    PP.IDPLANOPREV = :IDPLANOPREV'
      'AND    EL.IDPESSOA    = :IDPESSOA'
      'AND    EL.IDPESSJUR   = :IDPESSJUR'
      'AND    P.IDPESSOA     = :IDPESSOA'
      'AND    PP.FLGDESATIVADO = 0'
      'AND    P1.IDPESSOA = EL.IDPESSJUR'
      'AND    PF.IDPESSOA = EL.IDPESSOA'
      'AND    PP.IDPLANOPREV = PL.IDPLANOPREV'
      'AND    SFUNC.IDSITFUNC = EL.IDSITFUNC'
      'AND    SPART.IDSITPART = PP.IDSITPART'
      'AND    SPLANO.IDSITPLANOPREV = PP.IDSITPLANOPREV'
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 731
    Top = 17
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'SEQPROPOSTA'
        ParamType = ptUnknown
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
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSJUR'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 684
    Top = 65528
  end
  object qryContrib: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 527
  end
  object qryContaBancaria: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT CB.IDCBANCARIA, CB.CONTACORRENTE, CB.IDAGENCIA, CB.FLGCON' +
        'TAPREF,'
      
        '       CB.IDPESSOA,    CB.TIPOCONTA, AGENCIA.NOME AS AGENCIA, BA' +
        'NCO.NOME AS BANCO,'
      
        '       AGENCIABANCARIA.NUMAGENCIA   , B.NUMBANCO  , CB.FLGCONTAC' +
        'ONJUNTA'
      'FROM CONTABANCARIA  CB, PESSOA AGENCIA,'
      '     PESSOA BANCO, AGENCIABANCARIA AGENCIABANCARIA  , BANCO B'
      'WHERE CB.IDPESSOA = :IDPESSOA AND'
      '       CB.IDAGENCIA = AGENCIA.IDPESSOA AND'
      '       CB.IDAGENCIA  = AGENCIABANCARIA.IDPESSOA AND'
      '       AGENCIABANCARIA.IDBANCO =  BANCO.IDPESSOA AND'
      '       AGENCIABANCARIA.IDBANCO = B.IDPESSOA      AND'
      '       CB.FLGCONTAPREF = 1')
    ValidateWithMask = True
    Left = 673
    Top = 367
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object qryResultado: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT BF.NUMEROPROCESSO,   BF.IDPESSJUR,      BF.IDPLANOPREV,'
      '       BF.IDTITULAR,        BF.IDPESSOA,       BF.SEQPROPOSTA,'
      '       BF.IDBENEFICIO,'
      '       BF.CODPORTFORMA,     BF.IDSITBENEFICIO, BF.IDDEPENDENCIA,'
      
        '       BF.IDTPPAGTOBENEFIC, BF.VALORATUAL,     BF.DATAREQUERIMEN' +
        'TO,'
      
        '       BF.DATAINICIO,       BF.DATAFINAL,      BF.TMPPAGTOBENEFI' +
        'CIO,'
      
        '       BF.FLGFORMAPAGTO,    BF.VALORCALCULADO, BF.DATAULTREAJUST' +
        'E,'
      
        '       BF.VLRCALCINSS,      BF.VLRINFINSS,     BF.DATAINICIOINSS' +
        ','
      '       BF.NUMPROCINSS,      BF.DATAINICIOFUND, BF.VALORCOTAS,'
      
        '       BF.DATACONCESSAO,    BF.FLGPROVISORIO,  BF.PERCPROVISORIO' +
        ','
      
        '       BF.PRAZOPROVISORIO,  BF.ULTMESREAJUSTE, BF.ULTVALORATUALR' +
        'EAJ,'
      '       BF.IDAGENCIARESGATE, BF.DATAFINALPREVISTA,'
      '       BF.FLGDATAPREVISTA,  BF.FLGTIPOINSS,    BF.DIBBENEFANT,'
      
        '       BF.VALORBENEFANT,    BF.VALORBINSSANT1, BF.VALORBINSSANT2' +
        ', BF.VALORBINSSANT3,'
      
        '       BF.VALORTOTAL,       BF.FLGPOSSUIACOMPINSS, BF.FLGBENEFMI' +
        'N,'
      '       BF.VALORSRB,'
      '       BPL.FLGREFERENCIA,'
      '       B.NUMORDEMEVENTO,    B.NOME,            S.DESCRICAO,'
      '       B.FLGRESGATE,        BPART.VALORBASE1,  BPART.VALORBASE2,'
      '       BPART.VALORBASE3,    PT.IDRUBSALAUXDOENCA'
      'FROM   BENEFBFCIARIO BF, BENEFICIO B, BENEFPLANPREV BPL,'
      '       SITBENEFICIO S, BENEFPLANOPART BPART, PATRO PT'
      'WHERE  BF.NUMEROPROCESSO = :NUMEROPROCESSO'
      'AND    B.IDBENEFICIO     = BF.IDBENEFICIO'
      'AND    BPL.IDBENEFICIO   = BF.IDBENEFICIO'
      'AND    BPL.IDPLANOPREV   = BF.IDPLANOPREV'
      'AND    BF.IDPESSJUR      = PT.IDPESSOA'
      
        'AND    ((BPL.FLGREFERENCIA = 0) OR ((BPL.FLGREFERENCIA = 1) AND ' +
        '(BPL.FLGPAGAINSS = 1) ) )'
      'AND    BF.IDSITBENEFICIO = S.IDSITBENEFICIO'
      'AND    BF.IDTITULAR      = BPART.IDPESSOA(+)'
      'AND    BF.SEQPROPOSTA    = BPART.SEQPROPOSTA(+)'
      'AND    BF.IDPESSJUR      = BPART.IDPESSJUR(+)'
      'AND    BF.IDPLANOPREV    = BPART.IDPLANOPREV(+)'
      'AND    BF.IDBENEFICIO    = BPART.IDBENEFICIO(+)  ')
    ControlType.Strings = (
      'FLGPROVISORIO;CheckBox;1;0'
      'FLGPOSSUIACOMPINSS;CheckBox;1;0')
    PictureMasks.Strings = (
      
        'PERCPROVISORIO'#9'{{{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-' +
        ']#[#][#]]],({{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[#' +
        '][#]]]),[-]{{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[#]' +
        '[#]]]}'#9'T'#9'F')
    ValidateWithMask = True
    Left = 625
    Top = 65526
    ParamData = <
      item
        DataType = ftInteger
        Name = 'NUMEROPROCESSO'
        ParamType = ptUnknown
      end>
  end
  object qryAcertos: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT CB.IDCBANCARIA, CB.CONTACORRENTE, CB.IDAGENCIA, CB.FLGCON' +
        'TAPREF,'
      
        '       CB.IDPESSOA,    CB.TIPOCONTA, AGENCIA.NOME AS AGENCIA, BA' +
        'NCO.NOME AS BANCO,'
      
        '       AGENCIABANCARIA.NUMAGENCIA   , B.NUMBANCO  , CB.FLGCONTAC' +
        'ONJUNTA'
      'FROM CONTABANCARIA  CB, PESSOA AGENCIA,'
      '     PESSOA BANCO, AGENCIABANCARIA AGENCIABANCARIA  , BANCO B'
      'WHERE CB.IDPESSOA = :IDPESSOA AND'
      '       CB.IDAGENCIA = AGENCIA.IDPESSOA AND'
      '       CB.IDAGENCIA  = AGENCIABANCARIA.IDPESSOA AND'
      '       AGENCIABANCARIA.IDBANCO =  BANCO.IDPESSOA AND'
      '       AGENCIABANCARIA.IDBANCO = B.IDPESSOA      AND'
      '       CB.FLGCONTAPREF = 1')
    ValidateWithMask = True
    Left = 673
    Top = 238
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
end
