inherited FrmRequisicao: TFrmRequisicao
  Left = 113
  Top = 57
  Caption = 'Requisição Manual'
  ClientHeight = 431
  ClientWidth = 615
  PixelsPerInch = 96
  TextHeight = 13
  object Label5: TLabel [0]
    Left = 170
    Top = 281
    Width = 25
    Height = 13
    Caption = 'Item'
  end
  inherited pnlFundo: TPanel
    Width = 615
    Height = 345
    inherited pnlMestre: TPanel
      Width = 605
      Height = 164
      Enabled = False
      object Label12: TLabel
        Left = 9
        Top = 6
        Width = 134
        Height = 13
        Caption = 'Almoxarifado de Origem'
      end
      object Label3: TLabel
        Left = 8
        Top = 104
        Width = 108
        Height = 13
        Caption = 'Atividade / Projeto'
      end
      object rgTipMov: TRadioGroup
        Left = 6
        Top = 30
        Width = 185
        Height = 67
        Caption = ' Tipo de Movimentação '
        Items.Strings = (
          'Transferência'
          'Custo'
          'Devolução de Custo')
        TabOrder = 0
        OnClick = rgTipMovClick
      end
      object grpAlmoxCC: TGroupBox
        Left = 197
        Top = 30
        Width = 259
        Height = 115
        Caption = ' Destino '
        TabOrder = 1
        object Label1: TLabel
          Left = 21
          Top = 16
          Width = 73
          Height = 13
          Caption = 'Almoxarifado'
        end
        object Label2: TLabel
          Left = 21
          Top = 66
          Width = 92
          Height = 13
          Caption = 'Centro de Custo'
        end
        object dblcAlmox: TwwDBLookupCombo
          Left = 21
          Top = 30
          Width = 217
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCALMOX'#9'40'#9'Nome'
            'CODALMOXARIFADO'#9'10'#9'Código')
          LookupTable = qryAlmox
          LookupField = 'CODALMOXARIFADO'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
          OnCloseUp = dblcAlmoxCloseUp
          OnExit = dblcAlmoxExit
        end
        object dblcCCust: TwwDBLookupCombo
          Left = 21
          Top = 80
          Width = 216
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'30'#9'Nome'
            'CODCENTROCUSTO'#9'10'#9'Códigfo')
          LookupTable = qryCCust
          LookupField = 'CODCENTROCUSTO'
          Options = [loTitles]
          Style = csDropDownList
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
          ShowMatchText = True
        end
      end
      object grpReq: TGroupBox
        Left = 462
        Top = 30
        Width = 135
        Height = 115
        Caption = ' Requisição '
        TabOrder = 2
        object Label13: TLabel
          Left = 9
          Top = 15
          Width = 28
          Height = 13
          Caption = 'Data'
        end
        object Label14: TLabel
          Left = 7
          Top = 64
          Width = 104
          Height = 13
          Caption = 'Nº  da Requisição'
        end
        object edDataReq: TCMDateTimePicker
          Left = 7
          Top = 30
          Width = 121
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          ButtonStyle = cbsCustom
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
          OnExit = edDataReqExit
        end
        object edNumReq: TRealEdit
          Left = 6
          Top = 81
          Width = 121
          Height = 21
          Alignment = taRightJustify
          Lines.Strings = (
            '      0,00')
          TabOrder = 1
          WordWrap = False
          IntDigits = 10
          DecDigits = 0
          NumberFormat = fNumber
          Signal = False
        end
      end
      object lbAlmox: TStaticText
        Left = 153
        Top = 5
        Width = 47
        Height = 17
        BorderStyle = sbsSunken
        Caption = 'lbAlmox'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlue
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 3
      end
      object dblcAtiv: TwwDBLookupCombo
        Left = 8
        Top = 120
        Width = 180
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOME'#9'25'#9'Descrição'
          'UNIDNEGOC'#9'10'#9'Código')
        LookupTable = qryUnidNegoc
        LookupField = 'UNIDNEGOC'
        Options = [loTitles]
        TabOrder = 4
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 156
      Width = 605
      Height = 184
      Align = alBottom
      Tabs.Strings = (
        'Itens da Requisição')
      inherited pgctrlDetalhe: TPageControl
        Width = 507
        Height = 125
        inherited tbsDet: TTabSheet
          Caption = 'Itens da Requisição'
          inherited dbgrdDet: TwwDBGrid
            Width = 499
            Height = 97
            Selected.Strings = (
              'CODARTIGO'#9'14'#9'Artigo'
              'DESCRICAO'#9'25'#9'Descrição'
              'QTDEMOV'#9'15'#9'Quantidade'
              'VALORMOV'#9'10'#9'Valor'
              'Un'#9'4'#9'Unidade~Medida'#9'F')
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            TitleAlignment = taCenter
            TitleLines = 2
          end
          inherited pnlControlesDet: TPanel
            Width = 499
            Height = 97
            object Label4: TLabel
              Left = 18
              Top = 9
              Width = 25
              Height = 13
              Caption = 'Item'
            end
            object Label6: TLabel
              Left = 116
              Top = 9
              Width = 104
              Height = 13
              Caption = 'Descrição do Item'
            end
            object Label7: TLabel
              Left = 384
              Top = 9
              Width = 32
              Height = 13
              Caption = 'Qtde.'
            end
            object Label8: TLabel
              Left = 323
              Top = 9
              Width = 31
              Height = 13
              Caption = 'Unid.'
            end
            object Label9: TLabel
              Left = 137
              Top = 57
              Width = 19
              Height = 13
              Caption = 'UN'
            end
            object Label10: TLabel
              Left = 18
              Top = 57
              Width = 103
              Height = 13
              Caption = 'Saldo em Estoque'
            end
            object Label11: TLabel
              Left = 195
              Top = 57
              Width = 79
              Height = 13
              Caption = 'Valor Baixado'
            end
            object edQtde: TRealEdit
              Left = 384
              Top = 24
              Width = 97
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '      0,00')
              TabOrder = 3
              WordWrap = False
              OnExit = edQtdeExit
              IntDigits = 10
              DecDigits = 4
              NumberFormat = fNumber
              Signal = False
            end
            object dblcUN: TwwDBLookupCombo
              Left = 322
              Top = 24
              Width = 57
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'CODMEDIDA'#9'4'#9'Código'
                'DESCMEDIDA'#9'25'#9'Descrição')
              LookupTable = qryUnidMed
              LookupField = 'CODMEDIDA'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 2
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
              OnExit = dblcUNExit
            end
            object DbUN: TDBEdit
              Left = 137
              Top = 72
              Width = 49
              Height = 21
              Color = clSilver
              DataField = 'CODMEDCUSTO'
              DataSource = dsSaldo
              ReadOnly = True
              TabOrder = 4
            end
            object dblcDesc: TwwDBLookupCombo
              Left = 116
              Top = 24
              Width = 199
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'50'#9'Descrição'
                'CODARTIGO'#9'14'#9'Código')
              LookupTable = qrySaldo
              LookupField = 'CODARTIGO'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
              OnCloseUp = dblcDescCloseUp
            end
            object dblcItem: TwwDBLookupCombo
              Left = 18
              Top = 24
              Width = 91
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'CODARTIGO'#9'14'#9'Código'
                'DESCRICAO'#9'50'#9'Descrição')
              LookupTable = qrySaldo
              LookupField = 'CODARTIGO'
              Options = [loTitles]
              Style = csDropDownList
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
              OnCloseUp = dblcItemCloseUp
            end
            object edValb: TRealEdit
              Left = 195
              Top = 72
              Width = 121
              Height = 21
              Alignment = taRightJustify
              Color = 14286847
              Lines.Strings = (
                '      0,00')
              ReadOnly = True
              TabOrder = 5
              WordWrap = False
              IntDigits = 10
              DecDigits = 5
              NumberFormat = fNumber
              Signal = False
            end
            object DbSaldoQtde: TRealEdit
              Left = 18
              Top = 72
              Width = 111
              Height = 21
              Alignment = taRightJustify
              Color = clSilver
              Lines.Strings = (
                '      0,00')
              ReadOnly = True
              TabOrder = 6
              WordWrap = False
              IntDigits = 10
              DecDigits = 5
              NumberFormat = fNumber
              Signal = False
            end
            object rgDest: TRadioGroup
              Left = 322
              Top = 46
              Width = 162
              Height = 48
              ItemIndex = 0
              Items.Strings = (
                'Insumo'
                'Ficha Técnica')
              TabOrder = 7
            end
          end
        end
      end
      inherited Dock973: TDock97
        Width = 597
      end
      inherited Dock974: TDock97
        Left = 511
        Height = 125
        inherited tb97Detalhe: TToolbar97
          inherited bbtnOkDet: TBitBtn
            ModalResult = 1
          end
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 615
    inherited Toolbar971: TToolbar97
      inherited sbtnAlterar: TToolbarButton97
        Enabled = False
        Visible = False
      end
      inherited sbtnProcurar: TToolbarButton97
        Enabled = False
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Enabled = False
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 392
    Width = 615
    inherited tb97Fundo: TToolbar97
      Left = 445
      DockPos = 553
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 278
      DockPos = 386
    end
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'Select  IdMov,'
      '            CodArtigo,'
      '            CodAlmoxarifado,'
      '            CodCentroCusto,'
      '            DataMov,'
      '            QtdeMov,'
      '            ValorMov'
      'From '
      '           Moviment'
      'Where'
      '          ( 1= 2 )')
    Left = 325
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 363
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 771
    Top = 11
  end
  inherited upd: TUpdateSQL
    Left = 289
  end
  inherited MontaSelect: TMontaSelect
    Left = 424
    Top = 5
  end
  inherited ds: TwwDataSource
    Left = 254
    Top = 9
  end
  inherited ImlPadrao: TImageList
    Left = 217
  end
  inherited CmeCadastro: TCmEventosCadastro
    Left = 358
    Top = 18
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 432
    Top = 108
  end
  object qryCombo: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 374
    Top = 198
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    OnCalcFields = qryDetCalcFields
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select  IdMov,'
      '            CodArtigo,'
      '            CodAlmoxarifado,'
      '            CodCentroCusto, '
      '            DataMov,'
      '            QtdeMov,'
      '            ValorMov,'
      
        '            ('#39'                                                  ' +
        '                       '#39') as Descricao, '
      '            ('#39'I'#39') as FLGDEST'
      'From Moviment'
      'Where IdMov = :pMov')
    UpdateObject = UpdDet
    ValidateWithMask = True
    Left = 492
    Top = 7
    ParamData = <
      item
        DataType = ftInteger
        Name = 'pMov'
        ParamType = ptUnknown
      end>
    object qryDetCODARTIGO: TStringField
      DisplayLabel = 'Artigo'
      DisplayWidth = 14
      FieldName = 'CODARTIGO'
      Size = 14
    end
    object qryDetDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 25
      FieldName = 'DESCRICAO'
      Size = 73
    end
    object qryDetQTDEMOV: TFloatField
      DisplayLabel = 'Quantidade'
      DisplayWidth = 15
      FieldName = 'QTDEMOV'
      DisplayFormat = '#.##0,00'
    end
    object qryDetVALORMOV: TFloatField
      DisplayLabel = 'Valor'
      DisplayWidth = 10
      FieldName = 'VALORMOV'
      DisplayFormat = '#.##0,00'
    end
    object qryDetUn: TStringField
      DisplayLabel = 'Unidade~Medida'
      DisplayWidth = 4
      FieldKind = fkCalculated
      FieldName = 'Un'
      Size = 4
      Calculated = True
    end
    object qryDetIDMOV: TFloatField
      FieldName = 'IDMOV'
      Visible = False
    end
    object qryDetCODALMOXARIFADO: TFloatField
      FieldName = 'CODALMOXARIFADO'
      Visible = False
    end
    object qryDetCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Visible = False
      Size = 10
    end
    object qryDetDATAMOV: TDateTimeField
      FieldName = 'DATAMOV'
      Visible = False
    end
    object qryDetFLGDEST: TStringField
      FieldName = 'FLGDEST'
      Visible = False
      Size = 1
    end
  end
  object qryUnidMed: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select   CodMedida,'
      '             DescMedida'
      'From   UnMedida'
      'Order By CodMedida ')
    ValidateWithMask = True
    Left = 555
    Top = 10
  end
  object qrySaldo: TwwQuery
    Tag = 5
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '       A.CODARTIGO,'
      '       P.CODMEDCUSTO,'
      
        '      (P.DESCPROD || '#39' '#39' || A.CODTAMANHO || '#39' '#39' || A.CODCOR) AS ' +
        'DESCRICAO'
      'FROM'
      '        ARTIGO A,'
      '       PRODUTO P'
      'WHERE'
      
        '       (((A.FLGBLOQUEADO <> '#39'R'#39') AND (A.FLGBLOQUEADO <> '#39'A'#39')) OR' +
        ' (A.FLGBLOQUEADO IS NULL))'
      '    AND (A.FLGATIVO = '#39'S'#39')'
      '    AND (A.CODPRODUTO = P.CODPRODUTO)'
      'ORDER BY DESCRICAO'
      ''
      ' ')
    ValidateWithMask = True
    Left = 560
    Top = 208
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select CodArtigo, SaldoQtde From Saldo')
    ValidateWithMask = True
    Left = 507
    Top = 210
    object qryAuxCODARTIGO: TStringField
      FieldName = 'CODARTIGO'
      Origin = 'SALDO.CODARTIGO'
      Size = 14
    end
    object qryAuxSALDOQTDE: TFloatField
      FieldName = 'SALDOQTDE'
      Origin = 'SALDO.SALDOQTDE'
      DisplayFormat = '00.000,00;0;_'
    end
  end
  object dsAux: TwwDataSource
    DataSet = qryAux
    Left = 467
    Top = 208
  end
  object dsSaldo: TwwDataSource
    DataSet = qrySaldo
    Left = 419
    Top = 211
  end
  object qryCustMed: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 334
    Top = 214
  end
  object qryAlmox: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'Select CodAlmoxarifado, '
      '           DescAlmox, '
      '           PRINCIPSECUND,'
      '           CodCentroCusto '
      'From Almox'
      'Order By DescAlmox')
    ValidateWithMask = True
    Left = 233
    Top = 216
  end
  object qryCCust: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT CODCENTROCUSTO,NOME'
      'FROM CENTCUST'
      'WHERE'
      '      (STATUSGRUPOCDC = '#39'A'#39')'
      '  AND (ATIVO ='#39'S'#39')'
      'ORDER BY 2')
    ValidateWithMask = True
    Left = 186
    Top = 216
  end
  object qryTransf: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 137
    Top = 219
  end
  object UpdDet: TUpdateSQL
    ModifySQL.Strings = (
      'update Moviment'
      'set'
      '  IDMOV = :IDMOV,'
      '  CODARTIGO = :CODARTIGO,'
      '  CODALMOXARIFADO = :CODALMOXARIFADO,'
      '  CODCENTROCUSTO = :CODCENTROCUSTO,'
      '  DATAMOV = :DATAMOV,'
      '  QTDEMOV = :QTDEMOV,'
      '  VALORMOV = :VALORMOV,'
      '  DESCRICAO = :DESCRICAO'
      'where'
      '  IDMOV = :OLD_IDMOV')
    InsertSQL.Strings = (
      'insert into Moviment'
      '  (IDMOV, CODARTIGO, CODALMOXARIFADO, CODCENTROCUSTO, DATAMOV, '
      'QTDEMOV, '
      '   VALORMOV, DESCRICAO)'
      'values'
      '  (:IDMOV, :CODARTIGO, :CODALMOXARIFADO, :CODCENTROCUSTO, '
      ':DATAMOV, :QTDEMOV, '
      '   :VALORMOV, :DESCRICAO)')
    DeleteSQL.Strings = (
      'delete from Moviment'
      'where'
      '  IDMOV = :OLD_IDMOV')
    Left = 413
    Top = 52
  end
  object qryFichaTec: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '            CODARTIGOSEC,'
      '            QTDE,'
      '            CODMEDIDA'
      'FROM'
      '           FICHTECN'
      'WHERE'
      '          (RTRIM(CODARTIGOPRINC) = :pCODART)')
    ValidateWithMask = True
    Left = 285
    Top = 204
    ParamData = <
      item
        DataType = ftString
        Name = 'pCODART'
        ParamType = ptUnknown
      end>
    object qryFichaTecCODARTIGOSEC: TStringField
      FieldName = 'CODARTIGOSEC'
      Size = 14
    end
    object qryFichaTecQTDE: TFloatField
      FieldName = 'QTDE'
    end
    object qryFichaTecCODMEDIDA: TStringField
      FieldName = 'CODMEDIDA'
      Size = 4
    end
  end
  object qryUnidNegoc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     UNIDNEGOC,'
      '     NOME'
      'FROM'
      '     UNIDNEGOCIO'
      'WHERE'
      '     (IDPESSOA = :IDPESSOA)'
      'ORDER BY 2')
    ValidateWithMask = True
    Left = 550
    Top = 141
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
  end
end
