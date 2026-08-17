inherited cfgRelInadimplenciaImovel: TcfgRelInadimplenciaImovel
  Left = 461
  Top = 90
  Caption = 'Inadimplência por Imóvel'
  ClientHeight = 504
  ClientWidth = 594
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 594
    Height = 471
    object lblImovelouMestre: TLabel
      Left = 16
      Top = 497
      Width = 152
      Height = 13
      Caption = 'Imóvel Mestre e/ou Imóvel'
      Visible = False
    end
    object Label1: TLabel
      Left = 16
      Top = 156
      Width = 113
      Height = 13
      Caption = 'Situação Contratual'
    end
    object lblPlano: TLabel
      Left = 16
      Top = 15
      Width = 33
      Height = 13
      Caption = 'Plano'
    end
    object lblPatro: TLabel
      Left = 16
      Top = 61
      Width = 80
      Height = 13
      Caption = 'Patrocinadora'
    end
    object grpDatas: TGroupBox
      Left = 16
      Top = 205
      Width = 288
      Height = 153
      Caption = ' Considerar inadimplência lançamentos '
      TabOrder = 3
      object Label5: TLabel
        Left = 12
        Top = 12
        Width = 132
        Height = 13
        Caption = 'em aberto anteriores a:'
      end
      object Label4: TLabel
        Left = 202
        Top = 36
        Width = 25
        Height = 24
        Caption = 'ou'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edtDataFim: TCMDateTimePicker
        Left = 62
        Top = 38
        Width = 105
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
      object grpCompetencia: TGroupBox
        Left = 24
        Top = 73
        Width = 241
        Height = 59
        Caption = ' Mês de Competência '
        TabOrder = 1
        object DBspnAnoCompetencia: TwwDBSpinEdit
          Left = 168
          Top = 24
          Width = 65
          Height = 21
          Increment = 1
          MaxValue = 2050
          MinValue = 1980
          TabOrder = 1
          UnboundDataType = wwDefault
        end
        object cboMesCompetencia: TComboBox
          Left = 8
          Top = 24
          Width = 151
          Height = 21
          Style = csDropDownList
          ItemHeight = 13
          TabOrder = 0
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
      end
    end
    object rdgOrdenacao: TRadioGroup
      Left = 312
      Top = 269
      Width = 265
      Height = 89
      Caption = ' Ordenar por: '
      ItemIndex = 0
      Items.Strings = (
        'Nome do Imóvel'
        'Código do Imóvel'
        'Matrícula')
      TabOrder = 4
    end
    object chkCorLinha: TCheckBox
      Left = 16
      Top = 441
      Width = 233
      Height = 17
      Caption = 'Imprimir linhas com cores alternadas: '
      Checked = True
      State = cbChecked
      TabOrder = 6
    end
    object cboCorLinha: TfcColorCombo
      Left = 260
      Top = 439
      Width = 129
      Height = 21
      AlignmentVertical = fcavCenter
      AutoSelect = False
      ColorDialogOptions = []
      ColorListOptions.ColorWidth = 119
      ColorListOptions.Font.Charset = DEFAULT_CHARSET
      ColorListOptions.Font.Color = clWindowText
      ColorListOptions.Font.Height = -11
      ColorListOptions.Font.Name = 'MS Sans Serif'
      ColorListOptions.Font.Style = []
      ColorListOptions.GreyScaleIncrement = 1
      ColorListOptions.Options = [ccoShowCustomColors]
      CustomColors.Strings = (
        'ColorA=FFFFFF'
        'ColorC=00C0FFFF'
        'ColorD=00C6F9CC'
        'ColorE=00F3E6CD'
        'ColorF=00A0A0A0'
        'ColorG=00BEBEBE'
        'ColorH=00D2D2D2'
        'ColorI=00E3E3E3')
      DropDownCount = 8
      DropDownWidth = 119
      ReadOnly = False
      ShowMatchText = False
      SelectedColor = clWhite
      TabOrder = 7
    end
    object chkLinhas: TCheckBox
      Left = 16
      Top = 417
      Width = 177
      Height = 17
      Caption = 'Imprimir linhas separadoras'
      TabOrder = 5
    end
    object edtImovelouMestre: TEdit
      Left = 15
      Top = 511
      Width = 514
      Height = 21
      Enabled = False
      TabOrder = 0
      Visible = False
    end
    object btnBuscaImovelMestre: TBitBtn
      Left = 528
      Top = 511
      Width = 24
      Height = 22
      Hint = 'Busca um Imóvel Mestre'
      TabOrder = 1
      Visible = False
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
    object btnLimpaImovelMestre: TBitBtn
      Left = 552
      Top = 511
      Width = 24
      Height = 22
      Hint = 'Limpa a seleção de Imóvel Mestre'
      TabOrder = 2
      Visible = False
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        88888888888FF8888888888888008888888888888F77F8888888888800F08888
        8888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0888
        88887788888F788888887FFFFFCF888888887F88FF7888FF88887FFCCCF88008
        888878F777888778F88887FFFF880110888887F88F8878878F8887FFC8809991
        0888878F7887F88878F8887FF88099991088887F88878F88878F887FF8880999
        03088878F88878F878788887F8888090B03088878F888787878788887888880B
        0B038888788888787878888888888880B0B38888888888878788888888888888
        0BBB88888888888878F888888888888880BB8888888888888788}
      NumGlyphs = 2
    end
    object cbAgrupa: TCheckBox
      Left = 16
      Top = 369
      Width = 145
      Height = 17
      Caption = 'Agrupar por Segmento'
      Checked = True
      State = cbChecked
      TabOrder = 8
    end
    inline molImovel1: TmolImovel
      Left = 8
      Top = 104
      Width = 585
      Height = 49
      TabOrder = 9
      inherited Label5: TLabel
        Top = 1
      end
      inherited edtImovel: TEdit
        Width = 513
      end
      inherited btnBuscaImovel: TBitBtn
        Left = 520
        Top = 15
        OnClick = molImovel1btnBuscaImovelClick
      end
      inherited btnLimpaImovel: TBitBtn
        Left = 544
        Top = 15
      end
    end
    object GroupBox1: TGroupBox
      Left = 312
      Top = 205
      Width = 265
      Height = 57
      Caption = 'Valores atualizados até '
      TabOrder = 10
      object edDataAtualiza: TCMDateTimePicker
        Left = 80
        Top = 22
        Width = 105
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
    end
    object chkVlrPositivo: TCheckBox
      Left = 16
      Top = 393
      Width = 225
      Height = 17
      Caption = 'Apresentar apenas valores positivos'
      Checked = True
      State = cbChecked
      TabOrder = 11
    end
    object dbCboSituacaoContratual: TwwDBLookupCombo
      Left = 16
      Top = 170
      Width = 288
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'DESCRICAO'#9'60'#9'DESCRICAO'#9'F')
      LookupTable = qrySitContratual
      LookupField = 'IDSITCONTIMOB'
      Style = csDropDownList
      DropDownWidth = 8
      TabOrder = 12
      AutoDropDown = True
      ShowButton = True
      UseTFields = False
      AllowClearKey = True
    end
    object gbTipoContrato: TGroupBox
      Left = 312
      Top = 160
      Width = 265
      Height = 39
      Caption = ' Tipo de Contrato: '
      TabOrder = 13
      object cbLocacao: TCheckBox
        Left = 8
        Top = 16
        Width = 91
        Height = 17
        Caption = 'de Locação'
        Checked = True
        State = cbChecked
        TabOrder = 0
      end
      object cbConfissao: TCheckBox
        Left = 112
        Top = 16
        Width = 145
        Height = 17
        Caption = 'Confissão de Dívidas'
        Checked = True
        State = cbChecked
        TabOrder = 1
      end
    end
    object dbcboPlanPrev: TwwDBLookupCombo
      Left = 16
      Top = 31
      Width = 445
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'50'#9'NOME'#9'F')
      LookupTable = cdsPlano
      LookupField = 'IDPLANOPREV'
      TabOrder = 14
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
    object dbcboPatro: TwwDBLookupCombo
      Left = 16
      Top = 79
      Width = 445
      Height = 21
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'60'#9'NOME'#9'F')
      LookupTable = cdsPatro
      LookupField = 'IDPESSOA'
      TabOrder = 15
      AutoDropDown = False
      ShowButton = True
      AllowClearKey = False
    end
  end
  inherited Dock971: TDock97
    Top = 471
    Width = 594
    inherited tb97Fundo: TToolbar97
      Left = 382
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        ModalResult = 0
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      2
      (
        ''
        'Filter'
        0)
      (
        ''
        'DisplayLabel'
        0))
  end
  object qryParamOper: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DTULTFECH'
      'FROM PARAMIMOVEL'
      ''
      '--SELECT MAX(DATAOPER) AS ULT'
      '--FROM LANCOPERDIAIMOB L'
      '--WHERE IDMODULO = 64'
      '--  AND FLGTIPO IS NULL'
      ' ')
    Left = 528
    Top = 208
    object qryParamOperDTULTFECH: TDateTimeField
      FieldName = 'DTULTFECH'
    end
  end
  object dsParamOper: TDataSource
    DataSet = qryParamOper
    Left = 488
    Top = 272
  end
  object Query1: TQuery
    SQL.Strings = (
      '// Query Inadimplência por Contrato Analítico ...'
      
        'SELECT C.IDCONTRATOIMOVEL, DECODE(C.IDCONTRATOIMOVEL, NULL, '#39'REC' +
        'EITA SEM CONTRATO'#39', C.CONNUMERO) AS NUMERO_CONTRATO,'
      
        '                           DECODE(C.IDCONTRATOIMOVEL, NULL, '#39'REC' +
        'EITA SEM CONTRATO'#39', C.CONNOME)   AS NOME_CONTRATO,'
      
        '       DD.CODDOCUMENTO, DD.TOT_RECEBER, DD.RECEBIDO, CM.VLRACUM ' +
        'AS CORRECAO, JR.VLRACUM AS JUROS, MT.VLRACUM AS MULTA,'
      
        '     ((DD.TOT_RECEBER - DD.RECEBIDO) + DECODE(CM.VLRACUM, NULL, ' +
        '0, CM.VLRACUM) + DECODE(JR.VLRACUM, NULL, 0, JR.VLRACUM) + DECOD' +
        'E(MT.VLRACUM, NULL, 0, MT.VLRACUM)) AS TOTAL,'
      
        '      (DD.MESCOMPETENCIA || '#39'/'#39' || DD.ANOCOMPETENCIA) AS COMPETE' +
        'NCIA, ROUND(TO_DATE('#39'01/01/2006'#39', '#39'DD/MM/YYYY'#39') - DD.DATAVENCIME' +
        'NTO, 0) AS DIAS,'
      
        '       DD.DATAVENCIMENTO, C.CONDATAINICIO, C.CONDATAFIM, C.IDLOC' +
        'ATARIO, PL.NOME AS NF_LOCATARIO, PL.RAZAOSOCIAL AS RS_LOCATARIO,'
      '       C.IDADMINIMOVEL'
      'FROM PESSOA PL, PESSOA PA, CONTRATOIMOVEL C,'
      '     // Início da Query " DD " ...'
      
        '   ( SELECT LI.CODDOCUMENTO, LI.IDCONTRATOIMOVEL, LI.MESCOMPETEN' +
        'CIA, LI.ANOCOMPETENCIA, LI.DATAVENCIMENTO, LI.DATALIMITE,'
      '            LI.CODTIPIMOVEL, LI.IDTIPOCUSTORECIMO,'
      '            SUM('
      
        '                DECODE(RTRIM(LD.OPERACAO),  '#39'1'#39', DECODE(D.RECPAG' +
        ', '#39'R'#39', DECODE(LD.DEBCRE, '#39'D'#39', LI.VLRLANCRECEB, LI.VLRLANCRECEB *' +
        ' (-1)), 0), 0) +'
      
        '                DECODE(RTRIM(LD.OPERACAO),  '#39'2'#39', DECODE(D.RECPAG' +
        ', '#39'R'#39', DECODE(LD.DEBCRE, '#39'D'#39', LI.VLRLANCRECEB, LI.VLRLANCRECEB *' +
        ' (-1)), 0), 0) +'
      
        '                DECODE(RTRIM(LD.OPERACAO),  '#39'3'#39', DECODE(D.RECPAG' +
        ', '#39'R'#39', DECODE(LD.DEBCRE, '#39'D'#39', LI.VLRLANCRECEB, LI.VLRLANCRECEB *' +
        ' (-1)), 0), 0) +'
      
        '                DECODE(RTRIM(LD.OPERACAO),  '#39'4'#39', DECODE(D.RECPAG' +
        ', '#39'R'#39', DECODE(LD.DEBCRE, '#39'D'#39', LD.VALOR * LI.VLRLANCRECEB / TRD.V' +
        'ALOR, LD.VALOR * (-1) * LI.VLRLANCRECEB / TRD.VALOR), 0), 0)'
      '               ) AS TOT_RECEBER,'
      
        '            SUM( DECODE(RTRIM(LD.OPERACAO), '#39'5'#39', DECODE(D.RECPAG' +
        ', '#39'R'#39', LD.VALOR, 0), 0) * LI.VLRLANCRECEB / TRD.VALOR ) AS RECEB' +
        'IDO'
      
        '     FROM DOCUMENTO D, LANCTODOCUM LD, LANCAMENTOSIMOVEL LI, TIP' +
        'OIMOVEL T, CONTRATOIMOVEL C,'
      ''
      '          // Início da Query " TRD " ...'
      '        ( SELECT CODDOCUMENTO, VALOR'
      '          FROM LANCTODOCUM'
      
        '          WHERE RTRIM(OPERACAO) = '#39'1'#39' OR RTRIM(OPERACAO) = '#39'2'#39' O' +
        'R RTRIM(OPERACAO) = '#39'3'#39') TRD'
      '          // Fim da Query " TRD " ...'
      ''
      
        '     WHERE ( C.FLGTIPOCONTRATO = '#39'L'#39' OR LI.IDCONTRATOIMOVEL IS N' +
        'ULL )'
      
        '       AND ( LD.DATALANCTO <= TO_DATE('#39'01/01/2006'#39', '#39'DD/MM/YYYY'#39 +
        ') )'
      '       AND ( LI.CODDOCUMENTO = D.CODDOCUMENTO )'
      '       AND ( D.CODDOCUMENTO  = LD.CODDOCUMENTO )'
      '       AND ( D.CODDOCUMENTO  = TRD.CODDOCUMENTO )'
      '       AND ( LI.CODTIPIMOVEL = T.CODTIPIMOVEL )'
      '       AND ( LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL(+) )'
      
        '       AND ( (LD.CODALTERADOR IS NULL) OR (LD.CODALTERADOR IN (T' +
        '.CODALTMULTA, T.CODALTJUROS, T.CODALTCORRMON)'
      '       AND   LD.DATALANCTO < TO_DATE('#39'31/12/2004'#39','#39'DD/MM/YYYY'#39')'
      
        '       AND NOT EXISTS ( SELECT 1 FROM LANCOPERDIAIMOB WHERE CODD' +
        'OCUMENTO = LD.CODDOCUMENTO ) ) OR'
      '           ( LD.CODALTERADOR <> NVL(T.CODALTMULTA,0)'
      '       AND   LD.CODALTERADOR <> NVL(T.CODALTJUROS,0)'
      '       AND   LD.CODALTERADOR <> NVL(T.CODALTCORRMON,0)) )'
      
        '     GROUP BY LI.CODDOCUMENTO, LI.IDCONTRATOIMOVEL, LI.MESCOMPET' +
        'ENCIA, LI.ANOCOMPETENCIA, LI.DATAVENCIMENTO, LI.DATALIMITE,'
      '              LI.CODTIPIMOVEL, LI.IDTIPOCUSTORECIMO ) DD,'
      '     // Fim da Query " DD " ...'
      ''
      '     // Início da Query " CM " ...'
      '   ( SELECT LO.CODDOCUMENTO, LO.IDCONTRATOIMOVEL, LO.IDOPERACAO,'
      '            SUM(LO.VLRACUM) AS VLRACUM'
      '     FROM LANCOPERDIAIMOB LO, PARAMIMOVEL PI,'
      ''
      '          // Início da Query " UD " ...'
      '        ( SELECT LO2.CODDOCUMENTO, MAX(LO2.DATAOPER) AS ULTDIA'
      '          FROM LANCOPERDIAIMOB LO2, PARAMIMOVEL PI2'
      '          WHERE LO2.IDOPERACAO = PI2.IDOPERATUALCM'
      
        '            AND ( LO2.DATAOPER <= TO_DATE('#39'01/01/2006'#39', '#39'DD/MM/Y' +
        'YYY'#39') )'
      '          GROUP BY LO2.CODDOCUMENTO ) UD'
      '          // Fim da Query " UD " ...'
      ''
      '     WHERE LO.IDOPERACAO   = PI.IDOPERATUALCM'
      '       AND LO.DATAOPER     = UD.ULTDIA'
      '       AND LO.CODDOCUMENTO = UD.CODDOCUMENTO (+)'
      
        '     GROUP BY LO.CODDOCUMENTO, LO.IDCONTRATOIMOVEL, LO.IDOPERACA' +
        'O ) CM,'
      '     // Fim da Query " CM " ...'
      ''
      '     // Início da Query " JR " ...'
      '   ( SELECT LO.CODDOCUMENTO, LO.IDCONTRATOIMOVEL, LO.IDOPERACAO,'
      '            SUM(LO.VLRACUM) AS VLRACUM'
      '     FROM LANCOPERDIAIMOB LO, PARAMIMOVEL PI,'
      ''
      '          // Início da Query " UD " ...'
      '        ( SELECT LO2.CODDOCUMENTO, MAX(LO2.DATAOPER) AS ULTDIA'
      '          FROM LANCOPERDIAIMOB LO2, PARAMIMOVEL PI2'
      '          WHERE   LO2.IDOPERACAO = PI2.IDOPERATUALJUROS'
      
        '            AND ( LO2.DATAOPER <= TO_DATE('#39'01/01/2006'#39', '#39'DD/MM/Y' +
        'YYY'#39') )'
      '          GROUP BY LO2.CODDOCUMENTO ) UD'
      '          // Fim da Query " UD " ...'
      ''
      '     WHERE LO.IDOPERACAO   = PI.IDOPERATUALJUROS'
      '       AND LO.DATAOPER     = UD.ULTDIA'
      '       AND LO.CODDOCUMENTO = UD.CODDOCUMENTO (+)'
      
        '     GROUP BY LO.CODDOCUMENTO, LO.IDCONTRATOIMOVEL, LO.IDOPERACA' +
        'O ) JR,'
      '     // Fim da Query " JR " ...'
      ''
      '     // Início da Query " MT " ...'
      '   ( SELECT LO.CODDOCUMENTO, LO.IDCONTRATOIMOVEL, LO.IDOPERACAO,'
      '            SUM(LO.VLRACUM) AS VLRACUM'
      '     FROM LANCOPERDIAIMOB LO, PARAMIMOVEL PI,'
      ''
      '          // Início da Query " UD " ...'
      '        ( SELECT LO2.CODDOCUMENTO, MAX(LO2.DATAOPER) AS ULTDIA'
      '          FROM LANCOPERDIAIMOB LO2, PARAMIMOVEL PI2'
      '          WHERE  LO2.IDOPERACAO = PI2.IDOPERATUALMULTA'
      
        '           AND ( LO2.DATAOPER <= TO_DATE('#39'01/01/2006'#39', '#39'DD/MM/YY' +
        'YY'#39') )'
      '          GROUP BY LO2.CODDOCUMENTO ) UD'
      '          // Fim da Query " UD " ...'
      ''
      '     WHERE LO.IDOPERACAO   = PI.IDOPERATUALMULTA'
      '       AND LO.DATAOPER     = UD.ULTDIA'
      '       AND LO.CODDOCUMENTO = UD.CODDOCUMENTO (+)'
      
        '     GROUP BY LO.CODDOCUMENTO, LO.IDCONTRATOIMOVEL, LO.IDOPERACA' +
        'O ) MT'
      '     // Fim da Query " MT " ...'
      ''
      
        'WHERE ( ROUND((DD.TOT_RECEBER + NVL(CM.VLRACUM,0) + NVL(JR.VLRAC' +
        'UM,0) + NVL(MT.VLRACUM,0) - DD.RECEBIDO),2) > 0 )'
      '  AND ( C.IDLOCATARIO        = PL.IDPESSOA(+) )'
      '  AND ( C.IDADMINIMOVEL      = PA.IDPESSOA(+) )'
      '  AND ( DD.IDCONTRATOIMOVEL  = C.IDCONTRATOIMOVEL(+) )'
      '  AND ( DD.CODDOCUMENTO      = CM.CODDOCUMENTO (+) )'
      '  AND ( DD.IDCONTRATOIMOVEL  = CM.IDCONTRATOIMOVEL (+) )'
      '  AND ( DD.CODDOCUMENTO      = JR.CODDOCUMENTO (+) )'
      '  AND ( DD.IDCONTRATOIMOVEL  = JR.IDCONTRATOIMOVEL (+) )'
      '  AND ( DD.CODDOCUMENTO      = MT.CODDOCUMENTO (+) )'
      '  AND ( DD.IDCONTRATOIMOVEL  = MT.IDCONTRATOIMOVEL (+) )'
      
        '  AND ( (DD.DATALIMITE IS NOT NULL AND DD.DATALIMITE <= TO_DATE(' +
        #39'01/04/2006'#39', '#39'DD/MM/YYYY'#39')) OR'
      
        '        (DD.DATALIMITE IS NULL AND DD.DATAVENCIMENTO <= TO_DATE(' +
        #39'01/04/2006'#39', '#39'DD/MM/YYYY'#39')) )'
      
        'ORDER BY C.CONNUMERO, PL.NOME, DD.DATAVENCIMENTO, COMPETENCIA, D' +
        'D.CODDOCUMENTO'
      ''
      ''
      ''
      ''
      ''
      ''
      ''
      '// Query Inadimplência por Contrato Sintético ...'
      
        'SELECT C.IDCONTRATOIMOVEL, C.CONNUMERO AS NUMERO_CONTRATO, C.CON' +
        'NOME AS NOME_CONTRATO, C.CONDATAINICIO, C.CONDATAFIM,'
      
        '       C.IDLOCATARIO, PL.NOME AS NF_LOCATARIO, PL.RAZAOSOCIAL AS' +
        ' RS_LOCATARIO, C.IDADMINIMOVEL, PA.NOME AS NF_ADMINISTRADORA,'
      
        '       PL.RAZAOSOCIAL AS RS_ADMINISTRADORA, (REC_DES.TOT_RECEBER' +
        ' + NVL(COR.VLRCORRECAO,0) - REC_DES.RECEBIDO) AS TOT_RECEBER'
      'FROM PESSOA PL, PESSOA PA, CONTRATOIMOVEL C,'
      '     // Início da Query " REC_DES " ...'
      '   ( SELECT LI.IDCONTRATOIMOVEL,'
      '            SUM('
      
        '                DECODE(RTRIM(LD.OPERACAO),  '#39'1'#39', DECODE(D.RECPAG' +
        ', '#39'R'#39', DECODE(LD.DEBCRE, '#39'D'#39', LI.VLRLANCRECEB, LI.VLRLANCRECEB *' +
        ' (-1)), 0), 0) +'
      
        '                DECODE(RTRIM(LD.OPERACAO),  '#39'2'#39', DECODE(D.RECPAG' +
        ', '#39'R'#39', DECODE(LD.DEBCRE, '#39'D'#39', LI.VLRLANCRECEB, LI.VLRLANCRECEB *' +
        ' (-1)), 0), 0) +'
      
        '                DECODE(RTRIM(LD.OPERACAO),  '#39'3'#39', DECODE(D.RECPAG' +
        ', '#39'R'#39', DECODE(LD.DEBCRE, '#39'D'#39', LI.VLRLANCRECEB, LI.VLRLANCRECEB *' +
        ' (-1)), 0), 0) +'
      
        '                DECODE(RTRIM(LD.OPERACAO),  '#39'4'#39', DECODE(D.RECPAG' +
        ', '#39'R'#39', DECODE(LD.DEBCRE, '#39'D'#39', LD.VALOR * LI.VLRLANCRECEB / TRD.V' +
        'ALOR, LD.VALOR * (-1) * LI.VLRLANCRECEB / TRD.VALOR), 0), 0)'
      '               ) AS TOT_RECEBER,'
      
        '            SUM(DECODE(RTRIM(LD.OPERACAO), '#39'5'#39', DECODE(D.RECPAG,' +
        ' '#39'R'#39', DECODE(LD.DEBCRE, '#39'C'#39', LD.VALOR * LI.VLRLANCRECEB / TRD.VA' +
        'LOR, LD.VALOR * (-1) * LI.VLRLANCRECEB / TRD.VALOR), 0), 0)) AS ' +
        'RECEBIDO'
      
        '     FROM DOCUMENTO D, LANCTODOCUM LD, LANCAMENTOSIMOVEL LI, TIP' +
        'OIMOVEL T, CONTRATOIMOVEL C,'
      ''
      '          // Início da Query " TRD " ...'
      '        ( SELECT CODDOCUMENTO, VALOR'
      '          FROM LANCTODOCUM'
      
        '          WHERE RTRIM(OPERACAO) = '#39'1'#39' OR RTRIM(OPERACAO) = '#39'2'#39' O' +
        'R RTRIM(OPERACAO) = '#39'3'#39') TRD'
      '          // Fim da Query " TRD " ...'
      ''
      '     WHERE ( LI.IDCONTRATOIMOVEL IS NOT NULL )'
      '       AND ( LI.CODDOCUMENTO   = D.CODDOCUMENTO )'
      '       AND ( LI.IDCONTRATOIMOVEL = C.IDCONTRATOIMOVEL )'
      
        '       AND ( LD.DATALANCTO <= TO_DATE('#39'01/01/2006'#39', '#39'DD/MM/YYYY'#39 +
        ') )'
      '       AND ( C.FLGTIPOCONTRATO = '#39'L'#39' )'
      '       AND ( D.CODDOCUMENTO = LD.CODDOCUMENTO )'
      '       AND ( D.CODDOCUMENTO = TRD.CODDOCUMENTO )'
      '       AND ( LI.CODTIPIMOVEL = T.CODTIPIMOVEL )'
      
        '       AND ( (LD.CODALTERADOR IS NULL) OR (LD.CODALTERADOR IN (T' +
        '.CODALTMULTA, T.CODALTJUROS, T.CODALTCORRMON)'
      '       AND   LD.DATALANCTO < TO_DATE('#39'31/12/2004'#39','#39'DD/MM/YYYY'#39')'
      
        '       AND NOT EXISTS ( SELECT 1 FROM LANCOPERDIAIMOB WHERE CODD' +
        'OCUMENTO = LD.CODDOCUMENTO ) ) OR'
      '           ( LD.CODALTERADOR <> NVL(T.CODALTMULTA,0)'
      '       AND   LD.CODALTERADOR <> NVL(T.CODALTJUROS,0)'
      '       AND   LD.CODALTERADOR <> NVL(T.CODALTCORRMON,0)) )'
      
        '       AND ( (LI.DATALIMITE IS NOT NULL AND LI.DATALIMITE <= TO_' +
        'DATE('#39'01/04/2006'#39', '#39'DD/MM/YYYY'#39')) OR'
      
        '             (LI.DATALIMITE IS NULL AND LI.DATAVENCIMENTO <= TO_' +
        'DATE('#39'01/04/2006'#39', '#39'DD/MM/YYYY'#39')) )'
      '     GROUP BY LI.IDCONTRATOIMOVEL ) REC_DES,'
      '     // Fim da Query " REC_DES " ...'
      ''
      '     // Início da Query " COR " ...'
      '   ( SELECT LO.IDCONTRATOIMOVEL, SUM(LO.VLRACUM) AS VLRCORRECAO'
      '     FROM LANCOPERDIAIMOB LO, PARAMIMOVEL PI,'
      ''
      '          // Início da Query " UD " ...'
      '        ( SELECT LO2.CODDOCUMENTO, MAX(LO2.DATAOPER) AS ULTDIA'
      '          FROM LANCOPERDIAIMOB LO2, PARAMIMOVEL PI2'
      '          WHERE ( LO2.IDOPERACAO = PI2.IDOPERATUALCM OR'
      '                  LO2.IDOPERACAO = PI2.IDOPERATUALJUROS OR'
      '                  LO2.IDOPERACAO = PI2.IDOPERATUALMULTA )'
      
        '          AND ( LO2.DATAOPER <= TO_DATE('#39'01/01/2006'#39', '#39'DD/MM/YYY' +
        'Y'#39') )'
      '          GROUP BY LO2.CODDOCUMENTO ) UD'
      '          // Fim da Query " UD " ...'
      ''
      '     WHERE ( LO.IDOPERACAO = PI.IDOPERATUALCM    OR'
      '             LO.IDOPERACAO = PI.IDOPERATUALJUROS OR'
      '             LO.IDOPERACAO = PI.IDOPERATUALMULTA )'
      '       AND   LO.DATAOPER     = UD.ULTDIA'
      '       AND   LO.CODDOCUMENTO = UD.CODDOCUMENTO (+)'
      '     GROUP BY LO.IDCONTRATOIMOVEL ) COR'
      '     // Fim da Query " COR " ...'
      ''
      
        'WHERE ( ROUND((REC_DES.TOT_RECEBER + NVL(COR.VLRCORRECAO,0) - RE' +
        'C_DES.RECEBIDO),2) <> 0 )'
      '  AND ( C.IDLOCATARIO = PL.IDPESSOA(+) )'
      '  AND ( C.IDADMINIMOVEL = PA.IDPESSOA(+) )'
      '  AND ( C.IDCONTRATOIMOVEL = REC_DES.IDCONTRATOIMOVEL )'
      '  AND ( C.IDCONTRATOIMOVEL = COR.IDCONTRATOIMOVEL(+) )'
      'ORDER BY C.CONNUMERO, PL.NOME'
      '')
    Left = 528
    Top = 312
  end
  object qrySitContratual: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDSITCONTIMOB, DESCRICAO'
      'FROM SITCONTIMOB'
      'ORDER BY DESCRICAO')
    Left = 168
    Top = 153
    object qrySitContratualDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.SITCONTIMOB.DESCRICAO'
      Size = 60
    end
    object qrySitContratualIDSITCONTIMOB: TFloatField
      FieldName = 'IDSITCONTIMOB'
      Origin = 'BASEDADOS.SITCONTIMOB.IDSITCONTIMOB'
    end
  end
  object dsSitContratual: TDataSource
    DataSet = qrySitContratual
    Left = 224
    Top = 153
  end
  object dsPlano: TDataSource
    DataSet = cdsPlano
    Left = 472
    Top = 24
  end
  object dsPatro: TDataSource
    DataSet = cdsPatro
    Left = 472
    Top = 72
  end
  object cdsPlano: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 510
    Top = 28
    Data = {
      280100009619E0BD010000001800000005000400000003000000B3000B494450
      4C414E4F505245560800040000000000044E4F4D450100490000000100055749
      4454480200020032000C434F444F5243414D454E544F01004900000001000557
      494454480200020002000E5349474C414F5243414D454E544F01004900000001
      00055749445448020002000A0006434F44535043010049000000010005574944
      5448020002000A000100044C4349440400010009080000005001000000000000
      08401250545220313020505245564944454E4349410050010000000000002C40
      0B504C414E4F205054522031005001000000000080404017504C414E4F205054
      52203120505245564944454E4349410050010000000000804840114D4F44454C
      4F2042454E45464943494F53}
    object cdsPlanoNOME: TStringField
      DisplayWidth = 50
      FieldName = 'NOME'
      Size = 50
    end
    object cdsPlanoIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
  end
  object cdsPatro: TCMClientDataSet
    Active = True
    Aggregates = <>
    Params = <>
    Left = 510
    Top = 76
    Data = {
      460100009619E0BD010000001800000002000E00000003000000510008494450
      4553534F410800040000000000044E4F4D450100490000000100055749445448
      020002003C000100044C43494404000100090800000000000000000000F03F05
      5054522032000000000000000000400F46554E4441C7C34F204D4F44454C4F00
      0000000000000008400550545220330000000000000000104005505452203400
      000000000000C05B4005505452203600000000000010F6304105505452203500
      000000000039F630410A50545220313131313520000000000000BCF630410950
      5452203131313136000000000000C6F6304103464341000000000000CAF63041
      03465341000000000000D0F6304103465443000000000000D2F630410343464E
      000000000000488232410850545220313131310000000000000E6637410C4241
      4E434F204D4F44454C4F}
    object cdsPatroNOME: TStringField
      DisplayWidth = 60
      FieldName = 'NOME'
      Size = 60
    end
    object cdsPatroIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Visible = False
    end
  end
end
