inherited frmCadMercadoMT: TfrmCadMercadoMT
  Left = 209
  Top = 166
  HelpContext = 790118
  Caption = 'Cadastro'
  ClientHeight = 304
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 187
    inherited pnlControles: TPanel
      Height = 185
      object Label2: TLabel
        Left = 17
        Top = 9
        Width = 120
        Height = 13
        Caption = 'Tipo de Investimento'
      end
      object Label1: TLabel
        Left = 17
        Top = 59
        Width = 104
        Height = 13
        Caption = 'Nome do Mercado'
      end
      object dblTipoInvest: TwwDBLookupCombo
        Left = 17
        Top = 25
        Width = 340
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCTIPOINVEST'#9'60'#9'Descrição'#9'F')
        DataField = 'IDTIPOINVEST'
        DataSource = ds
        LookupTable = CdsTipoInvest
        LookupField = 'IDTIPOINVEST'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        ShowMatchText = True
      end
      object dbeMercado: TwwDBEdit
        Left = 17
        Top = 74
        Width = 340
        Height = 21
        DataField = 'DESCMERCADO'
        DataSource = ds
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    inherited dbGrd: TwwDBGrid
      Height = 185
      Selected.Strings = (
        'DESCTIPOINVEST'#9'34'#9'Tipo de Investimento'
        'DESCMERCADO'#9'37'#9'Mercado')
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap]
    end
  end
  inherited Dock971: TDock97
    Top = 265
  end
  inherited pnlTitulo: TPanel
    inherited lbNomItem: TfcLabel
      Width = 99
      Caption = 'Mercados'
    end
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyEdit = CmeCadastroApplyInsert
    ApplyDelete = CmeCadastroApplyInsert
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TIPOINVEST.DESCTIPOINVEST'
      'MERCADO.DESCMERCADO')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Tipo de Investimento'
      'Mercado')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'MERCADO'
      'TIPOINVEST')
    CamposChave.Strings = (
      'MERCADO.IDMERCADO')
    Filtro.Strings = (
      'MERCADO.IDTIPOINVEST = TIPOINVEST.IDTIPOINVEST')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '30'
      '60')
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      
        'SELECT M.IDMERCADO, M.DESCMERCADO, M.IDTIPOINVEST, T.DESCTIPOINV' +
        'EST'
      'FROM MERCADO M, TIPOINVEST T'
      'WHERE M.IDTIPOINVEST = T.IDTIPOINVEST'
      'ORDER BY M.DESCMERCADO'
      ''
      ' ')
    Left = 304
    Top = 151
  end
  object CdsTipoInvest: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 188
    Top = 175
  end
end
