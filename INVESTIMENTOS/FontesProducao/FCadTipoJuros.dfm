inherited frmCadTipoJuros: TfrmCadTipoJuros
  Left = 221
  Top = 175
  Caption = 'Cadastro de Tipos de Juros '
  ClientHeight = 215
  ClientWidth = 360
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 360
    Height = 129
    object Label1: TLabel
      Left = 17
      Top = 16
      Width = 58
      Height = 13
      Caption = 'Descrição'
      FocusControl = DBEdit1
    end
    object Label2: TLabel
      Left = 83
      Top = 72
      Width = 81
      Height = 13
      Caption = 'Período (dias)'
      FocusControl = DBEdit2
    end
    object Label3: TLabel
      Left = 17
      Top = 72
      Width = 29
      Height = 13
      Caption = 'Sigla'
      FocusControl = DBEdit3
    end
    object DBEdit1: TDBEdit
      Left = 17
      Top = 32
      Width = 329
      Height = 21
      DataField = 'DESCTIPJUROS'
      DataSource = ds
      TabOrder = 0
    end
    object DBEdit2: TDBEdit
      Left = 83
      Top = 88
      Width = 94
      Height = 21
      DataField = 'TAMPERJUROS'
      DataSource = ds
      TabOrder = 2
    end
    object DBRadioGroup1: TDBRadioGroup
      Left = 189
      Top = 76
      Width = 156
      Height = 33
      Caption = ' Tipo '
      Columns = 2
      DataField = 'EFETNOMI'
      DataSource = ds
      Items.Strings = (
        'Efetivo'
        'Nominal')
      TabOrder = 3
      Values.Strings = (
        'E'
        'N')
    end
    object DBEdit3: TDBEdit
      Left = 17
      Top = 88
      Width = 52
      Height = 21
      DataField = 'SIGLATIPJUROS'
      DataSource = ds
      TabOrder = 1
    end
  end
  inherited Dock971: TDock97
    Top = 176
    Width = 360
    inherited tb97Fundo: TToolbar97
      Left = 168
      DockPos = 168
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 0
      DockPos = 0
    end
  end
  inherited Dock972: TDock97
    Width = 360
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      
        'SELECT  CODTIPTXJUROS, DESCTIPJUROS, TAMPERJUROS, EFETNOMI,SIGLA' +
        'TIPJUROS'
      'FROM CM.TIPOJUROS'
      'WHERE CODTIPTXJUROS=:IDTIPO')
    Params.Data = {010001000649445449504F00030400000000000000}
    object qryCODTIPTXJUROS: TFloatField
      FieldName = 'CODTIPTXJUROS'
      Origin = 'TIPOJUROS.CODTIPTXJUROS'
    end
    object qryDESCTIPJUROS: TStringField
      FieldName = 'DESCTIPJUROS'
      Origin = 'TIPOJUROS.DESCTIPJUROS'
      Size = 60
    end
    object qryTAMPERJUROS: TFloatField
      FieldName = 'TAMPERJUROS'
      Origin = 'TIPOJUROS.TAMPERJUROS'
    end
    object qryEFETNOMI: TStringField
      FieldName = 'EFETNOMI'
      Origin = 'TIPOJUROS.EFETNOMI'
      Size = 1
    end
    object qrySIGLATIPJUROS: TStringField
      FieldName = 'SIGLATIPJUROS'
      Origin = 'TIPOJUROS.SIGLATIPJUROS'
      Size = 6
    end
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update CM.TIPOJUROS'
      'set'
      '  CODTIPTXJUROS = :CODTIPTXJUROS,'
      '  DESCTIPJUROS = :DESCTIPJUROS,'
      '  TAMPERJUROS = :TAMPERJUROS,'
      '  EFETNOMI = :EFETNOMI,'
      '  SIGLATIPJUROS = :SIGLATIPJUROS'
      'where'
      '  CODTIPTXJUROS = :OLD_CODTIPTXJUROS')
    InsertSQL.Strings = (
      'insert into CM.TIPOJUROS'
      
        '  (CODTIPTXJUROS, DESCTIPJUROS, TAMPERJUROS, EFETNOMI, SIGLATIPJ' +
        'UROS)'
      'values'
      
        '  (:CODTIPTXJUROS, :DESCTIPJUROS, :TAMPERJUROS, :EFETNOMI, :SIGL' +
        'ATIPJUROS)')
    DeleteSQL.Strings = (
      'delete from CM.TIPOJUROS'
      'where'
      '  CODTIPTXJUROS = :OLD_CODTIPTXJUROS')
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TIPOJUROS.DESCTIPJUROS'
      'TIPOJUROS.SIGLATIPJUROS'
      'TIPOJUROS.EFETNOMI'
      'TIPOJUROS.TAMPERJUROS')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Descrição'
      'Sigla'
      'Efetivo/Nominal'
      'Período (dias)')
    Tabelas.Strings = (
      'TIPOJUROS')
    CamposChave.Strings = (
      'TIPOJUROS.CODTIPTXJUROS')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '40'
      '6'
      '1'
      '10')
    Left = 333
    Top = 40
  end
inherited CmeCadastro: TCmEventosCadastro
     OnInsert = CmeCadastroInsert
     OnEdit = CmeCadastroEdit
     OnDelete = CmeCadastroDelete
     OnFind = CmeCadastroFind
     OnConfirma = CmeCadastroConfirma
  Left = 358
  Top = 58
end
end
 
