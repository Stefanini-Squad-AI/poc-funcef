inherited frmCadTipoDesemb: TfrmCadTipoDesemb
  Left = 214
  Top = 148
  Caption = 'Cadastro de Tipo de Desembolso'
  ClientHeight = 450
  ClientWidth = 693
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 322
    Height = 364
    Enabled = False
    object treeDesemb: TCMTreeView
      Left = 5
      Top = 39
      Width = 312
      Height = 320
      PodeNavegar = True
      DataSource = ds
      CampoChave = qryCODTIPRECDES
      CampoDescricao = qryDESCRICAO
      CampoTipo = qryANASINT
      Align = alClient
    end
    object Panel1: TPanel
      Left = 5
      Top = 5
      Width = 312
      Height = 34
      Align = alTop
      BevelInner = bvLowered
      Color = clGray
      TabOrder = 0
      object LbLTipoDesemb: TLabel
        Left = 43
        Top = 6
        Width = 209
        Height = 22
        Caption = 'Tipos de Desembolso'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWhite
        Font.Height = -19
        Font.Name = 'Courier New'
        Font.Style = [fsBold]
        ParentFont = False
      end
    end
  end
  object pnlEdicao: TPanel [1]
    Left = 322
    Top = 47
    Width = 371
    Height = 364
    Align = alRight
    BevelInner = bvLowered
    BorderWidth = 3
    TabOrder = 3
    object PageControl1: TPageControl
      Left = 5
      Top = 5
      Width = 361
      Height = 354
      ActivePage = TbsGeral
      Align = alClient
      TabOrder = 0
      object TbsGeral: TTabSheet
        Caption = 'Geral'
        object LblTipoAvalia: TLabel
          Left = 9
          Top = 159
          Width = 104
          Height = 13
          Caption = 'Tipo de Avaliação'
        end
        object Label2: TLabel
          Left = 6
          Top = 3
          Width = 40
          Height = 13
          Caption = 'Código'
        end
        object Label3: TLabel
          Left = 117
          Top = 1
          Width = 58
          Height = 13
          Caption = 'Descrição'
          FocusControl = dbedDescricao
        end
        object Bevel2: TBevel
          Left = 6
          Top = 154
          Width = 341
          Height = 9
          Shape = bsTopLine
        end
        object Bevel3: TBevel
          Left = 6
          Top = 204
          Width = 341
          Height = 9
          Shape = bsTopLine
        end
        object ChkObrigaOrc: TDBCheckBox
          Left = 9
          Top = 95
          Width = 297
          Height = 17
          Caption = 'Obriga Indicação de Compromisso Orçamentário'
          DataField = 'FLGOBRIGARESERVA'
          DataSource = ds
          TabOrder = 0
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object DBCheckBox1: TDBCheckBox
          Left = 9
          Top = 113
          Width = 274
          Height = 17
          Caption = 'Calcula Imposto para documento associado'
          DataField = 'FLGCALCULAIMPOSTO'
          DataSource = ds
          TabOrder = 1
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object CkbEfet: TDBCheckBox
          Left = 9
          Top = 132
          Width = 336
          Height = 17
          Caption = 'Corresponde a Um Tipo de Desembolso Operacional'
          DataField = 'FLGINDICARECDES'
          DataSource = ds
          TabOrder = 2
          ValueChecked = 'S'
          ValueUnchecked = 'N'
        end
        object CmbTipoAvalia: TCMDBLookupCombo
          Left = 9
          Top = 177
          Width = 334
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCTIPOAVALIACAO'#9'50'#9'Descrição')
          DataField = 'IDTIPOAVALIACAO'
          DataSource = ds
          LookupTable = QryTipoAvalia
          LookupField = 'IDTIPOAVALIACAO'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 3
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
        object dbedCod: TwwDBEdit
          Left = 6
          Top = 16
          Width = 102
          Height = 21
          DataField = 'CODTIPRECDES'
          DataSource = ds
          TabOrder = 4
          UnboundDataType = wwDefault
          WantReturns = False
          WordWrap = False
          OnExit = dbedCodExit
        end
        object dbedDescricao: TDBEdit
          Left = 109
          Top = 16
          Width = 240
          Height = 21
          DataField = 'DESCRICAO'
          DataSource = ds
          TabOrder = 5
        end
        object pnAnaSint: TPanel
          Left = 6
          Top = 45
          Width = 341
          Height = 42
          BevelInner = bvLowered
          BevelOuter = bvNone
          TabOrder = 6
          object sbtnAnalitico: TSpeedButton
            Left = 31
            Top = 4
            Width = 130
            Height = 34
            GroupIndex = 1
            Caption = '&Analítico'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
              5555555FFFFFFFFFF5555550000000000555557777777777F5555550FFFFFFFF
              0555557F5FFFF557F5555550F0000FFF0555557F77775557F5555550FFFFFFFF
              0555557F5FFFFFF7F5555550F000000F0555557F77777757F5555550FFFFFFFF
              0555557F5FFFFFF7F5555550F000000F0555557F77777757F5555550FFFFFFFF
              0555557F5FFF5557F5555550F000FFFF0555557F77755FF7F5555550FFFFF000
              0555557F5FF5777755555550F00FF0F05555557F77557F7555555550FFFFF005
              5555557FFFFF7755555555500000005555555577777775555555555555555555
              5555555555555555555555555555555555555555555555555555}
            NumGlyphs = 2
            ParentFont = False
            OnClick = sbtnAnaliticoClick
          end
          object sbtnSintetico: TSpeedButton
            Left = 172
            Top = 4
            Width = 130
            Height = 34
            GroupIndex = 1
            Caption = 'Sin&tético'
            Font.Charset = DEFAULT_CHARSET
            Font.Color = clWindowText
            Font.Height = -11
            Font.Name = 'MS Sans Serif'
            Font.Style = [fsBold]
            Glyph.Data = {
              76010000424D7601000000000000760000002800000020000000100000000100
              0400000000000001000000000000000000001000000010000000000000000000
              800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00555555555555
              5555555555555555555555555555555555555555555555555555555555555555
              555555555555555555555555555555555555555FFFFFFFFFF555550000000000
              55555577777777775F55500B8B8B8B8B05555775F555555575F550F0B8B8B8B8
              B05557F75F555555575F50BF0B8B8B8B8B0557F575FFFFFFFF7F50FBF0000000
              000557F557777777777550BFBFBFBFB0555557F555555557F55550FBFBFBFBF0
              555557F555555FF7555550BFBFBF00055555575F555577755555550BFBF05555
              55555575FFF75555555555700007555555555557777555555555555555555555
              5555555555555555555555555555555555555555555555555555}
            NumGlyphs = 2
            ParentFont = False
            OnClick = sbtnSinteticoClick
          end
        end
        object wwDBGrid1: TwwDBGrid
          Left = 9
          Top = 215
          Width = 333
          Height = 104
          Selected.Strings = (
            'CODCORRESP'#9'36'#9'Código Correspondente')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = DsTipoRdCorresp
          KeyOptions = [dgAllowInsert]
          TabOrder = 7
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          IndicatorColor = icBlack
        end
      end
      object TbContabilizacao: TTabSheet
        Caption = 'Contabilização'
        object Bevel1: TBevel
          Left = 8
          Top = 264
          Width = 337
          Height = 52
          Shape = bsFrame
        end
        object Label1: TLabel
          Left = 24
          Top = 270
          Width = 248
          Height = 13
          Caption = 'Histórico Padrão Para Lançamento Contábil'
        end
        object CContabil1: TCMProcuraMaskContabil
          Left = 8
          Top = 130
          Width = 337
          Height = 127
          Caption = ' Conta Crédito  '
          TabOrder = 0
          MostraMensagens = True
          MostraDescricao = True
          DataSource = ds
          DataField = 'PLACONTACREDITO'
          Mensagens.EmBranco = 'não pode estar em branco'
          Mensagens.NaoExiste = 'não existe'
          Mensagens.Sintetica = 'não pode ser sintética'
          Mensagens.Analitica = 'não pode ser analítica'
          PermiteChaveInvalida = False
          PermiteChaveEmBranco = True
          AceitaTipoConta = SoAnalitica
          Plano = 0
          Status = scSoAtiva
          object Panel3: TPanel
            Left = 8
            Top = 75
            Width = 324
            Height = 49
            BevelOuter = bvNone
            TabOrder = 2
            object Label5: TLabel
              Left = 8
              Top = 4
              Width = 60
              Height = 13
              Caption = 'Sub-Conta'
            end
            object dblcSubContaCre: TwwDBLookupCombo
              Left = 8
              Top = 20
              Width = 305
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMESUBCONTA'#9'40'#9'Nome'
                'CODSUBCONTA'#9'10'#9'Código')
              DataField = 'CODSUBCONTACRE'
              DataSource = ds
              LookupTable = qrySubContaCre
              LookupField = 'CODSUBCONTA'
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
          end
        end
        object CContabil2: TCMProcuraMaskContabil
          Left = 8
          Top = 0
          Width = 337
          Height = 127
          Caption = ' Conta Contábil '
          TabOrder = 1
          MostraMensagens = True
          MostraDescricao = True
          DataSource = ds
          DataField = 'PLACONTA'
          Mensagens.EmBranco = 'não pode estar em branco'
          Mensagens.NaoExiste = 'não existe'
          Mensagens.Sintetica = 'não pode ser sintética'
          Mensagens.Analitica = 'não pode ser analítica'
          PermiteChaveInvalida = False
          PermiteChaveEmBranco = True
          AceitaTipoConta = SoAnalitica
          Plano = 0
          Status = scSoAtiva
          object Panel2: TPanel
            Left = 9
            Top = 75
            Width = 324
            Height = 49
            BevelOuter = bvNone
            Caption = 'Panel2'
            TabOrder = 2
            object lblSubConta: TLabel
              Left = 8
              Top = 4
              Width = 60
              Height = 13
              Caption = 'Sub-Conta'
            end
            object dblcSubConta: TwwDBLookupCombo
              Left = 8
              Top = 20
              Width = 305
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMESUBCONTA'#9'40'#9'Nome'
                'CODSUBCONTA'#9'10'#9'Código')
              DataField = 'CODSUBCONTA'
              DataSource = ds
              LookupTable = qrySubConta
              LookupField = 'CODSUBCONTA'
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
            end
          end
        end
        object CMDBLookupCombo1: TCMDBLookupCombo
          Left = 23
          Top = 286
          Width = 307
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'HITDESCR1'#9'200'#9'Histórico')
          DataField = 'HITCODHIST'
          DataSource = ds
          LookupTable = QryHistorico
          LookupField = 'HITCODHIST'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 2
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 693
    inherited Toolbar971: TToolbar97
      object SpbImportar: TToolbarButton97
        Left = 240
        Top = 0
        Width = 60
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        Caption = '&Copiar'
        Glyph.Data = {
          06020000424D0602000000000000760000002800000028000000140000000100
          0400000000009001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
          3333333333FFFFFFFF333FFFFF3330000000033300000333377777777F337777
          7FF330EFEFEF03307333703337F3FFFF7F37733377F330F4444E033333333033
          37F777737F333333F7F33099999903333330703337F333337F33333777FF309F
          FFF903333330000337F333337F33333777733099999903333330003337F3FF3F
          7F333337773330F44E0003333330033337F7737773333337733330EFEF003333
          3330333337FFFF7733333337333330000003333333333333377777733333FFFF
          FFFF3333333333300000000333333F3333377777777F333303333330EFEFEF03
          33337F333337F3FFFF7F333003333330F4444E0333377F333337F777737F3300
          03333330EFEFEF0333777F333337F3FFFF7F300003333330F4444E0337777F33
          3337F777737F330703333330EFEFEF03337773333337F3FF3F7F330333333330
          F44E0003337FF333FF37F7737773330733370330EFEF00333377FFF77337FFFF
          7733333000003330000003333337777733377777733333333333333333333333
          33333333333333333333}
        Layout = blGlyphTop
        NumGlyphs = 2
        Opaque = False
        Spacing = 0
        OnClick = SpbImportarClick
      end
    end
  end
  inherited Dock971: TDock97
    Top = 411
    Width = 693
    inherited TB97oKCancelar: TToolbar97
      Left = 157
      DockPos = 157
    end
  end
  inherited qry: TwwQuery
    AfterScroll = qryAfterScroll
    SQL.Strings = (
      'SELECT'
      '  CODTIPRECDES,'
      '  RECPAG,'
      '  IDPESSOA,'
      '  PLACONTACREDITO,'
      '  PLANO,'
      '  PLACONTA,'
      '  IDUSUARIOINCLUSAO,'
      '  DESCRICAO,'
      '  ANASINT,'
      '  FLGOBRIGARESERVA,'
      '  FLGCALCULAIMPOSTO,'
      '  IDTIPOAVALIACAO,'
      '  FLGINDICARECDES,'
      '  HITCODHIST,'
      '  CODCORRESP,'
      '  CODSUBCONTA,'
      '  CODSUBCONTACRE'
      'FROM'
      '  TIPORECEBDESEMB')
    Left = 431
    Top = 6
    object qryCODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      Origin = 'TIPORECEBDESEMB.CODTIPRECDES'
      Size = 15
    end
    object qryRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'TIPORECEBDESEMB.RECPAG'
      Size = 1
    end
    object qryIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'TIPORECEBDESEMB.IDPESSOA'
    end
    object qryPLACONTACREDITO: TStringField
      FieldName = 'PLACONTACREDITO'
      Origin = 'TIPORECEBDESEMB.PLACONTACREDITO'
      Size = 18
    end
    object qryPLANO: TFloatField
      FieldName = 'PLANO'
      Origin = 'TIPORECEBDESEMB.PLANO'
    end
    object qryPLACONTA: TStringField
      FieldName = 'PLACONTA'
      Origin = 'TIPORECEBDESEMB.PLACONTA'
      Size = 18
    end
    object qryIDUSUARIOINCLUSAO: TFloatField
      FieldName = 'IDUSUARIOINCLUSAO'
      Origin = 'TIPORECEBDESEMB.IDUSUARIOINCLUSAO'
    end
    object qryDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'TIPORECEBDESEMB.DESCRICAO'
      Size = 35
    end
    object qryANASINT: TStringField
      FieldName = 'ANASINT'
      Origin = 'TIPORECEBDESEMB.ANASINT'
      Size = 1
    end
    object qryFLGOBRIGARESERVA: TStringField
      FieldName = 'FLGOBRIGARESERVA'
      Origin = 'TIPORECEBDESEMB.CODTIPRECDES'
      Size = 1
    end
    object qryFLGCALCULAIMPOSTO: TStringField
      FieldName = 'FLGCALCULAIMPOSTO'
      Origin = '"CM.TIPOAGRE".FLGCHECATOTAL'
      Size = 1
    end
    object qryIDTIPOAVALIACAO: TFloatField
      FieldName = 'IDTIPOAVALIACAO'
      Origin = 'TIPORECEBDESEMB.IDTIPOAVALIACAO'
    end
    object qryFLGINDICARECDES: TStringField
      FieldName = 'FLGINDICARECDES'
      Size = 1
    end
    object qryHITCODHIST: TStringField
      FieldName = 'HITCODHIST'
      Size = 4
    end
    object qryCODCORRESP: TStringField
      FieldName = 'CODCORRESP'
      Origin = 'TIPORECEBDESEMB.CODCORRESP'
      Size = 30
    end
    object qryCODSUBCONTA: TFloatField
      FieldName = 'CODSUBCONTA'
      Origin = 'TIPORECEBDESEMB.CODSUBCONTA'
    end
    object qryCODSUBCONTACRE: TFloatField
      FieldName = 'CODSUBCONTACRE'
      Origin = 'TIPORECEBDESEMB.CODSUBCONTACRE'
    end
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update TIPORECEBDESEMB'
      'set'
      '  CODTIPRECDES = :CODTIPRECDES,'
      '  RECPAG = :RECPAG,'
      '  IDPESSOA = :IDPESSOA,'
      '  PLACONTACREDITO = :PLACONTACREDITO,'
      '  PLANO = :PLANO,'
      '  PLACONTA = :PLACONTA,'
      '  IDUSUARIOINCLUSAO = :IDUSUARIOINCLUSAO,'
      '  DESCRICAO = :DESCRICAO,'
      '  ANASINT = :ANASINT,'
      '  FLGOBRIGARESERVA = :FLGOBRIGARESERVA,'
      '  FLGCALCULAIMPOSTO = :FLGCALCULAIMPOSTO,'
      '  IDTIPOAVALIACAO = :IDTIPOAVALIACAO,'
      '  FLGINDICARECDES = :FLGINDICARECDES,'
      '  HITCODHIST = :HITCODHIST,'
      '  CODCORRESP = :CODCORRESP,'
      '  CODSUBCONTA = :CODSUBCONTA,'
      '  CODSUBCONTACRE = :CODSUBCONTACRE'
      'where'
      '  RTRIM(CODTIPRECDES) = :OLD_CODTIPRECDES and'
      '  RECPAG = :OLD_RECPAG and'
      '  IDPESSOA = :OLD_IDPESSOA')
    InsertSQL.Strings = (
      'insert into TIPORECEBDESEMB'
      
        '  (CODTIPRECDES, RECPAG, IDPESSOA, PLACONTACREDITO, PLANO, PLACO' +
        'NTA, IDUSUARIOINCLUSAO, '
      
        '   DESCRICAO, ANASINT, FLGOBRIGARESERVA, FLGCALCULAIMPOSTO, IDTI' +
        'POAVALIACAO, '
      
        '   FLGINDICARECDES, HITCODHIST, CODCORRESP, CODSUBCONTA, CODSUBC' +
        'ONTACRE)'
      'values'
      
        '  (:CODTIPRECDES, :RECPAG, :IDPESSOA, :PLACONTACREDITO, :PLANO, ' +
        ':PLACONTA, '
      
        '   :IDUSUARIOINCLUSAO, :DESCRICAO, :ANASINT, :FLGOBRIGARESERVA, ' +
        ':FLGCALCULAIMPOSTO, '
      
        '   :IDTIPOAVALIACAO, :FLGINDICARECDES, :HITCODHIST, :CODCORRESP,' +
        ' :CODSUBCONTA, '
      '   :CODSUBCONTACRE)')
    DeleteSQL.Strings = (
      'delete from TIPORECEBDESEMB'
      'where'
      '  RTRIM(CODTIPRECDES) = :OLD_CODTIPRECDES and'
      '  RECPAG = :OLD_RECPAG and'
      '  IDPESSOA = :OLD_IDPESSOA')
    Left = 385
    Top = 4
  end
  inherited MontaSelect: TMontaSelect
    Colunas.Strings = (
      'TIPORECEBDESEMB.CODTIPRECDES'
      'TIPORECEBDESEMB.DESCRICAO'
      'TIPORECEBDESEMB.RECPAG'
      'TIPORDCORRESP.CODCORRESP')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Código'
      'Descrição'
      'Rec\Pag'
      'Código Correspondente')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'TIPORECEBDESEMB'
      'TIPORDCORRESP')
    CamposChave.Strings = (
      'TIPORECEBDESEMB.CODTIPRECDES'
      'TIPORECEBDESEMB.RECPAG'
      'TIPORECEBDESEMB.IDPESSOA')
    Filtro.Strings = (
      'TIPORDCORRESP.CODTIPRECDES(+)=TIPORECEBDESEMB.CODTIPRECDES'
      'TIPORDCORRESP.RECPAG(+)=TIPORECEBDESEMB.RECPAG'
      'TIPORDCORRESP.IDPESSOA(+)=TIPORECEBDESEMB.IDPESSOA')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '15'
      '35'
      '1'
      '30')
    Left = 541
    Top = 4
  end
  inherited ds: TwwDataSource
    Left = 487
    Top = 3
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 348
    Top = 58
  end
  object QryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 248
    Top = 96
  end
  object QryTipoAvalia: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  IDTIPOAVALIACAO, DESCTIPOAVALIACAO'
      'FROM'
      ' TIPOAVALIACAO'
      'ORDER BY'
      ' DESCTIPOAVALIACAO')
    ValidateWithMask = True
    Left = 248
    Top = 144
    object QryTipoAvaliaDESCTIPOAVALIACAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 50
      FieldName = 'DESCTIPOAVALIACAO'
      Origin = 'TIPOAVALIACAO.DESCTIPOAVALIACAO'
      Size = 50
    end
    object QryTipoAvaliaIDTIPOAVALIACAO: TFloatField
      FieldName = 'IDTIPOAVALIACAO'
      Origin = 'TIPOAVALIACAO.IDTIPOAVALIACAO'
      Visible = False
    end
  end
  object QryHistorico: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  HITCODHIST, IDPESSOA, HITDESCR1'
      'FROM'
      '  HISTOPADRAO'
      'WHERE'
      '  IDPESSOA = :IDPESSOA'
      'ORDER BY'
      '  HITDESCR1')
    ValidateWithMask = True
    Left = 248
    Top = 192
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object QryHistoricoHITDESCR1: TStringField
      DisplayLabel = 'Histórico'
      DisplayWidth = 200
      FieldName = 'HITDESCR1'
      Origin = '"CM.HISTOPADRAO".HITDESCR1'
      Size = 200
    end
    object QryHistoricoHITCODHIST: TStringField
      DisplayWidth = 4
      FieldName = 'HITCODHIST'
      Origin = '"CM.HISTOPADRAO".HITCODHIST'
      Visible = False
      Size = 4
    end
    object QryHistoricoIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Origin = '"CM.HISTOPADRAO".IDPESSOA'
      Visible = False
    end
  end
  object qrySubConta: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      '')
    ValidateWithMask = True
    Left = 248
    Top = 240
    object qrySubContaNOMESUBCONTA: TStringField
      FieldName = 'NOMESUBCONTA'
      Origin = 'SUBCONTA.NOMESUBCONTA'
      Size = 60
    end
    object qrySubContaCODSUBCONTA: TFloatField
      FieldName = 'CODSUBCONTA'
      Origin = 'SUBCONTA.CODSUBCONTA'
    end
  end
  object qrySubContaCre: TwwQuery
    DatabaseName = 'BaseDados'
    DataSource = ds
    SQL.Strings = (
      'SELECT'
      '  NOMESUBCONTA,'
      '  CODSUBCONTA'
      'FROM'
      '  SUBCONTA'
      'ORDER BY NOMESUBCONTA')
    ValidateWithMask = True
    Left = 248
    Top = 288
    object qrySubContaCreNOMESUBCONTA: TStringField
      FieldName = 'NOMESUBCONTA'
      Origin = 'SUBCONTA.NOMESUBCONTA'
      Size = 60
    end
    object qrySubContaCreCODSUBCONTA: TFloatField
      FieldName = 'CODSUBCONTA'
      Origin = 'SUBCONTA.CODSUBCONTA'
    end
  end
  object QryTipoRdCorresp: TwwQuery
    Tag = 5
    CachedUpdates = True
    AfterInsert = QryTipoRdCorrespAfterInsert
    BeforeDelete = QryTipoRdCorrespBeforeDelete
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  IDTIPORDCORRESP, CODTIPRECDES, RECPAG, IDPESSOA, CODCORRESP'
      'FROM'
      '  TIPORDCORRESP'
      'WHERE'
      '  RTRIM(CODTIPRECDES) = :CODTIPRECDES AND'
      '  RECPAG = :RECPAG AND'
      '  IDPESSOA = :IDPESSOA')
    UpdateObject = UpdTipoRdCorresp
    ValidateWithMask = True
    Left = 131
    Top = 108
    ParamData = <
      item
        DataType = ftString
        Name = 'CODTIPRECDES'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'RECPAG'
        ParamType = ptUnknown
      end
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object QryTipoRdCorrespCODCORRESP: TStringField
      DisplayLabel = 'Código Correspondente'
      DisplayWidth = 36
      FieldName = 'CODCORRESP'
      Required = True
      Size = 30
    end
    object QryTipoRdCorrespIDTIPORDCORRESP: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPORDCORRESP'
      Visible = False
    end
    object QryTipoRdCorrespCODTIPRECDES: TStringField
      DisplayWidth = 15
      FieldName = 'CODTIPRECDES'
      Visible = False
      Size = 15
    end
    object QryTipoRdCorrespRECPAG: TStringField
      DisplayWidth = 1
      FieldName = 'RECPAG'
      Visible = False
      Size = 1
    end
    object QryTipoRdCorrespIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Visible = False
    end
  end
  object UpdTipoRdCorresp: TUpdateSQL
    ModifySQL.Strings = (
      'update TIPORDCORRESP'
      'set'
      '  CODTIPRECDES = :CODTIPRECDES,'
      '  RECPAG = :RECPAG,'
      '  IDPESSOA = :IDPESSOA,'
      '  CODCORRESP = :CODCORRESP'
      'where'
      '  IDTIPORDCORRESP = :OLD_IDTIPORDCORRESP')
    InsertSQL.Strings = (
      'insert into TIPORDCORRESP'
      '  (IDTIPORDCORRESP, CODTIPRECDES, RECPAG, IDPESSOA, CODCORRESP)'
      'values'
      
        '  (:IDTIPORDCORRESP, :CODTIPRECDES, :RECPAG, :IDPESSOA, :CODCORR' +
        'ESP)')
    DeleteSQL.Strings = (
      'delete from TIPORDCORRESP'
      'where'
      '  IDTIPORDCORRESP = :OLD_IDTIPORDCORRESP')
    Left = 131
    Top = 200
  end
  object DsTipoRdCorresp: TwwDataSource
    DataSet = QryTipoRdCorresp
    Left = 131
    Top = 154
  end
end
