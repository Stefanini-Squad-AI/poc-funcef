inherited FrmCadListaRecebedor: TFrmCadListaRecebedor
  Left = 373
  Top = 89
  Width = 804
  Height = 527
  HelpContext = 180037
  BorderIcons = [biSystemMenu, biMinimize, biMaximize, biHelp]
  BorderStyle = bsSizeable
  Caption = 'Lista de Recebedores'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 788
    Height = 403
    inherited tbcDetalhe: TTabControlDetalhe [0]
      Top = 149
      Width = 786
      Height = 253
      inherited pgctrlDetalhe: TPageControl
        Width = 688
        Height = 194
        inherited tbsDet: TTabSheet
          object lblProgresso: TLabel [0]
            Left = 0
            Top = 153
            Width = 680
            Height = 13
            Align = alBottom
            Layout = tlCenter
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 680
            Height = 153
            object Label2: TLabel
              Left = 16
              Top = 8
              Width = 112
              Height = 16
              Caption = 'Nome do Titular'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label3: TLabel
              Left = 16
              Top = 64
              Width = 146
              Height = 16
              Caption = 'Nome do Recebedor'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -13
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object DBcboTit: TwwDBLookupCombo
              Left = 16
              Top = 32
              Width = 257
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'40'#9'Nome do Titular'#9'F')
              Enabled = False
              TabOrder = 0
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
            end
            object DBcboBenef: TwwDBLookupCombo
              Left = 16
              Top = 88
              Width = 257
              Height = 21
              DropDownAlignment = taLeftJustify
              Enabled = False
              TabOrder = 1
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
            end
          end
          inherited dbgrdDet: TwwDBGrid [2]
            Width = 680
            Height = 153
            MemoAttributes = []
            KeyOptions = []
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgTrailingEllipsis, dgShowCellHint]
          end
          object mmRejeitados: TMemo
            Left = 368
            Top = 56
            Width = 185
            Height = 89
            TabOrder = 2
            Visible = False
          end
        end
      end
      inherited Dock973: TDock97
        Width = 778
        inherited tb97BotoesDetalhe: TToolbar97
          inherited sbtnAltDet: TToolbarButton97
            Visible = False
          end
        end
      end
      inherited Dock974: TDock97
        Left = 692
        Height = 194
      end
    end
    inherited pnlMestre: TPanel [1]
      Width = 786
      Height = 148
      object Label1: TLabel
        Left = 8
        Top = 40
        Width = 72
        Height = 16
        Caption = 'Descrição'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Label4: TLabel
        Left = 8
        Top = 8
        Width = 77
        Height = 16
        Caption = 'Nº da Lista'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -13
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblQuant: TLabel
        Left = 220
        Top = 87
        Width = 70
        Height = 13
        Caption = 'Quantidade:'
      end
      object Label5: TLabel
        Left = 99
        Top = 129
        Width = 186
        Height = 13
        Anchors = [akTop, akRight]
        Caption = 'Quant. Beneficiário por Situação'
      end
      object BtnImportar: TBitBtn
        Left = 553
        Top = 77
        Width = 209
        Height = 31
        Anchors = [akTop, akRight]
        Caption = 'Importar'
        TabOrder = 0
        OnClick = BtnImportarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          55555555FFFFFFFF5555555000000005555555577777777FF555550999999900
          55555575555555775F55509999999901055557F55555557F75F5001111111101
          105577FFFFFFFF7FF75F00000000000011057777777777775F755070FFFFFF0F
          01105777F555557F75F75500FFFFFF0FF0105577F555FF7F57575550FF700008
          8F0055575FF7777555775555000888888F005555777FFFFFFF77555550000000
          0F055555577777777F7F555550FFFFFF0F05555557F5FFF57F7F555550F000FF
          0005555557F777557775555550FFFFFF0555555557F555FF7F55555550FF7000
          05555555575FF777755555555500055555555555557775555555}
        NumGlyphs = 2
      end
      object EdtNomeLista: TwwDBEdit
        Left = 96
        Top = 38
        Width = 405
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        DataField = 'NOME'
        DataSource = ds
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbrTipoLista: TDBRadioGroup
        Left = 8
        Top = 72
        Width = 201
        Height = 41
        Caption = ' Tipo de Lista '
        Columns = 2
        DataField = 'FLGTIPOLISTA'
        DataSource = ds
        Items.Strings = (
          '&Temporária'
          '&Permanente')
        TabOrder = 2
        Values.Strings = (
          '0'
          '1')
      end
      object DbEdtNumLista: TwwDBEdit
        Left = 96
        Top = 5
        Width = 121
        Height = 21
        DataField = 'IDLISTA'
        DataSource = ds
        TabOrder = 3
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object RdgTipoArq: TRadioGroup
        Left = 521
        Top = 16
        Width = 262
        Height = 41
        Anchors = [akTop, akRight]
        Caption = ' Tipo de Arquivo '
        Columns = 3
        Items.Strings = (
          '&Matrícula'
          '&Inscrição'
          '&CPF')
        TabOrder = 4
      end
      object btnGeraListaValidacao: TBitBtn
        Left = 343
        Top = 117
        Width = 194
        Height = 31
        Anchors = [akTop, akRight]
        Caption = 'Gera Lista de Validação'
        TabOrder = 6
        OnClick = btnGeraListaValidacaoClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          55555555FFFFFFFF5555555000000005555555577777777FF555550999999900
          55555575555555775F55509999999901055557F55555557F75F5001111111101
          105577FFFFFFFF7FF75F00000000000011057777777777775F755070FFFFFF0F
          01105777F555557F75F75500FFFFFF0FF0105577F555FF7F57575550FF700008
          8F0055575FF7777555775555000888888F005555777FFFFFFF77555550000000
          0F055555577777777F7F555550FFFFFF0F05555557F5FFF57F7F555550F000FF
          0005555557F777557775555550FFFFFF0555555557F555FF7F55555550FF7000
          05555555575FF777755555555500055555555555557775555555}
        NumGlyphs = 2
      end
      object edtQtdePessoa: TwwDBSpinEdit
        Left = 289
        Top = 124
        Width = 46
        Height = 21
        Anchors = [akTop, akRight]
        Increment = 1
        Value = 60
        TabOrder = 5
        UnboundDataType = wwDefault
        OnExit = edtQtdePessoaExit
      end
    end
  end
  inherited Dock972: TDock97
    Width = 788
  end
  inherited Dock971: TDock97
    Top = 450
    Width = 788
  end
  object BtnGeraLstIndiv: TBitBtn [3]
    Left = 553
    Top = 165
    Width = 209
    Height = 31
    Anchors = [akTop, akRight]
    Caption = 'Gera Lista Individual'
    TabOrder = 3
    Visible = False
    OnClick = BtnGeraLstIndivClick
    Kind = bkOK
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 264
    Top = 2
    TargetsData = (
      1
      2
      (
        'TMemo'
        'Text'
        0)
      (
        ''
        'DisplayLabel'
        0))
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 232
    Top = 351
  end
  inherited ds: TwwDataSource
    Left = 548
    Top = 2
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update LISTAFOLHABENEF'
      'set'
      '  IDLISTA = :IDLISTA,'
      '  FLGTIPOLISTA = :FLGTIPOLISTA,'
      '  NOME = :NOME'
      'where'
      '  IDLISTA = :OLD_IDLISTA')
    InsertSQL.Strings = (
      'insert into LISTAFOLHABENEF'
      '  (IDLISTA, FLGTIPOLISTA, NOME)'
      'values'
      '  (:IDLISTA, :FLGTIPOLISTA, :NOME)')
    DeleteSQL.Strings = (
      'delete from LISTAFOLHABENEF'
      'where'
      '  IDLISTA = :OLD_IDLISTA')
    Left = 514
    Top = 2
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'LISTAFOLHABENEF.NOME')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Nome da Lista')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'LISTAFOLHABENEF')
    CamposChave.Strings = (
      'LISTAFOLHABENEF.IDLISTA'
      'LISTAFOLHABENEF.FLGTIPOLISTA'
      'LISTAFOLHABENEF.NOME')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '50')
    Left = 331
    Top = 2
  end
  inherited ImlPadrao: TImageList
    Left = 297
    Top = 2
  end
  inherited CmeCadastro: TCmEventosCadastro
    RepetirInsert = False
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 364
    Top = 2
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '  IDLISTA,'
      '  FLGTIPOLISTA,'
      '  NOME'
      ''
      'FROM'
      '  LISTAFOLHABENEF'
      ''
      'WHERE'
      '  IDLISTA = :IDLISTA'
      '  '
      ''
      ' '
      ' ')
    Left = 481
    Top = 2
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDLISTA'
        ParamType = ptUnknown
      end>
    object qryIDLISTA: TFloatField
      FieldName = 'IDLISTA'
      Origin = 'BASEDADOS.LISTAFOLHABENEF.IDLISTA'
    end
    object qryFLGTIPOLISTA: TFloatField
      FieldName = 'FLGTIPOLISTA'
      Origin = 'BASEDADOS.LISTAFOLHABENEF.FLGTIPOLISTA'
    end
    object qryNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.LISTAFOLHABENEF.NOME'
      Size = 50
    end
  end
  inherited CmeDetalhe: TCmEventosCadastro
    RepetirInsert = False
    Left = 265
    Top = 351
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  LD.IDLISTA,'
      '  EL.MATRICULA,'
      '  PT.NOME AS TITULAR,'
      '  PP.NOME AS RECEBEDOR,'
      '  LD.IDTITULAR,'
      '  LD.IDPESSOA,'
      '  LD.IDREFERENCIA,'
      '  PPP.INSCRICAONUMERO,'
      '  PP.NUMDOCUMENTO'
      'FROM'
      '  LISTAFOLHABENEFDET LD,'
      '  PESSOA PT,'
      '  PESSOA PP,'
      '  ELEGPATRO EL,'
      '  PARTPREVPLAN PPP'
      ''
      'WHERE'
      '    LD.IDLISTA    = :IDLISTA'
      'AND LD.IDTITULAR  = PT.IDPESSOA'
      'AND LD.IDPESSOA   = PP.IDPESSOA'
      'AND LD.IDTITULAR  = EL.IDPESSOA'
      'AND LD.IDTITULAR  = PPP.IDPESSOA'
      'AND EL.IDPESSJUR  = PPP.IDPESSJUR'
      '/*AND FLGDESATIVADO = 0   SIG84036 */'
      'ORDER BY EL.MATRICULA, PP.NOME'
      ''
      ' '
      ' ')
    UpdateObject = UpdDet
    ValidateWithMask = True
    Left = 199
    Top = 351
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDLISTA'
        ParamType = ptUnknown
      end>
    object qryDetMATRICULA: TStringField
      DisplayLabel = 'Matrícula'
      DisplayWidth = 12
      FieldName = 'MATRICULA'
      Origin = 'BASEDADOS.ELEGPATRO.MATRICULA'
      Size = 13
    end
    object qryDetINSCRICAONUMERO: TFloatField
      DisplayLabel = 'Nº de Inscrição'
      DisplayWidth = 10
      FieldName = 'INSCRICAONUMERO'
      Origin = 'BASEDADOS.PARTPREVPLAN.INSCRICAONUMERO'
    end
    object qryDetTITULAR: TStringField
      DisplayLabel = 'Nome do Titular'
      DisplayWidth = 33
      FieldName = 'TITULAR'
      Origin = 'BASEDADOS.PESSOA.NOME'
      Size = 60
    end
    object qryDetRECEBEDOR: TStringField
      DisplayLabel = 'Nome do Recebedor'
      DisplayWidth = 33
      FieldName = 'RECEBEDOR'
      Origin = 'BASEDADOS.PESSOA.NOME'
      Size = 60
    end
    object qryDetNUMDOCUMENTO: TStringField
      DisplayLabel = 'CPF'
      DisplayWidth = 14
      FieldName = 'NUMDOCUMENTO'
      Origin = 'BASEDADOS.PESSOA.NUMDOCUMENTO'
      FixedChar = True
      Size = 18
    end
    object qryDetIDLISTA: TFloatField
      DisplayLabel = 'Número da Lista'
      DisplayWidth = 10
      FieldName = 'IDLISTA'
      Origin = 'BASEDADOS.LISTAFOLHABENEFDET.IDLISTA'
      Visible = False
    end
    object qryDetIDTITULAR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTITULAR'
      Origin = 'BASEDADOS.LISTAFOLHABENEFDET.IDTITULAR'
      Visible = False
    end
    object qryDetIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.LISTAFOLHABENEFDET.IDPESSOA'
      Visible = False
    end
    object qryDetIDREFERENCIA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDREFERENCIA'
      Origin = 'BASEDADOS.LISTAFOLHABENEFDET.IDREFERENCIA'
      Visible = False
    end
  end
  object qryMatric: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 98
    Top = 351
  end
  object OpenDialog1: TOpenDialog
    Left = 328
    Top = 121
  end
  object qryBeneficiarios: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 66
    Top = 351
  end
  object qryDetAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 133
    Top = 351
  end
  object UpdDet: TUpdateSQL
    ModifySQL.Strings = (
      'update LISTAFOLHABENEFDET'
      'set'
      '  IDLISTA = :IDLISTA,'
      '  IDTITULAR = :IDTITULAR,'
      '  IDPESSOA = :IDPESSOA,'
      '  IDREFERENCIA = :IDREFERENCIA'
      'where'
      '  IDLISTA = :OLD_IDLISTA and'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDREFERENCIA = :OLD_IDREFERENCIA')
    InsertSQL.Strings = (
      'insert into LISTAFOLHABENEFDET'
      '  (IDLISTA, IDTITULAR, IDPESSOA, IDREFERENCIA)'
      'values'
      '  (:IDLISTA, :IDTITULAR, :IDPESSOA, :IDREFERENCIA)')
    DeleteSQL.Strings = (
      'delete from LISTAFOLHABENEFDET'
      'where'
      '  IDLISTA = :OLD_IDLISTA and'
      '  IDTITULAR = :OLD_IDTITULAR and'
      '  IDPESSOA = :OLD_IDPESSOA and'
      '  IDREFERENCIA = :OLD_IDREFERENCIA')
    Left = 167
    Top = 351
  end
  object MontaSelect1: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'ELEGPATRO.MATRICULA'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'TITULAR.NOME'
      'BENEFICIARIO.NOME')
    TipodeDado.Strings = (
      'C'
      'N'
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Número de Inscrição'
      'Nome do Titular'
      'Nome do Beneficiário')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'S'
      'S')
    Tabelas.Strings = (
      'ELEGPATRO'
      'PARTPREVPLAN'
      'BFCIARIOTITPLAN'
      'PESSOA BENEFICIARIO '
      'PESSOA TITULAR')
    CamposChave.Strings = (
      'TITULAR.NOME'
      'ELEGPATRO.MATRICULA'
      'PARTPREVPLAN.INSCRICAONUMERO'
      'BENEFICIARIO.NOME'
      'BFCIARIOTITPLAN.IDTITULAR'
      'BFCIARIOTITPLAN.IDPESSJUR'
      'BFCIARIOTITPLAN.IDPLANOPREV'
      'BFCIARIOTITPLAN.IDPESSOA')
    Filtro.Strings = (
      'PARTPREVPLAN.IDPESSJUR=ELEGPATRO.IDPESSJUR'
      'PARTPREVPLAN.IDPESSOA=ELEGPATRO.IDPESSOA'
      'PARTPREVPLAN.FLGDESATIVADO=0'
      'BFCIARIOTITPLAN.IDTITULAR=ELEGPATRO.IDPESSOA'
      'BFCIARIOTITPLAN.IDPESSJUR=ELEGPATRO.IDPESSJUR'
      'TITULAR.IDPESSOA=ELEGPATRO.IDPESSOA'
      'BENEFICIARIO.IDPESSOA=BFCIARIOTITPLAN.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '10'
      '30'
      '30')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = True
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 300
    Top = 351
  end
end
