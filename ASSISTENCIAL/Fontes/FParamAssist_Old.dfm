inherited frmParamAssist: TfrmParamAssist
  Left = 24
  Top = 106
  BorderIcons = [biSystemMenu]
  BorderStyle = bsSingle
  Caption = 'Parâmetros do Sistema'
  ClientHeight = 393
  ClientWidth = 754
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  object Label13: TLabel [0]
    Left = 20
    Top = 213
    Width = 353
    Height = 13
    Caption = 'Motivo para Geração da Folha de BenefíciosCálculo  [default]'
  end
  inherited pnlFundo: TPanel
    Width = 754
    Height = 354
    TabOrder = 1
    object pgctrlParam: TPageControl
      Left = 1
      Top = 1
      Width = 752
      Height = 352
      ActivePage = tbsMotivos
      Align = alClient
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
      TabOrder = 0
      object tbsGeral: TTabSheet
        Caption = 'Gerais'
        object pnlGerais: TPanel
          Left = 0
          Top = 0
          Width = 744
          Height = 324
          Align = alClient
          BevelOuter = bvLowered
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object Panel1: TPanel
            Left = 1
            Top = 1
            Width = 742
            Height = 104
            Align = alTop
            TabOrder = 0
            object GroupBox3: TGroupBox
              Left = 1
              Top = 1
              Width = 740
              Height = 102
              Align = alClient
              Caption = 'Integração'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clBlack
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
              TabOrder = 0
              object chFLGINTCONTBASS: TDBCheckBox
                Left = 12
                Top = 22
                Width = 203
                Height = 17
                Caption = 'Integrado com Contabilidade'
                DataField = 'FLGINTCONTBASS'
                DataSource = ds
                TabOrder = 0
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object chFLGINTCPAGAR: TDBCheckBox
                Left = 12
                Top = 46
                Width = 205
                Height = 17
                Caption = 'Integrado com Contas a Pagar'
                DataField = 'FLGINTCPAGAR'
                DataSource = ds
                TabOrder = 1
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
              object chFLGINTCRECEBER: TDBCheckBox
                Left = 12
                Top = 70
                Width = 211
                Height = 17
                Caption = 'Integrado com Contas a Receber'
                DataField = 'FLGINTCRECEBER'
                DataSource = ds
                TabOrder = 2
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
            end
          end
          object Panel2: TPanel
            Left = 1
            Top = 215
            Width = 742
            Height = 108
            Align = alBottom
            TabOrder = 1
            object GroupBox1: TGroupBox
              Left = 1
              Top = 1
              Width = 367
              Height = 106
              Align = alClient
              Caption = '  Contribuições  '
              TabOrder = 0
              object Label2: TLabel
                Left = 27
                Top = 39
                Width = 308
                Height = 13
                Caption = '(quando participante é incluído no Plano Assistencial)'
              end
              object ChPrePag: TCheckBox
                Left = 9
                Top = 73
                Width = 329
                Height = 17
                Caption = 'Contribuição será cobrada antes do mês de referência.'
                TabOrder = 0
              end
              object chFLGCOBPRIMBCOASS: TDBCheckBox
                Left = 9
                Top = 14
                Width = 325
                Height = 27
                Caption = 'Primeira contribuição deve ser cobrada em banco'
                DataField = 'FLGCOBPRIMBCOASS'
                DataSource = ds
                TabOrder = 1
                ValueChecked = '1'
                ValueUnchecked = '0'
              end
            end
            object GroupBox2: TGroupBox
              Left = 368
              Top = 1
              Width = 373
              Height = 106
              Align = alRight
              Caption = ' Associação de Regras do Assistencial '
              TabOrder = 1
              object Label3: TLabel
                Left = 27
                Top = 39
                Width = 308
                Height = 13
                Caption = '(quando participante é incluído no Plano Assistencial)'
              end
              object wwDBLookupCombo1: TwwDBLookupCombo
                Left = 8
                Top = 66
                Width = 336
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'DESCPROGRAMA'#9'60'#9'Descrição'#9'F')
                LookupTable = qryPrograma
                LookupField = 'CODPROGRAMA'
                Options = [loTitles]
                ParentFont = False
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                AllowClearKey = False
              end
            end
          end
          object Panel3: TPanel
            Left = 1
            Top = 105
            Width = 742
            Height = 88
            Align = alTop
            TabOrder = 2
            object Panel4: TPanel
              Left = 1
              Top = 1
              Width = 740
              Height = 19
              Align = alTop
              BevelOuter = bvNone
              TabOrder = 0
              object cbCalcula: TCheckBox
                Left = 13
                Top = 2
                Width = 220
                Height = 17
                Caption = 'Contas a Pagar Calcula CPMF'
                TabOrder = 0
                OnClick = cbCalculaClick
              end
            end
            object pnlCentroCusto: TPanel
              Left = 1
              Top = 20
              Width = 740
              Height = 64
              Align = alTop
              BevelOuter = bvNone
              Enabled = False
              TabOrder = 1
              object GroupBox8: TGroupBox
                Left = 5
                Top = 9
                Width = 350
                Height = 47
                Caption = 'Programa'
                TabOrder = 0
                object dblkPrograma: TwwDBLookupCombo
                  Left = 8
                  Top = 18
                  Width = 336
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'DESCPROGRAMA'#9'60'#9'Descrição'#9'F')
                  LookupTable = qryPrograma
                  LookupField = 'CODPROGRAMA'
                  Options = [loTitles]
                  ParentFont = False
                  TabOrder = 0
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = False
                end
              end
              object GroupBox12: TGroupBox
                Left = 377
                Top = 9
                Width = 350
                Height = 47
                Caption = 'Centro de Custo'
                TabOrder = 1
                object dblkCentroCusto: TwwDBLookupCombo
                  Left = 8
                  Top = 18
                  Width = 336
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOME'#9'30'#9'Descrição'#9'F')
                  LookupTable = qryCentroCusto
                  LookupField = 'CODCENTROCUSTO'
                  ParentFont = False
                  TabOrder = 0
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = False
                end
              end
            end
          end
        end
      end
      object tbsMotivos: TTabSheet
        Caption = 'Motivos'
        object pnlMotivos: TPanel
          Left = 0
          Top = 0
          Width = 744
          Height = 324
          Align = alClient
          BevelOuter = bvLowered
          Caption = 'pnlMotivos'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
          object ScrollBox1: TScrollBox
            Left = 1
            Top = 1
            Width = 742
            Height = 322
            HorzScrollBar.Tracking = True
            Align = alClient
            TabOrder = 0
            object Label10: TLabel
              Left = 36
              Top = 33
              Width = 231
              Height = 13
              Caption = 'Cobrança de Contribuições Assistenciais'
            end
            object Label14: TLabel
              Left = 36
              Top = 255
              Width = 140
              Height = 13
              Caption = 'Comissão de Fornecedor'
            end
            object Label15: TLabel
              Left = 36
              Top = 212
              Width = 150
              Height = 13
              Caption = 'Pagamento de Fornecedor'
            end
            object Label34: TLabel
              Left = 36
              Top = 74
              Width = 115
              Height = 13
              Caption = 'Cobrança em Atraso'
            end
            object Label35: TLabel
              Left = 36
              Top = 159
              Width = 78
              Height = 13
              Caption = 'Parcelamento'
            end
            object Label36: TLabel
              Left = 36
              Top = 116
              Width = 211
              Height = 13
              Caption = 'Cálculo de Pagamento de Devolução'
            end
            object Label1: TLabel
              Left = 12
              Top = 9
              Width = 161
              Height = 20
              Caption = 'Motivo Padrão para:'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -16
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object cmbmotivocontribass: TwwDBLookupCombo
              Left = 36
              Top = 48
              Width = 310
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'50'#9'Motivo')
              DataField = 'IDMOTIVOCONTRIBA'
              DataSource = dsParamassist
              LookupTable = qryMotivo
              LookupField = 'IDMOTIVO'
              Options = [loColLines]
              ParentFont = False
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object wwDBLookupCombo5: TwwDBLookupCombo
              Left = 36
              Top = 227
              Width = 310
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'50'#9'Motivo')
              DataField = 'IDMOTIVOFORNPAG'
              DataSource = dsParamassist
              LookupTable = qryMotivo
              LookupField = 'IDMOTIVO'
              Options = [loColLines]
              ParentFont = False
              TabOrder = 4
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object wwDBLookupCombo6: TwwDBLookupCombo
              Left = 36
              Top = 270
              Width = 310
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'50'#9'Motivo')
              DataField = 'IDMOTIVOFORNCOMI'
              DataSource = dsParamassist
              LookupTable = qryMotivo
              LookupField = 'IDMOTIVO'
              Options = [loColLines]
              ParentFont = False
              TabOrder = 5
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object cmbmotivoatrasoas: TwwDBLookupCombo
              Left = 36
              Top = 89
              Width = 310
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'50'#9'Motivo')
              DataField = 'IDMOTIVOATRASOAS'
              DataSource = dsParamassist
              LookupTable = qryMotivo
              LookupField = 'IDMOTIVO'
              Options = [loColLines]
              ParentFont = False
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object cmbmotivodevolas: TwwDBLookupCombo
              Left = 36
              Top = 132
              Width = 310
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'50'#9'Motivo')
              DataField = 'IDMOTIVODEVOLAS'
              DataSource = dsParamassist
              LookupTable = qryMotivo
              LookupField = 'IDMOTIVO'
              Options = [loColLines]
              ParentFont = False
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object cmbmotivofinancas: TwwDBLookupCombo
              Left = 36
              Top = 175
              Width = 310
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'50'#9'Motivo')
              DataField = 'IDMOTIVOFINANCAS'
              DataSource = dsParamassist
              LookupTable = qryMotivo
              LookupField = 'IDMOTIVO'
              Options = [loColLines]
              Enabled = False
              ParentFont = False
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
          end
        end
      end
    end
  end
  inherited Dock971: TDock97
    Top = 354
    Width = 754
    inherited tb97Fundo: TToolbar97
      Left = 211
      DockPos = 211
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 42
      DockPos = 42
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 123
    Top = 403
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qry: TwwQuery
    BeforePost = qryBeforePost
    DatabaseName = 'BaseDados'
    RequestLive = True
    SQL.Strings = (
      'SELECT IDMOTIVOCONTRIBA,IDMOTIVOATRASOAS,IDMOTIVODEVOLAS,'
      'IDMOTIVOFINANCAS,IDMOTIVOFORNPAG,IDMOTIVOFORNCOMI,'
      'FLGINTCONTBASS,FLGINTCPAGAR,FLGINTCRECEBER,'
      'FLGCOBPRIMBCOASS, IDTIPOREGRA, IDGRUPOREGRA'
      'FROM PARAMAPREV')
    PictureMasks.Strings = (
      
        'MARGEMDESCONTOS'#9'{{{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,' +
        '-]#[#][#]]],({{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[' +
        '#][#]]]),[-]{{#[#][#]{{;,###*[;,###]},*#}[.*#]},.#*#}[E[[+,-]#[#' +
        '][#]]]}'#9'T'#9'F')
    ValidateWithMask = True
    Left = 558
    Top = 3
  end
  object ds: TwwDataSource
    DataSet = qry
    Left = 614
    Top = 2
  end
  object qryDescontos: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 455
    Top = 347
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 712
    Top = 348
  end
  object qryMotivo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT   IDMOTIVO,DESCRICAO'
      'FROM     MOTIVO'
      'WHERE FLGTIPO = '#39'A'#39
      'ORDER BY UPPER(DESCRICAO)')
    ValidateWithMask = True
    Left = 512
    Top = 347
  end
  object qryRegra: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT   IDREGRA,NOMEREGRA'
      'FROM     REGRA'
      'ORDER BY UPPER(NOMEREGRA)')
    ValidateWithMask = True
    Left = 399
    Top = 346
  end
  object qryParamAssist: TwwQuery
    DatabaseName = 'BaseDados'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM PARAMASSIST')
    ValidateWithMask = True
    Left = 500
    Top = 5
  end
  object qryCentroCusto: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODCENTROCUSTO,NOME||'#39' - '#39'||CODEXTERNO  as NOME'
      'FROM CENTCUST'
      'WHERE'
      '     (IDEMPRESA = :IEMPRESA)'
      
        '     AND (IDPLANCENTCUST = (SELECT IDPLANCENTCUST FROM PARAMGLOB' +
        'AL))'
      '     AND (ATIVO = '#39'S'#39')'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 643
    Top = 336
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IEMPRESA'
        ParamType = ptUnknown
      end>
  end
  object qryPrograma: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      IDPROGRAMA,'
      '      CODPROGRAMA,'
      '      DESCPROGRAMA'
      'FROM   PROGRAMA'
      'ORDER BY DESCPROGRAMA')
    ValidateWithMask = True
    Left = 659
    Top = 8
  end
  object dsParamassist: TwwDataSource
    DataSet = qryParamAssist
    Left = 358
    Top = 58
  end
  object qryTipoRegra: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDTIPOREGRA, DESCREGRA'
      'FROM TIPOREGRA'
      'ORDER BY DESCREGRA')
    ValidateWithMask = True
    Left = 472
    Top = 68
  end
  object qryGrupoRegra: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDGRUPOREGRA, DESCRICAO'
      'FROM GRUPOREGRA'
      'ORDER BY DESCRICAO')
    ValidateWithMask = True
    Left = 552
    Top = 68
  end
end
