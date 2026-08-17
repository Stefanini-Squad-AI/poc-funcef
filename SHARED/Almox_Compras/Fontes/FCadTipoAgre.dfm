inherited FrmCadTipoAgre: TFrmCadTipoAgre
  Left = 86
  Top = 67
  Caption = 'Cadastro de Custos Agregados'
  ClientHeight = 432
  ClientWidth = 668
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 668
    Height = 346
    inherited pnlMestre: TPanel
      Width = 666
      Height = 140
      object Label1: TLabel
        Left = 16
        Top = 8
        Width = 58
        Height = 13
        Caption = 'Descrição'
        FocusControl = edDesc
      end
      object Label2: TLabel
        Left = 16
        Top = 48
        Width = 102
        Height = 13
        Caption = 'Tratamento Fiscal'
      end
      object edDesc: TDBEdit
        Left = 16
        Top = 24
        Width = 329
        Height = 21
        DataField = 'DESCCUSTAGREG'
        DataSource = ds
        TabOrder = 0
      end
      object dbrgrpPercValor: TDBRadioGroup
        Left = 16
        Top = 90
        Width = 177
        Height = 41
        Caption = ' Valor a informar '
        Columns = 2
        DataField = 'PERCVALOR'
        DataSource = ds
        Items.Strings = (
          'Percentual'
          'Valor')
        TabOrder = 1
        Values.Strings = (
          'P'
          'V')
      end
      object GrpIncide: TGroupBox
        Left = 360
        Top = 13
        Width = 281
        Height = 118
        TabOrder = 2
        object chkBase: TDBCheckBox
          Left = 8
          Top = 94
          Width = 201
          Height = 17
          Caption = 'Incide sobre a base de Cáculo'
          DataField = 'FLGBASE'
          DataSource = ds
          TabOrder = 4
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object dbchkReceb: TDBCheckBox
          Left = 8
          Top = 14
          Width = 178
          Height = 17
          Caption = 'Incide no Recebimento'
          DataField = 'FLGINCIDERECEB'
          DataSource = ds
          TabOrder = 0
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object dbchkCompra: TDBCheckBox
          Left = 8
          Top = 34
          Width = 178
          Height = 17
          Caption = 'Incide na Compra '
          DataField = 'FLGINCIDECOMPRA'
          DataSource = ds
          TabOrder = 1
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object dbchkNFCompl: TDBCheckBox
          Left = 8
          Top = 54
          Width = 187
          Height = 17
          Caption = 'Incide na Nota Complementar '
          DataField = 'FLGINCIDENFCOMPL'
          DataSource = ds
          TabOrder = 2
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object DBCHKTOTAL: TDBCheckBox
          Left = 8
          Top = 74
          Width = 187
          Height = 17
          Caption = 'Checa Valor Total '
          DataField = 'FLGCHECATOTAL'
          DataSource = ds
          TabOrder = 3
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
      end
      object dblkpcmbTratFiscE: TwwDBLookupCombo
        Left = 16
        Top = 64
        Width = 329
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCTRATFISC'#9'50'#9'Desrição'
          'CODTRATFISC'#9'1'#9'Código')
        DataField = 'CODTRATFISCE'
        DataSource = ds
        LookupTable = qryTratFiscE
        LookupField = 'CODTRATFISC'
        Options = [loColLines, loTitles]
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
      end
      object dbrgrpTotalItem: TDBRadioGroup
        Left = 195
        Top = 90
        Width = 150
        Height = 41
        Caption = ' Aplicar Imposto a '
        Columns = 2
        DataField = 'TOTALITEM'
        DataSource = ds
        Items.Strings = (
          'Nota'
          'Item')
        TabOrder = 4
        Values.Strings = (
          'T'
          'I')
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 141
      Width = 666
      Height = 204
      Tabs.Strings = (
        'Contabilidade')
      inherited pgctrlDetalhe: TPageControl
        Width = 568
        Height = 145
        inherited tbsDet: TTabSheet
          Caption = 'Contabilidade'
          inherited dbgrdDet: TwwDBGrid
            Width = 560
            Height = 117
            Selected.Strings = (
              'PLACONTA'#9'18'#9'Conta'
              'CODSUBCONTA'#9'10'#9'Sub Conta'
              'CENTCUST'#9'30'#9'Centro de Custo'
              'DESUNIDNEGOC'#9'25'#9'Atividade/Projeto')
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            TitleAlignment = taCenter
            TitleLines = 2
          end
          inherited pnlControlesDet: TPanel
            Width = 560
            Height = 117
            object LbSubConta: TLabel
              Left = 8
              Top = 80
              Width = 60
              Height = 13
              Caption = 'Sub Conta'
            end
            object LbUn: TLabel
              Left = 296
              Top = 8
              Width = 100
              Height = 13
              Caption = 'Atividade/Projeto'
            end
            object LbCCusto: TLabel
              Left = 296
              Top = 56
              Width = 92
              Height = 13
              Caption = 'Centro de Custo'
            end
            object dblcUN: TwwDBLookupCombo
              Left = 296
              Top = 24
              Width = 249
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'25'#9'Descrição'
                'UNIDNEGOC'#9'10'#9'Código')
              DataField = 'UNIDNEGOC'
              DataSource = dsDet
              LookupTable = qryUnidNegoc
              LookupField = 'UNIDNEGOC'
              Options = [loTitles]
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = True
              ShowMatchText = True
            end
            object dblcCCusto: TwwDBLookupCombo
              Left = 296
              Top = 72
              Width = 249
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'30'#9'Descrição'
                'CODCENTROCUSTO'#9'10'#9'Código')
              DataField = 'CODCENTROCUSTO'
              DataSource = dsDet
              LookupTable = qryCCust
              LookupField = 'CODCENTROCUSTO'
              Options = [loTitles]
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object cmpConta: TCMProcuraMaskContabil
              Left = 8
              Top = 8
              Width = 273
              Height = 71
              Caption = ' Conta Contábil '
              TabOrder = 0
              MostraMensagens = True
              MostraDescricao = True
              DataSource = dsDet
              DataField = 'PLACONTA'
              Mensagens.EmBranco = 'Conta não pode estar em branco'
              Mensagens.NaoExiste = 'Conta não existe'
              Mensagens.Sintetica = 'Conta não pode ser sintética'
              Mensagens.Analitica = 'Conta não pode ser analítica'
              PermiteChaveInvalida = False
              PermiteChaveEmBranco = False
              AceitaTipoConta = SoAnalitica
              Plano = 0
              Status = scSoAtiva
            end
            object DblkSubConta: TwwDBLookupCombo
              Left = 8
              Top = 96
              Width = 236
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMESUBCONTA'#9'30'#9'Nome da Sub-Conta'
                'CODSUBCONTA'#9'10'#9'Código')
              DataField = 'CODSUBCONTA'
              DataSource = dsDet
              LookupTable = qrySubConta
              LookupField = 'CODSUBCONTA'
              Options = [loTitles]
              TabOrder = 1
              AutoDropDown = False
              ShowButton = True
              AllowClearKey = False
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 658
      end
      inherited Dock974: TDock97
        Left = 572
        Height = 145
        inherited tb97Detalhe: TToolbar97
          inherited bbtnCancelarDet: TBitBtn
            Tag = 9999
          end
          inherited bbtnVoltarDet: TBitBtn
            Tag = 9999
          end
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 668
  end
  inherited Dock971: TDock97
    Top = 393
    Width = 668
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 771
    Top = 65531
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 354
    Top = 7
  end
  inherited ds: TwwDataSource
    Left = 243
    Top = 8
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TIPOAGRE'
      'set'
      '  CODTIPOCUSTAGREG = :CODTIPOCUSTAGREG,'
      '  DESCCUSTAGREG = :DESCCUSTAGREG,'
      '  CODTRATFISCE = :CODTRATFISCE,'
      '  TOTALITEM = :TOTALITEM,'
      '  PERCVALOR = :PERCVALOR,'
      '  CODTRATFISCD = :CODTRATFISCD,'
      '  FLGINCIDERECEB = :FLGINCIDERECEB,'
      '  FLGINCIDECOMPRA = :FLGINCIDECOMPRA,'
      '  FLGINCIDENFCOMPL = :FLGINCIDENFCOMPL,'
      '  FLGCHECATOTAL = :FLGCHECATOTAL,'
      '  FLGBASE = :FLGBASE'
      'where'
      '  CODTIPOCUSTAGREG = :OLD_CODTIPOCUSTAGREG')
    InsertSQL.Strings = (
      'insert into TIPOAGRE'
      '  (CODTIPOCUSTAGREG, DESCCUSTAGREG, CODTRATFISCE, TOTALITEM, '
      'PERCVALOR, '
      '   CODTRATFISCD, FLGINCIDERECEB, FLGINCIDECOMPRA, '
      'FLGINCIDENFCOMPL, FLGCHECATOTAL, '
      '   FLGBASE)'
      'values'
      
        '  (:CODTIPOCUSTAGREG, :DESCCUSTAGREG, :CODTRATFISCE, :TOTALITEM,' +
        ' '
      ':PERCVALOR, '
      '   :CODTRATFISCD, :FLGINCIDERECEB, :FLGINCIDECOMPRA, '
      ':FLGINCIDENFCOMPL, '
      '   :FLGCHECATOTAL, :FLGBASE)')
    DeleteSQL.Strings = (
      'delete from TIPOAGRE'
      'where'
      '  CODTIPOCUSTAGREG = :OLD_CODTIPOCUSTAGREG')
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TIPOAGRE.DESCCUSTAGREG')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição')
    Tabelas.Strings = (
      'TIPOAGRE')
    CamposChave.Strings = (
      'TIPOAGRE.CODTIPOCUSTAGREG')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '25')
    Left = 607
    Top = 13
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 318
    Top = 18
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT '
      '     CODTIPOCUSTAGREG,'
      '     DESCCUSTAGREG,'
      '     CODTRATFISCE,'
      '     TOTALITEM,'
      '     PERCVALOR,'
      '     CODTRATFISCD,'
      '     FLGINCIDERECEB,'
      '     FLGINCIDECOMPRA, '
      '     FLGINCIDENFCOMPL,'
      '     FLGCHECATOTAL,'
      '     FLGBASE'
      'FROM '
      '     TIPOAGRE'
      'WHERE'
      '     (CODTIPOCUSTAGREG = :pCODTIPOCUST)'
      ''
      '')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pCODTIPOCUST'
        ParamType = ptUnknown
      end>
    object qryCODTIPOCUSTAGREG: TFloatField
      FieldName = 'CODTIPOCUSTAGREG'
    end
    object qryDESCCUSTAGREG: TStringField
      FieldName = 'DESCCUSTAGREG'
      Size = 60
    end
    object qryCODTRATFISCE: TStringField
      FieldName = 'CODTRATFISCE'
      Size = 1
    end
    object qryTOTALITEM: TStringField
      FieldName = 'TOTALITEM'
      Size = 1
    end
    object qryPERCVALOR: TStringField
      FieldName = 'PERCVALOR'
      Size = 1
    end
    object qryCODTRATFISCD: TStringField
      FieldName = 'CODTRATFISCD'
      Size = 1
    end
    object qryFLGINCIDERECEB: TStringField
      FieldName = 'FLGINCIDERECEB'
      Size = 1
    end
    object qryFLGINCIDECOMPRA: TStringField
      FieldName = 'FLGINCIDECOMPRA'
      Size = 1
    end
    object qryFLGINCIDENFCOMPL: TStringField
      FieldName = 'FLGINCIDENFCOMPL'
      Size = 1
    end
    object qryFLGCHECATOTAL: TStringField
      FieldName = 'FLGCHECATOTAL'
      Size = 1
    end
    object qryFLGBASE: TStringField
      FieldName = 'FLGBASE'
      Size = 1
    end
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 496
    Top = 20
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  '
      '               TC.IDTIPCUSTAGREGCON,'
      '               TC.IDPESSOA,'
      '               TC.CODTIPOCUSTAGREG,'
      '               TC.UNIDNEGOC,'
      '               TC.CODSUBCONTA,'
      '               TC.IDEMPRESA,'
      '               TC.CODCENTROCUSTO,'
      '               TC.PLANO,'
      '               TC.PLACONTA,'
      '               CC.NOME AS CENTCUST,'
      '               UN.NOME AS DESUNIDNEGOC'
      'FROM'
      '               TIPCUSTAGREGCONTA TC,'
      '               CENTCUST CC,'
      '               UNIDNEGOCIO UN '
      'WHERE'
      '         (TC.CODTIPOCUSTAGREG = :pCODAGREG)'
      '     AND (TC.IDPESSOA  = :pIDPESSOA)'
      '     AND (TC.CODCENTROCUSTO = CC.CODCENTROCUSTO(+))'
      '     AND (TC.IDEMPRESA = CC.IDEMPRESA(+))'
      '     AND (TC.UNIDNEGOC = UN.UNIDNEGOC)'
      '     AND (TC.IDPESSOA  = UN.IDPESSOA)'
      '')
    UpdateObject = updDet
    ValidateWithMask = True
    Left = 395
    Top = 9
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pCODAGREG'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryDetPLACONTA: TStringField
      DisplayLabel = 'Conta'
      DisplayWidth = 18
      FieldName = 'PLACONTA'
      Origin = 'TIPCUSTAGREGCONTA.PLACONTA'
      Size = 18
    end
    object qryDetCODSUBCONTA: TFloatField
      DisplayLabel = 'Sub Conta'
      DisplayWidth = 10
      FieldName = 'CODSUBCONTA'
      Origin = 'TIPCUSTAGREGCONTA.CODSUBCONTA'
    end
    object qryDetCENTCUST: TStringField
      DisplayLabel = 'Centro de Custo'
      DisplayWidth = 30
      FieldName = 'CENTCUST'
      Origin = 'CENTCUST.NOME'
      Size = 30
    end
    object qryDetDESUNIDNEGOC: TStringField
      DisplayLabel = 'Atividade/Projeto'
      DisplayWidth = 25
      FieldName = 'DESUNIDNEGOC'
      Origin = 'UNIDNEGOCIO.NOME'
      Size = 25
    end
    object qryDetIDTIPCUSTAGREGCON: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPCUSTAGREGCON'
      Origin = 'TIPCUSTAGREGCONTA.IDTIPCUSTAGREGCON'
      Visible = False
    end
    object qryDetIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Origin = 'TIPCUSTAGREGCONTA.IDPESSOA'
      Visible = False
    end
    object qryDetCODTIPOCUSTAGREG: TFloatField
      DisplayWidth = 10
      FieldName = 'CODTIPOCUSTAGREG'
      Origin = 'TIPCUSTAGREGCONTA.CODTIPOCUSTAGREG'
      Visible = False
    end
    object qryDetUNIDNEGOC: TFloatField
      DisplayWidth = 10
      FieldName = 'UNIDNEGOC'
      Origin = 'TIPCUSTAGREGCONTA.UNIDNEGOC'
      Visible = False
    end
    object qryDetIDEMPRESA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDEMPRESA'
      Origin = 'TIPCUSTAGREGCONTA.IDEMPRESA'
      Visible = False
    end
    object qryDetCODCENTROCUSTO: TStringField
      DisplayLabel = 'Contro de Custo'
      DisplayWidth = 10
      FieldName = 'CODCENTROCUSTO'
      Origin = 'TIPCUSTAGREGCONTA.CODCENTROCUSTO'
      Visible = False
      Size = 10
    end
    object qryDetPLANO: TFloatField
      DisplayWidth = 10
      FieldName = 'PLANO'
      Origin = 'TIPCUSTAGREGCONTA.PLANO'
      Visible = False
    end
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update TIPCUSTAGREGCONTA'
      'set'
      '  IDTIPCUSTAGREGCON = :IDTIPCUSTAGREGCON,'
      '  IDPESSOA = :IDPESSOA,'
      '  CODTIPOCUSTAGREG = :CODTIPOCUSTAGREG,'
      '  UNIDNEGOC = :UNIDNEGOC,'
      '  CODSUBCONTA = :CODSUBCONTA,'
      '  IDEMPRESA = :IDEMPRESA,'
      '  CODCENTROCUSTO = :CODCENTROCUSTO,'
      '  PLANO = :PLANO,'
      '  PLACONTA = :PLACONTA'
      'where'
      '  IDTIPCUSTAGREGCON = :OLD_IDTIPCUSTAGREGCON')
    InsertSQL.Strings = (
      'insert into TIPCUSTAGREGCONTA'
      '  (IDTIPCUSTAGREGCON, IDPESSOA, CODTIPOCUSTAGREG, UNIDNEGOC, '
      'CODSUBCONTA, '
      '   IDEMPRESA, CODCENTROCUSTO, PLANO, PLACONTA)'
      'values'
      
        '  (:IDTIPCUSTAGREGCON, :IDPESSOA, :CODTIPOCUSTAGREG, :UNIDNEGOC,' +
        ' '
      ':CODSUBCONTA, '
      '   :IDEMPRESA, :CODCENTROCUSTO, :PLANO, :PLACONTA)')
    DeleteSQL.Strings = (
      'delete from TIPCUSTAGREGCONTA'
      'where'
      '  IDTIPCUSTAGREGCON = :OLD_IDTIPCUSTAGREGCON')
    Left = 439
    Top = 7
  end
  object qryTratFiscE: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODTRATFISC,DESCTRATFISC  '
      'FROM CM.TRATFISC')
    ValidateWithMask = True
    Left = 188
    Top = 213
  end
  object qryCCust: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '           CODCENTROCUSTO,'
      '           NOME'
      'FROM '
      '           CENTCUST'
      'WHERE '
      '( IDEMPRESA = :IDPESS)'
      'ORDER BY 2')
    ValidateWithMask = True
    Left = 251
    Top = 211
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESS'
        ParamType = ptUnknown
      end>
  end
  object qryUnidNegoc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '        UNIDNEGOC,'
      '        NOME '
      'FROM '
      '        UNIDNEGOCIO '
      'WHERE '
      '        (IDPESSOA = :pIDPESS)'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 314
    Top = 211
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDPESS'
        ParamType = ptUnknown
      end>
  end
  object qrySubConta: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '        NOMESUBCONTA,'
      '        CODSUBCONTA '
      'FROM'
      '        SUBCONTA '
      'WHERE '
      '        (IDPESSOA = :pIDPESS) '
      'ORDER BY NOMESUBCONTA')
    ValidateWithMask = True
    Left = 410
    Top = 211
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDPESS'
        ParamType = ptUnknown
      end>
  end
end
