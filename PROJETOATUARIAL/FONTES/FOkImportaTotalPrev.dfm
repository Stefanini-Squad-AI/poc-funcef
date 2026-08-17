inherited frmOkImportaTotalPrev: TfrmOkImportaTotalPrev
  Left = 265
  Top = 358
  HelpContext = 40150
  Caption = 'Importar TotalPrev'
  ClientHeight = 470
  ClientWidth = 694
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 694
    Height = 431
    object GrpBxSitFundacao: TGroupBox
      Left = 355
      Top = 5
      Width = 336
      Height = 137
      Caption = ' Situações na Fundação a Considerar '
      TabOrder = 0
      object CkLstBxSitFundacao: TCheckListBox
        Left = 2
        Top = 27
        Width = 332
        Height = 108
        Align = alBottom
        IntegralHeight = True
        ItemHeight = 13
        TabOrder = 0
      end
      object BitBtn1: TBitBtn
        Left = 260
        Top = 7
        Width = 31
        Height = 20
        Hint = 'Marcar Todas as Situações'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = BitBtn1Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          555555555555555555555555555555555555555555FF55555555555559055555
          55555555577FF5555555555599905555555555557777F5555555555599905555
          555555557777FF5555555559999905555555555777777F555555559999990555
          5555557777777FF5555557990599905555555777757777F55555790555599055
          55557775555777FF5555555555599905555555555557777F5555555555559905
          555555555555777FF5555555555559905555555555555777FF55555555555579
          05555555555555777FF5555555555557905555555555555777FF555555555555
          5990555555555555577755555555555555555555555555555555}
        NumGlyphs = 2
      end
      object BitBtn2: TBitBtn
        Left = 290
        Top = 7
        Width = 31
        Height = 20
        Hint = 'Desmarcar Todas as Situações'
        Cancel = True
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = BitBtn2Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
          3333333777333777FF3333993333339993333377FF3333377FF3399993333339
          993337777FF3333377F3393999333333993337F777FF333337FF993399933333
          399377F3777FF333377F993339993333399377F33777FF33377F993333999333
          399377F333777FF3377F993333399933399377F3333777FF377F993333339993
          399377FF3333777FF7733993333339993933373FF3333777F7F3399933333399
          99333773FF3333777733339993333339933333773FFFFFF77333333999999999
          3333333777333777333333333999993333333333377777333333}
        NumGlyphs = 2
      end
    end
    object GroupBox3: TGroupBox
      Left = 3
      Top = 5
      Width = 346
      Height = 421
      Caption = ' Dados da Versão de Base '
      TabOrder = 1
      object Label2: TLabel
        Left = 11
        Top = 19
        Width = 40
        Height = 13
        Caption = 'Versão'
      end
      object Label6: TLabel
        Left = 11
        Top = 59
        Width = 51
        Height = 13
        Caption = 'Entidade'
      end
      object Label7: TLabel
        Left = 11
        Top = 100
        Width = 80
        Height = 13
        Caption = 'Patrocinadora'
      end
      object Label8: TLabel
        Left = 11
        Top = 141
        Width = 33
        Height = 13
        Caption = 'Plano'
      end
      object Label1: TLabel
        Left = 11
        Top = 183
        Width = 60
        Height = 13
        Caption = 'Mês / Ano'
      end
      object EdtVersao: TEdit
        Left = 11
        Top = 32
        Width = 330
        Height = 21
        Color = clSilver
        ReadOnly = True
        TabOrder = 0
      end
      object EdtEntidade: TEdit
        Left = 11
        Top = 72
        Width = 330
        Height = 21
        Color = clSilver
        ReadOnly = True
        TabOrder = 1
      end
      object EdtPatrocinadora: TEdit
        Left = 11
        Top = 114
        Width = 330
        Height = 21
        Color = clSilver
        ReadOnly = True
        TabOrder = 2
      end
      object EdtPlano: TEdit
        Left = 11
        Top = 156
        Width = 330
        Height = 21
        Color = clSilver
        ReadOnly = True
        TabOrder = 3
      end
      object EdtReferencia: TMaskEdit
        Left = 11
        Top = 198
        Width = 61
        Height = 21
        Color = clSilver
        EditMask = '99/9999;1'
        MaxLength = 7
        ReadOnly = True
        TabOrder = 4
        Text = '  /    '
      end
      object rgrpDependentes: TRadioGroup
        Left = 11
        Top = 255
        Width = 330
        Height = 49
        Caption = 'Critério para os Dependentes: '
        ItemIndex = 0
        Items.Strings = (
          'Importar Todos os Dependentes'
          'Importar Apenas Dependentes Menores ou Inválidos')
        TabOrder = 5
        OnClick = rgrpDependentesClick
      end
      object rgrpTipoLeitura: TRadioGroup
        Left = 11
        Top = 339
        Width = 330
        Height = 49
        Caption = ' Buscar os Dados Utilizando: '
        ItemIndex = 0
        Items.Strings = (
          'Tabela de Eventos Previdenciários'
          'Critérios Pré-Estabelecidos')
        TabOrder = 6
        OnClick = rgrpTipoLeituraClick
      end
      object rgrpSituacao: TRadioGroup
        Left = 11
        Top = 388
        Width = 330
        Height = 31
        Caption = ' Gerar os Dados para: '
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Ativos'
          'Assistidos')
        TabOrder = 7
      end
      object GroupBox1: TGroupBox
        Left = 11
        Top = 304
        Width = 330
        Height = 36
        TabOrder = 8
        object lblIdade: TLabel
          Left = 8
          Top = 12
          Width = 203
          Height = 13
          Caption = 'Idade a Considerar para Maioridade'
        end
        object edIdade: TEdit
          Left = 213
          Top = 9
          Width = 61
          Height = 21
          TabOrder = 0
          Text = '21'
        end
      end
      object RdGrpSituacao: TRadioGroup
        Left = 11
        Top = 224
        Width = 330
        Height = 31
        Caption = 'Recuperar Situação: '
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Referência Atual'
          'Histórico de Eventos')
        TabOrder = 9
      end
    end
    object GrpBxSitPatrocinadora: TGroupBox
      Left = 355
      Top = 148
      Width = 336
      Height = 137
      Caption = ' Situações na Patrocinadora a Considerar '
      TabOrder = 2
      object CkLstBxSitPatrocinadora: TCheckListBox
        Left = 2
        Top = 27
        Width = 332
        Height = 108
        Align = alBottom
        IntegralHeight = True
        ItemHeight = 13
        TabOrder = 0
      end
      object BitBtn3: TBitBtn
        Left = 260
        Top = 7
        Width = 31
        Height = 20
        Hint = 'Marcar Todas as Situações'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = BitBtn3Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          555555555555555555555555555555555555555555FF55555555555559055555
          55555555577FF5555555555599905555555555557777F5555555555599905555
          555555557777FF5555555559999905555555555777777F555555559999990555
          5555557777777FF5555557990599905555555777757777F55555790555599055
          55557775555777FF5555555555599905555555555557777F5555555555559905
          555555555555777FF5555555555559905555555555555777FF55555555555579
          05555555555555777FF5555555555557905555555555555777FF555555555555
          5990555555555555577755555555555555555555555555555555}
        NumGlyphs = 2
      end
      object BitBtn4: TBitBtn
        Left = 290
        Top = 7
        Width = 31
        Height = 20
        Hint = 'Desmarcar Todas as Situações'
        Cancel = True
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = BitBtn4Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
          3333333777333777FF3333993333339993333377FF3333377FF3399993333339
          993337777FF3333377F3393999333333993337F777FF333337FF993399933333
          399377F3777FF333377F993339993333399377F33777FF33377F993333999333
          399377F333777FF3377F993333399933399377F3333777FF377F993333339993
          399377FF3333777FF7733993333339993933373FF3333777F7F3399933333399
          99333773FF3333777733339993333339933333773FFFFFF77333333999999999
          3333333777333777333333333999993333333333377777333333}
        NumGlyphs = 2
      end
    end
    object GrpBxSitPlano: TGroupBox
      Left = 355
      Top = 289
      Width = 336
      Height = 137
      Caption = ' Situações no Plano a Considerar '
      TabOrder = 3
      object CkLstBxSitPlano: TCheckListBox
        Left = 2
        Top = 27
        Width = 332
        Height = 108
        Align = alBottom
        IntegralHeight = True
        ItemHeight = 13
        TabOrder = 0
      end
      object BitBtn5: TBitBtn
        Left = 260
        Top = 7
        Width = 31
        Height = 20
        Hint = 'Marcar Todas as Situações'
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = BitBtn5Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
          555555555555555555555555555555555555555555FF55555555555559055555
          55555555577FF5555555555599905555555555557777F5555555555599905555
          555555557777FF5555555559999905555555555777777F555555559999990555
          5555557777777FF5555557990599905555555777757777F55555790555599055
          55557775555777FF5555555555599905555555555557777F5555555555559905
          555555555555777FF5555555555559905555555555555777FF55555555555579
          05555555555555777FF5555555555557905555555555555777FF555555555555
          5990555555555555577755555555555555555555555555555555}
        NumGlyphs = 2
      end
      object BitBtn6: TBitBtn
        Left = 290
        Top = 7
        Width = 31
        Height = 20
        Hint = 'Desmarcar Todas as Situações'
        Cancel = True
        ParentShowHint = False
        ShowHint = True
        TabOrder = 2
        OnClick = BitBtn6Click
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000130B0000130B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333FFFFF3333333333999993333333333F77777FFF333333999999999
          3333333777333777FF3333993333339993333377FF3333377FF3399993333339
          993337777FF3333377F3393999333333993337F777FF333337FF993399933333
          399377F3777FF333377F993339993333399377F33777FF33377F993333999333
          399377F333777FF3377F993333399933399377F3333777FF377F993333339993
          399377FF3333777FF7733993333339993933373FF3333777F7F3399933333399
          99333773FF3333777733339993333339933333773FFFFFF77333333999999999
          3333333777333777333333333999993333333333377777333333}
        NumGlyphs = 2
      end
    end
  end
  inherited Dock971: TDock97
    Top = 431
    Width = 694
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
      inherited bbtnConfirmar: TBitBtn
        Caption = '&Importar'
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Visible = False
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 363
    Top = 83
  end
  object QrySitFundacao: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT CD_SITUACAO_FUNDACAO                                     ' +
        '          AS CD_SITUACAO_FUNDACAO,'
      
        '       DS_SITUACAO_FUNDACAO||'#39'  (Cód. '#39'||TO_CHAR(CD_SITUACAO_FUN' +
        'DACAO)||'#39')'#39' AS DS_SITUACAO_FUNDACAO'
      'FROM   FI_SITUACAO_FUNDACAO'
      'ORDER BY DS_SITUACAO_FUNDACAO'
      '')
    Left = 448
    Top = 40
  end
  object QryPatrocinadorasVersao: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT CD_PESSOA_PATROC'
      'FROM FI_BASE_PLANO_PATRONAL'
      'WHERE CD_VERSAO = :CD_VERSAO')
    Left = 392
    Top = 40
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptInput
      end>
  end
  object QryPlanosVersao: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT CD_PLANO'
      'FROM FI_BASE_PLANO_PATRONAL'
      'WHERE CD_VERSAO = :CD_VERSAO ')
    Left = 420
    Top = 40
    ParamData = <
      item
        DataType = ftInteger
        Name = 'CD_VERSAO'
        ParamType = ptInput
      end>
  end
  object QrySitPatrocinadora: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDSITFUNC AS CD_SITUACAO,'
      
        '       DESCRICAO||'#39' (Cód. '#39'||TO_CHAR(IDSITFUNC)||'#39')'#39' AS DS_SITUA' +
        'CAO'
      'FROM SITFUNC'
      'ORDER BY DS_SITUACAO'
      ' ')
    Left = 476
    Top = 40
  end
  object QrySitPlano: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDSITPLANOPREV AS CD_SITUACAO,'
      
        '       DESCRICAO||'#39' (Cód. '#39'||TO_CHAR(IDSITPLANOPREV)||'#39')'#39' AS DS_' +
        'SITUACAO'
      'FROM SITPLANOPREV'
      'ORDER BY DS_SITUACAO')
    Left = 504
    Top = 40
  end
end
