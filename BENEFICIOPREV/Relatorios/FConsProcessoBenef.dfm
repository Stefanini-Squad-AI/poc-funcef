inherited frmConsProcessoBenef: TfrmConsProcessoBenef
  Left = 1
  Top = 72
  HelpContext = 160185
  Caption = 'Consulta Processos de Benefícios'
  ClientHeight = 441
  ClientWidth = 753
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 753
    Height = 402
    object GroupBox2: TGroupBox
      Left = 5
      Top = 5
      Width = 743
      Height = 231
      Caption = ' Dados da Pesquisa'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -19
      Font.Name = 'Bookman Old Style'
      Font.Style = [fsItalic]
      ParentFont = False
      TabOrder = 1
      object Label2: TLabel
        Left = 11
        Top = 23
        Width = 69
        Height = 13
        Caption = 'Participante'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 11
        Top = 61
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
      object Label1: TLabel
        Left = 365
        Top = 23
        Width = 118
        Height = 13
        Caption = 'Número de Inscrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 11
        Top = 101
        Width = 80
        Height = 13
        Caption = 'Patrocinadora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 11
        Top = 139
        Width = 118
        Height = 13
        Caption = 'Plano Previdenciário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 365
        Top = 61
        Width = 152
        Height = 13
        Caption = 'Situação na Patrocinadora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 365
        Top = 101
        Width = 105
        Height = 13
        Caption = 'Situação no Plano'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label14: TLabel
        Left = 365
        Top = 139
        Width = 129
        Height = 13
        Caption = 'Situação na Fundação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 11
        Top = 191
        Width = 144
        Height = 13
        Caption = 'Matrícula do Beneficiário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label9: TLabel
        Left = 176
        Top = 191
        Width = 122
        Height = 13
        Caption = 'Nome do Beneficiário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Bevel1: TBevel
        Left = 11
        Top = 183
        Width = 616
        Height = 4
      end
      object edNome: TEdit
        Left = 11
        Top = 37
        Width = 338
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
      object edMatricula: TEdit
        Left = 11
        Top = 74
        Width = 160
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
      object edInscNumero: TEdit
        Left = 365
        Top = 37
        Width = 191
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object edPlano: TEdit
        Left = 11
        Top = 153
        Width = 338
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
      object edPatro: TEdit
        Left = 11
        Top = 114
        Width = 338
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
      end
      object edSitPatro: TEdit
        Left = 365
        Top = 74
        Width = 262
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 5
      end
      object edSitPlano: TEdit
        Left = 365
        Top = 114
        Width = 262
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
      end
      object edSitFundacao: TEdit
        Left = 365
        Top = 153
        Width = 262
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 7
      end
      object Panel3: TPanel
        Left = 636
        Top = 37
        Width = 100
        Height = 172
        Caption = 'Panel3'
        TabOrder = 8
        object bbtnProcurar: TBitBtn
          Left = 6
          Top = 67
          Width = 88
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
      end
      object EdMatricBeneficiario: TEdit
        Left = 11
        Top = 205
        Width = 158
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 9
      end
      object EdNomeBeneficiario: TEdit
        Left = 176
        Top = 205
        Width = 452
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 10
      end
    end
    object GroupBox1: TGroupBox
      Left = 1
      Top = 240
      Width = 751
      Height = 161
      Align = alBottom
      Caption = 'Processos'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -19
      Font.Name = 'Bookman Old Style'
      Font.Style = [fsItalic]
      ParentFont = False
      TabOrder = 0
      object dbgProcessos: TwwDBGrid
        Left = 2
        Top = 25
        Width = 747
        Height = 134
        Selected.Strings = (
          'BENEFICIO'#9'40'#9'Benefício'#9'F'
          'BENEFICIARIO'#9'29'#9'Beneficiário'#9'F'
          'SITBENEFICIO'#9'22'#9'Situação do Benefício'#9'F'
          'EVENTOGERADOR'#9'20'#9'Evento Gerador'#9'F'
          'DTEVENTO'#9'10'#9'Data do~Evento'#9'F'
          'DTREGISTRO'#9'10'#9'Data do~Registro'#9'F'
          'DATAINICIO'#9'14'#9'Data de Início~do Benefício'#9'F'
          'DATAFINAL'#9'13'#9'Data Final~do Benefício'#9'F'
          'VALORATUAL'#9'10'#9'Valor ~Atual(R$)'#9'F'
          'VALORCALCULADO'#9'13'#9'Valor~Calculado(R$)'#9'F'
          'VALORCOTAS'#9'10'#9'Valor em ~Cotas'#9'F'
          'NUMEROPROCESSO'#9'12'#9'N° Processo'#9'F')
        IniAttributes.Delimiter = ';;'
        TitleColor = clBtnFace
        FixedCols = 1
        ShowHorzScrollBar = True
        Align = alClient
        DataSource = dsProcessoBenef
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
        ParentFont = False
        TabOrder = 0
        TitleAlignment = taLeftJustify
        TitleFont.Charset = DEFAULT_CHARSET
        TitleFont.Color = clWindowText
        TitleFont.Height = -11
        TitleFont.Name = 'MS Sans Serif'
        TitleFont.Style = [fsBold]
        TitleLines = 2
        TitleButtons = False
        IndicatorColor = icBlack
      end
    end
  end
  inherited Dock971: TDock97
    Top = 402
    Width = 753
    inherited tb97Fundo: TToolbar97
      Left = 581
      DockPos = 600
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 412
      DockPos = 431
      Visible = False
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 713
    Top = 270
  end
  object dsProcessoBenef: TwwDataSource
    DataSet = qryProcessoBenef
    Left = 124
    Top = 370
  end
  object qryProcessoBenef: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT PB.NUMEROPROCESSO, EG.NOME AS EVENTOGERADOR, PB.DTEVENTO,' +
        ' PB.DTREGISTRO,'
      
        '       P.NOME AS PARTICIPANTE, PL.NOME AS PLANO, P2.NOME AS PATR' +
        'O, B.NOME AS BENEFICIO,'
      
        '       P3.NOME AS BENEFICIARIO, SB.DESCRICAO AS SITBENEFICIO, BF' +
        '.DATAINICIO, BF.DATAFINAL,'
      '       BF.VALORCALCULADO,BF.VALORATUAL, BF.VALORCOTAS'
      
        'FROM PROCESSOBENEF PB, BENEFBFCIARIO BF, PESSOA P, PLANPREV PL, ' +
        'PESSOA P2, PESSOA P3,'
      '     EVENTOGERADOR EG, BENEFICIO B, SITBENEFICIO SB'
      'WHERE PB.NUMEROPROCESSO = BF.NUMEROPROCESSO AND'
      '      PB.IDEVENTOGERADOR = EG.IDEVENTOGERADOR AND'
      '      BF.IDTITULAR   = P.IDPESSOA AND'
      '      BF.IDPLANOPREV = PL.IDPLANOPREV AND'
      '      BF.IDPESSJUR   = P2.IDPESSOA AND'
      '      BF.IDPESSOA    = P3.IDPESSOA AND'
      '      BF.IDBENEFICIO = B.IDBENEFICIO AND'
      '      BF.IDSITBENEFICIO = SB.IDSITBENEFICIO AND'
      '      BF.IDTITULAR       =:pIdTitular AND'
      '      BF.IDPLANOPREV =:pIdPlanoPrev AND'
      '      BF.IDPESSJUR      =:pIdPessJur AND'
      '      BF.SEQPROPOSTA =:pSeqProposta'
      'ORDER BY PB.DTEVENTO DESC, B.NOME, BF.NUMEROPROCESSO, P3.NOME')
    ValidateWithMask = True
    Left = 214
    Top = 370
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIdTitular'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIdPlanoPrev'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIdPessJur'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pSeqProposta'
        ParamType = ptUnknown
      end>
    object qryProcessoBenefBENEFICIO: TStringField
      DisplayLabel = 'Benefício'
      DisplayWidth = 40
      FieldName = 'BENEFICIO'
      Origin = 'BENEFICIO.NOME'
      Size = 60
    end
    object qryProcessoBenefBENEFICIARIO: TStringField
      DisplayLabel = 'Beneficiário'
      DisplayWidth = 29
      FieldName = 'BENEFICIARIO'
      Origin = 'PESSOA.NOME'
      Size = 60
    end
    object qryProcessoBenefSITBENEFICIO: TStringField
      DisplayLabel = 'Situação do Benefício'
      DisplayWidth = 22
      FieldName = 'SITBENEFICIO'
      Origin = 'SITBENEFICIO.DESCRICAO'
      Size = 40
    end
    object qryProcessoBenefEVENTOGERADOR: TStringField
      DisplayLabel = 'Evento Gerador'
      DisplayWidth = 20
      FieldName = 'EVENTOGERADOR'
      Origin = 'EVENTOGERADOR.NOME'
      Size = 60
    end
    object qryProcessoBenefDTEVENTO: TDateTimeField
      DisplayLabel = 'Data do~Evento'
      DisplayWidth = 10
      FieldName = 'DTEVENTO'
      Origin = 'PROCESSOBENEF.DTEVENTO'
    end
    object qryProcessoBenefDTREGISTRO: TDateTimeField
      DisplayLabel = 'Data do~Registro'
      DisplayWidth = 10
      FieldName = 'DTREGISTRO'
      Origin = 'PROCESSOBENEF.DTREGISTRO'
    end
    object qryProcessoBenefDATAINICIO: TDateTimeField
      DisplayLabel = 'Data de Início~do Benefício'
      DisplayWidth = 14
      FieldName = 'DATAINICIO'
      Origin = 'BENEFBFCIARIO.DATAINICIO'
    end
    object qryProcessoBenefDATAFINAL: TDateTimeField
      DisplayLabel = 'Data Final~do Benefício'
      DisplayWidth = 13
      FieldName = 'DATAFINAL'
      Origin = 'BENEFBFCIARIO.DATAFINAL'
    end
    object qryProcessoBenefVALORATUAL: TFloatField
      DisplayLabel = 'Valor ~Atual(R$)'
      DisplayWidth = 10
      FieldName = 'VALORATUAL'
      Origin = 'BENEFBFCIARIO.VALORATUAL'
    end
    object qryProcessoBenefVALORCALCULADO: TFloatField
      DisplayLabel = 'Valor~Calculado(R$)'
      DisplayWidth = 13
      FieldName = 'VALORCALCULADO'
      Origin = 'BENEFBFCIARIO.VALORCALCULADO'
      DisplayFormat = '#,##0.00'
    end
    object qryProcessoBenefVALORCOTAS: TFloatField
      DisplayLabel = 'Valor em ~Cotas'
      DisplayWidth = 10
      FieldName = 'VALORCOTAS'
      Origin = 'BENEFBFCIARIO.VALORCOTAS'
    end
    object qryProcessoBenefNUMEROPROCESSO: TFloatField
      DisplayLabel = 'N° Processo'
      DisplayWidth = 12
      FieldName = 'NUMEROPROCESSO'
      Origin = 'PROCESSOBENEF.NUMEROPROCESSO'
    end
    object qryProcessoBenefPARTICIPANTE: TStringField
      FieldName = 'PARTICIPANTE'
      Origin = 'PESSOA.NOME'
      Visible = False
      Size = 60
    end
    object qryProcessoBenefPLANO: TStringField
      FieldName = 'PLANO'
      Origin = 'PLANPREV.NOME'
      Visible = False
      Size = 50
    end
    object qryProcessoBenefPATRO: TStringField
      FieldName = 'PATRO'
      Origin = 'PESSOA.NOME'
      Visible = False
      Size = 60
    end
  end
  object MontaSelectPart: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'ELEGPATRO.MATRICULA'
      'PESSOA.NOME'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PLANPREV.NOME'
      'PATRO.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Participante'
      'N° de Inscrição'
      'Plano Previdenciário'
      'Patrocinadora')
    SensivelACaixa.Strings = (
      'S'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'ELEGPATRO'
      'PARTPREVPLAN'
      'PESSOA PATRO'
      'PLANPREV'
      'SITFUNC'
      'SITPART'
      'SITPLANOPREV'
      'PESSOAFISICA')
    CamposChave.Strings = (
      'ELEGPATRO.IDPESSOA'
      'ELEGPATRO.IDPESSJUR'
      'PLANPREV.IDPLANOPREV'
      'PESSOA.NOME'
      'ELEGPATRO.MATRICULA'
      'PATRO.NOME AS PATRO'
      'PLANPREV.NOME AS PLANO'
      'SITFUNC.DESCRICAO'
      'SITPART.DESCRICAO'
      'SITPLANOPREV.DESCRICAO'
      'PESSOA.NUMDOCUMENTO'
      'PESSOAFISICA.DATANASC'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PARTPREVPLAN.INSCRICAODATA'
      'ELEGPATRO.DATAINICIOAFAST'
      'ELEGPATRO.DATAFIMAFAST'
      'SITFUNC.IDSITFUNC'
      'SITPART.IDSITPART'
      'SITPLANOPREV.IDSITPLANOPREV'
      'PARTPREVPLAN.SEQPROPOSTA')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = ELEGPATRO.IDPESSOA'
      'ELEGPATRO.IDPESSOA = PARTPREVPLAN.IDPESSOA'
      'ELEGPATRO.IDPESSJUR = PARTPREVPLAN.IDPESSJUR'
      'PARTPREVPLAN.IDPLANOPREV = PLANPREV.IDPLANOPREV'
      'PATRO.IDPESSOA = ELEGPATRO.IDPESSJUR'
      'ELEGPATRO.IDSITFUNC = SITFUNC.IDSITFUNC(+)'
      'PARTPREVPLAN.IDSITPART = SITPART.IDSITPART'
      'PARTPREVPLAN.IDSITPLANOPREV = SITPLANOPREV.IDSITPLANOPREV'
      'PESSOA.IDPESSOA = PESSOAFISICA.IDPESSOA'
      'PARTPREVPLAN.FLGDESATIVADO = 0')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '10'
      '10'
      '10'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 201
    Top = 282
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona participante .... '
    Colunas.Strings = (
      'EL.MATRICULA'
      'DP.MATRICULA'
      'NVL(PD.NOME,P.NOME)'
      'DECODE(P.IDPESSOA, PD.IDPESSOA, PP.INSCRICAONUMERO, NULL) '
      'PAT.NOME'
      'PL.NOME'
      'BENEFBFCIARIO.NUMEROPROCESSO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'N'
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Matrícula Titular'
      'Matrícula Depen./Benef.'
      'Nome'
      'Inscrição Nº'
      'Patrocinadora'
      'Plano Previdenciário'
      'Número do processo')
    SensivelACaixa.Strings = (
      'S'
      'S'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA P'
      'PESSOA PD'
      'PESSOA PAT'
      'ELEGPATRO EL'
      'DEPENTIT DP'
      'PARTPREVPLAN PP'
      'PLANPREV PL'
      'SITFUNC'
      'SITPART'
      'SITPLANOPREV'
      'BENEFBFCIARIO')
    CamposChave.Strings = (
      'EL.IDPESSJUR'
      'NVL(PD.IDPESSOA,P.IDPESSOA)'
      'PP.IDPLANOPREV'
      'SITFUNC.DESCRICAO'
      'SITPART.DESCRICAO'
      'SITPLANOPREV.DESCRICAO'
      'PP.INSCRICAONUMERO'
      'PL.NOME'
      'PAT.NOME'
      'P.NOME'
      'EL.MATRICULA'
      'PP.SEQPROPOSTA'
      'DP.IDTITULAR'
      'DP.MATRICULA'
      'NVL(PD.NOME,P.NOME)')
    Filtro.Strings = (
      'PAT.IDPESSOA      = EL.IDPESSJUR'
      'P.IDPESSOA        = EL.IDPESSOA'
      'PP.IDPESSJUR(+)   = EL.IDPESSJUR'
      'PP.IDPESSOA(+)    = EL.IDPESSOA'
      'PL.IDPLANOPREV(+) = PP.IDPLANOPREV'
      'DP.IDTITULAR(+)   = EL.IDPESSOA'
      'PD.IDPESSOA(+)    = DP.IDPESSOA     '
      'EL.IDSITFUNC = SITFUNC.IDSITFUNC'
      'PP.IDSITPART = SITPART.IDSITPART'
      'PP.IDSITPLANOPREV = SITPLANOPREV.IDSITPLANOPREV'
      'PP.IDPESSOA      = BENEFBFCIARIO.IDTITULAR'
      'PP.IDPESSJUR      = BENEFBFCIARIO.IDPESSJUR'
      'PP.IDPLANOPREV      = BENEFBFCIARIO.IDPLANOPREV'
      'PP.SEQPROPOSTA      = BENEFBFCIARIO.SEQPROPOSTA')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '15'
      '15'
      '60'
      '15'
      '60'
      '60'
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = True
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 108
    Top = 276
  end
end
