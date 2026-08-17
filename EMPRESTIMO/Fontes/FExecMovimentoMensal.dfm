inherited frmExecMovimentoMensal: TfrmExecMovimentoMensal
  Left = 245
  Top = 147
  Caption = 'Movimentação Mensal de Empréstimos'
  ClientHeight = 463
  ClientWidth = 677
  Menu = MainMenu1
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 677
    Height = 430
    inherited pgcControle: TPageControl
      Width = 677
      Height = 397
      ActivePage = TabSheet2
      inherited TabSheet1: TTabSheet
        object Label1: TLabel
          Left = 30
          Top = 50
          Width = 112
          Height = 13
          Caption = 'Tipo de Empréstimo'
        end
        object Label2: TLabel
          Left = 334
          Top = 50
          Width = 96
          Height = 13
          Caption = 'Tipo de Contrato'
        end
        inline molContratoEmptmo: TmolContratoEmptmo
          Left = 22
          Top = 8
          Width = 609
          inherited edtNome: TEdit
            Width = 353
          end
          inherited btnBuscaContrato: TBitBtn
            Left = 552
            OnClick = molContratoEmptmobtnBuscaContratoClick
          end
          inherited btnLimpaContrato: TBitBtn
            Left = 576
            OnClick = molContratoEmptmobtnLimpaContratoClick
          end
        end
        object DBcboTipoEmptmo: TwwDBLookupCombo
          Left = 30
          Top = 64
          Width = 289
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCTIPOEMPTMO'#9'30'#9'Tipo de Empréstimo'#9'F')
          LookupTable = dtmLookEmptmo.qryLookTipoEmptmo
          LookupField = 'IDTIPOEMPTMO'
          ParentFont = False
          TabOrder = 1
          AutoDropDown = False
          ShowButton = True
          UseTFields = False
          AllowClearKey = False
          ShowMatchText = True
          OnCloseUp = DBcboTipoEmptmoCloseUp
          OnExit = DBcboTipoEmptmoExit
        end
        object DBcboTipoContrato: TwwDBLookupCombo
          Left = 334
          Top = 64
          Width = 289
          Height = 21
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'TCEDESCRICAO'#9'60'#9'TCEDESCRICAO'#9'F')
          LookupTable = dtmLookEmptmo.qryLookTipoContr
          LookupField = 'IDTIPOCONTREMPTMO'
          DropDownWidth = 8
          Enabled = False
          ParentFont = False
          TabOrder = 2
          AutoDropDown = False
          ShowButton = True
          UseTFields = False
          AllowClearKey = False
          ShowMatchText = True
        end
        inline molListaPatro: TmolListaPatro
          Left = 22
          Top = 88
          Height = 289
          TabOrder = 3
          inherited Label6: TLabel
            Width = 86
          end
          inherited lstPatro: TCheckListBox
            Height = 265
          end
          inherited btnInvertePatro: TBitBtn
            OnClick = molListaPatrobtnInvertePatroClick
          end
          inherited btnMarcaTodosPatro: TBitBtn
            OnClick = molListaPatrobtnMarcaTodosPatroClick
          end
        end
        inline molListaPlano: TmolListaPlanoContab
          Left = 326
          Top = 88
          Height = 217
          TabOrder = 4
          inherited Label6: TLabel
            Width = 117
          end
          inherited lstPlano: TCheckListBox
            Height = 193
          end
          inherited btnInvertePlano: TBitBtn
            OnClick = molListaPlanobtnInvertePlanoClick
          end
          inherited btnMarcaTodosPlano: TBitBtn
            OnClick = molListaPlanobtnMarcaTodosPlanoClick
          end
        end
        object Panel2: TPanel
          Left = 334
          Top = 312
          Width = 289
          Height = 57
          TabOrder = 5
          object Label15: TLabel
            Left = 40
            Top = 10
            Width = 135
            Height = 13
            Caption = 'Mês/ano de Referência'
          end
          object DBspnAno: TwwDBSpinEdit
            Left = 184
            Top = 24
            Width = 65
            Height = 21
            Increment = 1
            MaxValue = 2500
            MinValue = 1980
            TabOrder = 1
            UnboundDataType = wwDefault
          end
          object cboMes: TComboBox
            Left = 40
            Top = 24
            Width = 145
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 0
            Items.Strings = (
              'Janeiro'
              'Fevereiro'
              'Março'
              'Abril'
              'Maio'
              'Junho'
              'Julho'
              'Agosto'
              'Setembro'
              'Outubro'
              'Novembro'
              'Dezembro')
          end
        end
      end
      inherited TabSheet2: TTabSheet
        object Panel3: TPanel
          Left = 0
          Top = 0
          Width = 669
          Height = 309
          Align = alTop
          BevelOuter = bvNone
          TabOrder = 0
          object dxDBGrid: TdxDBGrid
            Left = 0
            Top = 0
            Width = 669
            Height = 309
            Bands = <
              item
              end>
            DefaultLayout = False
            HeaderPanelRowCount = 1
            KeyField = 'CONTRATO'
            ShowGroupPanel = True
            SummaryGroups = <>
            SummarySeparator = ', '
            Align = alClient
            TabOrder = 0
            OnMouseUp = dxDBGridMouseUp
            DataSource = ds
            Filter.Criteria = {00000000}
            LookAndFeel = lfFlat
            OptionsBehavior = [edgoAutoSort, edgoDragScroll, edgoEnterShowEditor, edgoExtMultiSelect, edgoImmediateEditor, edgoTabThrough, edgoVertThrough]
            OptionsDB = [edgoCancelOnExit, edgoCanNavigation, edgoConfirmDelete, edgoLoadAllRecords, edgoUseBookmarks, edgoUseLocate]
            OptionsView = [edgoBandHeaderWidth, edgoRowSelect, edgoUseBitmap]
            ShowRowFooter = True
            OnSelectedCountChange = dxDBGridSelectedCountChange
            object dxDBGridCONTRATO: TdxDBGridMaskColumn
              BandIndex = 0
              RowIndex = 0
              FieldName = 'CONTRATO'
            end
            object dxDBGridMATRICULA: TdxDBGridMaskColumn
              BandIndex = 0
              RowIndex = 0
              FieldName = 'MATRICULA'
            end
            object dxDBGridNOME: TdxDBGridMaskColumn
              BandIndex = 0
              RowIndex = 0
              FieldName = 'NOME'
            end
            object dxDBGridPLANO: TdxDBGridMaskColumn
              BandIndex = 0
              RowIndex = 0
              FieldName = 'PLANO'
            end
            object dxDBGridPATROCINADORA: TdxDBGridMaskColumn
              BandIndex = 0
              RowIndex = 0
              FieldName = 'PATROCINADORA'
            end
            object dxDBGridSITUACAO_PARTIC: TdxDBGridMaskColumn
              BandIndex = 0
              RowIndex = 0
              FieldName = 'SITUACAO_PARTIC'
            end
            object dxDBGridSITUACAO_CONTRATO: TdxDBGridMaskColumn
              BandIndex = 0
              RowIndex = 0
              FieldName = 'SITUACAO_CONTRATO'
            end
            object dxDBGridTIPOCONTRATO: TdxDBGridMaskColumn
              BandIndex = 0
              RowIndex = 0
              FieldName = 'TIPOCONTRATO'
            end
            object dxDBGridDATACREDITO: TdxDBGridDateColumn
              BandIndex = 0
              RowIndex = 0
              FieldName = 'DATACREDITO'
            end
            object dxDBGridTXJUROS: TdxDBGridMaskColumn
              BandIndex = 0
              RowIndex = 0
              FieldName = 'TXJUROS'
            end
            object dxDBGridPRESTACAOCONTR: TdxDBGridMaskColumn
              BandIndex = 0
              RowIndex = 0
              FieldName = 'PRESTACAOCONTR'
            end
            object dxDBGridSALDODEVANT: TdxDBGridMaskColumn
              BandIndex = 0
              RowIndex = 0
              FieldName = 'SALDODEVANT'
            end
            object dxDBGridQTDPRESTANT: TdxDBGridMaskColumn
              BandIndex = 0
              RowIndex = 0
              FieldName = 'QTDPRESTANT'
            end
            object dxDBGridVLRPRESTACAO: TdxDBGridMaskColumn
              BandIndex = 0
              RowIndex = 0
              FieldName = 'VLRPRESTACAO'
            end
            object dxDBGridATUALPRESTATRASO: TdxDBGridMaskColumn
              BandIndex = 0
              RowIndex = 0
              FieldName = 'ATUALPRESTATRASO'
            end
            object dxDBGridJUROSREMATRASO: TdxDBGridMaskColumn
              BandIndex = 0
              RowIndex = 0
              FieldName = 'JUROSREMATRASO'
            end
            object dxDBGridJUROSMORAATRASO: TdxDBGridMaskColumn
              BandIndex = 0
              RowIndex = 0
              FieldName = 'JUROSMORAATRASO'
            end
            object dxDBGridMULTAPRESTATRASO: TdxDBGridMaskColumn
              BandIndex = 0
              RowIndex = 0
              FieldName = 'MULTAPRESTATRASO'
            end
            object dxDBGridDEVOLUCAOPREST: TdxDBGridMaskColumn
              BandIndex = 0
              RowIndex = 0
              FieldName = 'DEVOLUCAOPREST'
            end
            object dxDBGridAJUSTEPREST: TdxDBGridMaskColumn
              BandIndex = 0
              RowIndex = 0
              FieldName = 'AJUSTEPREST'
            end
            object dxDBGridIOF: TdxDBGridMaskColumn
              BandIndex = 0
              RowIndex = 0
              FieldName = 'IOF'
            end
            object dxDBGridSEGURO: TdxDBGridMaskColumn
              BandIndex = 0
              RowIndex = 0
              FieldName = 'SEGURO'
            end
            object dxDBGridATUALMONSALDODEV: TdxDBGridMaskColumn
              BandIndex = 0
              RowIndex = 0
              FieldName = 'ATUALMONSALDODEV'
            end
            object dxDBGridJUROSREMSALDODEV: TdxDBGridMaskColumn
              BandIndex = 0
              RowIndex = 0
              FieldName = 'JUROSREMSALDODEV'
            end
            object dxDBGridAJUSTESALDODEV: TdxDBGridMaskColumn
              BandIndex = 0
              RowIndex = 0
              FieldName = 'AJUSTESALDODEV'
            end
            object dxDBGridAMORTIZSALDODEV: TdxDBGridMaskColumn
              BandIndex = 0
              RowIndex = 0
              FieldName = 'AMORTIZSALDODEV'
            end
            object dxDBGridQUITACAONORMAL: TdxDBGridMaskColumn
              BandIndex = 0
              RowIndex = 0
              FieldName = 'QUITACAONORMAL'
            end
            object dxDBGridQUITACAORENOVA: TdxDBGridMaskColumn
              BandIndex = 0
              RowIndex = 0
              FieldName = 'QUITACAORENOVA'
            end
            object dxDBGridSALDODEVATU: TdxDBGridMaskColumn
              BandIndex = 0
              RowIndex = 0
              FieldName = 'SALDODEVATU'
            end
            object dxDBGridPRESTDEVIDAS: TdxDBGridMaskColumn
              BandIndex = 0
              RowIndex = 0
              FieldName = 'PRESTDEVIDAS'
            end
            object dxDBGridSALDOINADIMPL: TdxDBGridMaskColumn
              BandIndex = 0
              RowIndex = 0
              FieldName = 'SALDOINADIMPL'
            end
            object dxDBGridPRESTATRASATU: TdxDBGridMaskColumn
              BandIndex = 0
              RowIndex = 0
              FieldName = 'PRESTATRASATU'
            end
            object dxDBGridVLRINADIMPLATU: TdxDBGridMaskColumn
              BandIndex = 0
              RowIndex = 0
              FieldName = 'VLRINADIMPLATU'
            end
            object dxDBGridQTDDIASATRASO: TdxDBGridMaskColumn
              BandIndex = 0
              RowIndex = 0
              FieldName = 'QTDDIASATRASO'
            end
            object dxDBGridPRECENTPROVISAO: TdxDBGridMaskColumn
              BandIndex = 0
              RowIndex = 0
              FieldName = 'PRECENTPROVISAO'
            end
            object dxDBGridSALDOPROVISAO: TdxDBGridMaskColumn
              BandIndex = 0
              RowIndex = 0
              FieldName = 'SALDOPROVISAO'
            end
            object dxDBGridLIMINAR: TdxDBGridMaskColumn
              BandIndex = 0
              RowIndex = 0
              FieldName = 'LIMINAR'
            end
            object dxDBGridTIPOSUSPENSAO: TdxDBGridMaskColumn
              BandIndex = 0
              RowIndex = 0
              FieldName = 'TIPOSUSPENSAO'
            end
            object dxDBGridQTDPRESTSUSP: TdxDBGridMaskColumn
              BandIndex = 0
              RowIndex = 0
              FieldName = 'QTDPRESTSUSP'
            end
          end
        end
        object Panel4: TPanel
          Left = 0
          Top = 320
          Width = 669
          Height = 67
          Align = alBottom
          BevelOuter = bvNone
          TabOrder = 1
          object Label3: TLabel
            Left = 8
            Top = 5
            Width = 227
            Height = 13
            Caption = 'Separador de colunas em arquivo texto:'
          end
          object cbSaveAll: TdxCheckEdit
            Left = 760
            Top = 11
            Width = 105
            TabOrder = 0
            Visible = False
            Caption = 'Save all records'
            StyleController = dxCheckEditStyleController
            State = cbsChecked
          end
          object cbLoadAllRecords: TdxCheckEdit
            Left = 776
            Top = 29
            Width = 105
            TabOrder = 1
            Visible = False
            Caption = 'Load All Records'
            StyleController = dxCheckEditStyleController
            State = cbsChecked
          end
          object cbMultiSelect: TdxCheckEdit
            Left = 892
            Top = 11
            Width = 91
            TabOrder = 2
            Visible = False
            Caption = 'Multi Select'
            StyleController = dxCheckEditStyleController
          end
          object cbShowFooter: TdxCheckEdit
            Left = 787
            Top = 75
            Width = 97
            TabOrder = 5
            Visible = False
            Caption = 'Mostra Totais'
            StyleController = dxCheckEditStyleController
          end
          object cbShowHeader: TdxCheckEdit
            Left = 803
            Top = 51
            Width = 97
            TabOrder = 4
            Visible = False
            Caption = 'ShowHeader'
            StyleController = dxCheckEditStyleController
          end
          object cbShowGrid: TdxCheckEdit
            Left = 892
            Top = 29
            Width = 93
            TabOrder = 3
            Visible = False
            Caption = 'ShowGrid'
            StyleController = dxCheckEditStyleController
          end
          object edtSeparador: TEdit
            Left = 235
            Top = 1
            Width = 20
            Height = 21
            MaxLength = 1
            TabOrder = 6
            Text = '^'
          end
        end
        object btnHtml: TBitBtn
          Left = 8
          Top = 350
          Width = 145
          Height = 37
          Caption = 'Salvar para HTML'
          TabOrder = 2
          OnClick = btnHtmlClick
          Glyph.Data = {
            76020000424D7602000000000000760000002800000020000000200000000100
            0400000000000002000000000000000000001000000000000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00880000000000
            0000007888888888888880F88888887A0007870788888888888880F888888877
            7777877078888888888880F88888887A0007877088888888888880FFFFFFFFFF
            FFFFF77008888888888880F87777777777777F70800888888888880700000000
            000077F088808888888888808877777777870008888088888888888080FFFFFF
            FF877088888808888888888080F8F8F8FF8770888888088888888880808F8F8F
            8F877088888808888888888080F8F8F8FF8770888888088888888880808F8F8F
            8F877088888808888888888080F8F8F8FF877088888808888888888080000000
            008770888888000788888880888888888887708888008870078888800FFFFFFF
            FFFF708800889877700788068000000000000880888888777770806868682727
            20788880888888777770807787827272707888808888FF8777700678E8E72727
            2707777088FF77088770078E728E727272000000FF778870088008E827272727
            270FFFF0778888777000088E827272727207F7708888FF87777008E8E8272727
            270FFFF088FF88888770808E828E72727077F770FF88888888808088E8272727
            20FFFFF088888888888088088E8272720F77F77F008888888008888008888800
            FFFFFFFF0700888008888888800000F77F77F77F0788000888888888888880FC
            CFCCFCCF07888888888888888888800000000000088888888888}
        end
        object btnExcel: TBitBtn
          Left = 161
          Top = 350
          Width = 145
          Height = 37
          Caption = 'Salvar para Excel'
          TabOrder = 3
          OnClick = btnExcelClick
          Glyph.Data = {
            16060000424D160600000000000076000000280000005A0000001E0000000100
            040000000000A005000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888880000
            000000006666660888888888887777777777778F8F8F78888888888800000000
            0000666666078800008F888888880777777770E0666666008888888888777777
            7777F7F8F8F87788888888880777777770E0666666007800000F888888880777
            777770806666660708888888887777777777F78F8F8F77088888888807777777
            7080666666070700000F888888880000000000E0000000077088888888777777
            7777F77777777777888888880000000000E00000000770000000888888888088
            88880E0EFEFEF0777088888888878888887878F8F8F777778888888880888888
            0E0EFEFEF07770088A2A8888888888088880E0EFEFEF07077088888888887888
            87878F8F8F7777778888888888088880E0EFEFEF070770001010888888888880
            880E0EFEFEF0788070888888888887887878F8F8F7788777888888888880880E
            0EFEFEF078807008000088888888888800E0EFEFEF0788880088888888888877
            878F8F8F7788887787777777777700E0EFEFEF07888800000000000000000000
            8E0EFEFEF0000000087777777777778878F8F8F7777777780000000000008E0E
            FEFEF0000000070088080FFFFFFFFF08E0EFEFEF0770FFFF087FFFFFFFFF7887
            8F8F8F7777FFFF780FFFFFFFFF08E0EFEFEF077088FF070000000FFFFFFFF08E
            0EFEFEF070770FFF0878888888878878F8F8F77777788F780FFFFFFFF08E0EFE
            FEF07077088F070101110F77777708E0EFEFEF078807707F087877777778878F
            8F8F778877777F780F77777708E0EFEFEF0788077088070000000F7FF7708E0E
            FEFEF0788880770F08787887778878F8F8F7788887777F780F7FF7708E0EFEFE
            F07888807708070000000F777708E0EFEFEF0708888807700878777778878F8F
            8F777888887777780F777708E0EFEFEF070888880770070022220F7FF70E0EFE
            FEF0FF7088888070087878877878F8F8F7887788888777780F7FF70E0EFEFEF0
            FF7088888070070000000F777700EFEFEF0777770888880008787777778F8F8F
            77777778888877780F777700EFEFEF07777708888800070000000F7FF7000000
            00F7FF7F80000000087878877777777787887887777777780F7FF700000000F7
            FF7F80000000070400400F7777777777777777777777777F0878777777777777
            7777777777777F780F7777777777777777777777777F070000000F7FF7FF7FF7
            FF7FF7FF7FF7FF7F08787887887887887887887887887F780F7FF7FF7FF7FF7F
            F7FF7FF7FF7F070000000F7777777777777777777777777F0878777777777777
            7777777777777F780F7777777777777777777777777F0777F7FF0F7FF7FF7FF7
            FF7FF7FF7FF7FF7F08787887887887887887887887887F780F7FF7FF7FF7FF7F
            F7FF7FF7FF7F076655440F7777777777777777777777777F0878777777777777
            7777777777777F780F7777777777777777777777777F07BB33B30F7FF7FF7FF7
            FF7FF7FF7FF7FF7F08787887887887887887887887887F780F7FF7FF7FF7FF7F
            F7FF7FF7FF7F079999DD0F7777777777777777777777777F0878777777777777
            7777777777777F780F7777777777777777777777777F07CCCCCC0F7FF7FF7FF7
            FF7FF7FF7FF7FF7F08787887887887887887887887887F780F7FF7FF7FF7FF7F
            F7FF7FF7FF7F070000000F7777777777777777777777777F0878777777777777
            7777777777777F780F7777777777777777777777777F070000000FFFFFFFFFFF
            FFFFFFFFFFFFFFFF08788FFFFFFFF88888888888888FFF780FFFFFFFFFFFFFFF
            FFFFFFFFFFFF070000000F55555555FFFFFFFFFFFFFF555F0878777777778888
            8888888888777F780F55555555FFFFFFFFFFFFFF555F070000040FFFFFFFFFFF
            FFFFFFFFFFFFFFFF08788888888888888888888888888F780FFFFFFFFFFFFFFF
            FFFFFFFFFFFF0700000000000000000000000000000000000877777777777777
            7777777777777778000000000000000000000000000008000000}
          NumGlyphs = 3
        end
        object btnXml: TBitBtn
          Left = 314
          Top = 350
          Width = 145
          Height = 37
          Caption = 'Salvar para XML'
          TabOrder = 4
          OnClick = btnXmlClick
          Glyph.Data = {
            76060000424D7606000000000000760000002800000060000000200000000100
            0400000000000006000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
            7777777777777777777777777777777777777777777777777777777777777777
            7777777777777777777777777777788888888888888888877777777777777777
            7777777777777777777777777777788888888888888888877777777777777888
            8888888888888887777777777777888888888888888887777777777777777888
            888888888888888777777777777000000000000000000887777777777778F7F7
            F7F7F7F7F7F7F87777777777777778888888888888888887777777777770FF87
            FFFFFFFFFFFF08877777777777787777777777777777F8777777777777000000
            000000000000888777777777777078787FFFFFFF78FF088777777777777888FF
            77FFFFFFF7F7F87777777777770FF87FFFFFFFFFFFF088877777777777700087
            8F7777F7878F0887777777777778FF87788888887787F8777777777777078787
            FFFFFFF78FF08887777777777791100878FFFF90787808877777777777877FF8
            777F778F8777F8777777777777000878F7777F7878F088877777777777911107
            878FF9100787088777777777778777F87788787FF877F8777777777779110087
            8FFFF9078780888777777777779111007878F9110078088777777777778777FF
            87777877FF87F877777777777911107878FF9100787088877777777777911110
            0787911110070887777777777787777FF87787777FF8F8777777777779111007
            878F911007808887777777777799111100791111110008877777777777887777
            FF88777777FF8877777777777911110078791111007088877777777777791111
            10011111110F088777777777777877777FF7777777F8F8777777777779911110
            079111111000888777777777777991111111111110FF08877777777777788777
            777777777F87F87777777777779111110011111110F088877777777777709911
            111111110FFF0887777777777778887777777777F877F8777777777777991111
            111111110FF08887777777777770F991111111107F7F08877777777777787887
            7777777F87F7F877777777777709911111111110FFF08887777777777770FF99
            1111110787FF08877777777777787F88777777F87887F87777777777770F9911
            11111107F7F08887777777777770FFF911111108787F08877777777777787878
            777777F87777F87777777777770FF991111110787FF08887777777777770FF79
            11111100878F08877777777777787F78777777FF8777F87777777777770FFF91
            1111108787F08887777777777770FFF911111110087808877777777777787878
            7777777FF877F87777777777770FF7911111100878F08887777777777770FF91
            1111111107870887777777777778778777777777F877F87777777777770FFF91
            1111110087808887777777777770FF9111199111007808877777777777787787
            77788777FF87F87777777777770FF9111111111078708887777777777770F911
            1107991110070887777777777778787777F888777FF8F87777777777770FF911
            1199111007808887777777777770F911107FF991110008887777777777787877
            7F87788777FF887777777777770F911110799111007088877777777777709111
            107FFF991110088877777777777887777F87FF88777FF87777777777770F9111
            07FF991110008887777777777770911107F777F9911100877777777777788777
            F87888788777FF87777777777709111107FFF991110088877777777777799911
            0FFFFFFF991110777777777777788777F777777788777F777777777777091110
            7F777F9911100888777777777770F999FFFFFFFFF99117777777777777787888
            77777777788787777777777777999110FFFFFFF9911108887777777777700000
            00000000079977777777777777788888888888888788777777777777770F999F
            FFFFFFFF99118887777777777777777777777777777777777777777777777777
            7777777777777777777777777700000000000000799788777777777777777777
            7777777777777777777777777777777777777777777777777777777777777777
            7777777777777777777777777777777777777777777777777777777777777777
            7777777777777777777777777777777777777777777777777777}
          NumGlyphs = 3
        end
        object btnTxt: TBitBtn
          Left = 467
          Top = 350
          Width = 145
          Height = 37
          Caption = 'Salvar para Texto'
          TabOrder = 5
          OnClick = btnTxtClick
          Glyph.Data = {
            76020000424D7602000000000000760000002800000020000000200000000100
            0400000000000002000000000000000000001000000000000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777777
            7777777777778888877777777777777777777777778000008877777777777777
            7777777770077777088777777777777777777777077700007088788877777777
            7888887077707777070800087777777700000870770877777007090887777777
            0999070777087777777770908888888099908707770877777777709000000000
            9990770777087777777777099999999999087707770877777788770990000009
            9907770777087777700877709087709990877770770887770708777090887099
            9077777077708880770877770908099908777777077700077708777709080999
            0777777770077770070877777090999087777778888000077007777770909990
            78777800000887777777777777099908078800CCCCC088777777777777099907
            7000CCCCCC0008877777777777709087770CCCCC007700887777777777709077
            7770CCC077770C0887777777777707777770000777770CC08777777777777777
            7770C0887880CCC087777777777777777870CC08000CCCC07777777777777777
            0770CC0870CCCC0777777777777777708770CC08770000777777777777777770
            8870CC087770088777777777777777700880CC08770CC0887777777777777770
            C00CCC0880CCCC087777777777777770CCCCCC000CCC00077777777777777777
            0CCCC0770CC07777777777777777777770000777700777777777}
        end
      end
    end
    inherited Panel1: TPanel
      Width = 677
      inherited fcLabel1: TfcLabel
        Width = 337
        Caption = 'Movimentação Mensal [ Seleção ]'
      end
    end
  end
  inherited Dock971: TDock97
    Top = 430
    Width = 677
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 619
    Top = 355
  end
  object qryQuitacaoMorte: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   SUM(DECODE(NVL(HME.FLGESTORNADO, 0), 1,'
      '             0,'
      
        '             DECODE(ITC.ITCTRATASALDODEV, 1, (HME.HMEVLRPREVISTO' +
        ' * (-1)),'
      '                                          2, HME.HMEVLRPREVISTO,'
      '                                          0'
      '                   )'
      '             )'
      '      ) AS HMEVLRPREVISTO,'
      ''
      '   SUM(DECODE(NVL(HME.PLNCODIGO, 0), 0,'
      '             0,'
      
        '             DECODE(ITC.ITCTRATASALDODEV, 1, (HME.HMEVLRPREVISTO' +
        ' * (-1)),'
      '                                          2, HME.HMEVLRPREVISTO,'
      '                                          0'
      '                   )'
      '             )'
      '      ) AS VLR_CONTAB,'
      ''
      '   SUM(DECODE(NVL(HME.PLNCODIGOESTORNO, 0), 0,'
      '             0,'
      
        '             DECODE(ITC.ITCTRATASALDODEV, 1, (HME.HMEVLRPREVISTO' +
        ' * (-1)),'
      '                                          2, HME.HMEVLRPREVISTO,'
      '                                          0'
      '                   )'
      '             )'
      '      ) AS VLR_ESTORNADO_CONTAB'
      ''
      'FROM'
      '   HISTMOVEMPTMO   HME,'
      '   CONTRATOEMPTMO  CON,'
      '   ITEMXTIPOCONTR  ITC'
      ''
      'WHERE'
      '       ITC.ITCTRATASALDODEV     <> 0'
      '   AND CON.IDCONTRATOEMPTMO      =:PIDCONTRATOEMPTMO'
      '   AND CON.FLGSITUACAO          <> '#39'C'#39
      '   AND HME.HMETIPOMOV            = 3'
      '   AND HME.HMEORIGEM             = 8'
      '--   AND NVL(HME.FLGESTORNADO, 0)  = 0'
      
        '   AND HME.HMEDATAPREVISTA       BETWEEN :PHMEDATAINI AND :PHMED' +
        'ATAFIM'
      '   AND HME.IDCONTRATOEMPTMO      = CON.IDCONTRATOEMPTMO'
      '   AND CON.IDTIPOCONTREMPTMO     = ITC.IDTIPOCONTREMPTMO'
      '   AND HME.IDITEMEMPTMO          = ITC.IDITEMEMPTMO')
    ValidateWithMask = True
    Left = 216
    Top = 184
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAFIM'
        ParamType = ptInput
      end>
    object qryQuitacaoMorteHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
    end
    object qryQuitacaoMorteVLR_CONTAB: TFloatField
      FieldName = 'VLR_CONTAB'
    end
    object qryQuitacaoMorteVLR_ESTORNADO_CONTAB: TFloatField
      FieldName = 'VLR_ESTORNADO_CONTAB'
    end
  end
  object qryQuitacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   SUM(DECODE(NVL(HME.FLGESTORNADO, 0), 1,'
      '             0,'
      
        '             DECODE(ITC.ITCTRATASALDODEV, 1, (HME.HMEVLRPREVISTO' +
        ' * (-1)),'
      '                                          2, HME.HMEVLRPREVISTO,'
      '                                          0'
      '                   )'
      '             )'
      '      ) AS HMEVLRPREVISTO,'
      ''
      '   SUM(DECODE(NVL(HME.PLNCODIGO, 0), 0,'
      '             0,'
      
        '             DECODE(ITC.ITCTRATASALDODEV, 1, (HME.HMEVLRPREVISTO' +
        ' * (-1)),'
      '                                          2, HME.HMEVLRPREVISTO,'
      '                                          0'
      '                   )'
      '             )'
      '      ) AS VLR_CONTAB,'
      ''
      '   SUM(DECODE(NVL(HME.PLNCODIGOESTORNO, 0), 0,'
      '             0,'
      
        '             DECODE(ITC.ITCTRATASALDODEV, 1, (HME.HMEVLRPREVISTO' +
        ' * (-1)),'
      '                                          2, HME.HMEVLRPREVISTO,'
      '                                          0'
      '                   )'
      '             )'
      '      ) AS VLR_ESTORNADO_CONTAB'
      'FROM'
      '   HISTMOVEMPTMO   HME,'
      '   CONTRATOEMPTMO  CON,'
      '   ITEMXTIPOCONTR  ITC'
      ''
      'WHERE'
      '       ITC.ITCTRATASALDODEV     <> 0'
      '   AND CON.IDCONTRATOEMPTMO      =:PIDCONTRATOEMPTMO'
      '   AND CON.FLGSITUACAO          <> '#39'C'#39
      '   AND HME.HMETIPOMOV            = 3'
      '   AND HME.HMEORIGEM            <> 8'
      '--   AND NVL(HME.FLGESTORNADO, 0)  = 0'
      
        '   AND HME.HMEDATAPREVISTA       BETWEEN :PHMEDATAINI AND :PHMED' +
        'ATAFIM'
      '   AND HME.IDCONTRATOEMPTMO      = CON.IDCONTRATOEMPTMO'
      '   AND CON.IDTIPOCONTREMPTMO     = ITC.IDTIPOCONTREMPTMO'
      '   AND HME.IDITEMEMPTMO          = ITC.IDITEMEMPTMO')
    ValidateWithMask = True
    Left = 256
    Top = 160
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAFIM'
        ParamType = ptInput
      end>
    object qryQuitacaoHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
    end
    object qryQuitacaoVLR_CONTAB: TFloatField
      FieldName = 'VLR_CONTAB'
    end
    object qryQuitacaoVLR_ESTORNADO_CONTAB: TFloatField
      FieldName = 'VLR_ESTORNADO_CONTAB'
    end
  end
  object qryMovimentoNormal: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   SUM(DECODE(NVL(HME.FLGESTORNADO, 0), 1,'
      '             0,'
      
        '             DECODE(ITC.ITCTRATASALDODEV, 1, (HME.HMEVLRPREVISTO' +
        ' * (-1)),'
      '                                          2, HME.HMEVLRPREVISTO,'
      '                                          0'
      '                   )'
      '             )'
      '      ) AS HMEVLRPREVISTO,'
      ''
      '   SUM(DECODE(NVL(HME.FLGESTORNADO, 0), 1,'
      '             0,'
      '             DECODE(HME.HMECENTRALIZA,0,0,HME.HMEVLRPREVISTO)'
      '             )'
      '      ) AS HMEVLRPREVCENTR,'
      ''
      ''
      '   SUM(DECODE(NVL(HME.PLNCODIGO, 0), 0,'
      '             0,'
      
        '             DECODE(ITC.ITCTRATASALDODEV, 1, (HME.HMEVLRPREVISTO' +
        ' * (-1)),'
      '                                          2, HME.HMEVLRPREVISTO,'
      '                                          0'
      '                   )'
      '             )'
      '      ) AS VLR_CONTAB,'
      ''
      '   SUM(DECODE(NVL(HME.PLNCODIGOESTORNO, 0), 0,'
      '             0,'
      
        '             DECODE(ITC.ITCTRATASALDODEV, 1, (HME.HMEVLRPREVISTO' +
        ' * (-1)),'
      '                                          2, HME.HMEVLRPREVISTO,'
      '                                          0'
      '                   )'
      '             )'
      '      ) AS VLR_ESTORNADO_CONTAB'
      ''
      'FROM'
      '   HISTMOVEMPTMO   HME,'
      '   CONTRATOEMPTMO  CON,'
      '   TIPOSUSPEMPTMO  TSE,'
      '   ITEMXTIPOCONTR  ITC'
      ''
      'WHERE'
      '       ITC.ITCTRATASALDODEV     <> 0'
      '   AND CON.IDCONTRATOEMPTMO      =:PIDCONTRATOEMPTMO'
      '   AND CON.FLGSITUACAO          <> '#39'C'#39
      '   AND HME.HMETIPOMOV            =:PHMETIPOMOV'
      
        '   AND (:PIDITEMEMPTMO IS NULL OR HME.IDITEMEMPTMO = :PIDITEMEMP' +
        'TMO)'
      ''
      '   AND ('
      '       NVL(HME.FLGSUSPENSAO, 0) = 0 OR'
      
        '       (NVL(HME.FLGSUSPENSAO, 0) <> 0 AND NVL(TSE.FLGATUALSALDOP' +
        'ARC, 0) = 1)'
      '       )'
      '   AND HME.IDTIPOSUSPEMPTMO     = TSE.IDTIPOSUSPEMPTMO(+)'
      ''
      
        '   AND HME.HMEDATAPREVISTA       BETWEEN :PHMEDATAINI AND :PHMED' +
        'ATAFIM'
      '   AND HME.IDCONTRATOEMPTMO      = CON.IDCONTRATOEMPTMO'
      '   AND CON.IDTIPOCONTREMPTMO     = ITC.IDTIPOCONTREMPTMO'
      '   AND HME.IDITEMEMPTMO          = ITC.IDITEMEMPTMO'
      '')
    ValidateWithMask = True
    Left = 224
    Top = 112
    ParamData = <
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PHMETIPOMOV'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDITEMEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDITEMEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAFIM'
        ParamType = ptInput
      end>
    object qryMovimentoNormalHMEVLRPREVISTO: TFloatField
      FieldName = 'HMEVLRPREVISTO'
    end
    object qryMovimentoNormalVLR_CONTAB: TFloatField
      FieldName = 'VLR_CONTAB'
    end
    object qryMovimentoNormalVLR_ESTORNADO_CONTAB: TFloatField
      FieldName = 'VLR_ESTORNADO_CONTAB'
    end
    object qryMovimentoNormalHMEVLRPREVCENTR: TFloatField
      FieldName = 'HMEVLRPREVCENTR'
    end
  end
  object qryContrato: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CON.IDCONTRATOEMPTMO,'
      '   DEP.MATRICULA,'
      '   MUT.NOME,'
      '   PPC.NOME AS NOMEPLANO,'
      '   PTR.NOME AS NOMEPATRO,'
      
        '   DECODE(CON.IDBENEF, CON.IDPESSOA, SIT.DESCRICAO, '#39'PENSIONISTA' +
        #39') AS SIT_PART,'
      '   DECODE(CON.FLGSITUACAO,'#39'A'#39', '#39'Contrato Ativo'#39','
      '                          '#39'C'#39', '#39'Contrato Cancelado'#39','
      '                          '#39'E'#39', '#39'Contrato Encerrado'#39','
      '                          '#39'Q'#39', '#39'Contrato Quitado'#39','
      '                          '#39'R'#39', '#39'Contrato Refinanciado'#39','
      '                          '#39'S'#39', '#39'Contrato Suspenso'#39','
      '                          '#39'P'#39', '#39'Contrato Pendente de Liberação'#39','
      
        '                          '#39'K'#39', '#39'Contrato Pendente de Quitação'#39') ' +
        'AS DESCSITCONTRATO,'
      '   TCE.TCEDESCRICAO,'
      '   CON.DATACREDITO,'
      '   CON.TXJUROS'
      'FROM'
      '   PESSOA            MUT,'
      '   PESSOA            PTR,'
      '   DEPENTIT          DEP,'
      '   PARTPREVPLAN      PPP,'
      '   SITPART           SIT,'
      '   TIPOCONTREMPTMO   TCE,'
      '   TIPOEMPTMO        TEP,'
      '   PLANPREVXCONTABIL PXC,'
      '   PLANPREVCONTABIL  PPC,'
      '   CONTRATOEMPTMO    CON'
      ''
      'WHERE'
      '       TEP.IDEMPRESAPROP         =:PIDEMPRESAPROP'
      '   AND CON.IDPATRO               =:PIDPATRO'
      '   AND PXC.IDPLANOPREV           =:IDPLANOPREV'
      '   AND CON.FLGSITUACAO           <> '#39'C'#39
      '   AND PPP.FLGDESATIVADO         = 0'
      '   AND TCE.IDTIPOCONTREMPTMO     =:PIDTIPOCONTREMPTMO'
      '   '
      
        '   AND (:PIDTIPOCONTRFILTRO      IS NULL OR TCE.IDTIPOCONTREMPTM' +
        'O =:PIDTIPOCONTRFILTRO)'
      
        '   AND (:PIDTIPOEMPTMO           IS NULL OR TEP.IDTIPOEMPTMO    ' +
        '  =:PIDTIPOEMPTMO)'
      
        '   AND (:PIDCONTRATOEMPTMO       IS NULL OR CON.IDCONTRATOEMPTMO' +
        '  =:PIDCONTRATOEMPTMO)'
      ''
      '   AND'
      '   EXISTS ('
      '          SELECT /*+INDEX(HME XIE29HISTMOVEMPTMO) */ 1'
      '          FROM'
      '             HISTMOVEMPTMO HME'
      '          WHERE'
      
        '                 HME.HMEDATAPREVISTA       BETWEEN :PHMEDATAINI ' +
        'AND :PHMEDATAFIM'
      '             AND NVL(HME.FLGESTORNADO, 0)  = 0'
      
        '             AND HME.IDCONTRATOEMPTMO      = CON.IDCONTRATOEMPTM' +
        'O'
      
        '             AND (:PIDCONTRATOEMPTMO       IS NULL OR HME.IDCONT' +
        'RATOEMPTMO  =:PIDCONTRATOEMPTMO)'
      '          )'
      ''
      '   AND CON.IDPLANOORIGEM         = PXC.IDPLANPREVC'
      '   AND PXC.IDPLANOPREV           = PPC.IDPLANOPREV'
      '   AND CON.IDPATRO               = PTR.IDPESSOA'
      '   AND CON.IDBENEF               = MUT.IDPESSOA'
      '   AND CON.IDBENEF               = DEP.IDPESSOA'
      '   AND CON.IDPESSOA              = DEP.IDTITULAR'
      ''
      '   AND CON.IDPESSOA              = PPP.IDPESSOA'
      '   AND PPP.IDSITPART             = SIT.IDSITPART'
      ''
      '   AND CON.IDTIPOCONTREMPTMO     = TCE.IDTIPOCONTREMPTMO'
      '   AND TCE.IDTIPOEMPTMO          = TEP.IDTIPOEMPTMO'
      'ORDER BY'
      '   CON.IDCONTRATOEMPTMO'
      ''
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 128
    Top = 128
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDEMPRESAPROP'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDPATRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'IDPLANOPREV'
        ParamType = ptInput
      end
      item
        DataType = ftUnknown
        Name = 'PIDTIPOCONTREMPTMO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTRFILTRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCONTRFILTRO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAINI'
        ParamType = ptInput
      end
      item
        DataType = ftDate
        Name = 'PHMEDATAFIM'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftFloat
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
    object qryContratoIDCONTRATOEMPTMO: TFloatField
      FieldName = 'IDCONTRATOEMPTMO'
    end
    object qryContratoMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 15
    end
    object qryContratoNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryContratoNOMEPLANO: TStringField
      FieldName = 'NOMEPLANO'
      Size = 50
    end
    object qryContratoNOMEPATRO: TStringField
      FieldName = 'NOMEPATRO'
      Size = 60
    end
    object qryContratoSIT_PART: TStringField
      FieldName = 'SIT_PART'
      Size = 50
    end
    object qryContratoDESCSITCONTRATO: TStringField
      FieldName = 'DESCSITCONTRATO'
      Size = 30
    end
    object qryContratoTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      Size = 60
    end
    object qryContratoDATACREDITO: TDateTimeField
      FieldName = 'DATACREDITO'
    end
    object qryContratoTXJUROS: TFloatField
      FieldName = 'TXJUROS'
    end
  end
  object qryLookTipoContr: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   TCE.IDTIPOCONTREMPTMO,'
      '   TCE.TCEDESCRICAO,'
      ''
      '   TCE.IDPLANOPREV,'
      ''
      '   TEP.IDTIPOEMPTMO,'
      '   TEP.DESCTIPOEMPTMO'
      ''
      'FROM'
      '   TIPOCONTREMPTMO TCE,'
      '   TIPOEMPTMO      TEP'
      ''
      'WHERE'
      '       ( TEP.IDEMPRESAPROP    =:PIDEMPRESAPROP )'
      '   AND ( TCE.IDTIPOEMPTMO     = TEP.IDTIPOEMPTMO )'
      ''
      'ORDER BY'
      '   TCE.TCEDESCRICAO')
    ValidateWithMask = True
    Left = 56
    Top = 112
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDEMPRESAPROP'
        ParamType = ptInput
      end>
    object qryLookTipoContrIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.IDTIPOCONTREMPTMO'
    end
    object qryLookTipoContrTCEDESCRICAO: TStringField
      FieldName = 'TCEDESCRICAO'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.TCEDESCRICAO'
      Size = 60
    end
    object qryLookTipoContrIDTIPOEMPTMO: TFloatField
      FieldName = 'IDTIPOEMPTMO'
      Origin = 'BASEDADOS.TIPOEMPTMO.IDTIPOEMPTMO'
    end
    object qryLookTipoContrDESCTIPOEMPTMO: TStringField
      FieldName = 'DESCTIPOEMPTMO'
      Origin = 'BASEDADOS.TIPOEMPTMO.DESCTIPOEMPTMO'
      Size = 60
    end
    object qryLookTipoContrIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
      Origin = 'BASEDADOS.TIPOCONTREMPTMO.IDPLANOPREV'
    end
  end
  object dxCheckEditStyleController: TdxCheckEditStyleController
    ButtonStyle = btsDefault
    Left = 472
    Top = 240
  end
  object SaveDialog: TSaveDialog
    FileName = 'ExpGrid'
    Options = [ofOverwritePrompt, ofHideReadOnly]
    Left = 294
    Top = 308
  end
  object pmDetail: TPopupMenu
    Left = 368
    Top = 304
    object piDelete: TMenuItem
      Caption = '&Retira coluna'
    end
  end
  object MainMenu1: TMainMenu
    Left = 440
    Top = 304
    object miEdit: TMenuItem
      Caption = '&Edit'
      Visible = False
      object miDelete: TMenuItem
        Caption = '&Retira coluna'
        Visible = False
      end
    end
  end
  object cds: TClientDataSet
    Aggregates = <>
    Params = <>
    ProviderName = 'dsp'
    Left = 128
    Top = 296
    object cdsCONTRATO: TFloatField
      FieldName = 'CONTRATO'
    end
    object cdsMATRICULA: TStringField
      FieldName = 'MATRICULA'
      Size = 15
    end
    object cdsNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object cdsPLANO: TStringField
      FieldName = 'PLANO'
      Size = 50
    end
    object cdsPATROCINADORA: TStringField
      FieldName = 'PATROCINADORA'
      Size = 60
    end
    object cdsSITUACAO_PARTIC: TStringField
      FieldName = 'SITUACAO_PARTIC'
      Size = 50
    end
    object cdsSITUACAO_CONTRATO: TStringField
      FieldName = 'SITUACAO_CONTRATO'
      Size = 30
    end
    object cdsTIPOCONTRATO: TStringField
      FieldName = 'TIPOCONTRATO'
      Size = 60
    end
    object cdsDATACREDITO: TDateTimeField
      FieldName = 'DATACREDITO'
    end
    object cdsTXJUROS: TFloatField
      FieldName = 'TXJUROS'
    end
    object cdsPRESTACAOCONTR: TFloatField
      FieldName = 'PRESTACAOCONTR'
    end
    object cdsSALDODEVANT: TFloatField
      FieldName = 'SALDODEVANT'
    end
    object cdsQTDPRESTANT: TFloatField
      FieldName = 'QTDPRESTANT'
    end
    object cdsVLRPRESTACAO: TFloatField
      FieldName = 'VLRPRESTACAO'
    end
    object cdsATUALPRESTATRASO: TFloatField
      FieldName = 'ATUALPRESTATRASO'
    end
    object cdsJUROSREMATRASO: TFloatField
      FieldName = 'JUROSREMATRASO'
    end
    object cdsJUROSMORAATRASO: TFloatField
      FieldName = 'JUROSMORAATRASO'
    end
    object cdsMULTAPRESTATRASO: TFloatField
      FieldName = 'MULTAPRESTATRASO'
    end
    object cdsDEVOLUCAOPREST: TFloatField
      FieldName = 'DEVOLUCAOPREST'
    end
    object cdsAJUSTEPREST: TFloatField
      FieldName = 'AJUSTEPREST'
    end
    object cdsIOF: TFloatField
      FieldName = 'IOF'
    end
    object cdsSEGURO: TFloatField
      FieldName = 'SEGURO'
    end
    object cdsATUALMONSALDODEV: TFloatField
      FieldName = 'ATUALMONSALDODEV'
    end
    object cdsJUROSREMSALDODEV: TFloatField
      FieldName = 'JUROSREMSALDODEV'
    end
    object cdsAJUSTESALDODEV: TFloatField
      FieldName = 'AJUSTESALDODEV'
    end
    object cdsAMORTIZSALDODEV: TFloatField
      FieldName = 'AMORTIZSALDODEV'
    end
    object cdsQUITACAONORMAL: TFloatField
      FieldName = 'QUITACAONORMAL'
    end
    object cdsQUITACAORENOVA: TFloatField
      FieldName = 'QUITACAORENOVA'
    end
    object cdsSALDODEVATU: TFloatField
      FieldName = 'SALDODEVATU'
    end
    object cdsPRESTDEVIDAS: TFloatField
      FieldName = 'PRESTDEVIDAS'
    end
    object cdsSALDOINADIMPL: TFloatField
      FieldName = 'SALDOINADIMPL'
    end
    object cdsPRESTATRASATU: TFloatField
      FieldName = 'PRESTATRASATU'
    end
    object cdsVLRINADIMPLATU: TFloatField
      FieldName = 'VLRINADIMPLATU'
    end
    object cdsQTDDIASATRASO: TFloatField
      FieldName = 'QTDDIASATRASO'
    end
    object cdsPRECENTPROVISAO: TFloatField
      FieldName = 'PRECENTPROVISAO'
    end
    object cdsSALDOPROVISAO: TFloatField
      FieldName = 'SALDOPROVISAO'
    end
    object cdsLIMINAR: TStringField
      FieldName = 'LIMINAR'
      FixedChar = True
      Size = 1
    end
    object cdsTIPOSUSPENSAO: TStringField
      FieldName = 'TIPOSUSPENSAO'
      FixedChar = True
      Size = 30
    end
    object cdsQTDPRESTSUSP: TFloatField
      FieldName = 'QTDPRESTSUSP'
    end
  end
  object dsp: TDataSetProvider
    DataSet = qry
    Constraints = True
    Left = 120
    Top = 248
  end
  object qry: TQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CON.IDCONTRATOEMPTMO AS CONTRATO,'
      '   DEP.MATRICULA,'
      '   MUT.NOME,'
      '   PPC.NOME AS PLANO,'
      '   PTR.NOME AS PATROCINADORA,'
      
        '   DECODE(CON.IDBENEF, CON.IDPESSOA, SIT.DESCRICAO, '#39'PENSIONISTA' +
        #39') AS SITUACAO_PARTIC,'
      '   DECODE(CON.FLGSITUACAO,'#39'A'#39', '#39'Contrato Ativo'#39','
      '                          '#39'C'#39', '#39'Contrato Cancelado'#39','
      '                          '#39'E'#39', '#39'Contrato Encerrado'#39','
      '                          '#39'Q'#39', '#39'Contrato Quitado'#39','
      '                          '#39'R'#39', '#39'Contrato Refinanciado'#39','
      '                          '#39'S'#39', '#39'Contrato Suspenso'#39','
      '                          '#39'P'#39', '#39'Contrato Pendente de Liberação'#39','
      
        '                          '#39'K'#39', '#39'Contrato Pendente de Quitação'#39') ' +
        'AS SITUACAO_CONTRATO,'
      '   TCE.TCEDESCRICAO AS TIPOCONTRATO,'
      '   CON.DATACREDITO,'
      '   CON.TXJUROS,'
      '   0 AS PRESTACAOCONTR,'
      '   0 AS SALDODEVANT,'
      '   0 AS QTDPRESTANT,'
      '   0 AS VLRPRESTACAO,'
      '   0 AS ATUALPRESTATRASO,'
      '   0 AS JUROSREMATRASO,'
      '   0 AS JUROSMORAATRASO,'
      '   0 AS MULTAPRESTATRASO,'
      '   0 AS DEVOLUCAOPREST,'
      '   0 AS AJUSTEPREST,'
      '   0 AS IOF,'
      '   0 AS SEGURO,'
      '   0 AS ATUALMONSALDODEV,'
      '   0 AS JUROSREMSALDODEV,'
      '   0 AS AJUSTESALDODEV,'
      '   0 AS AMORTIZSALDODEV,'
      '   0 AS QUITACAONORMAL,'
      '   0 AS QUITACAORENOVA,'
      '   0 AS SALDODEVATU,'
      '   0 AS PRESTDEVIDAS,'
      '   0 AS SALDOINADIMPL,'
      '   0 AS PRESTATRASATU,'
      '   0 AS VLRINADIMPLATU,'
      '   0 AS QTDDIASATRASO,'
      '   0 AS PRECENTPROVISAO,'
      '   0 AS SALDOPROVISAO,'
      '   '#39'N'#39' AS LIMINAR,'
      '   '#39'                              '#39' AS TIPOSUSPENSAO,'
      '   0 AS QTDPRESTSUSP'
      'FROM'
      '   PESSOA            MUT,'
      '   PESSOA            PTR,'
      '   DEPENTIT          DEP,'
      '   PARTPREVPLAN      PPP,'
      '   SITPART           SIT,'
      '   TIPOCONTREMPTMO   TCE,'
      '   TIPOEMPTMO        TEP,'
      '   PLANPREVXCONTABIL PXC,'
      '   PLANPREVCONTABIL  PPC,'
      '   CONTRATOEMPTMO    CON'
      ''
      'WHERE'
      '       1 = 2'
      ''
      ' ')
    Left = 64
    Top = 296
  end
  object ds: TDataSource
    DataSet = cds
    Left = 60
    Top = 246
  end
end
