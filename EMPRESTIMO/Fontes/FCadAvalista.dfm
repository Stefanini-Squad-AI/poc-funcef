inherited frmCadAvalista: TfrmCadAvalista
  Left = 260
  Top = 155
  HelpContext = 150033
  BorderStyle = bsDialog
  Caption = 'Cadastro de Avalista'
  ClientHeight = 247
  ClientWidth = 366
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 366
    Height = 179
    object Label1: TLabel
      Left = 35
      Top = 21
      Width = 33
      Height = 13
      Caption = 'Nome'
      FocusControl = DBedtNome
    end
    object Label2: TLabel
      Left = 35
      Top = 70
      Width = 129
      Height = 13
      Caption = 'Origem do Rendimento'
      FocusControl = DBEditOrigem
    end
    object Label3: TLabel
      Left = 35
      Top = 120
      Width = 112
      Height = 13
      Caption = 'Renda Comprovada'
      FocusControl = DBEditRenda
    end
    object Label4: TLabel
      Left = 197
      Top = 121
      Width = 118
      Height = 13
      Caption = 'Margem Consignavel'
      FocusControl = DBEditMargem
    end
    object Label5: TLabel
      Left = 197
      Top = 70
      Width = 24
      Height = 13
      Caption = 'CPF'
      FocusControl = DBEditCPF
    end
    object DBedtNome: TDBEdit
      Left = 35
      Top = 37
      Width = 297
      Height = 21
      DataField = 'NOME'
      DataSource = ds
      TabOrder = 0
    end
    object DBEditOrigem: TDBEdit
      Left = 35
      Top = 86
      Width = 135
      Height = 21
      DataField = 'ORIGEMREND'
      DataSource = ds
      TabOrder = 1
    end
    object DBEditRenda: TDBEdit
      Left = 35
      Top = 136
      Width = 135
      Height = 21
      DataField = 'RENDACOMP'
      DataSource = ds
      TabOrder = 2
    end
    object DBEditMargem: TDBEdit
      Left = 197
      Top = 137
      Width = 135
      Height = 21
      DataField = 'MARGEMCONSIG'
      DataSource = ds
      TabOrder = 3
    end
    object DBEditCPF: TDBEdit
      Left = 197
      Top = 86
      Width = 135
      Height = 21
      DataField = 'CPF'
      DataSource = ds
      TabOrder = 4
      OnExit = DBEditCPFExit
    end
  end
  inherited Dock972: TDock97
    Width = 366
    inherited Toolbar971: TToolbar97
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
      inherited btnRefresh: TToolbarButton97
        Visible = False
      end
      inherited ToolbarSep972: TToolbarSep97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 214
    Width = 366
    inherited tb97Fundo: TToolbar97
      Left = 194
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 22
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '  IDAVALISTA, CPF, MARGEMCONSIG, NOME, ORIGEMREND, RENDACOMP'
      'FROM AVALISTA'
      'WHERE IDAVALISTA = :PIDAVALISTA')
    Left = 139
    Top = 36
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDAVALISTA'
        ParamType = ptInput
      end>
    object qryIDAVALISTA: TFloatField
      FieldName = 'IDAVALISTA'
      Origin = 'BASEDADOS.AVALISTA.IDAVALISTA'
    end
    object qryCPF: TStringField
      FieldName = 'CPF'
      Origin = 'BASEDADOS.AVALISTA.CPF'
      Size = 15
    end
    object qryMARGEMCONSIG: TFloatField
      FieldName = 'MARGEMCONSIG'
      Origin = 'BASEDADOS.AVALISTA.MARGEMCONSIG'
    end
    object qryNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.AVALISTA.NOME'
      Size = 60
    end
    object qryORIGEMREND: TStringField
      FieldName = 'ORIGEMREND'
      Origin = 'BASEDADOS.AVALISTA.ORIGEMREND'
      Size = 60
    end
    object qryRENDACOMP: TFloatField
      FieldName = 'RENDACOMP'
      Origin = 'BASEDADOS.AVALISTA.RENDACOMP'
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 336
    Top = 36
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update AVALISTA'
      'set'
      '  IDAVALISTA = :IDAVALISTA,'
      '  CPF = :CPF,'
      '  MARGEMCONSIG = :MARGEMCONSIG,'
      '  NOME = :NOME,'
      '  ORIGEMREND = :ORIGEMREND,'
      '  RENDACOMP = :RENDACOMP'
      'where'
      '  IDAVALISTA = :OLD_IDAVALISTA')
    InsertSQL.Strings = (
      'insert into AVALISTA'
      '  (IDAVALISTA, CPF, MARGEMCONSIG, NOME, ORIGEMREND, RENDACOMP)'
      'values'
      
        '  (:IDAVALISTA, :CPF, :MARGEMCONSIG, :NOME, :ORIGEMREND, :RENDAC' +
        'OMP)')
    DeleteSQL.Strings = (
      'delete from AVALISTA'
      'where'
      '  IDAVALISTA = :OLD_IDAVALISTA')
    Left = 111
    Top = 36
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'AVALISTA.NOME'
      'AVALISTA.CPF'
      'AVALISTA.ORIGEMREND'
      'AVALISTA.RENDACOMP'
      'AVALISTA.MARGEMCONSIG')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'N'
      'C')
    Descricao.Strings = (
      'Nome'
      'CPF'
      'Origem do Rend.'
      'Renda Comprov.'
      'Margem Consig.')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'AVALISTA')
    CamposChave.Strings = (
      'AVALISTA.IDAVALISTA')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '32'
      '15'
      '10'
      '10'
      '10')
    Left = 252
    Top = 36
  end
  inherited ds: TwwDataSource
    Left = 167
    Top = 36
  end
  inherited ImlPadrao: TImageList
    Left = 280
    Top = 36
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 195
    Top = 36
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 224
    Top = 36
  end
  object CPF: TCMValidaDoc
    TipoDocumento = tdCPF
    Mensagem.ExibeMensagem = True
    Mensagem.Texto = 'Número de CPF Inválido.'
    Left = 308
    Top = 36
  end
end
