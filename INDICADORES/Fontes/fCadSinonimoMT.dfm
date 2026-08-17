inherited frmCadSinonimoMT: TfrmCadSinonimoMT
  Left = 167
  Top = 188
  HelpContext = 4390030
  Caption = 'Cadastro de Sinônimos'
  ClientHeight = 242
  ClientWidth = 426
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 426
    Height = 156
    object Label1: TLabel
      Left = 30
      Top = 78
      Width = 52
      Height = 13
      Caption = 'Sinônimo'
      FocusControl = DBEdtSinonimo
    end
    inline molIndicador1: TmolIndicador
      Left = 22
      Top = 24
      inherited edtIndicador: TEdit [1]
      end
      inherited btnLimpaIndicador: TBitBtn [2]
        Left = 272
        Enabled = False
        Visible = False
      end
      inherited btnBuscaIndicador: TBitBtn
        OnClick = molIndicador1btnBuscaIndicadorClick
      end
    end
    object DBEdtSinonimo: TDBEdit
      Left = 30
      Top = 92
      Width = 321
      Height = 21
      DataField = 'SINONIMO'
      DataSource = ds
      TabOrder = 1
    end
  end
  inherited Dock972: TDock97
    Width = 426
  end
  inherited Dock971: TDock97
    Top = 203
    Width = 426
    inherited tb97Fundo: TToolbar97
      Left = 254
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 85
    end
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyEdit = CmeCadastroApplyInsert
    ApplyDelete = CmeCadastroApplyInsert
  end
  inherited Cds: TCMClientDataSet
    object CdsIDSINONIMO: TFloatField
      FieldName = 'IDSINONIMO'
    end
    object CdsSINONIMO: TStringField
      FieldName = 'SINONIMO'
      Size = 30
    end
    object CdsIDINDICADOR: TFloatField
      FieldName = 'IDINDICADOR'
    end
    object CdsDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 60
    end
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'II.DESCRICAO'
      'IO.SINONIMO')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Indicador'
      'Sinônimo')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'INDSINONIMO IO'
      'INDINDICADOR II')
    CamposChave.Strings = (
      'IO.IDSINONIMO')
    Filtro.Strings = (
      'II.IDINDICADOR=IO.IDINDICADOR')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '60'
      '30')
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      'SELECT IO.IDSINONIMO, IO.SINONIMO,'
      '       IO.IDINDICADOR, II.DESCRICAO'
      '  FROM INDSINONIMO IO, INDINDICADOR II'
      ' WHERE IO.IDINDICADOR = II.IDINDICADOR'
      '   AND 1=2'
      ''
      ' '
      ' ')
    ClientDataSet = Cds
    Left = 364
    Top = 136
  end
end
