inherited FrmCadHistXTipoAlter: TFrmCadHistXTipoAlter
  Left = 298
  Top = 181
  Caption = 'Cadastro de Históricos X Tipo de Alterador'
  ClientHeight = 232
  ClientWidth = 481
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 481
    Height = 146
    object Label1: TLabel
      Left = 24
      Top = 19
      Width = 78
      Height = 13
      Caption = 'Histórico SAF'
    end
    object Label2: TLabel
      Left = 24
      Top = 75
      Width = 52
      Height = 13
      Caption = 'Alterador'
    end
    object CmpSaf: TCMProcura
      Left = 24
      Top = 35
      Width = 433
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MostraMensagens = True
      Mensagens.EmBranco = 'Histórico não pode estar em branco'
      Mensagens.NaoExiste = 'Histórico não existe'
      PermiteChaveInvalida = False
      PermiteChaveEmBranco = False
      DataSource = ds
      DataField = 'IDHISTORICOSAF'
      LookupChave = 'IDHISTORICOSAF'
      LookupDescricao = 'DESCHISTORICOSAF'
      MontaSelect = MsSaf
      LookupTabela = 'CM.HISTORICOSAF'
      DataBaseName = 'BaseDados'
      ReadOnly = False
    end
    object CmpALterador: TCMProcura
      Left = 24
      Top = 91
      Width = 433
      Height = 27
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -9
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      MostraMensagens = True
      Mensagens.EmBranco = 'Alterador não pode estar em branco'
      Mensagens.NaoExiste = 'Alterador não existe'
      PermiteChaveInvalida = False
      PermiteChaveEmBranco = False
      DataSource = ds
      DataField = 'CODALTERADOR'
      LookupChave = 'CODALTERADOR'
      LookupDescricao = 'DESCRICAO'
      MontaSelect = MsAlterador
      LookupTabela = 'CM.TIPOALTERADOR'
      DataBaseName = 'BaseDados'
      ReadOnly = False
    end
  end
  inherited Dock972: TDock97
    Width = 481
  end
  inherited Dock971: TDock97
    Top = 193
    Width = 481
    inherited tb97Fundo: TToolbar97
      Left = 302
      DockPos = 302
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 134
      DockPos = 134
    end
  end
  inherited qry: TwwQuery
    Tag = 5
    SQL.Strings = (
      'SELECT '
      '   IDHISTORICOSAF,CODALTERADOR'
      'FROM '
      '   HISTSAFXALTERADOR '
      'WHERE'
      '  IDHISTORICOSAF = :IDHISTORICOSAF AND'
      '  CODALTERADOR = :CODALTERADOR')
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDHISTORICOSAF'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'CODALTERADOR'
        ParamType = ptUnknown
      end>
    object qryIDHISTORICOSAF: TFloatField
      DisplayLabel = 'Histórico'
      FieldName = 'IDHISTORICOSAF'
      Origin = 'HISTSAFXALTERADOR.IDHISTORICOSAF'
      Required = True
    end
    object qryCODALTERADOR: TFloatField
      DisplayLabel = 'Alterador'
      FieldName = 'CODALTERADOR'
      Origin = 'HISTSAFXALTERADOR.CODALTERADOR'
      Required = True
    end
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTSAFXALTERADOR'
      'set'
      '  IDHISTORICOSAF = :IDHISTORICOSAF,'
      '  CODALTERADOR = :CODALTERADOR'
      'where'
      '  IDHISTORICOSAF = :OLD_IDHISTORICOSAF and'
      '  CODALTERADOR = :OLD_CODALTERADOR')
    InsertSQL.Strings = (
      'insert into HISTSAFXALTERADOR'
      '  (IDHISTORICOSAF, CODALTERADOR)'
      'values'
      '  (:IDHISTORICOSAF, :CODALTERADOR)')
    DeleteSQL.Strings = (
      'delete from HISTSAFXALTERADOR'
      'where'
      '  IDHISTORICOSAF = :OLD_IDHISTORICOSAF and'
      '  CODALTERADOR = :OLD_CODALTERADOR')
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'HISTORICOSAF.DESCHISTORICOSAF'
      'HISTORICOSAF.RECPAG'
      'TIPOALTERADOR.DESCRICAO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Histórico SAF'
      'Rec\Pag'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'HISTSAFXALTERADOR'
      'TIPOALTERADOR'
      'HISTORICOSAF')
    CamposChave.Strings = (
      'HISTSAFXALTERADOR.IDHISTORICOSAF'
      'HISTSAFXALTERADOR.CODALTERADOR')
    Filtro.Strings = (
      'HISTSAFXALTERADOR.CODALTERADOR=TIPOALTERADOR.CODALTERADOR'
      'HISTSAFXALTERADOR.IDHISTORICOSAF=HISTORICOSAF.IDHISTORICOSAF')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '1'
      '35')
    Left = 365
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 358
    Top = 58
  end
  object MsSaf: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Histórico'
    Colunas.Strings = (
      'HISTORICOSAF.DESCHISTORICOSAF')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'HISTORICOSAF')
    CamposChave.Strings = (
      'HISTORICOSAF.IDHISTORICOSAF'
      'HISTORICOSAF.RECPAG')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 328
    Top = 63
  end
  object MsAlterador: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona Alterador'
    Colunas.Strings = (
      'TIPOALTERADOR.DESCRICAO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição')
    SensivelACaixa.Strings = (
      'N')
    Tabelas.Strings = (
      'TIPOALTERADOR')
    CamposChave.Strings = (
      'TIPOALTERADOR.CODALTERADOR'
      'TIPOALTERADOR.RECPAG')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '35')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 328
    Top = 135
  end
  object QryValidaHist: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT RECPAG FROM HISTORICOSAF WHERE IDHISTORICOSAF = :IDHISTOR' +
        'ICOSAF')
    ValidateWithMask = True
    Left = 224
    Top = 63
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDHISTORICOSAF'
        ParamType = ptUnknown
      end>
    object QryValidaHistRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'HISTORICOSAF.RECPAG'
      Size = 1
    end
  end
  object QryValidaAlt: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT RECPAG FROM TIPOALTERADOR WHERE CODALTERADOR = :CODALTERA' +
        'DOR')
    ValidateWithMask = True
    Left = 216
    Top = 135
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODALTERADOR'
        ParamType = ptUnknown
      end>
    object QryValidaAltRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'TIPOALTERADOR.RECPAG'
      Size = 1
    end
  end
end
