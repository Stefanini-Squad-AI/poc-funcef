inherited frmCadPlano: TfrmCadPlano
  Left = 276
  Top = 166
  Caption = 'Cadastro de Planos de Investimento'
  ClientHeight = 221
  ClientWidth = 404
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 404
    Height = 135
    object GrbPlano: TGroupBox
      Left = 11
      Top = 9
      Width = 382
      Height = 112
      Caption = ' Plano de Investimento '
      TabOrder = 0
      object Label1: TLabel
        Left = 16
        Top = 16
        Width = 33
        Height = 13
        Caption = 'Nome'
      end
      object Label2: TLabel
        Left = 16
        Top = 58
        Width = 38
        Height = 13
        Caption = 'Gestor'
      end
      object DBENomeCarteira: TwwDBEdit
        Left = 16
        Top = 32
        Width = 345
        Height = 21
        DataField = 'DESCPLANOINVEST'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object DBLkGestor: TwwDBLookupCombo
        Left = 16
        Top = 76
        Width = 345
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'40'#9'Gestores')
        DataField = 'IDGESTORCARTEIRA'
        DataSource = ds
        LookupTable = QryGestor
        LookupField = 'IDGESTORCARTEIRA'
        Options = [loColLines, loRowLines, loTitles]
        TabOrder = 1
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
    end
  end
  inherited Dock972: TDock97
    Width = 404
  end
  inherited Dock971: TDock97
    Top = 182
    Width = 404
    inherited tb97Fundo: TToolbar97
      Left = 232
      DockPos = 234
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 63
      DockPos = 65
    end
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update CM.PlanoInvest'
      'set'
      '  IDPLANOINVEST = :IDPLANOINVEST,'
      '  DESCPLANOINVEST = :DESCPLANOINVEST,'
      '  IDGESTORCARTEIRA = :IDGESTORCARTEIRA'
      'where'
      '  IDPLANOINVEST = :OLD_IDPLANOINVEST')
    InsertSQL.Strings = (
      'insert into CM.PlanoInvest'
      '  (IDPLANOINVEST, DESCPLANOINVEST, IDGESTORCARTEIRA)'
      'values'
      '  (:IDPLANOINVEST, :DESCPLANOINVEST, :IDGESTORCARTEIRA)')
    DeleteSQL.Strings = (
      'delete from CM.PlanoInvest'
      'where'
      '  IDPLANOINVEST = :OLD_IDPLANOINVEST')
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PlanoInvest.DescPlanoInvest'
      'Pessoa.Nome')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Plano'
      'Gestor')
    Tabelas.Strings = (
      'CM.PLANOINVEST'
      'CM.GESTORCARTEIRA'
      'CM.PESSOA')
    CamposChave.Strings = (
      'PlanoInvest.IdPlanoInvest'
      'GestorCarteira.IdGestorCarteira'
      'Pessoa.idpessoa')
    Filtro.Strings = (
      'GestorCarteira.IdgestorCarteira = Pessoa.IdPessoa(+)'
      
        'PlanoInvest.IdGestorCarteira = GestorCarteira.IdgestorCarteira(+' +
        ')')
    Left = 365
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
    Top = 58
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'select      PI.IdPlanoInvest, '
      '               PI.DescPlanoInvest,'
      '               PI.IdGestorCarteira'
      ''
      'From       CM.PlanoInvest PI'
      ''
      'Order By PI.DescPlanoInvest')
  end
  object QryGestor: TwwQuery
    DatabaseName = 'basedados'
    SQL.Strings = (
      'SELECT     G.IdGestorCarteira ,'
      '                   P.IdPessoa,'
      '                   P.Nome '
      'FROM        CM.Pessoa P, CM.GestorCarteira G '
      '                  '
      ''
      'WHERE    P.IdPessoa = G.IdGestorCarteira')
    ValidateWithMask = True
    Left = 32
    Top = 135
  end
  object DSGestor: TwwDataSource
    DataSet = QryGestor
    Left = 64
    Top = 135
  end
  object qryAux: TwwQuery
    DatabaseName = 'basedados'
    ValidateWithMask = True
    Left = 333
    Top = 39
  end
end
