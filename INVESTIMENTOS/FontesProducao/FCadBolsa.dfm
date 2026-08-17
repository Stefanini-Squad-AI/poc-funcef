inherited frmCadBolsa: TfrmCadBolsa
  Left = 84
  Top = 103
  HelpContext = 790103
  Caption = 'Bolsa de valores'
  ClientHeight = 465
  ClientWidth = 702
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 702
    Height = 379
    inherited tbcDetalhe: TTabControlDetalhe
      Width = 700
      Height = 272
      Tabs.Strings = (
        'Documentação'
        'Endereços'
        'Telefones'
        'Contatos'
        'Bolsa de Valores')
      detdbGrids.Strings = (
        ''
        'dbGrdDet'
        'dbgTelefone'
        'dbgContato'
        '')
      inherited pgctrlDetalhe: TPageControl
        Width = 602
        Height = 213
        ActivePage = TbsBolsa
        inherited tbsDocumento: TTabSheet
          inherited PgCtrlPesFisica_Padrao: TPageControl
            Width = 594
            Height = 185
          end
          inherited PnlDocumentos_Padrao: TPanel
            Width = 594
            Height = 185
            inherited pnlItemsDoc: TPanel
              Height = 183
            end
            inherited pnlFoto: TPanel
              Width = 104
              Height = 183
              Visible = False
              inherited Bevel1: TBevel
                Height = 152
              end
              inherited PnlAssociaFoto_Padrao: TPanel
                Top = 152
                Width = 104
              end
              inherited SbImagePessoa_Padrao: TScrollBox
                Width = 102
                Height = 152
              end
            end
            inherited lstDocumentos: TListView
              Height = 183
            end
          end
        end
        inherited tbsDet: TTabSheet
          inherited pnlControlesDet: TPanel
            Width = 594
            Height = 185
            inherited grpTipoEnd: TGroupBox
              Left = 397
              Height = 185
            end
          end
          inherited dbgrdDet: TwwDBGrid
            Width = 594
            Height = 185
          end
        end
        inherited tbsTelefone: TTabSheet
          inherited dbgTelefone: TwwDBGrid
            Width = 594
            Height = 185
          end
          inherited Panel1: TPanel
            Width = 594
            Height = 185
          end
        end
        inherited tbsContato: TTabSheet
          inherited Panel2: TPanel
            Width = 594
            Height = 185
          end
          inherited dbgContato: TwwDBGrid
            Width = 594
            Height = 185
          end
        end
        object TbsBolsa: TTabSheet
          Caption = 'Bolsa de Valores'
          object Label13: TLabel
            Left = 9
            Top = 64
            Width = 115
            Height = 13
            Caption = 'Moeda Operacional '
            Visible = False
          end
          object Label2: TLabel
            Left = 9
            Top = 16
            Width = 82
            Height = 13
            Caption = 'Sigla da Bolsa'
          end
          object Label11: TLabel
            Left = 9
            Top = 109
            Width = 68
            Height = 13
            Caption = 'Custodiante'
            Visible = False
          end
          object DBESIGLA: TwwDBEdit
            Left = 9
            Top = 32
            Width = 176
            Height = 21
            DataField = 'SGLBOLSAVALORES'
            DataSource = dsSubTipo
            TabOrder = 0
            UnboundDataType = wwDefault
            WantReturns = False
            WordWrap = False
          end
          object DbLkcBuscaMoeda: TwwDBLookupCombo
            Left = 9
            Top = 79
            Width = 289
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'MOEDESC'#9'40'#9'Moeda')
            DataField = 'MOECODIGO'
            DataSource = dsSubTipo
            LookupTable = QryBuscaMoeda
            LookupField = 'MOECODIGO'
            Options = [loColLines, loRowLines, loTitles]
            TabOrder = 1
            Visible = False
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
          end
          object DbLkcBuscaCust: TwwDBLookupCombo
            Left = 9
            Top = 123
            Width = 288
            Height = 21
            DropDownAlignment = taLeftJustify
            Selected.Strings = (
              'SGLCUSTODIANTE'#9'40'#9'Custodiante')
            DataField = 'IDCUSTODIANTE'
            DataSource = dsSubTipo
            LookupTable = QryBuscaCustodiante
            LookupField = 'IDCUSTODIANTE'
            Options = [loColLines, loRowLines, loTitles]
            TabOrder = 2
            Visible = False
            AutoDropDown = True
            ShowButton = True
            AllowClearKey = False
            ShowMatchText = True
          end
        end
      end
      inherited Dock973: TDock97
        Width = 692
      end
      inherited Dock974: TDock97
        Left = 606
        Height = 213
      end
    end
    inherited pnlMestre: TPanel
      Width = 700
    end
  end
  inherited Dock972: TDock97
    Width = 702
  end
  inherited Dock971: TDock97
    Top = 426
    Width = 702
    inherited tb97Fundo: TToolbar97
      Left = 530
      DockPos = 530
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 361
      DockPos = 361
    end
  end
  inherited dsDet: TwwDataSource
    Left = 303
  end
  inherited ds: TwwDataSource
    Left = 500
    Top = 1
  end
  inherited upd: TUpdateSQL
    Left = 457
    Top = 17
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'BOLSAVALORES.SGLBOLSAVALORES'
      'PESSOA.NOME'
      'PESSOA.RAZAOSOCIAL')
    Descricao.Strings = (
      'Sigla'
      'Nome da Bolsa de Valores '
      'Razão Social ')
    Tabelas.Strings = (
      'BOLSAVALORES'
      'PESSOA')
    CamposChave.Strings = (
      'BOLSAVALORES.IDBOLSAVALORES')
    Filtro.Strings = (
      'BOLSAVALORES.IDBOLSAVALORES = PESSOA.IDPESSOA')
    Larguras.Strings = (
      '10'
      '40'
      '40')
    Left = 360
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 358
  end
  inherited qry: TwwQuery
    Left = 413
    Top = 11
  end
  inherited updSubTipo: TUpdateSQL
    ModifySQL.Strings = (
      'update BOLSAVALORES'
      'set'
      '  IDBOLSAVALORES = :IDBOLSAVALORES,'
      '  SGLBOLSAVALORES = :SGLBOLSAVALORES,'
      '  MOECODIGO = :MOECODIGO,'
      '  IDCUSTODIANTE = :IDCUSTODIANTE'
      'where'
      '  IDBOLSAVALORES = :OLD_IDBOLSAVALORES')
    InsertSQL.Strings = (
      'insert into BOLSAVALORES'
      '  (IDBOLSAVALORES, SGLBOLSAVALORES, MOECODIGO, IDCUSTODIANTE)'
      'values'
      
        '  (:IDBOLSAVALORES, :SGLBOLSAVALORES, :MOECODIGO, :IDCUSTODIANTE' +
        ')')
    DeleteSQL.Strings = (
      'delete from BOLSAVALORES'
      'where'
      '  IDBOLSAVALORES = :OLD_IDBOLSAVALORES')
    Left = 593
    Top = 56
  end
  inherited qrySubTipo: TwwQuery
    SQL.Strings = (
      
        'SELECT B.IDBOLSAVALORES, B.SGLBOLSAVALORES, B.MOECODIGO, B.IDCUS' +
        'TODIANTE'
      ''
      'FROM BOLSAVALORES B'
      ''
      'WHERE ( B.IDBOLSAVALORES =:IdPessoa )')
    Left = 513
    Top = 56
  end
  inherited dsSubTipo: TwwDataSource
    Top = 64
  end
  inherited ImageList1: TImageList
    Left = 320
    Top = 252
  end
  inherited qryDocumento: TwwQuery
    Left = 487
    Top = 250
  end
  inherited dsDocumento: TwwDataSource
    Left = 375
  end
  inherited updDocumento: TUpdateSQL
    Left = 382
    Top = 322
  end
  inherited qryEscolhePessoa: TwwQuery
    Left = 380
  end
  inherited dsEscolhePessoa: TwwDataSource
    Left = 285
  end
  inherited Pessoa: TPessoa
    SubTipo = stBolsaValores
    FormCaption = 'Bolsa de Valores '
    MostraFoto = False
    Left = 253
  end
  inherited OpenPictureDialog1: TOpenPictureDialog
    Left = 390
  end
  inherited updImagensDoc: TUpdateSQL
    Left = 486
    Top = 408
  end
  inherited qryImagensDoc: TwwQuery
    Left = 292
    Top = 375
  end
  inherited dsImagensDoc: TwwDataSource
    Left = 485
    Top = 299
  end
  inherited qryEstado: TwwQuery
    Left = 279
    Top = 100
  end
  object QryProcuraBolsa: TwwQuery
    DatabaseName = 'basedados'
    ValidateWithMask = True
    Left = 56
    Top = 400
  end
  object QryAux: TwwQuery
    DatabaseName = 'basedados'
    ValidateWithMask = True
    Left = 157
    Top = 372
  end
  object QryBuscaMoeda: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  MOECODIGO, MOEDESC '
      ''
      'FROM MOEDA '
      ''
      'ORDER BY MOEDESC ')
    ValidateWithMask = True
    Left = 536
    Top = 343
  end
  object QryBuscaCustodiante: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  CUS.IDCUSTODIANTE, CUS.SGLCUSTODIANTE'
      'FROM CUSTODIANTE CUS'
      'ORDER BY CUS.SGLCUSTODIANTE')
    ValidateWithMask = True
    Left = 24
    Top = 369
  end
end
