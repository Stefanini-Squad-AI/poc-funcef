inherited FrmCadCurvasRenFixMT: TFrmCadCurvasRenFixMT
  HelpContext = 790060
  Caption = 'Cadastro'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    inherited pnlControles: TPanel
      object lblPerfil: TLabel
        Left = 21
        Top = 18
        Width = 84
        Height = 13
        Caption = 'Nome do Perfil'
      end
      object dbeDescCurvasRenFix: TwwDBEdit
        Left = 20
        Top = 34
        Width = 409
        Height = 21
        DataField = 'DESCCURVARENFIX'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    inherited dbGrd: TwwDBGrid
      Selected.Strings = (
        'DESCCURVARENFIX'#9'60'#9'Perfil')
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap]
    end
  end
  inherited pnlTitulo: TPanel
    inherited lbNomItem: TfcLabel
      Width = 212
      Caption = 'Perfis de Atualização'
    end
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyEdit = CmeCadastroApplyInsert
    ApplyDelete = CmeCadastroApplyInsert
    Left = 216
  end
  inherited Cds: TCMClientDataSet
    Left = 148
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'CURVASRENFIX.DESCCURVARENFIX')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Perfil')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'CURVASRENFIX')
    CamposChave.Strings = (
      'CURVASRENFIX.IDCURVARENFIX')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      'SELECT IDCURVARENFIX, DESCCURVARENFIX'
      'FROM CURVASRENFIX')
    ClientDataSet = Cds
    Left = 304
    Top = 151
  end
end
