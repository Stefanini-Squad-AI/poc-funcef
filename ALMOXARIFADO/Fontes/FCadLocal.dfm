inherited FrmCadLocal: TFrmCadLocal
  Left = 125
  Top = 155
  Caption = 'Localização em Estoque'
  ClientWidth = 567
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 567
    inherited dbGrd: TwwDBGrid [0]
      Width = 557
      Selected.Strings = (
        'CODARTIGO'#9'14'#9'Artigo'
        'DESCPROD'#9'40'#9'Descrição'
        'LOCALIZACAO'#9'40'#9'Localiação')
      TitleAlignment = taCenter
      TitleLines = 2
    end
    inherited pnlControles: TPanel [1]
      Width = 557
      object Label1: TLabel
        Left = 30
        Top = 31
        Width = 34
        Height = 13
        Caption = 'Artigo'
      end
      object Label2: TLabel
        Left = 177
        Top = 31
        Width = 58
        Height = 13
        Caption = 'Descrição'
      end
      object Label3: TLabel
        Left = 30
        Top = 97
        Width = 69
        Height = 13
        Caption = 'Localização'
      end
      object dbArtigo: TDBEdit
        Left = 27
        Top = 46
        Width = 121
        Height = 21
        TabStop = False
        CharCase = ecUpperCase
        Color = clSilver
        DataField = 'CODARTIGO'
        DataSource = ds
        Enabled = False
        TabOrder = 1
      end
      object dbDesc: TDBEdit
        Left = 177
        Top = 46
        Width = 346
        Height = 21
        TabStop = False
        CharCase = ecUpperCase
        Color = clSilver
        DataField = 'DESCPROD'
        DataSource = ds
        Enabled = False
        TabOrder = 2
      end
      object edLoc: TDBEdit
        Left = 30
        Top = 112
        Width = 364
        Height = 21
        DataField = 'LOCALIZACAO'
        DataSource = ds
        TabOrder = 0
      end
    end
  end
  inherited Dock972: TDock97
    Width = 567
  end
  inherited Dock971: TDock97
    Width = 567
    inherited tb97Fundo: TToolbar97
      Left = 279
      DockPos = 279
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 111
      DockPos = 111
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'Select '
      '    A.CodArtigo,'
      '    P.DescProd,'
      '    S.Localizacao,'
      '    S.CodAlmoxarifado '
      'from '
      '    Artigo A,'
      '    Saldo S,'
      '    Produto P'
      'Where'
      '    A.CodProduto = P.CodProduto '
      '    and S.CodArtigo = A.CodArtigo'
      '    and S.IdPessoa = :pIdpess'
      '    and S.CodAlmoxarifado = :pCodAlmox'
      'Order By p.DescProd  ')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pIdpess'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'pCodAlmox'
        ParamType = ptUnknown
      end>
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update Saldo'
      'set'
      '  LOCALIZACAO = :LOCALIZACAO'
      'where'
      '  rtrim(CODARTIGO) = rtrim(:OLD_CODARTIGO) and'
      '  CODALMOXARIFADO = :OLD_CODALMOXARIFADO')
    InsertSQL.Strings = (
      'insert into Saldo'
      '  (LOCALIZACAO)'
      'values'
      '  (:LOCALIZACAO)')
    DeleteSQL.Strings = (
      'delete from Saldo'
      'where'
      '  CODARTIGO = :OLD_CODARTIGO and'
      '  CODALMOXARIFADO = :OLD_CODALMOXARIFADO')
    Left = 258
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'ARTIGO.CODARTIGO'
      'PRODUTO.DESCPROD'
      'SALDO.LOCALIZACAO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Artigo'
      'Descrição'
      'Localização')
    Tabelas.Strings = (
      'ARTIGO'
      'PRODUTO'
      'SALDO')
    CamposChave.Strings = (
      'ARTIGO.CODARTIGO')
    Filtro.Strings = (
      'ARTIGO.CODPRODUTO = PRODUTO.CODPRODUTO '
      'SALDO.CODARTIGO = ARTIGO.CODARTIGO')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '14'
      '30'
      '25')
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
    Top = 58
  end
end
