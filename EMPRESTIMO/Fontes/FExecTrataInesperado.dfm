inherited frmExecTrataInesperado: TfrmExecTrataInesperado
  Left = 74
  Top = 110
  HelpContext = 150029
  Caption = 'Tratamento de Valores Não Programados'
  ClientHeight = 429
  ClientWidth = 712
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 712
    Height = 396
    inherited pgcControle: TPageControl
      Width = 712
      Height = 363
      inherited TabSheet1: TTabSheet
        Caption = 'Tratamento de Valores Não Programados [ seleção ]'
        object Label2: TLabel
          Left = 16
          Top = 50
          Width = 112
          Height = 13
          Caption = 'Tipo de Empréstimo'
        end
        object Label3: TLabel
          Left = 360
          Top = 50
          Width = 96
          Height = 13
          Caption = 'Tipo de Contrato'
        end
        object GroupBox1: TGroupBox
          Left = 16
          Top = 231
          Width = 329
          Height = 41
          Caption = ' Forma(s) de Envio '
          TabOrder = 6
          object chkFolhaPatro: TCheckBox
            Left = 16
            Top = 17
            Width = 137
            Height = 17
            Caption = 'Folha Patrocinadora'
            Checked = True
            State = cbChecked
            TabOrder = 0
          end
          object chkFolhaBenef: TCheckBox
            Left = 160
            Top = 17
            Width = 137
            Height = 17
            Caption = 'Folha de Benefícios'
            Checked = True
            State = cbChecked
            TabOrder = 1
          end
        end
        object rdgOrdenacao: TRadioGroup
          Left = 361
          Top = 278
          Width = 328
          Height = 59
          Caption = ' Ordenar por: '
          Columns = 2
          ItemIndex = 0
          Items.Strings = (
            'Nome'
            'Matrícula'
            'Nº do Contrato')
          TabOrder = 7
        end
        inline molContratoEmptmo: TmolContratoEmptmo
          Left = 8
          Top = 8
          Width = 601
          inherited edtNome: TEdit
            Width = 345
          end
          inherited btnBuscaContrato: TBitBtn
            Left = 544
          end
          inherited btnLimpaContrato: TBitBtn
            Left = 568
          end
          inherited edtIdContrato: TEdit
            Width = 105
          end
        end
        object DBcboTipoEmptmo: TwwDBLookupCombo
          Left = 16
          Top = 64
          Width = 329
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
          DropDownWidth = 8
          ParentFont = False
          TabOrder = 1
          AutoDropDown = False
          ShowButton = True
          UseTFields = False
          AllowClearKey = True
          ShowMatchText = True
          OnCloseUp = DBcboTipoEmptmoCloseUp
          OnExit = DBcboTipoEmptmoExit
        end
        object DBcboTipoContrato: TwwDBLookupCombo
          Left = 360
          Top = 64
          Width = 329
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
          LookupField = 'IDTipoContrEmptmo'
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
          Left = 8
          Top = 88
          Width = 345
          Height = 137
          TabOrder = 3
          inherited Label6: TLabel
            Width = 86
          end
          inherited lstPatro: TCheckListBox
            Width = 329
            Height = 121
          end
          inherited btnInvertePatro: TBitBtn
            Left = 295
          end
          inherited btnMarcaTodosPatro: TBitBtn
            Left = 316
          end
        end
        inline molListaPlano: TmolListaPlano
          Left = 352
          Top = 88
          Width = 337
          Height = 129
          TabOrder = 4
          inherited Label6: TLabel
            Width = 119
          end
          inherited lstPlano: TCheckListBox
            Width = 329
            Height = 105
          end
          inherited btnInvertePlano: TBitBtn
            Left = 295
          end
          inherited btnMarcaTodosPlano: TBitBtn
            Left = 316
          end
        end
        object Panel3: TPanel
          Left = 361
          Top = 216
          Width = 328
          Height = 57
          TabOrder = 5
          object Label1: TLabel
            Left = 112
            Top = 10
            Width = 116
            Height = 13
            Caption = 'Cobrança (mês/ano)'
          end
          object chkCobranca: TCheckBox
            Left = 16
            Top = 26
            Width = 105
            Height = 17
            Caption = 'aplicar filtro:   '
            Checked = True
            Enabled = False
            State = cbChecked
            TabOrder = 0
          end
          object DBspnAnoCobranca: TwwDBSpinEdit
            Left = 256
            Top = 24
            Width = 57
            Height = 21
            Increment = 1
            TabOrder = 2
            UnboundDataType = wwDefault
          end
          object cboMesCobranca: TComboBox
            Left = 112
            Top = 24
            Width = 145
            Height = 21
            Style = csDropDownList
            ItemHeight = 13
            TabOrder = 1
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
        Caption = 'Tratamento de Valores Não Programados [ Tratamento ]'
        object Label7: TLabel
          Left = 408
          Top = 284
          Width = 191
          Height = 13
          Caption = 'Valor total a Abater/Incorporar:   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        object Label5: TLabel
          Left = 16
          Top = 284
          Width = 184
          Height = 13
          Caption = 'Valor total a Devolver/Cobrar:   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        object Bevel1: TBevel
          Left = 16
          Top = 308
          Width = 673
          Height = 9
          Shape = bsTopLine
        end
        object lblHoraEncerra: TLabel
          Left = 16
          Top = 324
          Width = 126
          Height = 13
          Caption = 'Hora Encerramento:   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        object Label4: TLabel
          Left = 268
          Top = 324
          Width = 327
          Height = 13
          Caption = 'Data de Vencimento para os Itens a Cobrar / Devolver:   '
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
          Visible = False
        end
        object edtVlrAbateIncorpora: TEdit
          Left = 592
          Top = 280
          Width = 97
          Height = 21
          TabOrder = 5
        end
        object edtVlrCobraDevolve: TEdit
          Left = 192
          Top = 280
          Width = 97
          Height = 21
          TabOrder = 4
        end
        object DBgrdTmpDesc: TwwDBGrid
          Left = 16
          Top = 34
          Width = 673
          Height = 279
          Selected.Strings = (
            'FLGDEVOLVE'#9'7'#9'Dev/Cob'#9'F'
            'FLGINCORPORA'#9'5'#9'Aceita'#9'F'
            'NOME'#9'23'#9'NOME'#9'F'
            'MATRICULA'#9'13'#9'Matrícula'#9'F'
            'IDDESCONTO'#9'14'#9'Contrato'#9'F'
            'MESCOBRANCA'#9'7'#9'Cob'#9'F'
            'MESREFERENCIA'#9'7'#9'Ref'#9'F'
            'VALORRECEBIDO'#9'12'#9'Vlr.Receb.'#9'F'
            'IDPROVENTO'#9'10'#9'Rub.Int.'#9'F'
            'CODPROVDESC'#9'15'#9'Rub.Ext.'#9'F'
            'IDTMPDESC'#9'13'#9'IDTmpDesc'#9'F')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          EditControlOptions = [ecoCheckboxSingleClick, ecoSearchOwnerForm]
          DataSource = dtsTmpDesc
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Arial'
          Font.Style = []
          KeyOptions = []
          Options = [dgEditing, dgAlwaysShowEditor, dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgRowSelect, dgAlwaysShowSelection, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
          ParentFont = False
          TabOrder = 0
          TitleAlignment = taCenter
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -11
          TitleFont.Name = 'Arial'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          UseTFields = False
          IndicatorColor = icBlack
        end
        object Panel4: TPanel
          Left = 16
          Top = 8
          Width = 673
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Valores não Programados'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
        object edtHoraEncerra: TCMDateTimePicker
          Left = 136
          Top = 320
          Width = 97
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          Color = clBtnFace
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
          ReadOnly = True
          ShowButton = True
          TabOrder = 2
          UnboundDataType = wwDTEdtTime
          Visible = False
        end
        object edtDataVencto: TCMDateTimePicker
          Left = 592
          Top = 320
          Width = 97
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          Color = clBtnFace
          ButtonStyle = cbsCustom
          Epoch = 1950
          ButtonWidth = 21
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
          ReadOnly = True
          ShowButton = True
          TabOrder = 3
          UnboundDataType = wwDTEdtTime
          DisplayFormat = 'dd/mm/yyyy'
          Visible = False
        end
      end
      object TabSheet3: TTabSheet
        Caption = 'Tratamento de Valores Não Programados [ Resultado ]'
        ImageIndex = 2
        TabVisible = False
        object memResult: TMemo
          Left = 16
          Top = 34
          Width = 673
          Height = 303
          Font.Charset = ANSI_CHARSET
          Font.Color = clWindowText
          Font.Height = -11
          Font.Name = 'Courier New'
          Font.Style = []
          ParentFont = False
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 1
        end
        object Panel2: TPanel
          Left = 16
          Top = 8
          Width = 673
          Height = 27
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Itens Tratados'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Arial'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 0
        end
      end
    end
    inherited Panel1: TPanel
      Width = 712
      inherited fcLabel1: TfcLabel
        Width = 526
        Caption = 'Tratamento de Valores Não Programados [ seleção ]'
      end
    end
  end
  inherited Dock971: TDock97
    Top = 396
    Width = 712
    inherited tb97Fundo: TToolbar97
      inherited bbtnAjuda: TmaHelpBitBtn
        ClickHelpContext = 150025
      end
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 755
    Top = 3
  end
  object qryTmpDesc: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   0 AS FLGDEVOLVE,'
      '   0 AS FLGINCORPORA,'
      ''
      '   TMP.IDTMPDESC,'
      ''
      '   TMP.MESCOBRANCA, TMP.MESREFERENCIA,'
      
        '   TMP.FLGDESCFOLHA,                                            ' +
        '                              '
      
        '   TMP.SITENVIO,                                                ' +
        '                              '
      
        '   TMP.IDDESCONTO,                                              ' +
        '                              '
      
        '   TMP.ORDEM,                                                   ' +
        '                              '
      ''
      
        '   ROUND(NVL(TMP.VALOR, 0), 2)         AS VALOR,                ' +
        '                              '
      
        '   ROUND(NVL(TMP.VALORRECEBIDO, 0), 2) AS VALORRECEBIDO,        ' +
        '                              '
      
        '   TMP.DATARECEBIMENTO,                                         ' +
        '                              '
      ''
      
        '   TMP.FLGTIPODESC,                                             ' +
        '                              '
      
        '   TMP.FLGATRASODEVOL,                                          ' +
        '                              '
      ''
      
        '   TMP.IDPROVENTO, TMP.CODPROVDESC,                             ' +
        '                              '
      ''
      
        '   TMP.MATRICULA, TMP.INSCRICAONUMERO,                          ' +
        '                              '
      
        '   TMP.IDTITULAR, TMP.IDPESSOA,                                 ' +
        '                              '
      ''
      
        '   TMP.IDPESSJUR, TMP.IDPLANOPREV,                              ' +
        '                              '
      
        '   TMP.IDLOTE,                                                  ' +
        '                              '
      
        '   TMP.LOTEPREVIA,                                              ' +
        '                              '
      ''
      '   TMP.NUMPRIORIDADE,'
      
        '   TMP.DESCRICAO,                                               ' +
        '                              '
      ''
      
        '   TMP.DATAREFERENCIA, TMP.REFERENCIA,                          ' +
        '                              '
      
        '   TMP.DATACOBRANCA,                                            ' +
        '                              '
      
        '   TMP.FLGDESCONTO,                                             ' +
        '                              '
      ''
      
        '   TMP.RECPAG,                                                  ' +
        '                              '
      
        '   TMP.IDMODULO,                                                ' +
        '                              '
      
        '   TMP.SISTORIGEM,                                              ' +
        '                              '
      
        '   TMP.IDMOTIVO,                                                ' +
        '                              '
      
        '   TMP.IDEMPRESAPROP,                                           ' +
        '                              '
      
        '   TMP.IDEMPRESA,                                               ' +
        '                              '
      
        '   TMP.IDFUNDACAO,                                              ' +
        '                              '
      ''
      
        '   TMP.SEQPROPOSTA,                                             ' +
        '                              '
      
        '   TMP.NODOCUMENTO, TMP.COMPLDOCUMENTO,                         ' +
        '                              '
      ''
      '   CON.FLGSITUACAO,'
      '   CON.IDTIPOCONTREMPTMO,'
      '   PES.NOME'
      ''
      'FROM'
      '   TMPDESC         TMP,'
      '   PESSOA          PES,'
      '   CONTRATOEMPTMO  CON,'
      '   TIPOCONTREMPTMO TCE,'
      '   TIPOEMPTMO      TEP'
      ''
      'WHERE  1 = 2'
      '   AND TMP.IDMODULO           IN (15, 32)'
      '   AND TMP.VALORRECEBIDO      IS NOT NULL'
      '   AND TMP.FLGTIPODESC        = '#39'E'#39
      '   AND RTRIM(TMP.MESCOBRANCA) = 1'
      '   AND TMP.IDHISTMOVEMPTMO    IS NULL'
      '   AND TMP.IDDESCONTO         = CON.IDCONTRATOEMPTMO'
      '   AND TMP.IDPESSOA           = PES.IDPESSOA'
      '   AND CON.IDTIPOCONTREMPTMO  = TCE.IDTIPOCONTREMPTMO'
      '   AND TCE.IDTIPOEMPTMO       = TEP.IDTIPOEMPTMO'
      ''
      'ORDER BY'
      '   PES.NOME, TMP.IDDESCONTO, TMP.MESREFERENCIA, TMP.IDPROVENTO')
    UpdateObject = updTmpDesc
    ControlType.Strings = (
      'FLGDEVOLVE;CheckBox;1;0'
      'FLGINCORPORA;CheckBox;1;0')
    ValidateWithMask = True
    Left = 616
    object qryTmpDescFLGDEVOLVE: TFloatField
      FieldName = 'FLGDEVOLVE'
    end
    object qryTmpDescFLGINCORPORA: TFloatField
      FieldName = 'FLGINCORPORA'
    end
    object qryTmpDescMESCOBRANCA: TStringField
      FieldName = 'MESCOBRANCA'
      FixedChar = True
      Size = 7
    end
    object qryTmpDescMESREFERENCIA: TStringField
      FieldName = 'MESREFERENCIA'
      FixedChar = True
      Size = 7
    end
    object qryTmpDescFLGDESCFOLHA: TStringField
      FieldName = 'FLGDESCFOLHA'
      FixedChar = True
      Size = 1
    end
    object qryTmpDescSITENVIO: TStringField
      FieldName = 'SITENVIO'
      FixedChar = True
      Size = 1
    end
    object qryTmpDescIDDESCONTO: TFloatField
      FieldName = 'IDDESCONTO'
    end
    object qryTmpDescORDEM: TFloatField
      FieldName = 'ORDEM'
    end
    object qryTmpDescVALOR: TFloatField
      FieldName = 'VALOR'
    end
    object qryTmpDescVALORRECEBIDO: TFloatField
      FieldName = 'VALORRECEBIDO'
    end
    object qryTmpDescDATARECEBIMENTO: TDateTimeField
      FieldName = 'DATARECEBIMENTO'
    end
    object qryTmpDescFLGTIPODESC: TStringField
      FieldName = 'FLGTIPODESC'
      FixedChar = True
      Size = 1
    end
    object qryTmpDescFLGATRASODEVOL: TStringField
      FieldName = 'FLGATRASODEVOL'
      FixedChar = True
      Size = 1
    end
    object qryTmpDescIDPROVENTO: TFloatField
      FieldName = 'IDPROVENTO'
    end
    object qryTmpDescCODPROVDESC: TStringField
      FieldName = 'CODPROVDESC'
      Size = 15
    end
    object qryTmpDescMATRICULA: TStringField
      FieldName = 'MATRICULA'
      FixedChar = True
      Size = 13
    end
    object qryTmpDescINSCRICAONUMERO: TFloatField
      FieldName = 'INSCRICAONUMERO'
    end
    object qryTmpDescIDTITULAR: TFloatField
      FieldName = 'IDTITULAR'
    end
    object qryTmpDescIDPESSOA: TFloatField
      FieldName = 'IDPESSOA'
    end
    object qryTmpDescIDPESSJUR: TFloatField
      FieldName = 'IDPESSJUR'
    end
    object qryTmpDescIDPLANOPREV: TFloatField
      FieldName = 'IDPLANOPREV'
    end
    object qryTmpDescIDLOTE: TFloatField
      FieldName = 'IDLOTE'
    end
    object qryTmpDescLOTEPREVIA: TFloatField
      FieldName = 'LOTEPREVIA'
    end
    object qryTmpDescNUMPRIORIDADE: TFloatField
      FieldName = 'NUMPRIORIDADE'
    end
    object qryTmpDescDESCRICAO: TStringField
      FieldName = 'DESCRICAO'
      Size = 40
    end
    object qryTmpDescDATAREFERENCIA: TDateTimeField
      FieldName = 'DATAREFERENCIA'
    end
    object qryTmpDescREFERENCIA: TStringField
      FieldName = 'REFERENCIA'
      Size = 10
    end
    object qryTmpDescDATACOBRANCA: TDateTimeField
      FieldName = 'DATACOBRANCA'
    end
    object qryTmpDescFLGDESCONTO: TFloatField
      FieldName = 'FLGDESCONTO'
    end
    object qryTmpDescRECPAG: TStringField
      FieldName = 'RECPAG'
      FixedChar = True
      Size = 1
    end
    object qryTmpDescIDMODULO: TFloatField
      FieldName = 'IDMODULO'
    end
    object qryTmpDescSISTORIGEM: TStringField
      FieldName = 'SISTORIGEM'
      FixedChar = True
      Size = 2
    end
    object qryTmpDescIDMOTIVO: TFloatField
      FieldName = 'IDMOTIVO'
    end
    object qryTmpDescIDEMPRESAPROP: TFloatField
      FieldName = 'IDEMPRESAPROP'
    end
    object qryTmpDescIDEMPRESA: TFloatField
      FieldName = 'IDEMPRESA'
    end
    object qryTmpDescIDFUNDACAO: TFloatField
      FieldName = 'IDFUNDACAO'
    end
    object qryTmpDescSEQPROPOSTA: TFloatField
      FieldName = 'SEQPROPOSTA'
    end
    object qryTmpDescNODOCUMENTO: TFloatField
      FieldName = 'NODOCUMENTO'
    end
    object qryTmpDescCOMPLDOCUMENTO: TStringField
      FieldName = 'COMPLDOCUMENTO'
      FixedChar = True
      Size = 3
    end
    object qryTmpDescFLGSITUACAO: TStringField
      FieldName = 'FLGSITUACAO'
      FixedChar = True
      Size = 1
    end
    object qryTmpDescIDTIPOCONTREMPTMO: TFloatField
      FieldName = 'IDTIPOCONTREMPTMO'
    end
    object qryTmpDescNOME: TStringField
      FieldName = 'NOME'
      Size = 60
    end
    object qryTmpDescIDTMPDESC: TFloatField
      FieldName = 'IDTMPDESC'
    end
  end
  object qryBuscaParcela: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   HME.IDITEMEMPTMO,'
      '   HME.HMEPARCELA,'
      '   HME.HMENUMPARCELAS,'
      '   HME.HMESALDODEV,'
      '   HME.HMECENTRALIZA,'
      '   HME.HMEDESTACADO'
      'FROM'
      '   HISTMOVEMPTMO HME,'
      '   ('
      '   SELECT'
      '      MAX(H.IDHISTMOVEMPTMO) AS IDHISTMOVEMPTMO'
      '   FROM'
      '      HISTMOVEMPTMO H,'
      '      ('
      '      SELECT'
      '         MAX(HMEPARCELA) AS HMEPARCELA'
      '      FROM'
      '         HISTMOVEMPTMO'
      '      WHERE'
      '         IDCONTRATOEMPTMO =:PIDCONTRATOEMPTMO'
      '      ) P'
      '   WHERE'
      '          H.IDCONTRATOEMPTMO  =:PIDCONTRATOEMPTMO'
      '      AND H.HMETIPOMOV        = 1'
      '      AND ( H.HMECENTRALIZA   = 1 OR H.HMEDESTACADO = 1 )'
      '      AND ( H.FLGESTORNADO    = 0 OR H.FLGESTORNADO IS NULL )'
      '      AND H.HMEPARCELA        = P.HMEPARCELA'
      '   ) PAR'
      'WHERE'
      '       HME.IDCONTRATOEMPTMO   =:PIDCONTRATOEMPTMO'
      '   AND HME.IDHISTMOVEMPTMO    = PAR.IDHISTMOVEMPTMO')
    ValidateWithMask = True
    Left = 264
    Top = 160
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
    object qryBuscaParcelaIDITEMEMPTMO: TFloatField
      FieldName = 'IDITEMEMPTMO'
    end
    object qryBuscaParcelaHMEPARCELA: TFloatField
      FieldName = 'HMEPARCELA'
    end
    object qryBuscaParcelaHMENUMPARCELAS: TFloatField
      FieldName = 'HMENUMPARCELAS'
    end
    object qryBuscaParcelaHMECENTRALIZA: TFloatField
      FieldName = 'HMECENTRALIZA'
    end
    object qryBuscaParcelaHMEDESTACADO: TFloatField
      FieldName = 'HMEDESTACADO'
    end
    object qryBuscaParcelaHMESALDODEV: TFloatField
      FieldName = 'HMESALDODEV'
    end
  end
  object qryRubrica: TwwQuery
    ValidateWithMask = True
    Left = 53
    Top = 159
  end
  object dtsTmpDesc: TwwDataSource
    DataSet = qryTmpDesc
    Left = 616
    Top = 12
  end
  object updTmpDesc: TUpdateSQL
    Left = 616
    Top = 24
  end
  object qrySituacaoContrato: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   CON.FLGSITUACAO'
      'FROM'
      '   CONTRATOEMPTMO CON'
      'WHERE'
      '   CON.IDCONTRATOEMPTMO =:PIDCONTRATOEMPTMO')
    ValidateWithMask = True
    Left = 508
    Top = 159
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
    object qrySituacaoContratoFLGSITUACAO: TStringField
      FieldName = 'FLGSITUACAO'
      Origin = 'BASEDADOS.CONTRATOEMPTMO.FLGSITUACAO'
      FixedChar = True
      Size = 1
    end
  end
  object qryUpdateSituacao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'UPDATE'
      '   CONTRATOEMPTMO CON'
      'SET'
      '   CON.FLGSITUACAO =:PFLGSITUACAO'
      'WHERE'
      '   CON.IDCONTRATOEMPTMO =:PIDCONTRATOEMPTMO')
    ValidateWithMask = True
    Left = 508
    Top = 171
    ParamData = <
      item
        DataType = ftString
        Name = 'PFLGSITUACAO'
        ParamType = ptInput
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOEMPTMO'
        ParamType = ptInput
      end>
  end
end
