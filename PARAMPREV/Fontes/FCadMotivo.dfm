inherited frmcadmotivo: Tfrmcadmotivo
  Left = 433
  Top = 68
  HelpContext = 160164
  Caption = 'Cadastro de Motivo'
  ClientHeight = 483
  ClientWidth = 581
  Position = poDesktopCenter
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 581
    Height = 397
    inherited dbGrd: TwwDBGrid [0]
      Width = 579
      Height = 395
      Selected.Strings = (
        'IDMOTIVO'#9'10'#9'Código'
        'DESCRICAO'#9'70'#9'Descrição')
      FixedCols = 1
    end
    inherited pnlControles: TPanel [1]
      Width = 579
      Height = 395
      object lblmotivo: TLabel
        Left = 16
        Top = 8
        Width = 43
        Height = 13
        Caption = 'Motivo '
      end
      object Lbl_ChkFlgMotivoCancel: TLabel
        Left = 372
        Top = 55
        Width = 152
        Height = 26
        Caption = 'Motivo para Cancelamento de Dependentes'
        WordWrap = True
        OnClick = Lbl_ChkFlgMotivoCancelClick
      end
      object ChkFlgMotivoCancel: TDBCheckBox
        Left = 352
        Top = 56
        Width = 17
        Height = 26
        DataField = 'FLGMOTIVOCANCEL'
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
      object dbedDesc: TwwDBEdit
        Left = 16
        Top = 26
        Width = 312
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object DBRadioGroup1: TDBRadioGroup
        Left = 16
        Top = 56
        Width = 125
        Height = 65
        Caption = ' Tipo '
        DataField = 'FLGTIPO'
        DataSource = ds
        Items.Strings = (
          'Previdenciário'
          'Geral ')
        TabOrder = 1
        Values.Strings = (
          'P'
          'G')
      end
      object PgContab: TPageControl
        Left = 16
        Top = 132
        Width = 545
        Height = 253
        ActivePage = TabSheet1
        TabOrder = 2
        object TabSheet1: TTabSheet
          Caption = 'Contabilização'
          object grpDebContab: TGroupBox
            Left = 9
            Top = 12
            Width = 250
            Height = 95
            Caption = 'Conta para Débito'
            TabOrder = 0
            object CmpCContabilD: TCMProcuraMaskContabil
              Left = 4
              Top = 16
              Width = 242
              Height = 74
              Hint = '000000000000000000000000000000000000000000000000000000'
              Caption = 'Conta Contábil '
              TabOrder = 0
              MostraMensagens = True
              MostraDescricao = True
              DataSource = ds
              DataField = 'PLACONTAD'
              Mensagens.EmBranco = 'Conta Contábil Chave não pode estar em branco'
              Mensagens.NaoExiste = 'Conta Contábil Chave não existe'
              Mensagens.Sintetica = 'Conta Contábil Chave não pode ser sintética'
              Mensagens.Analitica = 'Conta Contábil Chave não pode ser analítica'
              PermiteChaveInvalida = False
              PermiteChaveEmBranco = False
              AceitaTipoConta = SoAnalitica
              Plano = 0
              Status = scSoAtiva
            end
          end
          object grpCreContab: TGroupBox
            Left = 272
            Top = 12
            Width = 250
            Height = 95
            Caption = 'Conta para Crédito'
            TabOrder = 1
            object CmpCContabilC: TCMProcuraMaskContabil
              Left = 4
              Top = 16
              Width = 242
              Height = 74
              Caption = 'Conta Contábil '
              TabOrder = 0
              MostraMensagens = True
              MostraDescricao = True
              DataSource = ds
              DataField = 'PLACONTAC'
              Mensagens.EmBranco = 'Conta Contábil Chave não pode estar em branco'
              Mensagens.NaoExiste = 'Conta Contábil Chave não existe'
              Mensagens.Sintetica = 'Conta Contábil Chave não pode ser sintética'
              Mensagens.Analitica = 'Conta Contábil Chave não pode ser analítica'
              PermiteChaveInvalida = False
              PermiteChaveEmBranco = False
              AceitaTipoConta = SoAnalitica
              Plano = 0
              Status = scSoAtiva
            end
          end
          object GroupBox1: TGroupBox
            Left = 9
            Top = 116
            Width = 250
            Height = 95
            Caption = 'Conta para Débito - Alterador'
            TabOrder = 2
            object CmpCContabilDAlt: TCMProcuraMaskContabil
              Left = 4
              Top = 16
              Width = 242
              Height = 74
              Caption = 'Conta Contábil '
              TabOrder = 0
              MostraMensagens = True
              MostraDescricao = True
              DataSource = ds
              DataField = 'PLACONTADALT'
              Mensagens.EmBranco = 'Conta Contábil Chave não pode estar em branco'
              Mensagens.NaoExiste = 'Conta Contábil Chave não existe'
              Mensagens.Sintetica = 'Conta Contábil Chave não pode ser sintética'
              Mensagens.Analitica = 'Conta Contábil Chave não pode ser analítica'
              PermiteChaveInvalida = False
              PermiteChaveEmBranco = False
              AceitaTipoConta = SoAnalitica
              Plano = 0
              Status = scSoAtiva
            end
          end
          object GroupBox3: TGroupBox
            Left = 272
            Top = 116
            Width = 250
            Height = 95
            Caption = 'Conta para Crédito - Alterador'
            TabOrder = 3
            object CmpCContabilCAlt: TCMProcuraMaskContabil
              Left = 4
              Top = 16
              Width = 242
              Height = 74
              Caption = 'Conta Contábil '
              TabOrder = 0
              MostraMensagens = True
              MostraDescricao = True
              DataSource = ds
              DataField = 'PLACONTACALT'
              Mensagens.EmBranco = 'Conta Contábil Chave não pode estar em branco'
              Mensagens.NaoExiste = 'Conta Contábil Chave não existe'
              Mensagens.Sintetica = 'Conta Contábil Chave não pode ser sintética'
              Mensagens.Analitica = 'Conta Contábil Chave não pode ser analítica'
              PermiteChaveInvalida = False
              PermiteChaveEmBranco = False
              AceitaTipoConta = SoAnalitica
              Plano = 0
              Status = scSoAtiva
            end
          end
        end
      end
      object ChkContab: TDBCheckBox
        Left = 352
        Top = 32
        Width = 97
        Height = 17
        Caption = 'Contabilizar'
        DataField = 'FLGCONTABILIZA'
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
        OnClick = ChkContabClick
      end
      object grpModulo: TGroupBox
        Left = 144
        Top = 56
        Width = 185
        Height = 65
        Caption = 'Módulo'
        TabOrder = 5
        object dblkpcmbModulo: TwwDBLookupCombo
          Left = 6
          Top = 24
          Width = 172
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOMEMODULO'#9'50'#9'Nome do Módulo')
          DataField = 'IDMODULO'
          DataSource = ds
          LookupTable = qryModulo
          LookupField = 'IDMODULO'
          ParentFont = False
          TabOrder = 0
          AutoDropDown = False
          ShowButton = True
          AllowClearKey = False
          OnChange = dblkpcmbModuloChange
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 581
  end
  inherited Dock971: TDock97
    Top = 444
    Width = 581
    inherited tb97Fundo: TToolbar97
      Left = 299
      DockPos = 299
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 130
      DockPos = 130
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 582
    Top = 8
    TargetsData = (
      1
      1
      (
        ''
        'Filter'
        0))
  end
  inherited ds: TwwDataSource
    Left = 270
    Top = 65535
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update MOTIVO'
      'set'
      '  DESCRICAO = :DESCRICAO,'
      '  FLGTIPO = :FLGTIPO,'
      '  flgcontabiliza = :flgcontabiliza,'
      '  placontad    = :placontad,'
      '  placontac  = :placontac,'
      '  placontadalt  = :placontadalt,'
      '  placontacalt    = :placontacalt,'
      ' flgmotivocancel = :flgmotivocancel,'
      'idmodulo = :idmodulo'
      'where'
      '  IDMOTIVO = :OLD_IDMOTIVO')
    InsertSQL.Strings = (
      'insert into MOTIVO'
      '  (IDMOTIVO, DESCRICAO, FLGTIPO,'
      '   flgcontabiliza, placontad, placontac, placontadalt,'
      '   placontacalt, flgmotivocancel, idmodulo )'
      'values'
      '  (:IDMOTIVO, :DESCRICAO, :FLGTIPO,'
      '  :flgcontabiliza, :placontad, :placontac, :placontadalt,'
      '   :placontacalt, :flgmotivocancel, :idmodulo )'
      '')
    DeleteSQL.Strings = (
      'delete from MOTIVO'
      'where'
      '  IDMOTIVO = :OLD_IDMOTIVO')
    Left = 361
    Top = 65534
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Motivo'
    Colunas.Strings = (
      'IDMOTIVO'
      'DESCRICAO')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição')
    Tabelas.Strings = (
      'MOTIVO')
    CamposChave.Strings = (
      'IDMOTIVO')
    Filtro.Strings = (
      '((FLGTIPO = '#39'P'#39') OR (FLGTIPO IS NULL))')
    Larguras.Strings = (
      '10'
      '30')
    ExibePergunta = False
    Left = 489
    Top = 0
  end
  inherited ImlPadrao: TImageList
    Left = 531
    Top = 10
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 420
    Top = 7
  end
  inherited qry: TwwQuery
    BeforePost = qryBeforePost
    SQL.Strings = (
      'SELECT IDMOTIVO, DESCRICAO,  FLGTIPO ,'
      'flgcontabiliza, placontad, placontac,'
      'placontadalt, placontacalt, flgmotivocancel, idmodulo'
      'FROM MOTIVO '
      'WHERE FLGTIPO = '#39'P'#39' OR FLGTIPO IS NULL OR FLGTIPO = '#39'G'#39' '
      'ORDER BY DESCRICAO'
      '')
    Left = 316
    Top = 65534
  end
  object QryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 489
    Top = 160
  end
  object qryModulo: TwwQuery
    BeforeScroll = qryModuloBeforeScroll
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDMODULO, NOMEMODULO, DESCRICAOMODULO'
      'FROM   MODULO'
      'ORDER BY NOMEMODULO')
    ValidateWithMask = True
    Left = 314
    Top = 32
  end
end
