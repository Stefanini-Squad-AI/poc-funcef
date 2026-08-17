inherited FrmCadUnCusteio: TFrmCadUnCusteio
  Left = 282
  Top = 147
  Caption = 'Cadastro de Unidade de Custeio'
  ClientWidth = 449
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 449
    inherited pnlControles: TPanel
      Width = 447
      object Label1: TLabel
        Left = 31
        Top = 27
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object dbedDesc: TDBEdit
        Left = 31
        Top = 42
        Width = 328
        Height = 21
        DataField = 'DESCCUSTEIO'
        DataSource = ds
        TabOrder = 0
      end
      object chkContabil: TDBCheckBox
        Left = 31
        Top = 84
        Width = 82
        Height = 17
        Alignment = taLeftJustify
        Caption = 'Contábil ?'
        DataField = 'UCCONTABIL'
        DataSource = ds
        TabOrder = 1
        ValueChecked = 'T'
        ValueUnchecked = 'F'
      end
    end
    inherited dbGrd: TwwDBGrid
      Width = 447
      Selected.Strings = (
        'DESCCUSTEIO'#9'30'#9'Descrição'
        'UCCONTABIL'#9'1'#9'Contabilidade')
      Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgTabs, dgAlwaysShowSelection, dgCancelOnExit, dgWordWrap]
    end
  end
  inherited Dock972: TDock97
    Width = 449
  end
  inherited Dock971: TDock97
    Width = 449
    inherited tb97Fundo: TToolbar97
      Left = 266
      DockPos = 266
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 97
      DockPos = 97
      inherited ToolbarSep971: TToolbarSep97
        Left = 162
      end
      inherited bbtnCancelar: TBitBtn
        Left = 81
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Top = 6
  end
  inherited ds: TwwDataSource
    Top = 6
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update UNCUSTEI'
      'set'
      '  DESCCUSTEIO = :DESCCUSTEIO,'
      '  UCCONTABIL = :UCCONTABIL,'
      '  IDPESSOA = :IDPESSOA'
      'where'
      '  CODCUSTEIO = :OLD_CODCUSTEIO')
    InsertSQL.Strings = (
      'insert into UNCUSTEI'
      '  (CODCUSTEIO, DESCCUSTEIO, UCCONTABIL, IDPESSOA)'
      'values'
      '  (:CODCUSTEIO, :DESCCUSTEIO, :UCCONTABIL, :IDPESSOA)')
    DeleteSQL.Strings = (
      'delete from UNCUSTEI'
      'where'
      '  CODCUSTEIO = :OLD_CODCUSTEIO')
    Top = 6
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'UNCUSTEI.DESCCUSTEIO')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Descrição')
    Tabelas.Strings = (
      'UNCUSTEI')
    CamposChave.Strings = (
      'UNCUSTEI.CODCUSTEIO')
    Mascaras.Strings = (
      '')
    Larguras.Strings = (
      '30')
  end
  inherited ImlPadrao: TImageList
    Top = 6
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
    Top = 58
  end
  inherited qry: TwwQuery
    Tag = 0
    SQL.Strings = (
      'SELECT'
      '      CODCUSTEIO,'
      '      DESCCUSTEIO,'
      '      UCCONTABIL,'
      '      IDPESSOA'
      'FROM '
      '     UNCUSTEI'
      'WHERE '
      '       ( IDPESSOA= :pIDPESSOA)'
      '')
    ControlType.Strings = (
      'UCCONTABIL;CheckBox;T;F')
    Top = 6
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIDPESSOA'
        ParamType = ptUnknown
      end>
    object qryDESCCUSTEIO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 30
      FieldName = 'DESCCUSTEIO'
      Origin = 'UNCUSTEI.DESCCUSTEIO'
      Size = 30
    end
    object qryUCCONTABIL: TStringField
      DisplayLabel = 'Contabilidade'
      DisplayWidth = 1
      FieldName = 'UCCONTABIL'
      Origin = 'UNCUSTEI.UCCONTABIL'
      Size = 1
    end
    object qryCODCUSTEIO: TFloatField
      DisplayWidth = 10
      FieldName = 'CODCUSTEIO'
      Origin = 'UNCUSTEI.CODCUSTEIO'
      Visible = False
    end
    object qryIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Origin = 'UNCUSTEI.IDPESSOA'
      Visible = False
    end
  end
end
