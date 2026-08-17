inherited frmCadGrupoAutMT: TfrmCadGrupoAutMT
  Left = 54
  Top = 54
  HelpContext = 110025
  Caption = 'Grupo de Autorização'
  ClientHeight = 480
  ClientWidth = 726
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 726
    Height = 394
    inherited pnlMestre: TPanel
      Width = 724
      Height = 60
      object Label1: TLabel
        Left = 16
        Top = 8
        Width = 58
        Height = 13
        Caption = 'Descrição'
        FocusControl = edDesc
      end
      object edDesc: TDBEdit
        Left = 16
        Top = 24
        Width = 441
        Height = 21
        DataField = 'NOMEGRUPOAUT'
        DataSource = ds
        TabOrder = 0
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 61
      Width = 724
      Height = 332
      Tabs.Strings = (
        'Grupos de Responsabilidade')
      inherited pgctrlDetalhe: TPageControl
        Width = 626
        Height = 273
        inherited tbsDet: TTabSheet
          Caption = 'Grupos de Responsabilidade'
          ImageIndex = 1
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 618
            Height = 245
            Selected.Strings = (
              'SEQAUTORIZACAO'#9'1'#9'   '#9'F'
              'DESCGRPRESPON'#9'30'#9'Grupo de Responsabilidade'#9'F'
              'DESCUNIDNEG'#9'25'#9'Atividade/Projeto'#9'F'
              'NUMAUTORIZACAO'#9'10'#9'Nº de Autorizações'#9'F'
              'DESCCENTRESP'#9'30'#9'Centro de Responsabilidade'#9'F'
              'DESCGRUPOPROD'#9'30'#9'Grupo de Produto'#9'F'
              'NOME'#9'30'#9'Centro de Custo'#9'F'
              'VLRINICIAL'#9'10'#9'Valor~Inicial'#9'F'
              'VLRFINAL'#9'10'#9'Valor~Final'#9'F'
              'TIPODOCUMENTO'#9'35'#9'Tipo de Documento'#9'F')
            TitleLines = 2
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 618
            Height = 245
            object Label2: TLabel
              Left = 16
              Top = 8
              Width = 157
              Height = 13
              Caption = 'Grupo de Responsabilidade'
              FocusControl = edDesc
            end
            object Label4: TLabel
              Left = 304
              Top = 8
              Width = 92
              Height = 13
              Caption = 'Centro de Custo'
              FocusControl = edDesc
            end
            object Label6: TLabel
              Left = 16
              Top = 56
              Width = 160
              Height = 13
              Caption = 'Centro de Responsabilidade'
              FocusControl = edDesc
            end
            object Label7: TLabel
              Left = 304
              Top = 56
              Width = 107
              Height = 13
              Caption = 'Grupo de Produtos'
              FocusControl = edDesc
            end
            object Label8: TLabel
              Left = 16
              Top = 104
              Width = 108
              Height = 13
              Caption = 'Atividade / Projeto'
              FocusControl = edDesc
            end
            object Label13: TLabel
              Left = 304
              Top = 104
              Width = 110
              Height = 13
              Caption = 'Nº de Autorizações'
              FocusControl = edDesc
            end
            object Label9: TLabel
              Left = 448
              Top = 104
              Width = 130
              Height = 13
              Caption = 'Nº  Ordem das Autoriz.'
              FocusControl = edDesc
            end
            object Label5: TLabel
              Left = 16
              Top = 152
              Width = 67
              Height = 13
              Caption = 'Valor inicial'
              FocusControl = edDesc
            end
            object Label10: TLabel
              Left = 145
              Top = 172
              Width = 15
              Height = 13
              Caption = 'de'
              FocusControl = edDesc
            end
            object Label11: TLabel
              Left = 168
              Top = 152
              Width = 61
              Height = 13
              Caption = 'Valor Final'
              FocusControl = edDesc
            end
            object Label12: TLabel
              Left = 304
              Top = 152
              Width = 39
              Height = 13
              Caption = 'Moeda'
              FocusControl = edDesc
            end
            object Label3: TLabel
              Left = 16
              Top = 194
              Width = 112
              Height = 13
              Caption = 'Tipo de Documento'
              FocusControl = edDesc
            end
            object dblcGrpResp: TCMDBLookupCombo
              Left = 16
              Top = 24
              Width = 273
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'30'#9'Descrição')
              DataField = 'IDGRPRESPON'
              DataSource = dsDet
              LookupTable = cdsGrupoRespon
              LookupField = 'IDGRPRESPON'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object dblcCentCust: TCMDBLookupCombo
              Left = 304
              Top = 24
              Width = 289
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'30'#9'Descrição'
                'CODCENTROCUSTO'#9'10'#9'Código')
              DataField = 'CODCENTROCUSTO'
              DataSource = dsDet
              LookupTable = cdsCentroCusto
              LookupField = 'CODCENTROCUSTO'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object dblcCentResp: TCMDBLookupCombo
              Left = 16
              Top = 72
              Width = 273
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'30'#9'Descrição'
                'CODCENTRORESPON'#9'10'#9'Código')
              DataField = 'CODCENTRORESPON'
              DataSource = dsDet
              LookupTable = cdsCentroRespon
              LookupField = 'CODCENTRORESPON'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object dblcGrpProd: TCMDBLookupCombo
              Left = 304
              Top = 72
              Width = 289
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCGRUPOPROD'#9'30'#9'Descrição'
                'CODGRUPOPROD'#9'10'#9'Código')
              DataField = 'CODGRUPOPROD'
              DataSource = dsDet
              LookupTable = cdsGrupoProd
              LookupField = 'CODGRUPOPROD'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object dblcUnNegoc: TCMDBLookupCombo
              Left = 16
              Top = 120
              Width = 273
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'25'#9'Descrição'
                'UNECODIGO'#9'10'#9'Código')
              DataField = 'UNIDNEGOC'
              DataSource = dsDet
              LookupTable = cdsAtivProj
              LookupField = 'UNIDNEGOC'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 4
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object dbreNumAuto: TDBRealEdit
              Left = 304
              Top = 120
              Width = 137
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '1')
              TabOrder = 5
              WordWrap = False
              IntDigits = 10
              DecDigits = 0
              NumberFormat = fNumber
              Signal = False
              DataField = 'NUMAUTORIZACAO'
              DataSource = dsDet
            end
            object edSeqAut: TDBRealEdit
              Left = 448
              Top = 120
              Width = 145
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0')
              TabOrder = 6
              WordWrap = False
              IntDigits = 10
              DecDigits = 0
              NumberFormat = fNumber
              Signal = False
              DataField = 'SEQAUTORIZACAO'
              DataSource = dsDet
            end
            object edValor: TDBRealEdit
              Left = 16
              Top = 168
              Width = 121
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 7
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLRINICIAL'
              DataSource = dsDet
            end
            object DBRealEdit1: TDBRealEdit
              Left = 168
              Top = 168
              Width = 120
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 8
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLRFINAL'
              DataSource = dsDet
            end
            object dblcMoeda: TCMDBLookupCombo
              Left = 304
              Top = 168
              Width = 289
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'MOEDESC'#9'20'#9'Descrição'
                'MOECODIGO'#9'10'#9'Código')
              DataField = 'MOECODIGO'
              DataSource = dsDet
              LookupTable = cdsMoeda
              LookupField = 'MOECODIGO'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 9
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object CMDBLookupCombo1: TCMDBLookupCombo
              Left = 16
              Top = 210
              Width = 273
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'35'#9'Descriçao'#9'F'
                'RECPAG'#9'16'#9'Sistema'#9'F')
              DataField = 'CODTIPDOC'
              DataSource = dsDet
              LookupTable = cdsTipoDocRecPag
              LookupField = 'CODTIPDOC'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 10
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 716
      end
      inherited Dock974: TDock97
        Left = 630
        Height = 273
      end
    end
  end
  inherited Dock972: TDock97
    Width = 726
  end
  inherited Dock971: TDock97
    Top = 441
    Width = 726
    inherited tb97Fundo: TToolbar97
      Left = 367
      inherited bbtnSair: TBitBtn
        Tag = 99
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 110025
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnCancelar: TBitBtn
        Tag = 99
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 77
    Top = 18
    TargetsData = (
      1
      3
      (
        'TDBRealEdit'
        'Text'
        0)
      (
        'TwwDBRichEditMSWord'
        'Text'
        0)
      (
        'TDBMemo'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 174
    Top = 18
  end
  inherited ImlPadrao: TImageList
    Left = 15
    Top = 15
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 274
    Top = 18
  end
  inherited Cds: TCMClientDataSet
    Left = 223
    Top = 18
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'RADGRUPOAUTORIZA.NOMEGRUPOAUT')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Nome do Grupo')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'RADGRUPOAUTORIZA')
    CamposChave.Strings = (
      'RADGRUPOAUTORIZA.IDGRUPOAUTORIZA')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    ExibePergunta = False
    Left = 412
    Top = 18
  end
  inherited CmeDetalhe: TCmEventosCadastro
    OpenDsAutomatico = True
    Left = 338
    Top = 18
  end
  inherited dsDet: TwwDataSource
    DataSet = cdsDet
    Left = 496
    Top = 18
  end
  object cdsDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    AfterPost = cdsDetAfterPost
    Left = 544
    Top = 18
  end
  object cdsGrupoProd: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 507
    Top = 69
  end
  object cdsMoeda: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 595
    Top = 69
  end
  object cdsGrupoRespon: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 227
    Top = 69
  end
  object cdsCentroCusto: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 419
    Top = 69
  end
  object cdsCentroRespon: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 315
    Top = 69
  end
  object cdsAtivProj: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 667
    Top = 69
  end
  object sqlGrupoProd: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '            CODGRUPOPROD,'
      '            DESCGRUPOPROD'
      'FROM'
      '            GRUPPROD'
      'ORDER BY CODGRUPOPROD')
    ClientDataSet = cdsGrupoProd
    Left = 525
    Top = 120
  end
  object sqlTipoDocRecPag: TCMSqlParams
    SQL.Strings = (
      'SELECT '
      '  CODTIPDOC, '
      '  DESCRICAO, '
      
        '  DECODE(RECPAG, '#39'P'#39', '#39'CONTAS A PAGAR'#39', '#39'CONTAS A RECEBER'#39') AS R' +
        'ECPAG '
      'FROM TIPODOCRECPAG'
      'ORDER BY DESCRICAO')
    ClientDataSet = cdsTipoDocRecPag
    Left = 341
    Top = 359
  end
  object cdsTipoDocRecPag: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 397
    Top = 359
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      'SELECT'
      '      AUT.IDGRPRESPON,'
      '      AUT.IDGRUPOAUTORIZA,'
      '      AUT.CODCENTRORESPON,'
      '      AUT.IDPESSOA,'
      '      AUT.CODGRUPOPROD,'
      '      AUT.CODCENTROCUSTO,'
      '      AUT.IDEMPRESA,'
      '      AUT.UNIDNEGOC,'
      '      AUT.NUMAUTORIZACAO,'
      '      AUT.VLRINICIAL,'
      '      AUT.VLRFINAL,'
      '      AUT.MOECODIGO,'
      '      AUT.SEQAUTORIZACAO,'
      '      AUT.CODTIPDOC,'
      '      CC.NOME,'
      '      GP.DESCGRUPOPROD,'
      '      CR.NOME AS DESCCENTRESP,'
      '      UN.NOME AS DESCUNIDNEG,'
      '      GRP.NOME AS DESCGRPRESPON,'
      '      TDRP.DESCRICAO AS TIPODOCUMENTO  '
      'FROM'
      '      RADGRAUTXGRRESPON AUT,'
      '      CENTCUST CC,'
      '      GRUPPROD GP,'
      '      CENTRESPON CR,'
      '      UNIDNEGOCIO UN,'
      '      RADGRPRESPON GRP,'
      '      TIPODOCRECPAG TDRP             '
      'WHERE                                     '
      '     ( AUT.IDGRUPOAUTORIZA = 103)     '
      'AND  ( AUT.IDPESSOA = 1)             '
      'AND  ( AUT.IDEMPRESA = CC.IDEMPRESA(+))                       '
      'AND  ( AUT.IDPESSOA = CR.IDPESSOA(+))                         '
      'AND  ( AUT.IDPESSOA = UN.IDPESSOA(+))                         '
      'AND  ( AUT.IDGRPRESPON = GRP.IDGRPRESPON)                     '
      'AND  ( AUT.CODCENTROCUSTO = CC.CODCENTROCUSTO(+))             '
      'AND  ( AUT.CODGRUPOPROD = GP.CODGRUPOPROD(+))                 '
      'AND  ( AUT.CODCENTRORESPON = CR.CODCENTRORESPON(+))           '
      'AND  ( AUT.UNIDNEGOC = UN.UNIDNEGOC(+))                   '
      'AND  (AUT.CODTIPDOC = TDRP.CODTIPDOC(+))'
      'ORDER BY AUT.SEQAUTORIZACAO   ')
    ClientDataSet = cdsDet
    Left = 657
    Top = 295
  end
end
