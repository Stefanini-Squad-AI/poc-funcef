inherited FrmCadGrupUsuXTipoOper: TFrmCadGrupUsuXTipoOper
  Left = 311
  Top = 114
  Caption = 'Restrição de Operação '
  ClientHeight = 384
  ClientWidth = 447
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 447
    Height = 298
    inherited pnlMestre: TPanel
      Width = 445
      Height = 58
      object Label1: TLabel
        Left = 18
        Top = 9
        Width = 112
        Height = 13
        Caption = 'Grupos de Usuários'
      end
      object DbLkcGrupUsu: TwwDBLookupCombo
        Left = 18
        Top = 24
        Width = 401
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMEGRUPO'#9'40'#9'Grupo de Usuários')
        LookupTable = QryGrupUsu
        LookupField = 'IDGRUPO'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        OnChange = DbLkcGrupUsuChange
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 59
      Width = 445
      Tabs.Strings = (
        'Tipos de Operação ')
      inherited pgctrlDetalhe: TPageControl
        Width = 347
        inherited tbsDet: TTabSheet
          Caption = 'Tipos de Operação '
          inherited dbgrdDet: TwwDBGrid
            Width = 339
            Selected.Strings = (
              'DESCTIPOOPERACAO'#9'100'#9'Tipo de Operação')
          end
          inherited pnlControlesDet: TPanel
            Width = 339
            BevelOuter = bvLowered
            object Label2: TLabel
              Left = 17
              Top = 63
              Width = 107
              Height = 13
              Caption = 'Tipo de Operação '
            end
            object Label3: TLabel
              Left = 17
              Top = 15
              Width = 120
              Height = 13
              Caption = 'Tipo de Investimento'
            end
            object wwDBLookupCombo1: TwwDBLookupCombo
              Left = 18
              Top = 78
              Width = 301
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCTIPOOPERACAO'#9'40'#9'Tipo de Operação')
              DataField = 'IDTIPOOPERACAO'
              DataSource = dsDet
              LookupTable = QryTipoOper
              LookupField = 'IDTIPOOPERACAO'
              Options = [loColLines, loRowLines, loTitles]
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object dbLkcTipoInvest: TwwDBLookupCombo
              Left = 18
              Top = 30
              Width = 301
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCTIPOINVEST'#9'40'#9'Tipo de Investimento')
              DataField = 'IDTIPOINVEST'
              DataSource = dsDet
              LookupTable = QryTipoInvest
              LookupField = 'IDTIPOINVEST'
              Options = [loColLines, loRowLines, loTitles]
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 437
      end
      inherited Dock974: TDock97
        Left = 351
        inherited tb97Detalhe: TToolbar97
          inherited bbtnVoltarDet: TBitBtn
            OnClick = bbtnCancelarDetClick
          end
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 447
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 345
    Width = 447
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 411
    Top = 8
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited dsDet: TwwDataSource
    DataSet = QryDet
    Left = 135
    Top = 135
  end
  inherited ds: TwwDataSource
    Left = 251
  end
  inherited upd: TUpdateSQL
    Left = 281
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'GRUPOACESSO.NOMEGRUPO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Grupo de Usuários')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'GRUPOACESSO')
    CamposChave.Strings = (
      'GRUPOACESSO.IDGRUPO')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    Left = 341
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 380
  end
  inherited qry: TwwQuery
    Left = 311
  end
  inherited CmeDetalhe: TCmEventosCadastro
    OnFind = CmeDetalheFind
  end
  object QryGrupUsu: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  GRU.IDGRUPO, GRU.NOMEGRUPO, GRU.IDESPACESSO  '
      ''
      'FROM CM.GRUPOACESSO GRU'
      'ORDER BY GRU.NOMEGRUPO')
    ValidateWithMask = True
    Left = 157
    Top = 68
  end
  object QryTipoOper: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = DsTipoInvest
    SQL.Strings = (
      
        'SELECT  TIP.IDTIPOINVEST, TIP.IDTIPOOPERACAO, TIP.IDMERCADO, TIP' +
        '.CODTIPDOC, TIP.DESCTIPOOPERACAO, '
      
        #9'TIP.NATUREZAOPERACAO, TIP.TIPOCUSTODIA, TIP.VENCIMENTO, TIP.FLG' +
        'GERACONTAB, TIP.FLGGERACAPCAR, '
      #9'TIP.RECPAG, TIP.TIPCREDOR, TIP.FLGGERACAF, TIP.FLGTRANSF,  '
      #9'TIP.FLGCORRET, TIP.FLGORDMOVINV, TIP.IDMOTIVOBLOQUEIO'
      'FROM CM.TIPOOPERACAO TIP'
      'WHERE TIP.IDTIPOINVEST = :IDTIPOINVEST'
      'ORDER BY TIP.DESCTIPOOPERACAO ')
    ValidateWithMask = True
    Left = 301
    Top = 135
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDTIPOINVEST'
        ParamType = ptUnknown
      end>
  end
  object QryDet: TwwQuery
    CachedUpdates = True
    AfterPost = QryDetAfterPost
    AfterCancel = QryDetAfterCancel
    AfterDelete = QryDetAfterDelete
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  GRU.IDTIPOINVEST, GRU.IDTIPOOPERACAO, GRU.IDGRUPO,'
      #9'OPE.DESCTIPOOPERACAO, GRA.NOMEGRUPO'
      ''
      
        'FROM CM.GRUPOUSUXTIPOOPER GRU, CM.TIPOOPERACAO OPE, CM.GRUPOACES' +
        'SO GRA'
      ''
      'WHERE   GRU.IDGRUPO = :IDGRUPO    AND'
      #9'GRU.IDGRUPO = GRA.IDGRUPO AND'
      #9'GRU.IDTIPOOPERACAO = OPE.IDTIPOOPERACAO '
      '')
    UpdateObject = UpdDet
    ValidateWithMask = True
    Left = 106
    Top = 135
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDGRUPO'
        ParamType = ptUnknown
      end>
  end
  object DsGrupUsu: TwwDataSource
    DataSet = QryGrupUsu
    Left = 186
    Top = 68
  end
  object UpdDet: TUpdateSQL
    ModifySQL.Strings = (
      'update CM.GRUPOUSUXTIPOOPER'
      'set'
      '  IDTIPOINVEST = :IDTIPOINVEST,'
      '  IDTIPOOPERACAO = :IDTIPOOPERACAO,'
      '  IDGRUPO = :IDGRUPO'
      'where'
      '  IDTIPOINVEST = :OLD_IDTIPOINVEST and'
      '  IDTIPOOPERACAO = :OLD_IDTIPOOPERACAO and'
      '  IDGRUPO = :OLD_IDGRUPO')
    InsertSQL.Strings = (
      'insert into CM.GRUPOUSUXTIPOOPER'
      '  (IDTIPOINVEST, IDTIPOOPERACAO, IDGRUPO)'
      'values'
      '  (:IDTIPOINVEST, :IDTIPOOPERACAO, :IDGRUPO)')
    DeleteSQL.Strings = (
      'delete from CM.GRUPOUSUXTIPOOPER'
      'where'
      '  IDTIPOINVEST = :OLD_IDTIPOINVEST and'
      '  IDTIPOOPERACAO = :OLD_IDTIPOOPERACAO and'
      '  IDGRUPO = :OLD_IDGRUPO')
    Left = 165
    Top = 135
  end
  object QryTipoInvest: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT  TIP.IDTIPOINVEST, TIP.DESCTIPOINVEST '
      'FROM CM.TIPOINVEST TIP'
      'ORDER BY TIP.DESCTIPOINVEST ')
    ValidateWithMask = True
    Left = 349
    Top = 135
  end
  object DsTipoInvest: TwwDataSource
    DataSet = QryTipoInvest
    Left = 378
    Top = 135
  end
end
