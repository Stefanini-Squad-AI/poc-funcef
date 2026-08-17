inherited FrmFRelProvPerdas: TFrmFRelProvPerdas
  Left = 454
  Top = 59
  Caption = 'Relatório de Provisão para Perdas'
  ClientHeight = 566
  ClientWidth = 498
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 498
    Height = 527
    object Panel1: TPanel
      Left = 0
      Top = 0
      Width = 499
      Height = 57
      Anchors = [akLeft, akTop, akRight]
      TabOrder = 0
      object grpConsultaPor: TGroupBox
        Left = 8
        Top = 8
        Width = 488
        Height = 41
        Anchors = [akLeft, akTop, akRight, akBottom]
        Caption = 'Consulta Por'
        TabOrder = 0
        object rbMatricula: TRadioButton
          Left = 16
          Top = 15
          Width = 113
          Height = 17
          Caption = 'Matrícula'
          Checked = True
          TabOrder = 0
          TabStop = True
          OnClick = rbMatriculaClick
        end
        object rbOutrasCondi: TRadioButton
          Left = 242
          Top = 15
          Width = 129
          Height = 17
          Caption = 'Outras Condições'
          TabOrder = 1
          OnClick = rbOutrasCondiClick
        end
      end
    end
    object pgctrlConsultaPor: TPageControl
      Left = 1
      Top = 57
      Width = 497
      Height = 377
      ActivePage = tbsOutrasCondi
      Anchors = [akTop, akBottom]
      TabOrder = 1
      object tbsMatricula: TTabSheet
        TabVisible = False
        object Label3: TLabel
          Left = 24
          Top = 72
          Width = 69
          Height = 13
          Caption = 'Participante'
        end
        object Label4: TLabel
          Left = 24
          Top = 113
          Width = 55
          Height = 13
          Caption = 'Matrícula'
        end
        object Label5: TLabel
          Left = 24
          Top = 158
          Width = 71
          Height = 13
          Caption = 'Inscrição Nº'
        end
        object Label7: TLabel
          Left = 165
          Top = 158
          Width = 33
          Height = 13
          Caption = 'Plano'
        end
        object Label6: TLabel
          Left = 165
          Top = 113
          Width = 80
          Height = 13
          Caption = 'Patrocinadora'
        end
        object GroupBox1: TGroupBox
          Left = 24
          Top = 9
          Width = 412
          Height = 58
          TabOrder = 0
          object Label2: TLabel
            Left = 12
            Top = 24
            Width = 145
            Height = 13
            Caption = 'Escolha o Participante ...'
          end
          object bbtnProcurar: TBitBtn
            Left = 312
            Top = 16
            Width = 88
            Height = 33
            Hint = 'Procurar Processo de Benefício'
            Caption = '&Procurar'
            Default = True
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
        object edParticipante: TEdit
          Left = 24
          Top = 89
          Width = 424
          Height = 21
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 1
        end
        object edMatricula: TEdit
          Left = 24
          Top = 131
          Width = 121
          Height = 21
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 2
        end
        object edNumInsc: TEdit
          Left = 24
          Top = 170
          Width = 121
          Height = 21
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 4
        end
        object edPlano: TEdit
          Left = 165
          Top = 170
          Width = 283
          Height = 21
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 5
        end
        object edPatrocinadora: TEdit
          Left = 165
          Top = 131
          Width = 283
          Height = 21
          Color = clSilver
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          TabOrder = 3
        end
      end
      object tbsOutrasCondi: TTabSheet
        Caption = 'tbsOutrasCondi'
        ImageIndex = 1
        TabVisible = False
        object grpPatro: TGroupBox
          Left = 8
          Top = 8
          Width = 473
          Height = 41
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 0
          object lblPatro: TLabel
            Left = 6
            Top = 15
            Width = 80
            Height = 13
            Caption = 'Patrocinadora'
          end
          object cmbPatro: TwwDBLookupCombo
            Left = 160
            Top = 13
            Width = 299
            Height = 21
            DropDownAlignment = taLeftJustify
            LookupTable = qryPatro
            LookupField = 'NOME'
            Style = csDropDownList
            TabOrder = 0
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
          end
        end
        object gprPlanContabil: TGroupBox
          Left = 8
          Top = 51
          Width = 473
          Height = 41
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 1
          object lblPlanContabil: TLabel
            Left = 6
            Top = 15
            Width = 83
            Height = 13
            Caption = 'Plano Contábil'
          end
          object cmbPlanContabil: TwwDBLookupCombo
            Left = 160
            Top = 13
            Width = 299
            Height = 21
            DropDownAlignment = taLeftJustify
            LookupTable = qryPlanoContabil
            LookupField = 'NOME'
            Style = csDropDownList
            TabOrder = 0
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
          end
        end
        object gprPlanPrev: TGroupBox
          Left = 8
          Top = 95
          Width = 473
          Height = 41
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 2
          object lblPlanPrev: TLabel
            Left = 6
            Top = 15
            Width = 118
            Height = 13
            Caption = 'Plano Previdenciário'
          end
          object cmbPlanPrev: TwwDBLookupCombo
            Left = 160
            Top = 13
            Width = 299
            Height = 21
            DropDownAlignment = taLeftJustify
            LookupTable = qryPlano
            LookupField = 'NOME'
            Style = csDropDownList
            TabOrder = 0
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
            OnChange = cmbPlanPrevChange
          end
        end
        object gprSitFunc: TGroupBox
          Left = 8
          Top = 139
          Width = 473
          Height = 41
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 3
          object lblSitFunc: TLabel
            Left = 6
            Top = 15
            Width = 141
            Height = 13
            Caption = 'Situação do Participante'
          end
          object cmbSitFunc: TwwDBLookupCombo
            Left = 160
            Top = 13
            Width = 299
            Height = 21
            DropDownAlignment = taLeftJustify
            LookupTable = qrySitFunc
            LookupField = 'DESCRICAO'
            Style = csDropDownList
            TabOrder = 0
            AutoDropDown = False
            ShowButton = True
            AllowClearKey = False
          end
        end
        object gprMesCobr: TGroupBox
          Left = 8
          Top = 183
          Width = 473
          Height = 41
          Anchors = [akLeft, akTop, akRight]
          TabOrder = 4
          object lblMesCobr: TLabel
            Left = 6
            Top = 15
            Width = 100
            Height = 13
            Caption = 'Mês de Cobrança'
          end
          object txtMesCobr: TMaskEdit
            Left = 114
            Top = 13
            Width = 121
            Height = 21
            EditMask = '!9999/99;1;_'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -9
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            MaxLength = 7
            ParentFont = False
            TabOrder = 0
            Text = '    /  '
          end
        end
        object grdContribDisponivel: TwwDBGrid
          Left = 8
          Top = 229
          Width = 217
          Height = 132
          Selected.Strings = (
            'NOME'#9'50'#9'Contribuições Disponíveis'#9'T')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dsContribDisponivel
          TabOrder = 5
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
        object bntRemoveContrib: TButton
          Left = 221
          Top = 236
          Width = 41
          Height = 25
          Caption = '<'
          TabOrder = 6
          OnClick = bntRemoveContribClick
        end
        object bntRemoveTodosContrib: TButton
          Left = 221
          Top = 268
          Width = 41
          Height = 25
          Caption = '<<'
          TabOrder = 7
          OnClick = bntRemoveTodosContribClick
        end
        object bntAddContrib: TButton
          Left = 221
          Top = 300
          Width = 41
          Height = 25
          Caption = '>'
          TabOrder = 8
          OnClick = bntAddContribClick
        end
        object grdContribAssociado: TwwDBGrid
          Left = 260
          Top = 229
          Width = 217
          Height = 132
          Selected.Strings = (
            'NOME'#9'50'#9'Contribuições Associadas'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dsContribAssociado
          TabOrder = 9
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
        object bntAddTodosContrib: TButton
          Left = 221
          Top = 332
          Width = 41
          Height = 25
          Caption = '>>'
          TabOrder = 10
          OnClick = bntAddTodosContribClick
        end
      end
    end
    object grpOrdenarPor: TGroupBox
      Left = 16
      Top = 447
      Width = 185
      Height = 58
      Caption = 'Ordernar Por'
      TabOrder = 2
      object rbOrdMatricula: TRadioButton
        Left = 16
        Top = 16
        Width = 113
        Height = 17
        Caption = 'Matrícula'
        Checked = True
        TabOrder = 0
        TabStop = True
      end
      object rbOrdNomeParticip: TRadioButton
        Left = 16
        Top = 35
        Width = 146
        Height = 17
        Caption = 'Nome do Participante'
        TabOrder = 1
      end
    end
  end
  inherited Dock971: TDock97
    Top = 527
    Width = 498
    inherited tb97Fundo: TToolbar97
      Left = 326
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 157
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  object MontaSelect: TMontaSelect
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
      'PESSOAFISICA'
      'PROVISAOPERDASCONTRIBUICAO')
    CamposChave.Strings = (
      'ELEGPATRO.IDPESSOA'
      'ELEGPATRO.IDPESSJUR'
      'PLANPREV.IDPLANOPREV'
      'PESSOA.NOME'
      'PATRO.NOME AS PATRO'
      'PLANPREV.NOME AS PLANO'
      'PARTPREVPLAN.SEQPROPOSTA'
      'ELEGPATRO.MATRICULA'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'SITPART.FLGINTERNO')
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
      'PARTPREVPLAN.FLGDESATIVADO = 0'
      'PESSOA.IDPESSOA = PROVISAOPERDASCONTRIBUICAO.IDPESSOA'
      'PROVISAOPERDASCONTRIBUICAO.FLGREVERSAO = 0')
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
    OperComparador.Strings = (
      '-1'
      '-1'
      '-1'
      '-1'
      '-1')
    ApenasLetraENum.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    ComparaMaiuscula.Strings = (
      ''
      ''
      ''
      ''
      '')
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
      '')
    LookupCampoChave.Strings = (
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
      '')
    Left = 396
    Top = 4
  end
  object qryPatro: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.IDPESSOA, P.NOME'
      'FROM   PESSOA P, PATRO PT'
      'WHERE  PT.IDPESSOA = P.IDPESSOA'
      'AND    PT.IDFUNDACAO = :IDFUNDACAO'
      'ORDER BY P.NOME'
      ' ')
    ValidateWithMask = True
    Left = 362
    Top = 423
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFUNDACAO'
        ParamType = ptUnknown
      end>
    object qryPatroIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.PESSOA.IDPESSOA'
    end
    object qryPatroNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PESSOA.NOME'
      Size = 60
    end
  end
  object qryPlanoContabil: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM PLANPREVCONTABIL WHERE ATIVO = '#39'S'#39)
    ValidateWithMask = True
    Left = 310
    Top = 437
    object qryPlanoContabilIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.PLANPREVCONTABIL.IDPLANOPREV'
    end
    object qryPlanoContabilNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PLANPREVCONTABIL.NOME'
      Size = 50
    end
  end
  object qryPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPLANOPREV , NOME'
      'FROM PLANPREV')
    ValidateWithMask = True
    Left = 242
    Top = 439
    object qryPlanoIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.PLANPREV.IDPLANOPREV'
    end
    object qryPlanoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PLANPREV.NOME'
      Size = 50
    end
  end
  object qrySitFunc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDSITFUNC, DESCRICAO FROM SITFUNC'
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 186
    Top = 439
    object qrySitFuncIDSITFUNC: TFloatField
      FieldName = 'IDSITFUNC'
      Origin = 'BASEDADOS.SITFUNC.IDSITFUNC'
    end
    object qrySitFuncDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.SITFUNC.DESCRICAO'
      Size = 60
    end
  end
  object dsContribDisponivel: TwwDataSource
    DataSet = qryContribDisponivel
    Left = 101
    Top = 303
  end
  object qryContribDisponivel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT C.IDCONTRIBUICAO, C.NOME'
      'FROM CONTRIBUICAO C'
      'INNER JOIN CONTPREV CP'
      'ON C.IDCONTRIBUICAO = CP.IDCONTRIBUICAO'
      'WHERE CP.IDPLANOPREV = :IDPLANOPREV'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 101
    Top = 343
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptUnknown
      end>
  end
  object updContribAssociado: TUpdateSQL
    Left = 392
    Top = 294
  end
  object dsContribAssociado: TwwDataSource
    DataSet = qryContribAssociado
    Left = 397
    Top = 335
  end
  object qryContribAssociado: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT C.IDCONTRIBUICAO, C.NOME'
      '  FROM CONTRIBUICAO C'
      ' WHERE '
      '         C.IDCONTRIBUICAO = :IDCONTRIBUICAO      ')
    UpdateObject = updContribAssociado
    ValidateWithMask = True
    Left = 397
    Top = 375
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCONTRIBUICAO'
        ParamType = ptUnknown
      end>
  end
end
