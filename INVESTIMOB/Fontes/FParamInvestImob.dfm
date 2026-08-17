inherited frmParamInvestImob: TfrmParamInvestImob
  Left = 598
  Top = 174
  HelpContext = 230005
  Caption = 'Parâmetros do Sistema'
  ClientHeight = 460
  ClientWidth = 541
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Top = 35
    Width = 541
    Height = 390
    object pgcParametros: TPageControl
      Left = 1
      Top = 1
      Width = 539
      Height = 388
      ActivePage = tbsGeral
      Align = alClient
      MultiLine = True
      TabOrder = 0
      object tbsIntegra: TTabSheet
        Caption = 'Integração'
        ImageIndex = 5
        object CheckBox1: TDBCheckBox
          Left = 24
          Top = 148
          Width = 417
          Height = 21
          Caption = 'Integrar Ativo Fixo com Contabilidade '
          DataField = 'FLGINTCAFCONT'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object CheckBox5: TDBCheckBox
          Left = 24
          Top = 73
          Width = 425
          Height = 21
          Caption = 'Integrar com Contas a Pagar e Receber'
          DataField = 'FLGINTEGRACAPCAR'
          DataSource = ds
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object cbIntegraAtivo: TDBCheckBox
          Left = 24
          Top = 111
          Width = 441
          Height = 21
          Caption = 'Integrar com Ativo Fixo ( Patrimonial )'
          DataField = 'FLGINTEGRAATIVO'
          DataSource = ds
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 2
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object DBCheckBox1: TDBCheckBox
          Left = 24
          Top = 36
          Width = 441
          Height = 21
          Caption = 'Integrar com Contabilidade'
          DataField = 'FLGINTEGRACONTAB'
          DataSource = ds
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -19
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
      end
      object tbsGeral: TTabSheet
        Caption = 'Geral'
        object GroupBox1: TGroupBox
          Left = 16
          Top = 9
          Width = 449
          Height = 233
          Caption = ' Opções padrão para Receitas e Despesas (Integração Financeira) '
          TabOrder = 0
          object Label2: TLabel
            Left = 16
            Top = 22
            Width = 160
            Height = 13
            Caption = 'Centro de Responsabilidade'
          end
          object Label4: TLabel
            Left = 16
            Top = 62
            Width = 108
            Height = 13
            Caption = 'Atividade / Projeto'
          end
          object Label1: TLabel
            Left = 16
            Top = 102
            Width = 199
            Height = 13
            Caption = 'Contas-Caixa x Forma de Cobrança'
          end
          object Label17: TLabel
            Left = 16
            Top = 142
            Width = 92
            Height = 13
            Caption = 'Centro de Custo'
          end
          object Label18: TLabel
            Left = 16
            Top = 182
            Width = 54
            Height = 13
            Caption = 'Programa'
          end
          object DBcboCentroRespon: TwwDBLookupCombo
            Left = 16
            Top = 36
            Width = 417
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'30'#9'NOME')
            DataField = 'CODCENTRORESPON'
            DataSource = ds
            LookupTable = qryLookCentroRespon
            LookupField = 'CODCENTRORESPON'
            Style = csDropDownList
            DropDownWidth = 249
            TabOrder = 0
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
          end
          object DBcboUnidNegocios: TwwDBLookupCombo
            Left = 16
            Top = 76
            Width = 417
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'25'#9'NOME')
            DataField = 'UNIDNEGOC'
            DataSource = ds
            LookupTable = qryLookUnidNegocio
            LookupField = 'UNIDNEGOC'
            Style = csDropDownList
            DropDownWidth = 249
            TabOrder = 1
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
          end
          object DBcboPortadorForma: TwwDBLookupCombo
            Left = 16
            Top = 116
            Width = 417
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCRICAO'#9'50'#9'Forma de Cobrança'#9'F'
              'FLGATIVO'#9'1'#9'Ativo'#9'F')
            DataField = 'CODPORTFORMA'
            DataSource = ds
            LookupTable = qryLookPortadorForma
            LookupField = 'CODPORTFORMA'
            Options = [loColLines, loTitles]
            Style = csDropDownList
            DropDownWidth = 249
            TabOrder = 2
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
          end
          object DBcboLookCentroCusto: TwwDBLookupCombo
            Left = 16
            Top = 156
            Width = 417
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'NOME'#9'30'#9'NOME')
            DataField = 'CODCENTROCUSTO'
            DataSource = ds
            LookupTable = dtmLookImobiliario.qryLookCentroCusto
            LookupField = 'CODCENTROCUSTO'
            Style = csDropDownList
            DropDownWidth = 249
            TabOrder = 3
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
          end
          object DBcboPrograma: TwwDBLookupCombo
            Left = 16
            Top = 196
            Width = 417
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'DESCPROGRAMA'#9'60'#9'DESCPROGRAMA')
            DataField = 'IDPROGRAMA'
            DataSource = ds
            LookupTable = qryLookPrograma
            LookupField = 'IDPROGRAMA'
            Style = csDropDownList
            DropDownWidth = 249
            TabOrder = 4
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
          end
        end
        object dbrgDepreciacao: TDBRadioGroup
          Left = 16
          Top = 287
          Width = 217
          Height = 45
          Caption = 'Periodicidade da Depreciação'
          Columns = 2
          DataField = 'FLGDIARIO'
          DataSource = ds
          Items.Strings = (
            'Diária'
            'Mensal')
          TabOrder = 1
          Values.Strings = (
            'S'
            'N')
        end
        object DBCheckBox4: TDBCheckBox
          Left = 17
          Top = 256
          Width = 208
          Height = 17
          Caption = 'Imprimir Logotipo nos Relatórios'
          DataField = 'FLGLOGORELAT'
          DataSource = ds
          TabOrder = 2
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
      end
      object TabSheet1: TTabSheet
        Caption = 'CAF'
        ImageIndex = 3
        object Label52: TLabel
          Left = 40
          Top = 105
          Width = 51
          Height = 13
          Caption = 'Situação'
        end
        object Label22: TLabel
          Left = 40
          Top = 148
          Width = 150
          Height = 13
          Caption = '"Despesa" para Aquisição'
        end
        object Label7: TLabel
          Left = 40
          Top = 193
          Width = 146
          Height = 13
          Caption = '"Receita" para Alienação'
        end
        object Label8: TLabel
          Left = 40
          Top = 238
          Width = 136
          Height = 13
          Caption = 'Tipo de Imóvel em Obra'
        end
        inline molLocalizacao1: TmolLocalizacao
          Left = 32
          Top = 15
          inherited label1: TLabel
            Width = 69
          end
          inherited btnBuscaLocalizacao: TBitBtn
            OnClick = molLocalizacao1btnBuscaLocalizacaoClick
          end
          inherited btnLimpaLocalizacao: TBitBtn
            OnClick = molLocalizacao1btnLimpaLocalizacaoClick
          end
        end
        inline molClasseBem1: TmolClasseBem
          Left = 32
          Top = 61
          TabOrder = 1
          inherited label1: TLabel
            Width = 84
          end
          inherited btnBuscaClasseBem: TBitBtn
            OnClick = molClasseBem1btnBuscaClasseBemClick
          end
          inherited btnLimpaClasseBem: TBitBtn
            OnClick = molClasseBem1btnLimpaClasseBemClick
          end
        end
        object DBcboSituacao: TwwDBLookupCombo
          Left = 40
          Top = 119
          Width = 321
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCSITUACAO'#9'45'#9'DESCSITUACAO')
          DataField = 'IDSITUACAO'
          DataSource = ds
          LookupTable = dtmLookImobiliario.qryLookSituacao
          LookupField = 'IDSITUACAO'
          Style = csDropDownList
          DropDownWidth = 8
          TabOrder = 2
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
        end
        object DBcboTipoRecDes: TwwDBLookupCombo
          Left = 40
          Top = 162
          Width = 321
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCCUSTORECIMO'#9'30'#9'Tipo de Despesa')
          DataField = 'IDDESPAQUISICAO'
          DataSource = ds
          LookupTable = qryLookDespAquisicao
          LookupField = 'IDTIPOCUSTORECIMO'
          Style = csDropDownList
          DropDownWidth = 8
          TabOrder = 3
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
        end
        object wwDBLookupCombo1: TwwDBLookupCombo
          Left = 40
          Top = 207
          Width = 321
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCCUSTORECIMO'#9'30'#9'Tipo de Despesa')
          DataField = 'IDRECALIENACAO'
          DataSource = ds
          LookupTable = qryLookRecAlienacao
          LookupField = 'IDTIPOCUSTORECIMO'
          Style = csDropDownList
          DropDownWidth = 8
          TabOrder = 4
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
        end
        object wwDBLookupCombo2: TwwDBLookupCombo
          Left = 40
          Top = 253
          Width = 321
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCTIPOIMOVEL'#9'25'#9'Tipo Imóvel'#9'F')
          DataField = 'CODTIPIMOVELOBRA'
          DataSource = ds
          LookupTable = dtmLookImobiliario.qryLookTipoImovel
          LookupField = 'CODTIPIMOVEL'
          Style = csDropDownList
          DropDownWidth = 8
          TabOrder = 5
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
        end
      end
      object tbsProcessos: TTabSheet
        Caption = 'Processos'
        ImageIndex = 3
        object GroupBox2: TGroupBox
          Left = 16
          Top = 16
          Width = 385
          Height = 76
          Caption = 'Reavaliação de imóveis'
          TabOrder = 0
          object DBCheckBox2: TDBCheckBox
            Left = 16
            Top = 24
            Width = 337
            Height = 17
            Caption = 'Permite a criação de novos bens durante o processo'
            DataField = 'FLGREAVCRIABEM'
            DataSource = ds
            TabOrder = 0
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object DBCheckBox3: TDBCheckBox
            Left = 16
            Top = 45
            Width = 337
            Height = 17
            Caption = 'Permite a baixa de bens durante o processo'
            DataField = 'FLGREAVBAIXABEM'
            DataSource = ds
            TabOrder = 1
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
        end
        object dbrdgTipoNumeracao: TDBRadioGroup
          Left = 16
          Top = 104
          Width = 497
          Height = 58
          Caption = ' Tipo de Numeração de Imóvel '
          DataField = 'FLGTIPONUMERACAO'
          DataSource = ds
          Items.Strings = (
            
              'Não obriga placa para o bem e deriva numeração do imóvel a parti' +
              'r do imóvel pai'
            
              'Obriga placa para o bem e numera os bens e o imóvel de forma seq' +
              'uencial')
          TabOrder = 1
          Values.Strings = (
            '0'
            '1')
          OnClick = dbrdgTipoNumeracaoClick
        end
        object pnlPrefixo: TPanel
          Left = 16
          Top = 176
          Width = 497
          Height = 54
          BevelOuter = bvNone
          TabOrder = 2
          object GroupBox3: TGroupBox
            Left = 0
            Top = 0
            Width = 497
            Height = 54
            Align = alClient
            Caption = ' Prefixos para numeração '
            TabOrder = 0
            object Label3: TLabel
              Left = 29
              Top = 23
              Width = 49
              Height = 13
              Caption = 'Terreno:'
            end
            object Label5: TLabel
              Left = 197
              Top = 23
              Width = 65
              Height = 13
              Caption = 'Edificação:'
            end
            object Label6: TLabel
              Left = 350
              Top = 23
              Width = 64
              Height = 13
              Caption = 'Instalação:'
            end
            object DBEdit1: TDBEdit
              Left = 80
              Top = 20
              Width = 41
              Height = 21
              DataField = 'FLGPREFIXONUMTER'
              DataSource = ds
              TabOrder = 0
            end
            object DBEdit2: TDBEdit
              Left = 264
              Top = 20
              Width = 41
              Height = 21
              DataField = 'FLGPREFIXONUMEDI'
              DataSource = ds
              TabOrder = 1
            end
            object DBEdit3: TDBEdit
              Left = 416
              Top = 20
              Width = 41
              Height = 21
              DataField = 'FLGPREFIXONUMINS'
              DataSource = ds
              TabOrder = 2
            end
          end
        end
        object GroupBox4: TGroupBox
          Left = 16
          Top = 248
          Width = 495
          Height = 76
          Caption = 'Código do Imóvel'
          TabOrder = 3
          object dbChkGeraAutomatico: TDBCheckBox
            Left = 16
            Top = 24
            Width = 337
            Height = 17
            Caption = 'Gerar automaticamente o código'
            DataField = 'FLGAUTCOD'
            DataSource = ds
            TabOrder = 0
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
          object dbChkValidaPreenchimento: TDBCheckBox
            Left = 16
            Top = 45
            Width = 337
            Height = 17
            Caption = 'Validar o preenchimento do código'
            DataField = 'FLGVALCOD'
            DataSource = ds
            TabOrder = 1
            ValueChecked = 'S'
            ValueUnchecked = 'N'
          end
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 541
    Height = 35
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Width = 17
        Height = 29
        Enabled = False
        Layout = blGlyphLeft
        Spacing = 4
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Left = 17
        Width = 89
        Height = 29
        Layout = blGlyphLeft
        Spacing = 4
      end
      inherited sbtnProcurar: TToolbarButton97
        Left = 123
        Width = 17
        Height = 29
        Enabled = False
        Layout = blGlyphLeft
        Spacing = 4
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Left = 106
        Width = 17
        Height = 29
        Enabled = False
        Layout = blGlyphLeft
        Spacing = 4
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 425
    Width = 541
    Height = 35
    inherited tb97Fundo: TToolbar97
      Left = 315
      DockPos = 315
      inherited sep1: TToolbarSep97
        Left = 88
      end
      inherited sep3: TToolbarSep97
        Left = 176
      end
      object ToolbarSep974: TToolbarSep97 [2]
        Left = 0
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      inherited bbtnSair: TBitBtn
        Left = 3
        Width = 85
        Height = 29
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 91
        Width = 85
        Height = 29
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 132
      DockPos = 132
      inherited ToolbarSep971: TToolbarSep97
        Left = 88
      end
      object ToolbarSep972: TToolbarSep97 [1]
        Left = 176
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      object ToolbarSep973: TToolbarSep97 [2]
        Left = 0
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      inherited bbtnConfirmar: TBitBtn
        Left = 3
        Width = 85
        Height = 29
      end
      inherited bbtnCancelar: TBitBtn
        Left = 91
        Width = 85
        Height = 29
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 65496
    Top = 65496
  end
  inherited ds: TwwDataSource
    Left = 224
    Top = 0
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PARAMINVESTIMOB'
      'set'
      '  FLGINTEGRACAPCAR = :FLGINTEGRACAPCAR,'
      '  FLGINTEGRAATIVO = :FLGINTEGRAATIVO,'
      '  FLGINTEGRACONTAB = :FLGINTEGRACONTAB,'
      '  FLGINTCAFCONT = :FLGINTCAFCONT,'
      '  FLGDIARIO = :FLGDIARIO,'
      '  UNIDNEGOC = :UNIDNEGOC,'
      '  CODCENTRORESPON = :CODCENTRORESPON,'
      '  CODCENTROCUSTO = :CODCENTROCUSTO,'
      '  IDEMPRESA = :IDEMPRESA,'
      '  CODPORTFORMA = :CODPORTFORMA,'
      '  IDPROGRAMA = :IDPROGRAMA,'
      '  IDPESSOALOC = :IDPESSOALOC,'
      '  IDLOCALIZACAO = :IDLOCALIZACAO,'
      '  IDCLASSEBEM = :IDCLASSEBEM,'
      '  IDSITUACAO = :IDSITUACAO,'
      '  IDDESPAQUISICAO = :IDDESPAQUISICAO,'
      '  IDRECALIENACAO = :IDRECALIENACAO,'
      '  CODTIPIMOVELOBRA = :CODTIPIMOVELOBRA,'
      '  FLGREAVBAIXABEM = :FLGREAVBAIXABEM,'
      '  FLGREAVCRIABEM = :FLGREAVCRIABEM,'
      '  FLGLOGORELAT = :FLGLOGORELAT,'
      '  FLGTIPONUMERACAO = :FLGTIPONUMERACAO,'
      '  FLGPREFIXONUMTER = :FLGPREFIXONUMTER,'
      '  FLGPREFIXONUMEDI = :FLGPREFIXONUMEDI,'
      '  FLGPREFIXONUMINS = :FLGPREFIXONUMINS,'
      '  FLGAUTCOD = :FLGAUTCOD,'
      '  FLGVALCOD = :FLGVALCOD'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA'
      ' '
      ' ')
    InsertSQL.Strings = (
      'insert into PARAMINVESTIMOB'
      
        '  (IDPESSOA, FLGINTEGRACAPCAR, FLGINTEGRAATIVO, FLGINTEGRACONTAB' +
        ','
      'FLGINTCAFCONT,'
      '   FLGDIARIO, UNIDNEGOC, CODCENTRORESPON, CODCENTROCUSTO,'
      'IDEMPRESA, CODPORTFORMA,'
      
        '   IDPROGRAMA, IDPESSOALOC, IDLOCALIZACAO, IDCLASSEBEM, IDSITUAC' +
        'AO,'
      'IDDESPAQUISICAO,'
      '   IDRECALIENACAO, CODTIPIMOVELOBRA, FLGREAVBAIXABEM,'
      
        'FLGREAVCRIABEM, FLGLOGORELAT, FLGTIPONUMERACAO, FLGPREFIXONUMTER' +
        ', FLGPREFIXONUMEDI,'
      'FLGPREFIXONUMINS,FLGAUTCOD,FLGVALCOD'
      ')'
      'values'
      '  (:IDPESSOA, :FLGINTEGRACAPCAR, :FLGINTEGRAATIVO,'
      ':FLGINTEGRACONTAB, :FLGINTCAFCONT,'
      '   :FLGDIARIO, :UNIDNEGOC, :CODCENTRORESPON, :CODCENTROCUSTO,'
      ':IDEMPRESA,'
      '   :CODPORTFORMA, :IDPROGRAMA, :IDPESSOALOC, :IDLOCALIZACAO,'
      ':IDCLASSEBEM,'
      
        '   :IDSITUACAO, :IDDESPAQUISICAO, :IDRECALIENACAO, :CODTIPIMOVEL' +
        'OBRA,'
      ':FLGREAVBAIXABEM,'
      
        '   :FLGREAVCRIABEM, :FLGLOGORELAT, :FLGTIPONUMERACAO, :FLGPREFIX' +
        'ONUMTER, :FLGPREFIXONUMEDI,'
      ':FLGPREFIXONUMINS,:FLGAUTCOD,:FLGVALCOD)'
      ' '
      ' '
      ' ')
    DeleteSQL.Strings = (
      'delete from PARAMINVESTIMOB'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 160
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Left = 1000
    Top = 96
  end
  inherited ImlPadrao: TImageList
    Left = 993
    Top = 65534
  end
  inherited CmeCadastro: TCmEventosCadastro
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 314
    Top = 10
  end
  inherited qry: TwwQuery
    AfterOpen = qryAfterOpen
    SQL.Strings = (
      'SELECT P.IDPESSOA,'
      '       P.FLGINTEGRACAPCAR,'
      '       P.FLGINTEGRAATIVO,'
      '       P.FLGINTEGRACONTAB,'
      '       P.FLGINTCAFCONT,'
      '       P.FLGDIARIO,'
      ''
      '       P.UNIDNEGOC,'
      '       P.CODCENTRORESPON,'
      '       P.CODCENTROCUSTO,'
      '       P.IDEMPRESA,'
      '       P.CODPORTFORMA,'
      '       P.IDPROGRAMA,'
      ''
      '       P.IDPESSOALOC,'
      '       P.IDLOCALIZACAO,'
      '       P.IDCLASSEBEM,'
      '       P.IDSITUACAO,'
      '       P.IDDESPAQUISICAO,'
      '       P.IDRECALIENACAO,'
      '       P.CODTIPIMOVELOBRA,'
      ''
      '       P.FLGREAVBAIXABEM,'
      '       P.FLGREAVCRIABEM,'
      '       P.FLGLOGORELAT,'
      '       NVL(P.FLGTIPONUMERACAO,0) AS FLGTIPONUMERACAO,'
      '       P.FLGPREFIXONUMTER,'
      '       P.FLGPREFIXONUMEDI,'
      '       P.FLGPREFIXONUMINS,'
      '       P.FLGAUTCOD,'
      '       P.FLGVALCOD'
      ''
      '  FROM PARAMINVESTIMOB P'
      ' WHERE P.IDPESSOA = :PIDPESSOA'
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    Left = 192
    Top = 0
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.PARAMINVESTIMOB.IDPESSOA'
    end
    object qryFLGINTEGRACAPCAR: TStringField
      FieldName = 'FLGINTEGRACAPCAR'
      Origin = 'BASEDADOS.PARAMINVESTIMOB.FLGINTEGRACAPCAR'
      FixedChar = True
      Size = 1
    end
    object qryFLGINTEGRAATIVO: TStringField
      FieldName = 'FLGINTEGRAATIVO'
      Origin = 'BASEDADOS.PARAMINVESTIMOB.FLGINTEGRAATIVO'
      FixedChar = True
      Size = 1
    end
    object qryFLGINTCAFCONT: TStringField
      FieldName = 'FLGINTCAFCONT'
      Origin = 'BASEDADOS.PARAMINVESTIMOB.FLGINTCAFCONT'
      FixedChar = True
      Size = 1
    end
    object qryFLGDIARIO: TStringField
      FieldName = 'FLGDIARIO'
      Origin = 'BASEDADOS.PARAMINVESTIMOB.FLGDIARIO'
      FixedChar = True
      Size = 1
    end
    object qryUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Origin = 'BASEDADOS.PARAMINVESTIMOB.UNIDNEGOC'
    end
    object qryCODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      Origin = 'BASEDADOS.PARAMINVESTIMOB.CODCENTRORESPON'
      FixedChar = True
      Size = 10
    end
    object qryCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Origin = 'BASEDADOS.PARAMINVESTIMOB.CODCENTROCUSTO'
      FixedChar = True
      Size = 10
    end
    object qryIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Origin = 'BASEDADOS.PARAMINVESTIMOB.IDEMPRESA'
    end
    object qryCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
      Origin = 'BASEDADOS.PARAMINVESTIMOB.CODPORTFORMA'
    end
    object qryIDPROGRAMA: TFloatField
      FieldName = 'IDPROGRAMA'
      Origin = 'BASEDADOS.PARAMINVESTIMOB.IDPROGRAMA'
    end
    object qryIDPESSOALOC: TFloatField
      FieldName = 'IDPESSOALOC'
      Origin = 'BASEDADOS.PARAMINVESTIMOB.IDPESSOALOC'
    end
    object qryIDLOCALIZACAO: TFloatField
      FieldName = 'IDLOCALIZACAO'
      Origin = 'BASEDADOS.PARAMINVESTIMOB.IDLOCALIZACAO'
    end
    object qryIDCLASSEBEM: TFloatField
      FieldName = 'IDCLASSEBEM'
      Origin = 'BASEDADOS.PARAMINVESTIMOB.IDCLASSEBEM'
    end
    object qryIDSITUACAO: TFloatField
      FieldName = 'IDSITUACAO'
      Origin = 'BASEDADOS.PARAMINVESTIMOB.IDSITUACAO'
    end
    object qryIDDESPAQUISICAO: TFloatField
      FieldName = 'IDDESPAQUISICAO'
      Origin = 'BASEDADOS.PARAMINVESTIMOB.IDDESPAQUISICAO'
    end
    object qryIDRECALIENACAO: TFloatField
      FieldName = 'IDRECALIENACAO'
      Origin = 'BASEDADOS.PARAMINVESTIMOB.IDRECALIENACAO'
    end
    object qryCODTIPIMOVELOBRA: TStringField
      FieldName = 'CODTIPIMOVELOBRA'
      Origin = 'BASEDADOS.PARAMINVESTIMOB.CODTIPIMOVELOBRA'
      Size = 5
    end
    object qryFLGINTEGRACONTAB: TStringField
      FieldName = 'FLGINTEGRACONTAB'
      FixedChar = True
      Size = 1
    end
    object qryFLGREAVBAIXABEM: TStringField
      FieldName = 'FLGREAVBAIXABEM'
      Origin = 'BASEDADOS.PARAMINVESTIMOB.FLGREAVBAIXABEM'
      FixedChar = True
      Size = 1
    end
    object qryFLGREAVCRIABEM: TStringField
      FieldName = 'FLGREAVCRIABEM'
      Origin = 'BASEDADOS.PARAMINVESTIMOB.FLGREAVCRIABEM'
      FixedChar = True
      Size = 1
    end
    object qryFLGLOGORELAT: TStringField
      FieldName = 'FLGLOGORELAT'
      Origin = 'BASEDADOS.PARAMINVESTIMOB.FLGLOGORELAT'
      FixedChar = True
      Size = 1
    end
    object qryFLGTIPONUMERACAO: TFloatField
      FieldName = 'FLGTIPONUMERACAO'
    end
    object qryFLGPREFIXONUMTER: TStringField
      FieldName = 'FLGPREFIXONUMTER'
      FixedChar = True
      Size = 2
    end
    object qryFLGPREFIXONUMEDI: TStringField
      FieldName = 'FLGPREFIXONUMEDI'
      FixedChar = True
      Size = 2
    end
    object qryFLGPREFIXONUMINS: TStringField
      FieldName = 'FLGPREFIXONUMINS'
      FixedChar = True
      Size = 2
    end
    object qryFLGAUTCOD: TStringField
      FieldName = 'FLGAUTCOD'
      Size = 1
    end
    object qryFLGVALCOD: TStringField
      FieldName = 'FLGVALCOD'
      Size = 1
    end
  end
  object qryLookUnidNegocio: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   UNIDNEGOC, NOME'
      'FROM'
      '   UNIDNEGOCIO'
      'WHERE'
      '   ( IDPESSOA =:EMPRESAPROP )'
      '   AND ( UNETIPO = '#39'A'#39' )'
      '   AND ( ATIVO = '#39'S'#39')'
      'ORDER BY'
      '  NOME')
    ValidateWithMask = True
    Left = 344
    Top = 296
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end>
    object qryLookUnidNegocioNOME: TStringField
      DisplayWidth = 25
      FieldName = 'NOME'
      Origin = 'UNIDNEGOCIO.NOME'
      Size = 25
    end
    object qryLookUnidNegocioUNIDNEGOC: TFloatField
      DisplayWidth = 10
      FieldName = 'UNIDNEGOC'
      Origin = 'UNIDNEGOCIO.UNIDNEGOC'
      Visible = False
    end
  end
  object qryLookCentroRespon: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  CODCENTRORESPON, NOME'
      'FROM'
      '  CENTRESPON'
      'WHERE ( IDPESSOA =:EMPRESAPROP )'
      '  AND ( ANALITICOSINTET = '#39'A'#39' )'
      '  AND ( ATIVO = '#39'S'#39')'
      'ORDER BY'
      '  NOME'
      ' ')
    ValidateWithMask = True
    Left = 504
    Top = 132
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end>
    object qryLookCentroResponNOME: TStringField
      DisplayWidth = 30
      FieldName = 'NOME'
      Origin = 'CENTRESPON.NOME'
      Size = 30
    end
    object qryLookCentroResponCODCENTRORESPON: TStringField
      DisplayWidth = 10
      FieldName = 'CODCENTRORESPON'
      Origin = 'CENTRESPON.CODCENTRORESPON'
      Visible = False
      Size = 10
    end
  end
  object qryLookPortadorForma: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  CODPORTFORMA, DESCRICAO, NVL(FLGATIVO,'#39'S'#39') AS FLGATIVO'
      'FROM'
      '  PORTADORFORMA'
      'WHERE'
      '  IDPESSOA =:EMPRESAPROP'
      'ORDER BY'
      '  DESCRICAO'
      ' ')
    ValidateWithMask = True
    Left = 432
    Top = 24
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EMPRESAPROP'
        ParamType = ptUnknown
      end>
    object qryLookPortadorFormaDESCRICAO: TStringField
      DisplayLabel = 'Forma de Cobrança'
      DisplayWidth = 50
      FieldName = 'DESCRICAO'
      Origin = 'PORTADORFORMA.DESCRICAO'
      Size = 50
    end
    object qryLookPortadorFormaFLGATIVO: TStringField
      DisplayLabel = 'Ativo'
      DisplayWidth = 1
      FieldName = 'FLGATIVO'
      Size = 1
    end
    object qryLookPortadorFormaCODPORTFORMA: TFloatField
      DisplayWidth = 10
      FieldName = 'CODPORTFORMA'
      Origin = 'PORTADORFORMA.CODPORTFORMA'
      Visible = False
    end
  end
  object qryParamGlobal: TwwQuery
    ValidateWithMask = True
    Left = 432
    Top = 12
  end
  object qryLookPrograma: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   P.IDPROGRAMA, P.CODPROGRAMA, P.DESCPROGRAMA'
      ''
      'FROM'
      '   PROGRAMA P'
      ''
      'ORDER BY'
      '   P.DESCPROGRAMA'
      ''
      '   ')
    ValidateWithMask = True
    Left = 432
    object qryLookProgramaDESCPROGRAMA: TStringField
      DisplayWidth = 60
      FieldName = 'DESCPROGRAMA'
      Origin = 'PROGRAMA.DESCPROGRAMA'
      Size = 60
    end
    object qryLookProgramaIDPROGRAMA: TFloatField
      FieldName = 'IDPROGRAMA'
      Origin = 'PROGRAMA.IDPROGRAMA'
      Visible = False
    end
    object qryLookProgramaCODPROGRAMA: TStringField
      FieldName = 'CODPROGRAMA'
      Origin = 'PROGRAMA.CODPROGRAMA'
      Visible = False
      Size = 2
    end
  end
  object qryLookDespAquisicao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   T.IDTIPOCUSTORECIMO, T.DESCCUSTORECIMO, T.RECCUSTO, T.CODTIPD' +
        'OC,'
      '   T.FLGOBRIGAORC, T.IDTIPODESPESA'
      ''
      'FROM'
      '   TIPOCUSTORECIMOV T'
      ''
      'WHERE'
      '   ( T.IDMODULO = 54 )'
      '   AND ( T.RECCUSTO = '#39'C'#39' )'
      '   AND ( IDTIPODESPESA IS NULL )'
      ''
      'ORDER BY'
      '   T.DESCCUSTORECIMO')
    ValidateWithMask = True
    Left = 449
    Top = 336
  end
  object qryLookRecAlienacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   T.IDTIPOCUSTORECIMO, T.DESCCUSTORECIMO, T.RECCUSTO, T.CODTIPD' +
        'OC,'
      '   T.FLGOBRIGAORC, T.IDTIPODESPESA'
      ''
      'FROM'
      '   TIPOCUSTORECIMOV T'
      ''
      'WHERE'
      '   ( T.IDMODULO = 54 )'
      '   AND ( T.RECCUSTO = '#39'R'#39' )'
      '   AND ( IDTIPODESPESA IS NULL )'
      ''
      'ORDER BY'
      '   T.DESCCUSTORECIMO'
      '')
    ValidateWithMask = True
    Left = 313
    Top = 328
  end
  object qryLookUnidNegocioPerdida: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  NOME'
      'FROM'
      '  UNIDNEGOCIO'
      'WHERE'
      '  ( UNIDNEGOC=:pUNIDNEGOC)'
      'ORDER BY'
      '  NOME'
      ' ')
    ValidateWithMask = True
    Left = 400
    Top = 296
    ParamData = <
      item
        DataType = ftFloat
        Name = 'pUNIDNEGOC'
        ParamType = ptInput
      end>
    object qryLookUnidNegocioPerdidaNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.UNIDNEGOCIO.NOME'
      Size = 25
    end
  end
end
