inherited frmCadFator: TfrmCadFator
  Left = 166
  Top = 153
  Caption = 'Cadastro dos Fatores de Avaliação'
  ClientHeight = 353
  ClientWidth = 468
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 468
    Height = 267
    BorderWidth = 2
    inherited dbGrd: TwwDBGrid [0]
      Left = 4
      Top = 4
      Width = 460
      Height = 259
      Selected.Strings = (
        'IDFATORAVAL'#9'10'#9'Código'
        'DESCRFATORAVAL'#9'58'#9'Descrição')
      Font.Style = []
      ParentFont = False
    end
    inherited pnlControles: TPanel [1]
      Left = 4
      Top = 4
      Width = 460
      Height = 259
      object Label1: TLabel
        Left = 10
        Top = 3
        Width = 40
        Height = 13
        Caption = 'Código'
        FocusControl = DBEdit1
      end
      object Label2: TLabel
        Left = 10
        Top = 45
        Width = 58
        Height = 13
        Caption = 'Descrição'
        FocusControl = DBEdit2
      end
      object Label3: TLabel
        Left = 10
        Top = 134
        Width = 75
        Height = 13
        Caption = 'Observações'
        FocusControl = DBEdit2
      end
      object Label6: TLabel
        Left = 10
        Top = 88
        Width = 190
        Height = 13
        Caption = 'Grupo de Fatores a que Pertence'
      end
      object DBEdit1: TDBEdit
        Left = 10
        Top = 18
        Width = 64
        Height = 21
        DataField = 'IDFATORAVAL'
        DataSource = ds
        TabOrder = 0
      end
      object DBEdit2: TDBEdit
        Left = 10
        Top = 60
        Width = 440
        Height = 21
        DataField = 'DESCRFATORAVAL'
        DataSource = ds
        TabOrder = 1
      end
      object DBMemo1: TDBMemo
        Left = 10
        Top = 149
        Width = 440
        Height = 103
        DataField = 'OBSFATORAVAL'
        DataSource = ds
        ScrollBars = ssVertical
        TabOrder = 2
      end
      object dblcGrupo: TwwDBLookupCombo
        Left = 10
        Top = 104
        Width = 440
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'60'#9'DESCRICAO'#9'F')
        DataField = 'IDGRUPOFATORAVAL'
        DataSource = ds
        LookupTable = qryGrupoFator
        LookupField = 'IDGRUPOFATORAVAL'
        Style = csDropDownList
        TabOrder = 3
        AutoDropDown = True
        ShowButton = True
        SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
        OrderByDisplay = False
        AllowClearKey = True
      end
    end
  end
  inherited Dock972: TDock97
    Width = 468
  end
  inherited Dock971: TDock97
    Top = 314
    Width = 468
    inherited tb97Fundo: TToolbar97
      Left = 266
      DockPos = 266
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 98
      DockPos = 98
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '  IDFATORAVAL, DESCRFATORAVAL, OBSFATORAVAL, IDGRUPOFATORAVAL'
      'FROM'
      '  FATORAVAL')
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 392
    Top = 14
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update FATORAVAL'
      'set'
      '  DESCRFATORAVAL = :DESCRFATORAVAL,'
      '  OBSFATORAVAL = :OBSFATORAVAL,'
      '  IDGRUPOFATORAVAL = :IDGRUPOFATORAVAL'
      'where'
      '  IDFATORAVAL = :OLD_IDFATORAVAL')
    InsertSQL.Strings = (
      'insert into FATORAVAL'
      '  (IDFATORAVAL, DESCRFATORAVAL, OBSFATORAVAL, IDGRUPOFATORAVAL)'
      'values'
      '  (:IDFATORAVAL, :DESCRFATORAVAL, :OBSFATORAVAL, '
      ':IDGRUPOFATORAVAL)')
    DeleteSQL.Strings = (
      'delete from FATORAVAL'
      'where'
      '  IDFATORAVAL = :OLD_IDFATORAVAL')
  end
  inherited MontaSelect: TMontaSelect
    Caption = 'Seleciona Fatores de Avaliação'
    Colunas.Strings = (
      'IDFATORAVAL'
      'DESCRFATORAVAL')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição')
    SensivelACaixa.Strings = (
      'S'
      'N')
    Tabelas.Strings = (
      'FATORAVAL')
    CamposChave.Strings = (
      'IDFATORAVAL')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '30')
    ExibePergunta = False
    Left = 325
    Top = 6
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
    Top = 58
  end
  object qryGrupoFator: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select DESCRICAO, IDGRUPOFATORAVAL '
      'from GRUPOFATORAVAL '
      'order by upper(DESCRICAO)')
    ValidateWithMask = True
    Left = 299
    Top = 216
  end
end
