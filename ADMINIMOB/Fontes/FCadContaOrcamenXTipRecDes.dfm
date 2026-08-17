inherited frmCadContaOrcamenXTipRecDes: TfrmCadContaOrcamenXTipRecDes
  Left = 97
  Top = 198
  Caption = 'Cadastro de Tipo Despesas X Contas Orçamentárias'
  ClientHeight = 319
  ClientWidth = 666
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 666
    Height = 286
    inherited pgc: TPageControl [0]
      Top = 57
      Width = 664
      Height = 228
      inherited tbs: TTabSheet
        inherited pnlGrd: TPanel [0]
          Top = 89
          Width = 656
          Height = 129
          inherited DBgrd: TwwDBGrid
            Selected.Strings = (
              'NOMEPLANOORC'#9'16'#9'Plano '
              'IDCONTAORCAMEN'#9'10'#9'Conta '
              'NOMECONTAORCAMEN'#9'35'#9'Descrição '
              'CODCENTRORESPON'#9'10'#9'Centro Resp.')
          end
        end
        inherited pnlControles: TPanel
          Width = 656
          Height = 58
          object Label2: TLabel
            Left = 360
            Top = 10
            Width = 113
            Height = 13
            Caption = 'Conta Orçamentária'
          end
          object Label4: TLabel
            Left = 16
            Top = 10
            Width = 112
            Height = 13
            Caption = 'Plano Orçamentário'
          end
          object DBedtContaOrcam: TDBEdit
            Left = 360
            Top = 24
            Width = 256
            Height = 21
            DataField = 'NOMECONTAORCAMEN'
            DataSource = ds
            Enabled = False
            TabOrder = 0
          end
          object btnBuscaContaOrcamen: TBitBtn
            Left = 616
            Top = 24
            Width = 23
            Height = 22
            Hint = 'Busca um Imóvel'
            TabOrder = 1
            OnClick = btnBuscaContaOrcamenClick
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              80000080000000808000800000008000800080800000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
              777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
              77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
              77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
              077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
              FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
              F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
              7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
              777777787FFF8777777777770000777777777777888877777777}
            NumGlyphs = 2
          end
          object DBedtPlanoOrcam: TDBEdit
            Left = 16
            Top = 24
            Width = 281
            Height = 21
            DataField = 'NOMEPLANOORC'
            DataSource = ds
            Enabled = False
            TabOrder = 2
          end
        end
        inherited Dock973: TDock97 [2]
          Width = 656
        end
      end
    end
    inherited Panel1: TPanel [1]
      Width = 664
      Height = 56
      object Label1: TLabel
        Left = 16
        Top = 10
        Width = 92
        Height = 13
        Caption = 'Tipo de Receita'
      end
      object dbLkpTipoRec: TwwDBLookupCombo
        Left = 16
        Top = 24
        Width = 633
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCCUSTORECIMO'#9'30'#9'Tipo de Receita')
        LookupTable = qryLookTipoRecDes
        LookupField = 'IDTIPOCUSTORECIMO'
        TabOrder = 0
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
        OnChange = dbLkpTipoRecChange
      end
    end
  end
  inherited Dock971: TDock97
    Top = 286
    Width = 666
  end
  inherited ds: TwwDataSource
    DataSet = qry
  end
  inherited CmeCadastro: TCmEventosCadastro
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 229
    Top = 5
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update CONTORCXTIPRECDES'
      'set'
      '  IDTIPOCUSTORECIMO = :IDTIPOCUSTORECIMO,'
      '  IDPLANOORCAMEN = :IDPLANOORCAMEN,'
      '  IDCONTAORCAMEN = :IDCONTAORCAMEN'
      'where'
      '  IDTIPOCUSTORECIMO = :OLD_IDTIPOCUSTORECIMO and'
      '  IDPLANOORCAMEN = :OLD_IDPLANOORCAMEN and'
      '  IDCONTAORCAMEN = :OLD_IDCONTAORCAMEN')
    InsertSQL.Strings = (
      'insert into CONTORCXTIPRECDES'
      '  (IDTIPOCUSTORECIMO, IDPLANOORCAMEN, IDCONTAORCAMEN)'
      'values'
      '  (:IDTIPOCUSTORECIMO, :IDPLANOORCAMEN, :IDCONTAORCAMEN)')
    DeleteSQL.Strings = (
      'delete from CONTORCXTIPRECDES'
      'where'
      '  IDTIPOCUSTORECIMO = :OLD_IDTIPOCUSTORECIMO and'
      '  IDPLANOORCAMEN = :OLD_IDPLANOORCAMEN and'
      '  IDCONTAORCAMEN = :OLD_IDCONTAORCAMEN')
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '   C.IDTIPOCUSTORECIMO, C.IDPLANOORCAMEN , C.IDCONTAORCAMEN,'
      '   P.NOMEPLANOORC, CO.NOMECONTAORCAMEN, CO.CODCENTRORESPON'
      ''
      'FROM'
      '   CONTORCXTIPRECDES C, PLANOORCAMENTARIO P, CONTASORCAMEN CO'
      ''
      'WHERE'
      '   ( C.IDTIPOCUSTORECIMO = :PIDTIPOCUSTORECIMO )'
      '   AND ( C.IDPLANOORCAMEN = CO.IDPLANOORCAMEN )'
      '   AND ( C.IDCONTAORCAMEN = CO.IDCONTAORCAMEN )'
      '   AND ( C.IDPLANOORCAMEN = P.IDPLANOORCAMEN  )'
      ''
      ' ')
    UpdateObject = upd
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDTIPOCUSTORECIMO'
        ParamType = ptUnknown
      end>
    object qryNOMEPLANOORC: TStringField
      DisplayLabel = 'Plano '
      DisplayWidth = 16
      FieldName = 'NOMEPLANOORC'
      Origin = 'PLANOORCAMENTARIO.NOMEPLANOORC'
      Size = 60
    end
    object qryIDCONTAORCAMEN: TStringField
      DisplayLabel = 'Conta '
      DisplayWidth = 10
      FieldName = 'IDCONTAORCAMEN'
      Origin = 'CONTORCXTIPRECDES.IDCONTAORCAMEN'
      Size = 25
    end
    object qryNOMECONTAORCAMEN: TStringField
      DisplayLabel = 'Descrição '
      DisplayWidth = 35
      FieldName = 'NOMECONTAORCAMEN'
      Origin = 'CONTASORCAMEN.NOMECONTAORCAMEN'
      Size = 60
    end
    object qryCODCENTRORESPON: TStringField
      DisplayLabel = 'Centro Resp.'
      DisplayWidth = 10
      FieldName = 'CODCENTRORESPON'
      Origin = '"CM.CONTASORCAMEN".CODCENTRORESPON'
      Size = 10
    end
    object qryIDTIPOCUSTORECIMO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOCUSTORECIMO'
      Origin = 'CONTORCXTIPRECDES.IDTIPOCUSTORECIMO'
      Visible = False
    end
    object qryIDPLANOORCAMEN: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANOORCAMEN'
      Origin = 'CONTORCXTIPRECDES.IDPLANOORCAMEN'
      Visible = False
    end
  end
  object MSContaOrcam: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'P.NOMEPLANOORC'
      'C.IDCONTAORCAMEN'
      'C.NOMECONTAORCAMEN'
      'C.CODCENTRORESPON')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Plano Orçamentário'
      'Conta Orçamentária'
      'Descrição Conta Orçamentária'
      'Centro de Responsabilidade')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PLANOORCAMENTARIO P'
      'CONTASORCAMEN C')
    CamposChave.Strings = (
      'C.IDPLANOORCAMEN'
      'C.IDCONTAORCAMEN'
      'P.NOMEPLANOORC'
      'C.NOMECONTAORCAMEN'
      'CODCENTRORESPON')
    Filtro.Strings = (
      'C.IDPLANOORCAMEN = P.IDPLANOORCAMEN')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '15'
      '20'
      '40'
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 568
    Top = 101
  end
  object qryLookTipoRecDes: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      
        '   T.IDTIPOCUSTORECIMO, T.DESCCUSTORECIMO, T.RECCUSTO, T.CODTIPD' +
        'OC'
      ''
      'FROM'
      '   TIPOCUSTORECIMOV T'
      ''
      'WHERE'
      '   ( T.RECCUSTO = :PRECCUSTO )'
      '   AND ( FLGOBRIGAORC = 1 ) '
      ''
      'ORDER BY'
      '   T.DESCCUSTORECIMO')
    ValidateWithMask = True
    Left = 536
    Top = 8
    ParamData = <
      item
        DataType = ftString
        Name = 'PRECCUSTO'
        ParamType = ptUnknown
      end>
    object qryLookTipoRecDesDESCCUSTORECIMO: TStringField
      DisplayLabel = 'Tipo de Receita'
      DisplayWidth = 30
      FieldName = 'DESCCUSTORECIMO'
      Origin = 'TIPOCUSTORECIMOV.DESCCUSTORECIMO'
      Size = 60
    end
    object qryLookTipoRecDesIDTIPOCUSTORECIMO: TFloatField
      FieldName = 'IDTIPOCUSTORECIMO'
      Origin = 'TIPOCUSTORECIMOV.IDTIPOCUSTORECIMO'
      Visible = False
    end
    object qryLookTipoRecDesRECCUSTO: TStringField
      FieldName = 'RECCUSTO'
      Origin = 'TIPOCUSTORECIMOV.RECCUSTO'
      Visible = False
      Size = 1
    end
    object qryLookTipoRecDesCODTIPDOC: TFloatField
      FieldName = 'CODTIPDOC'
      Origin = 'TIPOCUSTORECIMOV.CODTIPDOC'
      Visible = False
    end
  end
end
