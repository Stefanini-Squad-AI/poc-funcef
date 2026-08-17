inherited frmCadPatro: TfrmCadPatro
  Left = 40
  Top = 178
  HelpContext = 160126
  Caption = ''
  ClientHeight = 496
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 410
    inherited tbcDetalhe: TTabControlDetalhe
      Height = 303
      detdbGrids.Strings = (
        ''
        'dbGrdDet'
        'dbgTelefone'
        'dbgContato'
        '')
      inherited pgctrlDetalhe: TPageControl
        Height = 244
        ActivePage = tbsPatro
        inherited tbsDocumento: TTabSheet
          inherited PgCtrlPesFisica_Padrao: TPageControl
            Height = 216
          end
          inherited PnlDocumentos_Padrao: TPanel
            Height = 216
            inherited pnlItemsDoc: TPanel
              Height = 214
            end
            inherited pnlFoto: TPanel
              Height = 214
              Visible = False
              inherited Bevel1: TBevel
                Height = 183
              end
              inherited PnlAssociaFoto_Padrao: TPanel
                Top = 183
              end
              inherited SbImagePessoa_Padrao: TScrollBox
                Height = 183
              end
            end
            inherited lstDocumentos: TListView
              Height = 214
            end
          end
        end
        inherited tbsDet: TTabSheet
          inherited pnlControlesDet: TPanel
            Height = 216
            inherited grpTipoEnd: TGroupBox
              Height = 216
            end
          end
          inherited dbgrdDet: TwwDBGrid
            Height = 216
          end
        end
        inherited tbsTelefone: TTabSheet
          inherited dbgTelefone: TwwDBGrid
            Height = 216
          end
          inherited Panel1: TPanel
            Height = 216
          end
        end
        inherited tbsContato: TTabSheet
          inherited Panel2: TPanel
            Height = 216
          end
          inherited dbgContato: TwwDBGrid
            Height = 216
          end
        end
        object tbsPatro: TTabSheet
          Caption = 'Patrocinadora'
          object Panel3: TPanel
            Left = 0
            Top = 0
            Width = 696
            Height = 216
            Align = alClient
            BevelOuter = bvLowered
            TabOrder = 0
            object pgctrlPatrocinadora: TPageControl
              Left = 1
              Top = 1
              Width = 694
              Height = 214
              ActivePage = tbsInfGerais
              Align = alClient
              TabOrder = 0
              object tbsInfGerais: TTabSheet
                Caption = ' Informações Gerais'
                object lblFundacao: TLabel
                  Left = 12
                  Top = 14
                  Width = 57
                  Height = 13
                  Caption = 'Fundação'
                end
                object lblRegraMatricula: TLabel
                  Left = 12
                  Top = 52
                  Width = 189
                  Height = 13
                  Caption = 'Regra de Validação de Matrícula'
                end
                object Label2: TLabel
                  Left = 12
                  Top = 91
                  Width = 125
                  Height = 13
                  Caption = 'Mascara da Matrícula'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object Label3: TLabel
                  Left = 359
                  Top = 81
                  Width = 192
                  Height = 13
                  Caption = 'no Recebimento de Contribuições'
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clBlack
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = [fsBold]
                  ParentFont = False
                end
                object dblkpcmbFundacao: TwwDBLookupCombo
                  Left = 12
                  Top = 28
                  Width = 237
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOME'#9'60'#9'Fundação')
                  DataField = 'IDFUNDACAO'
                  DataSource = dsSubTipo
                  LookupTable = qryFundacao
                  LookupField = 'IDPESSOA'
                  Options = [loTitles]
                  Enabled = False
                  ParentFont = False
                  TabOrder = 0
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                end
                object dblkpcmbRegra: TwwDBLookupCombo
                  Left = 12
                  Top = 67
                  Width = 237
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOMEREGRA'#9'60'#9'Regra')
                  DataField = 'IDREGRAMATRICULA'
                  DataSource = dsSubTipo
                  LookupTable = qryRegra
                  LookupField = 'IDREGRA'
                  Options = [loColLines]
                  ParentFont = False
                  TabOrder = 1
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                end
                object sbtnOpcoes: TBitBtn
                  Left = 253
                  Top = 63
                  Width = 73
                  Height = 27
                  Hint = 'Verificar Regra de Concessão do Benefício'
                  Cancel = True
                  Caption = '&Opções'
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 2
                  OnClick = sbtnOpcoesClick
                  Glyph.Data = {
                    42010000424D4201000000000000760000002800000011000000110000000100
                    040000000000CC00000000000000000000001000000010000000000000000000
                    BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
                    FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
                    DDDDD0000000DDDDDDDDDDDDDDDDD0000000D00000DDDDD00000D0000000D0FF
                    F0DDDDD0FFF0D0000000D0FFF0DDDDD0FFF0D0000000D00000DD0DD00000D000
                    0000DDD0DDD0F0DDD0DDD0000000DDD0DD0FFF0DD0DDD0000000DDD000FFFFF0
                    00DDD0000000DDDDDD0FFF0DDDDDD0000000DDDDDDD0F0DDDDDDD0000000DDDD
                    DDDD0DDDDDDDD0000000DDDDDD00000DDDDDD0000000DDDDDD0FFF0DDDDDD000
                    0000DDDDDD0FFF0DDDDDD0000000DDDDDD00000DDDDDD0000000DDDDDDDDDDDD
                    DDDDD0000000}
                end
                object dbchkAceitaNaoID: TDBCheckBox
                  Left = 339
                  Top = 24
                  Width = 256
                  Height = 17
                  Hint = 
                    'Indica se incluirá as contribuições de pessoas não identificadas' +
                    ' no CAR da patrocinadora'
                  Caption = 'Considerar Não Identificados do Interface'
                  DataField = 'FLGACEITANAOID'
                  DataSource = dsSubTipo
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 3
                  ValueChecked = '1'
                  ValueUnchecked = '0'
                end
                object dbchkAlteraDados: TDBCheckBox
                  Left = 339
                  Top = 45
                  Width = 256
                  Height = 17
                  Hint = 
                    'Indica se os dados cadastrais dos participantes poderão ser alte' +
                    'rados pelo sistema'
                  Caption = 'Permitir Alteração de Dados Cadatrais'
                  DataField = 'FLGALTERADADOS'
                  DataSource = dsSubTipo
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 4
                  ValueChecked = '1'
                  ValueUnchecked = '0'
                end
                object dbeMascMat: TwwDBEdit
                  Left = 12
                  Top = 107
                  Width = 148
                  Height = 21
                  DataField = 'MASCMATRICULA'
                  DataSource = dsSubTipo
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -11
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  ParentFont = False
                  TabOrder = 5
                  UnboundDataType = wwDefault
                  WantReturns = False
                  WordWrap = False
                  OnExit = edDocNumDocumentoExit
                end
                object DBCheckBox1: TDBCheckBox
                  Left = 339
                  Top = 66
                  Width = 310
                  Height = 17
                  Hint = 
                    'Indica se os dados cadastrais dos participantes poderão ser alte' +
                    'rados pelo sistema'
                  Caption = 'Gerar Documento no Contas a Receber '
                  DataField = 'FLGGERACAR'
                  DataSource = dsSubTipo
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 6
                  ValueChecked = '1'
                  ValueUnchecked = '0'
                end
              end
              object TabSheet2: TTabSheet
                Caption = 'Rubricas'
                ImageIndex = 1
                object Label18: TLabel
                  Left = 2
                  Top = 0
                  Width = 139
                  Height = 13
                  Caption = 'Rubrica de Salário Total'
                end
                object Label17: TLabel
                  Left = 302
                  Top = 0
                  Width = 193
                  Height = 13
                  Caption = 'Regra de Cálculo do Salário Total'
                end
                object Label14: TLabel
                  Left = 2
                  Top = 38
                  Width = 203
                  Height = 13
                  Caption = 'Rubrica de Salário de Participação '
                end
                object lblRegraCalcSalPart: TLabel
                  Left = 302
                  Top = 38
                  Width = 253
                  Height = 13
                  Caption = 'Regra de Cálculo de Salário de Participação'
                end
                object Label13: TLabel
                  Left = 2
                  Top = 76
                  Width = 287
                  Height = 13
                  Caption = 'Rubrica de Salário de Participação para Benefício'
                end
                object Label15: TLabel
                  Left = 302
                  Top = 76
                  Width = 320
                  Height = 13
                  Caption = 'Regra de Cálculo de Salário de Participação (Benefício)'
                end
                object Label23: TLabel
                  Left = 2
                  Top = 114
                  Width = 245
                  Height = 13
                  Caption = 'Rubrica de Salário de Manutenção Integral'
                end
                object Label24: TLabel
                  Left = 302
                  Top = 114
                  Width = 241
                  Height = 13
                  Caption = 'Rubrica de Salário de Manutenção Parcial'
                end
                object Label20: TLabel
                  Left = 2
                  Top = 152
                  Width = 146
                  Height = 13
                  Caption = 'Rubrica de Salário Virtual'
                end
                object dblkpcmbRubRemTotal: TwwDBLookupCombo
                  Left = 2
                  Top = 14
                  Width = 287
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'DESCRICAO'#9'130'#9'Rubrica')
                  DataField = 'IDRUBREMTOTAL'
                  DataSource = dsSubTipo
                  LookupTable = qryRubrica
                  LookupField = 'IDPROVENTO'
                  Options = [loTitles]
                  ParentFont = False
                  TabOrder = 0
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                end
                object dblkpcmbRegRemTotal: TwwDBLookupCombo
                  Left = 302
                  Top = 14
                  Width = 287
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOMEREGRA'#9'60'#9'Regra')
                  DataField = 'IDREGRAREMTOTAL'
                  DataSource = dsSubTipo
                  LookupTable = qryRegra
                  LookupField = 'IDREGRA'
                  Options = [loTitles]
                  ParentFont = False
                  TabOrder = 1
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                end
                object dblkpcmbRubSalPartic: TwwDBLookupCombo
                  Left = 2
                  Top = 52
                  Width = 287
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'DESCRICAO'#9'130'#9'Rubrica')
                  DataField = 'IDRUBSALPARTICIP'
                  DataSource = dsSubTipo
                  LookupTable = qryRubrica
                  LookupField = 'IDPROVENTO'
                  Options = [loTitles]
                  ParentFont = False
                  TabOrder = 2
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                end
                object dblkpcmbRegraSalPart: TwwDBLookupCombo
                  Left = 302
                  Top = 52
                  Width = 287
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOMEREGRA'#9'60'#9'Regra')
                  DataField = 'IDREGRACALCSALPA'
                  DataSource = dsSubTipo
                  LookupTable = qryRegra
                  LookupField = 'IDREGRA'
                  Options = [loTitles]
                  ParentFont = False
                  TabOrder = 3
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                end
                object dblkpcmbRubSalBeneficio: TwwDBLookupCombo
                  Left = 2
                  Top = 90
                  Width = 287
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'DESCRICAO'#9'130'#9'Rubrica')
                  DataField = 'IDRUBSALBENEFICIO'
                  DataSource = dsSubTipo
                  LookupTable = qryRubrica
                  LookupField = 'IDPROVENTO'
                  Options = [loTitles]
                  ParentFont = False
                  TabOrder = 4
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                end
                object dblkpcmbRegraSalBeneficio: TwwDBLookupCombo
                  Left = 302
                  Top = 90
                  Width = 287
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'NOMEREGRA'#9'60'#9'Regra')
                  DataField = 'IDREGRASALBENEFI'
                  DataSource = dsSubTipo
                  LookupTable = qryRegra
                  LookupField = 'IDREGRA'
                  Options = [loTitles]
                  ParentFont = False
                  TabOrder = 5
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                end
                object dblkpcmbRubManut: TwwDBLookupCombo
                  Left = 2
                  Top = 128
                  Width = 287
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'DESCRICAO'#9'130'#9'Rubrica')
                  DataField = 'IDRUBSALMANUT'
                  DataSource = dsSubTipo
                  LookupTable = qryRubrica
                  LookupField = 'IDPROVENTO'
                  Options = [loTitles]
                  ParentFont = False
                  TabOrder = 6
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                end
                object dblkpcmbManutParc: TwwDBLookupCombo
                  Left = 302
                  Top = 128
                  Width = 287
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'DESCRICAO'#9'130'#9'Rubrica')
                  DataField = 'IDRUBSALMANUTPARC'
                  DataSource = dsSubTipo
                  LookupTable = qryRubrica
                  LookupField = 'IDPROVENTO'
                  Options = [loTitles]
                  ParentFont = False
                  TabOrder = 7
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                end
                object dblkpcmbSalBenefAuxDoenca: TwwDBLookupCombo
                  Left = 2
                  Top = 166
                  Width = 287
                  Height = 21
                  Font.Charset = DEFAULT_CHARSET
                  Font.Color = clWindowText
                  Font.Height = -9
                  Font.Name = 'MS Sans Serif'
                  Font.Style = []
                  DropDownAlignment = taLeftJustify
                  Selected.Strings = (
                    'DESCRICAO'#9'130'#9'Rubrica')
                  DataField = 'IDRUBSALAUXDOENCA'
                  DataSource = dsSubTipo
                  LookupTable = qryRubrica
                  LookupField = 'IDPROVENTO'
                  Options = [loTitles]
                  ParentFont = False
                  TabOrder = 8
                  AutoDropDown = True
                  ShowButton = True
                  AllowClearKey = True
                end
              end
              object TabSheet3: TTabSheet
                Caption = 'Tratamento de Exceções'
                ImageIndex = 2
                object DBCheckBox2: TDBCheckBox
                  Left = 12
                  Top = 15
                  Width = 634
                  Height = 17
                  Hint = 
                    'Indica se incluirá as contribuições de pessoas não identificadas' +
                    ' no CAR da patrocinadora'
                  Caption = 
                    'Permitir ALTERAÇÃO/EXCLUSÃO de dados da Evolução Funcional gerad' +
                    'os por Importação'
                  DataField = 'FLGALTEVOLFUNC'
                  DataSource = dsSubTipo
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 0
                  ValueChecked = '1'
                  ValueUnchecked = '0'
                end
                object DBCheckBox3: TDBCheckBox
                  Left = 12
                  Top = 39
                  Width = 577
                  Height = 17
                  Hint = 
                    'Indica se incluirá as contribuições de pessoas não identificadas' +
                    ' no CAR da patrocinadora'
                  Caption = 
                    'Permitir ALTERAÇÃO/EXCLUSÃO do Histórico de Contribuições já rec' +
                    'ebidas'
                  DataField = 'FLGALTHSTCONT'
                  DataSource = dsSubTipo
                  ParentShowHint = False
                  ShowHint = True
                  TabOrder = 1
                  ValueChecked = '1'
                  ValueUnchecked = '0'
                end
              end
            end
          end
        end
      end
      inherited Dock974: TDock97
        Height = 244
      end
    end
    inherited pnlMestre: TPanel
      inherited lblDocumento: TLabel
        Width = 78
        Caption = 'lblDocumento'
      end
      inherited lblEMail: TLabel
        Left = 443
      end
      inherited lblPdGrupo: TLabel
        Left = 443
      end
      object Label26: TLabel [5]
        Left = 723
        Top = 8
        Width = 40
        Height = 13
        Caption = 'Código'
      end
      inherited SpeedButton1: TSpeedButton
        Left = 747
      end
      inherited LblHomePage_Padrao: TLabel
        Left = 577
      end
      inherited dbedemail: TwwDBEdit
        Left = 443
      end
      inherited edDBGrupo: TwwDBEdit
        Left = 443
        TabOrder = 6
      end
      inherited DbeHomePage_Padrao: TwwDBEdit
        Left = 577
        Width = 143
      end
      object TDBEdit
        Left = 723
        Top = 23
        Width = 64
        Height = 21
        Color = clSilver
        DataField = 'IDPESSOA'
        DataSource = ds
        Enabled = False
        ReadOnly = True
        TabOrder = 5
      end
    end
  end
  inherited Dock971: TDock97
    Top = 457
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 769
    Top = 1
  end
  inherited dsDet: TwwDataSource
    DataSet = frmPessoa.qryEndereco
    Left = 486
    Top = 479
  end
  inherited ds: TwwDataSource
    OnStateChange = dsStateChange
    Left = 432
    Top = 5
  end
  inherited upd: TUpdateSQL
    Left = 490
    Top = 6
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PESSOA.NOME')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Nome da Patrocinadora')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'PATRO')
    CamposChave.Strings = (
      'PATRO.IDPESSOA')
    Filtro.Strings = (
      'PATRO.IDPESSOA = PESSOA.IDPESSOA')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    ExibePergunta = False
    Left = 348
    Top = 8
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 375
  end
  inherited qry: TwwQuery
    AfterScroll = qryAfterScroll
    Left = 389
    Top = 5
    Data = {
      56657220322E302C514245202D20496E74656772612056697375616C20446174
      6162617365204275696C6465722C302C2031302C20313630302C20313136342C
      2C2C2C2C0D0A202C202C202D2044697374696E637420262051756F74652C2C2C
      2C2C0D0A20202020312C202D204E756D626572206F66205461626C65732C2D31
      2C202D312C203830382C203630302C203830302C203236382C2C2C2C0D0A5045
      53534F412C504553534F412C32302C2031302C203430342C203235352C2C2C2C
      2C0D0A20202032312C202D204E756D626572206F6620436F6C756D6E732C2C2C
      2C2C2C0D0A4E4F4D452C504553534F412C202020202020202020202020202020
      20202020312C20202020202C202C2C2C0D0A20202020202C202D204E756D6265
      72206F662043726974657269612C2C2C2C2C2C0D0A5449504F2C504553534F41
      2C20202020202020202020202020202020202020312C20202020202C202C2C2C
      0D0A20202020202C202D204E756D626572206F662043726974657269612C2C2C
      2C2C2C0D0A4944504553534F412C504553534F412C2020202020202020202020
      2020202020202020312C20202020202C202C2C2C0D0A20202020312C202D204E
      756D626572206F662043726974657269612C2C2C2C2C2C0D0A3D3A4964506573
      736F612C20202020362C2C2C2C2C2C0D0A52415A414F534F4349414C2C504553
      534F412C20202020202020202020202020202020202020312C20202020202C20
      2C2C2C0D0A20202020202C202D204E756D626572206F66204372697465726961
      2C2C2C2C2C2C0D0A4E554D444F43554D454E544F2C504553534F412C20202020
      202020202020202020202020202020312C20202020202C202C2C2C0D0A202020
      20202C202D204E756D626572206F662043726974657269612C2C2C2C2C2C0D0A
      4944444F43554D454E544F2C504553534F412C20202020202020202020202020
      202020202020312C20202020202C202C2C2C0D0A20202020202C202D204E756D
      626572206F662043726974657269612C2C2C2C2C2C0D0A454D41494C2C504553
      534F412C20202020202020202020202020202020202020312C20202020202C20
      2C2C2C0D0A20202020202C202D204E756D626572206F66204372697465726961
      2C2C2C2C2C2C0D0A4944475255504F2C504553534F412C202020202020202020
      20202020202020202020312C20202020202C202C2C2C0D0A20202020202C202D
      204E756D626572206F662043726974657269612C2C2C2C2C2C0D0A464C47434C
      49454E54452C504553534F412C20202020202020202020202020202020202020
      312C20202020202C202C2C2C0D0A20202020202C202D204E756D626572206F66
      2043726974657269612C2C2C2C2C2C0D0A464C47504154524F43494E41444F52
      412C504553534F412C20202020202020202020202020202020202020312C2020
      2020202C202C2C2C0D0A20202020202C202D204E756D626572206F6620437269
      74657269612C2C2C2C2C2C0D0A464C4742414E434F2C504553534F412C202020
      20202020202020202020202020202020312C20202020202C202C2C2C0D0A2020
      2020202C202D204E756D626572206F662043726974657269612C2C2C2C2C2C0D
      0A464C4753494E44494341544F2C504553534F412C2020202020202020202020
      2020202020202020312C20202020202C202C2C2C0D0A20202020202C202D204E
      756D626572206F662043726974657269612C2C2C2C2C2C0D0A464C4752455350
      4F4E534156454C2C504553534F412C2020202020202020202020202020202020
      2020312C20202020202C202C2C2C0D0A20202020202C202D204E756D62657220
      6F662043726974657269612C2C2C2C2C2C0D0A464C47544552434549524F2C50
      4553534F412C20202020202020202020202020202020202020312C2020202020
      2C202C2C2C0D0A20202020202C202D204E756D626572206F6620437269746572
      69612C2C2C2C2C2C0D0A464C47464F524E534552562C504553534F412C202020
      20202020202020202020202020202020312C20202020202C202C2C2C0D0A2020
      2020202C202D204E756D626572206F662043726974657269612C2C2C2C2C2C0D
      0A464C4746554E43494F4E4152494F2C504553534F412C202020202020202020
      20202020202020202020312C20202020202C202C2C2C0D0A20202020202C202D
      204E756D626572206F662043726974657269612C2C2C2C2C2C0D0A464C474553
      5452414E474549524F2C504553534F412C202020202020202020202020202020
      20202020312C20202020202C202C2C2C0D0A20202020202C202D204E756D6265
      72206F662043726974657269612C2C2C2C2C2C0D0A464C474147454E4349412C
      504553534F412C20202020202020202020202020202020202020312C20202020
      202C202C2C2C0D0A20202020202C202D204E756D626572206F66204372697465
      7269612C2C2C2C2C2C0D0A464C4746554E444143414F2C504553534F412C2020
      2020202020202020202020202020202020312C20202020202C202C2C2C0D0A20
      202020202C202D204E756D626572206F662043726974657269612C2C2C2C2C2C
      0D0A464C47444550454E44454E54452C504553534F412C202020202020202020
      20202020202020202020312C20202020202C202C2C2C0D0A20202020202C202D
      204E756D626572206F662043726974657269612C2C2C2C2C2C0D0A464C47454C
      45474956454C2C504553534F412C202020202020202020202020202020202020
      20312C20202020202C202C2C2C0D0A20202020202C202D204E756D626572206F
      662043726974657269612C2C2C2C2C2C0D0A20202020202C202D204E756D6265
      72206F66204A6F696E732C2C2C2C2C2C0D0A0D0A2253454C4543542053746174
      656D656E74220D0A2C2C2C2C2C2C2C0D0A53454C45435409504553534F412E22
      4E4F4D4522202C20504553534F412E225449504F22202C200D0A09504553534F
      412E224944504553534F4122202C200D0A09504553534F412E2252415A414F53
      4F4349414C22202C200D0A09504553534F412E224E554D444F43554D454E544F
      22202C200D0A09504553534F412E224944444F43554D454E544F22202C205045
      53534F412E22454D41494C22202C200D0A09504553534F412E22494447525550
      4F22202C20504553534F412E22464C47434C49454E544522202C200D0A095045
      53534F412E22464C47504154524F43494E41444F524122202C200D0A09504553
      534F412E22464C4742414E434F22202C200D0A09504553534F412E22464C4753
      494E44494341544F22202C200D0A09504553534F412E22464C47524553504F4E
      534156454C22202C200D0A09504553534F412E22464C47544552434549524F22
      202C200D0A09504553534F412E22464C47464F524E5345525622202C200D0A09
      504553534F412E22464C4746554E43494F4E4152494F22202C200D0A09504553
      534F412E22464C4745535452414E474549524F22202C200D0A09504553534F41
      2E22464C474147454E43494122202C200D0A09504553534F412E22464C474655
      4E444143414F22202C200D0A09504553534F412E22464C47444550454E44454E
      544522202C200D0A09504553534F412E2C2C2C2C2C2C2C0D0A22464C47454C45
      474956454C220D0A46524F4D0922504553534F412220504553534F410D0A5748
      455245092820504553534F412E224944504553534F4122203D3A496450657373
      6F6120292C2C2C2C2C2C2C0D0A}
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IdPessoa'
        ParamType = ptUnknown
        Value = 1
      end>
  end
  inherited updSubTipo: TUpdateSQL
    ModifySQL.Strings = (
      'update PATRO'
      'set'
      '  IDFUNDACAO = :IDFUNDACAO,'
      '  IDREGRAMATRICULA = :IDREGRAMATRICULA,'
      '  IDREGRACALCSALPA = :IDREGRACALCSALPA,'
      '  IDRUBSALPARTICIP = :IDRUBSALPARTICIP,'
      '  IDRUBSALBENEFICIO = :IDRUBSALBENEFICIO,'
      '  IDREGRASALBENEFI = :IDREGRASALBENEFI,'
      '  IDRUBREMTOTAL = :IDRUBREMTOTAL,'
      '  IDREGRAREMTOTAL = :IDREGRAREMTOTAL,'
      '  IDRUBSALMANUT = :IDRUBSALMANUT,'
      '  IDRUBSALMANUTPARC = :IDRUBSALMANUTPARC,'
      '  IDRUBSALAUXDOENCA = :IDRUBSALAUXDOENCA,'
      '  NUMOPCOES = :NUMOPCOES,'
      '  NOMEVALORBASE1 = :NOMEVALORBASE1,'
      '  NOMEVALORBASE2 = :NOMEVALORBASE2,'
      '  NOMEVALORBASE3 = :NOMEVALORBASE3,'
      '  FLGOBRIGAOP1 = :FLGOBRIGAOP1,'
      '  FLGOBRIGAOP2 = :FLGOBRIGAOP2,'
      '  FLGOBRIGAOP3 = :FLGOBRIGAOP3,'
      '  FLGEDITAOP1 = :FLGEDITAOP1,'
      '  FLGEDITAOP2 = :FLGEDITAOP2,'
      '  FLGEDITAOP3 = :FLGEDITAOP3,'
      '  IDREGRACALCOP1 = :IDREGRACALCOP1,'
      '  IDREGRACALCOP2 = :IDREGRACALCOP2,'
      '  IDREGRACALCOP3 = :IDREGRACALCOP3,'
      '  IDREGRAVALIDAOP1 = :IDREGRAVALIDAOP1,'
      '  IDREGRAVALIDAOP2 = :IDREGRAVALIDAOP2,'
      '  IDREGRAVALIDAOP3 = :IDREGRAVALIDAOP3,'
      '  NOMEVALORBASE4 = :NOMEVALORBASE4,'
      '  NOMEVALORBASE5 = :NOMEVALORBASE5,'
      '  NOMEVALORBASE6 = :NOMEVALORBASE6,'
      '  FLGOBRIGAOP4 = :FLGOBRIGAOP4,'
      '  FLGOBRIGAOP5 = :FLGOBRIGAOP5,'
      '  FLGOBRIGAOP6 = :FLGOBRIGAOP6,'
      '  FLGEDITAOP4 = :FLGEDITAOP4,'
      '  FLGEDITAOP5 = :FLGEDITAOP5,'
      '  FLGEDITAOP6 = :FLGEDITAOP6,'
      '  IDREGRACALCOP4 = :IDREGRACALCOP4,'
      '  IDREGRACALCOP5 = :IDREGRACALCOP5,'
      '  IDREGRACALCOP6 = :IDREGRACALCOP6,'
      '  IDREGRAVALIDAOP4 = :IDREGRAVALIDAOP4,'
      '  IDREGRAVALIDAOP5 = :IDREGRAVALIDAOP5,'
      '  IDREGRAVALIDAOP6 = :IDREGRAVALIDAOP6,'
      '  FLGACEITANAOID = :FLGACEITANAOID,'
      '  FLGANO13 = :FLGANO13,'
      '  FLGALTERADADOS = :FLGALTERADADOS,'
      '  MASCMATRICULA = :MASCMATRICULA,'
      '  FLGGERACAR = :FLGGERACAR,'
      '  FLGALTEVOLFUNC = :FLGALTEVOLFUNC,'
      '  FLGALTHSTCONT = :FLGALTHSTCONT'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into PATRO'
      
        '  (IDPESSOA, IDFUNDACAO, IDREGRAMATRICULA, IDREGRACALCSALPA, IDR' +
        'UBSALPARTICIP, '
      
        '   IDRUBSALBENEFICIO, IDREGRASALBENEFI, IDRUBREMTOTAL, IDREGRARE' +
        'MTOTAL, '
      
        '   IDRUBSALMANUT, IDRUBSALMANUTPARC, IDRUBSALAUXDOENCA, NUMOPCOE' +
        'S, NOMEVALORBASE1, '
      
        '   NOMEVALORBASE2, NOMEVALORBASE3, FLGOBRIGAOP1, FLGOBRIGAOP2, F' +
        'LGOBRIGAOP3, '
      
        '   FLGEDITAOP1, FLGEDITAOP2, FLGEDITAOP3, IDREGRACALCOP1, IDREGR' +
        'ACALCOP2, '
      
        '   IDREGRACALCOP3, IDREGRAVALIDAOP1, IDREGRAVALIDAOP2, IDREGRAVA' +
        'LIDAOP3, '
      
        '   NOMEVALORBASE4, NOMEVALORBASE5, NOMEVALORBASE6, FLGOBRIGAOP4,' +
        ' FLGOBRIGAOP5, '
      
        '   FLGOBRIGAOP6, FLGEDITAOP4, FLGEDITAOP5, FLGEDITAOP6, IDREGRAC' +
        'ALCOP4, '
      
        '   IDREGRACALCOP5, IDREGRACALCOP6, IDREGRAVALIDAOP4, IDREGRAVALI' +
        'DAOP5, '
      
        '   IDREGRAVALIDAOP6, FLGACEITANAOID, FLGANO13, FLGALTERADADOS, M' +
        'ASCMATRICULA, '
      '   FLGGERACAR, FLGALTEVOLFUNC, FLGALTHSTCONT)'
      'values'
      
        '  (:IDPESSOA, :IDFUNDACAO, :IDREGRAMATRICULA, :IDREGRACALCSALPA,' +
        ' :IDRUBSALPARTICIP, '
      
        '   :IDRUBSALBENEFICIO, :IDREGRASALBENEFI, :IDRUBREMTOTAL, :IDREG' +
        'RAREMTOTAL, '
      
        '   :IDRUBSALMANUT, :IDRUBSALMANUTPARC, :IDRUBSALAUXDOENCA, :NUMO' +
        'PCOES, '
      
        '   :NOMEVALORBASE1, :NOMEVALORBASE2, :NOMEVALORBASE3, :FLGOBRIGA' +
        'OP1, :FLGOBRIGAOP2, '
      
        '   :FLGOBRIGAOP3, :FLGEDITAOP1, :FLGEDITAOP2, :FLGEDITAOP3, :IDR' +
        'EGRACALCOP1, '
      
        '   :IDREGRACALCOP2, :IDREGRACALCOP3, :IDREGRAVALIDAOP1, :IDREGRA' +
        'VALIDAOP2, '
      
        '   :IDREGRAVALIDAOP3, :NOMEVALORBASE4, :NOMEVALORBASE5, :NOMEVAL' +
        'ORBASE6, '
      
        '   :FLGOBRIGAOP4, :FLGOBRIGAOP5, :FLGOBRIGAOP6, :FLGEDITAOP4, :F' +
        'LGEDITAOP5, '
      
        '   :FLGEDITAOP6, :IDREGRACALCOP4, :IDREGRACALCOP5, :IDREGRACALCO' +
        'P6, :IDREGRAVALIDAOP4, '
      
        '   :IDREGRAVALIDAOP5, :IDREGRAVALIDAOP6, :FLGACEITANAOID, :FLGAN' +
        'O13, :FLGALTERADADOS, '
      '   :MASCMATRICULA, :FLGGERACAR, :FLGALTEVOLFUNC, :FLGALTHSTCONT)')
    DeleteSQL.Strings = (
      'delete from PATRO'
      'where'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 629
    Top = 456
  end
  inherited qrySubTipo: TwwQuery
    BeforePost = qrySubTipoBeforePost
    SQL.Strings = (
      
        'SELECT  IDPESSOA,    IDFUNDACAO,   IDREGRAMATRICULA,   IDREGRACA' +
        'LCSALPA,'
      '  IDRUBSALPARTICIP,  IDRUBSALBENEFICIO,  IDREGRASALBENEFI,'
      '  IDRUBREMTOTAL,     IDREGRAREMTOTAL,'
      '  IDRUBSALMANUT,      IDRUBSALMANUTPARC,'
      '  IDRUBSALAUXDOENCA,'
      '  NUMOPCOES,'
      '  NOMEVALORBASE1, NOMEVALORBASE2,    NOMEVALORBASE3,'
      '  FLGOBRIGAOP1, FLGOBRIGAOP2,      FLGOBRIGAOP3,'
      '  FLGEDITAOP1,  FLGEDITAOP2,       FLGEDITAOP3,'
      '  IDREGRACALCOP1,  IDREGRACALCOP2,    IDREGRACALCOP3,'
      '  IDREGRAVALIDAOP1,  IDREGRAVALIDAOP2,  IDREGRAVALIDAOP3,'
      '  NOMEVALORBASE4, NOMEVALORBASE5,    NOMEVALORBASE6,'
      '  FLGOBRIGAOP4, FLGOBRIGAOP5,      FLGOBRIGAOP6,'
      '  FLGEDITAOP4,  FLGEDITAOP5,       FLGEDITAOP6,'
      '  IDREGRACALCOP4,  IDREGRACALCOP5,    IDREGRACALCOP6,'
      '  IDREGRAVALIDAOP4,  IDREGRAVALIDAOP5,  IDREGRAVALIDAOP6,'
      '  FLGACEITANAOID,     FLGANO13, FLGALTERADADOS,'
      '  MASCMATRICULA, FLGGERACAR, FLGALTEVOLFUNC, FLGALTHSTCONT'
      'FROM PATRO'
      'WHERE IDPESSOA = :IDPESSOA')
    Left = 557
    Top = 456
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
  inherited dsSubTipo: TwwDataSource
    Left = 683
    Top = 459
  end
  object qryFundacao: TwwQuery [15]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.IDPESSOA,P.NOME'
      'FROM PESSOA P, FUNDACAO F'
      'WHERE F.IDPESSOA = P.IDPESSOA'
      'ORDER BY P.NOME')
    ValidateWithMask = True
    Left = 452
    Top = 183
  end
  inherited dsPessoaFisica: TwwDataSource
    Left = 593
  end
  inherited ImageList1: TImageList
    Left = 157
    Top = 452
    Bitmap = {
      494C010110001400040010001000FFFFFFFFFF10FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000005000000001002000000000000050
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF000000000000000000FFFFFF000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF000000000000000000FFFFFF000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C60000000000FFFFFF000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000084848400000000000000000084848400848484008484
      840000000000000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000084848400000000000000000084848400848484008484
      840000000000000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840000000000848484000000000084848400C6C6C600848484008484
      840084848400000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840000000000848484000000000084848400C6C6C600848484008484
      840084848400000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      00000000000000000000848484000000000084848400FFFFFF00848484008484
      840084848400000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      00000000000000000000848484000000000084848400FFFFFF00848484008484
      840084848400000000008484840000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FFFFFF00000000000000000084848400848484008484
      84000000000000000000FFFFFF0000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FFFFFF00000000000000000084848400848484008484
      84000000000000000000FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF000000000000000000FFFFFF000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF000000000000000000FFFFFF000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C60000000000FFFFFF000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000084848400000000000000000084848400848484008484
      840000000000000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000084848400000000000000000084848400848484008484
      840000000000000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840000000000848484000000000084848400C6C6C600848484008484
      840084848400000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840000000000848484000000000084848400C6C6C600848484008484
      840084848400000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      00000000000000000000848484000000000084848400FFFFFF00848484008484
      840084848400000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      00000000000000000000848484000000000084848400FFFFFF00848484008484
      840084848400000000008484840000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FFFFFF00000000000000000084848400848484008484
      84000000000000000000FFFFFF0000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FFFFFF00000000000000000084848400848484008484
      84000000000000000000FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF000000000000000000FFFFFF000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF000000000000000000FFFFFF000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C60000000000FFFFFF000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000084848400000000000000000084848400848484008484
      840000000000000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000084848400000000000000000084848400848484008484
      840000000000000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840000000000848484000000000084848400C6C6C600848484008484
      840084848400000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840000000000848484000000000084848400C6C6C600848484008484
      840084848400000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      00000000000000000000848484000000000084848400FFFFFF00848484008484
      840084848400000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      00000000000000000000848484000000000084848400FFFFFF00848484008484
      840084848400000000008484840000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FFFFFF00000000000000000084848400848484008484
      84000000000000000000FFFFFF0000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FFFFFF00000000000000000084848400848484008484
      84000000000000000000FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      8400848484008484840084848400000000000000000084848400848484008484
      8400848484008484840084848400848484008484840084848400848484008484
      840084848400848484008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF008400
      0000840000008400000084000000FFFFFF0000000000FFFFFF00000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF000000000000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF000000000000000000FFFFFF000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF000000000000000000FFFFFF000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000000000000000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C60000000000FFFFFF000000
      0000000084000000840000000000FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000084000000840000000000000000000000000000000000000000000000
      000000000000000000000000000084848400C6C6C60000000000FFFFFF000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000084848400000000000000000084848400848484008484
      840000000000000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000000000000FFFFFF000000000000000000000000000000
      0000FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF000000
      0000000000000000000084848400000000000000000084848400848484008484
      840000000000000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840000000000848484000000000084848400C6C6C600848484008484
      840084848400000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840084848400FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFFFF00FFFF
      FF00FFFFFF00000000008484840000000000C6C6C60000000000FFFFFF00FFFF
      FF008484840000000000848484000000000084848400C6C6C600848484008484
      840084848400000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      00000000000000000000848484000000000084848400FFFFFF00848484008484
      840084848400000000008484840000000000C6C6C60000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000008484840000000000C6C6C60000000000000000000000
      00000000000000000000848484000000000084848400FFFFFF00848484008484
      840084848400000000008484840000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FFFFFF00000000000000000084848400848484008484
      84000000000000000000FFFFFF0000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C600000000000000000000000000000000000000000084848400C6C6
      C600C6C6C600C6C6C6000000000000000000C6C6C600C6C6C600C6C6C600C6C6
      C600C6C6C60000000000FFFFFF00000000000000000084848400848484008484
      84000000000000000000FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000FFFFFF00FFFFFF000000000000000000000000000000
      000000000000FFFFFF00FFFFFF00000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C6000000000000000000000000000000000000000000848484000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600C6C6C600000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000008484840000000000FFFFFF000000
      0000848484000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      8400000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000084848400000000008484
      840000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000500000000100010000000000800200000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000FFFFFFFFFFFFFFFF8001800180018001
      0001000100010001000100010001000100010001000100010001000100010001
      0001000300010003000100000001000000010000000100000001000000010000
      00010000000100000003000000030000F39FF800F39FF800F01FF800F01FF800
      F03FFD05F03FFD05FFFFFF8FFFFFFF8FFFFFFFFFFFFFFFFF8001800180018001
      0001000100010001000100010001000100010001000100010001000100010001
      0001000300010003000100000001000000010000000100000001000000010000
      00010000000100000003000000030000F39FF800F39FF800F01FF800F01FF800
      F03FFD05F03FFD05FFFFFF8FFFFFFF8FFFFFFFFFFFFFFFFF8001800180018001
      0001000100010001000100010001000100010001000100010001000100010001
      0001000300010003000100000001000000010000000100000001000000010000
      00010000000100000003000000030000F39FF800F39FF800F01FF800F01FF800
      F03FFD05F03FFD05FFFFFF8FFFFFFF8FFFFFFFFFFFFFFFFF8001800180018001
      0001000100010001000100010001000100010001000100010001000100010001
      0001000300010003000100000001000000010000000100000001000000010000
      00010000000100000003000000030000F39FF800F39FF800F01FF800F01FF800
      F03FFD05F03FFD05FFFFFF8FFFFFFF8F00000000000000000000000000000000
      000000000000}
  end
  inherited qryTelefone: TwwQuery
    Left = 731
    Data = {
      56657220322E302C514245202D20496E74656772612056697375616C20446174
      6162617365204275696C6465722C302C2031302C20313630302C20313136342C
      2C2C2C2C0D0A202C202C202D2044697374696E637420262051756F74652C2C2C
      2C2C0D0A20202020322C202D204E756D626572206F66205461626C65732C2D31
      2C202D312C203830382C203630302C203830302C203238392C2C2C2C0D0A434D
      2E54454C454E44504553532C54454C454E44504553532C32302C2031302C2031
      33302C203133352C2C2C2C2C0D0A434D2E454E44504553532C454E4450455353
      2C3135302C2032302C203236302C203134352C2C2C2C2C0D0A20202020372C20
      2D204E756D626572206F6620436F6C756D6E732C2C2C2C2C2C0D0A494454454C
      45464F4E452C54454C454E44504553532C202020202020202020202020202020
      20202020312C20202020202C202C2C2C0D0A20202020202C202D204E756D6265
      72206F662043726974657269612C2C2C2C2C2C0D0A4944504553534F412C454E
      44504553532C20202020202020202020202020202020202020312C2020202020
      2C202C2C2C0D0A20202020312C202D204E756D626572206F6620437269746572
      69612C2C2C2C2C2C0D0A3D3A4964506573736F612C20202020362C2C2C2C2C2C
      0D0A4944454E44455245434F2C54454C454E44504553532C2020202020202020
      2020202020202020202020312C20202020202C202C2C2C0D0A20202020202C20
      2D204E756D626572206F662043726974657269612C2C2C2C2C2C0D0A4444492C
      54454C454E44504553532C20202020202020202020202020202020202020312C
      20202020202C202C2C2C0D0A20202020202C202D204E756D626572206F662043
      726974657269612C2C2C2C2C2C0D0A4444442C54454C454E44504553532C2020
      2020202020202020202020202020202020312C20202020202C202C2C2C0D0A20
      202020202C202D204E756D626572206F662043726974657269612C2C2C2C2C2C
      0D0A4E554D45524F2C54454C454E44504553532C202020202020202020202020
      20202020202020312C20202020202C202C2C2C0D0A20202020202C202D204E75
      6D626572206F662043726974657269612C2C2C2C2C2C0D0A5449504F2C54454C
      454E44504553532C20202020202020202020202020202020202020312C202020
      20202C202C2C2C0D0A20202020202C202D204E756D626572206F662043726974
      657269612C2C2C2C2C2C0D0A20202020312C202D204E756D626572206F66204A
      6F696E732C2C2C2C2C2C0D0A4944454E44455245434F2C54454C454E44504553
      532C4944454E44455245434F2C454E44504553532C202020202020202020202C
      202020202020202020202C2C0D0A0D0A2253454C4543542053746174656D656E
      74220D0A2C2C2C2C2C2C2C0D0A53454C4543540954454C454E44504553532E22
      494454454C45464F4E4522202C200D0A09454E44504553532E22494450455353
      4F4122202C200D0A0954454C454E44504553532E224944454E44455245434F22
      202C200D0A0954454C454E44504553532E2244444922202C2054454C454E4450
      4553532E2244444422202C200D0A0954454C454E44504553532E224E554D4552
      4F22202C200D0A0954454C454E44504553532E225449504F220D0A46524F4D09
      22434D222E2254454C454E4450455353222054454C454E4450455353202C2022
      434D222E22454E44504553532220454E44504553530D0A574845524509282054
      454C454E44504553532E4944454E44455245434F203D20454E44504553532E49
      44454E44455245434F20290D0A0909414E440D0A09280D0A092820454E445045
      53532E224944504553534F4122203D3A4964506573736F6120290D0A09292C2C
      2C2C2C2C2C0D0A}
  end
  inherited updTelefone: TUpdateSQL
    Left = 737
    Top = 155
  end
  inherited dsTelefone: TwwDataSource
    Top = 157
  end
  inherited dsEndereco: TwwDataSource
    Left = 774
    Top = 155
  end
  inherited updEndereco: TUpdateSQL
    Left = 763
    Top = 149
  end
  inherited qryEndereco: TwwQuery
    Left = 770
    Top = 158
  end
  inherited qryContato: TwwQuery
    Left = 371
    Top = 462
    Data = {
      56657220322E302C514245202D20496E74656772612056697375616C20446174
      6162617365204275696C6465722C302C2031302C20313630302C20313136342C
      2C2C2C2C0D0A202C202C202D2044697374696E637420262051756F74652C2C2C
      2C2C0D0A20202020322C202D204E756D626572206F66205461626C65732C2D31
      2C202D312C203830382C203630302C203830302C203331302C2C2C2C0D0A434D
      2E434F4E5441544F504553532C434F4E5441544F504553532C32302C2032302C
      203133302C203134352C2C2C2C2C0D0A434D2E454E44504553532C454E445045
      53532C3135302C2032302C203236302C203134352C2C2C2C2C0D0A2020202037
      2C202D204E756D626572206F6620436F6C756D6E732C2C2C2C2C2C0D0A494443
      4F4E5441544F2C434F4E5441544F504553532C20202020202020202020202020
      202020202020312C20202020202C202C2C2C0D0A20202020202C202D204E756D
      626572206F662043726974657269612C2C2C2C2C2C0D0A4944504553534F412C
      454E44504553532C20202020202020202020202020202020202020312C202020
      20202C202C2C2C0D0A20202020312C202D204E756D626572206F662043726974
      657269612C2C2C2C2C2C0D0A3D3A4964506573736F612C20202020362C2C2C2C
      2C2C0D0A4944454E44455245434F2C434F4E5441544F504553532C2020202020
      2020202020202020202020202020312C20202020202C202C2C2C0D0A20202020
      202C202D204E756D626572206F662043726974657269612C2C2C2C2C2C0D0A4E
      4F4D452C434F4E5441544F504553532C20202020202020202020202020202020
      202020312C20202020202C202C2C2C0D0A20202020202C202D204E756D626572
      206F662043726974657269612C2C2C2C2C2C0D0A454D41494C2C434F4E544154
      4F504553532C20202020202020202020202020202020202020312C2020202020
      2C202C2C2C0D0A20202020202C202D204E756D626572206F6620437269746572
      69612C2C2C2C2C2C0D0A434152474F2C434F4E5441544F504553532C20202020
      202020202020202020202020202020312C20202020202C202C2C2C0D0A202020
      20202C202D204E756D626572206F662043726974657269612C2C2C2C2C2C0D0A
      5345544F522C434F4E5441544F504553532C2020202020202020202020202020
      2020202020312C20202020202C202C2C2C0D0A20202020202C202D204E756D62
      6572206F662043726974657269612C2C2C2C2C2C0D0A20202020312C202D204E
      756D626572206F66204A6F696E732C2C2C2C2C2C0D0A4944454E44455245434F
      2C434F4E5441544F504553532C4944454E44455245434F2C454E44504553532C
      202020202020202020202C202020202020202020202C2C0D0A0D0A2253454C45
      43542053746174656D656E74220D0A2C2C2C2C2C2C2C0D0A53454C4543540943
      4F4E5441544F504553532E224944434F4E5441544F22202C200D0A09454E4450
      4553532E224944504553534F4122202C200D0A09434F4E5441544F504553532E
      224944454E44455245434F22202C200D0A09434F4E5441544F504553532E224E
      4F4D4522202C200D0A09434F4E5441544F504553532E22454D41494C22202C20
      0D0A09434F4E5441544F504553532E22434152474F22202C200D0A09434F4E54
      41544F504553532E225345544F52220D0A46524F4D0922434D222E22434F4E54
      41544F504553532220434F4E5441544F50455353202C2022434D222E22454E44
      504553532220454E44504553530D0A5748455245092820434F4E5441544F5045
      53532E4944454E44455245434F203D20454E44504553532E4944454E44455245
      434F20290D0A0909414E440D0A09280D0A092820454E44504553532E22494450
      4553534F4122203D3A4964506573736F6120290D0A09292C2C2C2C2C2C2C0D0A}
  end
  inherited updContato: TUpdateSQL
    Left = 405
    Top = 454
  end
  inherited dsContato: TwwDataSource
    Left = 332
    Top = 446
  end
  inherited qryRamal: TwwQuery
    Left = 731
    Top = 296
    Data = {
      56657220322E302C514245202D20496E74656772612056697375616C20446174
      6162617365204275696C6465722C302C20302C20313630302C20313136342C2C
      2C2C2C0D0A202C202C202D2044697374696E637420262051756F74652C2C2C2C
      2C0D0A20202020342C202D204E756D626572206F66205461626C65732C2D312C
      202D312C203830382C203630302C203830302C203333312C2C2C2C0D0A434D2E
      434F4E5441544F504553532C434F4E5441544F504553532C3135322C2031372C
      203236322C203134322C2C2C2C2C0D0A434D2E454E44504553532C454E445045
      53532C3335312C2037362C203436312C203230312C2C2C2C2C0D0A434D2E5445
      4C434F4E5441544F2C54454C434F4E5441544F2C31312C2039382C203132332C
      203232332C2C2C2C2C0D0A434D2E54454C454E44504553532C54454C454E4450
      4553532C3134372C203135392C203235372C203238342C2C2C2C2C0D0A202020
      20362C202D204E756D626572206F6620436F6C756D6E732C2C2C2C2C2C0D0A49
      44434F4E5441544F2C54454C434F4E5441544F2C202020202020202020202020
      20202020202020312C20202020202C202C2C2C0D0A20202020202C202D204E75
      6D626572206F662043726974657269612C2C2C2C2C2C0D0A494454454C45464F
      4E452C54454C434F4E5441544F2C202020202020202020202020202020202020
      20312C20202020202C202C2C2C0D0A20202020202C202D204E756D626572206F
      662043726974657269612C2C2C2C2C2C0D0A52414D414C2C54454C434F4E5441
      544F2C20202020202020202020202020202020202020312C20202020202C202C
      2C2C0D0A20202020202C202D204E756D626572206F662043726974657269612C
      2C2C2C2C2C0D0A4E554D45524F2C54454C454E44504553532C20202020202020
      202020202020202020202020312C20202020202C202C2C2C0D0A20202020202C
      202D204E756D626572206F662043726974657269612C2C2C2C2C2C0D0A4E4F4D
      452C434F4E5441544F504553532C202020202020202020202020202020202020
      20312C20202020202C202C2C2C0D0A20202020202C202D204E756D626572206F
      662043726974657269612C2C2C2C2C2C0D0A4944504553534F412C454E445045
      53532C20202020202020202020202020202020202020202C20202020202C202C
      2C2C0D0A20202020312C202D204E756D626572206F662043726974657269612C
      2C2C2C2C2C0D0A3D3A4964506573736F612C20202020362C2C2C2C2C2C0D0A20
      202020342C202D204E756D626572206F66204A6F696E732C2C2C2C2C2C0D0A49
      44434F4E5441544F2C54454C434F4E5441544F2C4944434F4E5441544F2C434F
      4E5441544F504553532C202020202020202020202C202020202020202020202C
      2C0D0A494454454C45464F4E452C54454C434F4E5441544F2C494454454C4546
      4F4E452C54454C454E44504553532C202020202020202020202C202020202020
      202020202C2C0D0A4944454E44455245434F2C434F4E5441544F504553532C49
      44454E44455245434F2C454E44504553532C202020202020202020202C202020
      202020202020202C2C0D0A4944454E44455245434F2C54454C454E4450455353
      2C4944454E44455245434F2C454E44504553532C202020202020202020202C20
      2020202020202020202C2C0D0A0D0A2253454C4543542053746174656D656E74
      220D0A2C2C2C2C2C2C2C0D0A53454C4543540954454C434F4E5441544F2E2249
      44434F4E5441544F22202C200D0A0954454C434F4E5441544F2E22494454454C
      45464F4E4522202C200D0A0954454C434F4E5441544F2E2252414D414C22202C
      200D0A0954454C454E44504553532E224E554D45524F22202C200D0A09434F4E
      5441544F504553532E224E4F4D45220D0A46524F4D0922434D222E22434F4E54
      41544F504553532220434F4E5441544F50455353202C2022434D222E22454E44
      504553532220454E4450455353202C200D0A0922434D222E2254454C434F4E54
      41544F222054454C434F4E5441544F202C2022434D222E2254454C454E445045
      5353222054454C454E44504553530D0A574845524509282054454C434F4E5441
      544F2E4944434F4E5441544F203D20434F4E5441544F504553532E4944434F4E
      5441544F20290D0A0909414E440D0A09282054454C434F4E5441544F2E494454
      454C45464F4E45203D2054454C454E44504553532E494454454C45464F4E4520
      290D0A0909414E440D0A092820434F4E5441544F504553532E4944454E444552
      45434F203D20454E44504553532E4944454E44455245434F20290D0A0909414E
      440D0A09282054454C454E44504553532E4944454E44455245434F203D20454E
      44504553532E4944454E44455245434F20290D0A0909414E440D0A09280D0A09
      2820454E44504553532E222C2C2C2C2C2C2C0D0A4944504553534F4122203D3A
      4964506573736F6120290D0A09292C2C2C2C2C2C2C0D0A}
  end
  inherited updRamal: TUpdateSQL
    Left = 734
    Top = 299
  end
  inherited dsRamal: TwwDataSource
    Top = 308
  end
  inherited qryDocumento: TwwQuery
    Left = 754
    Top = 344
  end
  inherited dsDocumento: TwwDataSource
    Left = 766
    Top = 339
  end
  inherited updDocumento: TUpdateSQL
    Left = 761
    Top = 337
  end
  inherited qryEscolhePessoa: TwwQuery
    Left = 749
    Top = 393
  end
  inherited dsEscolhePessoa: TwwDataSource
    Left = 731
    Top = 370
  end
  inherited Pessoa: TPessoa
    MudaCaption = False
    SubTipo = stPatro
    MostraFoto = False
    Left = 270
    Top = 4
  end
  inherited OpenPictureDialog1: TOpenPictureDialog
    Left = 497
    Top = 186
  end
  inherited qryImagem: TwwQuery
    Left = 544
    Top = 8
  end
  inherited updImagem: TUpdateSQL
    Left = 569
    Top = 5
  end
  inherited updImagensDoc: TUpdateSQL
    Left = 330
    Top = 450
  end
  inherited qryImagensDoc: TwwQuery
    Left = 79
    Top = 447
  end
  inherited dsImagem: TwwDataSource
    Left = 590
    Top = 0
  end
  inherited dsImagensDoc: TwwDataSource
    Left = 240
    Top = 468
  end
  object qryRegra: TwwQuery [45]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDREGRA,NOMEREGRA'
      'FROM REGRA'
      'ORDER BY NOMEREGRA')
    ValidateWithMask = True
    Left = 521
    Top = 183
  end
  object qryRubrica: TwwQuery [46]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT P.IDPROVENTO, P.DESCRICAO'
      'FROM   PROVDESC P,RUBRICAXPESS R'
      'WHERE (P.IDPROVENTO  = R.IDRUBRICA) '
      '  AND ((P.FLGDESCONTO = 0) OR'
      '       (P.FLGDESCONTO = 2))'
      '  AND (R.IDPESSOA    = :piIdPessoa)')
    ValidateWithMask = True
    Left = 22
    Top = 447
    ParamData = <
      item
        DataType = ftInteger
        Name = 'piIdPessoa'
        ParamType = ptUnknown
      end>
  end
  object qryMoeda: TwwQuery [47]
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MOECODIGO,MOEDESC,MOESIGLA FROM MOEDA '
      'ORDER BY MOESIGLA')
    ValidateWithMask = True
    Left = 630
    Top = 7
  end
  inherited qryTipoDoc: TwwQuery
    Left = 748
    Top = 392
  end
  inherited MSGrupo: TMontaSelect
    Left = 690
    Top = 8
  end
  inherited qryEstado: TwwQuery
    Left = 279
    Top = 180
    Data = {
      56657220322E302C514245202D20496E74656772612056697375616C20446174
      6162617365204275696C6465722C302C2031302C20313630302C20313136342C
      2C2C2C2C0D0A202C202C202D2044697374696E637420262051756F74652C2C2C
      2C2C0D0A20202020322C202D204E756D626572206F66205461626C65732C2D31
      2C202D312C203531382C203339352C203531302C203136392C2C2C2C0D0A4553
      5441444F2C45535441444F2C32302C2031302C203133372C203133352C2C2C2C
      2C0D0A504149532C504149532C3135372C2031302C203333312C203133352C2C
      2C2C2C0D0A20202020342C202D204E756D626572206F6620436F6C756D6E732C
      2C2C2C2C2C0D0A434F4445535441444F2C45535441444F2C2020202020202020
      2020202020202020202020312C20202020202C202C2C2C0D0A20202020202C20
      2D204E756D626572206F662043726974657269612C2C2C2C2C2C0D0A4E4F4D45
      45535441444F2C45535441444F2C202020202020202020202020202020202020
      36352C20202020202C202C2C312C0D0A20202020202C202D204E756D62657220
      6F662043726974657269612C2C2C2C2C2C0D0A4944504149532C504149532C20
      202020202020202020202020202020202020312C20202020202C202C2C2C0D0A
      20202020202C202D204E756D626572206F662043726974657269612C2C2C2C2C
      2C0D0A4E4F4D45504149532C504149532C202020202020202020202020202020
      20202020312C20202020202C202C2C2C0D0A20202020202C202D204E756D6265
      72206F662043726974657269612C2C2C2C2C2C0D0A20202020312C202D204E75
      6D626572206F66204A6F696E732C2C2C2C2C2C0D0A4944504149532C45535441
      444F2C4944504149532C504149532C202020202020202020202C202020202020
      202020202C2C0D0A0D0A2253454C4543542053746174656D656E74220D0A2C2C
      2C2C2C2C2C0D0A53454C4543540945535441444F2E22434F4445535441444F22
      202C200D0A0945535441444F2E224E4F4D4545535441444F22202C2050414953
      2E2249445041495322202C200D0A09504149532E224E4F4D4550414953220D0A
      46524F4D092245535441444F222045535441444F202C20225041495322205041
      49530D0A574845524509282045535441444F2E494450414953203D2050414953
      2E49445041495320290D0A4F524445522042590D0A0945535441444F2E224E4F
      4D4545535441444F222C2C2C2C2C2C2C0D0A}
  end
  inherited qryCidade: TwwQuery
    Left = 204
    Top = 468
  end
  inherited qryNaturalidade_Padrao: TwwQuery
    Left = 720
    Top = 168
  end
  inherited DsNaturalidade_Padrao: TwwDataSource
    Left = 640
    Top = 173
  end
end
