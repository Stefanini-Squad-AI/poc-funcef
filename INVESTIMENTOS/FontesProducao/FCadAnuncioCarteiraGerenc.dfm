inherited FrmCadAnuncioCarteiraGerenc: TFrmCadAnuncioCarteiraGerenc
  Left = 0
  Top = 59
  HelpContext = 790319
  Caption = 'Operação'
  ClientHeight = 449
  ClientWidth = 786
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 786
    Height = 363
    inherited Bevel1: TBevel
      Width = 784
    end
    inherited pnlMestre: TPanel
      Width = 784
      Height = 92
      object Panel1: TPanel
        Left = 424
        Top = 3
        Width = 350
        Height = 89
        BevelInner = bvLowered
        TabOrder = 1
        object DbgGridInvest: TwwDBGrid
          Left = 2
          Top = 2
          Width = 346
          Height = 85
          Selected.Strings = (
            'DESCINVESTIMENTO'#9'33'#9'Ação'#9'F'
            'STATUS'#9'10'#9'Status')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          Color = clSilver
          DataSource = DsOperDireitoXinv
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clBlack
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          ParentFont = False
          TabOrder = 0
          TitleAlignment = taCenter
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clMaroon
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          OnDblClick = dbgrdDetDblClick
          IndicatorColor = icBlack
        end
      end
      object Panel2: TPanel
        Left = 1
        Top = 3
        Width = 423
        Height = 89
        BevelInner = bvLowered
        TabOrder = 0
        object Label2: TLabel
          Left = 7
          Top = 5
          Width = 47
          Height = 13
          Caption = 'Anúncio'
        end
        object Label5: TLabel
          Left = 7
          Top = 42
          Width = 44
          Height = 13
          Caption = 'Emissor'
          Enabled = False
        end
        object dblAnuncio: TwwDBLookupCombo
          Left = 7
          Top = 19
          Width = 403
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCTIPOOPERACAO'#9'18'#9'Operação'#9'F'
            'SIGLAEMISSOR'#9'12'#9'Empresa'#9'F'
            'NVL(DECODE(OPERACAODIREITO.QTDE'#9'13'#9'Valor a Receber'#9'F'
            'NVL(OPERACAODIREITO.QTDEACOESDI'#9'14'#9'Quantidade Fundos'#9'F'
            'DATACOM'#9'10'#9'Prevista'#9'F'
            'DATAAGE'#9'10'#9'AGE'#9'F'
            'DATAEX'#9'10'#9'Base'#9'F'
            'DECODE(OPERACAODIREITO.IDPEDIDO'#9'5'#9'Fdo'#9'F')
          LookupTable = QryAnuncio
          LookupField = 'IDOPERACAODIREITO'
          Options = [loColLines, loRowLines, loTitles]
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
          ShowMatchText = True
          OnCloseUp = dblAnuncioCloseUp
        end
        object edEmissor: TEdit
          Left = 7
          Top = 56
          Width = 322
          Height = 21
          Enabled = False
          TabOrder = 1
        end
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 136
      Width = 784
      Height = 226
      Tabs.Strings = (
        'Provisão')
      inherited Dock974: TDock97 [0]
        Left = 690
        Height = 167
      end
      inherited pgctrlDetalhe: TPageControl [1]
        Width = 686
        Height = 167
        inherited tbsDet: TTabSheet
          inherited dbgrdDet: TwwDBGrid
            Width = 678
            Height = 139
            Selected.Strings = (
              'DATAHISTPROVISAO'#9'20'#9'Data da Provisão'
              'DESCCARTGERENC'#9'57'#9'Carteira Gerencial'#9'F'
              'VLRHISTPROVISAO'#9'25'#9'Valor da Provisão')
            TitleAlignment = taCenter
            TitleFont.Color = clMaroon
          end
          inherited pnlControlesDet: TPanel
            Width = 678
            Height = 139
            object Label1: TLabel
              Left = 12
              Top = 6
              Width = 99
              Height = 13
              Caption = 'Data da Provisão'
            end
            object Label3: TLabel
              Left = 12
              Top = 49
              Width = 103
              Height = 13
              Caption = 'Carteira Gerencial'
            end
            object Label4: TLabel
              Left = 12
              Top = 92
              Width = 101
              Height = 13
              Caption = 'Valor da Provisão'
            end
            object dbdData: TCMDateTimePicker
              Left = 12
              Top = 22
              Width = 133
              Height = 21
              CalendarAttributes.Font.Charset = DEFAULT_CHARSET
              CalendarAttributes.Font.Color = clWindowText
              CalendarAttributes.Font.Height = -11
              CalendarAttributes.Font.Name = 'MS Sans Serif'
              CalendarAttributes.Font.Style = []
              ButtonStyle = cbsCustom
              DataField = 'DATAHISTPROVISAO'
              DataSource = dsDet
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
              TabOrder = 0
            end
            object DblCarteira: TwwDBLookupCombo
              Left = 12
              Top = 65
              Width = 397
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCCARTGERENC'#9'40'#9'Descrição'#9'F')
              DataField = 'IDCARTEIRAGERENC'
              DataSource = dsDet
              LookupTable = QryCarteira
              LookupField = 'IDCARTEIRAGERENC'
              Options = [loColLines, loRowLines, loTitles]
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = False
              ShowMatchText = True
            end
            object dbeValor: TDBRealEdit
              Left = 12
              Top = 108
              Width = 173
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 2
              WordWrap = False
              IntDigits = 18
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VLRHISTPROVISAO'
              DataSource = dsDet
            end
          end
        end
      end
      inherited Dock973: TDock97 [2]
        Width = 776
      end
    end
    inherited pnlTitulo: TPanel
      Width = 784
      inherited lbNomItem: TfcLabel
        Width = 530
        Caption = 'Provisão de Anúncio de AGE para Carteira Gerencial'
      end
    end
  end
  inherited Dock972: TDock97
    Width = 786
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnAlterar: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 410
    Width = 786
  end
  inherited MontaSelect: TMontaSelect
    Caption = ''
    Colunas.Strings = (
      'TIPOOPERACAO.DESCTIPOOPERACAO'
      'EMISSOR.SIGLAEMISSOR'
      'DECODE(OPERACAODIREITO.IDPEDIDOFUNDO, NULL,'#39' NÃO'#39','#39'SIM'#39')'
      
        'NVL(DECODE(OPERACAODIREITO.QTDEACOESDIRPROV, 0,(ROUND(((OPERACAO' +
        'DIREITO.QTDDIREITO-NVL(OPERACAODIREITO.QTDERECDIRPARC,0))*(NVL(O' +
        'PERACAODIREITO.DIVPORACAO,1)/ACOESXBOLSA.QTDELOTE))-0.0049,2)+NV' +
        'L(OPERACAOINVEST.VLRREMUNERACAO,0)), DECODE((NVL(OPERACAODIREITO' +
        '.QTDEACOESDIRPROV,0)-NVL(OPERACAODIREITO.QTDERECDIRPARC,0)),0, R' +
        'OUND((NVL(OPERACAODIREITO.QTDEACOESDIRPROV,0) * NVL(OPERACAODIRE' +
        'ITO.DIVPORACAO,0))-0.0049,2), ROUND(((NVL(OPERACAODIREITO.QTDEAC' +
        'OESDIRPROV,0)-NVL(OPERACAODIREITO.QTDERECDIRPARC,0))* NVL(OPERAC' +
        'AODIREITO.DIVPORACAO,1))-0.0049,2))),0)'
      'NVL(OPERACAODIREITO.QTDEACOESDIRPROV,0)'
      'OPERACAODIREITO.DATACOM'
      'OPERACAODIREITO.DATAOPER'
      'OPERACAODIREITO.DATAAGE'
      'OPERACAODIREITO.DATAEX'
      'OPERACAODIREITO.DIVPORACAO'
      'OPERACAODIREITO.PRZBOLSA'
      'OPERACAODIREITO.PRZEMPRESA'
      'OPERACAODIREITO.ATADECISAO'
      'OPERACAODIREITO.PERCENTUAL'
      'OPERACAODIREITO.PARIDADE'
      'OPERACAODIREITO.FORMAPAGREC'
      'OPERACAODIREITO.INIPAGTO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'N'
      'N'
      'D'
      'D'
      'D'
      'D'
      'N'
      'D'
      'D'
      'D'
      'N'
      'N'
      'C'
      'D')
    Descricao.Strings = (
      'Tipo de Operação'
      'Empresa'
      'Resg. Fdo'
      'Valor a Receber'
      'Quantidade Fundos'
      'Data Prevista'
      'Data Ex'
      'Data AGE'
      'Data Base'
      'Dividendos por Ação'
      'Prazo Bolsa'
      'Prazo Empresa'
      'Ata Decisão'
      'Percentual'
      'Paridade'
      'Forma de Pagamento/Recebimento'
      'Inicio Pagamento')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'OPERACAOINVEST'
      'EMISSOR'
      'PEDIDOFUNDO'
      'OPERACAODIREITO'
      'TIPOOPERACAO'
      'OPERDIREITOXINV'
      'ACOESXBOLSA')
    CamposChave.Strings = (
      'OPERACAODIREITO.IDOPERACAODIREITO')
    Filtro.Strings = (
      'OPERACAODIREITO.IDTIPOOPERACAO = TIPOOPERACAO.IDTIPOOPERACAO(+)'
      'OPERACAODIREITO.IDEMISSOR = EMISSOR.IDEMISSOR(+)'
      'PEDIDOFUNDO.IDPEDIDOFUNDO(+) = OPERACAODIREITO.IDPEDIDOFUNDO'
      
        'OPERACAOINVEST.IDOPERACAODIREITO(+) = OPERACAODIREITO.IDOPERACAO' +
        'DIREITO'
      
        'OPERDIREITOXINV.IDOPERACAODIREITO(+) = OPERACAODIREITO.IDOPERACA' +
        'ODIREITO'
      'ACOESXBOLSA.IDACAO(+) =OPERDIREITOXINV.IDINVESTIMENTO')
    Mascaras.Strings = (
      ''
      ''
      ''
      '###,###,###,###0.00'
      '###,###,###,###0'
      ''
      ''
      ''
      ''
      ',#0.0000000000'
      ''
      ''
      ''
      ',#0.00'
      ''
      ''
      '')
    Larguras.Strings = (
      '28'
      '18'
      '5'
      '18'
      '18'
      '10'
      '10'
      '10'
      '10'
      '15'
      '10'
      '10'
      '10'
      '15'
      '15'
      '20'
      '10')
    UsaDistinct = True
    Left = 507
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT * FROM DUAL')
  end
  inherited qryDetalhe: TwwQuery
    SQL.Strings = (
      'SELECT '
      '*'
      'FROM '
      '   HISTPROVISAO H, CARTEIRAINVEST CI, CARTEIRAGERENC CG '
      'WHERE '
      '   CI.IDCARTEIRAINVEST  = H.IDCARTEIRAINVEST   AND'
      '   CG.IDCARTEIRAINVEST  = CI.IDCARTEIRAINVEST  AND'
      '   CG.IDCARTEIRAGERENC  = H.IDCARTEIRAGERENC   AND'
      '    H.IDOPERACAODIREITO =  :IDOPERACAODIREITO'
      'ORDER BY DATAHISTPROVISAO')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptUnknown
      end>
    object qryDetalheDATAHISTPROVISAO: TDateTimeField
      DisplayLabel = 'Data da Provisão'
      DisplayWidth = 20
      FieldName = 'DATAHISTPROVISAO'
      Origin = 'HISTPROVISAO.DATAHISTPROVISAO'
    end
    object qryDetalheDESCCARTGERENC: TStringField
      DisplayLabel = 'Carteira Gerencial'
      DisplayWidth = 57
      FieldName = 'DESCCARTGERENC'
      Origin = 'HISTPROVISAO.VLRHISTPROVISAO'
      Size = 40
    end
    object qryDetalheVLRHISTPROVISAO: TFloatField
      DisplayLabel = 'Valor da Provisão'
      DisplayWidth = 25
      FieldName = 'VLRHISTPROVISAO'
      Origin = 'HISTPROVISAO.VLRHISTPROVISAO'
      DisplayFormat = '###,###,###0.00'
    end
    object qryDetalheIDHISTPROVISAO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDHISTPROVISAO'
      Origin = 'HISTPROVISAO.IDHISTPROVISAO'
      Visible = False
    end
    object qryDetalheIDOPERACAODIREITO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDOPERACAODIREITO'
      Origin = 'HISTPROVISAO.IDOPERACAODIREITO'
      Visible = False
    end
    object qryDetalheIDCARTEIRAGERENC: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAGERENC'
      Origin = 'HISTPROVISAO.IDCARTEIRAGERENC'
      Visible = False
    end
    object qryDetalheIDCARTEIRAINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAINVEST'
      Origin = 'HISTPROVISAO.IDCARTEIRAINVEST'
      Visible = False
    end
    object qryDetalheIDOPERACAOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDOPERACAOINVEST'
      Origin = 'HISTPROVISAO.IDOPERACAOINVEST'
      Visible = False
    end
    object qryDetalheIDPLANPREVCTBPATR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANPREVCTBPATR'
      Origin = 'HISTPROVISAO.IDPLANPREVCTBPATR'
      Visible = False
    end
    object qryDetalheIDCARTEIRAXEVENTO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAXEVENTO'
      Origin = 'HISTPROVISAO.IDCARTEIRAXEVENTO'
      Visible = False
    end
    object qryDetalheSLDHISTPROVISAO: TFloatField
      DisplayWidth = 10
      FieldName = 'SLDHISTPROVISAO'
      Origin = 'HISTPROVISAO.SLDHISTPROVISAO'
      Visible = False
    end
    object qryDetalheTRGDTINCLUSAO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'TRGDTINCLUSAO'
      Origin = 'HISTPROVISAO.TRGDTINCLUSAO'
      Visible = False
    end
    object qryDetalheTRGUSERINCLUSAO: TStringField
      DisplayWidth = 30
      FieldName = 'TRGUSERINCLUSAO'
      Origin = 'HISTPROVISAO.TRGUSERINCLUSAO'
      Visible = False
      Size = 30
    end
    object qryDetalheIDCARTEIRAINVEST_1: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAINVEST_1'
      Origin = 'HISTPROVISAO.VLRHISTPROVISAO'
      Visible = False
    end
    object qryDetalheDESCCARTINVEST: TStringField
      DisplayWidth = 60
      FieldName = 'DESCCARTINVEST'
      Origin = 'HISTPROVISAO.VLRHISTPROVISAO'
      Visible = False
      Size = 60
    end
    object qryDetalheIDGESTORCARTEIRA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDGESTORCARTEIRA'
      Origin = 'HISTPROVISAO.VLRHISTPROVISAO'
      Visible = False
    end
    object qryDetalheFLGCARTPROP: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGCARTPROP'
      Origin = 'HISTPROVISAO.VLRHISTPROVISAO'
      Visible = False
    end
    object qryDetalheFLGCALCDIARIO: TStringField
      DisplayWidth = 1
      FieldName = 'FLGCALCDIARIO'
      Origin = 'HISTPROVISAO.VLRHISTPROVISAO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryDetalheDATAINICIO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATAINICIO'
      Origin = 'HISTPROVISAO.VLRHISTPROVISAO'
      Visible = False
    end
    object qryDetalheFLGTRATALOTE: TStringField
      DisplayWidth = 1
      FieldName = 'FLGTRATALOTE'
      Origin = 'HISTPROVISAO.VLRHISTPROVISAO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryDetalheTRGDTINCLUSAO_1: TDateTimeField
      DisplayWidth = 18
      FieldName = 'TRGDTINCLUSAO_1'
      Origin = 'HISTPROVISAO.VLRHISTPROVISAO'
      Visible = False
    end
    object qryDetalheTRGUSERINCLUSAO_1: TStringField
      DisplayWidth = 30
      FieldName = 'TRGUSERINCLUSAO_1'
      Origin = 'HISTPROVISAO.VLRHISTPROVISAO'
      Visible = False
      Size = 30
    end
    object qryDetalheIDPLANOPREV: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANOPREV'
      Origin = 'HISTPROVISAO.VLRHISTPROVISAO'
      Visible = False
    end
    object qryDetalheIDPATROCINADORA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPATROCINADORA'
      Origin = 'HISTPROVISAO.VLRHISTPROVISAO'
      Visible = False
    end
    object qryDetalheIDTIPOINVEST: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOINVEST'
      Origin = 'HISTPROVISAO.VLRHISTPROVISAO'
      Visible = False
    end
    object qryDetalheIDMERCADO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDMERCADO'
      Origin = 'HISTPROVISAO.VLRHISTPROVISAO'
      Visible = False
    end
    object qryDetalheFLGORDMOVINV: TStringField
      DisplayWidth = 1
      FieldName = 'FLGORDMOVINV'
      Origin = 'HISTPROVISAO.VLRHISTPROVISAO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryDetalheDATAULTFECH: TDateTimeField
      DisplayWidth = 18
      FieldName = 'DATAULTFECH'
      Origin = 'HISTPROVISAO.VLRHISTPROVISAO'
      Visible = False
    end
    object qryDetalheIDDAIEACART: TFloatField
      DisplayWidth = 10
      FieldName = 'IDDAIEACART'
      Origin = 'HISTPROVISAO.VLRHISTPROVISAO'
      Visible = False
    end
    object qryDetalheFLGCARTLASTRO: TStringField
      DisplayWidth = 1
      FieldName = 'FLGCARTLASTRO'
      Origin = 'HISTPROVISAO.VLRHISTPROVISAO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryDetalheFLGCARTTERC: TStringField
      DisplayWidth = 1
      FieldName = 'FLGCARTTERC'
      Origin = 'HISTPROVISAO.VLRHISTPROVISAO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryDetalheIDCARTEIRAGERENC_1: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAGERENC_1'
      Origin = 'HISTPROVISAO.VLRHISTPROVISAO'
      Visible = False
    end
    object qryDetalheIDCARTEIRAINVEST_2: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCARTEIRAINVEST_2'
      Origin = 'HISTPROVISAO.VLRHISTPROVISAO'
      Visible = False
    end
    object qryDetalheTRGDTINCLUSAO_2: TDateTimeField
      DisplayWidth = 18
      FieldName = 'TRGDTINCLUSAO_2'
      Origin = 'HISTPROVISAO.VLRHISTPROVISAO'
      Visible = False
    end
    object qryDetalheTRGUSERINCLUSAO_2: TStringField
      DisplayWidth = 30
      FieldName = 'TRGUSERINCLUSAO_2'
      Origin = 'HISTPROVISAO.VLRHISTPROVISAO'
      Visible = False
      Size = 30
    end
  end
  inherited updDetalhe: TUpdateSQL
    ModifySQL.Strings = (
      'update HISTPROVISAO'
      'set'
      '  IDOPERACAODIREITO = :IDOPERACAODIREITO,'
      '  IDCARTEIRAGERENC = :IDCARTEIRAGERENC,'
      '  IDCARTEIRAINVEST = :IDCARTEIRAINVEST,'
      '  IDOPERACAOINVEST = :IDOPERACAOINVEST,'
      '  IDPLANPREVCTBPATR = :IDPLANPREVCTBPATR,'
      '  IDCARTEIRAXEVENTO = :IDCARTEIRAXEVENTO,'
      '  DATAHISTPROVISAO = :DATAHISTPROVISAO,'
      '  SLDHISTPROVISAO = :SLDHISTPROVISAO,'
      '  TRGDTINCLUSAO = :TRGDTINCLUSAO,'
      '  TRGUSERINCLUSAO = :TRGUSERINCLUSAO,'
      '  VLRHISTPROVISAO = :VLRHISTPROVISAO'
      'where'
      '  IDHISTPROVISAO = :OLD_IDHISTPROVISAO')
    InsertSQL.Strings = (
      'insert into HISTPROVISAO'
      '  (IDHISTPROVISAO, IDOPERACAODIREITO, IDCARTEIRAGERENC, '
      'IDCARTEIRAINVEST, '
      '   IDOPERACAOINVEST, IDPLANPREVCTBPATR, IDCARTEIRAXEVENTO, '
      'DATAHISTPROVISAO, '
      '   SLDHISTPROVISAO, TRGDTINCLUSAO, TRGUSERINCLUSAO, '
      'VLRHISTPROVISAO)'
      'values'
      '  (:IDHISTPROVISAO, :IDOPERACAODIREITO, :IDCARTEIRAGERENC, '
      ':IDCARTEIRAINVEST, '
      '   :IDOPERACAOINVEST, :IDPLANPREVCTBPATR, :IDCARTEIRAXEVENTO, '
      ':DATAHISTPROVISAO, '
      '   :SLDHISTPROVISAO, :TRGDTINCLUSAO, :TRGUSERINCLUSAO, '
      ':VLRHISTPROVISAO)')
    DeleteSQL.Strings = (
      'delete from HISTPROVISAO'
      'where'
      '  IDHISTPROVISAO = :OLD_IDHISTPROVISAO')
  end
  object QryAnuncio: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      'DISTINCT '
      '   TIPOOPERACAO.DESCTIPOOPERACAO,'
      '   EMISSOR.SIGLAEMISSOR,'
      '   DECODE(OPERACAODIREITO.IDPEDIDOFUNDO, NULL,'#39' NÃO'#39','#39'SIM'#39'),'
      
        '   NVL(DECODE(OPERACAODIREITO.QTDEACOESDIRPROV, 0,(ROUND(((OPERA' +
        'CAODIREITO.QTDDIREITO-NVL(OPERACAODIREITO.QTDERECDIRPARC,0))*(NV' +
        'L(OPERACAODIREITO.DIVPORACAO,1)/ACOESXBOLSA.QTDELOTE))-0.0049,2)' +
        '+NVL(OPERACAOINVEST.VLRREMUNERACAO,0)), DECODE((NVL(OPERACAODIRE' +
        'ITO.QTDEACOESDIRPROV,0)-NVL(OPERACAODIREITO.QTDERECDIRPARC,0)),0' +
        ', ROUND((NVL(OPERACAODIREITO.QTDEACOESDIRPROV,0) * NVL(OPERACAOD' +
        'IREITO.DIVPORACAO,0))-0.0049,2), ROUND(((NVL(OPERACAODIREITO.QTD' +
        'EACOESDIRPROV,0)-NVL(OPERACAODIREITO.QTDERECDIRPARC,0))* NVL(OPE' +
        'RACAODIREITO.DIVPORACAO,1))-0.0049,2))),0),'
      '   NVL(OPERACAODIREITO.QTDEACOESDIRPROV,0) ,'
      '   OPERACAODIREITO.DATACOM,'
      '   OPERACAODIREITO.DATAAGE ,'
      '   OPERACAODIREITO.DATAEX ,'
      '   OPERACAODIREITO.DIVPORACAO ,'
      '   OPERACAODIREITO.PRZBOLSA ,'
      '   OPERACAODIREITO.PRZEMPRESA ,'
      '   OPERACAODIREITO.ATADECISAO ,'
      '   OPERACAODIREITO.PERCENTUAL ,'
      '   OPERACAODIREITO.PARIDADE,'
      '   OPERACAODIREITO.FORMAPAGREC,'
      '   OPERACAODIREITO.INIPAGTO,'
      '   OPERACAODIREITO.IDOPERACAODIREITO,'
      '   OPERDIREITOXINV.IDINVESTIMENTO'
      'FROM'
      '   OPERACAOINVEST,'
      '   EMISSOR,'
      '   PEDIDOFUNDO,'
      '   OPERACAODIREITO,'
      '   TIPOOPERACAO,'
      '   OPERDIREITOXINV,'
      '   ACOESXBOLSA'
      'WHERE'
      
        '   ( OPERACAODIREITO.IDTIPOOPERACAO        = TIPOOPERACAO.IDTIPO' +
        'OPERACAO(+) )    AND'
      
        '   ( OPERACAODIREITO.IDEMISSOR             = EMISSOR.IDEMISSOR(+' +
        ') )              AND'
      
        '   ( PEDIDOFUNDO.IDPEDIDOFUNDO(+)          = OPERACAODIREITO.IDP' +
        'EDIDOFUNDO )     AND'
      
        '   ( OPERACAOINVEST.IDOPERACAODIREITO(+)   = OPERACAODIREITO.IDO' +
        'PERACAODIREITO ) AND'
      
        '   ( OPERDIREITOXINV.IDOPERACAODIREITO(+)  = OPERACAODIREITO.IDO' +
        'PERACAODIREITO ) AND'
      
        '   ( ACOESXBOLSA.IDACAO(+)                 = OPERDIREITOXINV.IDI' +
        'NVESTIMENTO )'
      'ORDER BY OPERACAODIREITO.DATACOM DESC,'
      '         TIPOOPERACAO.DESCTIPOOPERACAO,'
      '         EMISSOR.SIGLAEMISSOR'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 463
    Top = 227
  end
  object QryCarteira: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM CARTEIRAGERENC')
    ValidateWithMask = True
    Left = 543
    Top = 275
  end
  object QryDelHistProvisao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'DELETE FROM HISTPROVISAO WHERE IDOPERACAODIREITO =:IDOPERACAODIR' +
        'EITO')
    ValidateWithMask = True
    Left = 543
    Top = 219
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptUnknown
      end>
  end
  object MontaSelect1: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'TIPOOPERACAO.DESCTIPOOPERACAO'
      'EMISSOR.SIGLAEMISSOR'
      'DECODE(OPERACAODIREITO.IDPEDIDOFUNDO, NULL,'#39' NÃO'#39','#39'SIM'#39')'
      
        'NVL(DECODE(OPERACAODIREITO.QTDEACOESDIRPROV, 0,(ROUND(((OPERACAO' +
        'DIREITO.QTDDIREITO-NVL(OPERACAODIREITO.QTDERECDIRPARC,0))*(NVL(O' +
        'PERACAODIREITO.DIVPORACAO,1)/ACOESXBOLSA.QTDELOTE))-0.0049,2)+NV' +
        'L(OPERACAOINVEST.VLRREMUNERACAO,0)), DECODE((NVL(OPERACAODIREITO' +
        '.QTDEACOESDIRPROV,0)-NVL(OPERACAODIREITO.QTDERECDIRPARC,0)),0, R' +
        'OUND((NVL(OPERACAODIREITO.QTDEACOESDIRPROV,0) * NVL(OPERACAODIRE' +
        'ITO.DIVPORACAO,0))-0.0049,2), ROUND(((NVL(OPERACAODIREITO.QTDEAC' +
        'OESDIRPROV,0)-NVL(OPERACAODIREITO.QTDERECDIRPARC,0))* NVL(OPERAC' +
        'AODIREITO.DIVPORACAO,1))-0.0049,2))),0)'
      'NVL(OPERACAODIREITO.QTDEACOESDIRPROV,0)'
      'OPERACAODIREITO.DATACOM'
      'OPERACAODIREITO.DATAAGE'
      'OPERACAODIREITO.DATAEX'
      'OPERACAODIREITO.DIVPORACAO'
      'OPERACAODIREITO.PRZBOLSA'
      'OPERACAODIREITO.PRZEMPRESA'
      'OPERACAODIREITO.ATADECISAO'
      'OPERACAODIREITO.PERCENTUAL'
      'OPERACAODIREITO.PARIDADE'
      'OPERACAODIREITO.FORMAPAGREC'
      'OPERACAODIREITO.INIPAGTO ')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'N'
      'N'
      'D'
      'D'
      'D'
      'N'
      'D'
      'D'
      'D'
      'N'
      'N'
      'C'
      'D')
    Descricao.Strings = (
      'Tipo de Operação'
      'Empresa'
      'Resg. Fdo'
      'Valor a Receber'
      'Quantidade Fundos'
      'Data Prevista'
      'Data AGE'
      'Data Base'
      'Dividendos por Ação'
      'Prazo Bolsa'
      'Prazo Empresa'
      'Ata Decisão'
      'Percentual'
      'Paridade'
      'Forma de Pagamento/Recebimento'
      'Inicio Pagamento')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'OPERACAOINVEST'
      'EMISSOR'
      'PEDIDOFUNDO'
      'OPERACAODIREITO'
      'TIPOOPERACAO'
      'OPERDIREITOXINV'
      'ACOESXBOLSA')
    CamposChave.Strings = (
      'OPERACAODIREITO.IDOPERACAODIREITO'
      'OPERACAODIREITO.PLNCODIGO'
      'OPERACAODIREITO.CODDOCUMENTO')
    Filtro.Strings = (
      'OPERACAODIREITO.IDTIPOOPERACAO = TIPOOPERACAO.IDTIPOOPERACAO(+)'
      'OPERACAODIREITO.IDEMISSOR = EMISSOR.IDEMISSOR(+)'
      'PEDIDOFUNDO.IDPEDIDOFUNDO(+) = OPERACAODIREITO.IDPEDIDOFUNDO'
      
        'OPERACAOINVEST.IDOPERACAODIREITO(+) = OPERACAODIREITO.IDOPERACAO' +
        'DIREITO'
      
        'OPERDIREITOXINV.IDOPERACAODIREITO(+) = OPERACAODIREITO.IDOPERACA' +
        'ODIREITO'
      'ACOESXBOLSA.IDACAO(+) =OPERDIREITOXINV.IDINVESTIMENTO')
    Mascaras.Strings = (
      ''
      ''
      ''
      '###,###,###,###0.00'
      '###,###,###,###0'
      ''
      ''
      ''
      ',#0.0000000000'
      ''
      ''
      ''
      ',#0.00'
      ''
      ''
      '')
    Larguras.Strings = (
      '28'
      '18'
      '5'
      '18'
      '18'
      '10'
      '10'
      '10'
      '15'
      '10'
      '10'
      '10'
      '15'
      '15'
      '20'
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = True
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 591
    Top = 3
  end
  object QryOperDireitoXinv: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   DESCINVESTIMENTO,'
      '   IDOPERDIREITOXINV,'
      '   IDOPERACAODIREITO,'
      '   ORIGDEST,'
      '   PERCENTUALINV,'
      '   STATUS'
      'FROM'
      '   OPERDIREITOXINV, INVESTIMENTO,'
      '('
      'SELECT'
      '     '#39'Origem'#39' STATUS, '#39'O'#39'  IDORIGEM  from dual'
      'UNION'
      'SELECT'
      '     '#39'Destino'#39' STATUS, '#39'D'#39' IDORIGEM  from dual'
      ')  OPCAO'
      'WHERE'
      
        '   IDOPERACAODIREITO            =:IDOPERACAODIREITO             ' +
        '        AND'
      
        '   INVESTIMENTO.IDINVESTIMENTO  = OPERDIREITOXINV.IDINVESTIMENTO' +
        '        AND'
      '   OPCAO.IDORIGEM               = OPERDIREITOXINV.ORIGDEST'
      ''
      '')
    ControlType.Strings = (
      'ORIGDEST;CustomEdit;wwDBLookupCombo1')
    ValidateWithMask = True
    Left = 578
    Top = 145
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDOPERACAODIREITO'
        ParamType = ptResult
      end>
  end
  object DsOperDireitoXinv: TwwDataSource
    AutoEdit = False
    DataSet = QryOperDireitoXinv
    Left = 651
    Top = 145
  end
end
