inherited frmCadContJurid: TfrmCadContJurid
  Left = 67
  Top = 97
  HelpContext = 1100011
  Caption = 'Critérios de Contabilização do Sistema Jurídico'
  ClientHeight = 436
  ClientWidth = 661
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 661
    Height = 350
    BorderWidth = 2
    inherited pnlMestre: TPanel
      Left = 4
      Top = 4
      Width = 653
      Height = 35
      object Label2: TLabel
        Left = 10
        Top = 11
        Width = 152
        Height = 13
        Caption = 'Tipo de Objeto Reclamado'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbedDescricao: TwwDBEdit
        Left = 167
        Top = 8
        Width = 477
        Height = 21
        TabStop = False
        Color = clGray
        DataField = 'DESCRICAO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Left = 4
      Top = 39
      Width = 653
      Height = 307
      Tabs.Strings = (
        'Contas Contábeis e Matérias')
      inherited pgctrlDetalhe: TPageControl
        Width = 555
        Height = 248
        inherited tbsDet: TTabSheet
          Caption = 'tbsDet'
          inherited dbgrdDet: TwwDBGrid
            Width = 547
            Height = 220
            Selected.Strings = (
              'CONTADEBITO'#9'18'#9'Conta a Débito'
              'CONTACREDITO'#9'19'#9'Conta a Crédito'
              'INDMATERIA'#9'7'#9'Matéria')
            Font.Style = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgWordWrap]
            ParentFont = False
            UseTFields = False
          end
          inherited pnlControlesDet: TPanel
            Width = 547
            Height = 220
            object CMProcuraMaskContabilCredito: TCMProcuraMaskContabil
              Left = 8
              Top = 24
              Width = 265
              Height = 100
              Caption = 'Conta Contábil a Crédito'
              TabOrder = 0
              MostraMensagens = True
              MostraDescricao = True
              DataSource = dsDet
              DataField = 'CONTACREDITO'
              Mensagens.EmBranco = 'Chave não pode estar em branco'
              Mensagens.NaoExiste = 'Chave não existe'
              Mensagens.Sintetica = 'Chave não pode ser sintética'
              Mensagens.Analitica = 'Chave não pode ser analítica'
              PermiteChaveInvalida = False
              PermiteChaveEmBranco = True
              AceitaTipoConta = SoAnalitica
              Plano = 0
              Status = scSoAtiva
            end
            object CMProcuraMaskContabilDebito: TCMProcuraMaskContabil
              Left = 8
              Top = 134
              Width = 265
              Height = 100
              Caption = 'Conta Contábil a Débito'
              TabOrder = 1
              MostraMensagens = True
              MostraDescricao = True
              DataSource = dsDet
              DataField = 'CONTADEBITO'
              Mensagens.EmBranco = 'Chave não pode estar em branco'
              Mensagens.NaoExiste = 'Chave não existe'
              Mensagens.Sintetica = 'Chave não pode ser sintética'
              Mensagens.Analitica = 'Chave não pode ser analítica'
              PermiteChaveInvalida = False
              PermiteChaveEmBranco = True
              AceitaTipoConta = SoAnalitica
              Plano = 0
              Status = scSoAtiva
            end
            object dbrgIndPrincipal: TDBRadioGroup
              Left = 282
              Top = 24
              Width = 257
              Height = 100
              Caption = 'Aplica-se a'
              DataField = 'INDPRINCIPAL'
              DataSource = dsDet
              Items.Strings = (
                'Principal'
                'Correção Monetária'
                'Juros')
              TabOrder = 2
              Values.Strings = (
                '0'
                '1'
                '2')
            end
            object dbrgMateria: TDBRadioGroup
              Left = 282
              Top = 134
              Width = 257
              Height = 100
              Caption = 'Matéria'
              Columns = 2
              DataField = 'INDMATERIA'
              DataSource = dsDet
              Items.Strings = (
                'Qualquer'
                'Trabalhista'
                'Previdenciária'
                'Prev./Trabalhista'
                'Civil'
                'Comercial'
                'Tributária'
                'Penal')
              TabOrder = 3
              Values.Strings = (
                '0'
                '1'
                '2'
                '3'
                '4'
                '5'
                '6'
                '7')
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 645
      end
      inherited Dock974: TDock97
        Left = 559
        Height = 248
      end
    end
  end
  inherited Dock972: TDock97
    Width = 661
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 397
    Width = 661
    inherited tb97Fundo: TToolbar97
      Left = 492
      DockPos = 581
      inherited sep1: TToolbarSep97
        SizeHorz = 2
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 326
      DockPos = 414
      inherited ToolbarSep971: TToolbarSep97
        SizeHorz = 2
      end
      inherited bbtnCancelar: TBitBtn
        Left = 82
      end
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT CODTIPOOBJETO, DESCRICAO '
      'FROM TIPOOBJPROCTRAB'
      'WHERE CODTIPOOBJETO = :CODTIPOOBJETO')
    Left = 242
    Top = 1
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODTIPOOBJETO'
        ParamType = ptUnknown
      end>
  end
  inherited dsDet: TwwDataSource
    DataSet = qryContabJurid
    Left = 487
    Top = 1
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 603
    Top = 344
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TIPOOBJPROCTRAB'
      'set'
      '  CODTIPOOBJETO = :CODTIPOOBJETO,'
      '  DESCRICAO = :DESCRICAO'
      'where'
      '  CODTIPOOBJETO = :OLD_CODTIPOOBJETO')
    InsertSQL.Strings = (
      'insert into TIPOOBJPROCTRAB'
      '  (CODTIPOOBJETO, DESCRICAO)'
      'values'
      '  (:CODTIPOOBJETO, :DESCRICAO)')
    DeleteSQL.Strings = (
      'delete from TIPOOBJPROCTRAB'
      'where'
      '  CODTIPOOBJETO = :OLD_CODTIPOOBJETO')
    Left = 283
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Tipo de Objeto Reclamado'
    Colunas.Strings = (
      'TIPOOBJPROCTRAB.CODTIPOOBJETO'
      'TIPOOBJPROCTRAB.DESCRICAO')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição')
    Tabelas.Strings = (
      'TIPOOBJPROCTRAB')
    CamposChave.Strings = (
      'TIPOOBJPROCTRAB.CODTIPOOBJETO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '20'
      '50')
    Left = 603
    Top = 330
  end
  inherited ds: TwwDataSource
    Left = 323
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 603
    Top = 316
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 606
    Top = 14
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 606
    Top = 1
  end
  object qryContabJurid: TwwQuery
    CachedUpdates = True
    AfterInsert = qryContabJuridAfterInsert
    BeforePost = qryContabJuridBeforePost
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM CONTABJURID'
      'WHERE CODTIPOOBJETO = :CODTIPOOBJETO'
      'ORDER BY INDMATERIA, IDCONTABJURID')
    UpdateObject = updContabJurid
    ValidateWithMask = True
    Left = 421
    Top = 1
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CODTIPOOBJETO'
        ParamType = ptUnknown
      end>
  end
  object updContabJurid: TUpdateSQL
    ModifySQL.Strings = (
      'update CONTABJURID'
      'set'
      '  IDCONTABJURID = :IDCONTABJURID,'
      '  CONTADEBITO = :CONTADEBITO,'
      '  IDPLANO1 = :IDPLANO1,'
      '  CONTACREDITO = :CONTACREDITO,'
      '  CODTIPOOBJETO = :CODTIPOOBJETO,'
      '  IDPLANO2 = :IDPLANO2,'
      '  INDMATERIA = :INDMATERIA,'
      '  INDPRINCIPAL = :INDPRINCIPAL'
      'where'
      '  IDCONTABJURID = :OLD_IDCONTABJURID')
    InsertSQL.Strings = (
      'insert into CONTABJURID'
      '  (IDCONTABJURID, CONTADEBITO, IDPLANO1, CONTACREDITO, '
      'CODTIPOOBJETO, IDPLANO2, '
      '   INDMATERIA, INDPRINCIPAL)'
      'values'
      '  (:IDCONTABJURID, :CONTADEBITO, :IDPLANO1, :CONTACREDITO, '
      ':CODTIPOOBJETO, '
      '   :IDPLANO2, :INDMATERIA, :INDPRINCIPAL)')
    DeleteSQL.Strings = (
      'delete from CONTABJURID'
      'where'
      '  IDCONTABJURID = :OLD_IDCONTABJURID')
    Left = 376
    Top = 23
  end
  object qryPlano: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 591
    Top = 269
  end
  object qryParam: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 590
    Top = 221
    object qryParamPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'PARAMCONTAB.PLANO'
    end
  end
end
