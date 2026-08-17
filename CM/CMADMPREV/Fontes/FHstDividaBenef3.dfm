inherited FrmHstDividaBenef3: TFrmHstDividaBenef3
  Left = 30
  Top = 46
  Caption = 'Histórico de Dívidas de Benefícios'
  ClientHeight = 587
  ClientWidth = 1234
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 1234
    Height = 501
    inherited pnlMestre: TPanel
      Width = 1232
      Height = 212
      object ToolbarButton971: TToolbarButton97
        Left = 900
        Top = 65
        Width = 295
        Height = 41
        AllowAllUp = True
        GroupIndex = 1
        Caption = 'Alterar Opções de Parcelamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          04000000000000010000120B0000120B00001000000000000000000000000000
          800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333000000
          000033333377777777773333330FFFFFFFF03FF3FF7FF33F3FF700300000FF0F
          00F077F777773F737737E00BFBFB0FFFFFF07773333F7F3333F7E0BFBF000FFF
          F0F077F3337773F3F737E0FBFBFBF0F00FF077F3333FF7F77F37E0BFBF00000B
          0FF077F3337777737337E0FBFBFBFBF0FFF077F33FFFFFF73337E0BF0000000F
          FFF077FF777777733FF7000BFB00B0FF00F07773FF77373377373330000B0FFF
          FFF03337777373333FF7333330B0FFFF00003333373733FF777733330B0FF00F
          0FF03333737F37737F373330B00FFFFF0F033337F77F33337F733309030FFFFF
          00333377737FFFFF773333303300000003333337337777777333}
        ImageIndex = 1
        Images = ImlPadrao
        Opaque = False
        ParentFont = False
        Spacing = 0
        Visible = False
      end
      object lbl12: TLabel
        Left = 240
        Top = 9
        Width = 33
        Height = 13
        Caption = 'Nome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbtxtMATRICULA: TDBText
        Left = 240
        Top = 24
        Width = 241
        Height = 17
        DataField = 'NOME'
        DataSource = dscab
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lbl13: TLabel
        Left = 150
        Top = 8
        Width = 55
        Height = 13
        Caption = 'Matrícula'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbtxtMATRICULA1: TDBText
        Left = 150
        Top = 24
        Width = 65
        Height = 17
        DataField = 'MATRICULA'
        DataSource = dscab
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lbl1: TLabel
        Left = 504
        Top = 8
        Width = 118
        Height = 13
        Caption = 'Plano Previdenciário'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbtxtNOMEPLANPREV: TDBText
        Left = 504
        Top = 24
        Width = 148
        Height = 17
        DataField = 'NOMEPLANPREV'
        DataSource = dscab
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object dbtxtNOMEBENEFICIO: TDBText
        Left = 675
        Top = 24
        Width = 273
        Height = 17
        DataField = 'NOMEBENEFICIO'
        DataSource = dscab
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lbl3: TLabel
        Left = 675
        Top = 8
        Width = 56
        Height = 13
        Caption = 'Benefício'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbtxtMESINICIO: TDBText
        Left = 10
        Top = 69
        Width = 113
        Height = 17
        DataField = 'MESINICIO'
        DataSource = dscab
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lbl2: TLabel
        Left = 10
        Top = 53
        Width = 123
        Height = 13
        Caption = 'Data Início Cobrança'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbtxtMESFIM: TDBText
        Left = 240
        Top = 69
        Width = 113
        Height = 17
        DataField = 'MESFIM'
        DataSource = dscab
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lbl5: TLabel
        Left = 240
        Top = 53
        Width = 117
        Height = 13
        Caption = 'Data Final Cobrança'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbtxtVALORULTIMAPARCELA: TDBText
        Left = 504
        Top = 67
        Width = 65
        Height = 17
        DataField = 'VALORULTIMAPARCELA'
        DataSource = dscab
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lbl6: TLabel
        Left = 504
        Top = 51
        Width = 134
        Height = 13
        Caption = 'Valor da Última Parcela'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lbl7: TLabel
        Left = 675
        Top = 51
        Width = 103
        Height = 13
        Caption = 'Último Pagamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbtxtVALORULTIMAPARCELA1: TDBText
        Left = 675
        Top = 67
        Width = 93
        Height = 17
        DataField = 'ULT'
        DataSource = dscab
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lbl18: TLabel
        Left = 10
        Top = 90
        Width = 188
        Height = 13
        Caption = 'Situação da Dívida do Benefício'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbtxtIDCONTROLEDIVIDABENEFICIO1: TDBText
        Left = 10
        Top = 106
        Width = 160
        Height = 17
        DataField = 'FLGQUITADOSTR'
        DataSource = dscab
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lblStatusDivida: TLabel
        Left = 12
        Top = 127
        Width = 97
        Height = 13
        Caption = 'Status da Dívida'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object lblMotivoAlt: TLabel
        Left = 224
        Top = 127
        Width = 233
        Height = 13
        Caption = 'Motivo de Alteração do Status da Dívida'
      end
      object lblNumBenefINSS: TLabel
        Left = 981
        Top = 8
        Width = 154
        Height = 13
        Caption = 'Número do Benefício INSS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbtxtNumProcINSS: TDBText
        Left = 981
        Top = 24
        Width = 176
        Height = 17
        DataField = 'NUMPROCINSS'
        DataSource = dscab
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object lbl4: TLabel
        Left = 240
        Top = 93
        Width = 118
        Height = 13
        Caption = 'Saldo Devedor Atual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbtxtSALDODEVEDORATUAL: TDBText
        Left = 240
        Top = 108
        Width = 137
        Height = 17
        DataField = 'SALDODEVEDORATUAL'
        DataSource = dscab
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label1: TLabel
        Left = 504
        Top = 89
        Width = 141
        Height = 13
        Caption = 'Saldo Provisão de Perda'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbtxtSALDOPROVISAO: TDBText
        Left = 504
        Top = 104
        Width = 137
        Height = 17
        DataField = 'SALDOPROVPERDA'
        DataSource = dscab
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object Label2: TLabel
        Left = 675
        Top = 89
        Width = 126
        Height = 13
        Caption = 'Saldo Baixa Definitiva'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbtxtSALDOBAIXA: TDBText
        Left = 675
        Top = 104
        Width = 137
        Height = 17
        DataField = 'SALDOBAIXADEF'
        DataSource = dscab
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -12
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
      end
      object btnProcurar: TBitBtn
        Left = 900
        Top = 65
        Width = 295
        Height = 41
        Caption = 'Alterar Opções de Parcelamento'
        Default = True
        Enabled = False
        TabOrder = 2
        OnClick = btnProcurarClick
        Glyph.Data = {
          06030000424D060300000000000036000000280000000D000000120000000100
          180000000000D002000000000000000000000000000000000000F0F0F0F0F0F0
          F0F0F0F0F0F0F0F0F0F0F0F0000000000000000000F0F0F0F0F0F0F0F0F0F0F0
          F000F0F0F0F0F0F0F0F0F0F0F0F0848484848484FFFFFFFFFFFF000000848484
          F0F0F0F0F0F0F0F0F000F0F0F0F0F0F0848484848484FFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF000000F0F0F0F0F0F0F0F0F000F0F0F0848484FFFFFFFFFFFFFFFF
          FFFFFFFF848484848484FFFFFF000000F0F0F0F0F0F0F0F0F000F0F0F0848484
          FFFFFFFFFFFF000000000000FFFFFF000000FFFFFFFFFFFF000000F0F0F0F0F0
          F000F0F0F0F0F0F0000000000000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFF
          000000F0F0F0F0F0F000000000000000FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          FFFF000000FFFFFFFFFFFF000000F0F0F000848484FFFFFFFFFFFFFFFFFFFFFF
          FFFFFFFFFF0000FFFFFF000000FFFFFFFFFFFFFFFFFF00000000848484FFFFFF
          FFFFFFFF0000FF0000FF0000FFFFFFFFFFFFFFFFFF000000FFFFFFFFFFFFFFFF
          FF00F0F0F0848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF0000FFFFFF000000
          FFFFFF84848484848400F0F0F0848484FFFFFFFFFFFFFF0000FF0000FF0000FF
          FFFFFFFFFFFFFFFF000000F0F0F0F0F0F000F0F0F0F0F0F0848484FFFFFFFFFF
          FFFFFFFFFFFFFFFFFFFFFF0000FFFFFFFFFFFF000000F0F0F000F0F0F0F0F0F0
          848484FFFFFFFFFFFFFF0000FF0000FF0000FFFFFFFFFFFFFFFFFFFFFFFF0000
          0000F0F0F0F0F0F0F0F0F0848484FFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFFF
          848484848484F0F0F000F0F0F0F0F0F0F0F0F0F0F0F0848484FFFFFFFFFFFFFF
          FFFF848484848484F0F0F0F0F0F0F0F0F000F0F0F0F0F0F0F0F0F0F0F0F0F0F0
          F0848484848484848484F0F0F0F0F0F0F0F0F0F0F0F0F0F0F000F0F0F0F0F0F0
          F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
          F000F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0F0
          F0F0F0F0F0F0F0F0F000}
      end
      object cbbStatusDivida: TComboBox
        Left = 12
        Top = 143
        Width = 145
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 0
        Items.Strings = (
          'Ativa'
          'Suspensa'
          'Encerrada')
      end
      object edtMotivoAlteracao: TwwDBEdit
        Left = 224
        Top = 143
        Width = 516
        Height = 21
        DataField = 'MOTIVO'
        DataSource = dscab
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 1
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object chkAcaoJud: TDBCheckBox
        Left = 753
        Top = 143
        Width = 108
        Height = 17
        Caption = 'Ação Judicial'
        DataField = 'FLGACAOJUD'
        DataSource = dscab
        TabOrder = 3
        ValueChecked = '1'
        ValueUnchecked = '0'
      end
      object pnl1: TPanel
        Left = 0
        Top = 168
        Width = 1232
        Height = 44
        Align = alBottom
        BevelInner = bvLowered
        BevelOuter = bvLowered
        TabOrder = 4
        object lbl9: TLabel
          Left = 220
          Top = 4
          Width = 110
          Height = 13
          Caption = 'Ano/Mês Cobrança'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object lbl10: TLabel
          Left = 360
          Top = 4
          Width = 51
          Height = 13
          Caption = 'Situação'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object lbl11: TLabel
          Left = 528
          Top = 4
          Width = 118
          Height = 13
          Caption = 'Ano/Mês Referência'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Transparent = True
        end
        object medtME_anomes: TMaskEdit
          Left = 220
          Top = 18
          Width = 113
          Height = 21
          Enabled = False
          EditMask = '9999/99;1;_'
          MaxLength = 7
          TabOrder = 0
          Text = '    /  '
        end
        object medt1: TMaskEdit
          Left = 528
          Top = 18
          Width = 113
          Height = 21
          Enabled = False
          EditMask = '9999/99;1;_'
          MaxLength = 7
          TabOrder = 2
          Text = '    /  '
        end
        object cbb_tipo_recebedor: TComboBox
          Left = 360
          Top = 18
          Width = 145
          Height = 21
          Style = csDropDownList
          Enabled = False
          ItemHeight = 13
          TabOrder = 1
          Items.Strings = (
            'Preparada'
            'Enviada'
            'Enviada e Não Recebida'
            'Recebida'
            'Recebida com Divergência'
            'Suspensa'
            'Todas')
        end
        object btnFiltro: TBitBtn
          Left = 673
          Top = 8
          Width = 100
          Height = 30
          Caption = 'Filtrar'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
          OnClick = btnFiltroClick
          Glyph.Data = {
            DE010000424DDE01000000000000760000002800000024000000120000000100
            0400000000006801000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333444444
            33333333333F8888883F33330000324334222222443333388F3833333388F333
            000032244222222222433338F8833FFFFF338F3300003222222AAAAA22243338
            F333F88888F338F30000322222A33333A2224338F33F8333338F338F00003222
            223333333A224338F33833333338F38F00003222222333333A444338FFFF8F33
            3338888300003AAAAAAA33333333333888888833333333330000333333333333
            333333333333333333FFFFFF000033333333333344444433FFFF333333888888
            00003A444333333A22222438888F333338F3333800003A2243333333A2222438
            F38F333333833338000033A224333334422224338338FFFFF8833338000033A2
            22444442222224338F3388888333FF380000333A2222222222AA243338FF3333
            33FF88F800003333AA222222AA33A3333388FFFFFF8833830000333333AAAAAA
            3333333333338888883333330000333333333333333333333333333333333333
            0000}
          NumGlyphs = 2
        end
      end
      object GroupBox2: TGroupBox
        Left = 10
        Top = 4
        Width = 125
        Height = 40
        Caption = ' Código da Dívida '
        TabOrder = 5
        object dbtxtIDCONTROLEDIVIDABENEFICIO: TDBText
          Left = 13
          Top = 18
          Width = 99
          Height = 17
          Alignment = taCenter
          DataField = 'IDCONTROLEDIVIDABENEFICIO'
          DataSource = dscab
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -12
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
      end
    end
    inherited tbcDetalhe: TTabControlDetalhe
      Top = 213
      Width = 1232
      Height = 287
      Tabs.Strings = (
        'Histórico'
        'Movimento')
      detdbGrids.Strings = (
        'dbgrdDet'
        'dbgrdMovDivida')
      inherited pgctrlDetalhe: TPageControl
        Width = 1134
        Height = 228
        ActivePage = tbsMovDivida
        inherited tbsDet: TTabSheet
          inherited dbgrdDet: TwwDBGrid
            Width = 1126
            Height = 200
            ControlType.Strings = (
              'SELECIONADO;CheckBox;S;N')
            Options = [dgEditing, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            OnDrawDataCell = dbgrdDetDrawDataCell
            OnDblClick = dbgrdDetDblClick
          end
          inherited pnlControlesDet: TPanel
            Width = 1126
            Height = 200
            object lbl_matri: TLabel
              Left = 8
              Top = 64
              Width = 98
              Height = 13
              Caption = 'Data Vencimento'
            end
            object lbl16: TLabel
              Left = 8
              Top = 8
              Width = 120
              Height = 13
              Caption = 'Forma de Pagamento'
            end
            object lbl17: TLabel
              Left = 8
              Top = 112
              Width = 109
              Height = 13
              Caption = 'Ano/mês Cobrança'
            end
            object lbl14: TLabel
              Left = 8
              Top = 152
              Width = 145
              Height = 13
              Caption = 'Valor Previsto da Parcela'
            end
            object lbl15: TLabel
              Left = 360
              Top = 24
              Width = 69
              Height = 13
              Caption = 'Observação'
            end
            object dbmmoOBSERVACAO: TDBMemo
              Left = 359
              Top = 42
              Width = 694
              Height = 79
              DataField = 'OBSERVACAO'
              DataSource = dsDet
              TabOrder = 10
            end
            object memObservacaoInsert: TMemo
              Left = 359
              Top = 42
              Width = 693
              Height = 79
              TabOrder = 4
            end
            object medtvenc: TMaskEdit
              Left = 9
              Top = 79
              Width = 121
              Height = 21
              EditMask = '99/99/9999;1;_'
              MaxLength = 10
              TabOrder = 1
              Text = '  /  /    '
            end
            object dbedDataPrev: TwwDBEdit
              Left = 10
              Top = 78
              Width = 120
              Height = 21
              DataField = 'DATAPREVISTA'
              DataSource = dsDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 8
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
              OnExit = dbedDataPrevExit
              OnKeyPress = dbMesCobrKeyPress
            end
            object dbMesCobr: TwwDBEdit
              Left = 8
              Top = 126
              Width = 120
              Height = 21
              DataField = 'MESCOBRANCA'
              DataSource = dsDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 9
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
              OnKeyPress = dbMesCobrKeyPress
            end
            object dbchk2: TDBCheckBox
              Left = 360
              Top = 128
              Width = 313
              Height = 17
              Caption = 'Recalcular Parcela'
              DataSource = dsDet
              TabOrder = 5
              ValueChecked = 'True'
              ValueUnchecked = 'False'
              Visible = False
            end
            object cboNCobra_D: TwwDBLookupCombo
              Left = 8
              Top = 20
              Width = 275
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'60'#9'Descrição'#9'F'
                'CODPROVDESC'#9'15'#9'Código'#9'F'
                'IDPROVENTO'#9'10'#9'Ident.'#9'F')
              DataField = 'CODPORTFORMA'
              DataSource = dsDet
              LookupTable = qryLkPORTADORFORMA
              LookupField = 'CODPORTFORMA'
              Options = [loTitles]
              ParentFont = False
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object medtanomescob: TMaskEdit
              Left = 9
              Top = 126
              Width = 121
              Height = 21
              EditMask = '9999/99;1;_'
              MaxLength = 7
              TabOrder = 2
              Text = '    /  '
              OnEnter = medtanomescobEnter
            end
            object chkSusp: TCheckBox
              Left = 360
              Top = 4
              Width = 329
              Height = 17
              Caption = 'Suspender Cobrança de Dívida de Benefício'
              TabOrder = 3
            end
            object dbref: TwwDBLookupCombo
              Left = 360
              Top = 170
              Width = 275
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NUMEROPARCELA'#9'10'#9'NUMEROPARCELA'#9'F')
              DataField = 'IDHISTORICODIVIDABENEFICIOREF'
              DataSource = dsDet
              LookupTable = qryLkRefe
              LookupField = 'IDHSTORICODIVIDABENEFICIO'
              Options = [loTitles]
              ParentFont = False
              TabOrder = 7
              AutoDropDown = True
              ShowButton = True
              AllowClearKey = True
            end
            object chkParcela: TCheckBox
              Left = 360
              Top = 149
              Width = 329
              Height = 17
              Caption = 'Parcela de Referência'
              TabOrder = 6
            end
            object medtValorPrevisto: TRealEdit
              Left = 10
              Top = 167
              Width = 121
              Height = 21
              Alignment = taRightJustify
              Lines.Strings = (
                '0,00')
              TabOrder = 11
              WordWrap = False
              OnExit = medtValorPrevistoExit
              OnKeyDown = medtValorPrevistoKeyDown
              OnKeyPress = medtValorPrevistoKeyPress
              IntDigits = 10
              DecDigits = 2
              NumberFormat = fNumber
              Signal = True
            end
          end
        end
        object tbsMovDivida: TTabSheet
          Caption = 'Movimento'
          ImageIndex = 1
          object dbgrdMovDivida: TwwDBGrid
            Left = 0
            Top = 0
            Width = 1126
            Height = 200
            Selected.Strings = (
              'STATUS'#9'13'#9'Status da ~Dívida'#9'F'
              'DATAMOV'#9'13'#9'Data do ~Movimento'#9'F'
              'OPEORIGEM'#9'25'#9'Operação ~Origem'#9'F'
              'SALDO_ANTERIOR'#9'10'#9'Saldo Devedor ~Anterior'#9'F'
              'VALORULTIMAPARCELA'#9'10'#9'Valor Última ~Parcela Gerada'#9'F'
              'VALORPARCELA'#9'10'#9'Valor Parcela ~Atual'#9'F'
              'SALDO_ATUAL'#9'10'#9'Saldo Devedor ~Atual'#9'F'
              'QTDEPARCELASANT'#9'10'#9'Qtde Parcelas ~Anterior'#9'F'
              'QTDEPARCELASATUAL'#9'10'#9'Qtde Total ~de Parcelas'#9'F'
              'MESINICIO'#9'12'#9'Início da ~Dívida'#9'F'
              'MESFIM'#9'12'#9'Fim da ~Dívida'#9'F'
              'FLGDESCFOLHA'#9'10'#9'Tipo ~Pagamento'#9'F'
              'PORTADOR'#9'15'#9'Portador'#9'F'
              'FLGATUSALDO'#9'8'#9'Atualiza ~Saldo'#9'F'
              'PARCELA'#9'20'#9'Alteração ~Parcela'#9'F'
              'NOMEUSUARIO'#9'18'#9'Usuário Respons. ~Alteração'#9'F')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsMovDivida
            ReadOnly = True
            TabOrder = 0
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 2
            TitleButtons = False
            IndicatorColor = icBlack
          end
        end
      end
      inherited Dock973: TDock97
        Width = 1224
        inherited tb97BotoesDetalhe: TToolbar97
          object sbtAltProvisao: TSpeedButton
            Left = 75
            Top = 0
            Width = 27
            Height = 25
            Hint = 'Altera Provisões'
            AllowAllUp = True
            GroupIndex = 1
            Flat = True
            Glyph.Data = {
              4E010000424D4E01000000000000760000002800000012000000120000000100
              040000000000D800000000000000000000001000000010000000000000000000
              BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
              FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
              DDDDDD000000DDDDDDDDDDDDDDDDDD000000DDDDDDDDDDDDDDDDDD000000DDDD
              00DDDDD00DDDDD000000DDDD070000070DDDDD000000DDD0707777700DDDDD00
              0000DD077777777770DDDD000000DD07777777777F0DDD000000D07777777777
              700DDD000000D0777777777777700D000000D0777777777777770D000000D077
              00777770F7770D000000DD07FF00077F7700DD000000DDD007FFF77770DDDD00
              0000DDDDD00000700DDDDD000000DDDDDDDDDD00DDDDDD000000DDDDDDDDDDD0
              DDDDDD000000DDDDDDDDDDDDDDDDDD000000}
            Layout = blGlyphTop
            ParentShowHint = False
            ShowHint = True
            Spacing = 0
            OnClick = sbtAltProvisaoClick
          end
        end
        object btnSelTudo: TBitBtn
          Left = 375
          Top = -1
          Width = 148
          Height = 30
          Hint = 'Seleciona Todas as Rubricas'
          Caption = '   Selecionar Tudo'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 1
          OnClick = btnSelTudoClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333333333333333333333333333333333333333333333333333300000
            0003333333388888888333333330FF9FFF0333333338FF7FFF8333333000F999
            FF0333333888F777FF83333330F099F99F03333338F877F77F83333000F09FFF
            9903333888F87FFF77833330F090FFFFF9933338F878FFFFF7733000F0900000
            00993888F8788888887730F090FFFFF9933338F878FFFFF7733330F090000000
            993338F87888888877333090FFFFF99333333878FFFFF7733333309000000099
            3333387888888877333330FFFFF99333333338FFFFF773333333300000009933
            3333388888887733333333333333333333333333333333333333}
          NumGlyphs = 2
          Spacing = 0
        end
        object btnInverte: TBitBtn
          Left = 527
          Top = -1
          Width = 148
          Height = 30
          Hint = 'Inverte a Seleção das Rubricas'
          Caption = 'Desmarcar Tudo'
          Enabled = False
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          ParentShowHint = False
          ShowHint = True
          TabOrder = 2
          OnClick = btnInverteClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333333
            3333333333333333333333333333000000003333333388888888333333330FFF
            FFF0333333338FFFFFF8333000330FFFFFF0333788338FFFFFF8333033330FFF
            FFF0333833338FFFFFF8330003330FFFFFF0337783338FFFFFF8333033330FFF
            FFF0333833338FFFFFF833333333000000003333333388888888000000003333
            333388888888333333330FF9FFF0333303338FF7FFF8333383330F999FF03330
            00338F777FF833387733099F99F033330333877F77F83333833309FFF9903300
            033387FFF778338873330FFFFF99333333338FFFFF7733333333000000099333
            3333888888877333333333333333333333333333333333333333}
          NumGlyphs = 2
          Spacing = 0
        end
      end
      inherited Dock974: TDock97
        Left = 1138
        Height = 228
      end
    end
  end
  inherited Dock972: TDock97
    Width = 1234
    inherited Toolbar971: TToolbar97
      inherited sbtnInserir: TToolbarButton97
        Visible = False
      end
      inherited sbtnApagar: TToolbarButton97
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 548
    Width = 1234
    object btnRelatorio: TToolbarButton97 [0]
      Left = 511
      Top = 2
      Width = 153
      Height = 33
      AllowAllUp = True
      Caption = '  Gerar Relatório'
      Flat = False
      Glyph.Data = {
        DE010000424DDE01000000000000760000002800000024000000120000000100
        0400000000006801000000000000000000001000000010000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888880008
        8888888888888F7778FF8888000088888800877008888888888F7787F778FF88
        0000888800880007700888888F778F7778F778FF000088008800877007700888
        778F7787F778F778000080880088877770077087FF778887F88778F700008700
        888887777770008777888887FF888777000080888888F77777777087F8888F77
        78FF88870000878888FF888777777087F88F77888778FF8700008788FF888888
        87777087FF778888888778F7000087FF88899888888770877788888888888777
        000087888AA88888808880878FF8888888FFF8F700008877F888888FF0877888
        778FF88FF77787780000888877F87FFFFF08888888778F77788878F800008888
        88777FFFFFF088888888777FF888878F00008888888877FFFFFF008888888877
        8F888F77000088888888887FFF7788888888888878FF77880000888888888887
        7788888888888888877788880000888888888888888888888888888888888888
        0000}
      NumGlyphs = 2
      Opaque = False
      Spacing = 0
      OnClick = btnRelatorioClick
    end
    inherited tb97Fundo: TToolbar97
      Left = 1062
      DockPos = 1313
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 893
      DockPos = 999
      inherited bbtnConfirmar: TBitBtn
        ParentBiDiMode = False
      end
    end
    object btnProcessar: TBitBtn
      Left = 2
      Top = 0
      Width = 105
      Height = 33
      Caption = '&Processar'
      Enabled = False
      TabOrder = 2
      OnClick = btnProcessarClick
      Glyph.Data = {
        06010000424D060100000000000076000000280000000B000000120000000100
        0400000000009000000000000000000000001000000010000000000000000000
        80000080000000808000800000008000800080800000C0C0C000808080000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333333A
        000033833333333F00003088333333380000300883333337000030A088333338
        000030AA088333300000307A70883338000030AAAA08833F000030A7A7A08837
        000030AAAAAA03300000307A7A703338000030AAAA033338000030A7A0333330
        000030AA0333333800003070333333380000300333333338000030333333333F
        00003333333333300000}
      Spacing = 6
    end
    object bbtnDesfazer: TmaHelpBitBtn
      Left = 107
      Top = 0
      Width = 104
      Height = 33
      Caption = '&Desfazer'
      Enabled = False
      TabOrder = 3
      OnClick = bbtnDesfazerClick
      Glyph.Data = {
        06010000424D060100000000000076000000280000000B000000120000000100
        0400000000009000000000000000000000001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00333333333330
        0000333333333030000033333333003000003333333090300000333333099030
        0000333330999030000033330999903000003330999990300000330999999030
        0000377099999030000033770999903000003337709990300000333377099030
        0000333337709030000033333377003000003333333770300000333333337330
        00003333333333300000}
      ClickHelpContext = 0
    end
  end
  object btnDelete: TBitBtn [3]
    Left = 900
    Top = 162
    Width = 295
    Height = 41
    Caption = 'Deletar Dívida de Benefício'
    Default = True
    Enabled = False
    TabOrder = 3
    OnClick = btnDeleteClick
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 80
    Top = 234
    TargetsData = (
      1
      5
      (
        'TDBMemo'
        'Text'
        0)
      (
        ''
        'DisplayLabel'
        0)
      (
        'TMemo'
        'Text'
        0)
      (
        ''
        'Filter'
        0)
      (
        'TRealEdit'
        'Text'
        0))
  end
  inherited dsDet: TwwDataSource
    DataSet = qryDet
    Left = 443
    Top = 234
  end
  inherited ds: TwwDataSource
    Left = 242
    Top = 234
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update pessoa set nome = '#39'teste'#39
      'where 1=2')
    Left = 202
    Top = 234
  end
  inherited MontaSelect: TMontaSelect
    Caption = ''
    Colunas.Strings = (
      
        '(SELECT MATRICULA FROM DEPENTIT WHERE DEPENTIT.IDPESSOA = CONTRO' +
        'LEDIVIDABENEFICIO.IDPESSOA AND DEPENTIT.IDTITULAR = CONTROLEDIVI' +
        'DABENEFICIO.IDTITULAR)'
      
        '(SELECT NOME FROM PESSOA  WHERE IDPESSOA = CONTROLEDIVIDABENEFIC' +
        'IO.IDPESSOA AND IDTITULAR = CONTROLEDIVIDABENEFICIO.IDTITULAR)'
      
        '(SELECT NOME FROM PLANPREV WHERE IDPLANOPREV = CONTROLEDIVIDABEN' +
        'EFICIO.IDPLANOPREV)'
      
        'DECODE(CONTROLEDIVIDABENEFICIO.FONTEPAGADORA,1,'#39'FUNCEF'#39',2,'#39'INSS'#39 +
        ')'
      
        '(SELECT NOME FROM BENEFICIO WHERE BENEFICIO.IDBENEFICIO = CONTRO' +
        'LEDIVIDABENEFICIO.IDBENEFICIO)'
      'CONTROLEDIVIDABENEFICIO.IDCONTROLEDIVIDABENEFICIO')
    TipodeDado.Strings = (
      'C'
      'C'
      'C'
      'C'
      'C'
      'C')
    Descricao.Strings = (
      'Matrícula'
      'Nome'
      'Plano Previdenciário'
      'Patrocinadora'
      'Benefício'
      'Código da Dívida')
    SensivelACaixa.Strings = (
      'N'
      'N'
      'N'
      'N'
      'N'
      'N')
    Tabelas.Strings = (
      'CONTROLEDIVIDABENEFICIO')
    CamposChave.Strings = (
      'CONTROLEDIVIDABENEFICIO.IDTITULAR'
      'CONTROLEDIVIDABENEFICIO.IDPESSOA'
      'CONTROLEDIVIDABENEFICIO.IDPLANOPREV'
      'CONTROLEDIVIDABENEFICIO.IDBENEFICIO'
      'CONTROLEDIVIDABENEFICIO.SALDODEVEDORINICIAL'
      'CONTROLEDIVIDABENEFICIO.MESINICIO'
      'CONTROLEDIVIDABENEFICIO.MESFIM'
      'CONTROLEDIVIDABENEFICIO.VALORULTIMAPARCELA'
      'CONTROLEDIVIDABENEFICIO.IDCONTROLEDIVIDABENEFICIO')
    Mascaras.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Larguras.Strings = (
      '10'
      '10'
      '10'
      '10'
      '10'
      '18')
    OperComparador.Strings = (
      '0'
      '0'
      '0'
      '0'
      '0'
      '0')
    LookupSQL.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoChave.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    LookupCampoExibe.Strings = (
      ''
      ''
      ''
      ''
      ''
      '')
    Left = 283
    Top = 234
  end
  inherited ImlPadrao: TImageList
    Left = 121
    Top = 234
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'select 1 from dual')
    Left = 161
    Top = 234
  end
  object qryDet: TwwQuery
    AutoCalcFields = False
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    RequestLive = True
    SQL.Strings = (
      'SELECT '#39'N'#39' "SELECIONAR",'
      '       c.flgstatus,'
      
        '       decode(c.flgstatus, 1, '#39'Ativa'#39', 2, '#39'Suspensa'#39', 3, '#39'Encerr' +
        'ada'#39', '#39#39') as StatusDivida,'
      '       c.observacao as motivo,'
      '       h.tipopagamento,'
      '       H.FLGDEVOLUCAO,'
      '       c.FLGQUITADO,'
      '       '#39'Boleto'#39' as tipopagto,'
      '       C.IDCONTROLEDIVIDABENEFICIO,'
      '       H.IDHSTORICODIVIDABENEFICIO,'
      '       C.IDPESSOA,'
      '       C.IDTITULAR,'
      '       C.IDPESSJUR,'
      '       C.IDBENEFICIO,'
      '       C.IDPLANOPREV,'
      '       C.IDMOTIVO,'
      '       c.VALORPARCELA,'
      '       H.IDHISTORICODIVIDABENEFICIOREF ,'
      '       H.MESCOBRANCA,'
      '       H.MESREFERENCIA,'
      '       H.VALORPREVISTO,'
      '       H.VALORRECEBIDO,'
      '       H.DATAPREVISTA,'
      '       H.DATAEFETIVA,'
      '       H.NUMEROPARCELA,'
      '       C.QUANTIDADEPARCELASPAGAS,'
      '       NVL(H.CODPORTFORMA,0) AS CODPORTFORMA,'
      '       P.DESCRICAO,       '
      '       H.FLGSITUACAO AS FLGSITUACAO2,'
      
        '       decode(H.FLGSITUACAO,0,'#39'Preparada'#39','#39'1'#39','#39'Enviada'#39','#39'2'#39','#39'Env' +
        'iada e Não Recebida'#39',3,'#39'Recebida'#39',4,'#39'Recebida com Divergência'#39',5' +
        ','#39'Suspensa'#39')FLGSITUACAO,'
      '       H.OBSERVACAO,'
      '       C.MESINICIO,'
      '       C.Qtdeparcelas,'
      '       H.CODDOCUMENTO,'
      
        '       (select matricula from depentit d where d.idpessoa = c.id' +
        'pessoa and d.idtitular = c.idtitular) as "Matrícula",'
      '       C.SALDODEVEDORINICIAL,'
      '       C.SALDODEVEDORATUAL,'
      '       C.SALDOPROVPERDA,'
      '       C.SALDOBAIXADEF,'
      '       H.VLRPROVPERDA,'
      '       H.VLRBAIXADEF,'
      '       H.VLRREVPROVISAO,'
      '       H.VLRREVBAIXADEF,'
      '       H.PLNCODIGO,'
      '      /* SIG 132927 */'
      '       (SELECT PI.IDPLANPREVCONTAB '
      '         FROM BENEFBFCIARIO BF  '
      '         JOIN PERFILINVEST PI '
      '         ON PI.IDPERFILINVEST = BF.IDPERFILINVEST '
      '         WHERE BF.IDPESSOA    = C.IDPESSOA                '
      '         AND BF.IDTITULAR   = C.IDTITULAR               '
      '         AND BF.IDPESSJUR   = C.IDPESSJUR               '
      '         AND BF.IDPLANOPREV = C.IDPLANOPREV             '
      '         AND BF.IDBENEFICIO = C.IDBENEFICIO            '
      
        '         AND BF.NUMEROPROCESSO = C.NUMEROPROCESSO) AS IDPLANPREV' +
        'CONTAB      '
      
        '  FROM HSTDIVIDABENEFICIO H,CONTROLEDIVIDABENEFICIO C ,PORTADORF' +
        'ORMA P   '
      ' WHERE '
      '   C.IDCONTROLEDIVIDABENEFICIO = H.IDCONTROLEDIVIDABENEFICIO'
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    UpdateObject = updDet
    ControlType.Strings = (
      'SELECIONAR;CheckBox;S;N')
    ValidateWithMask = True
    Left = 345
    Top = 232
    object qryDetSELECIONAR: TStringField
      DisplayLabel = 'Selecionar'
      DisplayWidth = 8
      FieldName = 'SELECIONAR'
      FixedChar = True
      Size = 1
    end
    object qryDetMESREFERENCIA: TStringField
      DisplayLabel = 'Referência'
      DisplayWidth = 8
      FieldName = 'MESREFERENCIA'
      Size = 7
    end
    object qryDetMESCOBRANCA: TStringField
      DisplayLabel = 'Cobrança'
      DisplayWidth = 7
      FieldName = 'MESCOBRANCA'
      Size = 7
    end
    object qryDetVALORPREVISTO: TFloatField
      DisplayLabel = 'Vl Previsto'
      DisplayWidth = 10
      FieldName = 'VALORPREVISTO'
      DisplayFormat = '#,##0.00'
    end
    object qryDetVALORRECEBIDO: TFloatField
      DisplayLabel = 'Vl Recebido'
      DisplayWidth = 10
      FieldName = 'VALORRECEBIDO'
      DisplayFormat = '#,##0.00'
    end
    object qryDetDATAPREVISTA: TDateTimeField
      DisplayLabel = 'Dt Prevista'
      DisplayWidth = 12
      FieldName = 'DATAPREVISTA'
    end
    object qryDetDATAEFETIVA: TDateTimeField
      DisplayLabel = 'Dt Efetiva'
      DisplayWidth = 12
      FieldName = 'DATAEFETIVA'
    end
    object qryDetNUMEROPARCELA: TFloatField
      DisplayLabel = 'Número Parcela'
      DisplayWidth = 12
      FieldName = 'NUMEROPARCELA'
    end
    object qryDetQUANTIDADEPARCELASPAGAS: TFloatField
      DisplayLabel = 'Parcelas Pagas'
      DisplayWidth = 12
      FieldName = 'QUANTIDADEPARCELASPAGAS'
    end
    object qryDetDESCRICAO: TStringField
      DisplayLabel = 'Forma Pagamento'
      DisplayWidth = 25
      FieldName = 'DESCRICAO'
      Size = 50
    end
    object qryDetFLGSITUACAO: TStringField
      DisplayLabel = 'Situação'
      DisplayWidth = 10
      FieldName = 'FLGSITUACAO'
      Size = 24
    end
    object qryDetOBSERVACAO: TStringField
      DisplayLabel = 'Observação'
      DisplayWidth = 30
      FieldName = 'OBSERVACAO'
      Size = 100
    end
    object qryDetTIPOPAGTO: TStringField
      DisplayLabel = 'Tipo de Pagamento'
      DisplayWidth = 10
      FieldName = 'TIPOPAGTO'
      FixedChar = True
      Size = 6
    end
    object qryDetIDHISTORICODIVIDABENEFICIOREF: TFloatField
      DisplayLabel = 'Referência'
      DisplayWidth = 10
      FieldName = 'IDHISTORICODIVIDABENEFICIOREF'
      Visible = False
    end
    object qryDetCODPORTFORMA: TFloatField
      DisplayLabel = 'Forma'
      DisplayWidth = 10
      FieldName = 'CODPORTFORMA'
      Visible = False
    end
    object qryDetIDCONTROLEDIVIDABENEFICIO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDCONTROLEDIVIDABENEFICIO'
      Visible = False
    end
    object qryDetIDHSTORICODIVIDABENEFICIO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDHSTORICODIVIDABENEFICIO'
      Visible = False
    end
    object qryDetIDPESSOA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSOA'
      Visible = False
    end
    object qryDetIDTITULAR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTITULAR'
      Visible = False
    end
    object qryDetIDPESSJUR: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPESSJUR'
      Visible = False
    end
    object qryDetIDBENEFICIO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDBENEFICIO'
      Visible = False
    end
    object qryDetIDPLANOPREV: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANOPREV'
      Visible = False
    end
    object qryDetIDMOTIVO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDMOTIVO'
      Visible = False
    end
    object qryDetFLGSITUACAO2: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGSITUACAO2'
      Visible = False
    end
    object qryDetVALORPARCELA: TFloatField
      DisplayWidth = 10
      FieldName = 'VALORPARCELA'
      Visible = False
      DisplayFormat = '#,##0.00'
    end
    object qryDetMESINICIO: TDateTimeField
      DisplayWidth = 18
      FieldName = 'MESINICIO'
      Visible = False
    end
    object qryDetQTDEPARCELAS: TFloatField
      DisplayWidth = 10
      FieldName = 'QTDEPARCELAS'
      Visible = False
    end
    object qryDetMatricula: TStringField
      DisplayWidth = 15
      FieldName = 'Matricula'
      Visible = False
      Size = 15
    end
    object qryDetCODDOCUMENTO: TStringField
      DisplayWidth = 10
      FieldName = 'CODDOCUMENTO'
      Visible = False
      FixedChar = True
      Size = 10
    end
    object qryDetFLGSTATUS: TFloatField
      FieldName = 'FLGSTATUS'
      Visible = False
    end
    object qryDetSTATUSDIVIDA: TStringField
      FieldName = 'STATUSDIVIDA'
      Visible = False
      Size = 9
    end
    object qryDetMOTIVO: TStringField
      FieldName = 'MOTIVO'
      Visible = False
      Size = 100
    end
    object qryDetTIPOPAGAMENTO: TStringField
      FieldName = 'TIPOPAGAMENTO'
      Visible = False
      Size = 1
    end
    object qryDetFLGDEVOLUCAO: TFloatField
      FieldName = 'FLGDEVOLUCAO'
      Visible = False
    end
    object qryDetSALDODEVEDORATUAL: TFloatField
      FieldName = 'SALDODEVEDORATUAL'
      Visible = False
      DisplayFormat = '#,##0.00'
    end
    object qryDetSALDODEVEDORINICIAL: TFloatField
      FieldName = 'SALDODEVEDORINICIAL'
      Visible = False
      DisplayFormat = '#,##0.00'
    end
    object qryDetSALDOPROVPERDA: TFloatField
      FieldName = 'SALDOPROVPERDA'
      Visible = False
      DisplayFormat = '#,##0.00'
    end
    object qryDetSALDOBAIXADEF: TFloatField
      FieldName = 'SALDOBAIXADEF'
      Visible = False
      DisplayFormat = '#,##0.00'
    end
    object qryDetVLRPROVPERDA: TFloatField
      FieldName = 'VLRPROVPERDA'
      Visible = False
      DisplayFormat = '#,##0.00'
    end
    object qryDetVLRBAIXADEF: TFloatField
      FieldName = 'VLRBAIXADEF'
      Visible = False
      DisplayFormat = '#,##0.00'
    end
    object qryDetVLRREVPROVISAO: TFloatField
      FieldName = 'VLRREVPROVISAO'
      Visible = False
      DisplayFormat = '#,##0.00'
    end
    object qryDetVLRREVBAIXADEF: TFloatField
      FieldName = 'VLRREVBAIXADEF'
      Visible = False
      DisplayFormat = '#,##0.00'
    end
    object qryDetPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Visible = False
    end
    object qryDetFLGQUITADO: TFloatField
      FieldName = 'FLGQUITADO'
      Visible = False
    end
    object qryDetIDPLANPREVCONTAB: TFloatField
      DisplayWidth = 10
      FieldName = 'IDPLANPREVCONTAB'
      Visible = False
    end
  end
  object updDet: TUpdateSQL
    Left = 399
    Top = 234
  end
  object query_cab: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      'DISTINCT '
      
        '   (SELECT MATRICULA FROM DEPENTIT WHERE DEPENTIT.IDPESSOA = CON' +
        'TROLEDIVIDABENEFICIO.IDPESSOA AND DEPENTIT.IDTITULAR = CONTROLED' +
        'IVIDABENEFICIO.IDTITULAR) AS MATRICULA ,'
      
        '   (SELECT NOME FROM PESSOA  WHERE IDPESSOA = CONTROLEDIVIDABENE' +
        'FICIO.IDPESSOA AND IDTITULAR = CONTROLEDIVIDABENEFICIO.IDTITULAR' +
        ') AS NOME ,'
      
        '   (SELECT NOME FROM PLANPREV WHERE IDPLANOPREV = CONTROLEDIVIDA' +
        'BENEFICIO.IDPLANOPREV) AS NOMEPLANPREV  ,'
      
        '   DECODE(CONTROLEDIVIDABENEFICIO.FONTEPAGADORA,1,'#39'FUNCEF'#39',2,'#39'IN' +
        'SS'#39') AS FONTEPAGADORA,'
      
        '   (SELECT NOME FROM BENEFICIO WHERE BENEFICIO.IDBENEFICIO = CON' +
        'TROLEDIVIDABENEFICIO.IDBENEFICIO) AS NOMEBENEFICIO ,'
      '   flgstatus,'
      
        '   decode(flgstatus, 1, '#39'Ativa'#39', 2, '#39'Suspensa'#39', 3, '#39'Encerrada'#39', ' +
        #39#39') as StatusDivida,'
      '   observacao as motivo,'
      '   numprocinss,'
      '   IDCONTROLEDIVIDABENEFICIO,'
      '   IDTITULAR,'
      '   IDPESSOA,'
      '   IDPLANOPREV,'
      '   IDBENEFICIO,'
      '    SALDODEVEDORATUAL,'
      '   MESINICIO,'
      '    MESFIM,'
      '    VALORULTIMAPARCELA,'
      '    IDCONTROLEDIVIDABENEFICIO,'
      '   VALORPARCELA,'
      '   SALDODEVEDORINICIAL,'
      '   PERCENTUAL,'
      '   QTDEPARCELAS,'
      '   VALORBENEFICIO,'
      ' (SELECT MAX(DATAEFETIVA)Ult FROM  HSTDIVIDABENEFICIO'
      ' WHERE IDCONTROLEDIVIDABENEFICIO=106'
      ' AND FLGSITUACAO = 3)Ult,'
      '  FLGATUALIZARSALDO,'
      '  FLGPORTFORMA,'
      
        '  decode(nvl(FLGQUITADO,0),0,'#39'NÃO QUITADO'#39','#39'QUITADO'#39') FLGQUITADO' +
        'str, FLGQUITADO,'
      '  QUANTIDADEPARCELASPAGAS'
      'FROM'
      '   CONTROLEDIVIDABENEFICIO'
      ' ')
    UpdateObject = updCap
    ValidateWithMask = True
    Left = 585
    Top = 234
    object query_cabMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 15
    end
    object query_cabNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object query_cabNOMEPLANPREV: TStringField
      FieldName = 'NOMEPLANPREV'
      Size = 50
    end
    object query_cabFONTEPAGADORA: TStringField
      FieldName = 'FONTEPAGADORA'
      Size = 6
    end
    object query_cabNOMEBENEFICIO: TStringField
      FieldName = 'NOMEBENEFICIO'
      Size = 60
    end
    object query_cabIDCONTROLEDIVIDABENEFICIO: TFloatField
      FieldName = 'IDCONTROLEDIVIDABENEFICIO'
    end
    object query_cabIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
    end
    object query_cabIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object query_cabIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object query_cabIDBENEFICIO: TFloatField
      FieldName = 'IDBENEFICIO'
    end
    object query_cabSALDODEVEDORATUAL: TFloatField
      FieldName = 'SALDODEVEDORATUAL'
      DisplayFormat = '#,##0.00'
    end
    object query_cabMESINICIO: TDateTimeField
      FieldName = 'MESINICIO'
    end
    object query_cabMESFIM: TDateTimeField
      FieldName = 'MESFIM'
    end
    object query_cabVALORULTIMAPARCELA: TFloatField
      FieldName = 'VALORULTIMAPARCELA'
      DisplayFormat = '#,##0.00'
    end
    object query_cabIDCONTROLEDIVIDABENEFICIO_1: TFloatField
      FieldName = 'IDCONTROLEDIVIDABENEFICIO_1'
    end
    object query_cabVALORPARCELA: TFloatField
      FieldName = 'VALORPARCELA'
      DisplayFormat = '#,##0.00'
    end
    object query_cabSALDODEVEDORINICIAL: TFloatField
      FieldName = 'SALDODEVEDORINICIAL'
      DisplayFormat = '#,##0.00'
    end
    object query_cabPERCENTUAL: TFloatField
      FieldName = 'PERCENTUAL'
      DisplayFormat = '#,##0.00'
    end
    object query_cabQTDEPARCELAS: TFloatField
      FieldName = 'QTDEPARCELAS'
    end
    object query_cabVALORBENEFICIO: TFloatField
      FieldName = 'VALORBENEFICIO'
      DisplayFormat = '#,##0.00'
    end
    object query_cabULT: TDateTimeField
      FieldName = 'ULT'
    end
    object query_cabFLGATUALIZARSALDO: TFloatField
      FieldName = 'FLGATUALIZARSALDO'
    end
    object query_cabFLGPORTFORMA: TFloatField
      FieldName = 'FLGPORTFORMA'
    end
    object query_cabQUANTIDADEPARCELASPAGAS: TFloatField
      FieldName = 'QUANTIDADEPARCELASPAGAS'
    end
    object query_cabFLGSTATUS: TFloatField
      FieldName = 'FLGSTATUS'
    end
    object query_cabSTATUSDIVIDA: TStringField
      FieldName = 'STATUSDIVIDA'
      Size = 9
    end
    object query_cabMOTIVO: TStringField
      FieldName = 'MOTIVO'
      Size = 100
    end
    object query_cabNUMPROCINSS: TStringField
      FieldName = 'NUMPROCINSS'
    end
    object query_cabFLGQUITADOSTR: TStringField
      FieldName = 'FLGQUITADOSTR'
      Size = 11
    end
    object query_cabFLGQUITADO: TFloatField
      FieldName = 'FLGQUITADO'
    end
    object query_cabFLGACAOJUD: TFloatField
      FieldName = 'FLGACAOJUD'
    end
    object query_cabSALDOPROVPERDA: TFloatField
      FieldName = 'SALDOPROVPERDA'
      DisplayFormat = '#,##0.00'
    end
    object query_cabSALDOBAIXADEF: TFloatField
      FieldName = 'SALDOBAIXADEF'
      DisplayFormat = '#,##0.00'
    end
    object query_cabFLGDESCFOLHA: TStringField
      FieldName = 'FLGDESCFOLHA'
    end
  end
  object dscab: TwwDataSource
    DataSet = query_cab
    Left = 690
    Top = 234
  end
  object updCap: TUpdateSQL
    ModifySQL.Strings = (
      'update controledividabeneficio'
      'set'
      '  observacao = :motivo,'
      '  flgstatus  = :flgstatus,'
      '  flgquitado = :flgquitado,'
      '  flgacaojud = :flgacaojud'
      'where'
      '  idcontroledividabeneficio = :OLD_idcontroledividabeneficio'
      ' '
      ' ')
    Left = 642
    Top = 242
  end
  object ppReport1: TppReport
    AutoStop = False
    DataPipeline = ppBDEPipeline1
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 817
    Top = 225
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'ppBDEPipeline1'
    object ppTitleBand1: TppTitleBand
      mmBottomOffset = 0
      mmHeight = 48683
      mmPrintPosition = 0
      object ppLabel41: TppLabel
        UserName = 'Label41'
        Caption = 'Fundação dos Economiários Federais'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6562
        mmLeft = 27940
        mmTop = 5927
        mmWidth = 245110
        BandType = 1
      end
      object ppLabel53: TppLabel
        UserName = 'Label53'
        Caption = 
          'SCN, Quadra 02, Bloco A, Edifício Corporate Financial Center 12 ' +
          'e 13 Andares'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3810
        mmLeft = 27728
        mmTop = 13970
        mmWidth = 244899
        BandType = 1
      end
      object ppLabel54: TppLabel
        UserName = 'Label54'
        Caption = 'Brasília DF CEP 70.712-900 - (061) 3329-1700 - www.funcef.com.br'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3810
        mmLeft = 27728
        mmTop = 17992
        mmWidth = 245110
        BandType = 1
      end
      object ppLabel56: TppLabel
        UserName = 'Label56'
        Caption = 
          'CNPJ: 03.296.968/0001-03 - Incrição Estadual: 01.001.001 - 001 -' +
          '01'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3810
        mmLeft = 27728
        mmTop = 22013
        mmWidth = 245322
        BandType = 1
      end
      object ppLabel68: TppLabel
        UserName = 'Label401'
        Caption = 'HISTÓRICO DE DÍVIDAS DE BENEFÍCIOS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5842
        mmLeft = 102236
        mmTop = 36830
        mmWidth = 96944
        BandType = 1
      end
      object ppSystemVariable1: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtDateTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3810
        mmLeft = 243629
        mmTop = 44873
        mmWidth = 29422
        BandType = 1
      end
      object ppLabel1: TppLabel
        UserName = 'Label1'
        Caption = 'Emissão:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3810
        mmLeft = 227754
        mmTop = 44873
        mmWidth = 14605
        BandType = 1
      end
      object ppImage1: TppImage
        UserName = 'Image1'
        MaintainAspectRatio = False
        Picture.Data = {
          0A544A504547496D616765500C0000FFD8FFE000104A46494600010101006000
          600000FFDB004300080606070605080707070909080A0C140D0C0B0B0C191213
          0F141D1A1F1E1D1A1C1C20242E2720222C231C1C2837292C30313434341F2739
          3D38323C2E333432FFDB0043010909090C0B0C180D0D1832211C213232323232
          3232323232323232323232323232323232323232323232323232323232323232
          32323232323232323232323232FFC00011080067007203012200021101031101
          FFC4001F0000010501010101010100000000000000000102030405060708090A
          0BFFC400B5100002010303020403050504040000017D01020300041105122131
          410613516107227114328191A1082342B1C11552D1F02433627282090A161718
          191A25262728292A3435363738393A434445464748494A535455565758595A63
          6465666768696A737475767778797A838485868788898A92939495969798999A
          A2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6
          D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F01000301
          01010101010101010000000000000102030405060708090A0BFFC400B5110002
          0102040403040705040400010277000102031104052131061241510761711322
          328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728
          292A35363738393A434445464748494A535455565758595A636465666768696A
          737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7
          A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3
          E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00F7FA
          2A1F31A8F31A8026A2A1F31A97CC34012D151893D4572DF11BC512F853C1D3EA
          36A07DA5DD6084B0C8566CF27F234E3172764075267883EC32287FEE93CD499A
          F8C67D5350B9BC6BB9EFEE64B9277199A56DD9F5CE78FC2BDE3E0BF8C6FF005D
          B2BCD275399EE26B10AF1CF21CB346490031EE411D6BA2AE19C23CD71D8F56A2
          A3327A52798D5CC225A2A1F31A8F31A8026A2A1F31AA4425864D003A8A28A008
          7CB3ED4796D535713E3DF8890F815EC965D364BCFB5062364A136E31D720FAD5
          462E4EC80EC3CB6A4208EA2BC77FE1A12CFF00E85D9FFF000297FF0089A46FDA
          0ACCF5F0ECFF00F816BFFC4D6BF57ABD80F62AE7BC6FE1A1E2BF0ADD6961C473
          1C49039E8245E99FCCD79EFF00C34059FF00D0BB71F85DAFFF00135734EF8EDA
          3DCDE2C57FA5DD5942C71E7798250A7DC0038A6A8D58BBD86793DCF80BC59697
          8D68FA05FBC8AC5434509746F70C38239EB5ED7F09FC0D75E15D3AEAF7524097
          F7BB41881CF9718E80FBE49AF43B3BB82F6CA3BAB599268245DD1C887208F506
          BCEBC49F19342D0EF5ACECE09754990ED90C4C1507D1B07354EAD4AAB9120B9E
          8D462BC73FE17FD9E7FE45DB8FFC0B5FFE26957F682B31FF0032ECFF00F816BF
          FC4D47D5EAF6158F64F2DA8F2DABC77FE1A12D3FE85D9FFF000297FF0089ADDF
          087C5EB7F17788A0D1E3D1E5B669559BCC69D580DA33D00F6A4E8544AED01E8D
          E5B7B53D14A8C1A514B588051451400567EA5A1E97AC18CEA36305D7979D9E6A
          E76E7AE2B428A13B6C0601F04F863FE80765FF007E8521F05786003FF123B2FF
          00BF42B6AE9DD2DA478C65D54951EF5C8E93A8EA126AC8AF249207243A37403F
          A57162B32586AB0A524DF31BD2A12A909493D8BCDE09F0C3A156D0AC883C11E5
          D7CF1F117C3B69E18F17CF61605FECC5165456EA991D33F5AFA97DABE71F8D1F
          F23FBFFD7B47FCABD8C2CA5CF6B98A2F7843C4B7F61F077C51141211F6378E38
          9B3CA2CCDB5B1E98EA2BCE749B21A8EB16562CE516E2658CB01D327922BADF0E
          FF00C925F1AFFD77B2FF00D195CEF85FFE46CD27FEBED3F9D75C55B99AFEB419
          F4BD97C3FF000B69F691DB47A35B3AC631BE45DCCDEE4D5B4F0578608FF901D9
          7FDFB15B4DD4FD6B9DF115E5E5BC90A44EF1C2464B2F193F5AF071B8DFAAD175
          A5776EC5D1A4EACD4132C8F04F860FFCC0EC7FEFD0AB363E17D134CBA5BAB1D2
          ED6DE750409234C119A93429EE2E34B47B9CEFC9193D48F5AD2CD6B46BBAD4D4
          D5ECD1138B849C5F4168A28AB2428A28A002A95FB6A0BB3EC2903673BBCD278F
          4C63F1ABB486B3A90E78F2DDAF42A32E577B5CE7AF352D66C23135C5B5A98B38
          2509E3F5A2EB5D820B3867B6810CD382718C631EB56BC4BFF2067FF797F9D727
          3FFC79D97D1BF9D7CCE618AAF84AB2A709B7EEA6AFAB4EF6D0F4F0F4A9D68A93
          56D7A75D0E912E35C7456F22D06467049FF1AF04F8C0666F1BE6E0209BECC9B8
          274AFA3D54EC5C9EC2BE75F8D1FF0023FBFF00D7B47FCABEAF2EA0E9D4BB9B96
          9D7FE18F3E7514B4514BD0A9E1DFF924BE35FF00AEF65FFA32B9CF0CE7FE12AD
          271D7ED49FCEBA3F0EFF00C925F1A7FD77B2FF00D195CEF8639F15E93FF5F69F
          CEBD55F6BFAE841F52B4BAEEF6C4366464E33BBFC6A2B2D65A5BC7B2D4608D59
          727819191F5CD6E37DE3F5AE42E3FE4659FEA7F957C6660EA613D9CE336EF2B3
          4F5563B30EA3579938A565D0D2835AD42FEE244D3EDA0F293BC99E076E86B46D
          1F576B9517715AAC383931E73593E10E7ED5FF0001FEB5D456995AA988A11AF5
          2A3BB6F4E9BF6B138AE5A7374E3156403039A01CD0466851815EC9C62D145140
          11824507269075A90F4A6062F88FFE40D27FBCB5CB4FFF001E765F46FE75D66B
          D1493692E91A33B6E070A326B9B9AC2ECDA5A0FB34B95073F29E39AF90CF294E
          589938A6FDD5FF00A51EBE065154D5DF57F91D7293B17E82BE77F8D1FF0023FB
          FF00D7B47FCABE885E117E82BC13E2FE8DAADEF8E1A6B4D2EFAE22FB3A0F321B
          6775CFA640AFB7C2594F53C9EA63F877FE492F8D3FEBBD97FE8CAE73C31FF235
          E93FF5F69FCEBB1D0744D5E2F85DE2FB69349D41279A6B43144D6AE19C093276
          8C64E3DAB03C37E1ED722F13E97249A2EA491ADCA1676B4900033D49238AEC52
          5EF6BFD580FAA09F9CFD6B93B839F12CC7DCFF002AEADBEF1E7BD73335A5CB78
          826956090A1270C14E3A57C8679094A9D3E557F791D982694A57EC4DE12EB75F
          45FEB5D39C9AE77C316D3C1F69F3A278F2171B8633D6BA451C56D92C5C705052
          567AFE6C8C634EBC9A13185A54E94ADF7685E95EA1CA2D145140118EB58DE23F
          16E8DE168E07D5EE8C0272563C216C90327A56E6D1E95E31F1FF00FE3D345E3A
          CAFF00CAB4A51539A8B03B6D2BE2578575AD4E0D3EC350696EA73B635F29864F
          D715A1A3F8CB43F115FDD69FA6DD34B736E09917CB65C60ED3C9F7AE63C1D61A
          B8D4EDA4D43C1BA1585B2C0592F2D625F34360639F7E6B91F83B85F88DE228DB
          01B130DA4F7130AD1D38D9B5D067A6D9F8CB43D435D9F45B6BB67D420DDE6446
          3200DBF7B9A9342F19E87E25B99ED349BEF3678065D194A1C648E33D79F4AF28
          F06E25F8E1AE327CE99B9F9872318F5AE2FC3B3EA9A26A3378A74F05A1D3AE55
          6E94778DC9EBEC707F4AD3D845DECFA20B1F4668FE31D175CD52EF4AD3EF1E5B
          CB5566950A30C00C14F3DF922A9EABF11FC2BA3DDBDA5E6AC82743B592305F69
          F438AF24F87BA834BE24F196A7641C3B6957371083D41DC081F5CD6BFC1DF0FE
          87ACF87F5ABAD52D60BA9FCEF2D9A6018C69B73919E87393BA94A8C6376FA582
          C7A8CFE29D120F0F9D70DFC7269A3199E2F9C0C903A0FAD62A7C5EF052AE0EA8
          D9EA7F70FF00E15C7EB569E16B0F84DAEDBF85EFCDDC2258DA7DD2162ADBC0FE
          9DBD2B2FC1D61E269FC3169269FE0EF0D6A16A73B6E6F610D2BF3CE49342A50B
          37AEFE8163D5B54F883E1BD1E0B19AF6F9A34BE816E2022263BA33D0F038A7E8
          3F10BC37E23D4469FA65F19AE4A1709E5B0E075E48AF2AF8C513C7AFF86215B5
          855D6DE3516E8A0479DFF700FEEF6FA57A2F836C3548B539A4D4FC25A2692163
          FDDCF631A87639E991DB1512A7154D480EDD8E5684E94B8A00C573885A28A280
          0AE47C71E02B6F1BC566971792DB7D998B02881B39FAD14538C9C5DD01D4C10F
          910471039D8A1727BE062BCFBC41F0874BD635B9756B4D42EF4D9E6E6516C701
          9BB91C8C67BD14538CE51774C0D1F077C3DD2FC1AB7325B4935C5DDCAEC92E25
          EBB7D00EDCD47E18F873A7F872DB55B633BDEC1A900B2A4A800039E9CFBD1453
          7526EF77B80CF06FC32B1F076A9777F6D7B35C0B881A0F2A64180A581FC7A62B
          1EFF00E0B6953DF5C4FA7EAB7FA74339CB5BC272BCF51D471ED4514FDACEF7B8
          1B03E1A69107832E7C3768F2411DC9569AE701A476041C9FF0ED5811FC0CB544
          0B1F893528D07454E00FC035145355A6BA81B7AAFC2BB4D5BFB0FCED52E41D26
          28E3562A18CBB5B765893D6BBFC5145439396E02D1451520145145007FFFD9}
        mmHeight = 28152
        mmLeft = 1058
        mmTop = 5715
        mmWidth = 26247
        BandType = 1
      end
    end
    object ppHeaderBand3: TppHeaderBand
      BeforePrint = ppHeaderBand3BeforePrint
      mmBottomOffset = 0
      mmHeight = 59531
      mmPrintPosition = 0
      object ppLabel2: TppLabel
        UserName = 'Label2'
        Caption = 'Referência'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 0
        mmTop = 55563
        mmWidth = 13674
        BandType = 0
      end
      object ppLabel3: TppLabel
        UserName = 'Label3'
        Caption = 'Cobrança'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 16139
        mmTop = 55563
        mmWidth = 12234
        BandType = 0
      end
      object ppLabel5: TppLabel
        UserName = 'Label5'
        Caption = 'Valor Previsto'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 30163
        mmTop = 55563
        mmWidth = 18255
        BandType = 0
      end
      object ppLabel6: TppLabel
        UserName = 'Label6'
        Caption = 'Valor Efetivo'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 50272
        mmTop = 55563
        mmWidth = 18255
        BandType = 0
      end
      object ppLabel8: TppLabel
        UserName = 'Label8'
        Caption = 'Data Prevista'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 70114
        mmTop = 55563
        mmWidth = 17018
        BandType = 0
      end
      object ppLabel10: TppLabel
        UserName = 'Label10'
        Caption = 'Data Efetiva'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3259
        mmLeft = 88900
        mmTop = 55563
        mmWidth = 17018
        BandType = 0
      end
      object ppLabel13: TppLabel
        UserName = 'Label13'
        Caption = 'Número Parcela'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 3259
        mmLeft = 107422
        mmTop = 55563
        mmWidth = 21430
        BandType = 0
      end
      object ppLabel16: TppLabel
        UserName = 'Label16'
        Caption = 'Parcelas Pagas'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 130175
        mmTop = 55563
        mmWidth = 19896
        BandType = 0
      end
      object ppLabel18: TppLabel
        UserName = 'Label18'
        Caption = 'Forma Pagamento'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 151608
        mmTop = 55563
        mmWidth = 23537
        BandType = 0
      end
      object ppLabel23: TppLabel
        UserName = 'Label23'
        Caption = 'Situação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 186266
        mmTop = 55563
        mmWidth = 11049
        BandType = 0
      end
      object ppLabel25: TppLabel
        UserName = 'Label25'
        Caption = 'Observação'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 203200
        mmTop = 55563
        mmWidth = 15240
        BandType = 0
      end
      object ppLabel4: TppLabel
        UserName = 'Label4'
        Caption = 'Matrícula:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 0
        mmTop = 847
        mmWidth = 16679
        BandType = 0
      end
      object ppLabel7: TppLabel
        UserName = 'Label7'
        Caption = 'Nome:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 0
        mmTop = 5503
        mmWidth = 10964
        BandType = 0
      end
      object ppLabel9: TppLabel
        UserName = 'Label9'
        Caption = 'Código da Dívida do Benefício:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 0
        mmTop = 10160
        mmWidth = 52070
        BandType = 0
      end
      object ppLabel11: TppLabel
        UserName = 'Label11'
        Caption = 'Data Início Cobrança:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 0
        mmTop = 14817
        mmWidth = 36153
        BandType = 0
      end
      object ppLabel12: TppLabel
        UserName = 'Label12'
        Caption = 'Data Final Cobrança:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 0
        mmTop = 19474
        mmWidth = 35179
        BandType = 0
      end
      object ppLabel14: TppLabel
        UserName = 'Label14'
        Caption = 'Benefício:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 0
        mmTop = 24130
        mmWidth = 17018
        BandType = 0
      end
      object ppLabel15: TppLabel
        UserName = 'Label15'
        Caption = 'Saldo Devedor Atual:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 0
        mmTop = 28786
        mmWidth = 35348
        BandType = 0
      end
      object ppLabel17: TppLabel
        UserName = 'Label17'
        Caption = 'Valor da Última Parcela:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 0
        mmTop = 33443
        mmWidth = 39963
        BandType = 0
      end
      object ppLabel20: TppLabel
        UserName = 'Label20'
        Caption = 'Label20'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 18203
        mmTop = 847
        mmWidth = 12446
        BandType = 0
      end
      object ppLabel21: TppLabel
        UserName = 'Label21'
        Caption = 'Label21'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 12488
        mmTop = 5504
        mmWidth = 12446
        BandType = 0
      end
      object ppLabel22: TppLabel
        UserName = 'Label22'
        Caption = 'Label22'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 53552
        mmTop = 10160
        mmWidth = 12446
        BandType = 0
      end
      object ppLabel24: TppLabel
        UserName = 'Label24'
        Caption = 'Label24'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 37677
        mmTop = 14816
        mmWidth = 12446
        BandType = 0
      end
      object ppLabel26: TppLabel
        UserName = 'Label26'
        Caption = 'Label26'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 36830
        mmTop = 19474
        mmWidth = 12446
        BandType = 0
      end
      object ppLabel27: TppLabel
        UserName = 'Label27'
        Caption = 'Label27'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 18415
        mmTop = 24130
        mmWidth = 12446
        BandType = 0
      end
      object ppLabel28: TppLabel
        UserName = 'Label28'
        Caption = 'Label28'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 36618
        mmTop = 28786
        mmWidth = 12446
        BandType = 0
      end
      object ppLabel29: TppLabel
        UserName = 'Label29'
        Caption = 'Label29'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 41275
        mmTop = 33444
        mmWidth = 12446
        BandType = 0
      end
      object ppShape1: TppShape
        UserName = 'Shape1'
        mmHeight = 4657
        mmLeft = 14552
        mmTop = 54769
        mmWidth = 212
        BandType = 0
      end
      object ppShape2: TppShape
        UserName = 'Shape2'
        mmHeight = 4656
        mmLeft = 29104
        mmTop = 54769
        mmWidth = 212
        BandType = 0
      end
      object ppShape3: TppShape
        UserName = 'Shape3'
        mmHeight = 4656
        mmLeft = 49213
        mmTop = 54769
        mmWidth = 212
        BandType = 0
      end
      object ppShape4: TppShape
        UserName = 'Shape4'
        mmHeight = 4656
        mmLeft = 69056
        mmTop = 54769
        mmWidth = 212
        BandType = 0
      end
      object ppShape5: TppShape
        UserName = 'Shape5'
        mmHeight = 4656
        mmLeft = 87577
        mmTop = 54769
        mmWidth = 212
        BandType = 0
      end
      object ppShape6: TppShape
        UserName = 'Shape6'
        mmHeight = 4656
        mmLeft = 106363
        mmTop = 54769
        mmWidth = 212
        BandType = 0
      end
      object ppShape7: TppShape
        UserName = 'Shape7'
        mmHeight = 4656
        mmLeft = 129382
        mmTop = 54769
        mmWidth = 212
        BandType = 0
      end
      object ppShape8: TppShape
        UserName = 'Shape8'
        mmHeight = 4656
        mmLeft = 150548
        mmTop = 54769
        mmWidth = 212
        BandType = 0
      end
      object ppShape9: TppShape
        UserName = 'Shape9'
        mmHeight = 4656
        mmLeft = 185473
        mmTop = 54769
        mmWidth = 212
        BandType = 0
      end
      object ppShape10: TppShape
        UserName = 'Shape10'
        mmHeight = 4656
        mmLeft = 202142
        mmTop = 54769
        mmWidth = 212
        BandType = 0
      end
      object ppLabel19: TppLabel
        UserName = 'Label19'
        Caption = 'Status da Dívida:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 0
        mmTop = 38100
        mmWidth = 28575
        BandType = 0
      end
      object ppLabel30: TppLabel
        UserName = 'Label30'
        Caption = 'Observação Sobre a Dívida:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 0
        mmTop = 42863
        mmWidth = 46736
        BandType = 0
      end
      object ppLabel32: TppLabel
        UserName = 'Label301'
        Caption = 'Número do Benefício INSS:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 4191
        mmLeft = 0
        mmTop = 47625
        mmWidth = 45720
        BandType = 0
      end
      object ppLabel33: TppLabel
        UserName = 'Label33'
        Caption = 'Label33'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 29633
        mmTop = 38100
        mmWidth = 12446
        BandType = 0
      end
      object ppLabel34: TppLabel
        UserName = 'Label34'
        Caption = 'Label34'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 47890
        mmTop = 43127
        mmWidth = 12435
        BandType = 0
      end
      object ppLabel35: TppLabel
        UserName = 'Label35'
        Caption = 'Label35'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 3969
        mmLeft = 46831
        mmTop = 47890
        mmWidth = 12435
        BandType = 0
      end
      object ppLabel36: TppLabel
        UserName = 'Label36'
        Caption = 'Tipo Pagamento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 262202
        mmTop = 55563
        mmWidth = 20744
        BandType = 0
      end
      object ppShape11: TppShape
        UserName = 'Shape101'
        mmHeight = 4656
        mmLeft = 261409
        mmTop = 54504
        mmWidth = 212
        BandType = 0
      end
    end
    object ppDetailBand3: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 6350
      mmPrintPosition = 0
      object ppShape17: TppShape
        UserName = 'Shape11'
        mmHeight = 4233
        mmLeft = 212
        mmTop = 1905
        mmWidth = 283105
        BandType = 4
      end
      object ppDBText1: TppDBText
        UserName = 'DBText1'
        DataField = 'MESREFERENCIA'
        DataPipeline = ppBDEPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEPipeline1'
        mmHeight = 3260
        mmLeft = 635
        mmTop = 2328
        mmWidth = 12172
        BandType = 4
      end
      object ppDBText2: TppDBText
        UserName = 'DBText2'
        DataField = 'MESCOBRANCA'
        DataPipeline = ppBDEPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppBDEPipeline1'
        mmHeight = 3175
        mmLeft = 16139
        mmTop = 2329
        mmWidth = 12172
        BandType = 4
      end
      object ppDBText3: TppDBText
        UserName = 'DBText3'
        DataField = 'VALORPREVISTO'
        DataPipeline = ppBDEPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipeline1'
        mmHeight = 3175
        mmLeft = 30163
        mmTop = 2328
        mmWidth = 18255
        BandType = 4
      end
      object ppDBText4: TppDBText
        UserName = 'DBText4'
        DataField = 'VALORRECEBIDO'
        DataPipeline = ppBDEPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEPipeline1'
        mmHeight = 3175
        mmLeft = 50272
        mmTop = 2329
        mmWidth = 18255
        BandType = 4
      end
      object ppDBText5: TppDBText
        UserName = 'DBText5'
        DataField = 'DATAPREVISTA'
        DataPipeline = ppBDEPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppBDEPipeline1'
        mmHeight = 3175
        mmLeft = 70114
        mmTop = 2329
        mmWidth = 17018
        BandType = 4
      end
      object ppDBText6: TppDBText
        UserName = 'DBText6'
        DataField = 'DATAEFETIVA'
        DataPipeline = ppBDEPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppBDEPipeline1'
        mmHeight = 3175
        mmLeft = 88900
        mmTop = 2329
        mmWidth = 17018
        BandType = 4
      end
      object ppDBText7: TppDBText
        UserName = 'DBText7'
        DataField = 'NUMEROPARCELA'
        DataPipeline = ppBDEPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppBDEPipeline1'
        mmHeight = 3175
        mmLeft = 107422
        mmTop = 2329
        mmWidth = 21430
        BandType = 4
      end
      object ppDBText8: TppDBText
        UserName = 'DBText8'
        DataField = 'QUANTIDADEPARCELASPAGAS'
        DataPipeline = ppBDEPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppBDEPipeline1'
        mmHeight = 3175
        mmLeft = 130175
        mmTop = 2329
        mmWidth = 19896
        BandType = 4
      end
      object ppDBText9: TppDBText
        UserName = 'DBText9'
        DataField = 'DESCRICAO'
        DataPipeline = ppBDEPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEPipeline1'
        mmHeight = 3175
        mmLeft = 151608
        mmTop = 2329
        mmWidth = 32808
        BandType = 4
      end
      object ppDBText10: TppDBText
        UserName = 'DBText10'
        DataField = 'FLGSITUACAO'
        DataPipeline = ppBDEPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEPipeline1'
        mmHeight = 3175
        mmLeft = 186266
        mmTop = 2328
        mmWidth = 14552
        BandType = 4
      end
      object ppDBText11: TppDBText
        UserName = 'DBText101'
        DataField = 'OBSERVACAO'
        DataPipeline = ppBDEPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEPipeline1'
        mmHeight = 3175
        mmLeft = 203200
        mmTop = 2329
        mmWidth = 56886
        BandType = 4
      end
      object ppDBText12: TppDBText
        UserName = 'DBText102'
        DataField = 'TIPOPAGTO'
        DataPipeline = ppBDEPipeline1
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEPipeline1'
        mmHeight = 3175
        mmLeft = 262202
        mmTop = 2329
        mmWidth = 20744
        BandType = 4
      end
    end
    object ppFooterBand2: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5927
      mmPrintPosition = 0
      object ppLabel31: TppLabel
        UserName = 'Label31'
        Caption = 'Histórico de Dívidas de Benefícios \ BenefícioPrev'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 1058
        mmTop = 1270
        mmWidth = 80433
        BandType = 8
      end
      object ppSystemVariable2: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 10
        Font.Style = []
        Transparent = True
        mmHeight = 4022
        mmLeft = 252942
        mmTop = 529
        mmWidth = 21590
        BandType = 8
      end
    end
    object raCodeModule2: TraCodeModule
      ProgramStream = {00}
    end
    object ppParameterList1: TppParameterList
    end
  end
  object ppBDEPipeline1: TppBDEPipeline
    DataSource = dsDet
    CloseDataSource = True
    OpenDataSource = False
    SkipWhenNoRecords = False
    UserName = 'BDEPipeline1'
    Left = 865
    Top = 225
    object ppBDEPipeline1ppField1: TppField
      FieldAlias = 'SELECIONAR'
      FieldName = 'SELECIONAR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 0
      Searchable = False
      Sortable = False
    end
    object ppBDEPipeline1ppField2: TppField
      FieldAlias = 'MESREFERENCIA'
      FieldName = 'MESREFERENCIA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 1
      Searchable = False
      Sortable = False
    end
    object ppBDEPipeline1ppField3: TppField
      FieldAlias = 'MESCOBRANCA'
      FieldName = 'MESCOBRANCA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 2
      Searchable = False
      Sortable = False
    end
    object ppBDEPipeline1ppField4: TppField
      FieldAlias = 'VALORPREVISTO'
      FieldName = 'VALORPREVISTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 3
      Searchable = False
      Sortable = False
    end
    object ppBDEPipeline1ppField5: TppField
      FieldAlias = 'VALORRECEBIDO'
      FieldName = 'VALORRECEBIDO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 4
      Searchable = False
      Sortable = False
    end
    object ppBDEPipeline1ppField6: TppField
      FieldAlias = 'DATAPREVISTA'
      FieldName = 'DATAPREVISTA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 5
      Searchable = False
      Sortable = False
    end
    object ppBDEPipeline1ppField7: TppField
      FieldAlias = 'DATAEFETIVA'
      FieldName = 'DATAEFETIVA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 6
      Searchable = False
      Sortable = False
    end
    object ppBDEPipeline1ppField8: TppField
      FieldAlias = 'NUMEROPARCELA'
      FieldName = 'NUMEROPARCELA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 7
      Searchable = False
      Sortable = False
    end
    object ppBDEPipeline1ppField9: TppField
      FieldAlias = 'QUANTIDADEPARCELASPAGAS'
      FieldName = 'QUANTIDADEPARCELASPAGAS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 8
      Searchable = False
      Sortable = False
    end
    object ppBDEPipeline1ppField10: TppField
      FieldAlias = 'DESCRICAO'
      FieldName = 'DESCRICAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 9
      Searchable = False
      Sortable = False
    end
    object ppBDEPipeline1ppField11: TppField
      FieldAlias = 'FLGSITUACAO'
      FieldName = 'FLGSITUACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 10
      Searchable = False
      Sortable = False
    end
    object ppBDEPipeline1ppField12: TppField
      FieldAlias = 'OBSERVACAO'
      FieldName = 'OBSERVACAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 11
      Searchable = False
      Sortable = False
    end
    object ppBDEPipeline1ppField13: TppField
      FieldAlias = 'TIPOPAGTO'
      FieldName = 'TIPOPAGTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 12
      Searchable = False
      Sortable = False
    end
    object ppBDEPipeline1ppField14: TppField
      FieldAlias = 'IDHISTORICODIVIDABENEFICIOREF'
      FieldName = 'IDHISTORICODIVIDABENEFICIOREF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 13
      Searchable = False
      Sortable = False
    end
    object ppBDEPipeline1ppField15: TppField
      FieldAlias = 'CODPORTFORMA'
      FieldName = 'CODPORTFORMA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 14
      Searchable = False
      Sortable = False
    end
    object ppBDEPipeline1ppField16: TppField
      FieldAlias = 'IDCONTROLEDIVIDABENEFICIO'
      FieldName = 'IDCONTROLEDIVIDABENEFICIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 15
      Searchable = False
      Sortable = False
    end
    object ppBDEPipeline1ppField17: TppField
      FieldAlias = 'IDHSTORICODIVIDABENEFICIO'
      FieldName = 'IDHSTORICODIVIDABENEFICIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 16
      Searchable = False
      Sortable = False
    end
    object ppBDEPipeline1ppField18: TppField
      FieldAlias = 'IDPESSOA'
      FieldName = 'IDPESSOA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 17
      Searchable = False
      Sortable = False
    end
    object ppBDEPipeline1ppField19: TppField
      FieldAlias = 'IDTITULAR'
      FieldName = 'IDTITULAR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 18
      Searchable = False
      Sortable = False
    end
    object ppBDEPipeline1ppField20: TppField
      FieldAlias = 'IDPESSJUR'
      FieldName = 'IDPESSJUR'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 19
      Searchable = False
      Sortable = False
    end
    object ppBDEPipeline1ppField21: TppField
      FieldAlias = 'IDBENEFICIO'
      FieldName = 'IDBENEFICIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 20
      Searchable = False
      Sortable = False
    end
    object ppBDEPipeline1ppField22: TppField
      FieldAlias = 'IDPLANOPREV'
      FieldName = 'IDPLANOPREV'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 21
      Searchable = False
      Sortable = False
    end
    object ppBDEPipeline1ppField23: TppField
      FieldAlias = 'IDMOTIVO'
      FieldName = 'IDMOTIVO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 22
      Searchable = False
      Sortable = False
    end
    object ppBDEPipeline1ppField24: TppField
      FieldAlias = 'FLGSITUACAO2'
      FieldName = 'FLGSITUACAO2'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 23
      Searchable = False
      Sortable = False
    end
    object ppBDEPipeline1ppField25: TppField
      FieldAlias = 'VALORPARCELA'
      FieldName = 'VALORPARCELA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 24
      Searchable = False
      Sortable = False
    end
    object ppBDEPipeline1ppField26: TppField
      FieldAlias = 'MESINICIO'
      FieldName = 'MESINICIO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 25
      Searchable = False
      Sortable = False
    end
    object ppBDEPipeline1ppField27: TppField
      FieldAlias = 'QTDEPARCELAS'
      FieldName = 'QTDEPARCELAS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 26
      Searchable = False
      Sortable = False
    end
    object ppBDEPipeline1ppField28: TppField
      FieldAlias = 'Matrícula'
      FieldName = 'Matricula'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 27
      Searchable = False
      Sortable = False
    end
    object ppBDEPipeline1ppField29: TppField
      FieldAlias = 'CODDOCUMENTO'
      FieldName = 'CODDOCUMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 28
      Searchable = False
      Sortable = False
    end
    object ppBDEPipeline1ppField30: TppField
      FieldAlias = 'FLGSTATUS'
      FieldName = 'FLGSTATUS'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 29
      Searchable = False
      Sortable = False
    end
    object ppBDEPipeline1ppField31: TppField
      FieldAlias = 'STATUSDIVIDA'
      FieldName = 'STATUSDIVIDA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 30
      Searchable = False
      Sortable = False
    end
    object ppBDEPipeline1ppField32: TppField
      FieldAlias = 'MOTIVO'
      FieldName = 'MOTIVO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 31
      Searchable = False
      Sortable = False
    end
    object ppBDEPipeline1ppField33: TppField
      FieldAlias = 'TIPOPAGAMENTO'
      FieldName = 'TIPOPAGAMENTO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 32
      Searchable = False
      Sortable = False
    end
    object ppBDEPipeline1ppField34: TppField
      FieldAlias = 'FLGDEVOLUCAO'
      FieldName = 'FLGDEVOLUCAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 33
      Searchable = False
      Sortable = False
    end
    object ppBDEPipeline1ppField35: TppField
      FieldAlias = 'SALDODEVEDORATUAL'
      FieldName = 'SALDODEVEDORATUAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 34
      Searchable = False
      Sortable = False
    end
    object ppBDEPipeline1ppField36: TppField
      FieldAlias = 'SALDODEVEDORINICIAL'
      FieldName = 'SALDODEVEDORINICIAL'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 35
      Searchable = False
      Sortable = False
    end
    object ppBDEPipeline1ppField37: TppField
      FieldAlias = 'SALDOPROVPERDA'
      FieldName = 'SALDOPROVPERDA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 36
      Searchable = False
      Sortable = False
    end
    object ppBDEPipeline1ppField38: TppField
      FieldAlias = 'SALDOBAIXADEF'
      FieldName = 'SALDOBAIXADEF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 37
      Searchable = False
      Sortable = False
    end
    object ppBDEPipeline1ppField39: TppField
      FieldAlias = 'VLRPROVPERDA'
      FieldName = 'VLRPROVPERDA'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 38
      Searchable = False
      Sortable = False
    end
    object ppBDEPipeline1ppField40: TppField
      FieldAlias = 'VLRBAIXADEF'
      FieldName = 'VLRBAIXADEF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 39
      Searchable = False
      Sortable = False
    end
    object ppBDEPipeline1ppField41: TppField
      FieldAlias = 'VLRREVPROVISAO'
      FieldName = 'VLRREVPROVISAO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 40
      Searchable = False
      Sortable = False
    end
    object ppBDEPipeline1ppField42: TppField
      FieldAlias = 'VLRREVBAIXADEF'
      FieldName = 'VLRREVBAIXADEF'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 41
      Searchable = False
      Sortable = False
    end
    object ppBDEPipeline1ppField43: TppField
      FieldAlias = 'PLNCODIGO'
      FieldName = 'PLNCODIGO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 42
      Searchable = False
      Sortable = False
    end
    object ppBDEPipeline1ppField44: TppField
      FieldAlias = 'FLGQUITADO'
      FieldName = 'FLGQUITADO'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 43
      Searchable = False
      Sortable = False
    end
    object ppBDEPipeline1ppField45: TppField
      FieldAlias = 'IDPLANPREVCONTAB'
      FieldName = 'IDPLANPREVCONTAB'
      FieldLength = 0
      DataType = dtNotKnown
      DisplayWidth = 0
      Position = 44
      Searchable = False
      Sortable = False
    end
  end
  object qryRelatorio: TwwQuery
    AutoCalcFields = False
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    RequestLive = True
    SQL.Strings = (
      
        'select '#39'N'#39' "Selecionar",(select matricula from depentit d where ' +
        'd.idpessoa = c.idpessoa) as "Matrícula",'
      
        '       (select nome from pessoa p where p.idpessoa = c.idpessoa)' +
        ' as"Nome",'
      '       (select idplanprevcontab'
      '          from benefbfciario b'
      '         where b.idplanoprev = c.idplanoprev'
      '           and b.idpessoa = c.idpessoa'
      '           and b.idtitular = c.idtitular'
      
        '           and b.idpessjur = c.idpessjur and rownum = 1) "Plano ' +
        'Contab",'
      
        '       (select nome from beneficio where idbeneficio = c.idbenef' +
        'icio) "Benefício ",'
      '       Data"Dt Lanc Dívida",'
      '       Valorbeneficio"Vlr Benef",'
      '       Saldodevedorinicial"Saldo Dev Ini",'
      '       Saldodevedoratual"Saldo Dev Atual",'
      '       Valorultimaparcela"Ult Parcela",'
      '       Valorparcela"Vlr Parcela",'
      '       '#39#39'"Situação",'
      '       Mesinicio"Ini Cobr",'
      '       Mesfim"Fim Cobr",'
      '       Percentual"Percentual",'
      '       Quantidadeparcelaspagas"Qtde Pagas",'
      '       Qtdeparcelas"Qtde Parcelas",'
      
        '       decode(nvl(Flgatualizarsaldo, 0), 0, '#39'Não'#39', '#39'Sim'#39') "Atual' +
        'izar Saldo",FLGSITUACAO,C.IDCONTROLEDIVIDABENEFICIO,H.IDHSTORICO' +
        'DIVIDABENEFICIO,C.IDPESSOA,C.IDTITULAR,C.IDPESSJUR,C.IDBENEFICIO' +
        ',C.IDPLANOPREV,C.IDMOTIVO,H.CODDOCUMENTO'
      '  from Controledividabeneficio c'
      '  JOIN HSTDIVIDABENEFICIO H'
      '    ON H.IDCONTROLEDIVIDABENEFICIO = C.IDCONTROLEDIVIDABENEFICIO'
      
        '  WHERE TO_DATE('#39'01/'#39' || SUBSTR(TO_CHAR(MESFIM), 4, 7), '#39'DD/MM/Y' +
        'YYY'#39') <='
      '        TO_DATE('#39'01/'#39' || '#39'01/2013'#39', '#39'DD/MM/YYYY'#39')'
      '   AND NOT EXISTS'
      
        ' (SELECT 1 FROM HSTDIVIDABENEFICIO WHERE MESCOBRANCA = '#39'2013/01'#39 +
        ')'
      '  AND H.FLGSITUACAO =0')
    UpdateObject = UpdateSQL1
    ControlType.Strings = (
      'SELECIONADO;CheckBox;S;N')
    ValidateWithMask = True
    Left = 969
    Top = 226
    object qryRelatorioSelecionar: TStringField
      FieldName = 'Selecionar'
      FixedChar = True
      Size = 1
    end
    object qryRelatorioMatricula: TStringField
      FieldName = 'Matricula'
      ReadOnly = True
      Size = 15
    end
    object qryRelatorioNome: TStringField
      FieldName = 'Nome'
      ReadOnly = True
      Size = 60
    end
    object qryRelatorioPlanoContab: TFloatField
      FieldName = 'PlanoContab'
      ReadOnly = True
    end
    object qryRelatorioBeneficio: TStringField
      FieldName = 'Beneficio '
      ReadOnly = True
      Size = 60
    end
    object qryRelatorioDtLancDivida: TDateTimeField
      FieldName = 'DtLancDivida'
      ReadOnly = True
    end
    object qryRelatorioVlrBenef: TFloatField
      FieldName = 'VlrBenef'
      ReadOnly = True
    end
    object qryRelatorioSaldoDevIni: TFloatField
      FieldName = 'SaldoDevIni'
      ReadOnly = True
    end
    object qryRelatorioSaldoDevAtual: TFloatField
      FieldName = 'SaldoDevAtual'
      ReadOnly = True
    end
    object qryRelatorioUltParcela: TFloatField
      FieldName = 'UltParcela'
      ReadOnly = True
    end
    object qryRelatorioVlrParcela: TFloatField
      FieldName = 'VlrParcela'
      ReadOnly = True
    end
    object qryRelatorioIniCobr: TDateTimeField
      FieldName = 'IniCobr'
      ReadOnly = True
    end
    object qryRelatorioFimCobr: TDateTimeField
      FieldName = 'FimCobr'
      ReadOnly = True
    end
    object qryRelatorioPercentual: TFloatField
      FieldName = 'Percentual'
      ReadOnly = True
    end
    object qryRelatorioQtdePagas: TFloatField
      FieldName = 'QtdePagas'
      ReadOnly = True
    end
    object qryRelatorioQtdeParcelas: TFloatField
      FieldName = 'QtdeParcelas'
      ReadOnly = True
    end
    object qryRelatorioAtualizarSaldo: TStringField
      FieldName = 'AtualizarSaldo'
      ReadOnly = True
      Size = 3
    end
    object qryRelatorioFLGSITUACAO: TFloatField
      FieldName = 'FLGSITUACAO'
      ReadOnly = True
    end
    object qryRelatorioIDCONTROLEDIVIDABENEFICIO: TFloatField
      FieldName = 'IDCONTROLEDIVIDABENEFICIO'
      ReadOnly = True
    end
    object qryRelatorioIDHSTORICODIVIDABENEFICIO: TFloatField
      FieldName = 'IDHSTORICODIVIDABENEFICIO'
      ReadOnly = True
    end
    object qryRelatorioIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
      ReadOnly = True
    end
    object qryRelatorioIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
      ReadOnly = True
    end
    object qryRelatorioIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
      ReadOnly = True
    end
    object qryRelatorioIDBENEFICIO: TFloatField
      FieldName = 'IDBENEFICIO'
      ReadOnly = True
    end
    object qryRelatorioIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      ReadOnly = True
    end
    object qryRelatorioIDMOTIVO: TFloatField
      FieldName = 'IDMOTIVO'
      ReadOnly = True
    end
    object qryRelatorioCODDOCUMENTO: TStringField
      FieldName = 'CODDOCUMENTO'
      ReadOnly = True
      FixedChar = True
      Size = 10
    end
  end
  object UpdateSQL1: TUpdateSQL
    Left = 1015
    Top = 226
  end
  object dsControleDivida: TwwDataSource
    AutoEdit = False
    DataSet = qryRelatorio
    Left = 920
    Top = 224
  end
  object qryLkPORTADORFORMA: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  DESCRICAO,'
      '  CODPORTFORMA,'
      '  DMAIS,'
      '  LANCAFINANC,'
      '  PLANO,'
      '  PLACONTA,'
      '  CODPORTADOR,'
      '  DESCFINAN,'
      '  FLGCHEQUEDIFERIDO,'
      '  FLGCONTROLACHEQUE'
      'FROM'
      '  PORTADORFORMA'
      'WHERE'
      '  RECPAG   = '#39'R'#39'   AND'
      '  IDPESSOA = 1     AND'
      '  NVL(FLGENCCONTAS, '#39'N'#39') = '#39'N'#39' AND'
      '  NVL(FLGATIVO, '#39'S'#39') = '#39'S'#39
      'ORDER BY DESCRICAO ')
    ValidateWithMask = True
    Left = 856
    Top = 409
    object qryLkPORTADORFORMADESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Origin = 'BASEDADOS.PORTADORFORMA.DESCRICAO'
      Size = 50
    end
    object qryLkPORTADORFORMACODPORTFORMA: TFloatField
      FieldName = 'CODPORTFORMA'
      Origin = 'BASEDADOS.PORTADORFORMA.CODPORTFORMA'
    end
  end
  object qryLkRefe: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT IDHSTORICODIVIDABENEFICIO,NUMEROPARCELA FROM  HSTDIVIDABE' +
        'NEFICIO'
      'WHERE IDCONTROLEDIVIDABENEFICIO= :IDCONTROLEDIVIDABENEFICIO')
    ValidateWithMask = True
    Left = 856
    Top = 457
    ParamData = <
      item
        DataType = ftFloat
        Name = 'IDCONTROLEDIVIDABENEFICIO'
        ParamType = ptUnknown
      end>
    object qryLkRefeNUMEROPARCELA: TFloatField
      DisplayWidth = 10
      FieldName = 'NUMEROPARCELA'
      Origin = 'BASEDADOS.HSTDIVIDABENEFICIO.NUMEROPARCELA'
    end
    object qryLkRefeIDHSTORICODIVIDABENEFICIO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDHSTORICODIVIDABENEFICIO'
      Origin = 'BASEDADOS.HSTDIVIDABENEFICIO.IDHSTORICODIVIDABENEFICIO'
      Visible = False
    end
  end
  object qryMovDivida: TwwQuery
    AfterOpen = qryMovDividaAfterOpen
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 411
    Top = 364
  end
  object dsMovDivida: TwwDataSource
    AutoEdit = False
    DataSet = qryMovDivida
    Left = 475
    Top = 362
  end
  object ppMovDivida: TppReport
    AutoStop = False
    DataPipeline = ppBDEMovDivida
    PassSetting = psTwoPass
    PrinterSetup.BinName = 'Default'
    PrinterSetup.DocumentName = 'Report'
    PrinterSetup.Orientation = poLandscape
    PrinterSetup.PaperName = 'A4'
    PrinterSetup.PrinterName = 'Default'
    PrinterSetup.mmMarginBottom = 6350
    PrinterSetup.mmMarginLeft = 6350
    PrinterSetup.mmMarginRight = 6350
    PrinterSetup.mmMarginTop = 6350
    PrinterSetup.mmPaperHeight = 210000
    PrinterSetup.mmPaperWidth = 297000
    PrinterSetup.PaperSize = 9
    DeviceType = 'Screen'
    OutlineSettings.CreateNode = True
    OutlineSettings.CreatePageNodes = True
    OutlineSettings.Enabled = True
    OutlineSettings.Visible = True
    TextSearchSettings.DefaultString = '<FindText>'
    TextSearchSettings.Enabled = True
    Left = 817
    Top = 273
    Version = '7.04'
    mmColumnWidth = 0
    DataPipelineName = 'ppBDEMovDivida'
    object ppTitleBand2: TppTitleBand
      mmBottomOffset = 0
      mmHeight = 46302
      mmPrintPosition = 0
      object ppLabel37: TppLabel
        UserName = 'Label41'
        Caption = 'Fundação dos Economiários Federais'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 16
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 6562
        mmLeft = 27940
        mmTop = 3440
        mmWidth = 245110
        BandType = 1
      end
      object ppLabel38: TppLabel
        UserName = 'Label53'
        Caption = 
          'SCN, Quadra 02, Bloco A, Edifício Corporate Financial Center 12 ' +
          'e 13 Andares'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3810
        mmLeft = 27728
        mmTop = 11642
        mmWidth = 244899
        BandType = 1
      end
      object ppLabel39: TppLabel
        UserName = 'Label54'
        Caption = 'Brasília DF CEP 70.712-900 - (061) 3329-1700 - www.funcef.com.br'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3810
        mmLeft = 27728
        mmTop = 15610
        mmWidth = 245110
        BandType = 1
      end
      object ppLabel40: TppLabel
        UserName = 'Label56'
        Caption = 
          'CNPJ: 03.296.968/0001-03 - Incrição Estadual: 01.001.001 - 001 -' +
          '01'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3810
        mmLeft = 27728
        mmTop = 19579
        mmWidth = 245322
        BandType = 1
      end
      object ppLabel42: TppLabel
        UserName = 'Label401'
        Caption = 'MOVIMENTAÇÃO DE DÍVIDAS DE BENEFÍCIOS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 14
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 5842
        mmLeft = 95570
        mmTop = 31485
        mmWidth = 110279
        BandType = 1
      end
      object ppSystemVariable3: TppSystemVariable
        UserName = 'SystemVariable1'
        VarType = vtDateTime
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3810
        mmLeft = 243629
        mmTop = 41010
        mmWidth = 29422
        BandType = 1
      end
      object ppLabel43: TppLabel
        UserName = 'Label1'
        Caption = 'Emissão:'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        TextAlignment = taCentered
        Transparent = True
        mmHeight = 3810
        mmLeft = 227754
        mmTop = 41010
        mmWidth = 14605
        BandType = 1
      end
      object ppImage2: TppImage
        UserName = 'Image1'
        MaintainAspectRatio = False
        Picture.Data = {
          0A544A504547496D616765500C0000FFD8FFE000104A46494600010101006000
          600000FFDB004300080606070605080707070909080A0C140D0C0B0B0C191213
          0F141D1A1F1E1D1A1C1C20242E2720222C231C1C2837292C30313434341F2739
          3D38323C2E333432FFDB0043010909090C0B0C180D0D1832211C213232323232
          3232323232323232323232323232323232323232323232323232323232323232
          32323232323232323232323232FFC00011080067007203012200021101031101
          FFC4001F0000010501010101010100000000000000000102030405060708090A
          0BFFC400B5100002010303020403050504040000017D01020300041105122131
          410613516107227114328191A1082342B1C11552D1F02433627282090A161718
          191A25262728292A3435363738393A434445464748494A535455565758595A63
          6465666768696A737475767778797A838485868788898A92939495969798999A
          A2A3A4A5A6A7A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6
          D7D8D9DAE1E2E3E4E5E6E7E8E9EAF1F2F3F4F5F6F7F8F9FAFFC4001F01000301
          01010101010101010000000000000102030405060708090A0BFFC400B5110002
          0102040403040705040400010277000102031104052131061241510761711322
          328108144291A1B1C109233352F0156272D10A162434E125F11718191A262728
          292A35363738393A434445464748494A535455565758595A636465666768696A
          737475767778797A82838485868788898A92939495969798999AA2A3A4A5A6A7
          A8A9AAB2B3B4B5B6B7B8B9BAC2C3C4C5C6C7C8C9CAD2D3D4D5D6D7D8D9DAE2E3
          E4E5E6E7E8E9EAF2F3F4F5F6F7F8F9FAFFDA000C03010002110311003F00F7FA
          2A1F31A8F31A8026A2A1F31A97CC34012D151893D4572DF11BC512F853C1D3EA
          36A07DA5DD6084B0C8566CF27F234E3172764075267883EC32287FEE93CD499A
          F8C67D5350B9BC6BB9EFEE64B9277199A56DD9F5CE78FC2BDE3E0BF8C6FF005D
          B2BCD275399EE26B10AF1CF21CB346490031EE411D6BA2AE19C23CD71D8F56A2
          A3327A52798D5CC225A2A1F31A8F31A8026A2A1F31AA4425864D003A8A28A008
          7CB3ED4796D535713E3DF8890F815EC965D364BCFB5062364A136E31D720FAD5
          462E4EC80EC3CB6A4208EA2BC77FE1A12CFF00E85D9FFF000297FF0089A46FDA
          0ACCF5F0ECFF00F816BFFC4D6BF57ABD80F62AE7BC6FE1A1E2BF0ADD6961C473
          1C49039E8245E99FCCD79EFF00C34059FF00D0BB71F85DAFFF00135734EF8EDA
          3DCDE2C57FA5DD5942C71E7798250A7DC0038A6A8D58BBD86793DCF80BC59697
          8D68FA05FBC8AC5434509746F70C38239EB5ED7F09FC0D75E15D3AEAF7524097
          F7BB41881CF9718E80FBE49AF43B3BB82F6CA3BAB599268245DD1C887208F506
          BCEBC49F19342D0EF5ACECE09754990ED90C4C1507D1B07354EAD4AAB9120B9E
          8D462BC73FE17FD9E7FE45DB8FFC0B5FFE26957F682B31FF0032ECFF00F816BF
          FC4D47D5EAF6158F64F2DA8F2DABC77FE1A12D3FE85D9FFF000297FF0089ADDF
          087C5EB7F17788A0D1E3D1E5B669559BCC69D580DA33D00F6A4E8544AED01E8D
          E5B7B53D14A8C1A514B588051451400567EA5A1E97AC18CEA36305D7979D9E6A
          E76E7AE2B428A13B6C0601F04F863FE80765FF007E8521F05786003FF123B2FF
          00BF42B6AE9DD2DA478C65D54951EF5C8E93A8EA126AC8AF249207243A37403F
          A57162B32586AB0A524DF31BD2A12A909493D8BCDE09F0C3A156D0AC883C11E5
          D7CF1F117C3B69E18F17CF61605FECC5165456EA991D33F5AFA97DABE71F8D1F
          F23FBFFD7B47FCABD8C2CA5CF6B98A2F7843C4B7F61F077C51141211F6378E38
          9B3CA2CCDB5B1E98EA2BCE749B21A8EB16562CE516E2658CB01D327922BADF0E
          FF00C925F1AFFD77B2FF00D195CEF85FFE46CD27FEBED3F9D75C55B99AFEB419
          F4BD97C3FF000B69F691DB47A35B3AC631BE45DCCDEE4D5B4F0578608FF901D9
          7FDFB15B4DD4FD6B9DF115E5E5BC90A44EF1C2464B2F193F5AF071B8DFAAD175
          A5776EC5D1A4EACD4132C8F04F860FFCC0EC7FEFD0AB363E17D134CBA5BAB1D2
          ED6DE750409234C119A93429EE2E34B47B9CEFC9193D48F5AD2CD6B46BBAD4D4
          D5ECD1138B849C5F4168A28AB2428A28A002A95FB6A0BB3EC2903673BBCD278F
          4C63F1ABB486B3A90E78F2DDAF42A32E577B5CE7AF352D66C23135C5B5A98B38
          2509E3F5A2EB5D820B3867B6810CD382718C631EB56BC4BFF2067FF797F9D727
          3FFC79D97D1BF9D7CCE618AAF84AB2A709B7EEA6AFAB4EF6D0F4F0F4A9D68A93
          56D7A75D0E912E35C7456F22D06467049FF1AF04F8C0666F1BE6E0209BECC9B8
          274AFA3D54EC5C9EC2BE75F8D1FF0023FBFF00D7B47FCABEAF2EA0E9D4BB9B96
          9D7FE18F3E7514B4514BD0A9E1DFF924BE35FF00AEF65FFA32B9CF0CE7FE12AD
          271D7ED49FCEBA3F0EFF00C925F1A7FD77B2FF00D195CEF8639F15E93FF5F69F
          CEBD55F6BFAE841F52B4BAEEF6C4366464E33BBFC6A2B2D65A5BC7B2D4608D59
          727819191F5CD6E37DE3F5AE42E3FE4659FEA7F957C6660EA613D9CE336EF2B3
          4F5563B30EA3579938A565D0D2835AD42FEE244D3EDA0F293BC99E076E86B46D
          1F576B9517715AAC383931E73593E10E7ED5FF0001FEB5D456995AA988A11AF5
          2A3BB6F4E9BF6B138AE5A7374E3156403039A01CD0466851815EC9C62D145140
          11824507269075A90F4A6062F88FFE40D27FBCB5CB4FFF001E765F46FE75D66B
          D1493692E91A33B6E070A326B9B9AC2ECDA5A0FB34B95073F29E39AF90CF294E
          589938A6FDD5FF00A51EBE065154D5DF57F91D7293B17E82BE77F8D1FF0023FB
          FF00D7B47FCABE885E117E82BC13E2FE8DAADEF8E1A6B4D2EFAE22FB3A0F321B
          6775CFA640AFB7C2594F53C9EA63F877FE492F8D3FEBBD97FE8CAE73C31FF235
          E93FF5F69FCEBB1D0744D5E2F85DE2FB69349D41279A6B43144D6AE19C093276
          8C64E3DAB03C37E1ED722F13E97249A2EA491ADCA1676B4900033D49238AEC52
          5EF6BFD580FAA09F9CFD6B93B839F12CC7DCFF002AEADBEF1E7BD73335A5CB78
          826956090A1270C14E3A57C8679094A9D3E557F791D982694A57EC4DE12EB75F
          45FEB5D39C9AE77C316D3C1F69F3A278F2171B8633D6BA451C56D92C5C705052
          567AFE6C8C634EBC9A13185A54E94ADF7685E95EA1CA2D145140118EB58DE23F
          16E8DE168E07D5EE8C0272563C216C90327A56E6D1E95E31F1FF00FE3D345E3A
          CAFF00CAB4A51539A8B03B6D2BE2578575AD4E0D3EC350696EA73B635F29864F
          D715A1A3F8CB43F115FDD69FA6DD34B736E09917CB65C60ED3C9F7AE63C1D61A
          B8D4EDA4D43C1BA1585B2C0592F2D625F34360639F7E6B91F83B85F88DE228DB
          01B130DA4F7130AD1D38D9B5D067A6D9F8CB43D435D9F45B6BB67D420DDE6446
          3200DBF7B9A9342F19E87E25B99ED349BEF3678065D194A1C648E33D79F4AF28
          F06E25F8E1AE327CE99B9F9872318F5AE2FC3B3EA9A26A3378A74F05A1D3AE55
          6E94778DC9EBEC707F4AD3D845DECFA20B1F4668FE31D175CD52EF4AD3EF1E5B
          CB5566950A30C00C14F3DF922A9EABF11FC2BA3DDBDA5E6AC82743B592305F69
          F438AF24F87BA834BE24F196A7641C3B6957371083D41DC081F5CD6BFC1DF0FE
          87ACF87F5ABAD52D60BA9FCEF2D9A6018C69B73919E87393BA94A8C6376FA582
          C7A8CFE29D120F0F9D70DFC7269A3199E2F9C0C903A0FAD62A7C5EF052AE0EA8
          D9EA7F70FF00E15C7EB569E16B0F84DAEDBF85EFCDDC2258DA7DD2162ADBC0FE
          9DBD2B2FC1D61E269FC3169269FE0EF0D6A16A73B6E6F610D2BF3CE49342A50B
          37AEFE8163D5B54F883E1BD1E0B19AF6F9A34BE816E2022263BA33D0F038A7E8
          3F10BC37E23D4469FA65F19AE4A1709E5B0E075E48AF2AF8C513C7AFF86215B5
          855D6DE3516E8A0479DFF700FEEF6FA57A2F836C3548B539A4D4FC25A2692163
          FDDCF631A87639E991DB1512A7154D480EDD8E5684E94B8A00C573885A28A280
          0AE47C71E02B6F1BC566971792DB7D998B02881B39FAD14538C9C5DD01D4C10F
          910471039D8A1727BE062BCFBC41F0874BD635B9756B4D42EF4D9E6E6516C701
          9BB91C8C67BD14538CE51774C0D1F077C3DD2FC1AB7325B4935C5DDCAEC92E25
          EBB7D00EDCD47E18F873A7F872DB55B633BDEC1A900B2A4A800039E9CFBD1453
          7526EF77B80CF06FC32B1F076A9777F6D7B35C0B881A0F2A64180A581FC7A62B
          1EFF00E0B6953DF5C4FA7EAB7FA74339CB5BC272BCF51D471ED4514FDACEF7B8
          1B03E1A69107832E7C3768F2411DC9569AE701A476041C9FF0ED5811FC0CB544
          0B1F893528D07454E00FC035145355A6BA81B7AAFC2BB4D5BFB0FCED52E41D26
          28E3562A18CBB5B765893D6BBFC5145439396E02D1451520145145007FFFD9}
        mmHeight = 28152
        mmLeft = 1058
        mmTop = 1323
        mmWidth = 26247
        BandType = 1
      end
    end
    object ppHeaderBand1: TppHeaderBand
      BeforePrint = ppHeaderBand1BeforePrint
      mmBottomOffset = 0
      mmHeight = 32279
      mmPrintPosition = 0
      object ppLabel44: TppLabel
        UserName = 'Label2'
        AutoSize = False
        Caption = 'Status da Dívida'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3970
        mmLeft = 1059
        mmTop = 25928
        mmWidth = 20785
        BandType = 0
      end
      object ppLabel45: TppLabel
        UserName = 'Label3'
        AutoSize = False
        Caption = 'Data Movimento'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 7673
        mmLeft = 23548
        mmTop = 24077
        mmWidth = 15611
        BandType = 0
      end
      object ppLabel46: TppLabel
        UserName = 'Label5'
        AutoSize = False
        Caption = 'Operação de Origem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3970
        mmLeft = 40747
        mmTop = 25928
        mmWidth = 52388
        BandType = 0
      end
      object ppLabel47: TppLabel
        UserName = 'Label6'
        AutoSize = False
        Caption = 'Saldo Dev. Anterior'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 7673
        mmLeft = 125149
        mmTop = 24077
        mmWidth = 19845
        BandType = 0
      end
      object ppLabel48: TppLabel
        UserName = 'Label8'
        AutoSize = False
        Caption = 'Valor Últ. Parcela'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 7673
        mmLeft = 146314
        mmTop = 24077
        mmWidth = 18785
        BandType = 0
      end
      object ppLabel49: TppLabel
        UserName = 'Label10'
        AutoSize = False
        Caption = 'Valor Parcela Atual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 7673
        mmLeft = 166423
        mmTop = 24077
        mmWidth = 18785
        BandType = 0
      end
      object ppLabel50: TppLabel
        UserName = 'Label13'
        AutoSize = False
        Caption = 'Saldo Devedor Atual'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 7673
        mmLeft = 186532
        mmTop = 24077
        mmWidth = 19845
        BandType = 0
      end
      object ppLabel51: TppLabel
        UserName = 'Label16'
        AutoSize = False
        Caption = 'Qtde Total de Parcelas Atual'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 7673
        mmLeft = 207698
        mmTop = 24077
        mmWidth = 19579
        BandType = 0
      end
      object ppLabel52: TppLabel
        UserName = 'Label18'
        AutoSize = False
        Caption = 'Qtde Total de Parc. Anterior'
        Font.Charset = ANSI_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 7673
        mmLeft = 265378
        mmTop = 24077
        mmWidth = 17463
        BandType = 0
      end
      object ppLabel55: TppLabel
        UserName = 'Label23'
        AutoSize = False
        Caption = 'Início Dívida'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3970
        mmLeft = 228600
        mmTop = 25928
        mmWidth = 16404
        BandType = 0
      end
      object ppLabel57: TppLabel
        UserName = 'Label25'
        AutoSize = False
        Caption = 'Fim da Dívida'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3970
        mmLeft = 246328
        mmTop = 25928
        mmWidth = 17463
        BandType = 0
      end
      object ppLabel58: TppLabel
        UserName = 'Label4'
        Caption = 'Número da Matrícula:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 0
        mmTop = 846
        mmWidth = 32554
        BandType = 0
      end
      object ppLabel59: TppLabel
        UserName = 'Label7'
        Caption = 'Nome:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 86519
        mmTop = 846
        mmWidth = 9790
        BandType = 0
      end
      object ppLabel60: TppLabel
        UserName = 'Label9'
        Caption = 'Cód. Dívida do Benefício:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 0
        mmTop = 7938
        mmWidth = 37571
        BandType = 0
      end
      object ppLabel63: TppLabel
        UserName = 'Label14'
        Caption = 'Nome do Benefício:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3810
        mmLeft = 529
        mmTop = 13494
        mmWidth = 29887
        BandType = 0
      end
      object pplblMatricula: TppLabel
        UserName = 'Label20'
        Caption = 'pplblMatricula'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3598
        mmLeft = 33867
        mmTop = 846
        mmWidth = 19685
        BandType = 0
      end
      object pplblNome: TppLabel
        UserName = 'Label21'
        Caption = 'pplblNome'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3598
        mmLeft = 97631
        mmTop = 846
        mmWidth = 15282
        BandType = 0
      end
      object pplblCodDivida: TppLabel
        UserName = 'Label22'
        AutoSize = False
        Caption = 'pplblCodDivida'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3598
        mmLeft = 39159
        mmTop = 7938
        mmWidth = 21463
        BandType = 0
      end
      object pplblNomeBenef: TppLabel
        UserName = 'Label27'
        Caption = 'pplblNomeBenef'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3598
        mmLeft = 32015
        mmTop = 13494
        mmWidth = 23622
        BandType = 0
      end
      object ppShape12: TppShape
        UserName = 'Shape1'
        mmHeight = 8466
        mmLeft = 39423
        mmTop = 23548
        mmWidth = 212
        BandType = 0
      end
      object ppShape13: TppShape
        UserName = 'Shape2'
        mmHeight = 8466
        mmLeft = 22754
        mmTop = 23548
        mmWidth = 212
        BandType = 0
      end
      object ppShape14: TppShape
        UserName = 'Shape3'
        mmHeight = 8466
        mmLeft = 94986
        mmTop = 23548
        mmWidth = 212
        BandType = 0
      end
      object ppShape15: TppShape
        UserName = 'Shape4'
        mmHeight = 8466
        mmLeft = 124619
        mmTop = 23548
        mmWidth = 212
        BandType = 0
      end
      object ppShape16: TppShape
        UserName = 'Shape5'
        mmHeight = 8466
        mmLeft = 145521
        mmTop = 23548
        mmWidth = 212
        BandType = 0
      end
      object ppShape18: TppShape
        UserName = 'Shape6'
        mmHeight = 8466
        mmLeft = 165629
        mmTop = 23548
        mmWidth = 212
        BandType = 0
      end
      object ppShape19: TppShape
        UserName = 'Shape7'
        mmHeight = 8466
        mmLeft = 185738
        mmTop = 23548
        mmWidth = 212
        BandType = 0
      end
      object ppShape20: TppShape
        UserName = 'Shape8'
        mmHeight = 8466
        mmLeft = 206905
        mmTop = 23548
        mmWidth = 212
        BandType = 0
      end
      object ppShape21: TppShape
        UserName = 'Shape9'
        mmHeight = 8466
        mmLeft = 227807
        mmTop = 23548
        mmWidth = 212
        BandType = 0
      end
      object ppShape22: TppShape
        UserName = 'Shape10'
        mmHeight = 8466
        mmLeft = 245534
        mmTop = 23548
        mmWidth = 212
        BandType = 0
      end
      object ppLabel75: TppLabel
        UserName = 'Label19'
        Caption = 'Status da Dívida:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 86519
        mmTop = 7938
        mmWidth = 25665
        BandType = 0
      end
      object ppLabel77: TppLabel
        UserName = 'Label301'
        Caption = 'Nº do Benefício INSS:'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = [fsBold]
        Transparent = True
        mmHeight = 3704
        mmLeft = 182034
        mmTop = 7938
        mmWidth = 32808
        BandType = 0
      end
      object pplblStatusDiv: TppLabel
        UserName = 'Label33'
        Caption = 'pplblStatusDiv'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3598
        mmLeft = 113506
        mmTop = 7938
        mmWidth = 20405
        BandType = 0
      end
      object pplblNumINSS: TppLabel
        UserName = 'Label35'
        Caption = 'pplblNumINSS'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 9
        Font.Style = []
        Transparent = True
        mmHeight = 3704
        mmLeft = 215636
        mmTop = 7938
        mmWidth = 20902
        BandType = 0
      end
      object ppShape23: TppShape
        UserName = 'Shape101'
        mmHeight = 8466
        mmLeft = 264319
        mmTop = 23548
        mmWidth = 265
        BandType = 0
      end
      object ppShape25: TppShape
        UserName = 'Shape25'
        mmHeight = 265
        mmLeft = 0
        mmTop = 32014
        mmWidth = 283634
        BandType = 0
      end
      object ppShape24: TppShape
        UserName = 'Shape24'
        mmHeight = 265
        mmLeft = 0
        mmTop = 23548
        mmWidth = 283634
        BandType = 0
      end
      object ppLabel61: TppLabel
        UserName = 'Label61'
        AutoSize = False
        Caption = 'Usuário Responsável Alteração'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        WordWrap = True
        mmHeight = 7673
        mmLeft = 95779
        mmTop = 24077
        mmWidth = 28575
        BandType = 0
      end
    end
    object ppDetailBand1: TppDetailBand
      mmBottomOffset = 0
      mmHeight = 5027
      mmPrintPosition = 0
      object ppDBText13: TppDBText
        UserName = 'DBText1'
        DataField = 'STATUS'
        DataPipeline = ppBDEMovDivida
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEMovDivida'
        mmHeight = 3175
        mmLeft = 1323
        mmTop = 1058
        mmWidth = 20902
        BandType = 4
      end
      object ppDBText14: TppDBText
        UserName = 'DBText2'
        DataField = 'DATAMOV'
        DataPipeline = ppBDEMovDivida
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taCentered
        Transparent = True
        DataPipelineName = 'ppBDEMovDivida'
        mmHeight = 3175
        mmLeft = 23548
        mmTop = 1058
        mmWidth = 15610
        BandType = 4
      end
      object ppDBText15: TppDBText
        UserName = 'DBText3'
        DataField = 'OPEORIGEM'
        DataPipeline = ppBDEMovDivida
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEMovDivida'
        mmHeight = 3175
        mmLeft = 40746
        mmTop = 1058
        mmWidth = 52388
        BandType = 4
      end
      object ppDBText16: TppDBText
        UserName = 'DBText4'
        DataField = 'NOMEUSUARIO'
        DataPipeline = ppBDEMovDivida
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEMovDivida'
        mmHeight = 3175
        mmLeft = 95779
        mmTop = 1058
        mmWidth = 28046
        BandType = 4
      end
      object ppDBText17: TppDBText
        UserName = 'DBText5'
        DataField = 'SALDO_ANTERIOR'
        DataPipeline = ppBDEMovDivida
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEMovDivida'
        mmHeight = 3175
        mmLeft = 125148
        mmTop = 1058
        mmWidth = 19844
        BandType = 4
      end
      object ppDBText18: TppDBText
        UserName = 'DBText6'
        DataField = 'VALORULTIMAPARCELA'
        DataPipeline = ppBDEMovDivida
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEMovDivida'
        mmHeight = 3175
        mmLeft = 146315
        mmTop = 1058
        mmWidth = 19844
        BandType = 4
      end
      object ppDBText19: TppDBText
        UserName = 'DBText7'
        DataField = 'VALORPARCELA'
        DataPipeline = ppBDEMovDivida
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEMovDivida'
        mmHeight = 3175
        mmLeft = 167746
        mmTop = 1058
        mmWidth = 19844
        BandType = 4
      end
      object ppDBText20: TppDBText
        UserName = 'DBText8'
        DataField = 'SALDO_ATUAL'
        DataPipeline = ppBDEMovDivida
        DisplayFormat = '#,##0.00'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEMovDivida'
        mmHeight = 3175
        mmLeft = 188648
        mmTop = 1058
        mmWidth = 19844
        BandType = 4
      end
      object ppDBText21: TppDBText
        UserName = 'DBText9'
        DataField = 'QTDEPARCELASATUAL'
        DataPipeline = ppBDEMovDivida
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEMovDivida'
        mmHeight = 3175
        mmLeft = 209550
        mmTop = 1058
        mmWidth = 15081
        BandType = 4
      end
      object ppDBText22: TppDBText
        UserName = 'DBText10'
        DataField = 'MESINICIO'
        DataPipeline = ppBDEMovDivida
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEMovDivida'
        mmHeight = 3175
        mmLeft = 228600
        mmTop = 1058
        mmWidth = 17463
        BandType = 4
      end
      object ppDBText23: TppDBText
        UserName = 'DBText101'
        DataField = 'MESFIM'
        DataPipeline = ppBDEMovDivida
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        DataPipelineName = 'ppBDEMovDivida'
        mmHeight = 3175
        mmLeft = 247650
        mmTop = 1058
        mmWidth = 17463
        BandType = 4
      end
      object ppDBText24: TppDBText
        UserName = 'DBText102'
        DataField = 'QTDEPARCELASANT'
        DataPipeline = ppBDEMovDivida
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        TextAlignment = taRightJustified
        Transparent = True
        DataPipelineName = 'ppBDEMovDivida'
        mmHeight = 3175
        mmLeft = 266436
        mmTop = 1058
        mmWidth = 12435
        BandType = 4
      end
    end
    object ppFooterBand1: TppFooterBand
      mmBottomOffset = 0
      mmHeight = 5821
      mmPrintPosition = 0
      object ppLabel82: TppLabel
        UserName = 'Label31'
        Caption = 'Movimentação de Dívidas de Benefícios \ BenefícioPrev'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 1058
        mmTop = 1270
        mmWidth = 70570
        BandType = 8
      end
      object ppSystemVariable4: TppSystemVariable
        UserName = 'SystemVariable2'
        VarType = vtPageSetDesc
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clBlack
        Font.Name = 'Arial'
        Font.Size = 8
        Font.Style = []
        Transparent = True
        mmHeight = 3260
        mmLeft = 259557
        mmTop = 529
        mmWidth = 17484
        BandType = 8
      end
    end
    object raCodeModule1: TraCodeModule
      ProgramStream = {00}
    end
    object ppParameterList2: TppParameterList
    end
  end
  object ppBDEMovDivida: TppBDEPipeline
    DataSource = dsMovDivida
    CloseDataSource = True
    OpenDataSource = False
    AutoCreateFields = False
    SkipWhenNoRecords = False
    UserName = 'BDEMovDivida'
    Left = 872
    Top = 288
  end
end
