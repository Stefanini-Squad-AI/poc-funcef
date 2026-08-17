inherited frmEstornaFolhaAluguel: TfrmEstornaFolhaAluguel
  Left = 80
  Top = 135
  HelpContext = 640025
  BorderStyle = bsSingle
  Caption = 'Desfazer Folha de Aluguéis'
  ClientHeight = 513
  ClientWidth = 846
  FormStyle = fsNormal
  Visible = False
  OnDestroy = FormDestroy
  PixelsPerInch = 96
  TextHeight = 13
  object pnlErro: TPanel [0]
    Left = 0
    Top = 57
    Width = 846
    Height = 374
    Align = alClient
    TabOrder = 4
    object memErro: TMemo
      Left = 1
      Top = 1
      Width = 844
      Height = 296
      Lines.Strings = (
        'memErro')
      PopupMenu = PopupMenu1
      TabOrder = 0
    end
  end
  inherited pnlFundo: TPanel
    Top = 57
    Width = 846
    Height = 374
    object rdgTipoAluguel: TRadioGroup
      Left = 464
      Top = 496
      Width = 217
      Height = 73
      Caption = ' Excluir: '
      Color = clActiveBorder
      ItemIndex = 0
      Items.Strings = (
        'Valor total do aluguel'
        'Apenas a parte fixa do aluguel'
        'Apenas o complemento')
      ParentColor = False
      TabOrder = 0
      Visible = False
    end
    object rgpOrigem: TRadioGroup
      Left = 16
      Top = 13
      Width = 232
      Height = 60
      Caption = ' Origem: '
      Color = clBtnFace
      ItemIndex = 0
      Items.Strings = (
        'Folha de Aluguel'
        'Lançamento em Lote')
      ParentColor = False
      TabOrder = 1
      OnClick = rgpOrigemClick
    end
    object grbCompetencia: TGroupBox
      Left = 255
      Top = 13
      Width = 580
      Height = 60
      Caption = ' Competência: '
      TabOrder = 2
      object Label15: TLabel
        Left = 29
        Top = 16
        Width = 184
        Height = 13
        Caption = 'Competência (mês/ano) - Início:'
      end
      object Label7: TLabel
        Left = 291
        Top = 16
        Width = 170
        Height = 13
        Caption = 'Competência (mês/ano) - Fim:'
      end
      object DBspnAno: TwwDBSpinEdit
        Left = 200
        Top = 30
        Width = 65
        Height = 21
        Increment = 1
        DataField = 'ANOCOMPETENCIA'
        TabOrder = 0
        UnboundDataType = wwDefault
      end
      object cboMes: TComboBox
        Left = 29
        Top = 30
        Width = 165
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
      object cboMesFim: TComboBox
        Left = 291
        Top = 30
        Width = 165
        Height = 21
        Style = csDropDownList
        ItemHeight = 13
        TabOrder = 2
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
      object DBspnAnoFim: TwwDBSpinEdit
        Left = 462
        Top = 30
        Width = 65
        Height = 21
        Increment = 1
        TabOrder = 3
        UnboundDataType = wwDefault
      end
      object btnLimpaCompetencia: TBitBtn
        Left = 527
        Top = 29
        Width = 24
        Height = 22
        Hint = 'Limpa a seleção da Competência Final'
        TabOrder = 4
        OnClick = btnLimpaCompetenciaClick
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
    end
    object grbGerais: TGroupBox
      Left = 16
      Top = 78
      Width = 819
      Height = 105
      Caption = ' Filtros Gerais: '
      TabOrder = 3
      object Label2: TLabel
        Left = 10
        Top = 19
        Width = 67
        Height = 13
        Caption = 'Nº Contrato'
      end
      object Label3: TLabel
        Left = 114
        Top = 19
        Width = 103
        Height = 13
        Caption = 'Nome do Contrato'
      end
      object Label1: TLabel
        Left = 11
        Top = 60
        Width = 84
        Height = 13
        Caption = 'Administradora'
      end
      object Label22: TLabel
        Left = 480
        Top = 60
        Width = 111
        Height = 13
        Caption = 'Forma de Cobrança'
      end
      object edtNumContrato: TEdit
        Left = 10
        Top = 32
        Width = 103
        Height = 21
        Enabled = False
        TabOrder = 0
      end
      object edtNomeContrato: TEdit
        Left = 114
        Top = 32
        Width = 311
        Height = 21
        Enabled = False
        TabOrder = 1
      end
      inline MolResponsavel1: TmolResponsavel
        Left = 472
        Top = 16
        Width = 334
        ParentBiDiMode = False
        TabOrder = 2
        inherited edtResponsavel: TEdit
          Width = 273
        end
        inherited btnBuscaResponsavel: TBitBtn
          Left = 281
        end
        inherited btnLimpaResponsavel: TBitBtn
          Left = 305
        end
        inherited btnAbrePessoa: TBitBtn
          Left = 144
          Visible = False
        end
      end
      object edtAdminImovel: TEdit
        Left = 10
        Top = 73
        Width = 415
        Height = 21
        Enabled = False
        TabOrder = 3
      end
      object btnBuscaAdminImovel: TBitBtn
        Left = 425
        Top = 72
        Width = 24
        Height = 22
        Hint = 'Busca uma Administradora'
        TabOrder = 4
        OnClick = btnBuscaAdminImovelClick
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
      object btnLimpaAdminImovel: TBitBtn
        Left = 449
        Top = 72
        Width = 24
        Height = 22
        Hint = 'Limpa a seleção de Administradora'
        TabOrder = 5
        OnClick = btnLimpaAdminImovelClick
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
      object DBcboPortadorForma: TwwDBLookupCombo
        Left = 480
        Top = 73
        Width = 321
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCRICAO'#9'50'#9'DESCRICAO')
        LookupTable = dtmLookImobiliario.qryLookPortadorForma
        LookupField = 'CODPORTFORMA'
        Style = csDropDownList
        DropDownWidth = 8
        TabOrder = 6
        AutoDropDown = False
        ShowButton = True
        UseTFields = False
        AllowClearKey = True
      end
      object btnBuscaContrato: TBitBtn
        Left = 425
        Top = 31
        Width = 24
        Height = 22
        Hint = 'Busca um Contrato'
        TabOrder = 7
        OnClick = btnBuscaContratoClick
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
      object btnLimpaContrato: TBitBtn
        Left = 449
        Top = 31
        Width = 24
        Height = 22
        Hint = 'Limpa Contrato selecionado'
        TabOrder = 8
        OnClick = btnLimpaContratoClick
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
    end
    object grbFiltroFolha: TGroupBox
      Left = 16
      Top = 186
      Width = 819
      Height = 78
      Caption = ' Filtros - Folha de Aluguel: '
      TabOrder = 4
      object Label5: TLabel
        Left = 268
        Top = 31
        Width = 108
        Height = 13
        Caption = 'Indice de Reajuste'
      end
      object Label9: TLabel
        Left = 645
        Top = 60
        Width = 120
        Height = 13
        Caption = 'Financeira / Contábil'
      end
      object grbTipoFolha: TGroupBox
        Left = 10
        Top = 20
        Width = 246
        Height = 46
        Caption = ' Tipo de Folha '
        TabOrder = 0
        object chkFolhaAluguel: TCheckBox
          Left = 13
          Top = 18
          Width = 65
          Height = 17
          Caption = 'Aluguel'
          Checked = True
          State = cbChecked
          TabOrder = 0
        end
        object chkFolhaConfissao: TCheckBox
          Left = 93
          Top = 18
          Width = 145
          Height = 17
          Caption = 'Confissão de Dívidas'
          Checked = True
          State = cbChecked
          TabOrder = 1
        end
      end
      object DBcboIndiceReajuste: TwwDBLookupCombo
        Left = 268
        Top = 45
        Width = 346
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'MOESIGLA'#9'10'#9'Sigla'#9'F'
          'MOEDESC'#9'20'#9'Descrição'#9'F')
        LookupTable = dtmLookImobiliario.qryLookMoeda
        LookupField = 'MOECODIGO'
        Style = csDropDownList
        DropDownWidth = 8
        TabOrder = 1
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = True
      end
      object chkApenasDesfazIntegracao: TCheckBox
        Left = 624
        Top = 43
        Width = 191
        Height = 17
        Caption = 'Desfazer APENAS integração'
        TabOrder = 2
      end
    end
    object grbFiltroLancLote: TGroupBox
      Left = 16
      Top = 268
      Width = 819
      Height = 102
      Caption = ' Filtros - Lançamentos em Lote: '
      TabOrder = 5
      object Label6: TLabel
        Left = 396
        Top = 15
        Width = 92
        Height = 13
        Caption = 'Tipo de Receita'
      end
      object Label8: TLabel
        Left = 10
        Top = 56
        Width = 101
        Height = 13
        Caption = 'Tipo de Indicador'
      end
      inline molImovelouMestre1: TmolImovelouMestre
        Left = 2
        Top = 13
        Height = 41
      end
      object dbcboTipoReceita: TwwDBLookupCombo
        Left = 396
        Top = 29
        Width = 346
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'DESCCUSTORECIMO'#9'35'#9'Tipo de Receita'#9'F')
        LookupTable = cdsTipoRec
        LookupField = 'IDTIPOCUSTORECIMO'
        Style = csDropDownList
        DropDownWidth = 8
        TabOrder = 1
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = True
      end
      object dbcboTipoIndicador: TwwDBLookupCombo
        Left = 10
        Top = 70
        Width = 368
        Height = 21
        DropDownAlignment = taLeftJustify
        Selected.Strings = (
          'INMDESCRICAO'#9'35'#9'Indicadores'#9'F')
        LookupTable = cdsIndicadores
        LookupField = 'IDINDICADORIMOVEL'
        Style = csDropDownList
        DropDownWidth = 8
        TabOrder = 2
        AutoDropDown = False
        ShowButton = True
        AllowClearKey = True
      end
    end
  end
  inherited Dock971: TDock97
    Top = 480
    Width = 846
    inherited tb97Fundo: TToolbar97
      Left = 555
      DockPos = 555
    end
    inherited TB97oKCancelar: TToolbar97
      Left = 219
      DockPos = 219
      inherited ToolbarSep971: TToolbarSep97
        Left = 131
      end
      inherited ToolbarSep974: TToolbarSep97
        Left = 297
        Visible = False
      end
      object ToolbarSep975: TToolbarSep97 [3]
        Left = 214
        Top = 0
        Blank = True
        SizeHorz = 2
        SizeVert = 1
      end
      inherited bbtnConfirmar: TBitBtn
        Width = 129
        Caption = '&Desfazer Folha'
        ModalResult = 0
        OnClick = bbtnConfirmarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000010000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888FFFFF8888888888000008888888888F777778FF888888009191900
          88888887788888778F88887991919191088888788888888878F8879919191919
          108887F888F888F887F887917F919F719088878887FF87FF878F7919FFF9FFF9
          19087F88777F7778887F79919FFFFF9191087F8887777788887F791919FFF919
          19087F8888777FF8887F79919FFFFF9191087F88877777FF887F7919FFF9FFF9
          190878F877787778887887917F919F71908887F88788878887F8879919191919
          1088878F88888888878888799191919108888878FF88888F7888888779999977
          8888888778FFFF77888888888777778888888888877777888888}
      end
      inherited bbtnCancelar: TBitBtn
        Left = 133
        Enabled = False
        Visible = False
        OnClick = bbtnCancelarClick
      end
      object bbtnVoltar: TBitBtn
        Left = 216
        Top = 0
        Width = 81
        Height = 27
        Caption = '&Voltar'
        Default = True
        Enabled = False
        TabOrder = 2
        OnClick = bbtnVoltarClick
        Glyph.Data = {
          76010000424D7601000000000000760000002800000020000000100000000100
          0400000000000001000000000000000000001000000000000000000000000000
          8000008000000080800080000000800080008080000080808000C0C0C0000000
          FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
          8888888888888888888888888000008888888888F777778FF88888800BBBBB00
          88888887788888778F88887BBBBBBBBB088888788888888878F887FBBBBBBBBB
          B08887F8888F888887F887FBBB0BBBBBB0888788887F888887887FBBB00BBBBB
          BB087F88877FFFFFF8787FBB00000000BB087F8877777777F8787FB000000000
          BB087F8777777777F8787FBB00000000BB087F887777777788787FBBB00BBBBB
          BB0878F8877F8888887887FBBB0BBBBBB08887F88878888887F887FBBBBBBBBB
          B088878F888888888788887FFBBBBBBB08888878FF88888F788888877FFFFF77
          8888888778FFFF77888888888777778888888888877777888888}
        NumGlyphs = 2
      end
    end
  end
  object Panel1: TPanel
    Left = 0
    Top = 431
    Width = 846
    Height = 49
    Align = alBottom
    TabOrder = 2
    object lblContador: TLabel
      Left = 735
      Top = 8
      Width = 93
      Height = 13
      Alignment = taRightJustify
      Caption = '00000 de 00000'
      Visible = False
    end
    object lblProgress: TLabel
      Left = 18
      Top = 8
      Width = 159
      Height = 13
      Caption = 'Desfazendo Lançamentos...'
      Visible = False
    end
    object ProgressBar: TProgressBar
      Left = 18
      Top = 24
      Width = 809
      Height = 16
      Min = 0
      Max = 100
      Step = 1
      TabOrder = 0
      Visible = False
    end
  end
  object Panel3: TPanel
    Left = 0
    Top = 0
    Width = 846
    Height = 57
    Align = alTop
    TabOrder = 3
    object Label13: TLabel
      Left = 24
      Top = 16
      Width = 59
      Height = 13
      Caption = 'ATENÇÃO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold, fsUnderline]
      ParentFont = False
      WordWrap = True
    end
    object lbl_Informacao: TLabel
      Left = 84
      Top = 16
      Width = 613
      Height = 13
      AutoSize = False
      Caption = 
        ':  Este procedimento irá EXCLUIR todos os lançamentos de uma Fol' +
        'ha de Aluguéis, integrados ou não, '
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
    object Label4: TLabel
      Left = 84
      Top = 32
      Width = 600
      Height = 13
      Caption = 
        '   de acordo com os critérios indicados abaixo. No entando, lanç' +
        'amentos já baixados não serão afetados.'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clBlue
      Font.Height = -11
      Font.Name = 'MS Sans Serif'
      Font.Style = [fsBold]
      ParentFont = False
    end
  end
  object PopupMenu1: TPopupMenu
    Left = 216
    Top = 65
    object Voltar1: TMenuItem
      Caption = 'Voltar'
      OnClick = Voltar1Click
    end
  end
  object qryFolhas: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      
        'SELECT DISTINCT VW.CONTRATO_EXTENSO, VW.IDDOCUMENTO,  VW.CODDOCU' +
        'MENTO, VW.PLNCODIGO,'
      
        '                VW.DATALANCAMENTO,   VW.FLGINTEGRADO, VW.STATUS_' +
        'DOC'
      'FROM VWLANCAMENTO VW, INDICADORXAPUR I'
      'WHERE VW.IDDOCUMENTO = I.IDDOCUMENTO(+)'
      ''
      '  AND ( VW.IDPESSOA = :PIDPESSOA )'
      '  AND ( VW.FLGTIPOCONTRATO = '#39'L'#39' )'
      ''
      
        '  AND ( (:PMESCOMPETENCIA IS NULL) OR (VW.MESCOMPETENCIA = :PMES' +
        'COMPETENCIA) )'
      
        '  AND ( (:PANOCOMPETENCIA IS NULL) OR (VW.ANOCOMPETENCIA = :PANO' +
        'COMPETENCIA) )'
      ''
      
        '  AND ( (:PANOMESINI IS NULL) OR ( (TO_CHAR(VW.ANOCOMPETENCIA) |' +
        '| TO_CHAR(VW.MESCOMPETENCIA)) >= :PANOMESINI ) )'
      
        '  AND ( (:PANOMESFIM IS NULL) OR ( (TO_CHAR(VW.ANOCOMPETENCIA) |' +
        '| TO_CHAR(VW.MESCOMPETENCIA)) <= :PANOMESFIM ) )'
      ''
      
        '  AND ( (:PCODPORTFORMA     IS NULL) OR (VW.CODPORTFORMA      = ' +
        ':PCODPORTFORMA)     )'
      
        '  AND ( (:PINDICEREAJUSTE   IS NULL) OR (VW.CONINDICEREAJUSTE = ' +
        ':PINDICEREAJUSTE)   )'
      
        '  AND ( (:PIDRESPONSAVEL    IS NULL) OR (VW.IDRESPONSAVEL     = ' +
        ':PIDRESPONSAVEL)    )'
      
        '  AND ( (:PADMIN_CONTRATO   IS NULL) OR (VW.ADMIN_CONTRATO    = ' +
        ':PADMIN_CONTRATO)   )'
      
        '  AND ( (:PIDCONTRATOIMOVEL IS NULL) OR (VW.IDCONTRATOIMOVEL  = ' +
        ':PIDCONTRATOIMOVEL) )'
      ''
      '  AND ( (VW.FLGORIGEMLANC = :PFLGORIGEMLANC) )'
      
        '  AND ( (:PIDIMOVEL          IS NULL) OR (VW.IDIMOVEL          =' +
        ' :PIDIMOVEL)          )'
      
        '  AND ( (:PIDTIPOCUSTORECIMO IS NULL) OR (VW.IDTIPOCUSTORECIMO =' +
        ' :PIDTIPOCUSTORECIMO) )'
      
        '  AND ( (:PIDINDICADORIMOVEL IS NULL) OR (I.IDINDICADORIMOVEL  =' +
        ' :PIDINDICADORIMOVEL) )'
      ''
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 256
    Top = 121
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PMESCOMPETENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PMESCOMPETENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PANOCOMPETENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PANOCOMPETENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PANOMESINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PANOMESINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PANOMESFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PANOMESFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PCODPORTFORMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PCODPORTFORMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PINDICEREAJUSTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PINDICEREAJUSTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDRESPONSAVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDRESPONSAVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PADMIN_CONTRATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PADMIN_CONTRATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PFLGORIGEMLANC'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCUSTORECIMO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDTIPOCUSTORECIMO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDINDICADORIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDINDICADORIMOVEL'
        ParamType = ptUnknown
      end>
    object qryFolhasCONTRATO_EXTENSO: TStringField
      FieldName = 'CONTRATO_EXTENSO'
      Origin = 'BASEDADOS.VWLANCAMENTO.CONTRATO_EXTENSO'
      Size = 83
    end
    object qryFolhasIDDOCUMENTO: TFloatField
      FieldName = 'IDDOCUMENTO'
      Origin = 'BASEDADOS.VWLANCAMENTO.IDDOCUMENTO'
    end
    object qryFolhasPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
      Origin = 'BASEDADOS.VWLANCAMENTO.PLNCODIGO'
    end
    object qryFolhasDATALANCAMENTO: TDateTimeField
      FieldName = 'DATALANCAMENTO'
      Origin = 'BASEDADOS.VWLANCAMENTO.DATALANCAMENTO'
    end
    object qryFolhasFLGINTEGRADO: TFloatField
      FieldName = 'FLGINTEGRADO'
      Origin = 'BASEDADOS.VWLANCAMENTO.FLGINTEGRADO'
    end
    object qryFolhasSTATUS_DOC: TStringField
      FieldName = 'STATUS_DOC'
      Origin = 'BASEDADOS.VWLANCAMENTO.STATUS_DOC'
      Size = 1
    end
    object qryFolhasCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
      Origin = 'BASEDADOS.VWLANCAMENTO.CODDOCUMENTO'
    end
  end
  object qryConfissao: TwwQuery
    DatabaseName = 'BaseDados'
    SQL.Strings = (
      'SELECT DISTINCT'
      '   CONTRATO_EXTENSO,'
      '   IDDOCUMENTO,'
      '   CODDOCUMENTO,'
      '   PLNCODIGO,'
      '   DATALANCAMENTO,'
      '   FLGINTEGRADO,'
      '   STATUS_DOC,'
      '   IDCONTRATOIMOVEL'
      'FROM'
      '   VWLANCAMENTO'
      'WHERE'
      '   ( IDPESSOA =:PIDPESSOA )'
      '   AND ( FLGTIPOCONTRATO = '#39'D'#39' )'
      '   AND ( FLGORIGEMLANC = '#39'F'#39' )'
      
        '   AND ( (:PMESCOMPETENCIA IS NULL) OR (MESCOMPETENCIA =:PMESCOM' +
        'PETENCIA) )'
      
        '   AND ( (:PANOCOMPETENCIA IS NULL) OR (ANOCOMPETENCIA =:PANOCOM' +
        'PETENCIA) )'
      ''
      
        '   AND ( (:PANOMESINI IS NULL) OR ( (TO_CHAR(ANOCOMPETENCIA) || ' +
        'TO_CHAR(MESCOMPETENCIA)) >= :PANOMESINI ) )'
      
        '   AND ( (:PANOMESFIM IS NULL) OR ( (TO_CHAR(ANOCOMPETENCIA) || ' +
        'TO_CHAR(MESCOMPETENCIA)) <= :PANOMESFIM ) )'
      ''
      
        '   AND ( (:PCODPORTFORMA IS NULL) OR (CODPORTFORMA =:PCODPORTFOR' +
        'MA) )'
      
        '   AND ( (:PINDICEREAJUSTE IS NULL) OR (CONINDICEREAJUSTE =:PIND' +
        'ICEREAJUSTE) )'
      
        '   AND ( (:PIDRESPONSAVEL IS NULL) OR (IDRESPONSAVEL =:PIDRESPON' +
        'SAVEL) )'
      
        '   AND ( (:PADMIN_CONTRATO IS NULL) OR (ADMIN_CONTRATO =:PADMIN_' +
        'CONTRATO) )'
      
        '   AND ( (:PIDCONTRATOIMOVEL IS NULL) OR (IDCONTRATOIMOVEL =:PID' +
        'CONTRATOIMOVEL) )'
      ''
      ''
      ' '
      ' '
      ' '
      ' '
      ' ')
    ValidateWithMask = True
    Left = 320
    Top = 121
    ParamData = <
      item
        DataType = ftInteger
        Name = 'PIDPESSOA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PMESCOMPETENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PMESCOMPETENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PANOCOMPETENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PANOCOMPETENCIA'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PANOMESINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PANOMESINI'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PANOMESFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftString
        Name = 'PANOMESFIM'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PCODPORTFORMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PCODPORTFORMA'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PINDICEREAJUSTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PINDICEREAJUSTE'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDRESPONSAVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDRESPONSAVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PADMIN_CONTRATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PADMIN_CONTRATO'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end
      item
        DataType = ftInteger
        Name = 'PIDCONTRATOIMOVEL'
        ParamType = ptUnknown
      end>
    object qryConfissaoCONTRATO_EXTENSO: TStringField
      FieldName = 'CONTRATO_EXTENSO'
      Size = 83
    end
    object qryConfissaoIDDOCUMENTO: TFloatField
      FieldName = 'IDDOCUMENTO'
    end
    object qryConfissaoCODDOCUMENTO: TFloatField
      FieldName = 'CODDOCUMENTO'
    end
    object qryConfissaoPLNCODIGO: TFloatField
      FieldName = 'PLNCODIGO'
    end
    object qryConfissaoDATALANCAMENTO: TDateTimeField
      FieldName = 'DATALANCAMENTO'
    end
    object qryConfissaoFLGINTEGRADO: TFloatField
      FieldName = 'FLGINTEGRADO'
    end
    object qryConfissaoSTATUS_DOC: TStringField
      FieldName = 'STATUS_DOC'
      Size = 1
    end
    object qryConfissaoIDCONTRATOIMOVEL: TFloatField
      FieldName = 'IDCONTRATOIMOVEL'
    end
  end
  object cdsHistMovImob: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 776
    Top = 257
  end
  object cdsTipoRec: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 764
    Top = 354
    object cdsTipoRecDESCCUSTORECIMO: TStringField
      DisplayLabel = 'Tipo de Receita'
      DisplayWidth = 35
      FieldName = 'DESCCUSTORECIMO'
      Size = 60
    end
    object cdsTipoRecIDTIPOCUSTORECIMO: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPOCUSTORECIMO'
      Visible = False
    end
    object cdsTipoRecRECCUSTO: TStringField
      DisplayWidth = 1
      FieldName = 'RECCUSTO'
      Visible = False
      FixedChar = True
      Size = 1
    end
    object cdsTipoRecCODTIPDOC: TFloatField
      DisplayWidth = 10
      FieldName = 'CODTIPDOC'
      Visible = False
    end
    object cdsTipoRecFLGOBRIGAORC: TFloatField
      DisplayWidth = 10
      FieldName = 'FLGOBRIGAORC'
      Visible = False
    end
    object cdsTipoRecIDTIPODESPESA: TFloatField
      DisplayWidth = 10
      FieldName = 'IDTIPODESPESA'
      Visible = False
    end
    object cdsTipoRecFLGDIARIO: TStringField
      DisplayWidth = 1
      FieldName = 'FLGDIARIO'
      Visible = False
      FixedChar = True
      Size = 1
    end
  end
  object dsTipoRec: TwwDataSource
    AutoEdit = False
    DataSet = cdsTipoRec
    Left = 775
    Top = 362
  end
  object sqlTipoRec: TCMSqlParams
    SQL.Strings = (
      'SELECT IDTIPOCUSTORECIMO, DESCCUSTORECIMO, RECCUSTO, CODTIPDOC,'
      '       FLGOBRIGAORC,      IDTIPODESPESA,   FLGDIARIO'
      'FROM TIPOCUSTORECIMOV'
      'WHERE RECCUSTO = '#39'R'#39
      '  AND IDMODULO = 64'
      'ORDER BY DESCCUSTORECIMO')
    ClientDataSet = cdsTipoRec
    Left = 786
    Top = 372
  end
  object cdsIndicadores: TCMClientDataSet
    Aggregates = <>
    Params = <>
    Left = 400
    Top = 395
    object cdsIndicadoresINMDESCRICAO: TStringField
      DisplayLabel = 'Indicadores'
      DisplayWidth = 35
      FieldName = 'INMDESCRICAO'
      Size = 60
    end
    object cdsIndicadoresIDINDICADORIMOVEL: TFloatField
      DisplayWidth = 10
      FieldName = 'IDINDICADORIMOVEL'
      Visible = False
    end
  end
  object dsIndicadores: TwwDataSource
    AutoEdit = False
    DataSet = cdsIndicadores
    Left = 411
    Top = 403
  end
  object sqlIndicadores: TCMSqlParams
    SQL.Strings = (
      'SELECT IDINDICADORIMOVEL, INMDESCRICAO'
      'FROM INDICADORIMOVEL'
      'WHERE FLGTIPOVALOR = '#39'M'#39
      '  AND RECPAG       = '#39'R'#39)
    ClientDataSet = cdsIndicadores
    Left = 422
    Top = 413
  end
end
