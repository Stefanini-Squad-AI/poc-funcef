inherited frmCadProposta: TfrmCadProposta
  Left = 72
  Top = 197
  HelpContext = 640079
  Caption = 'Propostas de Investimento'
  ClientHeight = 412
  ClientWidth = 706
  PixelsPerInch = 96
  TextHeight = 13
  inherited pnlFundo: TPanel
    Width = 706
    Height = 344
    TabOrder = 1
    object pgc: TPageControl
      Left = 2
      Top = 2
      Width = 702
      Height = 340
      ActivePage = tbsGeral
      Align = alClient
      TabOrder = 0
      object tbsGeral: TTabSheet
        Caption = 'Dados Gerais'
        object Label1: TLabel
          Left = 16
          Top = 10
          Width = 100
          Height = 13
          Caption = 'Data da Proposta'
        end
        object Label2: TLabel
          Left = 16
          Top = 58
          Width = 51
          Height = 13
          Caption = 'Proposta'
        end
        object Label20: TLabel
          Left = 16
          Top = 98
          Width = 187
          Height = 13
          Caption = 'Tipo de Imóvel / Enquadramento'
        end
        object Label12: TLabel
          Left = 280
          Top = 98
          Width = 94
          Height = 13
          Caption = 'Apresentada por'
        end
        object Label15: TLabel
          Left = 536
          Top = 58
          Width = 87
          Height = 13
          Caption = 'Nº da Proposta'
        end
        object Bevel2: TBevel
          Left = 16
          Top = 144
          Width = 657
          Height = 3
          Shape = bsTopLine
        end
        object Label16: TLabel
          Left = 16
          Top = 154
          Width = 66
          Height = 13
          Caption = 'Proponente'
        end
        object Bevel3: TBevel
          Left = 16
          Top = 240
          Width = 657
          Height = 3
          Shape = bsTopLine
        end
        object Label17: TLabel
          Left = 16
          Top = 194
          Width = 66
          Height = 13
          Caption = 'Proprietário'
        end
        object Label19: TLabel
          Left = 16
          Top = 264
          Width = 5
          Height = 13
        end
        object Label21: TLabel
          Left = 16
          Top = 250
          Width = 96
          Height = 13
          Caption = 'Usuário Inclusão'
        end
        object Label22: TLabel
          Left = 592
          Top = 250
          Width = 80
          Height = 13
          Caption = 'Data Inclusão'
        end
        object edtDataProposta: TCMDateTimePicker
          Left = 16
          Top = 24
          Width = 105
          Height = 21
          CalendarAttributes.Font.Charset = DEFAULT_CHARSET
          CalendarAttributes.Font.Color = clWindowText
          CalendarAttributes.Font.Height = -11
          CalendarAttributes.Font.Name = 'MS Sans Serif'
          CalendarAttributes.Font.Style = []
          ButtonStyle = cbsCustom
          DataField = 'PRODATA'
          DataSource = ds
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
        object DBedtNomeProposta: TDBEdit
          Left = 16
          Top = 72
          Width = 505
          Height = 21
          DataField = 'PRONOME'
          DataSource = ds
          TabOrder = 1
        end
        object DBcboTipoImovel: TwwDBLookupCombo
          Left = 16
          Top = 112
          Width = 249
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'DESCTIPOIMOVEL'#9'38'#9'Tipo do Imóvel')
          DataField = 'CODTIPIMOVEL'
          DataSource = ds
          LookupTable = dtmLookImobiliario.qryLookTipoImovel
          LookupField = 'CODTIPIMOVEL'
          Style = csDropDownList
          DropDownWidth = 8
          TabOrder = 3
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = True
        end
        object DBedtApresentada: TDBEdit
          Left = 280
          Top = 112
          Width = 393
          Height = 21
          DataField = 'PROAPRESENTADA'
          DataSource = ds
          TabOrder = 4
        end
        object DBedtNumeroProposta: TDBEdit
          Left = 536
          Top = 72
          Width = 137
          Height = 21
          DataField = 'PRONUMERO'
          DataSource = ds
          TabOrder = 2
        end
        object DBedtProponente: TDBEdit
          Left = 16
          Top = 168
          Width = 633
          Height = 21
          DataField = 'RS_PROPONENTE'
          DataSource = ds
          Enabled = False
          TabOrder = 5
        end
        object btnBuscaProponente: TBitBtn
          Left = 648
          Top = 168
          Width = 24
          Height = 22
          Hint = 'Busca um Proponente'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 6
          OnClick = btnBuscaProponenteClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
            777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
            77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
            77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
            077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
            FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
            F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
            7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
            777777787FFF8777777777770000777777777777888877777777}
          NumGlyphs = 2
        end
        object DBedtProprietario: TDBEdit
          Left = 16
          Top = 208
          Width = 609
          Height = 21
          DataField = 'RS_PROPRIETARIO'
          DataSource = ds
          Enabled = False
          TabOrder = 7
        end
        object btnBuscaProprietario: TBitBtn
          Left = 624
          Top = 208
          Width = 24
          Height = 22
          Hint = 'Busca um Proponente'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 8
          OnClick = btnBuscaProprietarioClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            80000080000000808000800000008000800080800000C0C0C000808080000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00777777777887
            777777777777F88F7777777777700F077777777777F8878F77777777700FFF07
            77777777F8877787F77777700FFFFFF077777778877777F8F7777778FFFFFCF0
            77777F78F77FF8787F771778FFCCCFFF07778FF87F88877F8F7711778FFFFFCF
            077788FF8F77FF8787F711178FFCCCFFF077888F8FF88877F87F71110000FFFC
            FF07788888887FF877877710E7E706CFFFF077887777888777F8770E7E7E70FF
            F887778F777778F7F8877707E7E7E0F88777778F777778F88777770E7E7E7087
            7777778F7777788777777707E7E7E07777777787F7777877777777707E7E0777
            777777787FFF8777777777770000777777777777888877777777}
          NumGlyphs = 2
        end
        object btnLimpaProprietario: TBitBtn
          Left = 648
          Top = 208
          Width = 23
          Height = 22
          Hint = 'Limpa a seleção de Proprietário'
          ParentShowHint = False
          ShowHint = True
          TabOrder = 9
          OnClick = btnLimpaProprietarioClick
          Glyph.Data = {
            76010000424D7601000000000000760000002800000020000000100000000100
            0400000000000001000000000000000000001000000010000000000000000000
            8000008000000080800080000000800080008080000080808000C0C0C0000000
            FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
            88888888888FF8888888888888008888888888888F77F8888888888800F08888
            8888888F7787F88888888800FFF0888888888F7788878F88888800FFFFFF0888
            88887788888F788888887FFFFFCF888888887F88FF7888FF88887FFCCCF88008
            888878F777888778F88887FFFF880110888887F88F8878878F8887FFC8809991
            0888878F7887F88878F8887FF88099991088887F88878F88878F887FF8880999
            03088878F88878F878788887F8888090B03088878F888787878788887888880B
            0B038888788888787878888888888880B0B38888888888878788888888888888
            0BBB88888888888878F888888888888880BB8888888888888788}
          NumGlyphs = 2
        end
        object DBedtLoginUsu: TDBEdit
          Left = 16
          Top = 264
          Width = 169
          Height = 21
          DataField = 'NOMEUSUARIO'
          DataSource = ds
          Enabled = False
          TabOrder = 10
        end
        object DBedtDataInclusao: TDBEdit
          Left = 592
          Top = 264
          Width = 81
          Height = 21
          DataField = 'PRODATAINCLUSAO'
          DataSource = ds
          Enabled = False
          TabOrder = 12
        end
        object DBedtNomeUsu: TDBEdit
          Left = 184
          Top = 264
          Width = 393
          Height = 21
          DataField = 'NF_USUARIO'
          DataSource = ds
          Enabled = False
          TabOrder = 11
        end
      end
      object tbsDescricao: TTabSheet
        Caption = 'Descrição'
        object DBmemDescricao: TDBMemo
          Left = 0
          Top = 25
          Width = 694
          Height = 287
          Align = alClient
          DataField = 'PRODESCRICAO'
          DataSource = ds
          MaxLength = 1750
          ScrollBars = ssVertical
          TabOrder = 0
        end
        object Panel4: TPanel
          Left = 0
          Top = 0
          Width = 694
          Height = 25
          Align = alTop
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Descrição Resumida'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
      end
      object tbsCondicoes: TTabSheet
        Caption = 'Valor / Condições'
        object Label3: TLabel
          Left = 16
          Top = 10
          Width = 53
          Height = 13
          Caption = 'Valor OM'
        end
        object Moeda: TLabel
          Left = 184
          Top = 10
          Width = 39
          Height = 13
          Caption = 'Moeda'
        end
        object Label5: TLabel
          Left = 312
          Top = 10
          Width = 102
          Height = 13
          Caption = 'Valor da Proposta'
        end
        object Label4: TLabel
          Left = 472
          Top = 10
          Width = 92
          Height = 13
          Caption = 'T.I.R. Projetada'
        end
        object Label6: TLabel
          Left = 584
          Top = 10
          Width = 50
          Height = 13
          Caption = 'Payback'
        end
        object Label7: TLabel
          Left = 637
          Top = 27
          Width = 36
          Height = 13
          Caption = 'meses'
        end
        object Label8: TLabel
          Left = 556
          Top = 26
          Width = 14
          Height = 16
          Caption = '%'
          Font.Charset = DEFAULT_CHARSET
          Font.Color = clWindowText
          Font.Height = -13
          Font.Name = 'MS Sans Serif'
          Font.Style = [fsBold]
          ParentFont = False
        end
        object DBedtValorOM: TDBEdit
          Left = 16
          Top = 24
          Width = 145
          Height = 21
          DataField = 'PROVLROM'
          DataSource = ds
          TabOrder = 0
          OnExit = DBedtValorOMExit
        end
        object DBedtValor: TDBEdit
          Left = 312
          Top = 24
          Width = 145
          Height = 21
          DataField = 'PROVLR'
          DataSource = ds
          Enabled = False
          TabOrder = 2
        end
        object DBcboMoeda: TwwDBLookupCombo
          Left = 184
          Top = 24
          Width = 113
          Height = 21
          DropDownAlignment = taLeftJustify
          Selected.Strings = (
            'MOESIGLA'#9'6'#9'Moeda')
          DataField = 'MOECODIGO'
          DataSource = ds
          LookupTable = dtmLookImobiliario.qryLookMoeda
          LookupField = 'MOECODIGO'
          Style = csDropDownList
          DropDownWidth = 8
          TabOrder = 1
          AutoDropDown = True
          ShowButton = True
          AllowClearKey = False
          OnEnter = DBcboMoedaEnter
          OnExit = DBcboMoedaExit
        end
        object DBedtPayback: TDBEdit
          Left = 584
          Top = 24
          Width = 49
          Height = 21
          DataField = 'PROPAYBACK'
          DataSource = ds
          MaxLength = 3
          TabOrder = 4
        end
        object DBedtTIR: TDBEdit
          Left = 472
          Top = 24
          Width = 81
          Height = 21
          DataField = 'PROTIR'
          DataSource = ds
          MaxLength = 5
          TabOrder = 3
        end
        object DBmemCondicoes: TDBMemo
          Left = 16
          Top = 80
          Width = 657
          Height = 209
          DataField = 'PROCONDICOES'
          DataSource = ds
          MaxLength = 1750
          ScrollBars = ssVertical
          TabOrder = 5
        end
        object Panel2: TPanel
          Left = 16
          Top = 56
          Width = 657
          Height = 25
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Condições Negociais'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 6
        end
      end
      object tbsOutroDado: TTabSheet
        Caption = 'Dados Complementares'
        object DBgrd: TwwDBGrid
          Left = 0
          Top = 25
          Width = 694
          Height = 287
          Selected.Strings = (
            'ODODESCRICAO'#9'30'#9'Tipo de Dado Complementar'
            'ODPVALOR'#9'50'#9' ')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          Align = alClient
          DataSource = dsOutroDado
          KeyOptions = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
          ReadOnly = True
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          OnCalcCellColors = DBgrdCalcCellColors
          IndicatorColor = icBlack
          OnTopRowChanged = DBgrdTopRowChanged
        end
        object Panel1: TPanel
          Left = 0
          Top = 0
          Width = 694
          Height = 25
          Align = alTop
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Dados Complementares'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 1
        end
      end
      object tbsHistorico: TTabSheet
        Caption = 'Histórico'
        object Bevel1: TBevel
          Left = 16
          Top = 180
          Width = 657
          Height = 2
          Shape = bsTopLine
        end
        object Label14: TLabel
          Left = 16
          Top = 186
          Width = 58
          Height = 13
          Caption = 'Descrição'
        end
        object Label11: TLabel
          Left = 402
          Top = 156
          Width = 117
          Height = 13
          Caption = 'Status da Proposta: '
        end
        object DBgrdEventos: TwwDBGrid
          Left = 16
          Top = 32
          Width = 657
          Height = 113
          Selected.Strings = (
            'HIPDATA'#9'10'#9'Data'
            'HIPCABECALHO'#9'40'#9'Evento'
            'NOME_RESP'#9'40'#9'Responsável')
          IniAttributes.Delimiter = ';;'
          TitleColor = clBtnFace
          FixedCols = 0
          ShowHorzScrollBar = True
          DataSource = dsHistorico
          KeyOptions = []
          Options = [dgTitles, dgIndicator, dgColumnResize, dgColLines, dgRowLines, dgTabs, dgConfirmDelete, dgCancelOnExit, dgWordWrap, dgPerfectRowFit]
          ReadOnly = True
          TabOrder = 0
          TitleAlignment = taLeftJustify
          TitleFont.Charset = DEFAULT_CHARSET
          TitleFont.Color = clWindowText
          TitleFont.Height = -9
          TitleFont.Name = 'MS Sans Serif'
          TitleFont.Style = [fsBold]
          TitleLines = 1
          TitleButtons = False
          OnCalcCellColors = DBgrdEventosCalcCellColors
          IndicatorColor = icBlack
          OnTopRowChanged = DBgrdEventosTopRowChanged
        end
        object DBmemDescricaoHist: TDBMemo
          Left = 16
          Top = 200
          Width = 656
          Height = 89
          DataField = 'HIPDESCRICAO'
          DataSource = dsHistorico
          MaxLength = 1750
          ReadOnly = True
          ScrollBars = ssVertical
          TabOrder = 2
        end
        object DBcboStatus: TwwDBComboBox
          Left = 520
          Top = 152
          Width = 154
          Height = 21
          ShowButton = True
          Style = csDropDownList
          MapList = True
          AllowClearKey = False
          DataField = 'FLGSTATUS'
          DataSource = ds
          DropDownCount = 8
          ItemHeight = 0
          Items.Strings = (
            'Ativa'#9'A'
            'Inativa'#9'I')
          Sorted = False
          TabOrder = 1
          UnboundDataType = wwDefault
        end
        object Panel3: TPanel
          Left = 16
          Top = 8
          Width = 657
          Height = 25
          BevelInner = bvRaised
          BevelOuter = bvLowered
          Caption = 'Histórico'
          Color = clNavy
          Font.Charset = ANSI_CHARSET
          Font.Color = clWhite
          Font.Height = -16
          Font.Name = 'Courier New'
          Font.Style = [fsBold]
          ParentFont = False
          TabOrder = 3
        end
      end
    end
  end
  inherited Dock972: TDock97
    Width = 706
    object lblStatus: TLabel [0]
      Left = 544
      Top = 4
      Width = 137
      Height = 24
      Alignment = taRightJustify
      Caption = 'Ativa / Inativa'
      Color = clBtnFace
      Font.Charset = ANSI_CHARSET
      Font.Color = clNavy
      Font.Height = -21
      Font.Name = 'Arial'
      Font.Style = [fsBold]
      ParentColor = False
      ParentFont = False
      Transparent = True
      Visible = False
    end
    inherited Toolbar971: TToolbar97
      inherited btnRefresh: TToolbarButton97
        Enabled = False
        Visible = False
      end
    end
  end
  inherited Dock971: TDock97
    Top = 379
    Width = 706
  end
  inherited qry: TwwQuery
    SQL.Strings = (
      'SELECT'
      '   P.IDPROPOSTA, P.IDEMPRESAPROP,'
      ''
      '   P.PRODATA, P.PRONUMERO, P.PRONOME,'
      '   P.IDRESPONSAVEL, P.IDPROPRIETARIOUH, P.IDPROPONENTE,'
      '   P.IDUSUARIO, PRODATAINCLUSAO,'
      '   P.MOECODIGO, P.CODTIPIMOVEL, P.PRODESCRICAO,'
      '   P.PROVLROM, P.PROVLR, P.PROTIR, P.PROPAYBACK,'
      '   P.PROCONDICOES, P.PROAPRESENTADA,'
      '   P.IDIMOVELMESTRE, P.IDIMOVEL, P.FLGSTATUS,'
      ''
      '   IM.IMONOME AS NOME_MESTRE, I.IMONOME AS NOME_IMOVEL,'
      ''
      
        '   PR.NOME AS NF_PROPRIETARIO, PR.RAZAOSOCIAL AS RS_PROPRIETARIO' +
        ','
      '   PN.NOME AS NF_PROPONENTE, PN.RAZAOSOCIAL AS RS_PROPONENTE,'
      '   PU.NOME AS NF_USUARIO, U.NOMEUSUARIO'
      ''
      'FROM'
      '   PESSOA PR, PESSOA PU, PESSOA PN,'
      '   PROPOSTANOVONEGOC P,'
      '   IMOVEL I, IMOVEL IM,'
      '   USUARIOSISTEMA U'
      ''
      'WHERE'
      '   ( P.IDPROPOSTA =:PIDPROPOSTA )'
      '   AND ( P.IDEMPRESAPROP =:PIDEMPRESAPROP )'
      '   AND ( P.IDIMOVELMESTRE = IM.IDIMOVEL(+) )'
      '   AND ( P.IDIMOVEL = I.IDIMOVEL(+) )'
      '   AND ( P.IDPROPRIETARIOUH = PR.IDPESSOA(+) )'
      '   AND ( P.IDPROPONENTE = PN.IDPESSOA(+) )'
      '   AND ( P.IDUSUARIO = U.IDUSUARIO(+) )'
      '   AND ( P.IDUSUARIO = PU.IDPESSOA(+) )')
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPROPOSTA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDEMPRESAPROP'
        ParamType = ptUnknown
      end>
    object qryIDPROPOSTA: TFloatField
      FieldName = 'IDPROPOSTA'
    end
    object qryIDEMPRESAPROP: TFloatField
      FieldName = 'IDEMPRESAPROP'
    end
    object qryIDRESPONSAVEL: TFloatField
      FieldName = 'IDRESPONSAVEL'
    end
    object qryIDPROPRIETARIOUH: TFloatField
      FieldName = 'IDPROPRIETARIOUH'
    end
    object qryCODTIPIMOVEL: TStringField
      FieldName = 'CODTIPIMOVEL'
      Size = 5
    end
    object qryMOECODIGO: TFloatField
      FieldName = 'MOECODIGO'
    end
    object qryPRODATA: TDateTimeField
      FieldName = 'PRODATA'
    end
    object qryPRONOME: TStringField
      FieldName = 'PRONOME'
      Size = 60
    end
    object qryPRODESCRICAO: TMemoField
      FieldName = 'PRODESCRICAO'
      BlobType = ftMemo
      Size = 2000
    end
    object qryPROVLROM: TFloatField
      FieldName = 'PROVLROM'
    end
    object qryPROVLR: TFloatField
      FieldName = 'PROVLR'
    end
    object qryPROTIR: TFloatField
      FieldName = 'PROTIR'
    end
    object qryPROPAYBACK: TFloatField
      FieldName = 'PROPAYBACK'
    end
    object qryPROCONDICOES: TMemoField
      FieldName = 'PROCONDICOES'
      BlobType = ftMemo
      Size = 2000
    end
    object qryPROAPRESENTADA: TStringField
      FieldName = 'PROAPRESENTADA'
      Size = 60
    end
    object qryPRONUMERO: TStringField
      FieldName = 'PRONUMERO'
    end
    object qryIDIMOVELMESTRE: TFloatField
      FieldName = 'IDIMOVELMESTRE'
    end
    object qryIDIMOVEL: TFloatField
      FieldName = 'IDIMOVEL'
    end
    object qryNOME_MESTRE: TStringField
      FieldName = 'NOME_MESTRE'
      Size = 60
    end
    object qryNOME_IMOVEL: TStringField
      FieldName = 'NOME_IMOVEL'
      Size = 60
    end
    object qryNF_PROPRIETARIO: TStringField
      FieldName = 'NF_PROPRIETARIO'
      Size = 60
    end
    object qryRS_PROPRIETARIO: TStringField
      FieldName = 'RS_PROPRIETARIO'
      Size = 60
    end
    object qryNF_USUARIO: TStringField
      FieldName = 'NF_USUARIO'
      Size = 60
    end
    object qryNOMEUSUARIO: TStringField
      FieldName = 'NOMEUSUARIO'
    end
    object qryPRODATAINCLUSAO: TDateTimeField
      FieldName = 'PRODATAINCLUSAO'
    end
    object qryIDUSUARIO: TFloatField
      FieldName = 'IDUSUARIO'
    end
    object qryNF_PROPONENTE: TStringField
      FieldName = 'NF_PROPONENTE'
      Size = 60
    end
    object qryRS_PROPONENTE: TStringField
      FieldName = 'RS_PROPONENTE'
      Size = 60
    end
    object qryIDPROPONENTE: TFloatField
      FieldName = 'IDPROPONENTE'
    end
    object qryFLGSTATUS: TStringField
      FieldName = 'FLGSTATUS'
      Size = 1
    end
  end
  inherited ivTradutor: TIvExtendedTranslator
    TargetsData = (
      1
      1
      (
        'TDBMemo'
        'Text'
        0))
  end
  inherited upd: TUpdateSQL
    ModifySQL.Strings = (
      'update PROPOSTANOVONEGOC'
      'set'
      '  IDEMPRESAPROP = :IDEMPRESAPROP,'
      '  PRODATA = :PRODATA,'
      '  PRONUMERO = :PRONUMERO,'
      '  PRONOME = :PRONOME,'
      '  IDRESPONSAVEL = :IDRESPONSAVEL,'
      '  IDPROPRIETARIOUH = :IDPROPRIETARIOUH,'
      '  IDPROPONENTE = :IDPROPONENTE,'
      '  IDUSUARIO = :IDUSUARIO,'
      '  PRODATAINCLUSAO = :PRODATAINCLUSAO,'
      '  MOECODIGO = :MOECODIGO,'
      '  CODTIPIMOVEL = :CODTIPIMOVEL,'
      '  PRODESCRICAO = :PRODESCRICAO,'
      '  PROVLROM = :PROVLROM,'
      '  PROVLR = :PROVLR,'
      '  PROTIR = :PROTIR,'
      '  PROPAYBACK = :PROPAYBACK,'
      '  PROCONDICOES = :PROCONDICOES,'
      '  PROAPRESENTADA = :PROAPRESENTADA,'
      '  IDIMOVELMESTRE = :IDIMOVELMESTRE,'
      '  IDIMOVEL = :IDIMOVEL,'
      '  FLGSTATUS = :FLGSTATUS'
      'where'
      '  IDPROPOSTA = :OLD_IDPROPOSTA')
    InsertSQL.Strings = (
      'insert into PROPOSTANOVONEGOC'
      
        '  (IDPROPOSTA, IDEMPRESAPROP, PRODATA, PRONUMERO, PRONOME, IDRES' +
        'PONSAVEL, '
      
        '   IDPROPRIETARIOUH, IDPROPONENTE, IDUSUARIO, PRODATAINCLUSAO, M' +
        'OECODIGO, '
      
        '   CODTIPIMOVEL, PRODESCRICAO, PROVLROM, PROVLR, PROTIR, PROPAYB' +
        'ACK, PROCONDICOES, '
      '   PROAPRESENTADA, IDIMOVELMESTRE, IDIMOVEL, FLGSTATUS)'
      'values'
      
        '  (:IDPROPOSTA, :IDEMPRESAPROP, :PRODATA, :PRONUMERO, :PRONOME, ' +
        ':IDRESPONSAVEL, '
      
        '   :IDPROPRIETARIOUH, :IDPROPONENTE, :IDUSUARIO, :PRODATAINCLUSA' +
        'O, :MOECODIGO, '
      
        '   :CODTIPIMOVEL, :PRODESCRICAO, :PROVLROM, :PROVLR, :PROTIR, :P' +
        'ROPAYBACK, '
      
        '   :PROCONDICOES, :PROAPRESENTADA, :IDIMOVELMESTRE, :IDIMOVEL, :' +
        'FLGSTATUS)')
    DeleteSQL.Strings = (
      'delete from PROPOSTANOVONEGOC'
      'where'
      '  IDPROPOSTA = :OLD_IDPROPOSTA')
  end
  inherited MontaSelect: TMontaSelect
    Left = 503
  end
  inherited CmeCadastro: TCmEventosCadastro
    OnFind = CmeCadastroFind
    Left = 398
    Top = 58
  end
  object qryOutroDado: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   OX.IDPROPOSTA, OX.IDOUTRODADO, OX.ODPVALOR,'
      '   O.ODODESCRICAO'
      'FROM'
      '   OUTRODADOXPROP OX, OUTRODADO O'
      'WHERE'
      '       ( OX.IDPROPOSTA =:PROPOSTA )'
      '   AND ( OX.IDOUTRODADO = O.IDOUTRODADO )'
      'ORDER BY'
      '   O.ODODESCRICAO')
    ValidateWithMask = True
    Left = 576
    Top = 36
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PROPOSTA'
        ParamType = ptUnknown
      end>
    object qryOutroDadoODODESCRICAO: TStringField
      DisplayLabel = 'Tipo de Dado Complementar'
      DisplayWidth = 30
      FieldName = 'ODODESCRICAO'
      Origin = '"CM.OUTRODADO".ODODESCRICAO'
      Size = 40
    end
    object qryOutroDadoODPVALOR: TStringField
      DisplayLabel = ' '
      DisplayWidth = 50
      FieldName = 'ODPVALOR'
      Origin = 'OUTRODADOXPROP.ODPVALOR'
      Size = 60
    end
    object qryOutroDadoIDPROPOSTA: TFloatField
      FieldName = 'IDPROPOSTA'
      Origin = 'OUTRODADOXPROP.IDPROPOSTA'
      Visible = False
    end
    object qryOutroDadoIDOUTRODADO: TFloatField
      FieldName = 'IDOUTRODADO'
      Origin = 'OUTRODADOXPROP.IDOUTRODADO'
      Visible = False
    end
  end
  object dsOutroDado: TwwDataSource
    DataSet = qryOutroDado
    Left = 576
    Top = 24
  end
  object qryHistorico: TwwQuery
    CachedUpdates = True
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT'
      '   H.IDPROPOSTA, H.IDHISTPROPOSTA, H.IDRESPONSAVEL,'
      '   H.HIPDATA, H.HIPCABECALHO, H.HIPDESCRICAO,'
      '   P.PRODATA,'
      '   PR.NOME AS NOME_RESP'
      'FROM'
      '   PESSOA PR, RESPONSAVEL R,'
      '   HISTPROPNOVONEGOC H, PROPOSTANOVONEGOC P'
      'WHERE'
      '       ( H.IDPROPOSTA =:PROPOSTA )'
      '   AND ( H.IDPROPOSTA = P.IDPROPOSTA )'
      '   AND ( H.IDRESPONSAVEL = R.IDRESPONSAVEL(+) )'
      '   AND ( R.IDRESPONSAVEL = PR.IDPESSOA(+) )'
      'ORDER BY'
      '   H.HIPDATA DESC')
    ValidateWithMask = True
    Left = 576
    Top = 12
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PROPOSTA'
        ParamType = ptUnknown
      end>
    object qryHistoricoHIPDATA: TDateTimeField
      DisplayLabel = 'Data'
      DisplayWidth = 10
      FieldName = 'HIPDATA'
    end
    object qryHistoricoHIPCABECALHO: TStringField
      DisplayLabel = 'Evento'
      DisplayWidth = 40
      FieldName = 'HIPCABECALHO'
      Size = 60
    end
    object qryHistoricoNOME_RESP: TStringField
      DisplayLabel = 'Responsável'
      DisplayWidth = 40
      FieldName = 'NOME_RESP'
      Size = 60
    end
    object qryHistoricoIDPROPOSTA: TFloatField
      FieldName = 'IDPROPOSTA'
      Visible = False
    end
    object qryHistoricoIDHISTPROPOSTA: TFloatField
      FieldName = 'IDHISTPROPOSTA'
      Visible = False
    end
    object qryHistoricoIDRESPONSAVEL: TFloatField
      FieldName = 'IDRESPONSAVEL'
      Visible = False
    end
    object qryHistoricoPRODATA: TDateTimeField
      FieldName = 'PRODATA'
      Visible = False
    end
    object qryHistoricoHIPDESCRICAO: TMemoField
      FieldName = 'HIPDESCRICAO'
      Visible = False
      BlobType = ftMemo
      Size = 2000
    end
  end
  object dsHistorico: TwwDataSource
    DataSet = qryHistorico
    Left = 576
  end
end
