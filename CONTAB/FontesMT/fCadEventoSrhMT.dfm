inherited frmCadEventoSrhMT: TfrmCadEventoSrhMT
  Left = 110
  Top = 73
  Width = 532
  Height = 441
  BorderStyle = bsSizeable
  Caption = 'Evento SRH'
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 524
    Height = 328
    object Label1: TLabel
      Left = 36
      Top = 15
      Width = 40
      Height = 13
      Caption = 'Código'
    end
    object Label2: TLabel
      Left = 114
      Top = 15
      Width = 58
      Height = 13
      Caption = 'Descricao'
    end
    object Label4: TLabel
      Left = 394
      Top = 57
      Width = 81
      Height = 13
      Caption = 'Cód. Histórico'
    end
    object Label3: TLabel
      Left = 36
      Top = 57
      Width = 100
      Height = 13
      Caption = 'Atividade/Projeto'
    end
    object Panel3: TPanel
      Left = 35
      Top = 203
      Width = 458
      Height = 102
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 7
      object Panel12: TPanel
        Left = 1
        Top = 0
        Width = 20
        Height = 122
        BevelOuter = bvNone
        Color = clGray
        TabOrder = 0
        object fcLabel4: TfcLabel
          Left = 0
          Top = 26
          Width = 20
          Height = 79
          AutoSize = False
          Caption = 'Crédito'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TextOptions.Alignment = taLeftJustify
          TextOptions.Rotation = 90
          TextOptions.VAlignment = vaTop
        end
      end
      object cmpContaCre: TCMProcuraMaskContabil
        Left = 42
        Top = 7
        Width = 185
        Height = 79
        Caption = 'Conta Contábil'
        TabOrder = 1
        OnExit = cmpContaCreExit
        MostraMensagens = True
        MostraDescricao = True
        DataSource = ds
        DataField = 'CONTACRE'
        Mensagens.EmBranco = 'Conta não pode estar em branco'
        Mensagens.NaoExiste = 'Conta não existe'
        Mensagens.Sintetica = 'Conta não pode ser sintética'
        Mensagens.Analitica = 'Conta não pode ser analítica'
        PermiteChaveInvalida = False
        PermiteChaveEmBranco = False
        AceitaTipoConta = SoAnalitica
        Plano = 0
        Status = scSoAtiva
      end
      object GroupBox1: TGroupBox
        Left = 252
        Top = 8
        Width = 185
        Height = 79
        Caption = 'Sub-Conta'
        TabOrder = 2
        object lblNomeSubContaC: TfcLabel
          Left = 10
          Top = 50
          Width = 0
          Height = 0
          TextOptions.Alignment = taLeftJustify
          TextOptions.VAlignment = vaTop
        end
        object btnSubContaCre: TBitBtn
          Left = 150
          Top = 16
          Width = 27
          Height = 26
          TabOrder = 0
          OnClick = btnSubContaCreClick
          Glyph.Data = {
            66010000424D6601000000000000760000002800000014000000140000000100
            040000000000F000000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333333FFFFF
            FFF0000000003333333BFBFBFBF0FFF000003333333FFFFFFF00000000003333
            333BFBFBF0FBFBFB00003333333F00000FF0000000003333333B0FFF0000FFF0
            00003333333F00000FF0000000003333330BFBFBF0FBFBFB000033333010FFFF
            FF0000000000333330180BFBFBF0FFF000003333301180FFFFF0000000003333
            0811190BFBFBFBFB0000333307719990FFFFFFFF0000333077FF999903333333
            000033077FFFF0003333333300003077FFF00333333333330000077FFF033333
            33333333000007FFF093333333333333000030FF093333333333333300003300
            33333333333333330000}
        end
        object GroupBox4: TGroupBox
          Left = 8
          Top = 11
          Width = 137
          Height = 32
          TabOrder = 1
          object mskSubContaC: TMaskEdit
            Left = 3
            Top = 8
            Width = 131
            Height = 21
            TabOrder = 0
            OnExit = mskSubContaCExit
          end
        end
      end
    end
    object dbeCodEvento: TwwDBEdit
      Left = 36
      Top = 28
      Width = 70
      Height = 21
      DataField = 'CODEVENTO'
      DataSource = ds
      MaxLength = 3
      TabOrder = 0
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object dbeDescEvento: TwwDBEdit
      Left = 114
      Top = 28
      Width = 379
      Height = 21
      DataField = 'DESCRICAO'
      DataSource = ds
      MaxLength = 60
      TabOrder = 1
      UnboundDataType = wwDefault
      WantReturns = False
      WordWrap = False
    end
    object Panel2: TPanel
      Left = 35
      Top = 103
      Width = 458
      Height = 102
      BevelInner = bvRaised
      BevelOuter = bvLowered
      TabOrder = 6
      object Panel10: TPanel
        Left = 1
        Top = -159
        Width = 25
        Height = 121
        BevelOuter = bvNone
        Caption = 'Panel10'
        Color = clGray
        TabOrder = 0
      end
      object Panel11: TPanel
        Left = 1
        Top = 1
        Width = 20
        Height = 125
        BevelOuter = bvNone
        Color = clGray
        TabOrder = 1
        object fcLabel3: TfcLabel
          Left = 0
          Top = 34
          Width = 20
          Height = 70
          AutoSize = False
          Caption = 'Débito'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TextOptions.Alignment = taLeftJustify
          TextOptions.Rotation = 90
          TextOptions.VAlignment = vaTop
        end
      end
      object cmpContaDeb: TCMProcuraMaskContabil
        Left = 42
        Top = 9
        Width = 185
        Height = 79
        Caption = 'Conta Contábil'
        TabOrder = 2
        OnExit = cmpContaDebExit
        MostraMensagens = True
        MostraDescricao = True
        DataSource = ds
        DataField = 'CONTADEB'
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
      object GroupBox2: TGroupBox
        Left = 251
        Top = 9
        Width = 185
        Height = 79
        Caption = 'Sub-Conta'
        TabOrder = 3
        object lblNomeSubContaD: TfcLabel
          Left = 10
          Top = 52
          Width = 0
          Height = 0
          TextOptions.Alignment = taLeftJustify
          TextOptions.VAlignment = vaTop
        end
        object btnSubContaDeb: TBitBtn
          Left = 150
          Top = 16
          Width = 27
          Height = 26
          TabOrder = 0
          OnClick = btnSubContaDebClick
          Glyph.Data = {
            66010000424D6601000000000000760000002800000014000000140000000100
            040000000000F000000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF003333333FFFFF
            FFF0000000003333333BFBFBFBF0FFF000003333333FFFFFFF00000000003333
            333BFBFBF0FBFBFB00003333333F00000FF0000000003333333B0FFF0000FFF0
            00003333333F00000FF0000000003333330BFBFBF0FBFBFB000033333010FFFF
            FF0000000000333330180BFBFBF0FFF000003333301180FFFFF0000000003333
            0811190BFBFBFBFB0000333307719990FFFFFFFF0000333077FF999903333333
            000033077FFFF0003333333300003077FFF00333333333330000077FFF033333
            33333333000007FFF093333333333333000030FF093333333333333300003300
            33333333333333330000}
        end
        object GroupBox3: TGroupBox
          Left = 8
          Top = 11
          Width = 137
          Height = 32
          TabOrder = 1
          object mskSubContaD: TMaskEdit
            Left = 3
            Top = 8
            Width = 131
            Height = 21
            TabOrder = 0
            OnExit = mskSubContaDExit
          end
        end
      end
    end
    object dblkHistorico: TwwDBLookupCombo
      Left = 395
      Top = 71
      Width = 98
      Height = 21
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      DropDownAlignment = taRightJustify
      Selected.Strings = (
        'HITCODHIST'#9'4'#9'Cód.'#9'No'
        'HITDESCR1'#9'200'#9'Descrição'#9'No')
      DataField = 'HITCODHIST'
      DataSource = ds
      LookupTable = CdsHistorico
      LookupField = 'HITCODHIST'
      Style = csDropDownList
      DropDownWidth = 316
      ParentFont = False
      TabOrder = 5
      AutoDropDown = True
      ShowButton = True
      AllowClearKey = True
      ShowMatchText = True
    end
    object NomeAtivProj: TEdit
      Left = 126
      Top = 71
      Width = 254
      Height = 21
      Color = clInactiveCaption
      TabOrder = 4
    end
    object btnAtivPrpj: TBitBtn
      Left = 93
      Top = 71
      Width = 25
      Height = 21
      TabOrder = 3
      OnClick = btnAtivPrpjClick
      Glyph.Data = {
        76010000424D7601000000000000760000002800000020000000100000000100
        0400000000000001000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
        777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
        77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
        77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
        077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
        FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
        F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
        7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
        777777787FFF8777777777770000777777777777888877777777}
      NumGlyphs = 2
    end
    object mskAtivProj: TMaskEdit
      Left = 36
      Top = 71
      Width = 55
      Height = 21
      TabOrder = 2
      OnExit = mskAtivProjExit
    end
  end
  inherited Dock972: TDock97
    Width = 524
  end
  inherited Dock971: TDock97
    Top = 375
    Width = 524
    inherited tb97Fundo: TToolbar97
      Left = 354
      inherited bbtnSair: TBitBtn
        Tag = 999
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 187
      inherited bbtnCancelar: TBitBtn
        Tag = 999
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 10
    Top = 143
    TargetsData = (
      1
      2
      (
        'TMemo'
        'Text'
        0)
      (
        'TDBRealEdit'
        'Text'
        0))
  end
  inherited ds: TwwDataSource
    Left = 398
    Top = 7
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyEdit
    ApplyDelete = CmeCadastroApplyDelete
    OnAbortConfirma = CmeCadastroAbortConfirma
    Left = 294
    Top = 7
  end
  inherited Cds: TCMClientDataSet
    Left = 436
    Top = 7
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'CADEVENTOSRH.CODEVENTO'
      'CADEVENTOSRH.DESCRICAO')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Descricao')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'CADEVENTOSRH')
    CamposChave.Strings = (
      'CADEVENTOSRH.CODEVENTO')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '3'
      '60')
  end
  object MontaSelectSubConta: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'SUBCONTA.CODSUBCONTA'
      'SUBCONTA.NOMESUBCONTA')
    TipodeDado.Strings = (
      'N'
      'C')
    Descricao.Strings = (
      'Codigo'
      'Nome')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'SUBCONTA'
      'CONTASXSUBC')
    CamposChave.Strings = (
      'SUBCONTA.CODSUBCONTA'
      'SUBCONTA.IDPESSOA')
    Filtro.Strings = (
      'SUBCONTA.CODSUBCONTA = CONTASXSUBC.CODSUBCONTA'
      'SUBCONTA.IDPESSOA = CONTASXSUBC.IDPESSOA'
      'CONTASXSUBC.PLACONTA = '#39'1'#39
      'CONTASXSUBC.PLANO = 2')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '10'
      '60')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 362
    Top = 193
  end
  object MontaSelectAtivProj: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'UNIDNEGOCIO.UNECODIGO'
      'UNIDNEGOCIO.NOME'
      'UNIDNEGOCIO.UNIDNEGOC')
    TipodeDado.Strings = (
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Codigo'
      'Nome'
      'Unid. Negócio')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'UNIDNEGOCIO')
    CamposChave.Strings = (
      'UNIDNEGOCIO.UNECODIGO'
      'UNIDNEGOCIO.UNIDNEGOC'
      'UNIDNEGOCIO.NOME'
      'UNIDNEGOCIO.IDPESSOA')
    Filtro.Strings = (
      'UNIDNEGOCIO.UNETIPO = '#39'A'#39)
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '25'
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    Left = 104
    Top = 130
  end
  object CdsHistorico: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 424
    Top = 87
  end
end
