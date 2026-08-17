inherited frmIniContagem: TfrmIniContagem
  Left = 150
  Top = 96
  Caption = 'Parametros para Início do Inventário'
  ClientHeight = 366
  ClientWidth = 538
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 538
    Height = 280
    object lblAlmoxarifado: TLabel
      Left = 30
      Top = 11
      Width = 73
      Height = 13
      Caption = 'Almoxarifado'
    end
    object Label6: TLabel
      Left = 326
      Top = 10
      Width = 101
      Height = 13
      Caption = 'Grupo de Produto'
    end
    object spdGrupoProd: TSpeedButton
      Left = 491
      Top = 24
      Width = 20
      Height = 20
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -24
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333033333
        33333333373F33333333333330B03333333333337F7F33333333333330F03333
        333333337F7FF3333333333330B00333333333337F773FF33333333330F0F003
        333333337F7F773F3333333330B0B0B0333333337F7F7F7F3333333300F0F0F0
        333333377F73737F33333330B0BFBFB03333337F7F33337F33333330F0FBFBF0
        3333337F7333337F33333330BFBFBFB033333373F3333373333333330BFBFB03
        33333337FFFFF7FF3333333300000000333333377777777F333333330EEEEEE0
        33333337FFFFFF7FF3333333000000000333333777777777F33333330000000B
        03333337777777F7F33333330000000003333337777777773333}
      NumGlyphs = 2
      ParentFont = False
      OnClick = spdGrupoProdClick
    end
    object Label2: TLabel
      Left = 30
      Top = 56
      Width = 58
      Height = 13
      Caption = 'Inventário'
    end
    object Label3: TLabel
      Left = 126
      Top = 57
      Width = 107
      Height = 13
      Caption = 'Data do Inventário'
    end
    object dbeNumInventario: TDBEdit
      Left = 30
      Top = 69
      Width = 76
      Height = 21
      DataField = 'IDINVENTARIO'
      DataSource = ds
      Enabled = False
      TabOrder = 1
    end
    object edGrupoProd: TMaskEdit
      Left = 324
      Top = 23
      Width = 166
      Height = 21
      TabOrder = 0
      Text = 'edGrupoProd'
      OnExit = edGrupoProdExit
    end
    object gbDescGrupo: TGroupBox
      Left = 268
      Top = 56
      Width = 241
      Height = 41
      Caption = 'Descrição do Grupo de Produto'
      TabOrder = 4
      object lblDescProduto: TLabel
        Left = 12
        Top = 18
        Width = 5
        Height = 13
      end
    end
    object dbrMostraSaldo: TDBRadioGroup
      Left = 276
      Top = 177
      Width = 235
      Height = 70
      Caption = ' Saldo '
      DataField = 'ABERTOFECHADO'
      DataSource = ds
      Items.Strings = (
        '&Mostra na Contagem'
        '&Não Mostra na Contagem')
      TabOrder = 3
      Values.Strings = (
        'A'
        'F')
    end
    object dbrSitInventario: TDBRadioGroup
      Left = 36
      Top = 177
      Width = 220
      Height = 70
      Caption = ' Situação '
      DataField = 'CONTAGEMENCERRADA'
      DataSource = ds
      Items.Strings = (
        'Em &Andamento'
        '&Encerrado')
      ReadOnly = True
      TabOrder = 6
      Values.Strings = (
        'F'
        'T')
    end
    object dbedDataInv: TCMDateTimePicker
      Left = 126
      Top = 69
      Width = 121
      Height = 21
      CalendarAttributes.Font.Charset = DEFAULT_CHARSET
      CalendarAttributes.Font.Color = clWindowText
      CalendarAttributes.Font.Height = -11
      CalendarAttributes.Font.Name = 'MS Sans Serif'
      CalendarAttributes.Font.Style = []
      ButtonStyle = cbsCustom
      DataField = 'DATAINVENTARIO'
      DataSource = ds
      Epoch = 1950
      ButtonGlyph.Data = {
        06050000424D06050000000000003604000028000000100000000D0000000100
        080000000000D000000000000000000000000001000000000000000000000000
        80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
        A6000020400000206000002080000020A0000020C0000020E000004000000040
        20000040400000406000004080000040A0000040C0000040E000006000000060
        20000060400000606000006080000060A0000060C0000060E000008000000080
        20000080400000806000008080000080A0000080C0000080E00000A0000000A0
        200000A0400000A0600000A0800000A0A00000A0C00000A0E00000C0000000C0
        200000C0400000C0600000C0800000C0A00000C0C00000C0E00000E0000000E0
        200000E0400000E0600000E0800000E0A00000E0C00000E0E000400000004000
        20004000400040006000400080004000A0004000C0004000E000402000004020
        20004020400040206000402080004020A0004020C0004020E000404000004040
        20004040400040406000404080004040A0004040C0004040E000406000004060
        20004060400040606000406080004060A0004060C0004060E000408000004080
        20004080400040806000408080004080A0004080C0004080E00040A0000040A0
        200040A0400040A0600040A0800040A0A00040A0C00040A0E00040C0000040C0
        200040C0400040C0600040C0800040C0A00040C0C00040C0E00040E0000040E0
        200040E0400040E0600040E0800040E0A00040E0C00040E0E000800000008000
        20008000400080006000800080008000A0008000C0008000E000802000008020
        20008020400080206000802080008020A0008020C0008020E000804000008040
        20008040400080406000804080008040A0008040C0008040E000806000008060
        20008060400080606000806080008060A0008060C0008060E000808000008080
        20008080400080806000808080008080A0008080C0008080E00080A0000080A0
        200080A0400080A0600080A0800080A0A00080A0C00080A0E00080C0000080C0
        200080C0400080C0600080C0800080C0A00080C0C00080C0E00080E0000080E0
        200080E0400080E0600080E0800080E0A00080E0C00080E0E000C0000000C000
        2000C0004000C0006000C0008000C000A000C000C000C000E000C0200000C020
        2000C0204000C0206000C0208000C020A000C020C000C020E000C0400000C040
        2000C0404000C0406000C0408000C040A000C040C000C040E000C0600000C060
        2000C0604000C0606000C0608000C060A000C060C000C060E000C0800000C080
        2000C0804000C0806000C0808000C080A000C080C000C080E000C0A00000C0A0
        2000C0A04000C0A06000C0A08000C0A0A000C0A0C000C0A0E000C0C00000C0C0
        2000C0C04000C0C06000C0C08000C0C0A000F0FBFF00A4A0A000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00010000000000
        000000000000000000FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF00FF07A407
        A407A4F9A407A4FF00FFFF00FFA407A407A4F9A4F9A407FF00FFFF00FF07A407
        A407A4F9A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FF07A407
        A407A407A407A4FF00FFFF00FFA407A407A407A407A407FF00FFFF00FFFFFFFF
        FFFFFFFFFFFFFFFF00FFFF00FF04FC04FC04FCA4A4A4A4FF00FFFF00FFFC04FC
        04FC04A4A4A4A4FF00FFFF00FFFFFFFFFFFFFFFFFFFFFFFF00FFFF0000000000
        000000000000000000FF}
      ShowButton = True
      TabOrder = 2
    end
    object dbrAbrangencia: TDBRadioGroup
      Left = 33
      Top = 102
      Width = 478
      Height = 55
      Caption = ' Abrangência '
      Columns = 2
      DataField = 'PARCIALTOTAL'
      DataSource = ds
      Items.Strings = (
        'Inventário &Total'
        'Inventário por &Grupo')
      ReadOnly = True
      TabOrder = 5
      Values.Strings = (
        'T'
        'P')
    end
    object dbedAlmoxarifado: TEdit
      Left = 30
      Top = 24
      Width = 271
      Height = 21
      Color = clSilver
      TabOrder = 8
    end
    object treeGrupoProd: TCMTreeView
      Left = 126
      Top = 45
      Width = 364
      Height = 150
      PodeNavegar = True
      DataSource = dsGrupoProd
      CampoChave = qryGrupoProdCODGRUPOPROD
      CampoDescricao = qryGrupoProdDESCGRUPOPROD
      CampoTipo = qryGrupoProdSTATUSGRUPO
      OnExit = treeGrupoProdExit
      Visible = False
    end
  end
  inherited Dock972: TDock97
    Width = 538
    inherited Toolbar971: TToolbar97
      inherited sbtnAlterar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 327
    Width = 538
    inherited tb97Fundo: TToolbar97
      Left = 324
      DockPos = 324
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 155
      DockPos = 155
    end
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update INVENTAR'
      'set'
      '  IDINVENTARIO = :IDINVENTARIO,'
      '  CODALMOXARIFADO = :CODALMOXARIFADO,'
      '  DATAINVENTARIO = :DATAINVENTARIO,'
      '  ULTIDMOVCONT = :ULTIDMOVCONT,'
      '  TIPOINVENT = :TIPOINVENT,'
      '  ABERTOFECHADO = :ABERTOFECHADO,'
      '  DATARECONTAGEM = :DATARECONTAGEM,'
      '  DATATRAVA = :DATATRAVA,'
      '  PARCIALTOTAL = :PARCIALTOTAL,'
      '  ULTIDMOVRECONT = :ULTIDMOVRECONT,'
      '  CONTAGEMENCERRADA = :CONTAGEMENCERRADA,'
      '  RECONTAGEMENCERRADA = :RECONTAGEMENCERRADA,'
      '  IDPESSOA = :IDPESSOA,'
      '  CODGRUPOPROD = :CODGRUPOPROD'
      'where'
      '  IDINVENTARIO = :OLD_IDINVENTARIO')
    InsertSQL.Strings = (
      'insert into INVENTAR'
      '  (IDINVENTARIO, CODALMOXARIFADO, DATAINVENTARIO, ULTIDMOVCONT, '
      'TIPOINVENT, '
      '   ABERTOFECHADO, DATARECONTAGEM, DATATRAVA, PARCIALTOTAL, '
      'ULTIDMOVRECONT, '
      '   CONTAGEMENCERRADA, RECONTAGEMENCERRADA, IDPESSOA, '
      'CODGRUPOPROD)'
      'values'
      
        '  (:IDINVENTARIO, :CODALMOXARIFADO, :DATAINVENTARIO, :ULTIDMOVCO' +
        'NT, '
      ':TIPOINVENT, '
      '   :ABERTOFECHADO, :DATARECONTAGEM, :DATATRAVA, :PARCIALTOTAL, '
      ':ULTIDMOVRECONT, '
      '   :CONTAGEMENCERRADA, :RECONTAGEMENCERRADA, :IDPESSOA, '
      ':CODGRUPOPROD)')
    DeleteSQL.Strings = (
      'delete from INVENTAR'
      'where'
      '  IDINVENTARIO = :OLD_IDINVENTARIO')
    Left = 270
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'INVENTAR.IDINVENTARIO'
      'INVENTAR.DATAINVENTARIO'
      'INVENTAR.CODGRUPOPROD'
      'GRUPPROD.DESCGRUPOPROD')
    TipodeDado.Strings = (
      'N'
      'D'
      'C'
      'C')
    Descricao.Strings = (
      'Num. Inventário'
      'Data Inventário'
      'Código do Grupo'
      'Descrição do Grupo')
    Tabelas.Strings = (
      'INVENTAR'
      'GRUPPROD')
    CamposChave.Strings = (
      'INVENTAR.IDINVENTARIO')
    Filtro.Strings = (
      'GRUPPROD.CODGRUPOPROD(+) = INVENTAR.CODGRUPOPROD')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '10'
      '10'
      '10')
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 358
    Top = 58
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT I.*, G.DESCGRUPOPROD FROM '
      'GRUPPROD G, INVENTAR I, ALMOX A '
      'WHERE I.CODGRUPOPROD = G.CODGRUPOPROD(+)')
  end
  object qryGrupoProd: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODGRUPOPROD,DESCGRUPOPROD,STATUSGRUPO FROM'
      'GRUPPROD')
    ValidateWithMask = True
    Left = 447
    Top = 13
    object qryGrupoProdCODGRUPOPROD: TStringField
      FieldName = 'CODGRUPOPROD'
      Origin = 'GRUPPROD.CODGRUPOPROD'
      Size = 10
    end
    object qryGrupoProdDESCGRUPOPROD: TStringField
      FieldName = 'DESCGRUPOPROD'
      Origin = 'GRUPPROD.DESCGRUPOPROD'
      Size = 30
    end
    object qryGrupoProdSTATUSGRUPO: TStringField
      FieldName = 'STATUSGRUPO'
      Origin = 'GRUPPROD.STATUSGRUPO'
      Size = 1
    end
  end
  object dsGrupoProd: TwwDataSource
    DataSet = qryGrupoProd
    Left = 504
    Top = 13
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 45
    Top = 52
  end
end
