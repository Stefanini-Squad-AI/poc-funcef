inherited frmExecAbateReserva: TfrmExecAbateReserva
  Left = 129
  Top = 222
  HelpContext = 180064
  BorderStyle = bsSingle
  Caption = 'Abatimento de Reservas para Benefícios Pagos'
  ClientHeight = 378
  ClientWidth = 574
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 574
    Height = 339
    inherited PagControle: TPageControl
      Width = 572
      Height = 337
      inherited tabSelecao: TTabSheet
        inherited lblTitulo: TfcLabel
          Left = 8
          Width = 482
          Align = alNone
          Caption = 'Abatimento de Reservas para Benefícios Pagos'
        end
        object Label8: TLabel
          Left = 8
          Top = 34
          Width = 55
          Height = 13
          Caption = 'Matrícula'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label2: TLabel
          Left = 104
          Top = 34
          Width = 33
          Height = 13
          Caption = 'Nome'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object edtNome: TEdit
          Left = 104
          Top = 48
          Width = 401
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 0
        end
        object edtMatricula: TEdit
          Left = 8
          Top = 48
          Width = 97
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object btnBuscaPart: TBitBtn
          Left = 504
          Top = 48
          Width = 24
          Height = 22
          Hint = 'Busca um Assitido'
          TabOrder = 2
          OnClick = btnBuscaPartClick
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
        object Panel1: TPanel
          Left = 264
          Top = 88
          Width = 289
          Height = 57
          TabOrder = 3
          object Label15: TLabel
            Left = 40
            Top = 10
            Width = 124
            Height = 13
            Caption = 'Referência (mês/ano)'
          end
          object DBspnAno: TwwDBSpinEdit
            Left = 192
            Top = 24
            Width = 65
            Height = 21
            Increment = 1
            MaxValue = 2035
            MinValue = 1975
            TabOrder = 1
            UnboundDataType = wwDefault
          end
          object cboMes: TComboBox
            Left = 40
            Top = 24
            Width = 153
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
        object btnLimpaPart: TBitBtn
          Left = 528
          Top = 48
          Width = 24
          Height = 22
          Hint = 'Limpa a seleção de Assistido'
          TabOrder = 4
          OnClick = btnLimpaPartClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            888888888888FF8888888888888008888888888888F77F8888888888800F0888
            88888888F7787F88888888800FFF0888888888F7788878888888800FFFFF8888
            8888877888888FF8888887FFFF880088888887F88888778F888887FFF8801108
            8888878F88878878F888887FF80999108888887F887F88878F88887FF8099991
            08888878F878F88878F88887F880999030888887F8878F87878F8887FF88090B
            030888878F887878787888887F8880B0B038888878F88787878888888788880B
            0B388888878888787888888888888880BBB88888888888878F88888888888888
            0BB888888888888878F888888888888880B88888888888888788}
          NumGlyphs = 2
        end
      end
      inherited TabSheet1: TTabSheet
        inherited fcLabel1: TfcLabel
          Left = 8
          Width = 482
          Align = alNone
          Caption = 'Abatimento de Reservas para Benefícios Pagos'
        end
        object memResult: TMemo
          Left = 8
          Top = 54
          Width = 545
          Height = 155
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 1
        end
        object Panel3: TPanel
          Left = 8
          Top = 32
          Width = 545
          Height = 23
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Processados'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
        object memErro: TMemo
          Left = 8
          Top = 242
          Width = 545
          Height = 79
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 3
        end
        object Panel2: TPanel
          Left = 8
          Top = 220
          Width = 545
          Height = 23
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Ocorrências'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 339
    Width = 574
    inherited tb97Fundo: TToolbar97
      Left = 134
      DockPos = 419
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 971
    Top = 11
    TargetsData = (
      1
      1
      (
        'TMemo'
        'Text'
        0))
  end
  object qryBeneficios: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   SUM(DECODE(HBB.FLGDEVOLUCAO, 1, -HBB.VLBENEFPGTO, HBB.VLBENEF' +
        'PGTO)) AS VALOR,'
      
        '   HBB.IDPESSJUR, HBB.IDPLANOPREV, HBB.SEQPROPOSTA, HBB.MESREFER' +
        'ENCIA, HBB.DTEFETPGTO,'
      
        '   HBB.IDTITULAR, HBB.IDBENEFICIO, HBB.FLGALIMRESERVA, HBB.IDSEQ' +
        'INTERNOFB,'
      '   ELP.MATRICULA'
      ''
      'FROM'
      '   HSTBENEFBFCIARIO HBB,'
      '   ELEGPATRO        ELP'
      ''
      'WHERE 1 = 2'
      ''
      '   AND HBB.IDHSTFOLHABENEF         IS NOT NULL'
      '   AND HBB.IDSEQINTERNOFB          IS NOT NULL'
      ''
      '   AND HBB.IDTITULAR               = ELP.IDPESSOA'
      '   AND HBB.IDPESSJUR               = ELP.IDPESSJUR'
      ''
      '   AND EXISTS ('
      
        '              SELECT 1                                          ' +
        '                        '
      
        '              FROM                                              ' +
        '                        '
      
        '                 BENEFRESERVA   BNR,                            ' +
        '                        '
      
        '                 RESERVAPART    RSP,                            ' +
        '                        '
      
        '                 RESERVAXPLANO  RXP                             ' +
        '                        '
      
        '              WHERE                                             ' +
        '                        '
      
        '                     BNR.IDBENEFICIO     = HBB.IDBENEFICIO      ' +
        '                        '
      '                 AND RSP.IDPESSJUR       = HBB.IDPESSJUR'
      
        '                 AND RSP.IDPLANOPREV     = HBB.IDPLANOPREV      ' +
        '                        '
      
        '                 AND RSP.IDPESSOA        = HBB.IDTITULAR        ' +
        '                        '
      
        '                 AND RSP.SEQPROPOSTA     = HBB.SEQPROPOSTA      ' +
        '                        '
      
        '                 AND RSP.IDTIPORESERVA   = BNR.IDTIPORESERVA    ' +
        '                        '
      
        '                 AND RXP.IDPLANOPREV     = HBB.IDPLANOPREV      ' +
        '                        '
      
        '                 AND RXP.IDTIPORESERVA   = BNR.IDTIPORESERVA    ' +
        '                        '
      
        '              )                                                 ' +
        '                        '
      ''
      
        'GROUP BY                                                        ' +
        '                        '
      
        '   HBB.IDPESSJUR, HBB.IDPLANOPREV, HBB.SEQPROPOSTA, HBB.MESREFER' +
        'ENCIA, HBB.DTEFETPGTO, '
      
        '   HBB.IDTITULAR, HBB.IDBENEFICIO, HBB.FLGALIMRESERVA, HBB.IDSEQ' +
        'INTERNOFB, ELP.MATRICULA')
    ValidateWithMask = True
    Left = 40
    Top = 160
    object qryBeneficiosVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object qryBeneficiosIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
    end
    object qryBeneficiosIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryBeneficiosSEQPROPOSTA: TFloatField
      FieldName = 'SEQPROPOSTA'
    end
    object qryBeneficiosMESREFERENCIA: TStringField
      FieldName = 'MESREFERENCIA'
      FixedChar = True
      Size = 7
    end
    object qryBeneficiosDTEFETPGTO: TDateTimeField
      FieldName = 'DTEFETPGTO'
    end
    object qryBeneficiosIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
    end
    object qryBeneficiosIDBENEFICIO: TFloatField
      FieldName = 'IDBENEFICIO'
    end
    object qryBeneficiosFLGALIMRESERVA: TFloatField
      FieldName = 'FLGALIMRESERVA'
    end
    object qryBeneficiosIDSEQINTERNOFB: TFloatField
      FieldName = 'IDSEQINTERNOFB'
    end
    object qryBeneficiosMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 13
    end
  end
  object qryAux1: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '')
    ValidateWithMask = True
    Left = 112
    Top = 176
  end
  object qryAux2: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      '')
    ValidateWithMask = True
    Left = 112
    Top = 160
  end
  object MS_Assistido: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'ELP.MATRICULA'
      'PES.NOME'
      'PLP.NOME'
      'PPT.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Nome'
      'Plano'
      'Patrocinadora')
    SensivelACaixa.Strings = (
      'N'
      'S'
      'N'
      'S')
    Tabelas.Strings = (
      'ELEGPATRO    ELP'
      'PARtPREVPLAN PPP'
      'PESSOA       PES'
      'PESSOA       PPT'
      'PLANPREV     PLP'
      'SITPART      STP')
    CamposChave.Strings = (
      'PES.IDPESSOA'
      'PES.NOME'
      'ELP.MATRICULA')
    Filtro.Strings = (
      'ELP.IDPESSOA              = PES.IDPESSOA'
      'ELP.IDPESSOA              = PPP.IDPESSOA'
      'ELP.IDPESSJUR             = PPP.IDPESSJUR'
      'NVL(PPP.FLGDESATIVADO, 0) = 0'
      'PPP.IDPESSOA              = PES.IDPESSOA'
      'PPP.IDSITPART             = STP.IDSITPART'
      'STP.FLGINTERNO            = '#39'AS'#39
      'PPP.IDPLANOPREV           = PLP.IDPLANOPREV'
      'ELP.IDPESSJUR             = PPT.IDPESSOA'
      'PPP.IDPESSJUR             = PPT.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '13'
      '30'
      '25'
      '25')
    OperComparador.Strings = (
      '0'
      '0'
      '0'
      '0')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 520
  end
  object qryUpdateHstBenef: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   HSTBENEFBFCIARIO HBB'
      'SET'
      '   HBB.FLGALIMRESERVA = 1'
      'WHERE'
      '   HBB.IDSEQINTERNOFB =:PIDSEQINTERNOFB')
    ValidateWithMask = True
    Left = 40
    Top = 208
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDSEQINTERNOFB'
        ParamType = ptInput
      end>
  end
end
