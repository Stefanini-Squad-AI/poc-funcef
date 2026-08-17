inherited frmParamContabFolha: TfrmParamContabFolha
  Left = 185
  Top = 118
  HelpContext = 210068
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsToolWindow
  Caption = 'Contabilização/Contas a Pagar da Folha de Pagamento'
  ClientHeight = 406
  ClientWidth = 496
  Font.Style = []
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 496
    Height = 367
    BorderWidth = 2
    object pnlResult: TPanel
      Left = 4
      Top = 4
      Width = 488
      Height = 359
      Align = alClient
      BevelOuter = bvNone
      Caption = 'pnlResult'
      TabOrder = 1
      object memResult: TMemo
        Left = 0
        Top = 0
        Width = 395
        Height = 359
        Align = alLeft
        Color = clBlack
        Font.Charset = ANSI_CHARSET
        Font.Color = clLime
        Font.Height = -9
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        ReadOnly = True
        ScrollBars = ssVertical
        TabOrder = 0
      end
      object bbtnVoltar: TBitBtn
        Left = 404
        Top = 162
        Width = 80
        Height = 40
        Caption = '&Voltar'
        Font.Charset = DEFAULT_CHARSET
        Font.Color = clWindowText
        Font.Height = -11
        Font.Name = 'MS Sans Serif'
        Font.Style = [fsBold]
        ParentFont = False
        TabOrder = 1
        OnClick = bbtnVoltarClick
        Glyph.Data = {
          E6000000424DE60000000000000076000000280000000E0000000E0000000100
          0400000000007000000000000000000000001000000010000000000000000000
          BF0000BF000000BFBF00BF000000BF00BF00BFBF0000C0C0C000808080000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00DDDDDDDDDDDD
          DD00DDDDD4444DDDDD00DDD44444444DDD00DD444DDDD444DD00DD44DDDDDD44
          DD00D44DDDDDDDD44D00D44DDDDDDDD44D00D44DDDDDDDD44D00D44DDDDDDDD4
          4D00DD44DDDD4D44DD00DD44DDDD4444DD00DDDDDDDD444DDD00DDDDDDDD4444
          DD00DDDDDDDDDDDDDD00}
      end
    end
    object pnlSelecao: TPanel
      Left = 4
      Top = 4
      Width = 488
      Height = 359
      Align = alClient
      BevelOuter = bvNone
      TabOrder = 0
      object gbxMesAnoRef: TGroupBox
        Left = 9
        Top = 109
        Width = 250
        Height = 46
        Caption = 'Mês e Ano de Referência'
        TabOrder = 1
        object cmbMes: TComboBox
          Left = 8
          Top = 15
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
        object speAno: TSpinEdit
          Left = 158
          Top = 15
          Width = 79
          Height = 22
          MaxValue = 0
          MinValue = 0
          TabOrder = 1
          Value = 0
        end
      end
      object rgConsolida: TRadioGroup
        Left = 264
        Top = 109
        Width = 215
        Height = 46
        Caption = 'Consolida Rubricas da Mesma Conta ?'
        Columns = 2
        ItemIndex = 0
        Items.Strings = (
          'Sim'
          'Não')
        TabOrder = 2
      end
      object gbxEstabelecimento: TGroupBox
        Left = 9
        Top = 158
        Width = 345
        Height = 45
        Caption = 'Estabelecimento'
        TabOrder = 3
        object dblkcbEstabelecimento: TwwDBLookupCombo
          Left = 8
          Top = 15
          Width = 330
          Height = 21
          Ctl3D = True
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'NOME'#9'60'#9'Estabelecimento')
          LookupTable = qryEstab
          LookupField = 'CODIGO'
          ParentCtl3D = False
          TabOrder = 0
          AutoDropDown = True
          ShowButton = True
          OrderByDisplay = False
          AllowClearKey = True
        end
      end
      object gbxMotivo: TGroupBox
        Left = 9
        Top = 206
        Width = 470
        Height = 144
        Caption = 'Tipo de Folha'
        TabOrder = 4
        object chkMotivo: TCheckListBox
          Left = 9
          Top = 15
          Width = 318
          Height = 120
          OnClickCheck = chkMotivoClickCheck
          ItemHeight = 13
          Style = lbOwnerDrawFixed
          TabOrder = 0
          OnDrawItem = chkMotivoDrawItem
        end
        object spbtInvSelecao: TBitBtn
          Left = 332
          Top = 15
          Width = 131
          Height = 25
          Caption = '   Seleciona Todos'
          TabOrder = 1
          TabStop = False
          OnClick = spbtInvSelecaoClick
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
        object spbtSelTodos: TBitBtn
          Left = 332
          Top = 41
          Width = 131
          Height = 25
          Caption = '   Inverte Seleção'
          TabOrder = 2
          TabStop = False
          OnClick = spbtSelTodosClick
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
      object gbxOpcoes: TGroupBox
        Left = 9
        Top = 4
        Width = 470
        Height = 101
        TabOrder = 0
        object PageControl1: TPageControl
          Left = 6
          Top = 12
          Width = 458
          Height = 83
          ActivePage = tbshContab
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -9
          Font.Name = 'MS Sans Serif'
          Font.Style = []
          ParentFont = False
          TabOrder = 0
          object tbshContab: TTabSheet
            Caption = 'Contabilização'
            object gbxTipoPag: TGroupBox
              Left = 4
              Top = 3
              Width = 441
              Height = 44
              Caption = 'Tipo de Operação'
              TabOrder = 0
              object dblcTipOper: TwwDBLookupCombo
                Left = 9
                Top = 15
                Width = 423
                Height = 21
                DropDownAlignment = taLeftJustify
                Selected.Strings = (
                  'TIPDESCRICAO'#9'25'#9'Descrição')
                LookupTable = qryTipoOper
                LookupField = 'TIPCODIGO'
                TabOrder = 0
                AutoDropDown = True
                ShowButton = True
                SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
                AllowClearKey = True
              end
            end
          end
          object tbshCAP: TTabSheet
            Caption = 'Contas a Pagar'
            object Label11: TLabel
              Left = 340
              Top = 2
              Width = 80
              Height = 13
              Caption = 'Data Pagamento'
            end
            object Label1: TLabel
              Left = 8
              Top = 2
              Width = 94
              Height = 13
              Caption = 'Tipo de Documento'
            end
            object dtPagamento: TCMDateTimePicker
              Left = 340
              Top = 16
              Width = 100
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
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clWindowText
              Font.Height = -11
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              ShowButton = True
              TabOrder = 1
            end
            object dblcTipoDoc: TwwDBLookupCombo
              Left = 8
              Top = 16
              Width = 327
              Height = 21
              DropDownAlignment = taLeftJustify
              Selected.Strings = (
                'DESCRICAO'#9'35'#9'DESCRICAO')
              LookupTable = qryTipoDoc
              LookupField = 'CODTIPDOC'
              TabOrder = 0
              AutoDropDown = True
              ShowButton = True
              SeqSearchOptions = [ssoEnabled, ssoCaseSensitive]
              AllowClearKey = True
            end
            object chkRateioCC: TCheckBox
              Left = 145
              Top = 38
              Width = 172
              Height = 17
              Caption = '   Ratear por Centro de Custo'
              Font.Charset = DEFAULT_CHARSET
              Font.Color = clNavy
              Font.Height = -9
              Font.Name = 'MS Sans Serif'
              Font.Style = []
              ParentFont = False
              TabOrder = 2
            end
          end
          object tbshOpcoesCAP: TTabSheet
            Caption = 'Seleção de Tipos de Desembolso'
            ImageIndex = 2
            object chkTipoDes: TCheckListBox
              Left = 0
              Top = 3
              Width = 313
              Height = 49
              OnClickCheck = chkMotivoClickCheck
              ItemHeight = 13
              Style = lbOwnerDrawFixed
              TabOrder = 0
              OnDrawItem = chkMotivoDrawItem
            end
            object bbtnSelTipo: TBitBtn
              Left = 319
              Top = 2
              Width = 131
              Height = 25
              Caption = '   Seleciona Todos'
              TabOrder = 1
              TabStop = False
              OnClick = bbtnSelTipoClick
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
            object bbtnInvTipo: TBitBtn
              Left = 319
              Top = 27
              Width = 131
              Height = 25
              Caption = '   Inverte Seleção'
              TabOrder = 2
              TabStop = False
              OnClick = bbtnInvTipoClick
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
        end
      end
      object rgProcesso: TRadioGroup
        Left = 356
        Top = 158
        Width = 121
        Height = 45
        Caption = 'Processo'
        Columns = 2
        ItemIndex = 1
        Items.Strings = (
          'Prévia'
          'Final')
        TabOrder = 5
        TabStop = True
      end
    end
  end
  inherited Dock971: TDock97
    Top = 367
    Width = 496
    inherited tb97Fundo: TToolbar97
      Left = 247
      DockPos = 326
      inherited sep1: TToolbarSep97
        Left = 163
      end
      object ToolbarSep971: TToolbarSep97 [1]
        Left = 80
        Top = 0
        Blank = True
        SizeHorz = 3
      end
      inherited bbtnSair: TBitBtn
        Left = 83
      end
      inherited bbtnAjuda: TmaHelpBitBtn
        Left = 165
      end
      object bbtnConfirmar: TBitBtn
        Left = 0
        Top = 0
        Width = 80
        Height = 33
        Caption = '&OK'
        Default = True
        ModalResult = 1
        TabOrder = 2
        OnClick = bbtnConfirmarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888002222200
          88888887788888778F88887222222222088888788888888878F887A228822222
          208887F88FFF888887F887A2FFF8222220888788777FF888878F7A22FFFF8222
          22087F887777FF88887F7A22FFFFF82222087F8877777FF8887F7A22FF8FFF82
          22087F8877F777FF887F7A22FF82FFF822087F8877F8777F887F7A22FF222FF8
          220878F87788877FF87887A2222222FF208887F88888887787F887A222222222
          2088878F888888888788887AA222222208888878FF88888F788888877AAAAA77
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
      end
    end
  end
  object pnlProgresso: TPanel [2]
    Left = 13
    Top = 394
    Width = 470
    Height = 91
    BevelWidth = 2
    Caption = 'Aguarde. Processando informações...'
    TabOrder = 2
    Visible = False
    object gagProgresso: TGauge
      Left = 14
      Top = 58
      Width = 438
      Height = 22
      ForeColor = clNavy
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = []
      ParentFont = False
      Progress = 0
    end
    object fcLabel3: TfcLabel
      Left = 14
      Top = 4
      Width = 438
      Height = 25
      AutoSize = False
      Caption = 'Gerando Contabilização e/ou Contas a Pagar'
      Font.Charset = ANSI_CHARSET
      Font.Color = clWhite
      Font.Height = -21
      Font.Name = 'Times New Roman'
      Font.Style = [fsBold]
      ParentFont = False
      TextOptions.Alignment = taCenter
      TextOptions.LineSpacing = 1
      TextOptions.Shadow.Enabled = True
      TextOptions.Shadow.XOffset = 2
      TextOptions.Shadow.YOffset = 2
      TextOptions.VAlignment = vaTop
      Transparent = True
    end
    object Bevel11: TBevel
      Left = 14
      Top = 31
      Width = 438
      Height = 6
      Shape = bsTopLine
      Style = bsRaised
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    Left = 41
    Top = 302
    TargetsData = (
      1
      1
      (
        ''
        'Text'
        0))
  end
  object qryParamRH: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  NORMALINI,'
      '  NORMALFIM'
      'FROM PARAMRH')
    ValidateWithMask = True
    Left = 59
    Top = 235
  end
  object qryMotivo: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT IDMOTIVO,DESCRICAO '
      'FROM MOTIVO '
      'where GRUPOMOTIVO  IN ('#39'F'#39', '#39'D'#39')'
      'ORDER BY upper(DESCRICAO)')
    ValidateWithMask = True
    Left = 215
    Top = 271
    object qryMotivoDESCRICAO: TStringField
      DisplayLabel = 'Descrição'
      DisplayWidth = 50
      FieldName = 'DESCRICAO'
      Origin = 'MOTIVO.DESCRICAO'
      Size = 50
    end
    object qryMotivoIDMOTIVO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDMOTIVO'
      Origin = 'MOTIVO.IDMOTIVO'
      Visible = False
    end
  end
  object qryTipoOper: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT '
      '  TIPCODIGO,'
      '  TIPDESCRICAO'
      'FROM TIPOPER'
      'ORDER BY UPPER(TIPDESCRICAO)')
    ValidateWithMask = True
    Left = 287
    Top = 271
  end
  object qryContabFolha: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 287
    Top = 258
  end
  object qryAuxContab: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 287
    Top = 246
  end
  object qryContasCC: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT * FROM CONTASxCC')
    ValidateWithMask = True
    Left = 215
    Top = 258
  end
  object qryAux: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 215
    Top = 245
  end
  object qryContas: TwwQuery
    DatabaseName = 'BaseDados'
    ValidateWithMask = True
    Left = 215
    Top = 233
  end
  object qryTipoDoc: TwwQuery
    DatabaseName = 'BASEDADOS'
    SQL.Strings = (
      'SELECT '
      '  CODTIPDOC,'
      '  DESCRICAO,'
      '  DEBCRE'
      'FROM TIPODOCRECPAG'
      'WHERE  RECPAG = '#39'P'#39
      'ORDER BY UPPER(DESCRICAO)')
    ValidateWithMask = True
    Left = 287
    Top = 233
  end
  object qryEstab: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '  PJ.IDPESSOA AS CODIGO, PJ.NOME'
      'FROM'
      '  PESSOA PJ, FILIALPESSOA FP'
      'WHERE'
      ''
      '  (PJ.IDGRUPO        = :EMPRESA) AND'
      '  (FP.IDFILIALPESSOA = PJ.IDPESSOA)')
    ValidateWithMask = True
    Left = 139
    Top = 232
    ParamData = <
      item
        DataType = ftInteger
        Name = 'EMPRESA'
        ParamType = ptUnknown
      end>
  end
  object qryTipoDes: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '  T.CODTIPRECDES,'
      '  T.DESCRICAO'
      'FROM tiporecebdesemb T, CONTABFOLHA C'
      'WHERE'
      '  C.CODTIPRECDES = T.CODTIPRECDES'
      'ORDER BY UPPER(DESCRICAO)')
    ValidateWithMask = True
    Left = 377
    Top = 298
  end
  object tblDocumentos: TTable
    Left = 136
    Top = 295
  end
end
