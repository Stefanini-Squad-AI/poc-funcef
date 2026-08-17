inherited frmCadTipoEvenEmissor: TfrmCadTipoEvenEmissor
  Left = 207
  Top = 153
  HelpContext = 790110
  ClientHeight = 204
  ClientWidth = 428
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 428
    Height = 118
    inherited Bevel2: TBevel
      Width = 426
    end
    object Label2: TLabel [1]
      Left = 21
      Top = 54
      Width = 62
      Height = 13
      Caption = 'Descrição '
    end
    inherited pnlTitulo: TPanel
      Width = 426
      inherited lbNomItem: TfcLabel
        Width = 177
        Caption = 'Tipos de Eventos'
      end
    end
    object dbeDescEventoEmissor: TwwDBEdit
      Left = 22
      Top = 72
      Width = 382
      Height = 21
      DataField = 'DESCTPEVENEMISSOR'
      DataSource = ds
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
  end
  inherited Dock972: TDock97
    Width = 428
  end
  inherited Dock971: TDock97
    Top = 165
    Width = 428
    inherited tb97Fundo: TToolbar97
      Left = 256
      DockPos = 769
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 87
      DockPos = 600
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 268
    Top = 1
  end
  inherited ds: TwwDataSource
    Left = 366
    Top = 1
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TipoEvenEmissor'
      'set'
      '  DESCTPEVENEMISSOR = :DESCTPEVENEMISSOR'
      'where'
      '  IDTIPOEVENEMISSOR = :OLD_IDTIPOEVENEMISSOR')
    InsertSQL.Strings = (
      'insert into TipoEvenEmissor'
      '  (IDTIPOEVENEMISSOR, DESCTPEVENEMISSOR)'
      'values'
      '  (:IDTIPOEVENEMISSOR, :DESCTPEVENEMISSOR)')
    DeleteSQL.Strings = (
      'delete from TipoEvenEmissor'
      'where'
      '  IDTIPOEVENEMISSOR = :OLD_IDTIPOEVENEMISSOR')
    Left = 394
    Top = 1
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'DescTpEvenEmissor')
    TipodeDado.Strings = (
      'C')
    Descricao.Strings = (
      'Tipo de Evento ')
    Tabelas.Strings = (
      'TipoEvenEmissor')
    CamposChave.Strings = (
      'IdTipoEvenEmissor')
    Left = 257
    Top = 1
  end
  inherited ImlPadrao: TImageList
    Left = 245
    Top = 1
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 298
    Top = 1
  end
  inherited qry: TwwQuery
    Tag = 0
    SQL.Strings = (
      'select    TEE.IdTipoEvenEmissor,'
      '             TEE.DescTpEvenEmissor'
      ''
      'from       TipoEvenEmissor TEE')
    Left = 338
    Top = 1
  end
end
