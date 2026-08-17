inherited frmCadArquivoInterface: TfrmCadArquivoInterface
  Left = 130
  Top = 29
  Caption = 'Cadastro de Arquivos de Interface'
  ClientHeight = 473
  ClientWidth = 601
  OnActivate = FormActivate
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 601
    Height = 387
    inherited pnlMestre: TPanel
      Width = 591
      Height = 134
      object Label1: TLabel
        Left = 9
        Top = 3
        Width = 37
        Height = 13
        Caption = 'Nome '
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Origem: TLabel
        Left = 9
        Top = 40
        Width = 40
        Height = 13
        Caption = 'Origem'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object Destino: TLabel
        Left = 9
        Top = 78
        Width = 44
        Height = 13
        Caption = 'Destino'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
      end
      object dbgrpTipoInterface: TDBRadioGroup
        Left = 388
        Top = 14
        Width = 169
        Height = 98
        Caption = 'Tipo de Interface'
        DataField = 'ENTRADA'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        Items.Strings = (
          'Entrada'
          'Saída')
        ParentFont = False
        TabOrder = 0
        Values.Strings = (
          '1'
          '0')
      end
      object dbedNomeArq: TwwDBEdit
        Left = 9
        Top = 18
        Width = 368
        Height = 21
        DataField = 'NOMEARQ'
        DataSource = ds
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
      object dbedOrigem: TwwDBEdit
        Left = 9
        Top = 55
        Width = 368
        Height = 21
        DataField = 'ORIGEM'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 2
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
      object dbedDestino: TwwDBEdit
        Left = 9
        Top = 90
        Width = 368
        Height = 21
        DataField = 'DESTINO'
        DataSource = ds
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = []
        ParentFont = False
        TabOrder = 3
        UnboundDataType = wwDefault
        WantReturns = False
        WordWrap = False
      end
    end
    inherited pnlDetalhe: TPanel
      Top = 139
      Width = 591
      Height = 243
      inherited pgctrlDetalhe: TPageControl
        Width = 585
        Height = 237
        ActivePage = tbsCampos
        inherited tbshDetalhe: TTabSheet
          Caption = 'Colunas da Linha de Cabeçalho do Arquivo (Header)'
          inherited pnlControlesDet: TPanel
            Width = 577
            Height = 175
            object Label11: TLabel [0]
              Left = 7
              Top = 7
              Width = 94
              Height = 13
              Caption = 'Nome da Coluna'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label17: TLabel [1]
              Left = 121
              Top = 43
              Width = 87
              Height = 13
              Caption = 'Tipo da Coluna'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label16: TLabel [2]
              Left = 292
              Top = 7
              Width = 114
              Height = 13
              Caption = 'Tamanho da Coluna'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label15: TLabel [3]
              Left = 7
              Top = 43
              Width = 102
              Height = 13
              Caption = 'Número de Ordem'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label12: TLabel [4]
              Left = 7
              Top = 79
              Width = 64
              Height = 13
              Caption = 'Significado'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            inherited Panel4: TPanel
              Left = 500
              Height = 173
              TabOrder = 7
            end
            object dbedNomeColHeader: TwwDBEdit
              Left = 7
              Top = 20
              Width = 282
              Height = 21
              DataField = 'NOMECOLUNAHEAD'
              DataSource = dsDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dblkpcmbTpColHeader: TwwDBLookupCombo
              Left = 121
              Top = 56
              Width = 169
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMETIPODADO'#9'60'#9'NOMETIPODADO'#9'No')
              DataField = 'IDTIPOCOLUNA'
              DataSource = dsDet
              LookupTable = qryTipoDado
              LookupField = 'IDTIPODADO'
              Options = [loTitles]
              ParentFont = False
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = False
            end
            object dbedTamColHeader: TwwDBEdit
              Left = 294
              Top = 20
              Width = 94
              Height = 21
              DataField = 'TAMCOLUNAHEAD'
              DataSource = dsDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbedNumOrdHeader: TwwDBEdit
              Left = 7
              Top = 56
              Width = 82
              Height = 21
              DataField = 'NUMORDEMHEAD'
              DataSource = dsDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbedSigColHeader: TwwDBEdit
              Left = 7
              Top = 93
              Width = 282
              Height = 21
              DataField = 'SIGNIFICADO'
              DataSource = dsDet
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 4
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object bbtnRelHeadCMP: TBitBtn
              Left = 6
              Top = 132
              Width = 292
              Height = 37
              Caption = 'Relacionar com Campo do Banco de Dados'
              TabOrder = 6
              OnClick = bbtnRelHeadCMPClick
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
              NumGlyphs = 2
            end
            object grpCMPHeader: TGroupBox
              Left = 300
              Top = 123
              Width = 199
              Height = 49
              Caption = 'Campo do Banco de Dados'
              TabOrder = 8
              object edCMPHeader: TEdit
                Left = 6
                Top = 18
                Width = 187
                Height = 21
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                Text = 'edCMPHeader'
              end
            end
            object grpValor: TGroupBox
              Left = 300
              Top = 77
              Width = 199
              Height = 44
              Caption = 'Valor Fixo'
              TabOrder = 5
              object dbedValor: TwwDBEdit
                Left = 9
                Top = 15
                Width = 184
                Height = 21
                DataField = 'VALOR'
                DataSource = dsDet
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
            end
          end
          inherited dbgrdDet: TwwDBGrid
            Width = 577
            Height = 175
            Selected.Strings = (
              'NUMORDEMHEAD'#9'12'#9'Nº de Ordem'
              'NOMECOLUNAHEAD'#9'60'#9'Nome da Coluna'
              'TAMCOLUNAHEAD'#9'12'#9'Tamanho')
          end
          inherited pnlBarraDetalhe: TPanel
            Width = 577
          end
        end
        object tbsCampos: TTabSheet
          Caption = 'Colunas das Linhas Gerais do Arquivo'
          object pnlControlesDet2: TPanel
            Left = 0
            Top = 34
            Width = 577
            Height = 175
            Align = alClient
            TabOrder = 1
            object Label2: TLabel
              Left = 7
              Top = 7
              Width = 94
              Height = 13
              Caption = 'Nome da Coluna'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label3: TLabel
              Left = 124
              Top = 43
              Width = 87
              Height = 13
              Caption = 'Tipo da Coluna'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label4: TLabel
              Left = 295
              Top = 7
              Width = 114
              Height = 13
              Caption = 'Tamanho da Coluna'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label5: TLabel
              Left = 7
              Top = 43
              Width = 102
              Height = 13
              Caption = 'Número de Ordem'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Label6: TLabel
              Left = 7
              Top = 79
              Width = 64
              Height = 13
              Caption = 'Significado'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = [fsBold]
              ParentFont = False
            end
            object Panel3: TPanel
              Left = 500
              Top = 1
              Width = 76
              Height = 173
              Align = alRight
              BevelOuter = bvNone
              TabOrder = 8
              object bbtnOkDet2: TBitBtn
                Left = 1
                Top = 5
                Width = 70
                Height = 27
                Caption = '&OK'
                TabOrder = 0
                OnClick = bbtnOkDet2Click
                Glyph.Data = {
                  BE060000424DBE06000000000000360400002800000024000000120000000100
                  0800000000008802000000000000000000000001000000010000000000000000
                  80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                  A600000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
                  0303030303030303030303030303030303030303030303030303030303030303
                  03030303030303030303030303030303030303030303FF030303030303030303
                  03030303030303040403030303030303030303030303030303F8F8FF03030303
                  03030303030303030303040202040303030303030303030303030303F80303F8
                  FF030303030303030303030303040202020204030303030303030303030303F8
                  03030303F8FF0303030303030303030304020202020202040303030303030303
                  0303F8030303030303F8FF030303030303030304020202FA0202020204030303
                  0303030303F8FF0303F8FF030303F8FF03030303030303020202FA03FA020202
                  040303030303030303F8FF03F803F8FF0303F8FF03030303030303FA02FA0303
                  03FA0202020403030303030303F8FFF8030303F8FF0303F8FF03030303030303
                  FA0303030303FA0202020403030303030303F80303030303F8FF0303F8FF0303
                  0303030303030303030303FA0202020403030303030303030303030303F8FF03
                  03F8FF03030303030303030303030303FA020202040303030303030303030303
                  0303F8FF0303F8FF03030303030303030303030303FA02020204030303030303
                  03030303030303F8FF0303F8FF03030303030303030303030303FA0202020403
                  030303030303030303030303F8FF0303F8FF03030303030303030303030303FA
                  0202040303030303030303030303030303F8FF03F8FF03030303030303030303
                  03030303FA0202030303030303030303030303030303F8FFF803030303030303
                  030303030303030303FA0303030303030303030303030303030303F803030303
                  0303030303030303030303030303030303030303030303030303030303030303
                  0303}
                NumGlyphs = 2
                Spacing = 0
              end
              object bbtnCancelarDet2: TBitBtn
                Left = 1
                Top = 35
                Width = 70
                Height = 27
                Cancel = True
                Caption = '&Cancelar'
                TabOrder = 1
                OnClick = bbtnCancelarDet2Click
                Glyph.Data = {
                  BE060000424DBE06000000000000360400002800000024000000120000000100
                  0800000000008802000000000000000000000001000000010000000000000000
                  80000080000000808000800000008000800080800000C0C0C000C0DCC000F0CA
                  A600000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  0000000000000000000000000000000000000000000000000000000000000000
                  000000000000000000000000000000000000F0FBFF00A4A0A000808080000000
                  FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00030303030303
                  0303030303030303030303030303030303030303030303030303030303030303
                  0303F8F80303030303030303030303030303030303FF03030303030303030303
                  0303030303F90101F80303030303F9F80303030303030303F8F8FF0303030303
                  03FF03030303030303F9010101F8030303F90101F8030303030303F8FF03F8FF
                  030303FFF8F8FF030303030303F901010101F803F901010101F80303030303F8
                  FF0303F8FF03FFF80303F8FF030303030303F901010101F80101010101F80303
                  030303F8FF030303F8FFF803030303F8FF030303030303F90101010101010101
                  F803030303030303F8FF030303F803030303FFF80303030303030303F9010101
                  010101F8030303030303030303F8FF030303030303FFF8030303030303030303
                  030101010101F80303030303030303030303F8FF0303030303F8030303030303
                  0303030303F901010101F8030303030303030303030303F8FF030303F8030303
                  0303030303030303F90101010101F8030303030303030303030303F803030303
                  F8FF030303030303030303F9010101F8010101F803030303030303030303F803
                  03030303F8FF0303030303030303F9010101F803F9010101F803030303030303
                  03F8030303F8FF0303F8FF03030303030303F90101F8030303F9010101F80303
                  03030303F8FF0303F803F8FF0303F8FF03030303030303F9010303030303F901
                  0101030303030303F8FFFFF8030303F8FF0303F8FF0303030303030303030303
                  030303F901F903030303030303F8F80303030303F8FFFFFFF803030303030303
                  03030303030303030303030303030303030303030303030303F8F8F803030303
                  0303030303030303030303030303030303030303030303030303030303030303
                  0303}
                NumGlyphs = 2
                Spacing = 0
              end
            end
            object dbedNomeCol: TwwDBEdit
              Left = 7
              Top = 20
              Width = 285
              Height = 21
              DataField = 'NOMECOLUNA'
              DataSource = dsDet2
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 0
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dblkpcmbTipoCol: TwwDBLookupCombo
              Left = 124
              Top = 56
              Width = 169
              Height = 21
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'NOMETIPODADO'#9'60'#9'NOMETIPODADO'#9'No')
              DataField = 'IDTIPOCOLUNA'
              DataSource = dsDet2
              LookupTable = qryTipoDado
              LookupField = 'IDTIPODADO'
              Options = [loTitles]
              ParentFont = False
              TabOrder = 3
              AutoDropDown = True
              ShowButton = True
              UseTFields = False
              AllowClearKey = False
            end
            object dbedTamCol: TwwDBEdit
              Left = 297
              Top = 23
              Width = 94
              Height = 21
              DataField = 'TAMCOLUNA'
              DataSource = dsDet2
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbedNumOrdCol: TwwDBEdit
              Left = 7
              Top = 56
              Width = 82
              Height = 21
              DataField = 'NUMORDEM'
              DataSource = dsDet2
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 1
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object dbedSigCol: TwwDBEdit
              Left = 7
              Top = 93
              Width = 288
              Height = 21
              DataField = 'SIGNIFICADO'
              DataSource = dsDet2
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 4
              UnboundDataType = wwDefault
              WantReturns = False
              WordWrap = False
            end
            object bbtnRelColCMP: TBitBtn
              Left = 6
              Top = 132
              Width = 301
              Height = 37
              Caption = 'Relacionar com Campo do Banco de Dados'
              TabOrder = 6
              OnClick = bbtnRelColCMPClick
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
              NumGlyphs = 2
            end
            object grpCMPCol: TGroupBox
              Left = 309
              Top = 123
              Width = 208
              Height = 49
              Caption = 'Campo do Banco de Dados'
              TabOrder = 7
              object edCMPCol: TEdit
                Left = 9
                Top = 18
                Width = 190
                Height = 21
                TabOrder = 0
              end
            end
            object GroupBox1: TGroupBox
              Left = 309
              Top = 74
              Width = 199
              Height = 49
              Caption = 'Valor Fixo'
              TabOrder = 5
              object dbedValorCampo: TwwDBEdit
                Left = 9
                Top = 18
                Width = 184
                Height = 21
                DataField = 'VALOR'
                DataSource = dsDet2
                Font.Charset = DEFAULT_CHARSET
                Font.Color = clWindowText
                Font.Height = -9
                Font.Name = 'MS Sans Serif'
                Font.Style = []
                ParentFont = False
                TabOrder = 0
                UnboundDataType = wwDefault
                WantReturns = False
                WordWrap = False
              end
            end
          end
          object dbgrdDet2: TwwDBGrid
            Left = 0
            Top = 34
            Width = 577
            Height = 175
            Selected.Strings = (
              'NUMORDEM'#9'13'#9'Nº de Ordem'
              'NOMECOLUNA'#9'60'#9'Nome da Coluna'
              'TAMCOLUNA'#9'11'#9'Tamanho')
            IniAttributes.Delimiter = ';;'
            TitleColor = clBtnFace
            FixedCols = 0
            ShowHorzScrollBar = True
            Align = alClient
            DataSource = dsDet2
            Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgConfirmDelete, dgCancelOnExit, dgWordWrap]
            TabOrder = 2
            TitleAlignment = taLeftJustify
            TitleFont.Charset = DEFAULT_CHARSET
            TitleFont.Color = clWindowText
            TitleFont.Height = -9
            TitleFont.Name = 'MS Sans Serif'
            TitleFont.Style = [fsBold]
            TitleLines = 1
            TitleButtons = False
            OnDblClick = dbgrdDetDblClick
            IndicatorColor = icBlack
          end
          object Panel1: TPanel
            Left = 0
            Top = 0
            Width = 577
            Height = 34
            Align = alTop
            TabOrder = 0
            object sbtnProcDet2: TSpeedButton
              Left = 61
              Top = 4
              Width = 25
              Height = 25
              Hint = 'Procurar por registro|'
              AllowAllUp = True
              GroupIndex = 1
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333CCCCC33
                33333FFFF77777FFFFFFCCCCCC808CCCCCC3777777F7F777777F008888070888
                8003777777777777777F0F0770F7F0770F0373F33337F333337370FFFFF7FFFF
                F07337F33337F33337F370FFFB99FBFFF07337F33377F33337F330FFBF99BFBF
                F033373F337733333733370BFBF7FBFB0733337F333FF3337F33370FBF98BFBF
                0733337F3377FF337F333B0BFB990BFB03333373FF777FFF73333FB000B99000
                B33333377737777733333BFBFBFB99FBF33333333FF377F333333FBF99BF99BF
                B333333377F377F3333333FB99FB99FB3333333377FF77333333333FB9999FB3
                333333333777733333333333FBFBFB3333333333333333333333}
              Layout = blGlyphTop
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              Spacing = 0
            end
            object sbtnApagDet2: TSpeedButton
              Left = 88
              Top = 4
              Width = 25
              Height = 25
              Hint = 'Remover o registro selecionado|'
              AllowAllUp = True
              GroupIndex = 1
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00500005000555
                555557777F777555F55500000000555055557777777755F75555005500055055
                555577F5777F57555555005550055555555577FF577F5FF55555500550050055
                5555577FF77577FF555555005050110555555577F757777FF555555505099910
                555555FF75777777FF555005550999910555577F5F77777775F5500505509990
                3055577F75F77777575F55005055090B030555775755777575755555555550B0
                B03055555F555757575755550555550B0B335555755555757555555555555550
                BBB35555F55555575F555550555555550BBB55575555555575F5555555555555
                50BB555555555555575F555555555555550B5555555555555575}
              Layout = blGlyphTop
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              Spacing = 0
              OnClick = sbtnApagDet2Click
            end
            object sbtnAltDet2: TSpeedButton
              Left = 33
              Top = 4
              Width = 25
              Height = 25
              Hint = 'Alterar o registro selecionado|'
              AllowAllUp = True
              GroupIndex = 1
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
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
              Layout = blGlyphTop
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              Spacing = 0
              OnClick = sbtnAltDet2Click
            end
            object sbtnInsDet2: TSpeedButton
              Left = 6
              Top = 4
              Width = 25
              Height = 25
              Hint = 'Inserir novo registro|'
              AllowAllUp = True
              GroupIndex = 1
              Glyph.Data = {
                76010000424D7601000000000000760000002800000020000000100000000100
                0400000000000001000000000000000000001000000010000000000000000000
                800000800000008080008000000080008000808000007F7F7F00BFBFBF000000
                FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF0033333333B333
                333B33FF33337F3333F73BB3777BB7777BB3377FFFF77FFFF77333B000000000
                0B3333777777777777333330FFFFFFFF07333337F33333337F333330FFFFFFFF
                07333337F33333337F333330FFFFFFFF07333337F33333337F333330FFFFFFFF
                07333FF7F33333337FFFBBB0FFFFFFFF0BB37777F3333333777F3BB0FFFFFFFF
                0BBB3777F3333FFF77773330FFFF000003333337F333777773333330FFFF0FF0
                33333337F3337F37F3333330FFFF0F0B33333337F3337F77FF333330FFFF003B
                B3333337FFFF77377FF333B000000333BB33337777777F3377FF3BB3333BB333
                3BB33773333773333773B333333B3333333B7333333733333337}
              Layout = blGlyphTop
              NumGlyphs = 2
              ParentShowHint = False
              ShowHint = True
              Spacing = 0
              OnClick = sbtnInsDet2Click
            end
          end
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 601
  end
  inherited Dock971: TDock97
    Top = 434
    Width = 601
    inherited tb97Fundo: TToolbar97
      Left = 431
      DockPos = 431
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 262
      DockPos = 262
    end
    inherited dbnav: TDBNavigator
      Hints.Strings = ()
    end
  end
  inherited dsDet: TwwDataSource
    DataSet = qryHeader
    Left = 327
    Top = 65534
  end
  inherited ds: TwwDataSource
    DataSet = qryArquivo
    Left = 258
    Top = 2
  end
  inherited srchdlgProcura: TwwSearchDialog
    Left = 138
    Top = 442
  end
  inherited seldlgProcuraQry: TcmSelectDlg
    Left = 477
    Top = 6
  end
  object qryArquivo: TwwQuery
    AfterInsert = qryArquivoAfterInsert
    BeforePost = qryArquivoBeforePost
    BeforeDelete = qryArquivoBeforeDelete
    AfterScroll = qryArquivoAfterScroll
    DatabaseName = 'BaseDados'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM ARQUIVO'
      'ORDER BY NOMEARQ')
    ValidateWithMask = True
    Left = 290
    Top = 13
  end
  object qryHeader: TwwQuery
    AfterInsert = qryHeaderAfterInsert
    AfterEdit = qryHeaderAfterEdit
    BeforePost = qryHeaderBeforePost
    DatabaseName = 'BaseDados'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM HEADER'
      'WHERE IDARQ = :iIdArq'
      'ORDER BY NUMORDEMHEAD')
    ValidateWithMask = True
    Left = 326
    Top = 13
    ParamData = <
      item
        DataType = ftInteger
        Name = 'iIdArq'
        ParamType = ptUnknown
      end>
  end
  object qryCampos: TwwQuery
    AfterInsert = qryCamposAfterInsert
    AfterEdit = qryCamposAfterEdit
    BeforePost = qryCamposBeforePost
    DatabaseName = 'BaseDados'
    RequestLive = True
    SQL.Strings = (
      'SELECT * FROM CAMPOARQ'
      'WHERE IDARQ = :iIdArq'
      'ORDER BY NUMORDEM')
    ValidateWithMask = True
    Left = 410
    Top = 10
    ParamData = <
      item
        DataType = ftInteger
        Name = 'iIdArq'
        ParamType = ptUnknown
      end>
  end
  object dsDet2: TwwDataSource
    DataSet = qryCampos
    OnStateChange = dsDet2StateChange
    Left = 411
  end
  object qryTipoDado: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM TIPODADO'
      'ORDER BY NOMETIPODADO')
    ValidateWithMask = True
    Left = 519
    Top = 10
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 584
    Top = 85
  end
  object qryCMPBD: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDCAMPO,NOMEDOCAMPO'
      'FROM CMPBD'
      'WHERE CAMPODOBANCO = 1'
      'ORDER BY IDCAMPO')
    ValidateWithMask = True
    Left = 569
    Top = 65534
  end
end
