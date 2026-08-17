inherited frmConsMemoriaCalculo: TfrmConsMemoriaCalculo
  Left = 288
  Top = 55
  HelpContext = 160186
  Caption = 'Consulta a Memória de Cálculo'
  ClientHeight = 570
  ClientWidth = 548
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 548
    Height = 531
    object lblValores: TLabel
      Left = 13
      Top = 5
      Width = 387
      Height = 24
      AutoSize = False
      Caption = 'Dados do Participante / Beneficiário'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindow
      Font.Height = -19
      Font.Name = 'Bookman Old Style'
      Font.Style = [fsItalic]
      ParentFont = False
    end
    object Panel2: TPanel
      Left = 14
      Top = 29
      Width = 410
      Height = 132
      Enabled = False
      TabOrder = 0
      object Label2: TLabel
        Left = 7
        Top = 12
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
      object Label4: TLabel
        Left = 7
        Top = 37
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
        Left = 7
        Top = 61
        Width = 33
        Height = 13
        Caption = 'Plano'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 7
        Top = 86
        Width = 71
        Height = 13
        Caption = 'N° Inscrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 191
        Top = 86
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
      object Label5: TLabel
        Left = 7
        Top = 110
        Width = 68
        Height = 13
        Caption = 'Beneficiário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edNome: TEdit
        Left = 93
        Top = 8
        Width = 313
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
      object edPatro: TEdit
        Left = 93
        Top = 33
        Width = 313
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
      object edPlano: TEdit
        Left = 93
        Top = 57
        Width = 313
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
      object edInscNumero: TEdit
        Left = 93
        Top = 82
        Width = 96
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
      object edMatricula: TEdit
        Left = 256
        Top = 82
        Width = 150
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
      object edBeneficiario: TEdit
        Left = 93
        Top = 106
        Width = 313
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
    end
    object Panel3: TPanel
      Left = 432
      Top = 29
      Width = 103
      Height = 132
      TabOrder = 1
      object bbtnProcurar: TBitBtn
        Left = 7
        Top = 54
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
    object Panel1: TPanel
      Left = 14
      Top = 163
      Width = 521
      Height = 48
      TabOrder = 2
      object Label6: TLabel
        Left = 6
        Top = 6
        Width = 187
        Height = 13
        Caption = 'Selecione o Cálculo Desejado ...'
      end
      object dblkpcmbCalculo: TwwDBLookupCombo
        Left = 6
        Top = 22
        Width = 79
        Height = 21
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'IDCALCULO'#9'10'#9'Código'#9'F'
          'DATACALCULO'#9'15'#9'Data do Cálculo'#9'F'
          'USUARIO'#9'20'#9'Cálculo Feito por ...'#9'F'
          'NOMEREGRA'#9'60'#9'NOMEREGRA'#9'F')
        LookupTable = qryCalculo
        LookupField = 'IDCALCULO'
        Options = [loTitles]
        ParentFont = False
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnCloseUp = dblkpcmbCalculoCloseUp
      end
      object wwDBEdit1: TwwDBEdit
        Left = 87
        Top = 22
        Width = 79
        Height = 21
        Color = clSilver
        DataField = 'DATACALCULO'
        DataSource = dsCalculo
        ReadOnly = True
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBEdit2: TwwDBEdit
        Left = 168
        Top = 22
        Width = 149
        Height = 21
        Color = clSilver
        DataField = 'USUARIO'
        DataSource = dsCalculo
        ReadOnly = True
        TabOrder = 2
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object wwDBEdit3: TwwDBEdit
        Left = 320
        Top = 22
        Width = 194
        Height = 21
        Color = clSilver
        DataField = 'NOMEREGRA'
        DataSource = dsCalculo
        ReadOnly = True
        TabOrder = 3
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    object dbgrdDetCalculo: TwwDBGrid
      Left = 14
      Top = 214
      Width = 521
      Height = 309
      Selected.Strings = (
        'DESCRICAO'#9'50'#9'DESCRICAO'
        'VALOR'#9'20'#9'VALOR')
      IniAttributes.Delimiter = ';;'
      TitleColor = clBtnFace
      FixedCols = 0
      ShowHorzScrollBar = True
      DataSource = dsDetCalculo
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Options = [dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
      ParentFont = False
      TabOrder = 3
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
  end
  inherited Dock971: TDock97
    Top = 531
    Width = 548
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        Visible = False
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 18
    Top = 454
  end
  object MontaSelect: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Pessoa'
    Colunas.Strings = (
      'ELEGPATRO.MATRICULA'
      'PESSOA.NOME'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PLANPREV.NOME'
      'PATRO.NOME'
      'DEP.NOME')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Participante'
      'N° de Inscrição'
      'Plano Previdenciário'
      'Patrocinadora'
      'Beneficiário')
    SensivelACaixa.Strings = (
      'S'
      'N'
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
      'PESSOAFISICA'
      'PESSOA DEP'
      'BENEFBFCIARIO')
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
      'BENEFBFCIARIO.IDPESSOA'
      'DEP.NOME')
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
      'BENEFBFCIARIO.IDPESSJUR(+)=PARTPREVPLAN.IDPESSJUR'
      'BENEFBFCIARIO.IDPLANOPREV(+)=PARTPREVPLAN.IDPLANOPREV'
      'BENEFBFCIARIO.IDTITULAR(+)=PARTPREVPLAN.IDPESSOA'
      'BENEFBFCIARIO.SEQPROPOSTA(+)=PARTPREVPLAN.SEQPROPOSTA'
      'DEP.IDPESSOA(+)=BENEFBFCIARIO.IDPESSOA')
    Mascaras.Strings = (
      ''
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
      '60'
      '60')
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = True
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 71
    Top = 452
  end
  object qryCalculo: TwwQuery
    AfterScroll = qryCalculoAfterScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT D.IDCALCULO,'
      '      NVL(R.NOMEREGRA,'#39'Carga de Dados'#39') AS NOMEREGRA,'
      '      TO_CHAR(D.TRGDTINCLUSAO,'#39'DD/MM/YYYY'#39') AS DATACALCULO,'
      '      D.TRGUSERINCLUSAO AS USUARIO'
      'FROM   DETCALCULO D, REGRA R'
      'WHERE  D.IDPESSOA   = :IDPESSOA'
      'AND    R.IDREGRA(+)   = D.IDREGRA'
      
        'AND D.DESCRICAO NOT IN ( '#39'0'#39', '#39'0000,0'#39', '#39'1'#39', '#39'100'#39', '#39'2'#39', '#39'3'#39', '#39'4' +
        #39', '#39'513'#39', '#39'AMORT_FH'#39', '#39'ANO / MES:'#39', '#39'ANTECIP_RESERVA'#39', '#39'BRUTO'#39', ' +
        #39'BRUTO1'#39', '#39'C'#39','
      
        '                                            '#39'CAR200104'#39', '#39'CAR200' +
        '105'#39', '#39'CAR200106'#39', '#39'CAR200107'#39', '#39'CAR200108'#39', '#39'CAR200109'#39', '#39'CAR20' +
        '0110'#39', '#39'CAR200111'#39','
      
        '                                            '#39'CAR200112'#39', '#39'CAR200' +
        '201'#39', '#39'CAR200202'#39', '#39'CAR200203'#39', '#39'CAR200204'#39', '#39'CAR200205'#39', '#39'CAR20' +
        '0206'#39', '#39'CAR200207'#39','
      
        '                                            '#39'CAR200208'#39', '#39'CAR200' +
        '209'#39', '#39'CAR200210'#39', '#39'CAR200211'#39', '#39'CAR200212'#39', '#39'CAR200301'#39', '#39'CAR20' +
        '0302'#39', '#39'CAR200303'#39','
      
        '                                            '#39'CAR200304'#39', '#39'CAR200' +
        '305'#39', '#39'CAR200306'#39', '#39'CAR200307'#39', '#39'CAR200308'#39', '#39'CAR200309'#39', '#39'CAR20' +
        '0310'#39', '#39'CORRMONET'#39','
      
        '                                            '#39'DEBITO'#39', '#39'FUN200105' +
        #39', '#39'FUN200106'#39', '#39'FUN200107'#39', '#39'FUN200108'#39', '#39'FUN200109'#39', '#39'FUN20011' +
        '0'#39', '#39'FUN200111'#39', '#39'FUN200112'#39','
      
        '                                            '#39'FUN200201'#39', '#39'FUN200' +
        '202'#39', '#39'FUN200203'#39', '#39'FUN200204'#39', '#39'FUN200205'#39', '#39'FUN200206'#39', '#39'FUN20' +
        '0207'#39', '#39'FUN200208'#39', '#39'FUN200209'#39','
      
        '                                            '#39'FUN200210'#39', '#39'FUN200' +
        '211'#39', '#39'FUN200212'#39', '#39'FUN200301'#39', '#39'FUN200302'#39', '#39'FUN200303'#39', '#39'FUN20' +
        '0304'#39', '#39'FUN200305'#39', '#39'FUN200306'#39','
      
        '                                            '#39'FUN200307'#39', '#39'FUN200' +
        '308'#39', '#39'FUN200309'#39', '#39'FUN200310'#39', '#39'J'#39', '#39'JUROSMORA'#39', '#39'JUROSREMU'#39', '#39 +
        'JUROS_FH'#39', '#39'M'#39', '#39'MULTAMORA'#39','
      
        '                                            '#39'Número de dependent' +
        'es válidos:'#39', '#39'PARC_FGQC'#39', '#39'PRESTACAO'#39', '#39'PRESTFUT'#39', '#39'Percentual ' +
        'de Retenção de Resgate'#39', '
      
        '                                            '#39'RESERVA DO PARTICIP' +
        'ANTE'#39', '#39'RMI98'#39', '#39'RMI99'#39', '#39'RMIDIB'#39', '#39'SD_DEV'#39', '#39'SEGURO'#39', '#39'TESTE PB' +
        'A!!!'#39', '#39'VALOR DO CCE'#39','
      
        '                                            '#39'Valor Total da Pens' +
        '?o'#39', '#39'Valor do SB real'#39', '#39'Percentual do Grupo Familiar:'#39', '#39'Valor' +
        ' Total da Pensão'#39')'
      
        'ORDER BY TO_CHAR(D.TRGDTINCLUSAO,'#39'DD/MM/YYYY'#39') DESC, D.IDCALCULO' +
        ' DESC'
      '')
    ValidateWithMask = True
    Left = 301
    Top = 295
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  object dsCalculo: TwwDataSource
    AutoEdit = False
    DataSet = qryCalculo
    Left = 302
    Top = 339
  end
  object dsDetCalculo: TwwDataSource
    AutoEdit = False
    DataSet = qryDetCalculo
    Left = 414
    Top = 336
  end
  object qryDetCalculo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDDETCALCULO, DESCRICAO,VALOR'
      'FROM   DETCALCULO'
      'WHERE  IDCALCULO = :IDCALCULO'
      'AND    IDPESSOA  = :IDPESSOA'
      
        'AND DESCRICAO NOT IN ( '#39'0'#39', '#39'0000,0'#39', '#39'1'#39', '#39'100'#39', '#39'2'#39', '#39'3'#39', '#39'4'#39',' +
        ' '#39'513'#39', '#39'AMORT_FH'#39', '#39'ANO / MES:'#39', '#39'ANTECIP_RESERVA'#39', '#39'BRUTO'#39', '#39'B' +
        'RUTO1'#39', '#39'C'#39','
      
        '                                            '#39'CAR200104'#39', '#39'CAR200' +
        '105'#39', '#39'CAR200106'#39', '#39'CAR200107'#39', '#39'CAR200108'#39', '#39'CAR200109'#39', '#39'CAR20' +
        '0110'#39', '#39'CAR200111'#39','
      
        '                                            '#39'CAR200112'#39', '#39'CAR200' +
        '201'#39', '#39'CAR200202'#39', '#39'CAR200203'#39', '#39'CAR200204'#39', '#39'CAR200205'#39', '#39'CAR20' +
        '0206'#39', '#39'CAR200207'#39','
      
        '                                            '#39'CAR200208'#39', '#39'CAR200' +
        '209'#39', '#39'CAR200210'#39', '#39'CAR200211'#39', '#39'CAR200212'#39', '#39'CAR200301'#39', '#39'CAR20' +
        '0302'#39', '#39'CAR200303'#39','
      
        '                                            '#39'CAR200304'#39', '#39'CAR200' +
        '305'#39', '#39'CAR200306'#39', '#39'CAR200307'#39', '#39'CAR200308'#39', '#39'CAR200309'#39', '#39'CAR20' +
        '0310'#39', '#39'CORRMONET'#39','
      
        '                                            '#39'DEBITO'#39', '#39'FUN200105' +
        #39', '#39'FUN200106'#39', '#39'FUN200107'#39', '#39'FUN200108'#39', '#39'FUN200109'#39', '#39'FUN20011' +
        '0'#39', '#39'FUN200111'#39', '#39'FUN200112'#39','
      
        '                                            '#39'FUN200201'#39', '#39'FUN200' +
        '202'#39', '#39'FUN200203'#39', '#39'FUN200204'#39', '#39'FUN200205'#39', '#39'FUN200206'#39', '#39'FUN20' +
        '0207'#39', '#39'FUN200208'#39', '#39'FUN200209'#39','
      
        '                                            '#39'FUN200210'#39', '#39'FUN200' +
        '211'#39', '#39'FUN200212'#39', '#39'FUN200301'#39', '#39'FUN200302'#39', '#39'FUN200303'#39', '#39'FUN20' +
        '0304'#39', '#39'FUN200305'#39', '#39'FUN200306'#39','
      
        '                                            '#39'FUN200307'#39', '#39'FUN200' +
        '308'#39', '#39'FUN200309'#39', '#39'FUN200310'#39', '#39'J'#39', '#39'JUROSMORA'#39', '#39'JUROSREMU'#39', '#39 +
        'JUROS_FH'#39', '#39'M'#39', '#39'MULTAMORA'#39','
      
        '                                            '#39'Número de dependent' +
        'es válidos:'#39', '#39'PARC_FGQC'#39', '#39'PRESTACAO'#39', '#39'PRESTFUT'#39', '#39'Percentual ' +
        'de Retenção de Resgate'#39', '
      
        '                                            '#39'RESERVA DO PARTICIP' +
        'ANTE'#39', '#39'RMI98'#39', '#39'RMI99'#39', '#39'RMIDIB'#39', '#39'SD_DEV'#39', '#39'SEGURO'#39', '#39'TESTE PB' +
        'A!!!'#39', '#39'VALOR DO CCE'#39','
      
        '                                            '#39'Valor Total da Pens' +
        '?o'#39', '#39'Valor do SB real'#39', '#39'Percentual do Grupo Familiar:'#39', '#39'Valor' +
        ' Total da Pensão'#39' )'
      'ORDER BY IDDETCALCULO'
      ' ')
    ValidateWithMask = True
    Left = 414
    Top = 287
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCALCULO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
end
