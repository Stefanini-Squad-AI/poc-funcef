inherited frmCadInstFin: TfrmCadInstFin
  Left = 255
  Top = 207
  Caption = 'Instituição Financeira'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited tbcDetalhe: TTabControlDetalhe
      Tabs.Strings = (
        'Documentação'
        'Endereços'
        'Telefones'
        'Contatos'
        'Instituições Financeiras')
      detdbGrids.Strings = (
        ''
        'dbGrdDet'
        'dbgTelefone'
        'dbgContato'
        '')
      inherited pgctrlDetalhe: TPageControl
        ActivePage = tbsTelefone
        inherited tbsDocumento: TTabSheet
          inherited PnlDocumentos_Padrao: TPanel
            inherited pnlFoto: TPanel
              Visible = False
            end
          end
        end
        object TbsInstFin: TTabSheet
          Caption = 'Instituições Financeiras'
          object GroupBox1: TGroupBox
            Left = 8
            Top = 8
            Width = 289
            Height = 49
            Caption = 'Instituição Financeira'
            TabOrder = 0
            object LblSigla: TLabel
              Left = 8
              Top = 24
              Width = 37
              Height = 13
              Caption = 'Sigla :'
            end
            object DBESIGLA: TwwDBEdit
              Left = 129
              Top = 16
              Width = 145
              Height = 21
              DataField = 'SIGLAINSTFIN'
              DataSource = dsSubTipo
              TabOrder = 0
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
          end
        end
      end
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
      'INSTFIN.SIGLAINSTFIN'
      'PESSOA.NOME'
      'PESSOA.RAZAOSOCIAL')
    Descricao.Strings = (
      'Sigla'
      'Nome da Instituição '
      'Razão Social ')
    Tabelas.Strings = (
      'INSTFIN'
      'PESSOA')
    CamposChave.Strings = (
      'INSTFIN.IDINSTFIN')
    Filtro.Strings = (
      'INSTFIN.IDINSTFIN = PESSOA.IDPESSOA')
    Larguras.Strings = (
      '15'
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
      'update INSTFIN'
      'set'
      '  IDINSTFIN = :IDINSTFIN,'
      '  SIGLAINSTFIN = :SIGLAINSTFIN'
      'where'
      '  IDINSTFIN = :OLD_IDINSTFIN')
    InsertSQL.Strings = (
      'insert into INSTFIN'
      '  (IDINSTFIN, SIGLAINSTFIN)'
      'values'
      '  (:IDINSTFIN, :SIGLAINSTFIN)')
    DeleteSQL.Strings = (
      'delete from INSTFIN'
      'where'
      '  IDINSTFIN = :OLD_IDINSTFIN')
    Left = 593
    Top = 56
  end
  inherited qrySubTipo: TwwQuery
    SQL.Strings = (
      'select      IF.IDINSTFIN,'
      '               IF.SIGLAINSTFIN'
      ''
      'from        INSTFIN IF'
      ''
      'where  ( IF.IDINSTFIN =:IdPessoa )')
    Left = 513
    Top = 56
  end
  inherited dsSubTipo: TwwDataSource
    Top = 64
  end
  inherited ImageList1: TImageList
    Left = 336
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
    SubTipo = stInstFinanceira
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
  object QryAux: TwwQuery
    DatabaseName = 'basedados'
    ValidateWithMask = True
    Left = 125
    Top = 348
  end
  object qryProcuraInstFin: TwwQuery
    DatabaseName = 'basedados'
    ValidateWithMask = True
    Left = 181
    Top = 348
  end
end
