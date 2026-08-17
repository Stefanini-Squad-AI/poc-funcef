inherited frmCadCustodiante: TfrmCadCustodiante
  HelpContext = 790104
  Caption = 'Custodiante'
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited tbcDetalhe: TTabControlDetalhe
      Tabs.Strings = (
        'Documentação'
        'Endereços'
        'Telefones'
        'Contatos'
        'Custodiantes')
      detdbGrids.Strings = (
        ''
        'dbGrdDet'
        'dbgTelefone'
        'dbgContato'
        '')
      inherited pgctrlDetalhe: TPageControl
        ActivePage = TbsCustodiante
        inherited tbsDocumento: TTabSheet
          inherited PnlDocumentos_Padrao: TPanel
            inherited pnlFoto: TPanel
              Visible = False
            end
          end
        end
        object TbsCustodiante: TTabSheet
          Caption = 'Custodiantes'
          object GroupBox1: TGroupBox
            Left = 0
            Top = 0
            Width = 241
            Height = 73
            Caption = 'Custodiante'
            TabOrder = 0
            object LblSigla: TLabel
              Left = 8
              Top = 16
              Width = 33
              Height = 13
              Caption = 'Sigla '
            end
            object DBESIGLA: TwwDBEdit
              Left = 9
              Top = 32
              Width = 201
              Height = 21
              DataField = 'SGLCUSTODIANTE'
              DataSource = dsSubTipo
              TabOrder = 0
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
          end
          object ckbAtivoCust: TDBCheckBox
            Left = 12
            Top = 84
            Width = 167
            Height = 17
            Caption = 'Exige Código do Ativo'
            DataField = 'FLGCODATIVOCUST'
            DataSource = dsSubTipo
            TabOrder = 1
            ValueChecked = 'S'
            ValueUnchecked = 'N'
            Visible = False
          end
        end
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 4
  end
  inherited dsDet: TwwDataSource
    Left = 303
    Top = 4
  end
  inherited ds: TwwDataSource
    Left = 500
    Top = 4
  end
  inherited upd: TUpdateSQL
    Left = 457
    Top = 4
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'CUSTODIANTE.SGLCUSTODIANTE'
      'PESSOA.NOME'
      'PESSOA.RAZAOSOCIAL')
    Descricao.Strings = (
      'Sigla'
      'Nome do Custodiante '
      'Razão Social ')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'CUSTODIANTE')
    CamposChave.Strings = (
      'CUSTODIANTE.IDCUSTODIANTE')
    Filtro.Strings = (
      'CUSTODIANTE.IDCUSTODIANTE = PESSOA.IDPESSOA')
    Larguras.Strings = (
      '15'
      '40'
      '40')
    Left = 360
    Top = 4
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 358
  end
  inherited qry: TwwQuery
    Left = 413
    Top = 4
  end
  inherited updSubTipo: TUpdateSQL
    ModifySQL.Strings = (
      'update CUSTODIANTE'
      'set'
      '  IDCUSTODIANTE   = :IDCUSTODIANTE,'
      '  SGLCUSTODIANTE  = :SGLCUSTODIANTE,'
      '  FLGCODATIVOCUST = :FLGCODATIVOCUST'
      'where'
      '  IDCUSTODIANTE = :OLD_IDCUSTODIANTE')
    InsertSQL.Strings = (
      'insert into CUSTODIANTE'
      '  (IDCUSTODIANTE, SGLCUSTODIANTE, FLGCODATIVOCUST)'
      'values'
      '  (:IDCUSTODIANTE, :SGLCUSTODIANTE, :FLGCODATIVOCUST)')
    DeleteSQL.Strings = (
      'delete from CUSTODIANTE'
      'where'
      '  IDCUSTODIANTE = :OLD_IDCUSTODIANTE')
    Left = 699
    Top = 169
  end
  inherited qrySubTipo: TwwQuery
    SQL.Strings = (
      'SELECT C.IDCUSTODIANTE,'
      '       C.SGLCUSTODIANTE,'
      '       C.FLGCODATIVOCUST'
      'FROM CUSTODIANTE C'
      'WHERE ( C.IDCUSTODIANTE =:IdPessoa )')
    Left = 662
    Top = 169
    object qrySubTipoIDCUSTODIANTE: TFloatField
      FieldName = 'IDCUSTODIANTE'
      Origin = 'CUSTODIANTE.IDCUSTODIANTE'
    end
    object qrySubTipoSGLCUSTODIANTE: TStringField
      FieldName = 'SGLCUSTODIANTE'
      Origin = 'CUSTODIANTE.SGLCUSTODIANTE'
      Size = 10
    end
    object qrySubTipoFLGCODATIVOCUST: TStringField
      FieldName = 'FLGCODATIVOCUST'
      Origin = 'CUSTODIANTE.FLGCODATIVOCUST'
      Size = 1
    end
  end
  inherited dsSubTipo: TwwDataSource
    Left = 734
    Top = 169
  end
  inherited dsPessoaFisica: TwwDataSource
    Left = 731
    Top = 266
  end
  inherited updPessoaFisica: TUpdateSQL
    Left = 698
    Top = 266
  end
  inherited qryPessoaFisica: TwwQuery
    Left = 662
    Top = 266
  end
  inherited ImageList1: TImageList
    Left = 312
    Top = 340
  end
  inherited qryTelefone: TwwQuery
    Left = 525
    Top = 170
  end
  inherited updTelefone: TUpdateSQL
    Left = 562
  end
  inherited dsTelefone: TwwDataSource
    Left = 601
  end
  inherited dsEndereco: TwwDataSource
    Left = 601
    Top = 224
  end
  inherited updEndereco: TUpdateSQL
    Left = 562
    Top = 224
  end
  inherited qryEndereco: TwwQuery
    Left = 525
    Top = 224
  end
  inherited qryContato: TwwQuery
    Left = 525
    Top = 270
  end
  inherited updContato: TUpdateSQL
    Left = 562
    Top = 270
  end
  inherited dsContato: TwwDataSource
    Left = 601
    Top = 270
  end
  inherited qryRamal: TwwQuery
    Left = 525
    Top = 319
  end
  inherited updRamal: TUpdateSQL
    Left = 562
    Top = 319
  end
  inherited dsRamal: TwwDataSource
    Left = 601
    Top = 319
  end
  inherited qryDocumento: TwwQuery
    Left = 525
    Top = 365
  end
  inherited dsDocumento: TwwDataSource
    Left = 601
    Top = 365
  end
  inherited updDocumento: TUpdateSQL
    Left = 562
    Top = 365
  end
  inherited qryEscolhePessoa: TwwQuery
    Left = 660
    Top = 63
  end
  inherited dsEscolhePessoa: TwwDataSource
    Left = 733
    Top = 64
  end
  inherited Pessoa: TPessoa
    SubTipo = stCustodiante
    MostraFoto = False
    Left = 253
    Top = 4
  end
  inherited OpenPictureDialog1: TOpenPictureDialog
    Left = 382
    Top = 350
  end
  inherited qryImagem: TwwQuery
    Left = 662
    Top = 217
  end
  inherited updImagem: TUpdateSQL
    Left = 699
    Top = 217
  end
  inherited updImagensDoc: TUpdateSQL
    Left = 562
    Top = 408
  end
  inherited qryImagensDoc: TwwQuery
    Left = 525
    Top = 407
  end
  inherited dsImagem: TwwDataSource
    Left = 734
    Top = 217
  end
  inherited dsImagensDoc: TwwDataSource
    Left = 601
    Top = 408
  end
  inherited qryTipoDoc: TwwQuery
    Left = 665
    Top = 365
  end
  inherited MSGrupo: TMontaSelect
    Left = 610
    Top = 4
  end
  inherited qryEstado: TwwQuery
    Left = 207
    Top = 4
  end
  inherited qryCidade: TwwQuery
    Left = 658
  end
  inherited dsCidade: TwwDataSource
    Left = 732
  end
  object QryProcuraCustodiante: TwwQuery
    DatabaseName = 'basedados'
    ValidateWithMask = True
    Left = 664
    Top = 320
  end
end
