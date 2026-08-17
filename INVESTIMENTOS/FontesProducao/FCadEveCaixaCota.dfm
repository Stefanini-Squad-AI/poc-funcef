inherited frmCadEveCaixaCota: TfrmCadEveCaixaCota
  Left = 20
  Top = 108
  HelpContext = 790047
  Caption = 'frmCadEveCaixaCota'
  ClientHeight = 343
  ClientWidth = 710
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 710
    Height = 257
    inherited Bevel2: TBevel
      Width = 708
    end
    inherited pnlControles: TPanel
      Width = 708
      Height = 211
      object Label2: TLabel
        Left = 16
        Top = 9
        Width = 120
        Height = 13
        Caption = 'Descrição do Evento'
      end
      object Label3: TLabel
        Left = 16
        Top = 57
        Width = 103
        Height = 13
        Caption = 'Tipo de Operação'
      end
      object Label4: TLabel
        Left = 16
        Top = 149
        Width = 35
        Height = 13
        Caption = 'Regra'
      end
      object Label1: TLabel
        Left = 16
        Top = 103
        Width = 120
        Height = 13
        Caption = 'Tipo de Investimento'
      end
      object dbeDescricao: TwwDBEdit
        Left = 16
        Top = 25
        Width = 364
        Height = 21
        DataField = 'DESCCAIXACOTA'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dblTipoOperacao: TwwDBLookupCombo
        Left = 16
        Top = 73
        Width = 430
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCTIPOOPERACAO'#9'60'#9'Tipo de Operação'#9'F'
          'DESCTIPOINVEST'#9'25'#9'Tipo de Investimento'#9'F')
        DataField = 'IDOPERACAO'
        DataSource = ds
        LookupTable = qryTipoOperacao
        LookupField = 'IDOPERACAO'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnCloseUp = dblTipoOperacaoCloseUp
        OnExit = dblTipoOperacaoExit
      end
      object dblRegra: TwwDBLookupCombo
        Left = 16
        Top = 165
        Width = 323
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEREGRA'#9'60'#9'Regra'#9'F')
        DataField = 'IDREGRA'
        DataSource = ds
        LookupTable = qryRegra
        LookupField = 'IDREGRA'
        Options = [loRowLines, loTitles]
        TabOrder = 2
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object Panel2: TPanel
        Left = 456
        Top = 21
        Width = 115
        Height = 165
        BevelOuter = bvLowered
        TabOrder = 3
        object dbchkCotiza: TDBCheckBox
          Left = 7
          Top = 127
          Width = 73
          Height = 17
          Caption = 'Cotiza'
          DataField = 'STACOTIZA'
          DataSource = ds
          TabOrder = 2
          ValueChecked = 'S'
          ValueUnchecked = 'N'
          Visible = False
        end
        object dbchkCota: TDBCheckBox
          Left = 7
          Top = 5
          Width = 57
          Height = 17
          Caption = 'Cota'
          DataField = 'STACOTA'
          DataSource = ds
          TabOrder = 0
          ValueChecked = 'S'
          ValueUnchecked = 'N'
          OnClick = dbchkCotaClick
        end
        object dbrAtivoPassivo: TDBRadioGroup
          Left = 12
          Top = 28
          Width = 90
          Height = 86
          DataField = 'STAATIVOPASSIVO'
          DataSource = ds
          Items.Strings = (
            '&Ativo'
            '&Passivo'
            '&Outros')
          TabOrder = 1
          Values.Strings = (
            'A'
            'P'
            'N')
        end
      end
      object Panel3: TPanel
        Left = 582
        Top = 21
        Width = 115
        Height = 122
        BevelOuter = bvLowered
        Caption = ' '
        TabOrder = 4
        object dbchkCaixa: TDBCheckBox
          Left = 7
          Top = 5
          Width = 57
          Height = 17
          Caption = 'Caixa'
          DataField = 'STACAIXA'
          DataSource = ds
          TabOrder = 0
          ValueChecked = 'S'
          ValueUnchecked = 'N'
          OnClick = dbchkCaixaClick
        end
        object dbrSomaDiminui: TDBRadioGroup
          Left = 12
          Top = 28
          Width = 90
          Height = 86
          DataField = 'STASOMADIMINUI'
          DataSource = ds
          Items.Strings = (
            '&Soma'
            '&Diminui'
            '&Outros')
          TabOrder = 1
          Values.Strings = (
            'S'
            'D'
            'N')
        end
      end
      object DBCheckBox1: TDBCheckBox
        Left = 583
        Top = 150
        Width = 116
        Height = 17
        Hint = 'Sinsibiliza a operação com o CPMF Gerencial'
        Caption = 'CPMF Gerencial'
        DataField = 'STACPMF'
        DataSource = ds
        TabOrder = 5
        ValueChecked = 'S'
        ValueUnchecked = 'N'
      end
      object dbeTipoInvest: TwwDBEdit
        Left = 16
        Top = 119
        Width = 321
        Height = 21
        Color = clBtnFace
        DataField = 'DESCTIPOINVEST'
        DataSource = ds
        Enabled = False
        TabOrder = 6
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    inherited dbGrd: TwwDBGrid
      Width = 708
      Height = 211
      Selected.Strings = (
        'DESCCAIXACOTA'#9'60'#9'Evento'
        'DESCTIPOINVEST'#9'21'#9'Tipo de Investimento'
        'DESCTIPOOPERACAO'#9'80'#9'Tipo de Operação'
        'DESCTIPODESPINV'#9'30'#9'Tipo de Despesa'
        'STACAIXA'#9'4'#9'Caixa'
        'STACOTA'#9'3'#9'Cota'
        'STAATIVOPASSIVO'#9'12'#9'Ativo / Passivo'
        'STACOTIZA'#9'5'#9'Cotiza'
        'STASOMADIMINUI'#9'12'#9'Soma / Diminui'
        'NOMEREGRA'#9'60'#9'Regra de Cálculo'
        'STACPMF'#9'4'#9'CPMF')
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgWordWrap]
      ParentFont = False
      TitleFont.Color = clMaroon
    end
    inherited pnlTitulo: TPanel
      Width = 708
      inherited lbNomItem: TfcLabel
        Width = 242
        Caption = 'Eventos de Caixa / Cota'
      end
    end
  end
  inherited Dock972: TDock97
    Width = 710
  end
  inherited Dock971: TDock97
    Top = 304
    Width = 710
    inherited tb97Fundo: TToolbar97
      Left = 538
      DockPos = 586
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 369
      DockPos = 417
    end
    inherited fraMens: TfraMensagem
      Width = 370
      inherited pnlProgresso: TPanel
        Width = 370
        inherited pnlProgressoMensagem: TPanel
          Width = 208
          inherited lblProgressoMensagem: TfcLabel
            Width = 206
          end
        end
        inherited pnlProgressoBarra: TPanel
          Left = 209
          Width = 160
          inherited pgbProcesso: TProgressBar
            Width = 158
          end
        end
      end
    end
  end
  inherited ds: TwwDataSource
    Left = 374
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update EVENTOCAIXACOTA'
      'set'
      '  IDREGRA = :IDREGRA,'
      '  IDTIPOINVEST = :IDTIPOINVEST,'
      '  IDTIPOOPERACAO = :IDTIPOOPERACAO,'
      '  DESCCAIXACOTA = :DESCCAIXACOTA,'
      '  STACAIXA = :STACAIXA,'
      '  STACOTA = :STACOTA,'
      '  STAATIVOPASSIVO = :STAATIVOPASSIVO,'
      '  STASOMADIMINUI = :STASOMADIMINUI,'
      '  STACOTIZA = :STACOTIZA,'
      '  IDTIPODESPINVEST = :IDTIPODESPINVEST,'
      '  STACPMF = :STACPMF'
      'where'
      '  IDEVENTOCAIXACOTA = :OLD_IDEVENTOCAIXACOTA')
    InsertSQL.Strings = (
      'insert into EVENTOCAIXACOTA'
      
        '  (IDEVENTOCAIXACOTA, IDREGRA, IDTIPOINVEST, IDTIPOOPERACAO, DES' +
        'CCAIXACOTA, '
      
        '   STACAIXA, STACOTA, STAATIVOPASSIVO, STASOMADIMINUI, STACOTIZA' +
        ', IDTIPODESPINVEST, '
      '   STACPMF)'
      'values'
      
        '  (:IDEVENTOCAIXACOTA, :IDREGRA, :IDTIPOINVEST, :IDTIPOOPERACAO,' +
        ' :DESCCAIXACOTA, '
      
        '   :STACAIXA, :STACOTA, :STAATIVOPASSIVO, :STASOMADIMINUI, :STAC' +
        'OTIZA, '
      '   :IDTIPODESPINVEST, :STACPMF)')
    DeleteSQL.Strings = (
      'delete from EVENTOCAIXACOTA'
      'where'
      '  IDEVENTOCAIXACOTA = :OLD_IDEVENTOCAIXACOTA')
    Left = 402
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'EVENTOCAIXACOTA.DESCCAIXACOTA'
      'TIPOINVEST.DESCTIPOINVEST'
      'TIPOOPERACAO.DESCTIPOOPERACAO'
      'TIPODESPINVEST.DESCTIPODESPINV')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Evento Caixa / Cota'
      'Tipo de Investimento'
      'Tipo de Operação'
      'Tipo de Despesa')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'EVENTOCAIXACOTA'
      'TIPOINVEST'
      'TIPOOPERACAO'
      'TIPODESPINVEST')
    CamposChave.Strings = (
      'EVENTOCAIXACOTA.IDEVENTOCAIXACOTA')
    Filtro.Strings = (
      'EVENTOCAIXACOTA.IDTIPOINVEST = TIPOINVEST.IDTIPOINVEST(+)'
      'EVENTOCAIXACOTA.IDTIPOOPERACAO = TIPOOPERACAO.IDTIPOOPERACAO(+)'
      'EVENTOCAIXACOTA.IDTIPOINVEST = TIPOOPERACAO.IDTIPOINVEST(+)'
      
        'EVENTOCAIXACOTA.IDTIPODESPINVEST = TIPODESPINVEST.IDTIPODESPINVE' +
        'ST(+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '40'
      '60'
      '60'
      '60')
    ExibePergunta = False
    Left = 317
  end
  inherited ImlPadrao: TImageList
    Left = 265
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 300
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT E.IDEVENTOCAIXACOTA,'
      '       E.DESCCAIXACOTA,'
      '       E.IDTIPOINVEST,'
      '       T.DESCTIPOINVEST,'
      '       E.IDTIPOOPERACAO,'
      '       O.DESCTIPOOPERACAO,'
      '       E.IDTIPODESPINVEST,'
      '       D.DESCTIPODESPINV,'
      
        '       DECODE(NVL(E.IDTIPOOPERACAO,0),0,E.IDTIPODESPINVEST||10||' +
        'E.IDTIPOINVEST,E.IDTIPOOPERACAO||1000||E.IDTIPOINVEST) AS IDOPER' +
        'ACAO,'
      '       E.STACAIXA,'
      '       E.STACOTA,'
      '       E.STAATIVOPASSIVO,'
      '       E.STACOTIZA,'
      '       E.STASOMADIMINUI,'
      '       E.IDREGRA,'
      '       R.NOMEREGRA,'
      '       E.STACPMF'
      
        'FROM  EVENTOCAIXACOTA E, TIPOINVEST T, TIPOOPERACAO O, TIPODESPI' +
        'NVEST D, REGRA R'
      'WHERE E.IDTIPOINVEST = T.IDTIPOINVEST(+)'
      '  AND E.IDTIPOINVEST = O.IDTIPOINVEST(+)'
      '  AND E.IDTIPOOPERACAO = O.IDTIPOOPERACAO(+)'
      '  AND E.IDTIPODESPINVEST = D.IDTIPODESPINVEST(+)'
      '  AND E.IDREGRA = R.IDREGRA(+)'
      
        '  AND ((:IDTIPOINVEST IS NULL) OR (E.IDTIPOINVEST = :IDTIPOINVES' +
        'T))'
      
        '  AND ((:IDTIPOOPERACAO IS NULL) OR (E.IDTIPOOPERACAO = :IDTIPOO' +
        'PERACAO))'
      
        '  AND ((:IDTIPODESPINVEST IS NULL) OR (E.IDTIPODESPINVEST = :IDT' +
        'IPODESPINVEST))'
      '  AND ((:STACAIXACOTA IS NULL) OR'
      
        '       (((:STACAIXACOTA = '#39'CA'#39') AND (E.STACAIXA = '#39'S'#39') AND (E.ST' +
        'ACOTA = '#39'N'#39')) OR'
      
        '        ((:STACAIXACOTA = '#39'CO'#39') AND (E.STACAIXA = '#39'N'#39') AND (E.ST' +
        'ACOTA = '#39'S'#39')) OR'
      
        '        ((:STACAIXACOTA = '#39'CC'#39') AND (E.STACAIXA = '#39'S'#39') AND (E.ST' +
        'ACOTA = '#39'S'#39')) OR'
      
        '        ((:STACAIXACOTA = '#39'NN'#39') AND (E.STACAIXA = '#39'N'#39') AND (E.ST' +
        'ACOTA = '#39'N'#39')) ))'
      'ORDER BY E.DESCCAIXACOTA'
      ' ')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPOOPERACAO'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPODESPINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftInteger
        Name = 'IDTIPODESPINVEST'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'STACAIXACOTA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'STACAIXACOTA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'STACAIXACOTA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'STACAIXACOTA'
        ParamType = ptResult
      end
      item
        DataType = ftString
        Name = 'STACAIXACOTA'
        ParamType = ptResult
      end>
    object qryDESCCAIXACOTA: TStringField
      DisplayLabel = 'Evento'
      DisplayWidth = 40
      FieldName = 'DESCCAIXACOTA'
      Size = 40
    end
    object qryDESCTIPOINVEST: TStringField
      DisplayLabel = 'Tipo de Investimento'
      DisplayWidth = 21
      FieldName = 'DESCTIPOINVEST'
      Size = 60
    end
    object qryDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Tipo de Operação'
      DisplayWidth = 80
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object qryDESCTIPODESPINV: TStringField
      DisplayLabel = 'Tipo de Despesa'
      DisplayWidth = 60
      FieldName = 'DESCTIPODESPINV'
      Size = 60
    end
    object qrySTACAIXA: TStringField
      DisplayLabel = 'Caixa'
      DisplayWidth = 4
      FieldName = 'STACAIXA'
      FixedChar = True
      Size = 1
    end
    object qrySTACOTA: TStringField
      DisplayLabel = 'Cota'
      DisplayWidth = 3
      FieldName = 'STACOTA'
      FixedChar = True
      Size = 1
    end
    object qrySTAATIVOPASSIVO: TStringField
      DisplayLabel = 'Ativo / Passivo'
      DisplayWidth = 12
      FieldName = 'STAATIVOPASSIVO'
      FixedChar = True
      Size = 1
    end
    object qrySTACOTIZA: TStringField
      DisplayLabel = 'Cotiza'
      DisplayWidth = 5
      FieldName = 'STACOTIZA'
      FixedChar = True
      Size = 1
    end
    object qrySTASOMADIMINUI: TStringField
      DisplayLabel = 'Soma / Diminui'
      DisplayWidth = 12
      FieldName = 'STASOMADIMINUI'
      FixedChar = True
      Size = 1
    end
    object qryNOMEREGRA: TStringField
      DisplayLabel = 'Regra de Cálculo'
      DisplayWidth = 60
      FieldName = 'NOMEREGRA'
      Size = 60
    end
    object qrySTACPMF: TStringField
      DisplayLabel = 'CPMF'
      DisplayWidth = 4
      FieldName = 'STACPMF'
      FixedChar = True
      Size = 1
    end
    object qryIDEVENTOCAIXACOTA: TFloatField
      FieldName = 'IDEVENTOCAIXACOTA'
      Visible = False
    end
    object qryIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Visible = False
    end
    object qryIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Visible = False
    end
    object qryIDTIPODESPINVEST: TFloatField
      FieldName = 'IDTIPODESPINVEST'
      Visible = False
    end
    object qryIDOPERACAO: TStringField
      FieldName = 'IDOPERACAO'
      Visible = False
      Size = 84
    end
    object qryIDREGRA: TFloatField
      FieldName = 'IDREGRA'
      Visible = False
    end
  end
  object qryTipoOperacao: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT T.DESCTIPOOPERACAO,'
      
        '       DECODE(NVL(T.IDTIPOOPERACAO,0),0,T.IDTIPODESPINVEST||10||' +
        'T.IDTIPOINVEST,T.IDTIPOOPERACAO||1000||T.IDTIPOINVEST) AS IDOPER' +
        'ACAO,'
      '       I.DESCTIPOINVEST,'
      '       T.IDTIPOOPERACAO, T.IDTIPODESPINVEST, T.IDTIPOINVEST'
      'FROM'
      '  (SELECT'
      
        '      DESCTIPOOPERACAO, IDTIPOOPERACAO, 0 AS IDTIPODESPINVEST, I' +
        'DTIPOINVEST'
      '   FROM'
      '      TIPOOPERACAO'
      '   UNION'
      '   SELECT'
      
        '      DESCTIPODESPINV AS DESCTIPOOPERACAO, 0 AS IDTIPOOPERACAO, ' +
        'IDTIPODESPINVEST, 2 AS IDTIPOINVEST'
      '   FROM  TIPODESPINVEST ) T, TIPOINVEST I'
      'WHERE T.IDTIPOINVEST = I.IDTIPOINVEST'
      ''
      'ORDER BY DESCTIPOOPERACAO'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 476
    Top = 4
    object qryTipoOperacaoDESCTIPOOPERACAO: TStringField
      DisplayLabel = 'Tipo de Operação'
      DisplayWidth = 60
      FieldName = 'DESCTIPOOPERACAO'
      Size = 60
    end
    object qryTipoOperacaoDESCTIPOINVEST: TStringField
      DisplayLabel = 'Tipo de Investimento'
      DisplayWidth = 25
      FieldName = 'DESCTIPOINVEST'
      Size = 60
    end
    object qryTipoOperacaoIDOPERACAO: TStringField
      FieldName = 'IDOPERACAO'
      Visible = False
      Size = 84
    end
    object qryTipoOperacaoIDTIPOOPERACAO: TFloatField
      FieldName = 'IDTIPOOPERACAO'
      Visible = False
    end
    object qryTipoOperacaoIDTIPODESPINVEST: TFloatField
      FieldName = 'IDTIPODESPINVEST'
      Visible = False
    end
    object qryTipoOperacaoIDTIPOINVEST: TFloatField
      FieldName = 'IDTIPOINVEST'
      Visible = False
    end
  end
  object qryRegra: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT RG.IDREGRA, RG.NOMEREGRA'
      'FROM REGRA RG, TIPOREGRA TR, GRUPOREGRA GR'
      'WHERE RG.IDTIPOREGRA = TR.IDTIPOREGRA AND'
      '      TR.IDGRUPOREGRA = GR.IDGRUPOREGRA AND'
      '      GR.DESCRICAO LIKE '#39'INVESTIMENTO%'#39
      'ORDER BY NOMEREGRA'
      ' ')
    ValidateWithMask = True
    Left = 540
    Top = 4
    object qryRegraNOMEREGRA: TStringField
      DisplayLabel = 'Regra'
      DisplayWidth = 60
      FieldName = 'NOMEREGRA'
      Origin = 'BASEDADOS.REGRA.NOMEREGRA'
      Size = 60
    end
    object qryRegraIDREGRA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDREGRA'
      Origin = 'BASEDADOS.REGRA.IDREGRA'
      Visible = False
    end
  end
end
