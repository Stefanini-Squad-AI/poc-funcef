inherited frmCadTipoCap: TfrmCadTipoCap
  Left = 361
  Top = 162
  HelpContext = 790109
  ClientHeight = 237
  ClientWidth = 405
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 405
    Height = 151
    inherited Bevel2: TBevel
      Width = 403
    end
    inherited pnlTitulo: TPanel
      Width = 403
      inherited lbNomItem: TfcLabel
        Width = 150
        Caption = 'Tipo de Capital'
      end
    end
    object pnlDados: TPanel
      Left = 1
      Top = 45
      Width = 403
      Height = 105
      Align = alClient
      TabOrder = 1
      object Label1: TLabel
        Left = 17
        Top = 9
        Width = 62
        Height = 13
        Caption = 'Descrição '
      end
      object LblCodig: TLabel
        Left = 17
        Top = 49
        Width = 40
        Height = 13
        Caption = 'Código'
      end
      object DBEDescTipoCapital: TwwDBEdit
        Left = 17
        Top = 25
        Width = 353
        Height = 21
        DataField = 'DESCTPCAPEMISSOR'
        DataSource = ds
        TabOrder = 0
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object DBECodTipoCapital: TwwDBEdit
        Left = 17
        Top = 64
        Width = 97
        Height = 21
        DataField = 'CODTPCAPEMISSOR'
        DataSource = ds
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
  end
  inherited Dock972: TDock97
    Width = 405
  end
  inherited Dock971: TDock97
    Top = 198
    Width = 405
    inherited tb97Fundo: TToolbar97
      Left = 233
      DockPos = 236
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 64
      DockPos = 67
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 248
  end
  inherited ds: TwwDataSource
    Left = 345
    Top = 1
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TipoCapEmissor'
      'set'
      '  CODTPCAPEMISSOR = :CODTPCAPEMISSOR,'
      '  DESCTPCAPEMISSOR = :DESCTPCAPEMISSOR'
      'where'
      '  CODTPCAPEMISSOR = :OLD_CODTPCAPEMISSOR')
    InsertSQL.Strings = (
      'insert into TipoCapEmissor'
      '  (CODTPCAPEMISSOR, DESCTPCAPEMISSOR)'
      'values'
      '  (:CODTPCAPEMISSOR, :DESCTPCAPEMISSOR)')
    DeleteSQL.Strings = (
      'delete from TipoCapEmissor'
      'where'
      '  CODTPCAPEMISSOR = :OLD_CODTPCAPEMISSOR')
    Left = 373
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TIPOCAPEMISSOR.DESCTPCAPEMISSOR'
      'TIPOCAPEMISSOR.CODTPCAPEMISSOR')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Descrição '
      'Código')
    Tabelas.Strings = (
      'TIPOCAPEMISSOR')
    CamposChave.Strings = (
      'TIPOCAPEMISSOR.CODTPCAPEMISSOR')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '40'
      '10')
    Left = 285
  end
  inherited ImlPadrao: TImageList
    Left = 252
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 256
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'select    TC.CodTpCapEmissor ,'
      '              TC.DescTpCapEmissor '
      ''
      'from        TipoCapEmissor TC')
    Left = 317
    Top = 1
  end
  object qryaux: TwwQuery
    DatabaseName = 'basedados'
    ValidateWithMask = True
    Left = 368
    Top = 15
  end
end
