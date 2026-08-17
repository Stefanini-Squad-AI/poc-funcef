inherited FrmCadProvento: TFrmCadProvento
  Left = 103
  Top = 38
  Caption = 'Cadastro de Rubricas '
  ClientHeight = 463
  ClientWidth = 603
  OnActivate = CmeCadastroAtualizaBotoes
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 603
    Height = 377
    inherited dbGrd: TwwDBGrid [0]
      Width = 593
      Height = 367
      Selected.Strings = (
        'IDPROVENTO'#9'10'#9'Código'
        'DESCRICAO'#9'130'#9'Descrição')
      TitleLines = 2
    end
    inherited pnlControles: TPanel [1]
      Width = 593
      Height = 367
      object Label2: TLabel
        Left = 5
        Top = 0
        Width = 45
        Height = 13
        Caption = 'Rubrica'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label5: TLabel
        Left = 322
        Top = 133
        Width = 118
        Height = 13
        Caption = 'Natureza da Rubrica'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label6: TLabel
        Left = 5
        Top = 44
        Width = 185
        Height = 13
        Caption = 'Linha do Informe de Rendimento'
      end
      object Label7: TLabel
        Left = 324
        Top = 179
        Width = 183
        Height = 13
        Caption = 'Código IRRF - Receita p/ DARF'
      end
      object dbrgrpDesconto: TDBRadioGroup
        Left = 7
        Top = 190
        Width = 307
        Height = 40
        Caption = ' Finalidade '
        Columns = 3
        DataField = 'FLGDESCONTO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Items.Strings = (
          'Provento'
          'Desconto'
          'Outros')
        ParentFont = False
        TabOrder = 9
        TabStop = True
        Values.Strings = (
          '0'
          '1'
          '2')
        OnChange = dbrgrpDescontoChange
        OnClick = dbrgrpDescontoClick
      end
      object dbedDescricao: TwwDBEdit
        Left = 5
        Top = 17
        Width = 309
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dblkcmbflgAtrasoDevol: TwwDBComboBox
        Left = 325
        Top = 149
        Width = 242
        Height = 21
        ShowButton = True
        Style = csDropDown
        MapList = True
        AllowClearKey = False
        DataField = 'FLGATRASODEVOL'
        DataSource = ds
        DropDownCount = 8
        ItemHeight = 0
        Items.Strings = (
          'NORMAL'#9'N'
          'ATRASO'#9'A'
          'DEVOLUÇÃO'#9'D')
        Sorted = False
        TabOrder = 2
        UnboundDataType = wwDefault
      end
      object grpTipo: TGroupBox
        Left = 5
        Top = 82
        Width = 308
        Height = 48
        Caption = 'Tipo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnExit = grpTipoExit
        object chkVisivel: TCheckBox
          Left = 185
          Top = 18
          Width = 115
          Height = 19
          Caption = 'Visível na Folha'
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          Visible = False
        end
        object rbNormal: TRadioButton
          Left = 12
          Top = 13
          Width = 65
          Height = 17
          Caption = 'Normal'
          TabOrder = 1
          OnClick = rbNormalClick
        end
        object rbEspecial: TRadioButton
          Left = 12
          Top = 29
          Width = 73
          Height = 17
          Caption = 'Especial'
          TabOrder = 2
          OnClick = rbEspecialClick
        end
      end
      object dbckINSS: TDBCheckBox
        Left = 7
        Top = 137
        Width = 97
        Height = 15
        Caption = 'Incide &INSS'
        DataField = 'FLGINSS'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 4
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object dbckFGTS: TDBCheckBox
        Left = 7
        Top = 174
        Width = 97
        Height = 15
        Caption = 'Incide &FGTS'
        DataField = 'FLGFGTS'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 5
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object dbckIRRF: TDBCheckBox
        Left = 7
        Top = 155
        Width = 97
        Height = 15
        Caption = 'Incide I&RRF'
        DataField = 'FLGIRRF'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 6
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object dbchkObrigaFavorecido: TDBCheckBox
        Left = 110
        Top = 155
        Width = 199
        Height = 12
        Caption = 'Exige Indicação de Favorecido '
        DataField = 'FLGOBRIGAFAVOREC'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 8
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object dbchkConsolida: TDBCheckBox
        Left = 110
        Top = 136
        Width = 157
        Height = 15
        Caption = 'Consolida Lançamentos'
        DataField = 'FLGCONSOLIDA'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 7
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object pnlPrioridadeDesconto: TPanel
        Left = 7
        Top = 231
        Width = 307
        Height = 35
        TabOrder = 10
        object Label1: TLabel
          Left = 9
          Top = 13
          Width = 145
          Height = 13
          Caption = 'Prioridade para Desconto'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object dbedNumPrioridade: TDBEdit
          Left = 169
          Top = 10
          Width = 121
          Height = 21
          DataField = 'NUMPRIORIDADE'
          DataSource = ds
          TabOrder = 0
        end
      end
      object GroupBox1: TGroupBox
        Left = 322
        Top = 225
        Width = 246
        Height = 138
        Caption = 'Somente para Previdência'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 12
        object dbckFLGDESCPENSAO: TDBCheckBox
          Left = 7
          Top = 19
          Width = 183
          Height = 14
          Caption = 'Usa no Cálculo de Pensão'
          DataField = 'FLGDESCPENSAO'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbchkCompoeSalPart: TDBCheckBox
          Left = 7
          Top = 33
          Width = 207
          Height = 17
          Caption = 'Compõe Salário de Participação'
          DataField = 'FLGCOMPOESALPART'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object dbchkCompoeSalBenef: TDBCheckBox
          Left = 7
          Top = 50
          Width = 216
          Height = 17
          Caption = 'Compõe Salário de Benefício'
          DataField = 'FLGCOMPOESALBENEF'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBCheckBox1: TDBCheckBox
          Left = 7
          Top = 66
          Width = 216
          Height = 17
          Caption = 'Compõe Remuneração Total'
          DataField = 'FLGCOMPOEREMTOTAL'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBCheckBox2: TDBCheckBox
          Left = 7
          Top = 82
          Width = 216
          Height = 17
          Caption = 'Salário de participação Retroativo'
          DataField = 'FLGSALPARTRETRO'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 4
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBCheckBox3: TDBCheckBox
          Left = 7
          Top = 100
          Width = 216
          Height = 17
          Caption = 'Salário de benefício Retroativo'
          DataField = 'FLGSALBENEFRETRO'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 5
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
        object DBCheckBox4: TDBCheckBox
          Left = 7
          Top = 117
          Width = 216
          Height = 17
          Caption = 'Salário de participação Atuarial'
          DataField = 'FLGSALPARTATUARIA'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 6
          ValueChecked = '1'
          ValueUnchecked = '0'
        end
      end
      object wwDBLookupCombo1: TwwDBLookupCombo
        Left = 5
        Top = 58
        Width = 309
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEINFORME'#9'60'#9'NOMEINFORME')
        DataField = 'IDINFORME'
        DataSource = ds
        LookupTable = qryInformerendimento
        LookupField = 'IDINFORME'
        TabOrder = 1
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
      object wwDBLookupCombo2: TwwDBLookupCombo
        Left = 323
        Top = 196
        Width = 244
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'60'#9'DESCRIÇÃO'
          'CODNATUREZA'#9'4'#9'CÓDIGO')
        DataField = 'CODIRRFDARF'
        DataSource = ds
        LookupTable = qryIRRFDARF
        LookupField = 'CODNATUREZA'
        Options = [loTitles]
        TabOrder = 11
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
      object rdgBcalc: TRadioGroup
        Left = 7
        Top = 266
        Width = 307
        Height = 97
        Caption = 'Incide sobre as seguintes Bases de Proventos :'
        Items.Strings = (
          'Base de Suplementação'
          'Base de resgate'
          'Base de INSS'
          'Base de Suplementação e Resgate'
          'Base de Suplementação, Resgate e INSS')
        TabOrder = 13
      end
      object grpTipoRubrica: TGroupBox
        Left = 319
        Top = 11
        Width = 248
        Height = 119
        Caption = 'Tipo(s) de Rubrica(s) '
        TabOrder = 14
        object chkGeral: TCheckBox
          Left = 10
          Top = 20
          Width = 97
          Height = 17
          Caption = 'Geral '
          TabOrder = 0
        end
        object chkAssistencial: TCheckBox
          Left = 137
          Top = 19
          Width = 97
          Height = 17
          Caption = 'Assistencial'
          TabOrder = 1
        end
        object chkEmprestimo: TCheckBox
          Left = 137
          Top = 40
          Width = 97
          Height = 17
          Caption = 'Empréstimo'
          TabOrder = 2
        end
        object chkPatrocinadora: TCheckBox
          Left = 10
          Top = 41
          Width = 104
          Height = 17
          Caption = 'Patrocinadora'
          TabOrder = 3
        end
        object chkFolhaBeneficio: TCheckBox
          Left = 10
          Top = 64
          Width = 163
          Height = 16
          Caption = 'Folha de Benefícios'
          TabOrder = 4
        end
        object chkFolhaPagaFunda: TCheckBox
          Left = 10
          Top = 83
          Width = 210
          Height = 23
          Caption = 'Folha de Pagamento Fundação '
          TabOrder = 5
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 603
  end
  inherited Dock971: TDock97
    Top = 424
    Width = 603
  end
  inherited qry: TwwQuery
    BeforePost = qryBeforePost
    SQL.Strings = (
      'SELECT '
      ' IDPROVENTO,                     '
      ' FLGDESCONTO,                    '
      ' CODRUBCLT,                      '
      ' IDBENEFSALAR,                   '
      ' IDREGRARESCISAO,                '
      ' DESCRICAO,                      '
      ' FLGIRRF,                        '
      ' FLGFGTS,                        '
      ' FLGINSS,                        '
      ' NUMPRIORIDADE,                  '
      ' FLGINTERNO,                     '
      ' FLGCONSOLIDA,                   '
      ' FLGCONSTAFOLHA,                 '
      ' FLGOBRIGAFAVOREC,               '
      ' FLGRAIS,                        '
      ' FLGSALFAMILIA,                  '
      ' FLGDECIMOTERCEIRO,              '
      ' FLGFERIAS,                      '
      ' FLGRESCISAO,                    '
      ' FLGUSO,                         '
      ' FLGESPECIAL,                    '
      ' FLGINCIDECONTRIB,               '
      ' FLGINCIDESALPART,               '
      ' FLGCOMPOESALPART,               '
      ' FLGCOMPOESALBENEF,              '
      ' FLGPRORATA,                     '
      ' IDREGRA13,                      '
      ' IDREGRAFERIAS,                  '
      ' FLGTPRUBRICA,                   '
      ' FLGCOMPOEREMTOTAL,              '
      ' IDREGRA,                        '
      ' TRGDTINCLUSAO,                  '
      ' TRGUSERINCLUSAO,                '
      ' FLGDESCPENSAO,                  '
      ' FLGATRASODEVOL,                 '
      ' IDINFORME,'
      ' CODIRRFDARF,'
      ' FLGSALPARTRETRO,'
      ' FLGSALBENEFRETRO,'
      ' FLGSALPARTATUARIA,'
      ' IDMODULO,'
      ' TIPOBASEDESCONTO                     '
      ' FROM PROVDESC '
      'WHERE IDPROVENTO = :IDPROVENTO')
    Left = 295
    Top = 6
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPROVENTO'
        ParamType = ptUnknown
      end>
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 640
    Top = 30
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PROVDESC'
      'set'
      '  IDPROVENTO = :IDPROVENTO,'
      '  FLGDESCONTO = :FLGDESCONTO,'
      '  CODRUBCLT = :CODRUBCLT,'
      '  IDBENEFSALAR = :IDBENEFSALAR,'
      '  IDREGRARESCISAO = :IDREGRARESCISAO,'
      '  DESCRICAO = :DESCRICAO,'
      '  FLGIRRF = :FLGIRRF,'
      '  FLGFGTS = :FLGFGTS,'
      '  FLGINSS = :FLGINSS,'
      '  NUMPRIORIDADE = :NUMPRIORIDADE,'
      '  FLGINTERNO = :FLGINTERNO,'
      '  FLGCONSOLIDA = :FLGCONSOLIDA,'
      '  FLGCONSTAFOLHA = :FLGCONSTAFOLHA,'
      '  FLGOBRIGAFAVOREC = :FLGOBRIGAFAVOREC,'
      '  FLGRAIS = :FLGRAIS,'
      '  FLGSALFAMILIA = :FLGSALFAMILIA,'
      '  FLGDECIMOTERCEIRO = :FLGDECIMOTERCEIRO,'
      '  FLGFERIAS = :FLGFERIAS,'
      '  FLGRESCISAO = :FLGRESCISAO,'
      '  FLGUSO = :FLGUSO,'
      '  FLGESPECIAL = :FLGESPECIAL,'
      '  FLGINCIDECONTRIB = :FLGINCIDECONTRIB,'
      '  FLGINCIDESALPART = :FLGINCIDESALPART,'
      '  FLGCOMPOESALPART = :FLGCOMPOESALPART,'
      '  FLGCOMPOESALBENEF = :FLGCOMPOESALBENEF,'
      '  FLGPRORATA = :FLGPRORATA,'
      '  IDREGRA13 = :IDREGRA13,'
      '  IDREGRAFERIAS = :IDREGRAFERIAS,'
      '  FLGTPRUBRICA = :FLGTPRUBRICA,'
      '  FLGCOMPOEREMTOTAL = :FLGCOMPOEREMTOTAL,'
      '  IDREGRA = :IDREGRA,'
      '  TRGDTINCLUSAO = :TRGDTINCLUSAO,'
      '  TRGUSERINCLUSAO = :TRGUSERINCLUSAO,'
      '  FLGDESCPENSAO = :FLGDESCPENSAO,'
      '  FLGATRASODEVOL = :FLGATRASODEVOL,'
      '  IDINFORME = :IDINFORME,'
      '  CODIRRFDARF = :CODIRRFDARF,'
      '  FLGSALPARTRETRO = :FLGSALPARTRETRO,'
      '  FLGSALBENEFRETRO = :FLGSALBENEFRETRO,'
      '  FLGSALPARTATUARIA = :FLGSALPARTATUARIA,'
      '  IDMODULO = :IDMODULO,'
      '  TIPOBASEDESCONTO = :TIPOBASEDESCONTO'
      'where'
      '  IDPROVENTO = :OLD_IDPROVENTO')
    InsertSQL.Strings = (
      'insert into PROVDESC'
      '  (IDPROVENTO, FLGDESCONTO, CODRUBCLT, IDBENEFSALAR, '
      'IDREGRARESCISAO, DESCRICAO, '
      '   FLGIRRF, FLGFGTS, FLGINSS, NUMPRIORIDADE, FLGINTERNO, '
      'FLGCONSOLIDA, '
      '   FLGCONSTAFOLHA, FLGOBRIGAFAVOREC, FLGRAIS, FLGSALFAMILIA, '
      'FLGDECIMOTERCEIRO, '
      
        '   FLGFERIAS, FLGRESCISAO, FLGUSO, FLGESPECIAL, FLGINCIDECONTRIB' +
        ', '
      'FLGINCIDESALPART, '
      '   FLGCOMPOESALPART, FLGCOMPOESALBENEF, FLGPRORATA, IDREGRA13, '
      'IDREGRAFERIAS, '
      '   FLGTPRUBRICA, FLGCOMPOEREMTOTAL, IDREGRA, TRGDTINCLUSAO, '
      'TRGUSERINCLUSAO, '
      '   FLGDESCPENSAO, FLGATRASODEVOL, IDINFORME, CODIRRFDARF, '
      'FLGSALPARTRETRO, '
      '   FLGSALBENEFRETRO, FLGSALPARTATUARIA, IDMODULO, '
      'TIPOBASEDESCONTO)'
      'values'
      '  (:IDPROVENTO, :FLGDESCONTO, :CODRUBCLT, :IDBENEFSALAR, '
      ':IDREGRARESCISAO, '
      '   :DESCRICAO, :FLGIRRF, :FLGFGTS, :FLGINSS, :NUMPRIORIDADE, '
      ':FLGINTERNO, '
      '   :FLGCONSOLIDA, :FLGCONSTAFOLHA, :FLGOBRIGAFAVOREC, :FLGRAIS, '
      ':FLGSALFAMILIA, '
      '   :FLGDECIMOTERCEIRO, :FLGFERIAS, :FLGRESCISAO, :FLGUSO, '
      ':FLGESPECIAL, '
      '   :FLGINCIDECONTRIB, :FLGINCIDESALPART, :FLGCOMPOESALPART, '
      ':FLGCOMPOESALBENEF, '
      '   :FLGPRORATA, :IDREGRA13, :IDREGRAFERIAS, :FLGTPRUBRICA, '
      ':FLGCOMPOEREMTOTAL, '
      '   :IDREGRA, :TRGDTINCLUSAO, :TRGUSERINCLUSAO, :FLGDESCPENSAO, '
      ':FLGATRASODEVOL, '
      
        '   :IDINFORME, :CODIRRFDARF, :FLGSALPARTRETRO, :FLGSALBENEFRETRO' +
        ', '
      ':FLGSALPARTATUARIA, '
      '   :IDMODULO, :TIPOBASEDESCONTO)')
    DeleteSQL.Strings = (
      'delete from PROVDESC'
      'where'
      '  IDPROVENTO = :OLD_IDPROVENTO')
    Left = 265
    Top = 14
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PROVDESC.IDPROVENTO'
      'PROVDESC.DESCRICAO')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'PROVDESC')
    CamposChave.Strings = (
      'PROVDESC.IDPROVENTO')
    Filtro.Strings = (
      
        'PROVDESC.FLGTPRUBRICA LIKE '#39'%P%'#39' OR PROVDESC.FLGTPRUBRICA IS NUL' +
        'L')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '130')
    Left = 549
    Top = 6
  end
  inherited ds: TwwDataSource
    Left = 325
    Top = 14
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
    Top = 10
  end
  object qryRegra: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      'IDREGRA,'
      'NOMEREGRA '
      'FROM REGRA '
      'ORDER BY NOMEREGRA')
    ValidateWithMask = True
    Left = 423
    Top = 1
  end
  object qryInformerendimento: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDINFORME,NOMEINFORME'
      'FROM INFORME'
      'ORDER BY NOMEINFORME')
    ValidateWithMask = True
    Left = 503
    Top = 2
  end
  object qryIRRFDARF: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM NATURENDIMENTO')
    ValidateWithMask = True
    Left = 464
    Top = 15
  end
end
