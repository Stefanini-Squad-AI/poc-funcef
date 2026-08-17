inherited frmConsContrib: TfrmConsContrib
  Left = 54
  Top = 48
  Caption = 'Consulta de Contribuições do Participante'
  ClientHeight = 452
  ClientWidth = 657
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 657
    Height = 413
    object pnlOpcoes: TPanel
      Left = 5
      Top = 139
      Width = 647
      Height = 269
      Align = alClient
      BevelOuter = bvLowered
      TabOrder = 1
      object Label21: TLabel
        Left = 198
        Top = 10
        Width = 91
        Height = 13
        Alignment = taRightJustify
        Caption = 'Total Esperado:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label22: TLabel
        Left = 423
        Top = 10
        Width = 92
        Height = 13
        Alignment = taRightJustify
        Caption = 'Total Recebido:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object StaticText2: TStaticText
        Left = 18
        Top = 9
        Width = 99
        Height = 20
        Caption = 'Contribuições'
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentColor = False
        ParentFont = False
        TabOrder = 0
      end
      object dbgrdResultado: TwwDBGrid
        Left = 15
        Top = 32
        Width = 616
        Height = 233
        Selected.Strings = (
          'MESCOBRANCA'#9'17'#9'Mês de Cobrança'#9'No'
          'NOME'#9'60'#9'Dependente'#9'No'
          'CONTRIB'#9'25'#9'Contribuição'#9'No'
          'MES'#9'7'#9'Mês'#9'No'
          'VALORESPERADO'#9'15'#9'Valor Esperado'#9'No'
          'VALORRECEBIDO'#9'15'#9'Valor Recebido'#9'No'
          'DATAPREVISAO'#9'10'#9'Data de Previsão'#9'No'
          'DATA'#9'21'#9'Data do Recebimento'#9'No'
          'DESCRICAO'#9'25'#9'Motivo'#9'No'
          'DESCRICAO_1'#9'25'#9'Forma de Pagamento'#9'No'
          'NOMEREGRA'#9'25'#9'Nome da Regra'#9'No'
          'PAGADOR'#9'60'#9'Pagador'#9'No'
          'SITPLANOPREV'#9'50'#9'Sit. Plano Prev.'#9'No')
        TitleColor = clBtnFace
        FixedCols = 0
        ShowHorzScrollBar = True
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
      object edTotEsperado: TEdit
        Left = 291
        Top = 9
        Width = 110
        Height = 21
        BorderStyle = bsNone
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object edTotRecebido: TEdit
        Left = 520
        Top = 9
        Width = 110
        Height = 21
        BorderStyle = bsNone
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
    end
    object pnlInformacoes: TPanel
      Left = 5
      Top = 5
      Width = 647
      Height = 134
      Align = alTop
      BevelOuter = bvLowered
      TabOrder = 0
      object Label2: TLabel
        Left = 330
        Top = 2
        Width = 80
        Height = 13
        Caption = 'Patrocinadora'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label1: TLabel
        Left = 15
        Top = 2
        Width = 37
        Height = 13
        Caption = 'Titular'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label3: TLabel
        Left = 15
        Top = 77
        Width = 104
        Height = 13
        Caption = 'Plano Assistencial'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 330
        Top = 40
        Width = 118
        Height = 13
        Caption = 'Plano Previdenciário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label7: TLabel
        Left = 15
        Top = 39
        Width = 55
        Height = 13
        Caption = 'Matrícula'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label8: TLabel
        Left = 196
        Top = 39
        Width = 118
        Height = 13
        Caption = 'Número de Inscrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object edTitular: TEdit
        Left = 15
        Top = 15
        Width = 300
        Height = 21
        BorderStyle = bsNone
        Color = clBtnFace
        Enabled = False
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
        Left = 15
        Top = 52
        Width = 120
        Height = 21
        BorderStyle = bsNone
        Color = clBtnFace
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 1
      end
      object edNumInscr: TEdit
        Left = 196
        Top = 52
        Width = 120
        Height = 21
        BorderStyle = bsNone
        Color = clBtnFace
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 2
      end
      object edPlanoPrev: TEdit
        Left = 330
        Top = 53
        Width = 300
        Height = 21
        BorderStyle = bsNone
        Color = clBtnFace
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 3
      end
      object edPatrocinadora: TEdit
        Left = 330
        Top = 15
        Width = 300
        Height = 21
        BorderStyle = bsNone
        Color = clBtnFace
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 4
      end
      object grpMesRef: TGroupBox
        Left = 328
        Top = 83
        Width = 177
        Height = 46
        Caption = ' Mês de Referência '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        object cmbMes: TComboBox
          Left = 7
          Top = 15
          Width = 100
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ItemHeight = 13
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
          ParentFont = False
          TabOrder = 0
          Text = 'cmbMes'
          OnChange = cmbMesChange
        end
        object spnedAno: TSpinEdit
          Left = 114
          Top = 15
          Width = 50
          Height = 22
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          MaxValue = 0
          MinValue = 0
          ParentFont = False
          TabOrder = 1
          Value = 0
          OnChange = spnedAnoChange
        end
      end
      object edPlanAss: TEdit
        Left = 15
        Top = 90
        Width = 300
        Height = 21
        BorderStyle = bsNone
        Color = clBtnFace
        Enabled = False
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        ReadOnly = True
        TabOrder = 6
      end
      object bbtnProcurar: TBitBtn
        Left = 520
        Top = 91
        Width = 110
        Height = 35
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
        TabOrder = 7
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
  end
  inherited Dock971: TDock97
    Top = 413
    Width = 657
    inherited tb97Fundo: TToolbar97
      Left = 491
      DockPos = 491
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 595
    Top = 315
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryHstContrib: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      ' PG.NOME PAGADOR,'
      ' H.MES,H.MESCOBRANCA,H.VALORESPERADO,H.VALORRECEBIDO,H.DATA,'
      ' H.SITRECEBIMENTO SIT,H.DATAPREVISAO,'
      ' PL.NOME PLANASS,'
      ' PV.NOME PLANPREV,'
      ' P.NOME,'
      ' CTO.NOME CONTRIB,'
      ' MT.DESCRICAO,'
      ' PT.DESCRICAO,'
      ' R.NOMEREGRA,'
      ' SPV.DESCRICAO SITPLANOPREV'
      'FROM'
      ' HSTCONTRIBASS H,CONTASS CA,MOTIVO MT,PLANASS PL,'
      ' PLANPREV PV,PESSOA P,PESSOA PG,PORTADORFORMA PT,'
      ' CONTRIBUICAO CTO,REGRA R,'
      ' PARTPREVPLAN PP, SITPLANOPREV SPV'
      'WHERE'
      '          (H.IDTITULAR = :IDTITULAR)'
      ' AND (H.IDPLANOPREV = :IDPLANOPREV)'
      ' AND (H.IDPLANASS = :IDPLANASS)'
      ' AND (H.IDPESSJUR = :IDPESSJUR)'
      ' AND (H.MES = :MES)'
      ' AND (PT.CODPORTFORMA(+) = H.CODPORTFORMA)'
      ' AND (MT.IDMOTIVO =  H.IDMOTIVO)'
      ' AND (PL.IDPLANASS = H.IDPLANASS)'
      ' AND (PG.IDPESSOA =  H.IDPAGADOR)'
      ' AND (P.IDPESSOA =  H.IDDEPENDENTE)'
      ' AND (R.IDREGRA(+) = H.IDREGRA)'
      ' AND (PV.IDPLANOPREV = H.IDPLANOPREV)'
      ' AND (CTO.IDCONTRIBUICAO = H.IDCONTASS)'
      ' AND (CA.IDPLANASS = H.IDPLANASS)'
      ' AND (CA.IDPLANOPREV = H.IDPLANOPREV)'
      ' AND (CA.IDPESSJUR = H.IDPESSJUR)'
      ' AND (CA.IDTITULAR =  H.IDTITULAR)'
      ' AND (CA.IDDEPENDENTE = H.IDDEPENDENTE)'
      ' AND (CA.IDCONTASS =  H.IDCONTASS)'
      ' AND (CA.SEQPROPOSTA = H.SEQPROPOSTA)'
      ' AND (H.IDPESSJUR = PP.IDPESSJUR)'
      ' AND (H.IDPLANOPREV = PP.IDPLANOPREV)'
      ' AND (H.IDTITULAR = PP.IDPESSOA)'
      ' AND (PP.IDSITPLANOPREV = SPV.IDSITPLANOPREV)'
      'ORDER BY H.MESCOBRANCA,P.NOME')
    Params.Data = {
      01000500094944544954554C4152000304000000000000000B4944504C414E4F
      5052455600030400000000000000094944504C414E4153530003040000000000
      0000094944504553534A555200030400000000000000034D4553000102003000
      0000}
    PictureMasks.Strings = (
      
        'VALORESPERADO'#9'{{{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,' +
        '-]#[#][#]]],({{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]' +
        '#[#][#]]]),[-]{{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-' +
        ']#[#][#]]]}'#9'T'#9'T'
      
        'VALORRECEBIDO'#9'{{{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,' +
        '-]#[#][#]]],({{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-]' +
        '#[#][#]]]),[-]{{#[#][#]{{;.###*[;.###]},*#}[;,*#]},;,#*#}[E[[+,-' +
        ']#[#][#]]]}'#9'T'#9'T')
    ValidateWithMask = True
    Left = 149
    Top = 262
    object qryHstContribMESCOBRANCA: TStringField
      DisplayLabel = 'Mês de Cobrança'
      DisplayWidth = 17
      FieldName = 'MESCOBRANCA'
      Size = 7
    end
    object qryHstContribNOME: TStringField
      DisplayLabel = 'Dependente'
      DisplayWidth = 60
      FieldName = 'NOME'
      Size = 60
    end
    object qryHstContribCONTRIB: TStringField
      DisplayLabel = 'Contribuição'
      DisplayWidth = 25
      FieldName = 'CONTRIB'
      Size = 60
    end
    object qryHstContribMES: TStringField
      DisplayLabel = 'Mês'
      DisplayWidth = 7
      FieldName = 'MES'
      Size = 7
    end
    object qryHstContribVALORESPERADO: TFloatField
      DisplayLabel = 'Valor Esperado'
      DisplayWidth = 15
      FieldName = 'VALORESPERADO'
      Currency = True
    end
    object qryHstContribVALORRECEBIDO: TFloatField
      DisplayLabel = 'Valor Recebido'
      DisplayWidth = 15
      FieldName = 'VALORRECEBIDO'
      Currency = True
    end
    object qryHstContribDATAPREVISAO: TDateTimeField
      DisplayLabel = 'Data de Previsão'
      DisplayWidth = 10
      FieldName = 'DATAPREVISAO'
    end
    object qryHstContribDATA: TDateTimeField
      DisplayLabel = 'Data do Recebimento'
      DisplayWidth = 21
      FieldName = 'DATA'
    end
    object qryHstContribDESCRICAO: TStringField
      DisplayLabel = 'Motivo'
      DisplayWidth = 25
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object qryHstContribDESCRICAO_1: TStringField
      DisplayLabel = 'Forma de Pagamento'
      DisplayWidth = 25
      FieldName = 'DESCRICAO_1'
      Size = 50
    end
    object qryHstContribNOMEREGRA: TStringField
      DisplayLabel = 'Nome da Regra'
      DisplayWidth = 25
      FieldName = 'NOMEREGRA'
      Size = 60
    end
    object qryHstContribPAGADOR: TStringField
      DisplayLabel = 'Pagador'
      DisplayWidth = 60
      FieldName = 'PAGADOR'
      Size = 60
    end
    object qryHstContribSITPLANOPREV: TStringField
      DisplayLabel = 'Sit. Plano Prev.'
      DisplayWidth = 50
      FieldName = 'SITPLANOPREV'
      Size = 50
    end
    object qryHstContribSIT: TStringField
      FieldName = 'SIT'
      Visible = False
      Size = 1
    end
    object qryHstContribPLANASS: TStringField
      FieldName = 'PLANASS'
      Visible = False
      Size = 40
    end
    object qryHstContribPLANPREV: TStringField
      FieldName = 'PLANPREV'
      Visible = False
      Size = 50
    end
  end
  object ds: TwwDataSource
    AutoEdit = False
    DataSet = qryHstContrib
    Left = 71
    Top = 272
  end
  object montaSel: TMontaSelect
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PESSOA.NOME'
      'PLANASS.NOME'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PARTASS.INSCRICAONUMERO'
      'PESSJUR.NOME'
      'PLANPREV.NOME'
      'ELEGPATRO.MATRICULA')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'N'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Nome do Participante'
      'Plano Assistencial'
      'Inscrição Previdenciária'
      'Inscrição Assistencial'
      'Patrocinadora'
      'Plano Previdenciário'
      'Matricula')
    Tabelas.Strings = (
      'PESSOA'
      'PESSOA PESSJUR'
      'PLANASS'
      'PARTASS'
      'PLANPREV'
      'PARTPREVPLAN'
      'ELEGPATRO')
    CamposChave.Strings = (
      'PESSOA.NOME'
      'PLANASS.NOME'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'PESSJUR.NOME'
      'PLANPREV.NOME'
      'ELEGPATRO.MATRICULA'
      'PARTASS.IDPESSOA'
      'PARTASS.IDPLANASS'
      'PARTASS.IDPLANOPREV'
      'PARTASS.IDPESSJUR')
    Filtro.Strings = (
      'ELEGPATRO.IDPESSOA = PESSOA.IDPESSOA'
      'ELEGPATRO.IDPESSJUR = PESSJUR.IDPESSOA'
      'PARTASS.IDPESSOA = ELEGPATRO.IDPESSOA'
      'PARTASS.IDPESSJUR = ELEGPATRO.IDPESSJUR'
      'PARTASS.IDPLANASS = PLANASS.IDPLANASS'
      'PARTASS.IDPLANOPREV = PLANPREV.IDPLANOPREV'
      'PARTPREVPLAN.IDPESSOA = PARTASS.IDPESSOA'
      'PARTPREVPLAN.IDPESSJUR = PARTASS.IDPESSJUR'
      'PARTPREVPLAN.IDPLANOPREV = PARTASS.IDPLANOPREV')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '40'
      '40'
      '10'
      '10'
      '40'
      '40'
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    Left = 590
    Top = 37
  end
end
A
