inherited frmCadLinha: TfrmCadLinha
  Left = 161
  Top = 155
  Width = 616
  Height = 404
  BorderStyle = bsSizeable
  Caption = 'Linhas de Transporte'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 608
    Height = 291
    BorderWidth = 2
    object Label1: TLabel [0]
      Left = 160
      Top = 7
      Width = 40
      Height = 13
      Caption = 'Código'
    end
    object Label6: TLabel [1]
      Left = 160
      Top = 49
      Width = 132
      Height = 13
      Caption = 'Empresa de Transporte'
    end
    object Label5: TLabel [2]
      Left = 160
      Top = 94
      Width = 109
      Height = 13
      Caption = 'Tipo de Transporte'
    end
    object Label2: TLabel [3]
      Left = 160
      Top = 139
      Width = 60
      Height = 13
      Caption = 'Num./Ref.'
    end
    object Label4: TLabel [4]
      Left = 160
      Top = 184
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    object Label3: TLabel [5]
      Left = 160
      Top = 229
      Width = 78
      Height = 13
      Caption = 'Valor Unitário'
    end
    inherited pnlControles: TPanel
      Left = 4
      Top = 4
      Width = 600
      Height = 283
      object Label7: TLabel
        Left = 144
        Top = 7
        Width = 40
        Height = 13
        Caption = 'Código'
      end
      object Label8: TLabel
        Left = 144
        Top = 49
        Width = 132
        Height = 13
        Caption = 'Empresa de Transporte'
      end
      object Label9: TLabel
        Left = 144
        Top = 94
        Width = 109
        Height = 13
        Caption = 'Tipo de Transporte'
      end
      object Label10: TLabel
        Left = 144
        Top = 139
        Width = 74
        Height = 13
        Caption = 'Número/Ref.'
      end
      object Label11: TLabel
        Left = 144
        Top = 184
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object Label12: TLabel
        Left = 144
        Top = 229
        Width = 78
        Height = 13
        Caption = 'Valor Unitário'
      end
      object DBEdit1: TDBEdit
        Left = 144
        Top = 22
        Width = 84
        Height = 21
        DataField = 'IDLINHATRANSP'
        DataSource = ds
        TabOrder = 0
      end
      object dblcEmpre: TwwDBLookupCombo
        Left = 144
        Top = 64
        Width = 324
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'60'#9'NOME')
        DataField = 'IDPESSOA'
        DataSource = ds
        LookupTable = qryEmprTransp
        LookupField = 'IDPESSOA'
        TabOrder = 1
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
      object DBComboBox1: TDBComboBox
        Left = 144
        Top = 109
        Width = 145
        Height = 21
        DataField = 'TIPOLINHATRANSP'
        DataSource = ds
        ItemHeight = 13
        Items.Strings = (
          'Ônibus'
          'Bonde'
          'Metrô'
          'Barca'
          'Trem'
          'Outros')
        TabOrder = 2
      end
      object DBEdit2: TDBEdit
        Left = 144
        Top = 154
        Width = 85
        Height = 21
        DataField = 'NUMLINHATRANSP'
        DataSource = ds
        TabOrder = 3
      end
      object DBEdit4: TDBEdit
        Left = 144
        Top = 199
        Width = 324
        Height = 21
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 4
      end
      object DBRealEdit1: TDBRealEdit
        Left = 144
        Top = 244
        Width = 121
        Height = 21
        Alignment = taRightJustify
        Lines.Strings = (
          '      0,90')
        TabOrder = 5
        WordWrap = False
        IntDigits = 10
        DecDigits = 2
        NumberFormat = fNumber
        Signal = False
        DataField = 'VLRLINHATRANSP'
        DataSource = ds
      end
    end
    inherited dbGrd: TwwDBGrid
      Left = 4
      Top = 4
      Width = 600
      Height = 283
      Selected.Strings = (
        'IDLINHATRANSP'#9'5'#9'Código'
        'TIPOLINHATRANSP'#9'15'#9'Tipo de Transporte'
        'NUMLINHATRANSP'#9'10'#9'Número/Ref.'
        'DESCRICAO'#9'40'#9'Descriçao da Linha'
        'VLRLINHATRANSP'#9'10'#9'Valor Unitário')
      Font.Height = -11
      Font.Style = []
      ParentFont = False
    end
  end
  inherited Dock972: TDock97
    Width = 608
  end
  inherited Dock971: TDock97
    Top = 338
    Width = 608
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '  IDLINHATRANSP, IDPESSOA, NUMLINHATRANSP, VLRLINHATRANSP,'
      '  DESCRICAO, TIPOLINHATRANSP'
      'FROM'
      '  LINHATRANSP'
      'ORDER BY'
      '  IDLINHATRANSP')
    Top = 2
    object qryIDLINHATRANSP: TFloatField
      DisplayLabel = 'Código'
      DisplayWidth = 5
      FieldName = 'IDLINHATRANSP'
      Origin = 'LINHATRANSP.IDLINHATRANSP'
    end
    object qryTIPOLINHATRANSP: TStringField
      DisplayLabel = 'Tipo de Transporte'
      DisplayWidth = 15
      FieldName = 'TIPOLINHATRANSP'
      Origin = 'LINHATRANSP.TIPOLINHATRANSP'
      Size = 15
    end
    object qryNUMLINHATRANSP: TStringField
      DisplayLabel = 'Número/Ref.'
      DisplayWidth = 10
      FieldName = 'NUMLINHATRANSP'
      Origin = 'LINHATRANSP.NUMLINHATRANSP'
      Size = 5
    end
    object qryDESCRICAO: TStringField
      DisplayLabel = 'Descriçao da Linha'
      DisplayWidth = 40
      FieldName = 'DESCRICAO'
      Origin = 'LINHATRANSP.DESCRICAO'
      Size = 40
    end
    object qryVLRLINHATRANSP: TFloatField
      DisplayLabel = 'Valor Unitário'
      DisplayWidth = 10
      FieldName = 'VLRLINHATRANSP'
      Origin = 'LINHATRANSP.VLRLINHATRANSP'
      DisplayFormat = '0.00'
    end
    object qryIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'LINHATRANSP.IDPESSOA'
      Visible = False
    end
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update LINHATRANSP'
      'set'
      '  IDLINHATRANSP = :IDLINHATRANSP,'
      '  IDPESSOA = :IDPESSOA,'
      '  NUMLINHATRANSP = :NUMLINHATRANSP,'
      '  VLRLINHATRANSP = :VLRLINHATRANSP,'
      '  DESCRICAO = :DESCRICAO,'
      '  TIPOLINHATRANSP = :TIPOLINHATRANSP'
      'where'
      '  IDLINHATRANSP = :OLD_IDLINHATRANSP')
    InsertSQL.Strings = (
      'insert into LINHATRANSP'
      
        '  (IDLINHATRANSP, IDPESSOA, NUMLINHATRANSP, VLRLINHATRANSP, DESC' +
        'RICAO, '
      '   TIPOLINHATRANSP)'
      'values'
      
        '  (:IDLINHATRANSP, :IDPESSOA, :NUMLINHATRANSP, :VLRLINHATRANSP, ' +
        ':DESCRICAO, '
      '   :TIPOLINHATRANSP)')
    DeleteSQL.Strings = (
      'delete from LINHATRANSP'
      'where'
      '  IDLINHATRANSP = :OLD_IDLINHATRANSP')
    Top = 2
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Linhas de Transporte'
    Colunas.Strings = (
      'LINHATRANSP.IDLINHATRANSP'
      'LINHATRANSP.DESCRICAO')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'LINHATRANSP')
    CamposChave.Strings = (
      'LINHATRANSP.IDLINHATRANSP')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '40')
    Top = 2
  end
  inherited ds: TwwDataSource
    Top = 2
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
    Top = 58
  end
  object qryEmprTransp: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  TERCEIRO.IDPESSOA, PESSOA.NOME'
      'FROM'
      '  PESSOA, TERCEIRO'
      'WHERE'
      '  (TERCEIRO.IDPESSOA = PESSOA.IDPESSOA)'
      'ORDER BY'
      '  UPPER(PESSOA.NOME)')
    ValidateWithMask = True
    Left = 459
    Top = 2
  end
end
