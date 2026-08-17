inherited frmCadVerbaPlano: TfrmCadVerbaPlano
  Caption = 'Cadastro de Verbas por Plano'
  ClientHeight = 225
  ClientWidth = 578
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 578
    Height = 157
    object Label15: TLabel
      Left = 352
      Top = 6
      Width = 124
      Height = 13
      Caption = 'Referência (mês/ano)'
    end
    object Label1: TLabel
      Left = 16
      Top = 6
      Width = 33
      Height = 13
      Caption = 'Plano'
    end
    object Label2: TLabel
      Left = 16
      Top = 62
      Width = 83
      Height = 13
      Caption = 'Valor a Ratear'
    end
    object Label3: TLabel
      Left = 152
      Top = 62
      Width = 101
      Height = 13
      Caption = 'Data Lançamento'
    end
    object Label4: TLabel
      Left = 288
      Top = 62
      Width = 44
      Height = 13
      Caption = 'Usuário'
    end
    object cboMes: TComboBox
      Left = 352
      Top = 24
      Width = 145
      Height = 21
      Style = csDropDownList
      ItemHeight = 13
      TabOrder = 0
      OnChange = cboMesChange
      Items.Strings = (
        'Janeiro'
        'Fevereiro'
        'Março'
        'Abril'
        'Maio'
        'Junho'
        'Julho'
        'Agosto'
        'Setembro'
        'Outubro'
        'Novembro'
        'Dezembro')
    end
    object DBspnAno: TwwDBSpinEdit
      Left = 496
      Top = 24
      Width = 65
      Height = 21
      Increment = 1
      TabOrder = 1
      UnboundDataType = wwDefault
    end
    object DBcboPlano: TwwDBLookupCombo
      Left = 16
      Top = 24
      Width = 321
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      DropDownAlignment = taLeftJustify
      Selected.Strings = (
        'NOME'#9'50'#9'Nome'#9'F')
      DataField = 'IDPLANOPREV'
      DataSource = ds
      LookupTable = qryPlano
      LookupField = 'IDPLANOPREV'
      Style = csDropDownList
      ParentFont = False
      TabOrder = 2
      AutoDropDown = False
      ShowButton = True
      UseTFields = False
      AllowClearKey = False
      ShowMatchText = True
    end
    object DBedtValor: TDBEdit
      Left = 16
      Top = 80
      Width = 121
      Height = 21
      DataField = 'VALOR'
      DataSource = ds
      TabOrder = 3
    end
    object DBEdtData: TDBEdit
      Left = 152
      Top = 80
      Width = 121
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'DATA'
      DataSource = ds
      ReadOnly = True
      TabOrder = 4
    end
    object DBEdtNome: TDBEdit
      Left = 288
      Top = 80
      Width = 273
      Height = 21
      TabStop = False
      Color = clBtnFace
      DataField = 'NOME'
      DataSource = ds
      ReadOnly = True
      TabOrder = 5
    end
    object chkZeraValor: TCheckBox
      Left = 16
      Top = 120
      Width = 169
      Height = 17
      Caption = 'Zera Valores Utilizados'
      TabOrder = 6
    end
  end
  inherited Dock972: TDock97
    Width = 578
    inherited Toolbar971: TToolbar97
      inherited sbtnAlterar: TToolbarButton97
        Visible = False
      end
      inherited btnRefresh: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 192
    Width = 578
  end
  inherited ds: TwwDataSource
    Top = 160
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update EPVERBAPLANO'
      'set'
      '  IDPLANOPREV = :IDPLANOPREV,'
      '  DATA = :DATA,'
      '  IDUSUARIO = :IDUSUARIO,'
      '  ANOMES = :ANOMES,'
      '  VALOR = :VALOR,'
      '  TRGDTINCLUSAO = :TRGDTINCLUSAO,'
      '  TRGUSERINCLUSAO = :TRGUSERINCLUSAO'
      'where'
      '  IDVERBAPLANO = :OLD_IDVERBAPLANO')
    InsertSQL.Strings = (
      'insert into EPVERBAPLANO'
      '  (IDVERBAPLANO, IDPLANOPREV, DATA, IDUSUARIO, ANOMES, VALOR, '
      'TRGDTINCLUSAO, '
      '   TRGUSERINCLUSAO)'
      'values'
      
        '  (:IDVERBAPLANO, :IDPLANOPREV, :DATA, :IDUSUARIO, :ANOMES, :VAL' +
        'OR, '
      ':TRGDTINCLUSAO, '
      '   :TRGUSERINCLUSAO)')
    DeleteSQL.Strings = (
      'delete from EPVERBAPLANO'
      'where'
      '  IDVERBAPLANO = :OLD_IDVERBAPLANO')
    Left = 376
    Top = 152
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'VPL.ANOMES'
      'PLP.IDPLANOPREV'
      'PLP.NOME'
      'USU.NOME'
      'VPL.IDVERBAPLANO')
    TipodeDado.Strings = (
      'C'
      'N'
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Referência'
      'ID Plano'
      'Nome Plano'
      'Usuário'
      'ID Verba')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'EPVERBAPLANO VPL'
      'PESSOA USU'
      'PLANPREV PLP')
    CamposChave.Strings = (
      'VPL.IDPLANOPREV'
      'VPL.ANOMES'
      'VPL.IDVERBAPLANO')
    Filtro.Strings = (
      'PLP.IDPLANOPREV = VPL.IDPLANOPREV'
      'VPL.IDUSUARIO = USU.IDPESSOA(+)')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '6'
      '10'
      '50'
      '60'
      '10')
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 508
    Top = 6
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '     VPL.*,'
      '     USU.NOME'
      'FROM'
      '     EPVERBAPLANO VPL,'
      '     PESSOA USU'
      'WHERE'
      '    VPL.IDVERBAPLANO = :PIDVERBAPLANO'
      'AND VPL.IDUSUARIO = USU.IDPESSOA(+)'
      ''
      ' ')
    Top = 152
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDVERBAPLANO'
        ParamType = ptInput
      end>
    object qryIDVERBAPLANO: TFloatField
      FieldName = 'IDVERBAPLANO'
      Origin = 'BASEDADOS.EPVERBAPLANO.IDVERBAPLANO'
    end
    object qryIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.EPVERBAPLANO.IDPLANOPREV'
    end
    object qryDATA: TDateTimeField
      FieldName = 'DATA'
      Origin = 'BASEDADOS.EPVERBAPLANO.DATA'
    end
    object qryIDUSUARIO: TFloatField
      FieldName = 'IDUSUARIO'
      Origin = 'BASEDADOS.EPVERBAPLANO.IDUSUARIO'
    end
    object qryANOMES: TStringField
      FieldName = 'ANOMES'
      Origin = 'BASEDADOS.EPVERBAPLANO.ANOMES'
      Size = 6
    end
    object qryVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'BASEDADOS.EPVERBAPLANO.VALOR'
      DisplayFormat = ',0.00'
      EditFormat = ',0.00'
      currency = True
    end
    object qryTRGDTINCLUSAO: TDateTimeField
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'BASEDADOS.EPVERBAPLANO.TRGDTINCLUSAO'
    end
    object qryTRGUSERINCLUSAO: TStringField
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'BASEDADOS.EPVERBAPLANO.TRGUSERINCLUSAO'
      Size = 30
    end
    object qryNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PESSOA.NOME'
      Size = 60
    end
  end
  object qryPlano: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '    IDPLANOPREV,'
      '    NOME'
      'FROM'
      '    PLANPREV')
    ValidateWithMask = True
    Left = 152
    Top = 35
    object qryPlanoIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.PLANPREV.IDPLANOPREV'
    end
    object qryPlanoNOME: TStringField
      FieldName = 'NOME'
      Origin = 'BASEDADOS.PLANPREV.NOME'
      Size = 50
    end
  end
  object dsPlano: TwwDataSource
    DataSet = qryPlano
    Left = 208
    Top = 32
  end
end
