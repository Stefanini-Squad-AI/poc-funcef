inherited frmCadOrigCap: TfrmCadOrigCap
  Left = 184
  Top = 165
  HelpContext = 790107
  ClientHeight = 242
  ClientWidth = 464
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 464
    Height = 156
    inherited Bevel2: TBevel
      Width = 462
    end
    object Label2: TLabel [1]
      Left = 16
      Top = 16
      Width = 58
      Height = 13
      Caption = 'Descrição'
    end
    inherited pnlTitulo: TPanel
      Width = 462
      inherited lbNomItem: TfcLabel
        Width = 180
        Caption = 'Origem do Capital'
      end
    end
    object pnlDados: TPanel
      Left = 1
      Top = 45
      Width = 462
      Height = 110
      Align = alClient
      TabOrder = 1
      object Label1: TLabel
        Left = 17
        Top = 10
        Width = 101
        Height = 13
        Caption = 'Origem do Capital'
      end
      object LblCodOrigemCapital: TLabel
        Left = 16
        Top = 49
        Width = 40
        Height = 13
        Caption = 'Código'
      end
      object DBEOrigemCapital: TwwDBEdit
        Left = 16
        Top = 26
        Width = 422
        Height = 21
        DataField = 'DESCORICAPEMISSOR'
        DataSource = ds
        MaxLength = 60
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object DBECodOrigemCapital: TwwDBEdit
        Left = 16
        Top = 65
        Width = 102
        Height = 21
        DataField = 'CODORICAPEMISSOR'
        DataSource = ds
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
  end
  inherited Dock972: TDock97
    Width = 464
  end
  inherited Dock971: TDock97
    Top = 203
    Width = 464
    inherited tb97Fundo: TToolbar97
      Left = 292
      DockPos = 334
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 123
      DockPos = 165
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 255
  end
  inherited ds: TwwDataSource
    Left = 341
    Top = 2
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update origemCapEmissor'
      'set'
      '  CODORICAPEMISSOR = :CODORICAPEMISSOR,'
      '  DESCORICAPEMISSOR = :DESCORICAPEMISSOR'
      'where'
      '  CODORICAPEMISSOR = :OLD_CODORICAPEMISSOR')
    InsertSQL.Strings = (
      'insert into origemCapEmissor'
      '  (CODORICAPEMISSOR, DESCORICAPEMISSOR)'
      'values'
      '  (:CODORICAPEMISSOR, :DESCORICAPEMISSOR)')
    DeleteSQL.Strings = (
      'delete from origemCapEmissor'
      'where'
      ' RTrim( CODORICAPEMISSOR) = RTrim(:OLD_CODORICAPEMISSOR)')
    Left = 369
    Top = 2
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'ORIGEMCAPEMISSOR.DESCORICAPEMISSOR'
      'ORIGEMCAPEMISSOR.CODORICAPEMISSOR')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Descrição '
      'Código')
    Tabelas.Strings = (
      'ORIGEMCAPEMISSOR')
    CamposChave.Strings = (
      'CodOriCapEmissor'
      'ORIGEMCAPEMISSOR.CODORICAPEMISSOR')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '40'
      '10')
    Left = 301
  end
  inherited ImlPadrao: TImageList
    Left = 258
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 270
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'select       CE.CodOriCapEmissor,'
      '                CE.DescOriCapEmissor '
      ''
      'from         origemCapEmissor CE')
    ControlType.Strings = (
      'CODORICAPEMISSOR;CustomEdit;DBECodOrigemCapital')
    Left = 397
    Top = 2
  end
  object qryaux: TwwQuery
    DatabaseName = 'basedados'
    ValidateWithMask = True
    Left = 432
    Top = 2
  end
end
