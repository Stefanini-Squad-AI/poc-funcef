inherited frmLerInfoIntegra: TfrmLerInfoIntegra
  Left = 186
  Top = 100
  Caption = 'Associar Rubrica ao Plano'
  ClientHeight = 352
  ClientWidth = 484
  FormStyle = fsNormal
  Visible = False
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 484
    Height = 313
    object pgctrlIntegracao: TPageControl
      Left = 5
      Top = 61
      Width = 474
      Height = 247
      ActivePage = tbsCAR
      Align = alClient
      TabOrder = 0
      object tbsOutros: TTabSheet
        Caption = 'Informações Globais'
        object pnlFundoOutros: TPanel
          Left = 0
          Top = 0
          Width = 466
          Height = 219
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 0
          object pnlGlobContab: TPanel
            Left = 6
            Top = 29
            Width = 445
            Height = 139
            BevelOuter = bvLowered
            TabOrder = 0
            object lblcentrespon: TLabel
              Left = 5
              Top = 6
              Width = 160
              Height = 13
              Caption = 'Centro de Responsabilidade'
            end
            object lbAtividade: TLabel
              Left = 5
              Top = 49
              Width = 108
              Height = 13
              Caption = 'Atividade / Projeto'
            end
            object lblContasCaixas: TLabel
              Left = 8
              Top = 94
              Width = 395
              Height = 13
              Caption = 
                'Contas Caixas x Forma de Pagto (somente quando obriga Favorecido' +
                ')'
            end
            object cmbcentrespon: TwwDBLookupCombo
              Left = 5
              Top = 23
              Width = 431
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'30'#9'Descrição')
              LookupTable = dtmIntegracao.qrycentrespon
              LookupField = 'NOME'
              Options = [loTitles]
              ParentFont = False
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              OnExit = cmbcentresponExit
            end
            object lkcmbDescAtividade: TwwDBLookupCombo
              Left = 5
              Top = 65
              Width = 431
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME'#9'25'#9'Descrição')
              LookupTable = dtmIntegracao.qryAtividade
              LookupField = 'NOME'
              Options = [loTitles]
              ParentFont = False
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              OnExit = lkcmbDescAtividadeExit
            end
            object dblkpcmbPortForma: TwwDBLookupCombo
              Left = 8
              Top = 110
              Width = 431
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'35'#9'Descrição')
              LookupTable = dtmIntegracao.qryformapag
              LookupField = 'DESCRICAO'
              Options = [loTitles]
              ParentFont = False
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              OnExit = dblkpcmbPortFormaExit
            end
          end
          object StaticText2: TStaticText
            Left = 5
            Top = 1
            Width = 152
            Height = 27
            Caption = 'Contas a Pagar'
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindow
            Font.Height = -19
            Font.Name = 'Bookman Old Style'
            Font.Style = [fsItalic]
            ParentColor = False
            ParentFont = False
            TabOrder = 1
          end
        end
      end
      object tbsContab: TTabSheet
        Caption = 'Contabilidade'
        object pnlFundoContab: TPanel
          Left = 0
          Top = 0
          Width = 466
          Height = 219
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 0
          object grpContaAssoc: TGroupBox
            Left = 8
            Top = 13
            Width = 446
            Height = 108
            Caption = 'Conta Contábil Associada'
            TabOrder = 0
            object Label3: TLabel
              Left = 210
              Top = 16
              Width = 92
              Height = 13
              Caption = 'Centro de Custo'
            end
            object cmbCCusto: TwwDBLookupCombo
              Left = 204
              Top = 32
              Width = 235
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'CODCENTROCUSTO'#9'10'#9'CODCENTROCUSTO'
                'NOME'#9'30'#9'NOME')
              LookupTable = dtmIntegracao.qryCCusto
              LookupField = 'NOME'
              Enabled = False
              ParentFont = False
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              OnCloseUp = cmbCCustoCloseUp
              OnExit = cmbCCustoExit
            end
            object GroupBox3: TGroupBox
              Left = 204
              Top = 58
              Width = 235
              Height = 39
              Caption = 'Descrição do Centro de Custo'
              TabOrder = 1
              object lbDescricaoCCusto: TLabel
                Left = 6
                Top = 17
                Width = 220
                Height = 13
                AutoSize = False
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
              end
            end
            object cmContaAssoc: TCMProcuraMaskContabil
              Left = 6
              Top = 15
              Width = 193
              Height = 82
              Caption = ' Conta Contábil '
              TabOrder = 2
              OnExit = cmContaAssocExit
              MostraMensagens = True
              MostraDescricao = True
              DataSource = frmAssocRubricaPlano.dsTemporaria
              DataField = 'PLACONTAC'
              Mensagens.EmBranco = 'Conta não pode estar em branco'
              Mensagens.NaoExiste = 'Conta não existe'
              Mensagens.Sintetica = 'Conta não pode ser sintética'
              Mensagens.Analitica = 'Conta não pode ser analítica'
              PermiteChaveInvalida = False
              PermiteChaveEmBranco = True
              AceitaTipoConta = SoAnalitica
              Plano = 0
              Status = scSoAtiva
              OnChange = cmContaAssocChange
            end
          end
          object Panel2: TPanel
            Left = 8
            Top = 159
            Width = 446
            Height = 52
            BevelOuter = bvLowered
            Caption = 'Panel2'
            TabOrder = 1
            object Label43: TLabel
              Left = 8
              Top = 5
              Width = 55
              Height = 13
              Caption = 'Subconta'
            end
            object dblkSubconta: TwwDBLookupCombo
              Left = 8
              Top = 20
              Width = 431
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMESUBCONTA'#9'60'#9'Descrição')
              LookupTable = dtmIntegracao.qrySubConta
              LookupField = 'CODSUBCONTA'
              Options = [loTitles]
              ParentFont = False
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              OnExit = dblkSubcontaExit
            end
          end
          object StaticText1: TStaticText
            Left = 10
            Top = 132
            Width = 137
            Height = 27
            Caption = 'Contabilidade'
            Color = clBtnFace
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindow
            Font.Height = -19
            Font.Name = 'Bookman Old Style'
            Font.Style = [fsItalic]
            ParentColor = False
            ParentFont = False
            TabOrder = 2
          end
        end
      end
      object tbsCAPCAR: TTabSheet
        Caption = 'Contas a Pagar'
        object pnlFundoCAPCAR: TPanel
          Left = 0
          Top = 0
          Width = 466
          Height = 219
          Align = alClient
          BevelOuter = bvLowered
          TabOrder = 0
          object cmpmTipoDesDesc: TCMProcuraMask
            Left = 24
            Top = 13
            Width = 415
            Height = 68
            Caption = ' Tipo de Desembolso para desconto no Contas a Pagar da Folha '
            TabOrder = 0
            OnExit = cmpmTipoDesDescExit
            MostraMensagens = True
            MostraDescricao = True
            DataSource = frmAssocRubricaPlano.dsTemporaria
            DataField = 'CODTIPRECDES'
            Mensagens.EmBranco = 'Tipo de Desembolso não pode estar em branco'
            Mensagens.NaoExiste = 'Tipo de Desembolso não existe'
            Mensagens.Sintetica = 'Tipo de Desembolso não pode ser sintético'
            Mensagens.Analitica = 'Tipo de Desembolso não pode ser analítico'
            PermiteChaveInvalida = False
            PermiteChaveEmBranco = True
            AceitaTipoConta = SoAnalitica
            MontaSelect = msTipoDesemb
            LookupQuery = qryTipoDesemb
            LookupParam = 'CODTIPRECDES'
            LookupChave = 'CODTIPRECDES'
            LookupTipo = 'ANASINT'
            LookupDescricao = 'DESCRICAO'
          end
          object cmpmTipoDesFavo: TCMProcuraMask
            Left = 24
            Top = 94
            Width = 415
            Height = 68
            Caption = ' Tipo de Desembolso para Contas a Pagar do Favorecido '
            TabOrder = 1
            OnExit = cmpmTipoDesFavoExit
            MostraMensagens = True
            MostraDescricao = True
            DataSource = frmAssocRubricaPlano.dsTemporaria
            DataField = 'CODTIPRECDESFAV'
            Mensagens.EmBranco = 'Tipo de Desembolso não pode estar em branco'
            Mensagens.NaoExiste = 'Tipo de Desembolso não existe'
            Mensagens.Sintetica = 'Tipo de Desembolso não pode ser sintético'
            Mensagens.Analitica = 'Tipo de Desembolso não pode ser analítico'
            PermiteChaveInvalida = False
            PermiteChaveEmBranco = True
            AceitaTipoConta = SoAnalitica
            MontaSelect = msTipoDesemb
            LookupQuery = qryTipoDesemb
            LookupParam = 'CODTIPRECDES'
            LookupChave = 'CODTIPRECDES'
            LookupTipo = 'ANASINT'
            LookupDescricao = 'DESCRICAO'
          end
        end
      end
      object tbsCAR: TTabSheet
        Caption = 'Contas a Receber'
        ImageIndex = 3
        object cmpmTipoRecebCar: TCMProcuraMask
          Left = 24
          Top = 13
          Width = 415
          Height = 68
          Caption = 'Tipo de Recebimento para Devolução na Folha'
          TabOrder = 0
          OnExit = cmpmTipoRecebCarExit
          MostraMensagens = True
          MostraDescricao = True
          DataSource = frmAssocRubricaPlano.dsTemporaria
          DataField = 'CODTIPRECDESCAR'
          Mensagens.EmBranco = 'Tipo de Recebimento não pode ser em branco'
          Mensagens.NaoExiste = 'Tipo de Recebimento não existe'
          Mensagens.Sintetica = 'Tipo de Recebimento não pode ser sintético'
          Mensagens.Analitica = 'Tipo de Recebimento não pode ser analítico'
          PermiteChaveInvalida = False
          PermiteChaveEmBranco = True
          AceitaTipoConta = SoAnalitica
          MontaSelect = msTipoReceb
          LookupQuery = qryTipoReceb
          LookupParam = 'CODTIPRECDES'
          LookupChave = 'CODTIPRECDES'
          LookupTipo = 'ANASINT'
          LookupDescricao = 'DESCRICAO'
        end
        object cmpmTipoRecebFavCar: TCMProcuraMask
          Left = 24
          Top = 94
          Width = 415
          Height = 68
          Caption = 'Tipo de Recebimento para o Favorecido (Estorno de Pagamento)'
          TabOrder = 1
          OnExit = cmpmTipoRecebFavCarExit
          MostraMensagens = True
          MostraDescricao = True
          DataSource = frmAssocRubricaPlano.dsTemporaria
          DataField = 'CODTIPRECDESFAVCAR'
          Mensagens.EmBranco = 'Tipo de Recebimento não pode ser em branco'
          Mensagens.NaoExiste = 'Tipo de Recebimento não existe'
          Mensagens.Sintetica = 'Tipo de Recebimento não pode ser sintético'
          Mensagens.Analitica = 'Tipo de Recebimento não pode ser analítico'
          PermiteChaveInvalida = False
          PermiteChaveEmBranco = True
          AceitaTipoConta = SoAnalitica
          MontaSelect = msTipoReceb
          LookupQuery = qryTipoReceb
          LookupParam = 'CODTIPRECDES'
          LookupChave = 'CODTIPRECDES'
          LookupTipo = 'ANASINT'
          LookupDescricao = 'DESCRICAO'
        end
      end
    end
    object Panel1: TPanel
      Left = 5
      Top = 5
      Width = 474
      Height = 56
      Align = alTop
      TabOrder = 1
      object lblPlano: TLabel
        Left = 10
        Top = 6
        Width = 45
        Height = 13
        Caption = 'Plano : '
      end
      object lblProvento: TLabel
        Left = 10
        Top = 28
        Width = 57
        Height = 13
        Caption = 'Rubrica : '
      end
    end
  end
  inherited Dock971: TDock97
    Top = 313
    Width = 484
    inherited tb97Fundo: TToolbar97
      Left = 251
      DockPos = 251
      inherited bbtnSair: TBitBtn
        Tag = 99
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 83
      DockPos = 83
      inherited bbtnConfirmar: TBitBtn
        OnClick = bbtnConfirmarClick
      end
      inherited bbtnCancelar: TBitBtn
        Tag = 99
        OnClick = bbtnCancelarClick
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 420
    Top = 10
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryTipoDesemb: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODTIPRECDES,IDPESSOA,RECPAG,DESCRICAO,ANASINT'
      'FROM   TIPORECEBDESEMB'
      'WHERE (RTRIM(CODTIPRECDES)= :CODTIPRECDES) AND (RECPAG   =  '#39'P'#39')'
      ''
      ' ')
    ValidateWithMask = True
    Left = 32
    Top = 258
    ParamData = <
      item
        DataType = ftString
        Name = 'CODTIPRECDES'
        ParamType = ptUnknown
      end>
  end
  object msTipoDesemb: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'TIPORECEBDESEMB.CODTIPRECDES'
      'TIPORECEBDESEMB.DESCRICAO'
      'TIPORECEBDESEMB.ANASINT')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição'
      'Tipo (A/S)')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'TIPORECEBDESEMB')
    CamposChave.Strings = (
      'TIPORECEBDESEMB.CODTIPRECDES'
      'TIPORECEBDESEMB.RECPAG'
      'TIPORECEBDESEMB.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '15'
      '35'
      '1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 116
    Top = 258
  end
  object qryTipoReceb: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODTIPRECDES,IDPESSOA,RECPAG,DESCRICAO,ANASINT'
      'FROM   TIPORECEBDESEMB'
      'WHERE (RTRIM(CODTIPRECDES)= :CODTIPRECDES) AND (RECPAG   =  '#39'R'#39')')
    ValidateWithMask = True
    Left = 222
    Top = 258
    ParamData = <
      item
        DataType = ftString
        Name = 'CODTIPRECDES'
        ParamType = ptUnknown
      end>
  end
  object msTipoReceb: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'TIPORECEBDESEMB.CODTIPRECDES'
      'TIPORECEBDESEMB.DESCRICAO'
      'TIPORECEBDESEMB.ANASINT')
    TipodeDado.Strings = (
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição'
      'Tipo (A/S)')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'TIPORECEBDESEMB')
    CamposChave.Strings = (
      'TIPORECEBDESEMB.CODTIPRECDES'
      'TIPORECEBDESEMB.RECPAG'
      'TIPORECEBDESEMB.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      '')
    Larguras.Strings = (
      '15'
      '35'
      '1')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 296
    Top = 258
  end
end
