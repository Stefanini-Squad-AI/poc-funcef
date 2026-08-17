inherited frmCadServProdxItemMT: TfrmCadServProdxItemMT
  Left = 26
  Top = 85
  HelpContext = 120007
  Caption = 'Cadastro de Serviço / Produtos X Item'
  ClientHeight = 410
  ClientWidth = 721
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 721
    Height = 324
    inherited pnlMestre: TPanel
      Width = 719
      Height = 59
      inline molObjeto1: TmolObjeto
        Left = 8
        Top = 8
        Width = 689
        inherited edtObjeto: TEdit
          Width = 625
        end
        inherited btnBuscaObjeto: TBitBtn
          Left = 632
        end
        inherited btnLimpaObjeto: TBitBtn
          Left = 656
        end
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 60
      Width = 719
      Height = 263
      Tabs.Strings = (
        'Item')
      inherited pgctrlDetalhe: TPageControl
        Width = 621
        Height = 204
        inherited tbsDet: TTabSheet
          Caption = 'Item'
          inherited dbgrdDet: TwwDBGrid [0]
            Width = 613
            Height = 176
            Selected.Strings = (
              'NOME_ITEM'#9'79'#9'Item'
              'RECPAG'#9'4'#9'Tipo'
              'CODTIPRECDES'#9'9'#9'Rec / Des'
              'DESC_TIPRECDES'#9'35'#9'Tipo Receb / Desemb'
              'PLANO'#9'5'#9'Plano'
              'PLACONTA'#9'13'#9'Conta'
              'CODSUBCONTA'#9'12'#9'SubConta')
          end
          inherited pnlControlesDet: TPanel [1]
            Width = 613
            Height = 176
            object Label3: TLabel
              Left = 8
              Top = 124
              Width = 196
              Height = 13
              Caption = 'Tipo de Recebimento/Desembolso'
            end
            object lblSubConta: TLabel
              Left = 308
              Top = 124
              Width = 55
              Height = 13
              Caption = 'Subconta'
            end
            object dbrgRegimePagamento: TDBRadioGroup
              Left = 9
              Top = 49
              Width = 288
              Height = 44
              Caption = 'Regime de Pagamento'
              Columns = 2
              DataField = 'RECPAG'
              DataSource = dsDet
              Items.Strings = (
                'Contas a Pagar'
                'Contas a Receber')
              TabOrder = 0
              Values.Strings = (
                'P'
                'R')
              OnClick = dbrgRegimePagamentoClick
            end
            object dblcTipoRecDes: TwwDBLookupCombo
              Left = 8
              Top = 140
              Width = 289
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'35'#9'Tipo de Rec/Des'#9'F'
                'CODTIPRECDES'#9'15'#9'Código'#9'F'
                'RECPAG'#9'1'#9'Tipo'#9'F'
                'PLACONTA'#9'18'#9#9'F')
              DataField = 'CODTIPRECDES'
              DataSource = dsDet
              LookupTable = cdsTipoRecDes
              LookupField = 'CODTIPRECDES'
              DropDownCount = 7
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
              OnChange = dblcTipoRecDesChange
            end
            object dblcSubConta: TwwDBLookupCombo
              Left = 308
              Top = 140
              Width = 289
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMESUBCONTA'#9'60'#9'NOMESUBCONTA'#9'No'
                'CODSUBCONTA'#9'10'#9'CODSUBCONTA'#9'No')
              DataField = 'CODSUBCONTA'
              DataSource = dsDet
              LookupTable = cdsSubConta
              LookupField = 'CODSUBCONTA'
              DropDownCount = 7
              Enabled = False
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
            object dbeContaContabil: TCMProcuraMaskContabil
              Left = 308
              Top = 49
              Width = 289
              Height = 70
              Caption = ' Conta Contábil '
              TabOrder = 3
              MostraMensagens = True
              MostraDescricao = True
              DataSource = dsDet
              DataField = 'PLACONTA'
              Mensagens.EmBranco = 'Conta não pode estar em branco'
              Mensagens.NaoExiste = 'Conta não existe'
              Mensagens.Sintetica = 'Conta não pode ser sintética'
              Mensagens.Analitica = 'Conta não pode ser analítica'
              PermiteChaveInvalida = False
              PermiteChaveEmBranco = True
              AceitaTipoConta = SoAnalitica
              Plano = 0
              Status = scSoAtiva
            end
            inline molItem1: TmolItem
              Width = 601
              TabOrder = 4
              inherited edtItem: TEdit
                Width = 541
              end
              inherited btnBuscaItem: TBitBtn
                Left = 548
              end
              inherited btnLimpaItem: TBitBtn
                Left = 572
              end
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 711
      end
      inherited Dock974: TDock97
        Left = 625
        Height = 204
      end
    end
  end
  inherited Dock972: TDock97
    Width = 721
  end
  inherited Dock971: TDock97
    Top = 371
    Width = 721
    inherited tb97Fundo: TToolbar97
      Left = 549
      DockPos = 551
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 190
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 2
    Top = 359
  end
  inherited ds: TwwDataSource
    Left = 326
    Top = 65535
  end
  inherited ImlPadrao: TImageList
    Left = 40
    Top = 359
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    ApplyInsert = CmeCadastroApplyInsert
    ApplyEdit = CmeCadastroApplyInsert
    ApplyDelete = CmeCadastroApplyDelete
    Left = 464
    Top = 65535
  end
  inherited Cds: TCMClientDataSet
    Left = 356
    Top = 65535
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'O.NOMEOBJETO'
      'I.NOME_ITEM')
    TipodeDado.Strings = (
      'C'
      'C')
    Descricao.Strings = (
      'Serviço / Produto'
      'Item')
    SensivelACaixa.Strings = (
      'N'
      'N')
    Tabelas.Strings = (
      'OBJETOXITEM OI'
      'OBJETOCONTRATUAL O'
      'ITEMCONTRATUAL I')
    CamposChave.Strings = (
      'OI.IDOBJETO')
    Filtro.Strings = (
      'OI.IDOBJETO = O.IDOBJETO'
      'OI.IDITEM = I.IDITEM')
    Mascaras.Strings = (
      ''
      '')
    Larguras.Strings = (
      '50'
      '50')
    UsaDistinct = True
    Left = 264
    Top = 65535
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 524
    Top = 65535
  end
  inherited dsDet: TwwDataSource
    DataSet = cdsDet
    Left = 406
    Top = 65535
  end
  object cdsDet: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 406
    Top = 12
  end
  object CMSqlParams1: TCMSqlParams
    SQL.Strings = (
      'SELECT OI.*, R.DESCRICAO AS DESC_TIPRECDES,'
      '       I.NOME_ITEM'
      '  FROM OBJETOXITEM OI, TIPORECEBDESEMB R,'
      '       ITEMCONTRATUAL I'
      ' WHERE OI.IDITEM = I.IDITEM'
      '    AND OI.CODTIPRECDES = R.CODTIPRECDES(+)'
      '')
    Left = 461
    Top = 60
  end
  object cdsTipoRecDes: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 652
    Top = 263
  end
  object cdsSubConta: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 652
    Top = 279
  end
end
