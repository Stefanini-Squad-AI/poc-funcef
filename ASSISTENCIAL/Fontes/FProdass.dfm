inherited FrmProdass: TFrmProdass
  Left = 145
  Top = 167
  Caption = 'Produto Assistencial'
  ClientHeight = 337
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Height = 251
    inherited pnlControles: TPanel
      Height = 241
      object Label2: TLabel
        Left = 6
        Top = 11
        Width = 99
        Height = 13
        Caption = 'Nome do Produto'
      end
      object Label3: TLabel
        Left = 6
        Top = 59
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object Label1: TLabel
        Left = 436
        Top = 11
        Width = 40
        Height = 13
        Caption = 'Código'
      end
      object DBNome: TDBEdit
        Left = 6
        Top = 26
        Width = 415
        Height = 21
        DataField = 'NOME'
        DataSource = ds
        TabOrder = 0
      end
      object DBDescricao: TDBMemo
        Left = 6
        Top = 73
        Width = 505
        Height = 89
        DataField = 'DESCRICAO'
        DataSource = ds
        TabOrder = 1
      end
      object DBIdProdass: TDBEdit
        Left = 436
        Top = 26
        Width = 75
        Height = 21
        TabStop = False
        Color = clBtnFace
        DataField = 'IDPRODASS'
        DataSource = ds
        Enabled = False
        ReadOnly = True
        TabOrder = 2
      end
      object GroupBoxPerc: TGroupBox
        Left = 7
        Top = 170
        Width = 525
        Height = 67
        Caption = 'Percentual'
        TabOrder = 3
        object Label4: TLabel
          Left = 10
          Top = 22
          Width = 34
          Height = 13
          Caption = 'IOF %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label5: TLabel
          Left = 136
          Top = 22
          Width = 76
          Height = 13
          Caption = 'Pró-Labore %'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlue
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object wwDBCBIof: TwwDBComboBox
          Left = 10
          Top = 36
          Width = 79
          Height = 21
          ShowButton = True
          Style = csDropDown
          MapList = False
          AllowClearKey = False
          DataField = 'PERCIOF'
          DataSource = ds
          DropDownCount = 8
          ItemHeight = 0
          Items.Strings = (
            '1'
            '2'
            '3'
            '4'
            '5'
            '6'
            '7')
          ItemIndex = 6
          Sorted = False
          TabOrder = 0
          UnboundDataType = wwDefault
        end
        object wwDBCBProLabore: TwwDBComboBox
          Left = 136
          Top = 36
          Width = 82
          Height = 21
          ShowButton = True
          Style = csDropDown
          MapList = False
          AllowClearKey = False
          DataField = 'PERCPROLABORE'
          DataSource = ds
          DropDownCount = 8
          ItemHeight = 0
          Items.Strings = (
            '1'
            '2'
            '3'
            '4'
            '5'
            '6'
            '7')
          ItemIndex = 4
          Sorted = False
          TabOrder = 1
          UnboundDataType = wwDefault
        end
      end
    end
    inherited dbGrd: TwwDBGrid
      Height = 241
      Selected.Strings = (
        'NOME'#9'22'#9'Nome'
        'DESCRICAO'#9'40'#9'Descrição')
    end
  end
  inherited Dock971: TDock97
    Top = 298
    inherited tb97Fundo: TToolbar97
      Left = 382
      DockPos = 382
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 214
      DockPos = 214
    end
  end
  inherited qry: TwwQuery
    BeforePost = qryBeforePost
    SQL.Strings = (
      'SELECT IDPRODASS,NOME,DESCRICAO,PERCIOF,PERCPROLABORE'
      'FROM PRODASS'
      'ORDER BY NOME')
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PRODASS'
      'set'
      '  IDPRODASS = :IDPRODASS,'
      '  NOME = :NOME,'
      '  DESCRICAO = :DESCRICAO,'
      '  PERCIOF = :PERCIOF,'
      '  PERCPROLABORE = :PERCPROLABORE'
      'where'
      '  IDPRODASS = :OLD_IDPRODASS and'
      '  NOME = :OLD_NOME and'
      '  DESCRICAO = :OLD_DESCRICAO')
    InsertSQL.Strings = (
      'insert into PRODASS'
      '  (IDPRODASS, NOME, DESCRICAO, PERCIOF, PERCPROLABORE)'
      'values'
      '  (:IDPRODASS, :NOME, :DESCRICAO, :PERCIOF, :PERCPROLABORE)')
    DeleteSQL.Strings = (
      'delete from PRODASS'
      'where'
      '  IDPRODASS = :OLD_IDPRODASS and'
      '  NOME = :OLD_NOME and'
      '  DESCRICAO = :OLD_DESCRICAO')
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'PRODASS.NOME'
      'PRODASS.DESCRICAO')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Nome'
      'Descrição')
    SensivelACaixa.Strings = (
      'S'
      'S')
    Tabelas.Strings = (
      'PRODASS')
    CamposChave.Strings = (
      'PRODASS.IDPRODASS')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '28'
      '68')
    Left = 429
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 310
    Top = 58
  end
  object qryAux: TwwQuery
    Tag = 5
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDPRODASS,NOME,DESCRICAO,PERCIOF,PERCPROLABORE'
      'FROM PRODASS'
      'ORDER BY NOME')
    ValidateWithMask = True
    Left = 367
    Top = 8
  end
end
