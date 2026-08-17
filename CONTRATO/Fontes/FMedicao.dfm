inherited FrmMedicao: TFrmMedicao
  Left = 140
  Top = 160
  HelpContext = 120002
  Caption = 'Cadastro de Medição'
  ClientHeight = 458
  ClientWidth = 735
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 735
    Height = 372
    inherited pnlMestre: TPanel
      Width = 725
      Height = 151
      object Label5: TLabel
        Left = 16
        Top = 8
        Width = 49
        Height = 13
        Caption = 'Contrato'
      end
      object Label9: TLabel
        Left = 272
        Top = 8
        Width = 98
        Height = 13
        Caption = 'Num. Documento'
      end
      object Label4: TLabel
        Left = 456
        Top = 7
        Width = 80
        Height = 13
        Caption = 'Data Medição'
      end
      object Label10: TLabel
        Left = 390
        Top = 29
        Width = 7
        Height = 13
        Caption = '/'
      end
      object Label6: TLabel
        Left = 576
        Top = 8
        Width = 98
        Height = 13
        Caption = 'Data Vencimento'
      end
      object lblFormaPG: TLabel
        Left = 16
        Top = 49
        Width = 120
        Height = 13
        Caption = 'Forma de Pagamento'
      end
      object Label11: TLabel
        Left = 344
        Top = 49
        Width = 69
        Height = 13
        Caption = 'Observação'
      end
      object dblcContrato: TwwDBLookupCombo
        Left = 16
        Top = 24
        Width = 249
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'NOMECONTRATO'#9'20'#9'Nome'
          'IDCONTRATO'#9'1'#9'ID')
        DataField = 'IDCONTRATO'
        DataSource = ds
        LookupTable = qryContrato
        LookupField = 'IDCONTRATO'
        TabOrder = 0
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
        OnChange = dblcContratoChange
        OnCloseUp = dblcContratoCloseUp
      end
      object edDataVenc: TCMDateTimePicker
        Left = 576
        Top = 24
        Width = 113
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
        TabOrder = 4
        OnChange = edDataVencChange
      end
      object edCompl: TEdit
        Left = 400
        Top = 24
        Width = 49
        Height = 21
        MaxLength = 3
        TabOrder = 2
      end
      object edDataMEdicao: TCMDateTimePicker
        Left = 456
        Top = 24
        Width = 113
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
        TabOrder = 3
        OnChange = edDataMEdicaoChange
      end
      object dblcFormaPG: TwwDBLookupCombo
        Left = 16
        Top = 65
        Width = 316
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'30'#9'Descrição')
        LookupTable = qryFormaPG
        LookupField = 'CODFORMA'
        TabOrder = 5
        AutoDropDown = True
        ShowButton = True
        AllowClearKey = True
        ShowMatchText = True
      end
      object reNumDoc: TEdit
        Left = 272
        Top = 24
        Width = 113
        Height = 21
        TabOrder = 1
        OnKeyPress = reNumDocKeyPress
      end
      object MemoObservacao: TMemo
        Left = 344
        Top = 64
        Width = 345
        Height = 81
        ScrollBars = ssVertical
        TabOrder = 7
      end
      object GpConta: TGroupBox
        Left = 17
        Top = 91
        Width = 316
        Height = 56
        Caption = 'Conta Bancária '
        TabOrder = 6
        object Label14: TLabel
          Left = 10
          Top = 15
          Width = 37
          Height = 13
          Caption = 'Banco'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label15: TLabel
          Left = 118
          Top = 15
          Width = 19
          Height = 13
          Caption = 'Nº '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object Label18: TLabel
          Left = 58
          Top = 15
          Width = 47
          Height = 13
          Caption = 'Agência'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object BtnBuscaContaCor: TSpeedButton
          Left = 283
          Top = 26
          Width = 25
          Height = 25
          Hint = 'Altera Conta Bancária'
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            33033333333333333F7F3333333333333000333333333333F777333333333333
            000333333333333F777333333333333000333333333333F77733333333333300
            033333333FFF3F777333333700073B703333333F7773F77733333307777700B3
            33333377333777733333307F8F8F7033333337F333F337F3333377F8F9F8F773
            3333373337F3373F3333078F898F870333337F33F7FFF37F333307F99999F703
            33337F377777337F3333078F898F8703333373F337F33373333377F8F9F8F773
            333337F3373337F33333307F8F8F70333333373FF333F7333333330777770333
            333333773FF77333333333370007333333333333777333333333}
          NumGlyphs = 2
          OnClick = BtnBuscaContaCorClick
        end
        object edtBanco: TEdit
          Left = 9
          Top = 30
          Width = 42
          Height = 21
          TabOrder = 0
        end
        object edtAgencia: TEdit
          Left = 57
          Top = 30
          Width = 56
          Height = 21
          TabOrder = 1
        end
        object edtConta: TEdit
          Left = 119
          Top = 30
          Width = 160
          Height = 21
          TabOrder = 2
        end
        object edtDescTipoConta: TEdit
          Left = 144
          Top = 15
          Width = 100
          Height = 13
          BorderStyle = bsNone
          Color = clBtnFace
          TabOrder = 3
          Text = 'edtDescTipoConta'
        end
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 156
      Width = 725
      Height = 211
      Tabs.Strings = (
        'Itens de Medição'
        'Observação')
      detdbGrids.Strings = (
        'dbgrdDet'
        '')
      inherited pgctrlDetalhe: TPageControl
        Width = 627
        Height = 152
        inherited tbsDet: TTabSheet
          inherited dbgrdDet: TwwDBGrid
            Width = 619
            Height = 124
            Selected.Strings = (
              'NOME_ITEM'#9'50'#9'Item'#9'No'
              'NOMEOBJETO'#9'50'#9'Objeto'#9'No'
              'QTDEMEDICAO'#9'10'#9'Qtde.'#9'No'
              'VALORUNITARIOOBJETO'#9'10'#9'Valor Unitário'#9'No'
              'VALORMEDICAO'#9'10'#9'Valor Total'#9'No')
            Options = [dgTitles, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
          end
          inherited pnlControlesDet: TPanel
            Width = 619
            Height = 124
            object Label7: TLabel
              Left = 8
              Top = 3
              Width = 25
              Height = 13
              Caption = 'Item'
            end
            object Label8: TLabel
              Left = 320
              Top = 3
              Width = 38
              Height = 13
              Caption = 'Objeto'
            end
            object Label2: TLabel
              Left = 8
              Top = 81
              Width = 66
              Height = 13
              Caption = 'Quantidade'
            end
            object Label3: TLabel
              Left = 152
              Top = 81
              Width = 78
              Height = 13
              Caption = 'Valor Unitário'
            end
            object Label1: TLabel
              Left = 319
              Top = 81
              Width = 63
              Height = 13
              Caption = 'Valor Total'
            end
            object Label12: TLabel
              Left = 8
              Top = 42
              Width = 69
              Height = 13
              Caption = 'Observação'
            end
            object dblcItem: TwwDBLookupCombo
              Left = 8
              Top = 19
              Width = 281
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOME_ITEM'#9'30'#9'Item')
              DataField = 'IDITEM'
              DataSource = dsDet
              LookupTable = qryItem
              LookupField = 'IDITEM'
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
              OnCloseUp = dblcItemCloseUp
            end
            object dblcObjeto: TwwDBLookupCombo
              Left = 320
              Top = 19
              Width = 289
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMEOBJETO'#9'30'#9'Objeto')
              DataField = 'IDOBJETO'
              DataSource = dsDet
              LookupTable = qryObjeto
              LookupField = 'IDOBJETO'
              TabOrder = 1
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
              ShowMatchText = True
              OnCloseUp = dblcObjetoCloseUp
            end
            object dbQuantidade: TDBRealEdit
              Left = 8
              Top = 98
              Width = 129
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '      0,00')
              TabOrder = 3
              WordWrap = False
              OnExit = dbQuantidadeExit
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'QTDEMEDICAO'
              DataSource = dsDet
            end
            object reValor: TRealEdit
              Left = 552
              Top = 38
              Width = 57
              Height = 21
              Alignment = taRightJustify
              Color = clScrollBar
              Enabled = False
              Lines.Strings = (
                '      0,00')
              TabOrder = 4
              Visible = False
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
            end
            object dbValorTotal: TDBRealEdit
              Left = 320
              Top = 98
              Width = 137
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '      0,00')
              TabOrder = 5
              WordWrap = False
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VALORMEDICAO'
              DataSource = dsDet
            end
            object dbValorUnitario: TDBRealEdit
              Left = 152
              Top = 98
              Width = 137
              Height = 21
              TabStop = False
              Alignment = taRightJustify
              Color = clMenu
              Enabled = False
              Lines.Strings = (
                '      0,00')
              TabOrder = 6
              WordWrap = False
              OnExit = dbQuantidadeExit
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = False
              DataField = 'VALORUNITARIOOBJETO'
              DataSource = dsDet
            end
            object btnRateioDif: TButton
              Left = 480
              Top = 96
              Width = 129
              Height = 25
              Caption = 'Rateio Diferenciado'
              TabOrder = 7
              OnClick = btnRateioDifClick
            end
            object dbeObservacao: TwwDBEdit
              Left = 8
              Top = 58
              Width = 601
              Height = 21
              DataField = 'OBSERVACAO'
              DataSource = dsDet
              TabOrder = 2
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
          end
        end
        object tbsObsContrato: TTabSheet
          Caption = 'Observação do Contrato'
          ImageIndex = 1
          object DBObservacao: TDBMemo
            Left = 0
            Top = 0
            Width = 619
            Height = 124
            Align = alClient
            DataField = 'OBSERVACAO'
            DataSource = dsContr
            MaxLength = 500
            ReadOnly = True
            ScrollBars = ssVertical
            TabOrder = 0
          end
        end
      end
      inherited Dock973: TDock97
        Width = 717
      end
      inherited Dock974: TDock97
        Left = 631
        Height = 152
      end
    end
  end
  inherited Dock972: TDock97
    Width = 735
  end
  inherited Dock971: TDock97
    Top = 419
    Width = 735
    inherited tb97Fundo: TToolbar97
      Left = 190
      DockPos = 190
      inherited bbtnAjuda: TmaHelpBitBtn
        HelpContext = 120002
      end
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 360
      DockPos = 360
    end
  end
  inherited qry: TwwQuery
    Tag = 5
    SQL.Strings = (
      'SELECT'
      '      IDMEDICAO,'
      '      IDCONTRATO'
      'FROM'
      '      MEDICAO'
      'WHERE'
      '     ( IDMEDICAO = :IDMEDICAO)'
      '')
    Left = 248
    Top = 0
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDMEDICAO'
        ParamType = ptUnknown
      end>
    object qryIDMEDICAO: TFloatField
      FieldName = 'IDMEDICAO'
      Origin = 'MEDICAO.IDMEDICAO'
    end
    object qryIDCONTRATO: TFloatField
      FieldName = 'IDCONTRATO'
      Origin = 'MEDICAO.IDCONTRATO'
    end
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 384
    Top = 0
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 778
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update MEDICAO'
      'set'
      '  IDMEDICAO = :IDMEDICAO,'
      '  IDCONTRATO = :IDCONTRATO'
      'where'
      '  IDMEDICAO = :OLD_IDMEDICAO')
    InsertSQL.Strings = (
      'insert into MEDICAO'
      '  (IDMEDICAO, IDCONTRATO)'
      'values'
      '  (:IDMEDICAO, :IDCONTRATO)')
    DeleteSQL.Strings = (
      'delete from MEDICAO'
      'where'
      '  IDMEDICAO = :OLD_IDMEDICAO')
    Left = 312
    Top = 0
  end
  inherited MontaSelect: TMontaSelect
    Caption = ''
    Colunas.Strings = (
      'CONTRATOCONTR.NOMECONTRATO'
      'CONTRATOCONTR.CODCONTRATOEMPR'
      'MEDICAO.DATAMEDICAO'
      'ITEMCONTRATUAL.NOME_ITEM'
      'OBJETOCONTRATUAL.NOMEOBJETO'
      'DOCUMENTO.NODOCUMENTO')
    TipodeDado.Strings = (
      'C'
      'C'
      'D'
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Contrato'
      'Número do Processo'
      'Data Medição'
      'Item'
      'Serviço/Produto'
      'Nº do Documento')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CONTRATOCONTR'
      'MEDICAO'
      'PARCELAMEDICAO'
      'DOCUMENTO'
      'ITEMCONTRATUAL'
      'OBJETOCONTRATUAL')
    CamposChave.Strings = (
      'MEDICAO.IDMEDICAO'
      'CONTRATOCONTR.TIPOCONTRATO')
    Filtro.Strings = (
      'CONTRATOCONTR.IDCONTRATO    = MEDICAO.IDCONTRATO'
      'MEDICAO.IDMEDICAO           = PARCELAMEDICAO.IDMEDICAO'
      'PARCELAMEDICAO.CODDOCUMENTO = DOCUMENTO.CODDOCUMENTO'
      'MEDICAO.IDOBJETO            = OBJETOCONTRATUAL.IDOBJETO'
      'MEDICAO.IDITEM              = ITEMCONTRATUAL.IDITEM')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '20'
      '10'
      '200'
      '200'
      '10')
    Left = 680
    Top = 8
  end
  inherited ds: TwwDataSource
    Left = 280
    Top = 0
  end
  inherited ImlPadrao: TImageList
    Left = 600
    Top = 0
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    BeforeConfirma = CmeCadastroBeforeConfirma
    Left = 456
    Top = 0
  end
  inherited CmeDetalhe: TCmEventosCadastro
    Left = 512
    Top = 0
  end
  object qryDet: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      M.IDMEDICAO,'
      '      M.IDCONTRATO,'
      '      M.IDPROJETO,'
      '      M.IDATIVIDADE,'
      '      M.IDITEM,'
      '      M.IDOBJETO,'
      '      M.IDPESSOA,'
      '      M.DATAPREVMEDICAO,'
      '      M.DATAMEDICAO,'
      '      M.MEDICAOAPROVADA,'
      '      M.QTDEMEDICAO,'
      '      M.VALORMEDICAO,'
      '      M.QTDEPREVISTA,'
      '      M.VALORPREVISTO,'
      '      M.NUMPARCELAS,'
      '      M.FREQUENCIA,'
      '      M.INTERVALO,'
      '      M.OBSERVACAO,'
      '      I.NOME_ITEM,'
      '      O.NOMEOBJETO,'
      '      OI.VALORUNITARIOOBJETO'
      'FROM'
      '      MEDICAO M,'
      '      ITEMCONTRATUAL I,'
      '      OBJETOCONTRATUAL O,'
      '      OBJETOSXITEMCONTR OI,'
      '      PARCELAMEDICAO PM '
      'WHERE'
      '     (M.IDPESSOA   = :IDPESSOA)'
      '     AND (M.IDMEDICAO=PM.IDMEDICAO)'
      '     AND (M.IDITEM     = I.IDITEM)'
      '     AND (M.IDOBJETO   = O.IDOBJETO)'
      '     AND (M.IDITEM = OI.IDITEM) '
      '     AND (M.IDOBJETO = OI.IDOBJETO)'
      '     AND (M.IDCONTRATO = OI.IDCONTRATO)'
      '     AND (PM.CodDocumento=(Select PM1.CodDocumento'
      '                           From ParcelaMedicao PM1'
      
        '                           Where (PM1.CodDocumento=PM.CodDocumen' +
        'to) and'
      '                                 (PM1.IDMEDICAO=:IDMEDICAO)))'
      'ORDER BY  I.NOME_ITEM, O.NOMEOBJETO'
      ' ')
    UpdateObject = updDet
    ValidateWithMask = True
    Left = 352
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDMEDICAO'
        ParamType = ptUnknown
      end>
    object qryDetNOME_ITEM: TStringField
      DisplayLabel = 'Item'
      DisplayWidth = 50
      FieldName = 'NOME_ITEM'
      Size = 200
    end
    object qryDetNOMEOBJETO: TStringField
      DisplayLabel = 'Objeto'
      DisplayWidth = 50
      FieldName = 'NOMEOBJETO'
      Size = 200
    end
    object qryDetQTDEMEDICAO: TFloatField
      DisplayLabel = 'Qtde.'
      DisplayWidth = 10
      FieldName = 'QTDEMEDICAO'
    end
    object qryDetVALORUNITARIOOBJETO: TFloatField
      DisplayLabel = 'Valor Unitário'
      DisplayWidth = 10
      FieldName = 'VALORUNITARIOOBJETO'
    end
    object qryDetVALORMEDICAO: TFloatField
      DisplayLabel = 'Valor Total'
      DisplayWidth = 10
      FieldName = 'VALORMEDICAO'
    end
    object qryDetIDMEDICAO: TFloatField
      FieldName = 'IDMEDICAO'
      Visible = False
    end
    object qryDetIDPROJETO: TFloatField
      FieldName = 'IDPROJETO'
      Visible = False
    end
    object qryDetIDATIVIDADE: TFloatField
      FieldName = 'IDATIVIDADE'
      Visible = False
    end
    object qryDetIDCONTRATO: TFloatField
      FieldName = 'IDCONTRATO'
      Visible = False
    end
    object qryDetIDITEM: TFloatField
      FieldName = 'IDITEM'
      Visible = False
    end
    object qryDetIDOBJETO: TFloatField
      FieldName = 'IDOBJETO'
      Visible = False
    end
    object qryDetIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryDetDATAPREVMEDICAO: TDateTimeField
      FieldName = 'DATAPREVMEDICAO'
      Visible = False
    end
    object qryDetDATAMEDICAO: TDateTimeField
      FieldName = 'DATAMEDICAO'
      Visible = False
    end
    object qryDetMEDICAOAPROVADA: TStringField
      FieldName = 'MEDICAOAPROVADA'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryDetQTDEPREVISTA: TFloatField
      FieldName = 'QTDEPREVISTA'
      Visible = False
    end
    object qryDetVALORPREVISTO: TFloatField
      FieldName = 'VALORPREVISTO'
      Visible = False
    end
    object qryDetNUMPARCELAS: TFloatField
      FieldName = 'NUMPARCELAS'
      Visible = False
    end
    object qryDetFREQUENCIA: TStringField
      FieldName = 'FREQUENCIA'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object qryDetINTERVALO: TFloatField
      FieldName = 'INTERVALO'
      Visible = False
    end
    object qryDetOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Visible = False
      Size = 60
    end
  end
  object qryContrato: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   NOMECONTRATO,'
      '   IDCONTRATO,'
      '   IDPESSOA,'
      '   TIPOCONTRATO,'
      '   IDFORCLI,'
      '   OBSERVACAO'
      'FROM'
      '   CONTRATOCONTR'
      'WHERE'
      '   (IDPESSOA = :IDEMPRESA) AND'
      '   (FLGFIMCONTRATO = '#39'S'#39') AND'
      '   (IDCONTRATO IN(SELECT IDCONTRATO'
      '                  FROM CONTRATOUSUARIO'
      '                  WHERE IDUSUARIO =:IDUSUARIO))'
      'ORDER BY NOMECONTRATO'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 144
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDUSUARIO'
        ParamType = ptUnknown
      end>
    object qryContratoNOMECONTRATO: TStringField
      FieldName = 'NOMECONTRATO'
      Origin = 'CONTRATOCONTR.NOMECONTRATO'
      Size = 60
    end
    object qryContratoIDCONTRATO: TFloatField
      FieldName = 'IDCONTRATO'
      Origin = 'CONTRATOCONTR.IDCONTRATO'
    end
    object qryContratoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'CONTRATOCONTR.IDPESSOA'
    end
    object qryContratoTIPOCONTRATO: TStringField
      FieldName = 'TIPOCONTRATO'
      Origin = 'CONTRATOCONTR.TIPOCONTRATO'
      Size = 1
    end
    object qryContratoIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
    end
    object qryContratoOBSERVACAO: TMemoField
      FieldName = 'OBSERVACAO'
      BlobType = ftMemo
      Size = 500
    end
  end
  object updDet: TUpdateSQL
    ModifySQL.Strings = (
      'update MEDICAO'
      'set'
      '  IDMEDICAO = :IDMEDICAO,'
      '  IDCONTRATO = :IDCONTRATO,'
      '  IDPROJETO = :IDPROJETO,'
      '  IDATIVIDADE = :IDATIVIDADE,'
      '  IDITEM = :IDITEM,'
      '  IDOBJETO = :IDOBJETO,'
      '  IDPESSOA = :IDPESSOA,'
      '  DATAPREVMEDICAO = :DATAPREVMEDICAO,'
      '  DATAMEDICAO = :DATAMEDICAO,'
      '  MEDICAOAPROVADA = :MEDICAOAPROVADA,'
      '  QTDEMEDICAO = :QTDEMEDICAO,'
      '  VALORMEDICAO = :VALORMEDICAO,'
      '  QTDEPREVISTA = :QTDEPREVISTA,'
      '  VALORPREVISTO = :VALORPREVISTO,'
      '  NUMPARCELAS = :NUMPARCELAS,'
      '  FREQUENCIA = :FREQUENCIA,'
      '  INTERVALO = :INTERVALO,'
      '  OBSERVACAO = :OBSERVACAO'
      'where'
      '  IDMEDICAO = :OLD_IDMEDICAO')
    InsertSQL.Strings = (
      'insert into MEDICAO'
      
        '  (IDMEDICAO, IDCONTRATO, IDPROJETO, IDATIVIDADE, IDITEM, IDOBJE' +
        'TO, IDPESSOA, '
      
        '   DATAPREVMEDICAO, DATAMEDICAO, MEDICAOAPROVADA, QTDEMEDICAO, V' +
        'ALORMEDICAO, '
      
        '   QTDEPREVISTA, VALORPREVISTO, NUMPARCELAS, FREQUENCIA, INTERVA' +
        'LO, OBSERVACAO)'
      'values'
      
        '  (:IDMEDICAO, :IDCONTRATO, :IDPROJETO, :IDATIVIDADE, :IDITEM, :' +
        'IDOBJETO, '
      
        '   :IDPESSOA, :DATAPREVMEDICAO, :DATAMEDICAO, :MEDICAOAPROVADA, ' +
        ':QTDEMEDICAO, '
      
        '   :VALORMEDICAO, :QTDEPREVISTA, :VALORPREVISTO, :NUMPARCELAS, :' +
        'FREQUENCIA, '
      '   :INTERVALO, :OBSERVACAO)')
    DeleteSQL.Strings = (
      'delete from MEDICAO'
      'where'
      '  IDMEDICAO = :OLD_IDMEDICAO')
    Left = 416
  end
  object qryItem: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     I.IDITEM,I.IDPESSOA,'
      '     I.NOME_ITEM,'
      '     I.TIPOCOBRANCA'
      'FROM ITEMCONTRATUAL I, '
      '           OBJETOSXITEMCONTR O'
      'WHERE'
      '    (I.IDPESSOA = :IDEMPRESA) AND'
      '    (O.IDCONTRATO = :IDCONTRATO) AND'
      '    (I.TIPOCOBRANCA IN ('#39'PQ'#39','#39'PV'#39','#39'EQ'#39','#39'EV'#39')) AND'
      '    (I.IDITEM = O.IDITEM)'
      'ORDER BY NOME_ITEM'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 544
    Top = 272
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCONTRATO'
        ParamType = ptUnknown
      end>
    object qryItemIDITEM: TFloatField
      FieldName = 'IDITEM'
    end
    object qryItemIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryItemNOME_ITEM: TStringField
      FieldName = 'NOME_ITEM'
      Size = 200
    end
    object qryItemTIPOCOBRANCA: TStringField
      FieldName = 'TIPOCOBRANCA'
      Size = 2
    end
  end
  object qryObjeto: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   C.IDOBJETO,'
      '   C.IDPESSOA,'
      '   C.CODARTIGO,'
      '   C.NOMEOBJETO,'
      '   C.TIPOOBJETO'
      'FROM'
      '   OBJETOCONTRATUAL C,'
      '   OBJETOSXITEMCONTR O'
      'WHERE'
      '   (C.IDPESSOA   = :IDEMPRESA) AND'
      '   (O.IDCONTRATO = :IDCONTRATO) AND'
      '   (O.IDITEM     = :IDITEM) AND'
      '   (O.IDOBJETO   = C.IDOBJETO)'
      'ORDER BY NOMEOBJETO'
      ' ')
    ValidateWithMask = True
    Left = 544
    Top = 256
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDEMPRESA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDCONTRATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDITEM'
        ParamType = ptUnknown
      end>
    object qryObjetoIDOBJETO: TFloatField
      FieldName = 'IDOBJETO'
    end
    object qryObjetoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryObjetoCODARTIGO: TStringField
      FieldName = 'CODARTIGO'
      Size = 14
    end
    object qryObjetoNOMEOBJETO: TStringField
      FieldName = 'NOMEOBJETO'
      Size = 200
    end
    object qryObjetoTIPOOBJETO: TStringField
      FieldName = 'TIPOOBJETO'
      Size = 1
    end
  end
  object qryCalcValor: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     O.VALORUNITARIOOBJETO,'
      '     O.INTERVALO,'
      '     O.FREQUENCIA,'
      '     O.NUMPARCELAS,'
      '     O.DATAINICIOCOBR'
      'FROM'
      '     OBJETOSXITEMCONTR O'
      'WHERE'
      '     (O.IDCONTRATO = :IDCONTRATO)'
      ' AND (O.IDOBJETO = :IDOBJETO)'
      ' AND (O.IDITEM = :IDITEM)')
    ValidateWithMask = True
    Left = 384
    Top = 272
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCONTRATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOBJETO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDITEM'
        ParamType = ptUnknown
      end>
    object qryCalcValorVALORUNITARIOOBJETO: TFloatField
      FieldName = 'VALORUNITARIOOBJETO'
      Origin = '"CM.OBJETOSXITEMCONTR".VALORUNITARIOOBJETO'
    end
    object qryCalcValorINTERVALO: TFloatField
      FieldName = 'INTERVALO'
      Origin = '"CM.OBJETOSXITEMCONTR".INTERVALO'
    end
    object qryCalcValorFREQUENCIA: TStringField
      FieldName = 'FREQUENCIA'
      Origin = '"CM.OBJETOSXITEMCONTR".FREQUENCIA'
      Size = 1
    end
    object qryCalcValorNUMPARCELAS: TFloatField
      FieldName = 'NUMPARCELAS'
      Origin = '"CM.OBJETOSXITEMCONTR".NUMPARCELAS'
    end
    object qryCalcValorDATAINICIOCOBR: TDateTimeField
      FieldName = 'DATAINICIOCOBR'
      Origin = '"CM.OBJETOSXITEMCONTR".DATAINICIOCOBR'
    end
  end
  object qryDadosContrato: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   C.IDCONTRATO,     '
      '   C.CODCONTRATOEMPR,'
      '   C.CODCENTRORESPON,'
      
        '   DECODE(O.UNIDNEGOC,null,C.UNIDNEGOC,O.UNIDNEGOC) AS UNIDNEGOC' +
        ', '
      '   C.TIPOCONTRATO,'
      '   C.CODPORTFORMA,'
      '   C.IDFORCLI,'
      '   C.CODTIPDOC,'
      '   O.MOECODIGO,'
      '   O.DATAINICIOCOBR,'
      '   O.OBSERVACAO,'
      '   O.IDITEM,'
      '   O.IDOBJETO,'
      '   OI.CODTIPRECDES,'
      '   OI.RECPAG,'
      '   OI.CODSUBCONTA,'
      '   OI.PLACONTA,'
      '   O.IDPATRO,'
      '   O.IDPLANOPREV,'
      '   O.IDPROGRAMA'
      'FROM'
      '   CONTRATOCONTR C,'
      '   OBJETOSXITEMCONTR O,'
      '   OBJETOXITEM OI'
      'WHERE'
      '     (O.IDCONTRATO = :IDCONTRATO)'
      ' AND (O.IDOBJETO = :IDOBJETO)'
      ' AND (O.IDITEM = :IDITEM)'
      ' AND (C.IDCONTRATO = O.IDCONTRATO)'
      ' AND (O.IDOBJETO = OI.IDOBJETO)'
      ' AND (O.IDITEM = OI.IDITEM)'
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 664
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCONTRATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDOBJETO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDITEM'
        ParamType = ptUnknown
      end>
    object qryDadosContratoCODCENTRORESPON: TStringField
      FieldName = 'CODCENTRORESPON'
      Origin = '"CM.CONTRATOCONTR".CODCENTRORESPON'
      Size = 10
    end
    object qryDadosContratoUNIDNEGOC: TFloatField
      FieldName = 'UNIDNEGOC'
      Origin = '"CM.CONTRATOCONTR".UNIDNEGOC'
    end
    object qryDadosContratoTIPOCONTRATO: TStringField
      FieldName = 'TIPOCONTRATO'
      Origin = '"CM.CONTRATOCONTR".TIPOCONTRATO'
      Size = 1
    end
    object qryDadosContratoCODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
      Origin = '"CM.CONTRATOCONTR".CODPORTFORMA'
    end
    object qryDadosContratoIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = '"CM.CONTRATOCONTR".IDFORCLI'
    end
    object qryDadosContratoCODTIPDOC: TFloatField
      FieldName = 'CODTIPDOC'
      Origin = '"CM.CONTRATOCONTR".CODTIPDOC'
    end
    object qryDadosContratoMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
      Origin = '"CM.OBJETOSXITEMCONTR".MOECODIGO'
    end
    object qryDadosContratoDATAINICIOCOBR: TDateTimeField
      FieldName = 'DATAINICIOCOBR'
      Origin = '"CM.OBJETOSXITEMCONTR".DATAINICIOCOBR'
    end
    object qryDadosContratoCODTIPRECDES: TStringField
      FieldName = 'CODTIPRECDES'
      Origin = 'OBJETOXITEM.CODTIPRECDES'
      Size = 15
    end
    object qryDadosContratoRECPAG: TStringField
      FieldName = 'RECPAG'
      Origin = 'OBJETOXITEM.RECPAG'
      Size = 1
    end
    object qryDadosContratoCODSUBCONTA: TFloatField
      FieldName = 'CODSUBCONTA'
      Origin = 'OBJETOXITEM.CODSUBCONTA'
    end
    object qryDadosContratoPLACONTA: TStringField
      FieldName = 'PLACONTA'
      Origin = 'OBJETOXITEM.PLACONTA'
      Size = 18
    end
    object qryDadosContratoOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Size = 250
    end
    object qryDadosContratoCODCONTRATOEMPR: TStringField
      FieldName = 'CODCONTRATOEMPR'
    end
    object qryDadosContratoIDCONTRATO: TFloatField
      FieldName = 'IDCONTRATO'
    end
    object qryDadosContratoIDITEM: TFloatField
      FieldName = 'IDITEM'
    end
    object qryDadosContratoIDOBJETO: TFloatField
      FieldName = 'IDOBJETO'
    end
    object qryDadosContratoIDPATRO: TFloatField
      FieldName = 'IDPATRO'
      Origin = 'OBJETOSXITEMCONTR.IDPATRO'
    end
    object qryDadosContratoIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'OBJETOSXITEMCONTR.IDPLANOPREV'
    end
    object qryDadosContratoIDPROGRAMA: TFloatField
      FieldName = 'IDPROGRAMA'
      Origin = 'OBJETOSXITEMCONTR.IDPROGRAMA'
    end
  end
  object qryDadosCli: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT E.CODSUBCONTA,E.CONTACCLIENTE,'
      '       E.CODCENTROCUSTO,P.RAZAOSOCIAL'
      'FROM PESSOA P, EMPRESACLIENTE E'
      'WHERE (E.IDFORCLI = :IDFORCLI) AND'
      '      (E.IDPESSOA = :IDPESSOA) AND'
      '      (P.IDPESSOA = E.IDFORCLI)'
      ' ')
    ValidateWithMask = True
    Left = 576
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFORCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryDadosCliCODSUBCONTA: TFloatField
      FieldName = 'CODSUBCONTA'
      Origin = 'EMPRESACLIENTE.CODSUBCONTA'
    end
    object qryDadosCliCONTACCLIENTE: TStringField
      FieldName = 'CONTACCLIENTE'
      Origin = 'EMPRESACLIENTE.CONTACCLIENTE'
      Size = 18
    end
    object qryDadosCliCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Origin = 'EMPRESACLIENTE.CODCENTROCUSTO'
      Size = 10
    end
    object qryDadosCliRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Origin = '"CM.PESSOA".RAZAOSOCIAL'
      Size = 60
    end
  end
  object qryRateioCC: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    FilterOptions = [foCaseInsensitive]
    SQL.Strings = (
      'SELECT'
      '     R.CODCENTROCUSTO,'
      '     R.IDEMPRESA,'
      '     R.PERCRATEIOCONTR,'
      '     100 AS DIVISOR,'
      '     R.IDITEM,'
      '     R.IDOBJETO,'
      '     R.IDPROGRAMA'
      'FROM RATEIOCENTROCUSTO R'
      'WHERE'
      '     (R.IDCONTRATO = :IDCONTRATO)'
      '')
    UpdateObject = upRateioCC
    ValidateWithMask = True
    Left = 248
    Top = 256
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCONTRATO'
        ParamType = ptUnknown
      end>
    object qryRateioCCCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Origin = '"CM.RATEIOCENTROCUSTO".CODCENTROCUSTO'
      Size = 10
    end
    object qryRateioCCIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
      Origin = '"CM.RATEIOCENTROCUSTO".IDEMPRESA'
    end
    object qryRateioCCPERCRATEIOCONTR: TFloatField
      FieldName = 'PERCRATEIOCONTR'
      Origin = '"CM.RATEIOCENTROCUSTO".PERCRATEIOCONTR'
    end
    object qryRateioCCDIVISOR: TFloatField
      FieldName = 'DIVISOR'
    end
    object qryRateioCCIDITEM: TFloatField
      FieldName = 'IDITEM'
    end
    object qryRateioCCIDOBJETO: TFloatField
      FieldName = 'IDOBJETO'
    end
    object qryRateioCCIDPROGRAMA: TFloatField
      FieldName = 'IDPROGRAMA'
    end
  end
  object qryDadosFor: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT E.CODSUBCONTA,E.CONTACFORN, '
      '       E.CODCENTROCUSTO,P.RAZAOSOCIAL'
      'FROM PESSOA P, EMPRESAFORN E'
      'WHERE (E.IDFORCLI = :IDFORCLI) AND'
      '      (E.IDPESSOA = :IDPESSOA) AND'
      '      (P.IDPESSOA = E.IDFORCLI)')
    ValidateWithMask = True
    Left = 496
    Top = 56
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDFORCLI'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryDadosForCODSUBCONTA: TFloatField
      FieldName = 'CODSUBCONTA'
      Origin = 'EMPRESAFORN.CODSUBCONTA'
    end
    object qryDadosForCONTACFORN: TStringField
      FieldName = 'CONTACFORN'
      Origin = 'EMPRESAFORN.CONTACFORN'
      Size = 18
    end
    object qryDadosForCODCENTROCUSTO: TStringField
      FieldName = 'CODCENTROCUSTO'
      Origin = 'EMPRESAFORN.CODCENTROCUSTO'
      Size = 10
    end
    object qryDadosForRAZAOSOCIAL: TStringField
      FieldName = 'RAZAOSOCIAL'
      Origin = '"CM.PESSOA".RAZAOSOCIAL'
      Size = 60
    end
  end
  object qryAuxFuncao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      ''
      ' ')
    ValidateWithMask = True
    Left = 192
    Top = 104
  end
  object qryParc: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      P.IDMEDICAO,'
      '      P.IDPARCELAMEDICAO,'
      '      P.DATAPREVISTAVENC,'
      '      P.IDPESSOA,'
      '      P.VALORPREVISTO,'
      '      P.CODDOCUMENTO,'
      '      D.NODOCUMENTO,'
      '      D.COMPLDOCUMENTO,'
      '      D.CODFORMA,'
      '      D.OBS,'
      '      D.IDCBANCARIA,'
      '      B.NUMBANCO,'
      '      A.NUMAGENCIA,'
      '      C.CONTACORRENTE,'
      '      C.TIPOCONTA,'
      
        '      DECODE(C.TIPOCONTA,'#39'1'#39','#39'Conta Corrente'#39',DECODE(C.TIPOCONTA' +
        ','#39'2'#39','#39'Cartão Salário'#39','
      
        '             DECODE(C.TIPOCONTA,'#39'3'#39','#39'Conta Poupança'#39','#39#39'))) AS DE' +
        'SCTIPOCONTA'
      'FROM'
      '      PARCELAMEDICAO P,'
      '      DOCUMENTO D,'
      '      BANCO B,'
      '      AGENCIABANCARIA A,'
      '      CONTABANCARIA C'
      'WHERE'
      '      (IDMEDICAO = :IDMEDICAO)'
      '  AND (P.CODDOCUMENTO = D.CODDOCUMENTO(+))'
      '  AND (D.IDCBANCARIA = C.IDCBANCARIA(+))'
      '  AND (C.IDAGENCIA = A.IDPESSOA(+))'
      '  AND (A.IDBANCO = B.IDPESSOA(+))'
      '')
    UpdateObject = updParc
    ValidateWithMask = True
    Left = 376
    Top = 120
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDMEDICAO'
        ParamType = ptUnknown
      end>
    object qryParcIDMEDICAO: TFloatField
      FieldName = 'IDMEDICAO'
    end
    object qryParcIDPARCELAMEDICAO: TFloatField
      FieldName = 'IDPARCELAMEDICAO'
    end
    object qryParcDATAPREVISTAVENC: TDateTimeField
      FieldName = 'DATAPREVISTAVENC'
    end
    object qryParcIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryParcVALORPREVISTO: TFloatField
      FieldName = 'VALORPREVISTO'
    end
    object qryParcCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object qryParcNODOCUMENTO: TFloatField
      FieldName = 'NODOCUMENTO'
    end
    object qryParcCOMPLDOCUMENTO: TStringField
      FieldName = 'COMPLDOCUMENTO'
      FixedChar = True
      Size = 3
    end
    object qryParcCODFORMA: TFloatField
      FieldName = 'CODFORMA'
    end
    object qryParcOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1000
    end
    object qryParcIDCBANCARIA: TFloatField
      FieldName = 'IDCBANCARIA'
    end
    object qryParcNUMBANCO: TStringField
      FieldName = 'NUMBANCO'
      Size = 10
    end
    object qryParcNUMAGENCIA: TStringField
      FieldName = 'NUMAGENCIA'
      FixedChar = True
      Size = 15
    end
    object qryParcCONTACORRENTE: TStringField
      FieldName = 'CONTACORRENTE'
      Size = 15
    end
    object qryParcTIPOCONTA: TStringField
      FieldName = 'TIPOCONTA'
      FixedChar = True
      Size = 1
    end
    object qryParcDESCTIPOCONTA: TStringField
      FieldName = 'DESCTIPOCONTA'
      Size = 14
    end
  end
  object updParc: TUpdateSQL
    ModifySQL.Strings = (
      'insert into PARCELAMEDICAO'
      '  (IDMEDICAO, IDPARCELAMEDICAO, DATAPREVISTAVENC, IDPESSOA, '
      'VALORPREVISTO, '
      '   CODDOCUMENTO)'
      'values'
      '  (:IDMEDICAO, :IDPARCELAMEDICAO, :DATAPREVISTAVENC, :IDPESSOA, '
      ':VALORPREVISTO, '
      '   :CODDOCUMENTO)')
    InsertSQL.Strings = (
      'insert into PARCELAMEDICAO'
      '  (IDMEDICAO, IDPARCELAMEDICAO, DATAPREVISTAVENC, IDPESSOA, '
      'VALORPREVISTO, '
      '   CODDOCUMENTO)'
      'values'
      '  (:IDMEDICAO, :IDPARCELAMEDICAO, :DATAPREVISTAVENC, :IDPESSOA, '
      ':VALORPREVISTO, '
      '   :CODDOCUMENTO)')
    DeleteSQL.Strings = (
      'delete from PARCELAMEDICAO'
      'where'
      '  IDPARCELAMEDICAO = :OLD_IDPARCELAMEDICAO')
    Left = 432
    Top = 120
  end
  object qryFormaPG: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '     CODFORMA,'
      '     DESCRICAO'
      'FROM'
      '    FORMARECPAG'
      'WHERE'
      '    ( IDPESSOA = :IDPESSOA)'
      ' AND( RECPAG   = :RECPAG)'
      'ORDER BY DESCRICAO'
      ''
      '')
    ValidateWithMask = True
    Left = 224
    Top = 152
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'RECPAG'
        ParamType = ptUnknown
      end>
    object qryFormaPGDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 30
      FieldName = 'DESCRICAO'
      Origin = 'FORMARECPAG.DESCRICAO'
      Size = 30
    end
    object qryFormaPGCODFORMA: TFloatField
      DisplayWidth = 10
      FieldName = 'CODFORMA'
      Origin = 'FORMARECPAG.CODFORMA'
      Visible = False
    end
  end
  object qryAuxMedicao: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT MAX(P.DATAPREVISTAVENC) AS MAXDATAPREV'
      'FROM MEDICAO M, PARCELAMEDICAO P'
      'WHERE IDCONTRATO=:IDCONTRATO'
      'AND M.IDMEDICAO=P.IDMEDICAO')
    ValidateWithMask = True
    Left = 480
    Top = 240
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCONTRATO'
        ParamType = ptUnknown
      end>
    object qryAuxMedicaoMAXDATAPREV: TDateTimeField
      FieldName = 'MAXDATAPREV'
      Origin = '"CM.PARCELAMEDICAO".DATAPREVISTAVENC'
    end
  end
  object MSMedicao: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'CONTRATOCONTR.NOMECONTRATO'
      'ITEMCONTRATUAL.NOME_ITEM'
      'OBJETOCONTRATUAL.NOMEOBJETO'
      'MEDICAO.DATAMEDICAO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'D')
    Descricao.Strings = (
      'Nome do Contrato'
      'Nome do Item'
      'Nome do Serviço/Produto'
      'Data da Medição')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CONTRATOCONTR'
      'MEDICAO'
      'PARCELAMEDICAO'
      'ITEMCONTRATUAL'
      'OBJETOCONTRATUAL')
    CamposChave.Strings = (
      'MEDICAO.IDMEDICAO'
      'CONTRATOCONTR.TIPOCONTRATO')
    Filtro.Strings = (
      'CONTRATOCONTR.IDCONTRATO    = MEDICAO.IDCONTRATO'
      'MEDICAO.IDMEDICAO = PARCELAMEDICAO.IDMEDICAO'
      'MEDICAO.IDOBJETO  = OBJETOCONTRATUAL.IDOBJETO'
      'MEDICAO.IDITEM = ITEMCONTRATUAL.IDITEM')
    Mascaras.Strings = (
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '200'
      '200'
      '18')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 624
  end
  object qryMestreAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      IDMEDICAO,'
      '      IDCONTRATO'
      'FROM'
      '      MEDICAO'
      'WHERE'
      '     ( IDMEDICAO = :IDMEDICAO)'
      ''
      '')
    ValidateWithMask = True
    Left = 664
    Top = 168
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDMEDICAO'
        ParamType = ptUnknown
      end>
    object qryMestreAuxIDMEDICAO: TFloatField
      FieldName = 'IDMEDICAO'
      Origin = 'MEDICAO.IDMEDICAO'
    end
    object qryMestreAuxIDCONTRATO: TFloatField
      FieldName = 'IDCONTRATO'
      Origin = 'MEDICAO.IDCONTRATO'
    end
  end
  object qryDetAux: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '      M.IDMEDICAO,'
      '      M.IDCONTRATO,'
      '      M.IDPROJETO,'
      '      M.IDATIVIDADE,'
      '      M.IDITEM,'
      '      M.IDOBJETO,'
      '      M.IDPESSOA,'
      '      M.DATAPREVMEDICAO,'
      '      M.DATAMEDICAO,'
      '      M.MEDICAOAPROVADA,'
      '      M.QTDEMEDICAO,'
      '      M.VALORMEDICAO,'
      '      M.QTDEPREVISTA,'
      '      M.VALORPREVISTO,'
      '      M.NUMPARCELAS,'
      '      M.FREQUENCIA,'
      '      M.INTERVALO,'
      '      I.NOME_ITEM,'
      '      O.NOMEOBJETO,'
      '      D.OBS,'
      '      F.DESCRICAO'
      'FROM'
      '      MEDICAO M,'
      '      ITEMCONTRATUAL I,'
      '      OBJETOCONTRATUAL O,'
      '      DOCUMENTO D,'
      '      PARCELAMEDICAO P,'
      '      FORMARECPAG F'
      'WHERE'
      '     (M.IDMEDICAO = :IDMEDICAO)'
      '     AND (M.IDPESSOA   = :IDPESSOA)'
      '     AND (M.IDITEM     = I.IDITEM)'
      '     AND (M.IDOBJETO   = O.IDOBJETO)'
      '     AND (M.IDMEDICAO = P.IDMEDICAO)'
      '     AND (P.CODDOCUMENTO = D.CODDOCUMENTO)'
      '     AND (D.CODFORMA = F.CODFORMA(+))'
      'ORDER BY  I.NOME_ITEM, O.NOMEOBJETO'
      '')
    ValidateWithMask = True
    Left = 664
    Top = 120
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDMEDICAO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryDetAuxIDMEDICAO: TFloatField
      FieldName = 'IDMEDICAO'
    end
    object qryDetAuxIDCONTRATO: TFloatField
      FieldName = 'IDCONTRATO'
    end
    object qryDetAuxIDPROJETO: TFloatField
      FieldName = 'IDPROJETO'
    end
    object qryDetAuxIDATIVIDADE: TFloatField
      FieldName = 'IDATIVIDADE'
    end
    object qryDetAuxIDITEM: TFloatField
      FieldName = 'IDITEM'
    end
    object qryDetAuxIDOBJETO: TFloatField
      FieldName = 'IDOBJETO'
    end
    object qryDetAuxIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryDetAuxDATAPREVMEDICAO: TDateTimeField
      FieldName = 'DATAPREVMEDICAO'
    end
    object qryDetAuxDATAMEDICAO: TDateTimeField
      FieldName = 'DATAMEDICAO'
    end
    object qryDetAuxMEDICAOAPROVADA: TStringField
      FieldName = 'MEDICAOAPROVADA'
      Size = 1
    end
    object qryDetAuxQTDEMEDICAO: TFloatField
      FieldName = 'QTDEMEDICAO'
    end
    object qryDetAuxVALORMEDICAO: TFloatField
      FieldName = 'VALORMEDICAO'
    end
    object qryDetAuxQTDEPREVISTA: TFloatField
      FieldName = 'QTDEPREVISTA'
    end
    object qryDetAuxVALORPREVISTO: TFloatField
      FieldName = 'VALORPREVISTO'
    end
    object qryDetAuxNUMPARCELAS: TFloatField
      FieldName = 'NUMPARCELAS'
    end
    object qryDetAuxFREQUENCIA: TStringField
      FieldName = 'FREQUENCIA'
      Size = 1
    end
    object qryDetAuxINTERVALO: TFloatField
      FieldName = 'INTERVALO'
    end
    object qryDetAuxNOME_ITEM: TStringField
      FieldName = 'NOME_ITEM'
      Size = 200
    end
    object qryDetAuxNOMEOBJETO: TStringField
      FieldName = 'NOMEOBJETO'
      Size = 200
    end
    object qryDetAuxOBS: TMemoField
      FieldName = 'OBS'
      BlobType = ftMemo
      Size = 1000
    end
    object qryDetAuxDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'FORMARECPAG.DESCRICAO'
      Size = 30
    end
  end
  object qryMedDocum: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   P.IDMEDICAO,'
      '   P.IDPARCELAMEDICAO,'
      '   P.DATAPREVISTAVENC,'
      '   P.IDPESSOA,'
      '   P.VALORPREVISTO,'
      '   P.CODDOCUMENTO,'
      '   D.NODOCUMENTO,'
      '   D.COMPLDOCUMENTO,'
      '   D.CODFORMA,'
      '   L.PLNCODIGO,'
      '   L.DATALANCTO,'
      '   D.OPERACAO'
      'FROM'
      '   PARCELAMEDICAO P,'
      '   DOCUMENTO D,'
      '   LANCTODOCUM L'
      'WHERE'
      '    (IDMEDICAO = :IDMEDICAO)'
      '   AND (P.CODDOCUMENTO = D.CODDOCUMENTO)'
      '   AND (D.CODDOCUMENTO = L.CODDOCUMENTO)'
      '   AND (D.OPERACAO = L.OPERACAO)'
      ''
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 544
    Top = 240
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDMEDICAO'
        ParamType = ptUnknown
      end>
    object qryMedDocumIDMEDICAO: TFloatField
      FieldName = 'IDMEDICAO'
      Origin = 'PARCELAMEDICAO.IDMEDICAO'
    end
    object qryMedDocumIDPARCELAMEDICAO: TFloatField
      FieldName = 'IDPARCELAMEDICAO'
      Origin = 'PARCELAMEDICAO.IDPARCELAMEDICAO'
    end
    object qryMedDocumDATAPREVISTAVENC: TDateTimeField
      FieldName = 'DATAPREVISTAVENC'
      Origin = 'PARCELAMEDICAO.DATAPREVISTAVENC'
    end
    object qryMedDocumIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'PARCELAMEDICAO.IDPESSOA'
    end
    object qryMedDocumVALORPREVISTO: TFloatField
      FieldName = 'VALORPREVISTO'
      Origin = 'PARCELAMEDICAO.VALORPREVISTO'
    end
    object qryMedDocumCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Origin = 'PARCELAMEDICAO.CODDOCUMENTO'
    end
    object qryMedDocumNODOCUMENTO: TFloatField
      FieldName = 'NODOCUMENTO'
      Origin = '"CM.DOCUMENTO".NODOCUMENTO'
    end
    object qryMedDocumCOMPLDOCUMENTO: TStringField
      FieldName = 'COMPLDOCUMENTO'
      Origin = '"CM.DOCUMENTO".COMPLDOCUMENTO'
      Size = 3
    end
    object qryMedDocumCODFORMA: TFloatField
      FieldName = 'CODFORMA'
      Origin = '"CM.DOCUMENTO".CODFORMA'
    end
    object qryMedDocumPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Origin = 'LANCTODOCUM.PLNCODIGO'
    end
    object qryMedDocumDATALANCTO: TDateTimeField
      FieldName = 'DATALANCTO'
      Origin = 'LANCTODOCUM.DATALANCTO'
    end
    object qryMedDocumOPERACAO: TStringField
      FieldName = 'OPERACAO'
      Origin = '"CM.DOCUMENTO".OPERACAO'
      Size = 2
    end
  end
  object qryParcDel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM PARCELAMEDICAO'
      'WHERE  (CODDOCUMENTO = :CodDocumento)')
    ValidateWithMask = True
    Left = 432
    Top = 168
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CodDocumento'
        ParamType = ptInput
        Value = '0'
      end>
  end
  object qryDetDel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM'
      '   MEDICAO'
      'WHERE (IDMEDICAO = :IDMedicao)'
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 376
    Top = 168
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDMedicao'
        ParamType = ptInput
      end>
  end
  object qryEndPess: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT ES.IDESTADO, ES.CODESTADO, E.IDCIDADES, ES.IDPAIS'
      'FROM PESSOA P,'
      '     ENDPESS E,'
      '     CIDADES C,'
      '     ESTADO  ES'
      'WHERE (P.IDPESSOA = :IDPESSOA) AND'
      '      (E.IDPESSOA = P.IDPESSOA) AND'
      '      (E.IDENDERECO = P.IDENDCOMERCIAL) AND'
      '      (E.IDCIDADES = C.IDCIDADES) AND'
      '      (ES.IDESTADO = C.IDESTADO)')
    ValidateWithMask = True
    Left = 480
    Top = 272
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object qryEndPessIDESTADO: TFloatField
      FieldName = 'IDESTADO'
      Origin = 'ESTADO.IDESTADO'
    end
    object qryEndPessCODESTADO: TStringField
      FieldName = 'CODESTADO'
      Origin = 'ESTADO.CODESTADO'
      Size = 3
    end
    object qryEndPessIDCIDADES: TFloatField
      FieldName = 'IDCIDADES'
      Origin = '"CM.ENDPESS".IDCIDADES'
    end
    object qryEndPessIDPAIS: TFloatField
      FieldName = 'IDPAIS'
      Origin = 'ESTADO.IDPAIS'
    end
  end
  object MsContaCor: TMontaSelect
    Template.IdConsulta = 0
    Caption = 'Seleciona'
    Colunas.Strings = (
      'PESSOA.RAZAOSOCIAL'
      'BANCO.NUMBANCO'
      'AGENCIABANCARIA.NUMAGENCIA'
      'CONTABANCARIA.CONTACORRENTE'
      'CONTABANCARIA.TIPOCONTA'
      'CONTABANCARIA.FLGCONTAPREF')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C'
      'N')
    Descricao.Strings = (
      'Nome do Banco'
      'Num. Banco'
      'Num Agência'
      'Conta Corrente'
      'Tipo'
      'Preferencial')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'PESSOA'
      'BANCO'
      'AGENCIABANCARIA'
      'CONTABANCARIA')
    CamposChave.Strings = (
      'CONTABANCARIA.IDCBANCARIA'
      'CONTABANCARIA.CONTACORRENTE'
      'BANCO.NUMBANCO'
      'AGENCIABANCARIA.NUMAGENCIA'
      'CONTABANCARIA.TIPOCONTA')
    Filtro.Strings = (
      'PESSOA.IDPESSOA = BANCO.IDPESSOA'
      'AGENCIABANCARIA.IDBANCO = BANCO.IDPESSOA'
      'CONTABANCARIA.IDAGENCIA = AGENCIABANCARIA.IDPESSOA'
      'CONTABANCARIA.IDPESSOA = 1')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '60'
      '10'
      '15'
      '15'
      '1'
      '10')
    DataBaseName = 'BaseDados'
    RepeteConsulta = False
    UsaDistinct = False
    SalvaConsulta = False
    ExibePergunta = True
    MultiSelect = False
    Left = 536
  end
  object QryContaCor: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DECODE(C.TIPOCONTA,'#39'1'#39','#39'Conta Corrente'#39','
      '       DECODE(C.TIPOCONTA,'#39'2'#39','#39'Cartão Salário'#39','
      
        '       DECODE(C.TIPOCONTA,'#39'3'#39','#39'Conta Poupança'#39','#39#39'))) AS DESCTIPO' +
        'CONTA,'
      
        '       C.CONTACORRENTE, B.NUMBANCO, A.NUMAGENCIA, C.TIPOCONTA, C' +
        '.IDCBANCARIA,'
      
        '       DECODE(PA.RAZAOSOCIAL,NULL,PA.NOME,PA.RAZAOSOCIAL) AS NOM' +
        'EAGENCIA,'
      
        '       DECODE(PB.RAZAOSOCIAL,NULL,PB.NOME,PB.RAZAOSOCIAL) AS NOM' +
        'EBANCO'
      
        'FROM PESSOA PA, PESSOA PB, CONTABANCARIA C, AGENCIABANCARIA A, B' +
        'ANCO B'
      'WHERE (C.IDPESSOA = :IDPESSOA)  AND'
      '      (C.FLGCONTAPREF = 1)       AND'
      '      (C.IDAGENCIA = A.IDPESSOA) AND'
      '      (A.IDBANCO   = B.IDPESSOA) AND'
      '      (A.IDPESSOA = PA.IDPESSOA) AND'
      '      (B.IDPESSOA = PB.IDPESSOA)'
      ' ')
    ValidateWithMask = True
    Left = 336
    Top = 56
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDPESSOA'
        ParamType = ptUnknown
      end>
    object QryContaCorDESCTIPOCONTA: TStringField
      FieldName = 'DESCTIPOCONTA'
      Size = 14
    end
    object QryContaCorCONTACORRENTE: TStringField
      FieldName = 'CONTACORRENTE'
      Size = 15
    end
    object QryContaCorNUMBANCO: TStringField
      FieldName = 'NUMBANCO'
      Size = 10
    end
    object QryContaCorNUMAGENCIA: TStringField
      FieldName = 'NUMAGENCIA'
      Size = 15
    end
    object QryContaCorTIPOCONTA: TStringField
      FieldName = 'TIPOCONTA'
      Size = 1
    end
    object QryContaCorIDCBANCARIA: TFloatField
      FieldName = 'IDCBANCARIA'
    end
    object QryContaCorNOMEAGENCIA: TStringField
      FieldName = 'NOMEAGENCIA'
      Size = 60
    end
    object QryContaCorNOMEBANCO: TStringField
      FieldName = 'NOMEBANCO'
      Size = 60
    end
  end
  object qrySetaContrato: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT NOMECONTRATO,'
      '              IDCONTRATO,'
      '              IDPESSOA,'
      '              TIPOCONTRATO,'
      '              IDFORCLI'
      'FROM CONTRATOCONTR'
      'WHERE'
      '       (IDCONTRATO = :IDCONTRATO)'
      ''
      ''
      ' ')
    ValidateWithMask = True
    Left = 80
    Top = 104
    ParamData = <
      item
        DataType = ftInteger
        Name = 'IDCONTRATO'
        ParamType = ptUnknown
      end>
    object qrySetaContratoNOMECONTRATO: TStringField
      FieldName = 'NOMECONTRATO'
      Origin = '"CM.CONTRATOCONTR".NOMECONTRATO'
      Size = 60
    end
    object qrySetaContratoIDCONTRATO: TFloatField
      FieldName = 'IDCONTRATO'
      Origin = '"CM.CONTRATOCONTR".IDCONTRATO'
    end
    object qrySetaContratoIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = '"CM.CONTRATOCONTR".IDPESSOA'
    end
    object qrySetaContratoTIPOCONTRATO: TStringField
      FieldName = 'TIPOCONTRATO'
      Origin = '"CM.CONTRATOCONTR".TIPOCONTRATO'
      Size = 1
    end
    object qrySetaContratoIDFORCLI: TFloatField
      FieldName = 'IDFORCLI'
      Origin = '"CM.CONTRATOCONTR".IDFORCLI'
    end
  end
  object qryAlteradores: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT VALOR, CODALTERADOR, DEBCRE, VALOROUTRAMOEDA, HISTORICOCO' +
        'MPL'
      'FROM LANCTODOCUM'
      
        'WHERE (CODDOCUMENTO = :CodDocumento) AND (OPERACAO = '#39'4 '#39') AND (' +
        'ESTORNO IS NULL)'
      ' '
      ' ')
    ValidateWithMask = True
    Left = 384
    Top = 256
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CodDocumento'
        ParamType = ptInput
        Value = '0'
      end>
    object qryAlteradoresVALOR: TFloatField
      FieldName = 'VALOR'
      Origin = 'BASEDADOS.LANCTODOCUM.VALOR'
    end
    object qryAlteradoresCODALTERADOR: TFloatField
      FieldName = 'CODALTERADOR'
      Origin = 'BASEDADOS.LANCTODOCUM.CODALTERADOR'
    end
    object qryAlteradoresDEBCRE: TStringField
      FieldName = 'DEBCRE'
      Origin = 'BASEDADOS.LANCTODOCUM.DEBCRE'
      FixedChar = True
      Size = 1
    end
    object qryAlteradoresVALOROUTRAMOEDA: TFloatField
      FieldName = 'VALOROUTRAMOEDA'
      Origin = 'BASEDADOS.LANCTODOCUM.VALOROUTRAMOEDA'
    end
    object qryAlteradoresHISTORICOCOMPL: TStringField
      FieldName = 'HISTORICOCOMPL'
      Origin = 'BASEDADOS.LANCTODOCUM.HISTORICOCOMPL'
      Size = 60
    end
  end
  object qryNumApG: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT NUMAPGR'
      'FROM DOCUMENTO'
      'WHERE (CODDOCUMENTO = :CodDocumento) AND (NUMAPGR IS NOT NULL)')
    ValidateWithMask = True
    Left = 480
    Top = 256
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CodDocumento'
        ParamType = ptInput
        Value = '0'
      end>
    object qryNumApGNUMAPGR: TFloatField
      FieldName = 'NUMAPGR'
      Origin = 'BASEDADOS.DOCUMENTO.NUMAPGR'
    end
  end
  object qryAtualizaNumApG: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE DOCUMENTO'
      'SET NUMAPGR = :NumAP'
      'WHERE CODDOCUMENTO = :NovoCodDocumento')
    ValidateWithMask = True
    Left = 384
    Top = 240
    ParamData = <
      item
        DataType = ftFloat
        Name = 'NumAP'
        ParamType = ptInput
        Value = '0'
      end
      item
        DataType = ftFloat
        Name = 'NovoCodDocumento'
        ParamType = ptInput
        Value = '0'
      end>
  end
  object upRateioCC: TUpdateSQL
    ModifySQL.Strings = (
      'update RATEIOCENTROCUSTO'
      'set'
      '  CODCENTROCUSTO = :CODCENTROCUSTO,'
      '  IDEMPRESA = :IDEMPRESA,'
      '  PERCRATEIOCONTR = :PERCRATEIOCONTR,'
      '  DIVISOR = :DIVISOR'
      'where'
      '  CODCENTROCUSTO = :OLD_CODCENTROCUSTO')
    InsertSQL.Strings = (
      'insert into RATEIOCENTROCUSTO'
      '  (CODCENTROCUSTO, IDEMPRESA, PERCRATEIOCONTR, DIVISOR)'
      'values'
      '  (:CODCENTROCUSTO, :IDEMPRESA, :PERCRATEIOCONTR, :DIVISOR)')
    DeleteSQL.Strings = (
      'delete from RATEIOCENTROCUSTO'
      'where'
      '  CODCENTROCUSTO = :OLD_CODCENTROCUSTO')
    Left = 245
    Top = 240
  end
  object dsRateioCC: TDataSource
    DataSet = qryRateioCC
    Left = 245
    Top = 224
  end
  object qryAuxDoc: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '   IDMEDICAO'
      'FROM PARCELAMEDICAO'
      'WHERE (CODDOCUMENTO = :CodDocumento)'
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 664
    Top = 216
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CODDOCUMENTO'
        ParamType = ptUnknown
      end>
    object qryAuxDocIDMEDICAO: TFloatField
      FieldName = 'IDMEDICAO'
      Origin = 'BASEDADOS.PARCELAMEDICAO.IDMEDICAO'
    end
  end
  object qryParcRealDel: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'DELETE FROM'
      '   PARCELAREALCONTR'
      'WHERE'
      '   (CODDOCUMENTO = :CodDocumento)'
      ' ')
    ValidateWithMask = True
    Left = 504
    Top = 168
    ParamData = <
      item
        DataType = ftFloat
        Name = 'CodDocumento'
        ParamType = ptInput
      end>
  end
  object qryParcReal: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT *'
      'FROM PARCELAREALCONTR'
      'WHERE (1=-2)')
    UpdateObject = updParcReal
    ValidateWithMask = True
    Left = 504
    Top = 120
    object qryParcRealIDPARCELA: TFloatField
      FieldName = 'IDPARCELA'
      Origin = 'BASEDADOS.PARCELAREALCONTR.IDPARCELA'
    end
    object qryParcRealIDCONTRATO: TFloatField
      FieldName = 'IDCONTRATO'
      Origin = 'BASEDADOS.PARCELAREALCONTR.IDCONTRATO'
    end
    object qryParcRealPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Origin = 'BASEDADOS.PARCELAREALCONTR.PLNCODIGO'
    end
    object qryParcRealIDITEM: TFloatField
      FieldName = 'IDITEM'
      Origin = 'BASEDADOS.PARCELAREALCONTR.IDITEM'
    end
    object qryParcRealIDOBJETO: TFloatField
      FieldName = 'IDOBJETO'
      Origin = 'BASEDADOS.PARCELAREALCONTR.IDOBJETO'
    end
    object qryParcRealIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      Origin = 'BASEDADOS.PARCELAREALCONTR.IDPESSOA'
    end
    object qryParcRealCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Origin = 'BASEDADOS.PARCELAREALCONTR.CODDOCUMENTO'
    end
    object qryParcRealIDMEDICAO: TFloatField
      FieldName = 'IDMEDICAO'
      Origin = 'BASEDADOS.PARCELAREALCONTR.IDMEDICAO'
    end
    object qryParcRealIDPARCELAMEDICAO: TFloatField
      FieldName = 'IDPARCELAMEDICAO'
      Origin = 'BASEDADOS.PARCELAREALCONTR.IDPARCELAMEDICAO'
    end
    object qryParcRealDATAVENCPARCELA: TDateTimeField
      FieldName = 'DATAVENCPARCELA'
      Origin = 'BASEDADOS.PARCELAREALCONTR.DATAVENCPARCELA'
    end
    object qryParcRealDATAREALPARCELA: TDateTimeField
      FieldName = 'DATAREALPARCELA'
      Origin = 'BASEDADOS.PARCELAREALCONTR.DATAREALPARCELA'
    end
    object qryParcRealQTDEPARCELA: TFloatField
      FieldName = 'QTDEPARCELA'
      Origin = 'BASEDADOS.PARCELAREALCONTR.QTDEPARCELA'
    end
    object qryParcRealVALOROBJPARCELA: TFloatField
      FieldName = 'VALOROBJPARCELA'
      Origin = 'BASEDADOS.PARCELAREALCONTR.VALOROBJPARCELA'
    end
    object qryParcRealVLRMOEDACORRENTE: TFloatField
      FieldName = 'VLRMOEDACORRENTE'
      Origin = 'BASEDADOS.PARCELAREALCONTR.VLRMOEDACORRENTE'
    end
    object qryParcRealNUMNOTAFISCAL: TFloatField
      FieldName = 'NUMNOTAFISCAL'
      Origin = 'BASEDADOS.PARCELAREALCONTR.NUMNOTAFISCAL'
    end
    object qryParcRealOBSERVACAO: TStringField
      FieldName = 'OBSERVACAO'
      Origin = 'BASEDADOS.PARCELAREALCONTR.OBSERVACAO'
      Size = 60
    end
  end
  object updParcReal: TUpdateSQL
    ModifySQL.Strings = (
      'update PARCELAREALCONTR'
      'set'
      '  IDPARCELA = :IDPARCELA,'
      '  IDCONTRATO = :IDCONTRATO,'
      '  PLNCODIGO = :PLNCODIGO,'
      '  IDITEM = :IDITEM,'
      '  IDOBJETO = :IDOBJETO,'
      '  IDPESSOA = :IDPESSOA,'
      '  CODDOCUMENTO = :CODDOCUMENTO,'
      '  IDMEDICAO = :IDMEDICAO,'
      '  IDPARCELAMEDICAO = :IDPARCELAMEDICAO,'
      '  DATAVENCPARCELA = :DATAVENCPARCELA,'
      '  DATAREALPARCELA = :DATAREALPARCELA,'
      '  QTDEPARCELA = :QTDEPARCELA,'
      '  VALOROBJPARCELA = :VALOROBJPARCELA,'
      '  VLRMOEDACORRENTE = :VLRMOEDACORRENTE,'
      '  NUMNOTAFISCAL = :NUMNOTAFISCAL,'
      '  OBSERVACAO = :OBSERVACAO'
      'where'
      '  IDPARCELA = :OLD_IDPARCELA')
    InsertSQL.Strings = (
      'insert into PARCELAREALCONTR'
      
        '  (IDPARCELA, IDCONTRATO, PLNCODIGO, IDITEM, IDOBJETO, IDPESSOA,' +
        ' CODDOCUMENTO, '
      
        '   IDMEDICAO, IDPARCELAMEDICAO, DATAVENCPARCELA, DATAREALPARCELA' +
        ', QTDEPARCELA, '
      '   VALOROBJPARCELA, VLRMOEDACORRENTE, NUMNOTAFISCAL, OBSERVACAO)'
      'values'
      
        '  (:IDPARCELA, :IDCONTRATO, :PLNCODIGO, :IDITEM, :IDOBJETO, :IDP' +
        'ESSOA, '
      
        '   :CODDOCUMENTO, :IDMEDICAO, :IDPARCELAMEDICAO, :DATAVENCPARCEL' +
        'A, :DATAREALPARCELA, '
      
        '   :QTDEPARCELA, :VALOROBJPARCELA, :VLRMOEDACORRENTE, :NUMNOTAFI' +
        'SCAL, :OBSERVACAO)')
    DeleteSQL.Strings = (
      'delete from PARCELAREALCONTR'
      'where'
      '  IDPARCELA = :OLD_IDPARCELA')
    Left = 576
    Top = 120
  end
  object qryInclusaoMed: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'INSERT INTO'
      '     Medicao (IDMEDICAO,'
      '              IDCONTRATO,'
      '              IDPROJETO,'
      '              IDATIVIDADE,'
      '              IDITEM,'
      '              IDOBJETO,'
      '              IDPESSOA,'
      '              DATAPREVMEDICAO,'
      '              DATAMEDICAO,'
      '              MEDICAOAPROVADA,'
      '              QTDEMEDICAO,'
      '              VALORMEDICAO,'
      '              QTDEPREVISTA,'
      '              VALORPREVISTO,'
      '              NUMPARCELAS,'
      '              FREQUENCIA,'
      '              INTERVALO,'
      '              OBSERVACAO)'
      ''
      '     VALUES  (:IDMedicao,'
      '              :IDContrato,'
      '              :IDProjeto,'
      '              :IDAtividade,'
      '              :IDItem,'
      '              :IDObjeto,'
      '              :IDPessoa,'
      '              TO_DATE( :DataPrevMedicao,'#39'dd/mm/yyyy'#39'),'
      '              TO_DATE( :DataMedicao,'#39'dd/mm/yyyy'#39'),'
      '              :MedicaoAprovada,'
      '              :QtdeMedicao,'
      '              :ValorMedicao,'
      '              :QtdePrevista,'
      '              :ValorPrevisto,'
      '              :NumParcelas,'
      '              :Frequencia,'
      '              :Intervalo,'
      '              :Observacao)'
      ' ')
    ValidateWithMask = True
    Left = 669
    Top = 375
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDMedicao'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDContrato'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDProjeto'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDAtividade'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDItem'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDObjeto'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'IDPessoa'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataPrevMedicao'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'DataMedicao'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'MedicaoAprovada'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'QtdeMedicao'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ValorMedicao'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'QtdePrevista'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'ValorPrevisto'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'NumParcelas'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Frequencia'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'Intervalo'
        ParamType = ptInput
      end
      item
        DataType = ftString
        Name = 'Observacao'
        ParamType = ptInput
      end>
  end
  object dsContr: TDataSource
    DataSet = qryContrato
    Left = 208
    Top = 56
  end
end
