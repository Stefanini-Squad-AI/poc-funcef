inherited frmCadDeParaContasMT: TfrmCadDeParaContasMT
  Left = 738
  Top = 328
  Caption = 'De/Para de Contas Contábeis'
  ClientHeight = 463
  ClientWidth = 707
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 707
    Height = 377
    object Panel1: TPanel
      Left = 24
      Top = 20
      Width = 321
      Height = 236
      TabOrder = 0
      object Label2: TLabel
        Left = 18
        Top = 47
        Width = 94
        Height = 13
        Caption = 'Plano de Contas'
      end
      object lblCCustoOri: TLabel
        Left = 16
        Top = 189
        Width = 92
        Height = 13
        Caption = 'Centro de Custo'
        Enabled = False
      end
      object dblkPlanoOri: TwwDBLookupCombo
        Left = 17
        Top = 62
        Width = 285
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCPLANO'#9'20'#9'DESCPLANO')
        DataField = 'PLANO1'
        DataSource = ds
        LookupTable = cdsPlanoIni
        LookupField = 'PLANO'
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        OnCloseUp = dblkPlanoOriCloseUp
        OnExit = dblkPlanoOriExit
      end
      object dblkCCustoOri: TwwDBLookupCombo
        Left = 16
        Top = 204
        Width = 289
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'30'#9'NOME')
        DataField = 'CENTROCUSTO1'
        DataSource = ds
        LookupTable = cdsCustoIni
        LookupField = 'CODCENTROCUSTO'
        Color = clBtnFace
        Enabled = False
        TabOrder = 1
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
      object Panel3: TPanel
        Left = 0
        Top = 0
        Width = 321
        Height = 29
        Caption = 'Conta e Centro Custo de Origem'
        Color = clBtnShadow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
      object cmpContaIni: TCMProcuraMaskContabil
        Left = 20
        Top = 91
        Width = 285
        Height = 82
        Caption = 'Conta Contábil'
        Enabled = False
        TabOrder = 3
        OnExit = cmpContaIniExit
        MostraMensagens = True
        MostraDescricao = True
        DataSource = ds
        DataField = 'CONTA1'
        Mensagens.EmBranco = 'Conta não pode estar em branco'
        Mensagens.NaoExiste = 'Conta não existe'
        Mensagens.Sintetica = 'Conta não pode ser sintética'
        Mensagens.Analitica = 'Conta não pode ser analítica'
        PermiteChaveInvalida = False
        PermiteChaveEmBranco = False
        AceitaTipoConta = SoAnalitica
        Plano = 0
        Status = scAmbas
      end
    end
    object Panel2: TPanel
      Left = 360
      Top = 21
      Width = 321
      Height = 234
      TabOrder = 1
      object Label3: TLabel
        Left = 16
        Top = 40
        Width = 94
        Height = 13
        Caption = 'Plano de Contas'
      end
      object lblCCustoDes: TLabel
        Left = 16
        Top = 188
        Width = 92
        Height = 13
        Caption = 'Centro de Custo'
        Enabled = False
      end
      object dblkPlanoDes: TwwDBLookupCombo
        Left = 16
        Top = 56
        Width = 288
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCPLANO'#9'20'#9'DESCPLANO')
        DataField = 'PLANO2'
        DataSource = ds
        LookupTable = cdsPlanoFim
        LookupField = 'PLANO'
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = False
        OnCloseUp = dblkPlanoDesCloseUp
        OnExit = dblkPlanoDesExit
      end
      object dblkCCustoDes: TwwDBLookupCombo
        Left = 16
        Top = 203
        Width = 289
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'30'#9'NOME')
        DataField = 'CENTROCUSTO2'
        DataSource = ds
        LookupTable = cdsCustoFim
        LookupField = 'CODCENTROCUSTO'
        Color = clBtnFace
        Enabled = False
        TabOrder = 1
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = False
      end
      object Panel4: TPanel
        Left = 0
        Top = 0
        Width = 321
        Height = 29
        Caption = 'Conta e Centro Custo de Destino'
        Color = clBtnShadow
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 2
      end
      object cmpContaFim: TCMProcuraMaskContabil
        Left = 16
        Top = 91
        Width = 289
        Height = 82
        Caption = 'Conta Contábil'
        Enabled = False
        TabOrder = 3
        OnExit = cmpContaFimExit
        MostraMensagens = True
        MostraDescricao = True
        DataSource = ds
        DataField = 'CONTA2'
        Mensagens.EmBranco = 'Conta não pode estar em branco'
        Mensagens.NaoExiste = 'Conta não existe'
        Mensagens.Sintetica = 'Conta não pode ser sintética'
        Mensagens.Analitica = 'Conta não pode ser analítica'
        PermiteChaveInvalida = False
        PermiteChaveEmBranco = False
        AceitaTipoConta = SoAnalitica
        Plano = 0
        Status = scAmbas
      end
    end
    object GroupBox1: TGroupBox
      Left = 24
      Top = 268
      Width = 657
      Height = 89
      Caption = 'Importação por Arquivo'
      TabOrder = 2
      object edtArqEventoCobranca: TEdit
        Left = 5
        Top = 40
        Width = 511
        Height = 21
        Anchors = [akLeft, akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 0
      end
      object btnProcurar: TBitBtn
        Left = 521
        Top = 40
        Width = 24
        Height = 22
        Hint = 'Procurar participante(s)'
        Anchors = [akTop, akRight]
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ParentShowHint = False
        ShowHint = True
        TabOrder = 1
        OnClick = btnProcurarClick
        Glyph.Data = {
          4E010000424D4E01000000000000760000002800000012000000120000000100
          040000000000D800000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
          DDDDDD000000DDDDDDDDDDDDDDDDDD000000D000000000000DD00D000000D0FF
          FFFFFFFF0D000D000000D0FFFFFFF0000800DD000000D0FFFFFF0877808DDD00
          0000D0FFFFF0877E880DDD000000D0FFFFF07777870DDD000000D0FFFFF07E77
          870DDD000000D0FFFFF08EE7880DDD000000D0FFFFFF087780DDDD000000D0FF
          FFFFF0000DDDDD000000D0FFFFFFFFFF0DDDDD000000D0FFFFFFF0000DDDDD00
          0000D0FFFFFFF070DDDDDD000000D0FFFFFFF00DDDDDDD000000DD00000000DD
          DDDDDD000000DDDDDDDDDDDDDDDDDD000000}
      end
      object btnLimpaPart: TBitBtn
        Left = 548
        Top = 40
        Width = 24
        Height = 22
        Hint = 'Limpa a seleção de Participante'
        Anchors = [akTop, akRight]
        TabOrder = 2
        OnClick = btnLimpaPartClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          88888888888FF8888888888888008888888888888F77F8888888888800F08888
          8888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0888
          88887788888F788888887FFFFFCF888888887F88FF7888FF88887FFCCCF88008
          888878F777888778F88887FFFF880110888887F88F8878878F8887FFC8809991
          0888878F7887F88878F8887FF88099991088887F88878F88878F887FF8880999
          03088878F88878F878788887F8888090B03088878F888787878788887888880B
          0B038888788888787878888888888880B0B38888888888878788888888888888
          0BBB88888888888878F888888888888880BB8888888888888788}
        NumGlyphs = 2
      end
      object BtnImportar: TBitBtn
        Left = 574
        Top = 40
        Width = 75
        Height = 25
        Caption = 'Importar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
        OnClick = BtnImportarClick
      end
    end
  end
  inherited Dock972: TDock97
    Width = 707
  end
  inherited Dock971: TDock97
    Top = 424
    Width = 707
    inherited tb97Fundo: TToolbar97
      Left = 367
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 590
    Top = 3
    TargetsData = (
      1
      1
      (
        'TRichEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 446
    Top = 15
  end
  inherited ImlPadrao: TImageList
    Left = 532
    Top = 3
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 320
    Top = 15
  end
  inherited Cds: TCMClientDataSet
    Left = 268
    Top = 15
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'P1.PLANO'
      'D.CONTA1'
      'P2.PLANO'
      'D.CONTA2')
    TipodeDado.Strings = (
      'C'
      'C'
      'N'
      'C')
    Descricao.Strings = (
      'Plano Origem'
      'Conta Origem'
      'Plano Destino'
      'Conta Destino')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PLANODEPARA D'
      'PLANO P1'
      'PLANO P2')
    CamposChave.Strings = (
      'D.IDPLANODEPARA')
    Filtro.Strings = (
      'D.PLANO1=P1.PLANO'
      'D.PLANO2=P2.PLANO')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '25'
      '25'
      '25'
      '26')
    Left = 392
    Top = 15
  end
  object cdsPlanoIni: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 264
    Top = 107
  end
  object cdsPlanoFim: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 568
    Top = 108
  end
  object cdsCustoFim: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 520
    Top = 244
  end
  object cdsCustoIni: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 248
    Top = 251
  end
  object cdsContas: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 400
    Top = 227
  end
  object Dialog: TOpenDialog
    Title = 'Arquivo de Entrada'
    Left = 620
    Top = 313
  end
  object QryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 280
    Top = 319
  end
  object Qry: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 328
    Top = 319
  end
end
